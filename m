Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531243DB63C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 11:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0307A6E28B;
	Fri, 30 Jul 2021 09:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FA36E28B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 09:45:33 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id m12so4235833qvt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZpP6fJ5qS4z9U5Mk/yGz9pYoYzJS2iFy7VnajEmatcg=;
 b=jpGwQ3MOZMKdioaOV5hA5tHyKgYIO9urmn/aw0qWsrlXO7I81+PIfSCA+9NM5nvoZU
 oLwxxOscaPNPRKhu4KENjr2qgaGOkfU6NlyqsrRmHOLQFwS9YwUMh9taPwxh2uKfx/54
 wj+Wa+5TX8DtPzflkIN7xLjawS33skikaknuTVp2fI39yMm52dTX9BhrVOg9bdCVRnIc
 l/FSUm3vwzzuVvSqvXBqrloAW9PkuV7gZEVzSd7SAiLaPKBN7HD8RSwUbvItfPO9d2W9
 F/ClPcW279D2Q16uV6s+bwTuZ9bgYbTn1r6o0zIuKZxKjhsr2fiG319/Fp03gVy7vTsL
 e1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZpP6fJ5qS4z9U5Mk/yGz9pYoYzJS2iFy7VnajEmatcg=;
 b=cNVQAOuKDM1jOaoYPbK831T1JHEA/6kOKIhwkgJ8SV+lfNnKjc1YOC1slJI9Ea6FFq
 7tGySWtkXlBauHRUssDTGhfm30TRC0WRWW56BIdWMSSqmP0SFesgY8L/GpOZ5U1Pn2bm
 wMSb9MkmYA2Vn1ymLvigSro39Kz9pA8iCKpZPrdp9zk/oKZhUmS76aWQ96KKNyUv0FAm
 GQcizfCNn0cKuw+RCXJ9hzQC+aPbZ+d3JxkSGnCFiSY1g2ABBs1R+C3Jfi09phtCS6lP
 w7ZeHjAiE78ZwneMXLy5Q+OtddBxdGui0E2hx9nE6jywKBTcBGYMKCfEL0GEgvuvGusV
 JaPg==
X-Gm-Message-State: AOAM533+lpf9PRPIvltuRRP1pWvZzcGGA+U/TQ0dtetHvLNngWXgf6wH
 xgunC00nq+YrTkOUMZaeoubNfrsMBceKt/xy/RHLMI+Rb3Y=
X-Google-Smtp-Source: ABdhPJw0YuA+LbmSP5phGohjXTllv6VPDLme3t9Ljod597Ufo8L1db10TQjQfGLo2cduBjgCa+Je8+K1qzv/6zpWAlo=
X-Received: by 2002:a05:6214:1882:: with SMTP id
 cx2mr1874675qvb.2.1627638332568; 
 Fri, 30 Jul 2021 02:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210730061301.32492-1-zhaoxiao@uniontech.com>
In-Reply-To: <20210730061301.32492-1-zhaoxiao@uniontech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 30 Jul 2021 12:45:21 +0300
Message-ID: <CAA8EJpq79QFUjAMQXgo-1XavN6ZQmw3SdKP3P5+p6ODhqFuJ1Q@mail.gmail.com>
Subject: Re: [PATCH] drm:This patch fixes the checkpatch.pl error to msm_drv.c
To: zhaoxiao <zhaoxiao@uniontech.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Jul 2021 at 09:13, zhaoxiao <zhaoxiao@uniontech.com> wrote:
>
> ERROR: do not initialise statics to false
>
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Could you please resend this patch following the style of the rest of
patches being submitted to this area? Subject, more detailed patch
description, etc.

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9b8fa2ad0d84..d9ca4bc9620b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  };
>
>  #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
> -static bool reglog = false;
> +static bool reglog;
>  MODULE_PARM_DESC(reglog, "Enable register read/write logging");
>  module_param(reglog, bool, 0600);
>  #else
> @@ -76,7 +76,7 @@ static char *vram = "16m";
>  MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
>  module_param(vram, charp, 0);
>
> -bool dumpstate = false;
> +bool dumpstate;
>  MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
>  module_param(dumpstate, bool, 0600);
>
> --
> 2.20.1
>
>
>


-- 
With best wishes
Dmitry
