Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C3543E6EB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 19:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AAC6E09C;
	Thu, 28 Oct 2021 17:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493B56E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 17:13:10 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id np13so5193004pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihNITYXch0CmhgbMtbhS2pI0TvQrTLYx98YvdI9FUVc=;
 b=EdL6MUJNz7MbBAaLavfbV5N4ZZpnR6wLJt0KyNLegxJSKL6KajXtDynIFp45Q2x0UG
 OG7wxB6NS2WW4JEgkSrJ2EcVuUfTcq9TigvYBYjAkKb1BUF+Np2Ky0fTtgGI+2PmkFDU
 xAjW3XNBMzDFjFkARbe7bjIYLxn9lCXVqxWCMHQOVt71aFLKzefyfbR8PIj6s/2t9D0g
 Y8asy+pzOssVRM4F9w4Yz1gAdH8ZpAEajCsQRwSmSEVsICjwSwxzrBzvN8LHbOqDGErS
 180Vn8bdzYoqr8a4kYqX3d1UAcmMyhG4xmRZnf/mq9QM8WA74iKxPzFF1ZHaP0AlyX3i
 wXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihNITYXch0CmhgbMtbhS2pI0TvQrTLYx98YvdI9FUVc=;
 b=bmUsUO+iSXMJLh5EcLqnS/yAFFO2sal/686qQTs7Y1m5wA5ip0/IiR/FPtucRWnWOR
 hvQTVfdocl0NOu5jYFo0uta0I3M3R8qrACHRK5WNMoFS7lBQwk2ElcUSKoGX++SKUSYO
 0u/Ep2jnKhwUNDbtTL4BbvmlEtDxEn2fG3ONq22e8GCNk98nNr8e2T/UisXmG84NsIpo
 Y9OajUpj/GoumsmmziMNXdfQjGq6l4tLHGp7/2BXGGkCaGoeDJiPpndPE8hJfaeNbrEW
 zlP2zoIvOI3LIwkOieHwZjGvqnjCq07BgxjJIbaaynvX+phEfxZUdgxxOV1t+aJhHnxE
 dR1A==
X-Gm-Message-State: AOAM5325JdFxhvKLmYR9cqA11+N2hG7sYu3in7DztfHRfbWAX+xLPJk8
 LWjBGXTIlSsxiR0+V+bgiGQjHWY83MXQhwkc84sYgg==
X-Google-Smtp-Source: ABdhPJw7ESwHIqokQQbmXx3DD8/pVlD8WqXsPbO/N6d2om1KjN/f+z/UHGTkVyGGxJ96JNgTw6h3OSqxDlDj758uCl4=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr5859313pjb.232.1635441189807; 
 Thu, 28 Oct 2021 10:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211028163548.273736-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211028163548.273736-1-bjorn.andersson@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 28 Oct 2021 19:12:58 +0200
Message-ID: <CAG3jFyuxsJ_bWppw=2K0dTxheqDdVuFwojka8VMZH_p9Fmo4FA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sn65dsi86: ti_sn65dsi86_read_u16()
 __maybe_unused
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Bjorn,

Thanks for fixing this quickly.

On Thu, 28 Oct 2021 at 18:33, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> When built without CONFIG_PWM there are no references to
> ti_sn65dsi86_read_u16(), avoid the W=1 build warning by marking the
> function as __maybe_unused.
>
> __maybe_unused is used insted of a #ifdef guard as it looks slighly
> cleaner and it avoids issues if in the future other permutations of the
> config options would use the function.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Robert, I believe you pushed out the driver patch introducing this issue
> yesterday. Can you please add the relevant Fixes?

Added fixes & r-b tags.

Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip")
Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next

>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 430067a3071c..e1f43b73155b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -215,8 +215,8 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
>         .cache_type = REGCACHE_NONE,
>  };
>
> -static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> -                                unsigned int reg, u16 *val)
> +static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> +                                               unsigned int reg, u16 *val)
>  {
>         u8 buf[2];
>         int ret;
> --
> 2.33.1
>
