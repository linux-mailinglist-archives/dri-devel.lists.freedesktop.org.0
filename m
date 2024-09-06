Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA296F69B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 16:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A12810E18F;
	Fri,  6 Sep 2024 14:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kNHXbe5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5F510E18F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 14:24:45 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e1a9b40f6b3so2234425276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1725632684; x=1726237484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8upxWrhNyZy+NKkFxmG2+Tbfi/9d0hGpUln0sB+Ifk=;
 b=kNHXbe5qedess3ldSVAVYsttwbvks3Ahc03CyX/+o5DM5Jczv/8RhVwrAOxoIbPQiP
 KKoUIxLpqoulMo4HmlCOgUpz+dnGdB9C9NJy9rRLXAAd7BStxh4mNqyoFGc4BPyeq29o
 hLu1vEvFYnkoM/cxXlwI/Nepb17fqlbVQdPmsSQr1m2yuWlc2KZZKuyYEtsWEMEGMCD8
 dUg3AtOw8MTrr83ueVNoohcq7QHxb6W3GKrlPaGVx/jmTXJgke3Hf8HCeZBJsTYWRJXO
 ahw4TYxe85me6aspgAkeCGtSgPzC3or8bWi46KfSSGIn9IH/H0P4DjWHYt8+N/GdJImC
 bNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725632684; x=1726237484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8upxWrhNyZy+NKkFxmG2+Tbfi/9d0hGpUln0sB+Ifk=;
 b=NquqiJ9fkKa0UQmZM1B7Fc00F4IHw4Ujp2c2NCxdd8sIiXfEJDU1kE/tx+uo0OskNY
 FPUHH6GZln0Ufr+ktyqwmRAD/yzhPp580/OBNjHxoh0jfLjLjo/s11TvdQbJEdX85pY8
 3lq2GtBvVkOM0HFYFOYh8YRnBsY3I+0RBs++YQXd9kh3p6o6Sm8Ju7NmFf34Ab0ccAAS
 0U1ZZDud2QmXeYlWlJaXTiCgs9OimphhWtt7xKcbne4tXu855DqAQbUZDFzytUcZUQA1
 Vw7MBFpcppOX2MqosUpOKByuiPfkbY5NqEvU8KALLQP8aYOVkTydzENO4mqvVYplWH2e
 tFjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIGjhomEOIYbjM2q1Vv1F64OkTPCAFPBVKzBaluaqoCbyQHLeUIdeZgAum/IAQXGsSH0f7IqG/zeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGUDFztVR6WsP1zA7y9LpcxUv+SSfK1gIT9lpBlF3tarAABWIe
 EkMCAhVg7JuJqjwV9xXzSWy8XQM8qzXTL2bUnC2lZAbHLlVBwqMVf7bYb1FJyAVefZQNHD+jnk2
 2HPphTJH5myUJGNw6XRInqKRtrbpsSSXpx7LxQg==
X-Google-Smtp-Source: AGHT+IF4IYCGA4TBwaurNOJuIBO9gF4jdAwiekpYJjy5zBtMoqX8s84RmLYpleVlyy+Sj4InWZismzm0fDYsFOMZquQ=
X-Received: by 2002:a05:6902:2513:b0:e1d:2f11:3eb9 with SMTP id
 3f1490d57ef6-e1d3486c386mr3504573276.2.1725632684260; Fri, 06 Sep 2024
 07:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-12-robh@kernel.org>
 <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
 <CAPY8ntAv3Xpq45ykwX_98WJKFBxqP6Os+6KvD5xzDTFz8a1idQ@mail.gmail.com>
 <CAL_JsqKjRbHCeFoZDE_wss5HMNmt8UBWa+y_8yJ6TC80xxiTOA@mail.gmail.com>
In-Reply-To: <CAL_JsqKjRbHCeFoZDE_wss5HMNmt8UBWa+y_8yJ6TC80xxiTOA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 6 Sep 2024 15:24:28 +0100
Message-ID: <CAPY8ntBJL9nJupadT8T1DGeQHn++MRGKbyH5xSF94a0moqWGYw@mail.gmail.com>
Subject: Re: [PATCH] drm: vc4: Use of_property_present()
To: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, 4 Sept 2024 at 14:19, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 4, 2024 at 6:18=E2=80=AFAM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Rob
> >
> > On Tue, 3 Sept 2024 at 20:19, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Jul 31, 2024 at 2:13=E2=80=AFPM Rob Herring (Arm) <robh@kerne=
l.org> wrote:
> > > >
> > > > Use of_property_present() to test for property presence rather than
> > > > of_find_property(). This is part of a larger effort to remove calle=
rs
> > > > of of_find_property() and similar functions. of_find_property() lea=
ks
> > > > the DT struct property and data pointers which is a problem for
> > > > dynamically allocated nodes which may be freed.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > Ping!
> >
> > Sorry, this fell through the cracks.
> >
> > > >
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/v=
c4_hdmi.c
> > > > index d57c4a5948c8..049de06460d5 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > @@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdm=
i *vc4_hdmi)
> > > >         struct device *dev =3D &vc4_hdmi->pdev->dev;
> > > >         struct platform_device *codec_pdev;
> > > >         const __be32 *addr;
> > > > -       int index, len;
> > > > +       int index;
> > > >         int ret;
> > > >
> > > >         /*
> > > > @@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdm=
i *vc4_hdmi)
> > > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) !=3D 0);
> > > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) !=3D 0);
> > > >
> > > > -       if (!of_find_property(dev->of_node, "dmas", &len) || !len) =
{
> > > > +       if (!of_property_present(dev->of_node, "dmas")) {
> >
> > The existing conditional is true if the property is not present or is 0=
 length.
> > Your new one is only true if the property isn't present, so it isn't th=
e same.
>
> It is not the kernel's job to validate the DT. It does a terrible job
> of it and we have better tools for that now (schemas (though RPi
> platforms are in a pretty sad state for schemas)). I'm pretty sure a
> zero length or otherwise malformed "dmas" property would also cause a
> dtc warning as well. Non-zero length is hardly a complete test
> anyways. Any bogus value of "dmas" would pass. Or it can be completely
> valid, but the DMA driver is not enabled (whether you even probe
> depends on fw_devlinks).
>
> The kernel should just parse the properties it wants and handle any error=
s then.

I've followed up over the rationale of this.

The base DT enables HDMI audio.
On some systems there is a need to use the DMA channels for other
purposes and no need for HDMI audio.
As we understand it, an overlay can't remove a property from the base
DT, but it can set it to being empty. (Please correct us if there is a
way to delete an existing property).

The current check therefore allows an overlay to disable the HDMI
audio that is enabled in the base DT. It doesn't care how long the
property actually is, just whether it is totally empty or not as an
alternative to being present.

I understand that you may consider that abuse of DT, but that is the
reasoning behind it. We can drop it to a downstream patch if
necessary.

  Dave

> >
> > Is there a more appropriate of_ call to return the length of the proper=
ty?
>
> There are several which are all based on the data type (string, u32,
> u8, phandle+args, etc.). This case would be
> of_count_phandle_with_args(). Unless you required something like 2
> dmas entries instead of 1, I wouldn't use that here though.
>
> Rob
