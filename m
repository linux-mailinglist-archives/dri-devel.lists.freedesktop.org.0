Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB23C1AC0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 22:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCC96E99A;
	Thu,  8 Jul 2021 20:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005486E99C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 20:56:59 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id n9so5950610qtk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=txIBa7izt4FT4BE1+BkMaR3RCAXYErSxPttMfK5CXlI=;
 b=faOfPE42FMx2/m3f1QlT02pCHNK9sLreFKyjuOGb3tFGZWwE2u9n8c/m01lIAh4ZOK
 EnmFa0gKFLxLThifMO9hhFhEQ4otXF6Oz60t2oagtPcqwMmWE6MpBNGY7PQqbM+PnszO
 57ZF/9M4sfs2AV0fc381Kc/3WufCncVrAupIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=txIBa7izt4FT4BE1+BkMaR3RCAXYErSxPttMfK5CXlI=;
 b=D9TgcZ+t/U5F/BXskBzYVGTlvziZkXrbb2Lakn1J0KRP5p/NcDGE/uSbq3d2yB7Iia
 P3btZNjN59U/1brIzXlb1V9TddOmwqNSNZ1wlvNRjr2IyC5Ae0JANxQYd55/QCulXU4H
 m0vlSuGnmGxU0DO8chf2ERYSHLiudNAqQLnaIN2XuIm5P5sAU0t71XivPR6DCEVTEBHl
 VHY44uldPR8Pm0UubNcW/mY8Q0TWJN8kNPljwDqHQ97iRDpQJIglFATUCa0nmeQegT7L
 Yi+sPOtaAWu7wPe4MvtUJMyKsFvlVdIHZ6w+/TnY2qS4rdDRqFHNiugWu5b5yh/AkaSE
 ArMw==
X-Gm-Message-State: AOAM530+66qaqPwTCj0+ZiG2/UhVdaCr7kfYyVJDts66X0B+VqnZDzJ0
 OMj0P9tJXTJeJ2GHMKh2GMy5UrlQ3g9mMMX+8GOFBA==
X-Google-Smtp-Source: ABdhPJy01WzZkz2fmE/A+D4JFf/YjrN+FkodfFEoNH/4qM6i1zp4YmjJ7cZ+I4HUiGMQweSEOpnYAwyEvPRnI/WHXdM=
X-Received: by 2002:a05:622a:1051:: with SMTP id
 f17mr30357847qte.226.1625777819121; 
 Thu, 08 Jul 2021 13:56:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 13:56:58 -0700
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 8 Jul 2021 13:56:58 -0700
Message-ID: <CAE-0n53EtG=Kd-i+q-Yg-GNNAkXwPnOOgFE_zG249OH5=i-f6w@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dp: replug event is converted into an unplug
 followed by an plug events
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-06 10:20:17)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

This needs a Fixes tag of some kind.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
