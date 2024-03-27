Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7111C88D53A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 04:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82710F794;
	Wed, 27 Mar 2024 03:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jUXMkCNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9B10F794;
 Wed, 27 Mar 2024 03:51:57 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e6fb9a494aso5008168b3a.0; 
 Tue, 26 Mar 2024 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711511517; x=1712116317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmokegW/aYOBSsEsNTcEzid1Q/wMq3xKUwCpHBJxfNU=;
 b=jUXMkCNTTaOM8Ot1wyKLq6vsj2leCXZ28+8W3KN/4xeVerlEuOJYHwCA+d5AFHEDSc
 218pCHwtf3PH2NS3UOP+1V6BsKmTIsrzYKVGiEAyO4VrpM7ZuwpIbyMSoatNVQheBrBe
 GS23+Ck/KEZwpIhAzExI6dcevEne/b/9anW3dRCDWphbQjEZ8FVG7h7KalLJEg6qQ+Sf
 aAsfQjtciJMLLZCdzyEWCQpjLXsBMkq2EvpRjEWJHtkkT6HmKZXdfHo5AaGsQBXfSKT5
 mGuVg1qKo7aLAQvUl2LJgztRAhHj9QZXNE4rmtXbZX6YFIffM5Y8NlyyASAah9Nk6L+v
 rujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711511517; x=1712116317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmokegW/aYOBSsEsNTcEzid1Q/wMq3xKUwCpHBJxfNU=;
 b=LhrSkgcPkr1D2MuS/wfYU6dyUezmP6krMDps/aF8Fcz6dh+qBlz8XUr44XilyWDoc2
 D51r6nqmPGoHLnse1UgRpuOhwzJQd12Ud9LTJIGXLNgp1YJPBzGqXSQqH2LoB5isaQO6
 8YhTAzKE7jidKJgcX16zVfvVYaxcM+gAoV6yUjKdpCui9cp37vSpMYixNSsq+StYNADp
 wuKazo8SE8uboofbP0OG2cYcV8rkKWcMKsmFDnCdEKlywYz8xkmLwkoIXC7S0wonzkvd
 ODZd6zaZK5WKvBlVa1vw12aFCYqhWyxbk8UoNsCX6Q9k7yzTOjfWleKCQuv+vd62rcR6
 EN8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBIw9V7C2ddAvu43sM2BrX8D0TzsLNHZz9omvRoybp3+MxNxmBEi8OhZdyN/D2jIFxfOgO0r1GyWQNyqYiR+m9QP9bu3oJmDFrmRC1m7GpC8NbY1OfXDZkmA1mcjXZ6OElzCp+AXt1Agm4iwMDGA==
X-Gm-Message-State: AOJu0YxircGSwRG8Xz58m0sFkyFKbWy2dGIiF5dMO/Z/8J1YN/tlQ87C
 krJT/X1JMmruAoh6pgKUm3aRO3lFd/C6Kxbnlhmpl4sCjCDJdYwePCyzPUNihV/tpADmWkWopjx
 iCUvrrhfVZDz7+PstFXO7GenxdbU=
X-Google-Smtp-Source: AGHT+IGUsPYb9972j6yCMOmaks7UNYlKIisX9svjagf58yyhiFOkRq2is776kHhGpq8sJnFdM7jJUN9HgOUaw6O9Yng=
X-Received: by 2002:a05:6a21:1706:b0:1a3:e46d:1a03 with SMTP id
 nv6-20020a056a21170600b001a3e46d1a03mr601803pzb.24.1711511517237; Tue, 26 Mar
 2024 20:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240131075703.24600-1-maqianga@uniontech.com>
 <A65A2F93D9F165EC+20240313141827.40f30bd5@john-PC>
 <BL1PR12MB5144F6A9CAB0504C8AD5728CF7292@BL1PR12MB5144.namprd12.prod.outlook.com>
 <933F2B53EE8DA7B7+20240327113100.6742ccd5@john-PC>
In-Reply-To: <933F2B53EE8DA7B7+20240327113100.6742ccd5@john-PC>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Mar 2024 23:51:45 -0400
Message-ID: <CADnq5_OrMX=hVyLHWZecy8N6=dUaFOrMF+pf_2GTMRB3-iWskg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit before
 hpd initialization
To: Qiang Ma <maqianga@uniontech.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>, 
 "sunran001@208suo.com" <sunran001@208suo.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Mar 26, 2024 at 11:41=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> =
wrote:
>
> On Thu, 14 Mar 2024 14:40:40 +0000
> "Deucher, Alexander" <Alexander.Deucher@amd.com> wrote:
>
> > [Public]
> >
> > > -----Original Message-----
> > > From: Qiang Ma <maqianga@uniontech.com>
> > > Sent: Wednesday, March 13, 2024 2:18 AM
> > > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
> > > Christian <Christian.Koenig@amd.com>; Pan, Xinhui
> > > <Xinhui.Pan@amd.com>; airlied@gmail.com; daniel@ffwll.ch;
> > > SHANMUGAM, SRINIVASAN <SRINIVASAN.SHANMUGAM@amd.com>;
> > > sunran001@208suo.com Cc: amd-gfx@lists.freedesktop.org;
> > > dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org
> > > Subject: Re: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack
> > > bit before hpd initialization
> > >
> > > On Wed, 31 Jan 2024 15:57:03 +0800
> > > Qiang Ma <maqianga@uniontech.com> wrote:
> > >
> > > Hello everyone, please help review this patch.
> >
> > This was applied back in January, sorry if I forget to reply.
> >
> > Alex
>
> Hi, Alex, it doesn't matter, please take some time to help review this
> patch.
>
> This patch mainly solves the problem that after unplugging the HDMI
> display during bios initialization, the display does not light up after
> the system starts.
>

I already reviewed and applied the patch.  It's in mainline:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Daeaf3e6cf84282500b6fa03621b0c225ce1af18a

Alex

> Qiang Ma
> >
> > >
> > >   Qiang Ma
> > >
> > > > Problem:
> > > > The computer in the bios initialization process, unplug the HDMI
> > > > display, wait until the system up, plug in the HDMI display, did
> > > > not enter the hotplug interrupt function, the display is not
> > > > bright.
> > > >
> > > > Fix:
> > > > After the above problem occurs, and the hpd ack interrupt bit is
> > > > 1, the interrupt should be cleared during hpd_init initialization
> > > > so that when the driver is ready, it can respond to the hpd
> > > > interrupt normally.
> > > >
> > > > Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > > > ---
> > > > v2:
> > > >  - Remove unused variable 'tmp'
> > > >  - Fixed function spelling errors
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
> > > > drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
> > > > drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 22
> > > > ++++++++++++++++++---
> > > -
> > > > drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 22
> > > > ++++++++++++++++++---
> > > -
> > > >  4 files changed, 40 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c index
> > > > bb666cb7522e..12a8ba929a72 100644 ---
> > > > a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c +++
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c @@ -51,6 +51,7 @@
> > > >
> > > >  static void dce_v10_0_set_display_funcs(struct amdgpu_device
> > > > *adev); static void dce_v10_0_set_irq_funcs(struct amdgpu_device
> > > > *adev); +static void dce_v10_0_hpd_int_ack(struct amdgpu_device
> > > > *adev, int hpd);
> > > >  static const u32 crtc_offsets[] =3D {
> > > >     CRTC0_REGISTER_OFFSET,
> > > > @@ -363,6 +364,7 @@ static void dce_v10_0_hpd_init(struct
> > > > amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
> > > >             WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> > > > hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
> > > > +           dce_v10_0_hpd_int_ack(adev,
> > > > amdgpu_connector->hpd.hpd); dce_v10_0_hpd_set_polarity(adev,
> > > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > >                            amdgpu_connector->hpd.hpd); diff --git
> > > > a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c index
> > > > 7af277f61cca..745e4fdffade 100644 ---
> > > > a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c +++
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c @@ -51,6 +51,7 @@
> > > >
> > > >  static void dce_v11_0_set_display_funcs(struct amdgpu_device
> > > > *adev); static void dce_v11_0_set_irq_funcs(struct amdgpu_device
> > > > *adev); +static void dce_v11_0_hpd_int_ack(struct amdgpu_device
> > > > *adev, int hpd);
> > > >  static const u32 crtc_offsets[] =3D
> > > >  {
> > > > @@ -387,6 +388,7 @@ static void dce_v11_0_hpd_init(struct
> > > > amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
> > > >             WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> > > > hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
> > > > +           dce_v11_0_hpd_int_ack(adev,
> > > > amdgpu_connector->hpd.hpd); dce_v11_0_hpd_set_polarity(adev,
> > > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > > amdgpu_connector->hpd.hpd); } diff --git
> > > > a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c index
> > > > 143efc37a17f..28c4a735716b 100644 ---
> > > > a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c +++
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c @@ -272,6 +272,21 @@
> > > static
> > > > void dce_v6_0_hpd_set_polarity(struct amdgpu_device *adev,
> > > > WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > > >
> > > > +static void dce_v6_0_hpd_int_ack(struct amdgpu_device *adev,
> > > > +                            int hpd)
> > > > +{
> > > > +   u32 tmp;
> > > > +
> > > > +   if (hpd >=3D adev->mode_info.num_hpd) {
> > > > +           DRM_DEBUG("invalid hdp %d\n", hpd);
> > > > +           return;
> > > > +   }
> > > > +
> > > > +   tmp =3D RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> > > > +   tmp |=3D DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > > > +   WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > > > +
> > > >  /**
> > > >   * dce_v6_0_hpd_init - hpd setup callback.
> > > >   *
> > > > @@ -311,6 +326,7 @@ static void dce_v6_0_hpd_init(struct
> > > amdgpu_device
> > > > *adev) continue;
> > > >             }
> > > >
> > > > +           dce_v6_0_hpd_int_ack(adev,
> > > > amdgpu_connector->hpd.hpd); dce_v6_0_hpd_set_polarity(adev,
> > > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > > amdgpu_connector->hpd.hpd); } @@ -3088,7 +3104,7 @@ static int
> > > > dce_v6_0_hpd_irq(struct amdgpu_device *adev, struct amdgpu_irq_src
> > > > *source,
> > > >                         struct amdgpu_iv_entry *entry)  {
> > > > -   uint32_t disp_int, mask, tmp;
> > > > +   uint32_t disp_int, mask;
> > > >     unsigned hpd;
> > > >
> > > >     if (entry->src_data[0] >=3D adev->mode_info.num_hpd) { @@
> > > > -3101,9 +3117,7 @@ static int dce_v6_0_hpd_irq(struct
> > > > amdgpu_device *adev, mask =3D interrupt_status_offsets[hpd].hpd;
> > > >
> > > >     if (disp_int & mask) {
> > > > -           tmp =3D RREG32(mmDC_HPD1_INT_CONTROL +
> > > > hpd_offsets[hpd]);
> > > > -           tmp |=3D
> > > DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > > > -           WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> > > > tmp);
> > > > +           dce_v6_0_hpd_int_ack(adev, hpd);
> > > >             schedule_delayed_work(&adev->hotplug_work, 0);
> > > >             DRM_DEBUG("IH: HPD%d\n", hpd + 1);
> > > >     }
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c index
> > > > adeddfb7ff12..8ff2b5adfd95 100644 ---
> > > > a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c +++
> > > > b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c @@ -264,6 +264,21 @@
> > > static
> > > > void dce_v8_0_hpd_set_polarity(struct amdgpu_device *adev,
> > > > WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > > >
> > > > +static void dce_v8_0_hpd_int_ack(struct amdgpu_device *adev,
> > > > +                            int hpd)
> > > > +{
> > > > +   u32 tmp;
> > > > +
> > > > +   if (hpd >=3D adev->mode_info.num_hpd) {
> > > > +           DRM_DEBUG("invalid hdp %d\n", hpd);
> > > > +           return;
> > > > +   }
> > > > +
> > > > +   tmp =3D RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> > > > +   tmp |=3D DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > > > +   WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > > > +
> > > >  /**
> > > >   * dce_v8_0_hpd_init - hpd setup callback.
> > > >   *
> > > > @@ -303,6 +318,7 @@ static void dce_v8_0_hpd_init(struct
> > > amdgpu_device
> > > > *adev) continue;
> > > >             }
> > > >
> > > > +           dce_v8_0_hpd_int_ack(adev,
> > > > amdgpu_connector->hpd.hpd); dce_v8_0_hpd_set_polarity(adev,
> > > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > > amdgpu_connector->hpd.hpd); } @@ -3176,7 +3192,7 @@ static int
> > > > dce_v8_0_hpd_irq(struct amdgpu_device *adev, struct amdgpu_irq_src
> > > > *source,
> > > >                         struct amdgpu_iv_entry *entry)  {
> > > > -   uint32_t disp_int, mask, tmp;
> > > > +   uint32_t disp_int, mask;
> > > >     unsigned hpd;
> > > >
> > > >     if (entry->src_data[0] >=3D adev->mode_info.num_hpd) { @@
> > > > -3189,9 +3205,7 @@ static int dce_v8_0_hpd_irq(struct
> > > > amdgpu_device *adev, mask =3D interrupt_status_offsets[hpd].hpd;
> > > >
> > > >     if (disp_int & mask) {
> > > > -           tmp =3D RREG32(mmDC_HPD1_INT_CONTROL +
> > > > hpd_offsets[hpd]);
> > > > -           tmp |=3D
> > > DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > > > -           WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> > > > tmp);
> > > > +           dce_v8_0_hpd_int_ack(adev, hpd);
> > > >             schedule_delayed_work(&adev->hotplug_work, 0);
> > > >             DRM_DEBUG("IH: HPD%d\n", hpd + 1);
> > > >     }
> >
> >
>
