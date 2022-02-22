Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354524C0383
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A623810E664;
	Tue, 22 Feb 2022 21:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EE010E664
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:07:51 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso10570190otp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=yTWyYubMR//Jgsba7P9C6e+8BGed7UAn8IRrcIATL28=;
 b=EM/gc7DZswlv9F7GcnoSAd+qWrEWCPCbdyvy1Py5xUaiPWiOKdwoetuoclsEBcoOLE
 i03D1Td1H5ewCy/8qce7cWHqo5h6HT2N4cJgr/39jzBveFcGQTJjP6grkpTWdlIwu83u
 zzQQKVyA4t31l4fZoOGzkbxEUJhNBlJKTM0Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=yTWyYubMR//Jgsba7P9C6e+8BGed7UAn8IRrcIATL28=;
 b=FsaRqQMGb0izxLUAVImDTOH7c0qz7VN7DWEgSZSFMVQ+QBhe1l/ix41dIhw+5UbB9C
 1jHCzbHHhsocS0z0UcjgIZjs/EXdSZ4/dP0zmDA9I02GKfhllUnXyhGoYMEPcHBBgoI1
 vhfWwOn9GtODq3tipJ7wCMQgX5Hiz/+H3j/tYH7+2s4XHGiHMX2EtryceVcXOKEFMgSW
 ky214y87MfF8c2Y11mJEldO+GDeJq7baJy3vkMviQFBToZaXLCqd2NHzK49mZD3a7cOL
 KbBz+AZdryC5uo3v6SX3GmCsyMhzptYQyg8digTJXKrAsdBGhH1tyx45nk98z6tEmcCM
 Wwnw==
X-Gm-Message-State: AOAM533R7deXa8EbUN44xVtirm/Y5VqHNEVMIE75U+expgmUD+70i/8o
 neJ7FyD8lnLUfahHPQB0B0yrLnZd09tBt8stpVIwdQ==
X-Google-Smtp-Source: ABdhPJxpUMNXg0CVkf4Zqe1XypjicGyou6NwnzAMp7S4QlSBTuMZu+qAWALcLW1hZMEP0IgnlZifMNj5zQNSwhz5f5U=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr8930738otl.77.1645564070331; Tue, 22 Feb
 2022 13:07:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Feb 2022 21:07:49 +0000
MIME-Version: 1.0
In-Reply-To: <20220221073339.10742-1-jose.exposito89@gmail.com>
References: <20220221073339.10742-1-jose.exposito89@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Feb 2022 21:07:49 +0000
Message-ID: <CAE-0n50cW4-xzabNjb0mHLCgUYj+Mcp3_XxYrYf9AVuZO_9qKg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: switch to devm_drm_of_get_bridge
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, maxime@cerno.tech,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jos=C3=A9 Exp=C3=B3sito (2022-02-20 23:33:39)
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
>
> Switch to the new function and reduce boilerplate.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Dmitry is rewriting this code in a larger series. This patch is
superseded by that work.
