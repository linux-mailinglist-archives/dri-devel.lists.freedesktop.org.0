Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708644B9139
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FAB10E484;
	Wed, 16 Feb 2022 19:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BE510E484
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:32:52 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so3663439oor.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2WrcofDXNq4fQvSh+Kgl5hWSou8+2EddXrcFZuX0Coc=;
 b=RQVD6Spf4AVQMUKOvOtdRaF6z6yGnhjSw8BOFMzXDxDLTsIV7N90lSsRuK7rkB89zP
 nWfOiGR4LbcGTUwut8aVKi2UOfIKbHGA0/KjIHo602H/Yfh6a6jQwRADuwfaxyxeWTtW
 H5l6f/e8+KGiQ8AvZ5yO3THM3fAuwp1xg9Vws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2WrcofDXNq4fQvSh+Kgl5hWSou8+2EddXrcFZuX0Coc=;
 b=E8PTIYjdsiGrUThN/87WKbYKPOs7/fyIgJdv1Ep2dI9hWSGYasF5QihE2+/MbH4vlr
 nkx3McTF3JGRy78G1WMo5yQY9OcvHklV7zP81YLGnDOC0vIKgK0kGIBcM3mgjz6jjntl
 mrKchkwMXeRy8xh0HuZQ3NbVIZPJx6DkUlpF/P42t6bohtSJF5dBBIYVKqMbmxRq2UaN
 lkEWyGVVmSMMTKA0dAacdfY++xdWdJsmioYjfBNCCMh9fQXxlmI5SW0GN/Xy786bLcM3
 +YYjmFpWIKzjBaOy3Tw8LWfGgnntW6I5ZJ1g/Xt/tkAcWFvTD8Kv5ove1DWboSWVsx+9
 mWFA==
X-Gm-Message-State: AOAM530/4lFCsHjMMS+05jrta0wwVGkFZND4KOmfh43lnthGtMgwNDbb
 EZ1kjY5vsJzxkONYTHX7bGp6AsSf149bL5m0lNxj4Q==
X-Google-Smtp-Source: ABdhPJx3zyPVZHUH69iPnA4f7fxjaXMj27nLEaHyAfo/3Oh4oEDYw/v72mxHVfbQirS6DyQb4puuq4DHvHwI5ooAV3c=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr1130229oap.54.1645039971470; Wed, 16
 Feb 2022 11:32:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 11:32:50 -0800
MIME-Version: 1.0
In-Reply-To: <1643066274-25814-1-git-send-email-quic_khsieh@quicinc.com>
References: <1643066274-25814-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 16 Feb 2022 11:32:50 -0800
Message-ID: <CAE-0n52uYJ-E2HZnwjJL5VfXnVjiSGJ5MnZG827i=3NP7QNm1g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: always add fail-safe mode into connector
 mode list
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-24 15:17:54)
> Some of DP link compliant test expects to return fail-safe mode
> if prefer detailed timing mode can not be supported by mainlink's
> lane and rate after link training. Therefore add fail-safe mode
> into connector mode list as backup mode. This patch fixes test
> case 4.2.2.1.
>
> Changes in v2:
> -- add Fixes text string
>
> Fixes: 4b85d405cfe9 ( "drm/msm/dp: reduce link rate if failed at link training 1")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
