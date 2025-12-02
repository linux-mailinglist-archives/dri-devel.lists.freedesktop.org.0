Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75876C9BA4B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21FC10E07B;
	Tue,  2 Dec 2025 13:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1OgYteR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7076310E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:43:25 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-6593155d8d6so3214599eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764683004; x=1765287804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6wFOE51245DjLuun4bIi7qZrsForbqRK8/1Wf2P9lU=;
 b=Q1OgYteR2E5Zv/JarCmy1Lntbg2Inm9c1Q3BHOVzu4g0v+9xlB6vp0RxjX5LRBvGgd
 DcxKX4CH2xXyXklARQkkZX+Y1eQOTfbYZYVXE6nWoZuI5H0Gxpqs1pX8JtTXz8bKA/5d
 rlqDiIIXbtb7PRuwW9CYaWeeN9zt32lcK+xTNSl6FKXPd+5Rk8bF95kE7i1vqKCGcQ3P
 zw9OrmDCfNXcaSAIrEPaCk2OXJiybrQvteAsPAg8cuK0JxJztTWAmuLwmpdD+4Yme8w7
 Vl6JpHg8gFkYnMWAcm3Hff6ZrFNZpKQ/9Mv31wh9ZHcmczKHFVnZGGSiTgHC5I4B5Y0p
 8KnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764683004; x=1765287804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E6wFOE51245DjLuun4bIi7qZrsForbqRK8/1Wf2P9lU=;
 b=kq13dqNZLboJYxXKW8iliZEBoygEylwArVuHkTz4KtIxnp27AD34lfV9P8fwI36Yp4
 l1tdkyx9TIoFO2+icKEvKAq19F8bjROqnDXRYP6b00A3O3X/FdxZOhBbQ0yAonVFzGch
 +VOlHeRzrTIc7u5r4J0hVtERe6/fNVayrM5bvkIbmJGJui65KBdI+kVBwK6fNGsu8KF/
 yvla0PJwMmnob7MN3+j7Dc7jabjb7nA9qgxj2Q/TaioPIfu7vARo+WbMLYp9MtibhDjd
 dGI2xSi/gfreTOVVpjQD0duD5SBb8TbntSgWOO4QqDXJ+DcB2qOgFrorkpS5WpMC0as7
 jBRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhmnP/O0NjG4MSbZkekua8nX8Iep6MUnvbhI/k+nK79D9O0AH/wI7OJ56Lxi551lq1q4gm8n9BXI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkSSlmB34mCpBuKvWgVb0dpxoTQo8d2y7uh3+OEZxHCBHBE4rD
 72OpETJ7CgX4IbBdhS0OOg3u3eWhYYGDm7PAgJVwSGBEfGk8U6J7hneV1+km3GwrJjFNYV2iqyB
 lg9VnitduxdiaXeLGCA4DUmo+RTwm5oE=
X-Gm-Gg: ASbGncvkLbDviC2KXvjWMykx1ZxTt4lGhE1wQ6pGNMrXR+ScQbB5Lr7PgkqeFQKGT2y
 IyLHJUoEz04OPi92aHRTKJ47MipgU9TS/potRXGWAk8gBR7dtJQ4yX0GmYc5WaA6TrzeCTQ7eIz
 iez0HMn6xRfhZaL8XALep+FyKoTpPvQT6LpBD7NTQ/Jw2kZFLL0A1wxw62UqtPxEdiqF2mElYx2
 2R0hE3BV3MImTGIy5KHSAW2BYnGR87RVCJgVHUXaBpk2h2iu4E1/IdcvoV+IbNhWkV84P8=
X-Google-Smtp-Source: AGHT+IHbp9wOFrO1SkNO6WzB2H/fU/TzpSrSe3leUbz4VtA3oLSlfJuw20kTGWTmxfT3qU3LVn6SeK5IMX2rO1fxgDU=
X-Received: by 2002:a05:6808:6f8c:b0:450:c6a0:3f24 with SMTP id
 5614622812f47-451159c8702mr19472996b6e.11.1764683004472; Tue, 02 Dec 2025
 05:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20251118105934.748955-1-rk0006818@gmail.com>
 <20251118105934.748955-4-rk0006818@gmail.com>
 <CAKY2RyYgvr3z_KZKjEgcVLqKZ8Sq0hb+eoXkhFTPfFqU3N=STg@mail.gmail.com>
 <aS7qty8ABRjwQWaF@e142607>
In-Reply-To: <aS7qty8ABRjwQWaF@e142607>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 2 Dec 2025 19:13:08 +0530
X-Gm-Features: AWmQ_bkJkoEXIw6V4svUNsdFc7jyreMsIOYqlpQGp5KPHTGOvAIcSrYS5JGu5T0
Message-ID: <CAKY2RyZ-VnfhSSJ+BnvVLBRp6XUo+Mnv-oGwNXQZ9oZMWkVjQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/komeda: Convert logging in d71_dev.c to drm_*
 with drm_device parameter
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Dec 2, 2025 at 7:04=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com> wr=
ote:
>
> On Tue, Nov 25, 2025 at 12:15:28PM +0530, Rahul Kumar wrote:
> > Hi Liviu,
>
> Hi Rahul,
>
> Sorry, you caught me with your new series just before going on holiday so
> did not started the review. Since coming back I had some other internal
> issues to take care of, I will have a look at your series next week when
> I should have more time for it.
>
> Best regards,
> Liviu
>

Hi Liviu,

Thanks for the update. No worries at all, I appreciate you letting me know.
Please take your time, and I'm happy to make any changes once you
review the series.

Best regards,
Rahul

> >
> > On Tue, Nov 18, 2025 at 4:32=E2=80=AFPM Rahul Kumar <rk0006818@gmail.co=
m> wrote:
> > >
> > > Replace DRM_DEBUG() and DRM_ERROR() calls in
> > > drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c with the
> > > drm_dbg() and drm_err() helpers in functions where a drm_device
> > > parameter is available.
> > >
> > > The drm_*() logging macros require a struct drm_device * parameter,
> > > which allows the DRM core to prefix log messages with the device
> > > instance. This improves debugging clarity when multiple Komeda or
> > > other DRM devices are present.
> > >
> > > Logging in early hardware probing functions such as d71_identify()
> > > is intentionally left unchanged because they do not have access to
> > > a drm_device pointer at that stage of initialization.
> > >
> > > This conversion follows the DRM TODO entry:
> > > "Convert logging to drm_* functions with drm_device parameter".
> > >
> > > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> > > ---
> > > Changes since v1:
> > > - Fixed incorrect use of dev_get_drvdata(): it returns struct komeda_=
drv *,
> > >   not struct komeda_kms_dev *, as pointed out by Liviu Dudau.
> > > - Updated DRM device pointer retrieval to use drv->kms.
> > > - Combined both changes into a 0/3 series.
> > > Link to v1:
> > > https://lore.kernel.org/all/aRdT1qscQqO7-U6h@e110455-lin.cambridge.ar=
m.com/
> > > ---
> > >  .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 24 +++++++++++++----=
--
> > >  1 file changed, 17 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drive=
rs/gpu/drm/arm/display/komeda/d71/d71_dev.c
> > > index 80973975bfdb..39c51bbe2bb9 100644
> > > --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> > > +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> > > @@ -9,6 +9,7 @@
> > >  #include <drm/drm_print.h>
> > >  #include "d71_dev.h"
> > >  #include "malidp_io.h"
> > > +#include "komeda_drv.h"
> > >
> > >  static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
> > >  {
> > > @@ -348,6 +349,9 @@ static void d71_cleanup(struct komeda_dev *mdev)
> > >
> > >  static int d71_enum_resources(struct komeda_dev *mdev)
> > >  {
> > > +       struct komeda_drv *drv =3D dev_get_drvdata(mdev->dev);
> > > +       struct komeda_kms_dev *kms =3D drv->kms;
> > > +       struct drm_device *drm =3D &kms->base;
> > >         struct d71_dev *d71;
> > >         struct komeda_pipeline *pipe;
> > >         struct block_header blk;
> > > @@ -366,7 +370,7 @@ static int d71_enum_resources(struct komeda_dev *=
mdev)
> > >
> > >         err =3D d71_reset(d71);
> > >         if (err) {
> > > -               DRM_ERROR("Fail to reset d71 device.\n");
> > > +               drm_err(drm, "Fail to reset d71 device.\n");
> > >                 goto err_cleanup;
> > >         }
> > >
> > > @@ -376,8 +380,8 @@ static int d71_enum_resources(struct komeda_dev *=
mdev)
> > >         d71->num_pipelines =3D (value >> 8) & 0x7;
> > >
> > >         if (d71->num_pipelines > D71_MAX_PIPELINE) {
> > > -               DRM_ERROR("d71 supports %d pipelines, but got: %d.\n"=
,
> > > -                         D71_MAX_PIPELINE, d71->num_pipelines);
> > > +               drm_err(drm, "d71 supports %d pipelines, but got: %d.=
\n",
> > > +                       D71_MAX_PIPELINE, d71->num_pipelines);
> > >                 err =3D -EINVAL;
> > >                 goto err_cleanup;
> > >         }
> > > @@ -455,8 +459,8 @@ static int d71_enum_resources(struct komeda_dev *=
mdev)
> > >                 offset +=3D D71_BLOCK_SIZE;
> > >         }
> > >
> > > -       DRM_DEBUG("total %d (out of %d) blocks are found.\n",
> > > -                 i, d71->num_blocks);
> > > +       drm_dbg(drm, "total %d (out of %d) blocks are found.\n",
> > > +               i, d71->num_blocks);
> > >
> > >         return 0;
> > >
> > > @@ -555,6 +559,9 @@ static void d71_init_fmt_tbl(struct komeda_dev *m=
dev)
> > >
> > >  static int d71_connect_iommu(struct komeda_dev *mdev)
> > >  {
> > > +       struct komeda_drv *drv =3D dev_get_drvdata(mdev->dev);
> > > +       struct komeda_kms_dev *kms =3D drv->kms;
> > > +       struct drm_device *drm =3D &kms->base;
> > >         struct d71_dev *d71 =3D mdev->chip_data;
> > >         u32 __iomem *reg =3D d71->gcu_addr;
> > >         u32 check_bits =3D (d71->num_pipelines =3D=3D 2) ?
> > > @@ -569,7 +576,7 @@ static int d71_connect_iommu(struct komeda_dev *m=
dev)
> > >         ret =3D dp_wait_cond(has_bits(check_bits, malidp_read32(reg, =
BLK_STATUS)),
> > >                         100, 1000, 1000);
> > >         if (ret < 0) {
> > > -               DRM_ERROR("timed out connecting to TCU!\n");
> > > +               drm_err(drm, "timed out connecting to TCU!\n");
> > >                 malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_M=
ODE);
> > >                 return ret;
> > >         }
> > > @@ -582,6 +589,9 @@ static int d71_connect_iommu(struct komeda_dev *m=
dev)
> > >
> > >  static int d71_disconnect_iommu(struct komeda_dev *mdev)
> > >  {
> > > +       struct komeda_drv *drv =3D dev_get_drvdata(mdev->dev);
> > > +       struct komeda_kms_dev *kms =3D drv->kms;
> > > +       struct drm_device *drm =3D &kms->base;
> > >         struct d71_dev *d71 =3D mdev->chip_data;
> > >         u32 __iomem *reg =3D d71->gcu_addr;
> > >         u32 check_bits =3D (d71->num_pipelines =3D=3D 2) ?
> > > @@ -593,7 +603,7 @@ static int d71_disconnect_iommu(struct komeda_dev=
 *mdev)
> > >         ret =3D dp_wait_cond(((malidp_read32(reg, BLK_STATUS) & check=
_bits) =3D=3D 0),
> > >                         100, 1000, 1000);
> > >         if (ret < 0) {
> > > -               DRM_ERROR("timed out disconnecting from TCU!\n");
> > > +               drm_err(drm, "timed out disconnecting from TCU!\n");
> > >                 malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_M=
ODE);
> > >         }
> > >
> > > --
> > > 2.43.0
> >
> >
> > Just following up on my v2 Komeda logging patch series.
> > Please let me know if any changes or suggestions are needed.
> >
> > Thanks,
> > Rahul
