Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5924D24A4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 00:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D052F10E329;
	Tue,  8 Mar 2022 23:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4C410E329
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 23:10:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w12so658955lfr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 15:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tclsFaPE34TrWsSULlYvU9YsW3x7Tf6mvtJ/Ff+EAgw=;
 b=YTxtynEturtmQ9+fQ2vk4MLEzSozTMNeDRXaVWblqZvl5cNILUeHdpEsitwfPfNIzn
 uCtJuZ5NsjYf2Ok6NBtbFh9Ma45M5vV4eDFye5M5b2CqwFnkNoA8DFyU50SPmMselqV/
 q/tlUGMcxIMfJNgMyYAgT5U/xKc9hbMGY84CXSrjQz3QPryQGm3EntO5dzCPy4t1eLLM
 PJF3EWLGIRs9IQkx+NbaWBj8+A2ASwVgX7J8o5ZMMpRM0FvqYWU3ThHQDTV7BjFmtynz
 gVx61JpRkMOep1q+pQ1+vJQs7ocgJhkFT/XQnL7qiyo2bgs0+u1VgxYEfGddeAxQFlhp
 Cxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tclsFaPE34TrWsSULlYvU9YsW3x7Tf6mvtJ/Ff+EAgw=;
 b=MEJSRL/apE2hwfBBmQdBBRfcRs3rLgansbAYK2NnTf/ulAkwDbkY6YHldbGapd0Vdq
 TXLJaLeufs0D0jMsTjsYlwALmqEBoKLzyXh/boUZlVUCXqrEBKyJoj5Xql/8/upzGF86
 eW2FApchngoJjTtQx8Yly/QICKIwJ55OmGvKEslh10WyPf1d5pvV1sRv6mT9p4KFkd1l
 vtRZOG6mfNOtJI6tmSb/kP5iqPdM+xYBXJ+a5mams2hBHOcB6xqFh0FUSi4IF1tZL5Yv
 WXLxzng8gn8ig8kzgVnDw5TAjwA6TMtRJd3ELE5RfSKF3oPsS+yS66fd11VDktmB+rn9
 /ugQ==
X-Gm-Message-State: AOAM5325xI2jSoQI8cSXHH8jMi6HY7baSsbderPx3fZB20tAYMQkrAvZ
 J2nMD/5N5CsHNL0d+KHMYESDd5K3rVHwam4PKzKUFA==
X-Google-Smtp-Source: ABdhPJx/fglOdwsFUXGzUPIPq1H3ZUZI8HoqBE3Dc7CpwH2vZZ4CHq8MWt1insKPhpHz2VgNI0Ys/4lxjE1mEucfOrE=
X-Received: by 2002:a05:6512:31d4:b0:445:e4ef:c0f8 with SMTP id
 j20-20020a05651231d400b00445e4efc0f8mr12498094lfe.626.1646781042694; Tue, 08
 Mar 2022 15:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20220307181704.149076-1-colin.i.king@gmail.com>
In-Reply-To: <20220307181704.149076-1-colin.i.king@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Mar 2022 15:10:31 -0800
Message-ID: <CAKwvOdkXNGRJkZDd7Cg8jhL9Ex7R+VPYqEEc+VpwDyi9NJKXQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: remove redundant assignment to pointer
 connector
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: knaerzche@gmail.com, David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 7, 2022 at 10:17 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The pointer connector is being assigned a value that is never read,
> it is being re-assigned in the following statement. The assignment
> is redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: warning: Value stored
> to 'connector' is never read [deadcode.DeadStores]

+ Author & reviewer of:
Fixes: 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag to drm_bridge_attach")

>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> index 2494b079489d..92a727931a49 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> @@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
>         if (ret)
>                 goto err_free_encoder;
>
> -       connector = &rgb->connector;
>         connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
>         if (IS_ERR(connector)) {
>                 DRM_DEV_ERROR(drm_dev->dev,
> --
> 2.35.1
>
>


-- 
Thanks,
~Nick Desaulniers
