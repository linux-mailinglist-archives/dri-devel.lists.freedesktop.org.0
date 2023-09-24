Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D57AC754
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 11:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3739D10E0C0;
	Sun, 24 Sep 2023 09:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF61210E002
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 09:33:59 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d8181087dc9so5050736276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695548039; x=1696152839; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kHH2nT1UzZYRScO9kjwwzj9/M7QjVis56Gg6U4ewg1s=;
 b=FjQKUYgT45mAM60TtI7EZoBjdc9uusOCZR0g+zaOZoodlLmojbOEUR5bBT99HC6UWO
 n6UlQmM7Fo4KeSGQmZN4j+3Y11nSFfpm7wrGxlRvBbX8MV0Q9cEFYCZhkfpsPp8VWQnX
 EwfN7R1WehmYYpyL38SMLLFWCWkiUNA9+rO3PBfRP2ZJ4zjxcoc6Fh776ndR72Ri8can
 6FflNmt7z44MJLAhYWUacL7Txt0SUbEkcvhi0ZZrWsps0uEoRCJgWTSWm8dzP0ELQ9Wq
 XXxtmU0nWJQW5Vw7+u8UcMK2wOdnVQsZpQXiZslLZu6Hs33aT1H3QXK8CNxyzs616SrL
 emvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695548039; x=1696152839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kHH2nT1UzZYRScO9kjwwzj9/M7QjVis56Gg6U4ewg1s=;
 b=F3113SrAkBoViphE9irmqC3vgecCPtVgbmwFQvgNIOvi1n4HSYTWEWDOGmP69aquTJ
 NvcdXFHb0rRXn+fhUUVVYaaif3svrYouWA2zA2WZQrc+bO1Cepb51ZOY1rZcDqWk8drH
 ft2c3hPvIOiyKj/URZDoAgbObq+Vz51AJM69KQLFKuKHbGvnrgLNh+1Nsf6nGBwAnRre
 7xLLYrk7GEdtYOvlZs8Qq9jdDju8rPcOldSGbf6qB2p2cj0YUTKvz+dtRcD2SRXqiVGU
 ADUL+y/NNo/b++jKV4CNhRLIkrTVZht/atNPmeM/Ce8UNctHyMbIEs3Q3/wrRIzw5nX0
 vVYg==
X-Gm-Message-State: AOJu0YwemBWAT5FsdzOi4zcqPpUa42EBtNxGNr1GZo/veKdpFoGtUAWY
 E9NoTROA7TkxVencGvYpwMi3HGVz+8bLArwbyJZbPg==
X-Google-Smtp-Source: AGHT+IF1KO4KdnzBFi/BrVM3qc6nlsiamtIrO+y+KCxeRFCJb7bBZ4Nw8TZsXNuFdCCaFm3/UJiHt462fMrm2ydqK/o=
X-Received: by 2002:a0d:d103:0:b0:577:51cd:1b4a with SMTP id
 t3-20020a0dd103000000b0057751cd1b4amr4024641ywd.41.1695548038873; Sun, 24 Sep
 2023 02:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230924064159.14739-1-liuhaoran14@163.com>
In-Reply-To: <20230924064159.14739-1-liuhaoran14@163.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Sep 2023 12:33:46 +0300
Message-ID: <CAA8EJpq9x5RY05cKzq7MoMzdKRBkj3y_Hy3gpmKfZVMqK123ow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp4: Add error handling in
 mdp4_lvds_connector_init()
To: liuhaoran <liuhaoran14@163.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Sept 2023 at 09:42, liuhaoran <liuhaoran14@163.com> wrote:
>
> This patch adds error-handling for the drm_connector_init() and
> drm_connector_attach_encoder inside the mdp4_lvds_connector_init().
>
> Signed-off-by: liuhaoran <liuhaoran14@163.com>

As pointed out by the kernel robot, this was not even compile tested.
So NAK. Please use proper casts for error returns.

> ---
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7444b75c4215..62eb363ba90f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -96,6 +96,7 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
>  {
>         struct drm_connector *connector = NULL;
>         struct mdp4_lvds_connector *mdp4_lvds_connector;
> +       int ret;
>
>         mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
>         if (!mdp4_lvds_connector)
> @@ -106,8 +107,12 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
>
>         connector = &mdp4_lvds_connector->base;
>
> -       drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
> -                       DRM_MODE_CONNECTOR_LVDS);
> +       ret = drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
> +                                DRM_MODE_CONNECTOR_LVDS);
> +
> +       if (ret)
> +               return ret;
> +
>         drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
>
>         connector->polled = 0;
> @@ -115,7 +120,10 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
>         connector->interlace_allowed = 0;
>         connector->doublescan_allowed = 0;
>
> -       drm_connector_attach_encoder(connector, encoder);
> +       ret = drm_connector_attach_encoder(connector, encoder);
> +
> +       if (ret)
> +               return ret;
>
>         return connector;
>  }
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
