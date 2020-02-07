Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7D155CDA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF786E0E1;
	Fri,  7 Feb 2020 17:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FB86E0E1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 17:29:01 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id o13so178556ilg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQthra+5Tb+MdByAUBovPY1PsDx5TneOE+jweSiM4d0=;
 b=JiDfGPDAovB+nWhtAim+Qoa8yJlNkdbELjctfRTRJacs8IQcvDG9LBHzFe9BQE3eQv
 dUOCXG2MkvMvtLIh2LL+PXl2A83qDPOOQrPwvxURTxkykvPzQq6O5rtHvJNfil+Wn/Bo
 26tHe3ii1y1hyDj1HOvXvj+PTlB10z9cnA5mkIB6LDRdAOD0NxM3SbGze+LUNFmHgViB
 CyLR7MuxG0ICSeU2tg1kFLHrIKcn4LFjnwP1nfxJIN8EEMoKzlCYC4AZ2/cC3ObGDdgc
 +RCPQknvTwh8bsAvfydBTTSoj58aGw3qrXn7mVRUyXM3ddYoZ1mUnVg0ap2PgDZLn/8d
 xo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQthra+5Tb+MdByAUBovPY1PsDx5TneOE+jweSiM4d0=;
 b=rry8PU6vU/dXuCrUtUYrBTWQd0hcRBS+PG9oiU1pi5qXolXCnFG86fRegYW+KR2HhW
 WEhUysIH2KIgsh/As0vzoq5eDSaMvAIcWRk/xSCBj+bikd1g8n3PPEcu/iH5dCIO0RWR
 zIrBwgVKEySAjTkgxSk7pQVQcGTcEC/RRHe3cAo1JDfliBxj2Ynbfz24eEXCPqWNY/ft
 3ocqcI//w5tLMfM8c7xLcFsVLV3bw/mdgCxM0f9x5qPGB4K3i+mFaw0tD/3d6Xtjvwcw
 UTY8Hjg2TCqqC7y1jubo8JG3PdCwEXmJfVOXqTMiyIDVNpJHcnXl9ikQvdqu0U2lgYoS
 S18g==
X-Gm-Message-State: APjAAAX/D5BjzuNKEEAZvv3qeedoqrheXsVORYMVLZEUDR3ephcVw8nn
 vg+gbyaRzSD6o94KNDOMhteonARtRKZARRAVdDk4WA==
X-Google-Smtp-Source: APXvYqwXFhIati6Vp0GDfgQt0l5PZHt8xFRskEGYtNtbtsgxbozzjhsd86PDJjPrBvQAZjGbzw1snCPkeL1BuMgVfjk=
X-Received: by 2002:a92:88c4:: with SMTP id m65mr450018ilh.165.1581096540300; 
 Fri, 07 Feb 2020 09:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
In-Reply-To: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
From: Sean Paul <sean@poorly.run>
Date: Fri, 7 Feb 2020 12:28:24 -0500
Message-ID: <CAMavQKKZAYgpCLPodWw0pS1na7rthuJy8DkSvexOb+TRKHeKfg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
To: Evan Benn <evanbenn@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 11:24 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> The cursor and primary planes were hard coded.
> Now search for them for passing to drm_crtc_init_with_planes
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>

I like it!

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..935652990afa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>                              struct mtk_drm_crtc *mtk_crtc,
> -                            struct drm_plane *primary,
> -                            struct drm_plane *cursor, unsigned int pipe)
> +                            unsigned int pipe)
>  {
> -       int ret;
> +       struct drm_plane *primary = NULL;
> +       struct drm_plane *cursor = NULL;
> +       int i, ret;
> +
> +       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +               if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> +                       primary = &mtk_crtc->planes[i];
> +               else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> +                       cursor = &mtk_crtc->planes[i];
> +       }
>
>         ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>                                         &mtk_crtc_funcs, NULL);
> @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
