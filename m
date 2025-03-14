Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A186A62C12
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1510E3A1;
	Sat, 15 Mar 2025 11:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7FD4cku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33C910EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:00:38 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2ff62f9b6e4so561520a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741968038; x=1742572838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=;
 b=H7FD4ckue7nZeNyFCldp5/nRCjNbDqx7Z9dqAK9K+AgbUG/Ty4A6sK68lW/S09jS2o
 hay8wvxe9zrPctpX2U35RTttDbWz0c7nPmcuwea2qFe76whBNWbc2EuV4JcgtV7Iw+xD
 ygnYvVbo7Lgn0D3NpguZI1QXffyjRbPiwa4GkEZHhGwNcLB2U4mnUblU+5fZZvZEu4lN
 1Sx4+a2EKBkoFV6/vmRKIp9QwW81+8ZHLwM8LozU7DmlA2b9lfk0TqnemfEXZjanI2Wo
 WUom4sAuPKPPTS1usRukHPl5d0SFXE9bz628Oa8NgpiZdrKgQo1czzTj49GkfZ91cjMS
 waDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741968038; x=1742572838;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=;
 b=X7IZsqj34F1Vq9DWh/CIwMeaKHKe3HGvwIfZ0US9I4G2cg6heED/W26Ze/DT4/IjkT
 AmlwjjtQx6JkmS9Edy4sqSiTaf1MjsOFGVh32mcEH4y5z743cR5kHJHJocYtu7CHG5Yk
 d6sAva6V55O2pHB6m1r/oVtIbn+oft75qm8Xb+J7iICF7/2muCIv4ngpsyqYLxtngMQv
 Sg4SwQdRx6xFXOzzCx8gb39nUFmYeBzQSBp8sErCVojErfoma6imrKRWcDrMWZa1+jrn
 l3WUFjjyO7FUzm0kPWMVraESX8dQV6VUWRFsVc26qrD/rvFpceU2FW38oqEvSAeoXR27
 S2tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaYhvJ6E2+vUx4Luq9IYn3EIm3jk8vtZb7FDEjvpygkaKEf19kUFEAaWgXrZEs3LyVTX+jlzGBP74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNLETQNkCW9wjuBcoYRLuQT7wO+q1/lT3bdLZPclWu8WRuVZi2
 JjvjuZ8/AKnHabnbXoaUYtXHKSN0VU6CksAQtUlBuftrfawtL7HWHrLBscHJQw5ItPdrqZQot16
 GwZRG7BnH1TzQjN0QJ+qN1PQW/w==
X-Gm-Gg: ASbGncv21j8LyAqnSFwt7BStRIOxLJyf6wB3mFG+akFCSyt60gzsPhL25cjxrSPIcMF
 hc42N/ey9rEUqgQWUiSbzHo955iA357vsTBkTGJToMhnL+i/M2zkPJiHsdKotcgyIhGbKIgvkWo
 ZHUx3hfLSWdx0nMAj63GEB4cmt9GI=
X-Google-Smtp-Source: AGHT+IHPg5LEX9RcXJcT7z3Dh6z47dRs4csMp548pLAhreG5srJVcZIIpfZ8T/92XQSoT8s0QhUvp3pVVX5xQ+RxwCQ=
X-Received: by 2002:a17:90b:164f:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-30151c88e12mr1556703a91.1.1741968037522; Fri, 14 Mar 2025
 09:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250314012029.668306-1-chenyuan0y@gmail.com>
 <20250314-prophetic-attentive-platypus-3ab214@houat>
In-Reply-To: <20250314-prophetic-attentive-platypus-3ab214@houat>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Fri, 14 Mar 2025 11:00:26 -0500
X-Gm-Features: AQ5f1JoUD0V5ZOdvR5FcIitlHbVLK_E695Xu4I0ACsV86e_NOveKe5yScUlp2jo
Message-ID: <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
To: Maxime Ripard <mripard@kernel.org>
Cc: wens@csie.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com, 
 samuel@sholland.org, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:28 +0000
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

HI Maxime.

Thanks so much for pointing that out!

How about such a patch?

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..5ad0e90d3e6b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -490,9 +490,14 @@ static int sun4i_backend_atomic_check(struct
sunxi_engine *engine,
  drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
  struct drm_plane_state *plane_state =3D
  drm_atomic_get_plane_state(state, plane);
- struct sun4i_layer_state *layer_state =3D
- state_to_sun4i_layer_state(plane_state);
- struct drm_framebuffer *fb =3D plane_state->fb;
+ struct sun4i_layer_state *layer_state =3D NULL;
+ struct drm_framebuffer *fb =3D NULL;
+
+ if (IS_ERR(plane_state))
+ return PTR_ERR(plane_state);
+
+ layer_state =3D state_to_sun4i_layer_state(plane_state);
+ fb =3D plane_state->fb;

  if (!sun4i_backend_plane_is_supported(plane_state,
        &layer_state->uses_frontend))
--=20

-Chenyuan

On Fri, Mar 14, 2025 at 2:17=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> > The function sun4i_backend_atomic_check was dereferencing pointers
> > returned by drm_atomic_get_plane_state without checking for errors. Thi=
s
> > could lead to undefined behavior if the function returns an error point=
er.
> >
> > This commit adds checks using IS_ERR to ensure that plane_state is
> > valid before dereferencing them.
> >
> > Similar to commit da29abe71e16
> > ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_change=
d").
> >
> > Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for=
 the frontend")
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/su=
n4i/sun4i_backend.c
> > index 2dded3b828df..a8e0e2123764 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi=
_engine *engine,
> >       drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
> >               struct drm_plane_state *plane_state =3D
> >                       drm_atomic_get_plane_state(state, plane);
> > +
> > +             if (IS_ERR(plane_state))
> > +                     return PTR_ERR(plane_state);
> > +
>
> This introduces a build warning. You shouldn't mix declarations and code.
>
> Maxime
