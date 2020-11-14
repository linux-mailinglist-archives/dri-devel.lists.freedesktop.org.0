Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A22B2B56
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 05:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E66E8E4;
	Sat, 14 Nov 2020 04:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982F36E8E3;
 Sat, 14 Nov 2020 04:42:14 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id g15so10654715ybq.6;
 Fri, 13 Nov 2020 20:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IG5+uwMaJpYsJGyx0OR6KbwT48lJzpuz3Wuqu6d3xAA=;
 b=GeYzLJCvNVHV/I0uXIaB8CRLYYHZbL6R3USS9bCeaK67NUjoBxj4mQ7UC70hyeUUJX
 bn6gkMZRFE+7x7MYY50K/ac7ariAtdPgnia9m/VjvooLRgUr+r+ocDuLIvcogwITyLxP
 hAocRkUhe3oPkrNBQmgJxbEOqWc+i6Yj5A+iO12hYXEP+v/nLiF/sclg1QC3LkwUmeX1
 JOg2+kGM7yuLiB1BhIUTez28wLQDTUjVyQpBtA/nKEO3qbAMnRMl63NOtmPXOzmd1dM7
 d1QqQzLkAD36Gir5S7UIFCzcYTaaUlMkY7UyO7rVxBHiNuz3q7Y7Bd7vlD3Oy7TgRd6h
 kAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IG5+uwMaJpYsJGyx0OR6KbwT48lJzpuz3Wuqu6d3xAA=;
 b=Ip1x/53lQcCqyFRDWuuXpYEGR30/m+pLmtjs1eyATyEGCAgG8IvqnhAf7ojsUgCt+W
 fgy1G1nrIWxAurAiBStL0L8MzLbsCNvUUPKfDHHcZ8WB44olk0mOac82Qumv7r/qgNqw
 SH7jY7JnfpWxnJtOQ6aWTsKBp5yvt6cpCSPWVdFsmCJMgNCmaHc4qeixtM3fEtNsO5x6
 705A1YGDJIjrbgoYSwBpN8f/IetQFONSwuiLImZHa/gj5fsgddOtnR+lCaw3Rb5zAGPz
 DNkoMZJAU4ZUC6IxV9OYt6GbewTYHfDL7yBMRqyuYqVuuE3+ho3u9AHu/wo1zGeNfyNr
 XaAg==
X-Gm-Message-State: AOAM530Sw7sFIetQMyb5afMxNITlJy5xPK23Es7APTM33AJiWl1wYQkj
 dducAdHtChKkZXMN24Y7Vd/rLp8+l7kH7ZNb23JazVVr1ow=
X-Google-Smtp-Source: ABdhPJzUvsS1E0yixjiSXgJxozsfAQMPDmA7tdEg3jG4oEW7j81WrASpUHBYeQ0BZ8cky0mr4Pe8udsDG87IcaqxUNk=
X-Received: by 2002:a25:a065:: with SMTP id x92mr10895643ybh.94.1605328933843; 
 Fri, 13 Nov 2020 20:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20201114001417.155093-1-lyude@redhat.com>
 <20201114001417.155093-2-lyude@redhat.com>
In-Reply-To: <20201114001417.155093-2-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Sat, 14 Nov 2020 14:42:02 +1000
Message-ID: <CACAvsv6NismE+G8DgZX6YZPcM1+onnYgxOdkOkX6gKu=obM9Fw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/8] drm/nouveau/kms/nv50-: Use atomic encoder
 callbacks everywhere
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've merged all of these.  Sent the first to 5.10-fixes for the
regression there, the rest will go in with a later -next pull request.

Thanks,
Ben.

On Sat, 14 Nov 2020 at 10:14, Lyude Paul <lyude@redhat.com> wrote:
>
> It turns out that I forgot to go through and make sure that I converted all
> encoder callbacks to use atomic_enable/atomic_disable(), so let's go and
> actually do that.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Fixes: 09838c4efe9a ("drm/nouveau/kms: Search for encoders' connectors properly")
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 29 ++++++++++++-------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index b111fe24a06b..36d6b6093d16 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -455,7 +455,7 @@ nv50_outp_get_old_connector(struct nouveau_encoder *outp,
>   * DAC
>   *****************************************************************************/
>  static void
> -nv50_dac_disable(struct drm_encoder *encoder)
> +nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>         struct nv50_core *core = nv50_disp(encoder->dev)->core;
> @@ -467,7 +467,7 @@ nv50_dac_disable(struct drm_encoder *encoder)
>  }
>
>  static void
> -nv50_dac_enable(struct drm_encoder *encoder)
> +nv50_dac_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>         struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
> @@ -525,8 +525,8 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
>  static const struct drm_encoder_helper_funcs
>  nv50_dac_help = {
>         .atomic_check = nv50_outp_atomic_check,
> -       .enable = nv50_dac_enable,
> -       .disable = nv50_dac_disable,
> +       .atomic_enable = nv50_dac_enable,
> +       .atomic_disable = nv50_dac_disable,
>         .detect = nv50_dac_detect
>  };
>
> @@ -1055,7 +1055,7 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
>  }
>
>  static void
> -nv50_msto_enable(struct drm_encoder *encoder)
> +nv50_msto_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nv50_head *head = nv50_head(encoder->crtc);
>         struct nv50_head_atom *armh = nv50_head_atom(head->base.base.state);
> @@ -1101,7 +1101,7 @@ nv50_msto_enable(struct drm_encoder *encoder)
>  }
>
>  static void
> -nv50_msto_disable(struct drm_encoder *encoder)
> +nv50_msto_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nv50_msto *msto = nv50_msto(encoder);
>         struct nv50_mstc *mstc = msto->mstc;
> @@ -1118,8 +1118,8 @@ nv50_msto_disable(struct drm_encoder *encoder)
>
>  static const struct drm_encoder_helper_funcs
>  nv50_msto_help = {
> -       .disable = nv50_msto_disable,
> -       .enable = nv50_msto_enable,
> +       .atomic_disable = nv50_msto_disable,
> +       .atomic_enable = nv50_msto_enable,
>         .atomic_check = nv50_msto_atomic_check,
>  };
>
> @@ -1645,8 +1645,7 @@ nv50_sor_disable(struct drm_encoder *encoder,
>  }
>
>  static void
> -nv50_sor_enable(struct drm_encoder *encoder,
> -               struct drm_atomic_state *state)
> +nv50_sor_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>         struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
> @@ -1873,7 +1872,7 @@ nv50_pior_atomic_check(struct drm_encoder *encoder,
>  }
>
>  static void
> -nv50_pior_disable(struct drm_encoder *encoder)
> +nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>         struct nv50_core *core = nv50_disp(encoder->dev)->core;
> @@ -1885,7 +1884,7 @@ nv50_pior_disable(struct drm_encoder *encoder)
>  }
>
>  static void
> -nv50_pior_enable(struct drm_encoder *encoder)
> +nv50_pior_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>         struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
> @@ -1921,14 +1920,14 @@ nv50_pior_enable(struct drm_encoder *encoder)
>         }
>
>         core->func->pior->ctrl(core, nv_encoder->or, ctrl, asyh);
> -       nv_encoder->crtc = encoder->crtc;
> +       nv_encoder->crtc = &nv_crtc->base;
>  }
>
>  static const struct drm_encoder_helper_funcs
>  nv50_pior_help = {
>         .atomic_check = nv50_pior_atomic_check,
> -       .enable = nv50_pior_enable,
> -       .disable = nv50_pior_disable,
> +       .atomic_enable = nv50_pior_enable,
> +       .atomic_disable = nv50_pior_disable,
>  };
>
>  static void
> --
> 2.28.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
