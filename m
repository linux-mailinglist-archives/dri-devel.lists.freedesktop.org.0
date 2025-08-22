Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3242B32132
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 19:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9FD10EB76;
	Fri, 22 Aug 2025 17:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="boLUOaKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AB910EB72
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 17:10:49 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-24456ce0b96so24213865ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755882649; x=1756487449;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOod9volShfVq9bcTCDYoGUjrhOK2U2VuJ0VwTTSFOs=;
 b=boLUOaKmqhcdFDeHizgWtyak5QqL5ATnuyNRWtZULih3HDXsRvIcPTXTY6tPkrOHma
 H98iNrxqOhH7twiriLWHNnHZcptMHzIeLs1C5f6x8qsab3vjnqIbvVd2zNM13aG8roSj
 ALSjky5xXCkuInREZAjG+o0FTnlDKCDdhVKi6ncQ//6wAV8pUvQh+4yO7bypa8Nchs6U
 IMgkjwV6ur1ymuMc7ujCZkRO2L8HEApp4N/oLQ7W2MVcNhoj1C79kAuDlss4PQpsIR5g
 vUAT/rwwDj3Ts6YfHKk4gk3WmfVysvxUISuCMSANIpGgpk0PYPwUDZEli0EBxGgXHYbe
 2AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755882649; x=1756487449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOod9volShfVq9bcTCDYoGUjrhOK2U2VuJ0VwTTSFOs=;
 b=Y8VIrAXVOEplsRTPoxakYMPFh4i7QaKhljVEUJzKewUVAHaQvM4FDEFvfYS+1PXGCM
 MOJ1/62hxzYx/C5csB9+g0zUVu9ph1ypxRn1yunM9CbqxfMW8ED3mPYqEMSoot1GT7/z
 xzPTY3rVvPiZE2JRNrXiIJuK6dF+yyakzJxKtTk5P8ukzZXf1B24VDxlZELoeQVM1e+u
 maRoD7kB/CpdnwUYzKAGhMqjLQltijl7RGiuWEM6OvFg5CEqbwJgT8/mPu7gBekg/263
 D89ydeg7u1msd+FxClTWaPAmRnL/MpeameJzpanFYX70yYkKVtxx4HFK4U+Mxg1kgcV/
 URcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgib3IBf/MWesXT6e/qXmnDyxme6vXox53leN5W5C3GXp86HsQi+xQdR78Yf3Bw/9AuvLHt04edvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsDFXgsUCdDMO5xA0KomWYzMAlBJaSPTInwF+ZpV7iabEdELE1
 AllOi2a35R3Cd4u51KCxQU9HfchPMC64xVIS5cjOpUDcBQK4744T+lMLxoGia90pCiuF/uYfC4N
 SwAmpwzb6ifiaFcWsZBeJz9SFY2kgcp7Hy8TUTLayAw==
X-Gm-Gg: ASbGncvK2t/LmFD21eOSr8siej4BClpZAqba7C2quffoL15i0TTPKAV9cKrFExcD7+M
 MMLb2kWF2XqEBftvk9KcFxoHleHimpeTQ1ndP6bqzxZhK7byHG3oHP50bnKVuUOWQcVI2P7zr4C
 TTa9uEv6fRKq6lhQUCeNDbkpOrwncOP/v+LbGACi3kRQpZgOE4KCwXcsBgsO++r7Vk+4/PUB5rG
 uX5NrA=
X-Google-Smtp-Source: AGHT+IHxcbQSyIs4Pe5d8vlJ26jI9eO+0yZG0kWEuQAN38UzJn8be0v+nBoaWdpp6eJH0oJbZDOhuqOMwpvILCfHdbk=
X-Received: by 2002:a17:903:2a8b:b0:240:3245:6d40 with SMTP id
 d9443c01a7336-246328030e6mr47133755ad.0.1755882648772; Fri, 22 Aug 2025
 10:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-4-jajones@nvidia.com>
 <CAOFGe97AN_yo7Mg4Z7s=qOFzSGzzs6CLEAhByf-ks2GthFj0aw@mail.gmail.com>
 <2cf6b444-33cd-4313-a624-8d1a9cd6ec9a@nvidia.com>
In-Reply-To: <2cf6b444-33cd-4313-a624-8d1a9cd6ec9a@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 22 Aug 2025 13:10:37 -0400
X-Gm-Features: Ac12FXw7aUzU6hPTcvS2h37yBJiQzAmsZzEd2-s-EMafvbthF_kln0kIYtYxyWQ
Message-ID: <CAOFGe97w3qgRL5Va=EO4kjayHojSq5SGpufoXCMG4riVew5cew@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/nouveau: Advertise correct modifiers on GB20x
To: James Jones <jajones@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 22, 2025 at 1:03=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:
>
> On 8/22/25 08:48, Faith Ekstrand wrote:
> >
> > On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM James Jones <jajones@nvidia.com
> > <mailto:jajones@nvidia.com>> wrote:
> >
> >     8 and 16 bit formats use a different layout on
> >     GB20x than they did on prior chips. Add the
> >     corresponding DRM format modifiers to the list of
> >     modifiers supported by the display engine on such
> >     chips, and filter the supported modifiers for each
> >     format based on its bytes per pixel in
> >     nv50_plane_format_mod_supported().
> >
> >     Note this logic will need to be updated when GB10
> >     support is added, since it is a GB20x chip that
> >     uses the pre-GB20x sector layout for all formats.
> >
> >     Signed-off-by: James Jones <jajones@nvidia.com
> >     <mailto:jajones@nvidia.com>>
> >     ---
> >       drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
> >       drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
> >       drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
> >       drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 ++++++++++++++++=
+++++
> >       4 files changed, 59 insertions(+), 3 deletions(-)
> >
> >     diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/
> >     drm/nouveau/dispnv50/disp.c
> >     index e97e39abf3a2..12b1dba8e05d 100644
> >     --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >     +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >     @@ -2867,7 +2867,9 @@ nv50_display_create(struct drm_device *dev)
> >              }
> >
> >              /* Assign the correct format modifiers */
> >     -       if (disp->disp->object.oclass >=3D TU102_DISP)
> >     +       if (disp->disp->object.oclass >=3D GB202_DISP)
> >     +               nouveau_display(dev)->format_modifiers =3D
> >     wndwca7e_modifiers;
> >     +       else if (disp->disp->object.oclass >=3D TU102_DISP)
> >                      nouveau_display(dev)->format_modifiers =3D
> >     wndwc57e_modifiers;
> >              else
> >              if (drm->client.device.info <http://
> >     client.device.info>.family >=3D NV_DEVICE_INFO_V0_FERMI)
> >     diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/
> >     drm/nouveau/dispnv50/disp.h
> >     index 15f9242b72ac..5d998f0319dc 100644
> >     --- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
> >     +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
> >     @@ -104,4 +104,5 @@ struct nouveau_encoder *nv50_real_outp(struct
> >     drm_encoder *encoder);
> >       extern const u64 disp50xx_modifiers[];
> >       extern const u64 disp90xx_modifiers[];
> >       extern const u64 wndwc57e_modifiers[];
> >     +extern const u64 wndwca7e_modifiers[];
> >       #endif
> >     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/
> >     drm/nouveau/dispnv50/wndw.c
> >     index e2c55f4b9c5a..ef9e410babbf 100644
> >     --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> >     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> >     @@ -786,13 +786,14 @@ nv50_wndw_destroy(struct drm_plane *plane)
> >       }
> >
> >       /* This function assumes the format has already been validated
> >     against the plane
> >     - * and the modifier was validated against the device-wides modifie=
r
> >     list at FB
> >     + * and the modifier was validated against the device-wide modifier
> >     list at FB
> >        * creation time.
> >        */
> >       static bool nv50_plane_format_mod_supported(struct drm_plane *pla=
ne,
> >                                                  u32 format, u64 modifi=
er)
> >       {
> >              struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
> >     +       const struct drm_format_info *info =3D drm_format_info(form=
at);
> >              uint8_t i;
> >
> >              /* All chipsets can display all formats in linear layout *=
/
> >     @@ -800,13 +801,32 @@ static bool
> >     nv50_plane_format_mod_supported(struct drm_plane *plane,
> >                      return true;
> >
> >              if (drm->client.device.info <http://
> >     client.device.info>.chipset < 0xc0) {
> >     -               const struct drm_format_info *info =3D
> >     drm_format_info(format);
> >                      const uint8_t kind =3D (modifier >> 12) & 0xff;
> >
> >                      if (!format) return false;
> >
> >                      for (i =3D 0; i < info->num_planes; i++)
> >                              if ((info->cpp[i] !=3D 4) && kind !=3D 0x7=
0)
> >     return false;
> >     +       } else if (drm->client.device.info <http://
> >     client.device.info>.chipset >=3D 0x1b2) {
> >     +               const uint8_t slayout =3D ((modifier >> 22) & 0x1) =
|
> >     +                       ((modifier >> 25) & 0x6);
> >     +
> >     +               if (!format)
> >     +                       return false;
> >     +
> >     +               /*
> >     +                * Note in practice this implies only formats where
> >     cpp is equal
> >     +                * for each plane, or >=3D 4 for all planes, are
> >     supported.
> >     +                */
> >     +               for (i =3D 0; i < info->num_planes; i++) {
> >     +                       if (((info->cpp[i] =3D=3D 2) && slayout !=
=3D 3) ||
> >     +                           ((info->cpp[i] =3D=3D 1) && slayout !=
=3D 2) ||
> >     +                           ((info->cpp[i] >=3D 4) && slayout !=3D =
1))
> >     +                               return false;
> >     +
> >     +                       /* 24-bit not supported. It has yet another
> >     layout */
> >     +                       WARN_ON(info->cpp[i] =3D=3D 3);
> >
> >
> > Should this really be a WARN_ON()? A DRM log message, maybe, but
> > WARN_ON() implies something went funky inside the kernel, not that
> > userspace asked for something it shouldn't.
>
> This is indeed a something funky in the kernel case. See the comment
> above: "This function assumes the format has already been validated
> against the plane and the modifier was validated against the device-wide
> modifier list at FB creation time." This isn't technically true at
> format blob query time, but in that case this function is just used as a
> filter against those same lists. Hence, the implication is someone
> modified the kernel to report 24-bit formats for some display plane on
> this device, and the WARN_ON is meant to guard against that/validate the
> assumption from the comment.
>
> I went through the DRM code again to verify the "format has already been
> validated" assumption still holds up, and I see these callers of this
> function:
>
> drm_plane_has_format() - Validates the format against the plane's format
> list right before calling this function. This is the path a format from
> userspace would go through, indirectly as a drm_framebuffer property,
> when validating it against a plane during a commit operation.
>
> create_in_format_blob() - As mentioned, simply iterates through the
> plane's format list.

Okay. I'm convinced.

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>

> Thanks,
> -James
>
>
>
> >     +               }
> >              }
> >
> >              return true;
> >     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/
> >     gpu/drm/nouveau/dispnv50/wndwca7e.c
> >     index 0d8e9a9d1a57..2cec8cfbd546 100644
> >     --- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
> >     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
> >     @@ -179,6 +179,39 @@ wndwca7e_ntfy_set(struct nv50_wndw *wndw,
> >     struct nv50_wndw_atom *asyw)
> >              return 0;
> >       }
> >
> >     +/****************************************************************
> >     + *            Log2(block height) ----------------------------+  *
> >     + *            Page Kind ----------------------------------+  |  *
> >     + *            Gob Height/Page Kind Generation ------+     |  |  *
> >     + *                          Sector layout -------+  |     |  |  *
> >     + *                          Compression ------+  |  |     |  |  */
> >     +const u64 wndwca7e_modifiers[] =3D { /*         |  |  |     |  |  =
*/
> >     +       /* 4cpp+ modifiers */
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5),
> >     +       /* 1cpp/8bpp modifiers */
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 0),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 1),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 2),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 3),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 4),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 5),
> >     +       /* 2cpp/16bpp modifiers */
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 0),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 1),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 2),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 3),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 4),
> >     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 5),
> >     +       /* All formats support linear */
> >     +       DRM_FORMAT_MOD_LINEAR,
> >     +       DRM_FORMAT_MOD_INVALID
> >     +};
> >     +
> >       static const struct nv50_wndw_func
> >       wndwca7e =3D {
> >              .acquire =3D wndwc37e_acquire,
> >     --
> >     2.50.1
> >
>
>
