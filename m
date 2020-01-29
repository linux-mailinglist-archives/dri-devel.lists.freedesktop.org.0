Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDFB14C76E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915106F499;
	Wed, 29 Jan 2020 08:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968B06E27C;
 Wed, 29 Jan 2020 08:25:42 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w9so8332914ybs.3;
 Wed, 29 Jan 2020 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kih+TB9JP3PedQhp/1CUreRPEItaPe2QPQz29F9tWDc=;
 b=Zo0D/9Q0JQHqmfuylFPaI2+qH2RjwZzwG4K152c5478sSjjcwX16A0/NJcorfJ9iDx
 bf8aor95/I4UP6Fc6h/0NB8NbUx2e+R1UOAILFIzAFKl27BxiikZR1CoUV3e9kHoVGNf
 gkhykrsUC6XYxDCPa7Y3PoN6FiedgCpcGjqxOqDzSqiSnzN5+WTS+YZuVXYb9JwtXbsG
 /qQ2OV38+RlT/YzUgiW6c5unXTOd84tK+8cGKIT3k+v9hBXU5/pAUC/lCk1COC9bWHdA
 PwLBvI/BiMPzC+fMF9l6KijnjBJS2nW7xcQyxWyq8HFS2hr2aErWCcHOvCXtlbWtqQcR
 rWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kih+TB9JP3PedQhp/1CUreRPEItaPe2QPQz29F9tWDc=;
 b=OU6ZT8byvWb2iSkqR/+qZzH1X/4pr5lqTpcrbAFQFGAeS3wxe7r647ckOJygx+x8cb
 vh3BxrSTgHhatLGNEQP+ouaZJ6lokQNIvTxR5CT/n9s6l1kv/yVbejQu8GPso6JIhDGi
 4I+Q2aDQ+WlZpD2VZcYX3BQhdPkMzqRC8q41X0so3THBT/6lMGXJSQrRbGutBwgbubEH
 4e9twljMpmr81VaJJ7AUknuZitGdLwTYnfnkL7xttUZUy7CXQKUe3rzeHasY78i2zOE+
 egtSadlvZ0ChCrW5UdO3gPEEirt6Ev8+w3+pnZOjJO7OLEylKVCx1b0XOEiKIySAmzZn
 Psqw==
X-Gm-Message-State: APjAAAUinRx9uDhadzvv7VeFlqOOFMA8XlTfd3KsmWhg+96sjYKdHZHX
 AWglCtSa17QurALm5/o5BF5UT7QICBC21J5IYPI=
X-Google-Smtp-Source: APXvYqzYYS+fbLJS92hXCLIiPAKjDMfVajoV30W9JVMhPXXe6xeykGWBSC5YEHENiobwTVVUd7ZcBIkpRfTJyb1W+VQ=
X-Received: by 2002:a25:b950:: with SMTP id s16mr18652397ybm.147.1580286341707; 
 Wed, 29 Jan 2020 00:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-9-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-9-tzimmermann@suse.de>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 29 Jan 2020 18:25:30 +1000
Message-ID: <CACAvsv5vN1FJOF0EuxEwqa4_=ptfK2xTyvRpPrBaS8ac0MvC4w@mail.gmail.com>
Subject: Re: [PATCH v4 08/22] drm/nouveau: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, Dave Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, alexandre.torgue@st.com,
 thellstrom@vmware.com, sean@poorly.run, linux-graphics-maintainer@vmware.com,
 Ben Skeggs <bskeggs@redhat.com>, mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 rodrigo.vivi@intel.com, vincent.abriou@st.com, rodrigosiqueiramelo@gmail.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Jan 2020 at 00:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> nouveau over.
>
> v4:
>         * add argument names in function declaration
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c   |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c | 14 +++-----------
>  drivers/gpu/drm/nouveau/nouveau_display.h |  7 ++++---
>  drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 -
>  5 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 37c50ea8f847..17e9d1c078a0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -1258,6 +1258,7 @@ static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
>         .mode_set_base = nv04_crtc_mode_set_base,
>         .mode_set_base_atomic = nv04_crtc_mode_set_base_atomic,
>         .disable = nv_crtc_disable,
> +       .get_scanout_position = nouveau_display_scanoutpos,
>  };
>
>  static const uint32_t modeset_formats[] = {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index d9d64602947d..41852dd8fdbd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -413,6 +413,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
>  static const struct drm_crtc_helper_funcs
>  nv50_head_help = {
>         .atomic_check = nv50_head_atomic_check,
> +       .get_scanout_position = nouveau_display_scanoutpos,
>  };
>
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 53f9bceaf17a..86f99dc8fcef 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -136,21 +136,13 @@ nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
>  }
>
>  bool
> -nouveau_display_scanoutpos(struct drm_device *dev, unsigned int pipe,
> +nouveau_display_scanoutpos(struct drm_crtc *crtc,
>                            bool in_vblank_irq, int *vpos, int *hpos,
>                            ktime_t *stime, ktime_t *etime,
>                            const struct drm_display_mode *mode)
>  {
> -       struct drm_crtc *crtc;
> -
> -       list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -               if (nouveau_crtc(crtc)->index == pipe) {
> -                       return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
> -                                                              stime, etime);
> -               }
> -       }
> -
> -       return false;
> +       return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
> +                                              stime, etime);
>  }
>
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index 6e8e66882e45..26d34f1a77da 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -63,9 +63,10 @@ int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
>  void nouveau_display_resume(struct drm_device *dev, bool runtime);
>  int  nouveau_display_vblank_enable(struct drm_device *, unsigned int);
>  void nouveau_display_vblank_disable(struct drm_device *, unsigned int);
> -bool  nouveau_display_scanoutpos(struct drm_device *, unsigned int,
> -                                bool, int *, int *, ktime_t *,
> -                                ktime_t *, const struct drm_display_mode *);
> +bool nouveau_display_scanoutpos(struct drm_crtc *crtc,
> +                               bool in_vblank_irq, int *vpos, int *hpos,
> +                               ktime_t *stime, ktime_t *etime,
> +                               const struct drm_display_mode *mode);
>
>  int  nouveau_display_dumb_create(struct drm_file *, struct drm_device *,
>                                  struct drm_mode_create_dumb *args);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index b65ae817eabf..fcc036a08965 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1122,7 +1122,6 @@ driver_stub = {
>
>         .enable_vblank = nouveau_display_vblank_enable,
>         .disable_vblank = nouveau_display_vblank_disable,
> -       .get_scanout_position = nouveau_display_scanoutpos,
>         .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
>
>         .ioctls = nouveau_ioctls,
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
