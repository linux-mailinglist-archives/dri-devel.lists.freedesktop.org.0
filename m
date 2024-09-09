Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0197152C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 12:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F10510E36B;
	Mon,  9 Sep 2024 10:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kWAYG9Y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BB010E36B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 10:18:55 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e116d2f5f7fso4039670276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1725877134; x=1726481934;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXL1j2tV411PkntAScb6rIKgAFaqv0ENfS30cqvdFFs=;
 b=kWAYG9Y7RiP3CIHs7yYYG7DdYNlDtOUeko2SxAxOmmHyVDx/RAvXuQCoXzxKrKMMh1
 aMs7QM/h6RqCUcpEtY5A6QPKzHgG+8IyBv9Zr//VXf96HsqLR6uysS2hItwygHt9ShJu
 +zOZ1KkwYcEE2qrnIdJvOLdJiUUQzm/E94F4uAxjN7C1qbkz9M5TtPAirsLcOmfcA+TM
 x45OEHiNdjUzaLc/obpaA3xbBgJj5nK8VmwObDmXfmvii96Yk7fbJpFAzfNdHnPVxzzu
 BPfazZdrlDuNlddu3BEyvUnBmGIm3MmfNilru0iue7GyW9mNZIFbiYeTuCzvBgxVB2vp
 sfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725877134; x=1726481934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXL1j2tV411PkntAScb6rIKgAFaqv0ENfS30cqvdFFs=;
 b=hnYCZJ9QiPDjy726b7Gom5UKev5gvCNShWmx57AHhNyBMmaYtVSL7B2ItQU+P2Oxob
 yI3t5Se620/dQKAcj91/J+JSIXZhI6r8aVo+VfG+esF5izkLdhBMsSlBhd4Uh8h64s2A
 k5kiHBWGTeCUhDhCApHDn7UJc+GaNBFgpEQZVzsIwEXVYdpKKcFm8PQvQ47X9RpS18ga
 8e/Hhg1yI8l5JEXzzRDlY0mYs1SHfFNLMSH6B/p7i2A4mfJ6CN5VQKyuxdfK7zzG6vQ7
 Lat2JntuNfMBwe9Bq0IqmbMQ6rBe8chrZTBdSj57pe+1g/3jTTyuufOpMJoupeg5bxGG
 buRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXknfvUKq8VKjeDLIgR7I39PP0gAWWI7oqMZ+2hMy02qciBU6kqXeFoY92eRmSd/1n0B8W9gPwRuRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZv0cNvxPFDxA4AjQ8o1fOZUs4JND9wKsXEqCch90JkxeSI8pX
 O95FSpQUDfoSGfnmVM4DIFa2mj2ux4/UZSQkotyIHi48t+KABNHeddTBZunnatwpyC1Yzbzm9cd
 YuDQryv+vvScMOYhrtZNsSFZs41n39L4zcxmnSw==
X-Google-Smtp-Source: AGHT+IGg+H7CMIcAgfHAMyjf21XU26L1ocR5NRCUCu1cmYYZEZfDhB49cvkQMtwd59oqMMAaEiAaP8DL29pnlOaSndc=
X-Received: by 2002:a05:6902:1895:b0:e0b:1049:f935 with SMTP id
 3f1490d57ef6-e1d3425cf96mr9361083276.6.1725877133966; Mon, 09 Sep 2024
 03:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-12-robh@kernel.org>
 <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
 <CAPY8ntAv3Xpq45ykwX_98WJKFBxqP6Os+6KvD5xzDTFz8a1idQ@mail.gmail.com>
 <CAL_JsqKjRbHCeFoZDE_wss5HMNmt8UBWa+y_8yJ6TC80xxiTOA@mail.gmail.com>
 <CAPY8ntBJL9nJupadT8T1DGeQHn++MRGKbyH5xSF94a0moqWGYw@mail.gmail.com>
 <CAL_JsqKZSk+zY49CAzDisA3kBQf46TOvN-OF+wTH=LGLGwSQUw@mail.gmail.com>
In-Reply-To: <CAL_JsqKZSk+zY49CAzDisA3kBQf46TOvN-OF+wTH=LGLGwSQUw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 9 Sep 2024 11:18:40 +0100
Message-ID: <CAPY8ntA68Gik+xi2s6YXPbydUZWNV5eqpGeMwv6z06YVEQktZA@mail.gmail.com>
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

On Fri, 6 Sept 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Sep 6, 2024 at 9:24=E2=80=AFAM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > On Wed, 4 Sept 2024 at 14:19, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Sep 4, 2024 at 6:18=E2=80=AFAM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Rob
> > > >
> > > > On Tue, 3 Sept 2024 at 20:19, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Wed, Jul 31, 2024 at 2:13=E2=80=AFPM Rob Herring (Arm) <robh@k=
ernel.org> wrote:
> > > > > >
> > > > > > Use of_property_present() to test for property presence rather =
than
> > > > > > of_find_property(). This is part of a larger effort to remove c=
allers
> > > > > > of of_find_property() and similar functions. of_find_property()=
 leaks
> > > > > > the DT struct property and data pointers which is a problem for
> > > > > > dynamically allocated nodes which may be freed.
> > > > > >
> > > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > Ping!
> > > >
> > > > Sorry, this fell through the cracks.
> > > >
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/v=
c4/vc4_hdmi.c
> > > > > > index d57c4a5948c8..049de06460d5 100644
> > > > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > > > @@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4=
_hdmi *vc4_hdmi)
> > > > > >         struct device *dev =3D &vc4_hdmi->pdev->dev;
> > > > > >         struct platform_device *codec_pdev;
> > > > > >         const __be32 *addr;
> > > > > > -       int index, len;
> > > > > > +       int index;
> > > > > >         int ret;
> > > > > >
> > > > > >         /*
> > > > > > @@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4=
_hdmi *vc4_hdmi)
> > > > > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) !=3D=
 0);
> > > > > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) !=3D 0);
> > > > > >
> > > > > > -       if (!of_find_property(dev->of_node, "dmas", &len) || !l=
en) {
> > > > > > +       if (!of_property_present(dev->of_node, "dmas")) {
> > > >
> > > > The existing conditional is true if the property is not present or =
is 0 length.
> > > > Your new one is only true if the property isn't present, so it isn'=
t the same.
> > >
> > > It is not the kernel's job to validate the DT. It does a terrible job
> > > of it and we have better tools for that now (schemas (though RPi
> > > platforms are in a pretty sad state for schemas)). I'm pretty sure a
> > > zero length or otherwise malformed "dmas" property would also cause a
> > > dtc warning as well. Non-zero length is hardly a complete test
> > > anyways. Any bogus value of "dmas" would pass. Or it can be completel=
y
> > > valid, but the DMA driver is not enabled (whether you even probe
> > > depends on fw_devlinks).
> > >
> > > The kernel should just parse the properties it wants and handle any e=
rrors then.
> >
> > I've followed up over the rationale of this.
> >
> > The base DT enables HDMI audio.
> > On some systems there is a need to use the DMA channels for other
> > purposes and no need for HDMI audio.
>
> If that's a user decision, I wouldn't use overlays to decide that, but
> make it a run-time OS decision...

Raspberry Pi users tend to mess far more with the hardware
configuration than on most other platforms, so they do want to make
these changes when adding extra external peripherals, but they aren't
DT experts.
AFAIK configuring audio availability like that is not an option that
can really be pushed fully into userspace through any current API,
which would only leave a module parameter, and those generally seem to
be frowned upon these days.

> > As we understand it, an overlay can't remove a property from the base
> > DT, but it can set it to being empty. (Please correct us if there is a
> > way to delete an existing property).
>
> There isn't currently.
>
> > The current check therefore allows an overlay to disable the HDMI
> > audio that is enabled in the base DT. It doesn't care how long the
> > property actually is, just whether it is totally empty or not as an
> > alternative to being present.
> >
> > I understand that you may consider that abuse of DT, but that is the
> > reasoning behind it. We can drop it to a downstream patch if
> > necessary.
>
> I guess it's going to be use of_count_phandle_with_args() instead.

I'm happy with that if you are.

Thanks
  Dave

> Rob
