Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27E153FF9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48F6FA19;
	Thu,  6 Feb 2020 08:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE896E466
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 07:14:15 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 66so4535901otd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 23:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ove59E8b1DoXqKIMNbPWcUTEg1A71z0FSmp+cEYbzQU=;
 b=QZk8BNm9AWR4jIvF+08vBb+bhGvV4R815TnZP+O4tXRraowiur+hfQqiL8TyyApr7C
 rVOGy2c+cDYsUyDvSWEWv0/FH1cqNBX500KcSsKr/dWPOInSoWs9KCioKaah/tNa4vyA
 TPBsPXHhMzHphpg+9YQIhWeGwH1a/P3Y2kZ+ytuJLd2bqOhQUu9wOtoToe5oX7lCtIW9
 dt5WOJTFWEE3Aj/K8VlZiB9Dcr3adGHXbaLqk9/edfimimn8FXosBwqf+ef/QSsWmsvI
 QhGF3HocD/AbVy48+/dBj34xGJa29qFJuxevVWbi9UlFLlSOi/vQtqbpaK6roSeIHNVv
 7Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ove59E8b1DoXqKIMNbPWcUTEg1A71z0FSmp+cEYbzQU=;
 b=Xze6WJqWZnP/TkWcK6Stw03S4XFp6c0gPh7G43MStkM+haaz/tlgpw5h/RLOsXwjVR
 pLZ3DeKJkZMUcmOCNJiVHLUUv6D4ipM9tmoynFPqdfZ7y7K6HAD8AwgyUah3a5QTd6DI
 FywakwASDF/U1i9PsobrFxFbW4MC9vNwSijA19F99VvBSSVOkc9w2vjrPQW6ezKd0Z0J
 l/bSvxvD90MLuzYns5eQ43lspr4ILpPoDr7AxAdWHFZkUhXN1jqj8BPzfRNv0T2pQrHd
 IBGJ84zHqi+UOCqUoAsyiEl8vGRk8/YL2DnmY1D4BOJVwlVevGiR9fFDPleSwNQPPezz
 m8ng==
X-Gm-Message-State: APjAAAXxbX/6d07nDPvQTKUEBbIwtDaGuaeK9Vt5h86DurALykPsCQQI
 domkwy9i8hPTpDfl1WKwIrS9WNyuFcx/nmbks93EgItQ8ywHNg==
X-Google-Smtp-Source: APXvYqxUIf4tTjk0lKaAU43HHPHTdd0HPVTfnwWeW7nPH1mbgyJ0/ALEAhi8JI96h4uENmu5c/D5OVnD//9hW3plidw=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr824857uak.22.1580972667836;
 Wed, 05 Feb 2020 23:04:27 -0800 (PST)
MIME-Version: 1.0
References: <1580441226.9516.1.camel@mtksdaap41>
 <20200206065951.213862-1-evanbenn@google.com>
In-Reply-To: <20200206065951.213862-1-evanbenn@google.com>
From: Evan Benn <evanbenn@google.com>
Date: Thu, 6 Feb 2020 18:04:02 +1100
Message-ID: <CAKz_xw0Ue_B=E6UixLshoKa_J4jkOzK-C1RsAna4c4ALAALhAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
To: ck.hu@mediatek.com
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: dcastagna@chromium.org, evanbenn@gmail.com, evanbenn@chromium.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, seanpaul@chromium.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apologies if I have formatted this wrong / sent to the wrong place!

The patch posted had an issue, another place in the driver was
assuming planes[1] still referred to the cursor.
Now search for the cursor before sending (as the plane cannot be
hard-coded, some devices have different numbers of planes).

Thanks

Evan Benn


On Thu, Feb 6, 2020 at 6:00 PM <evanbenn@google.com> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Currently the cursor is placed on the first overlay plane, which means
> it will be at the bottom of the stack when the hw does the compositing
> with anything other than primary plane. Since mtk doesn't support plane
> zpos, change the cursor location to the top-most plane.
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 29 +++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..d4078c2089e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,21 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>                              struct mtk_drm_crtc *mtk_crtc,
> -                            struct drm_plane *primary,
> -                            struct drm_plane *cursor, unsigned int pipe)
> +                            unsigned int pipe)
>  {
> -       int ret;
> +       int i, ret;
> +
> +       struct drm_plane *primary = NULL;
> +       struct drm_plane *cursor = NULL;
> +
> +       for (i = 0; i < mtk_crtc->layer_nr; ++i) {
> +               if (!primary && mtk_crtc->planes[i].type ==
> +                               DRM_PLANE_TYPE_PRIMARY)
> +                       primary = &mtk_crtc->planes[i];
> +               if (!cursor && mtk_crtc->planes[i].type ==
> +                               DRM_PLANE_TYPE_CURSOR)
> +                       cursor = &mtk_crtc->planes[i];
> +       }
>
>         ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>                                         &mtk_crtc_funcs, NULL);
> @@ -711,11 +722,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
>  }
>
>  static inline
> -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> +                                           unsigned int num_planes)
>  {
>         if (plane_idx == 0)
>                 return DRM_PLANE_TYPE_PRIMARY;
> -       else if (plane_idx == 1)
> +       else if (plane_idx == (num_planes - 1))
>                 return DRM_PLANE_TYPE_CURSOR;
>         else
>                 return DRM_PLANE_TYPE_OVERLAY;
> @@ -734,7 +746,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>                 ret = mtk_plane_init(drm_dev,
>                                 &mtk_crtc->planes[mtk_crtc->layer_nr],
>                                 BIT(pipe),
> -                               mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> +                               mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> +                                                       num_planes),
>                                 mtk_ddp_comp_supported_rotations(comp));
>                 if (ret)
>                         return ret;
> @@ -830,9 +843,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                         return ret;
>         }
>
> -       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -                               mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -                               NULL, pipe);
> +       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.25.0.341.g760bfbb309-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
