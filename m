Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B110596BA09
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 13:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B8110E764;
	Wed,  4 Sep 2024 11:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jaL02/lA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7E210E764
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:18:25 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e1a90780f6dso4212739276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1725448704; x=1726053504;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THCoybtCjhxZhory7lq+TeYRAfxYhOty2574FQtkWoM=;
 b=jaL02/lA/bYHorT5z4OvylI2IEfhwFy3hDcW7WFmJBxRjRYH5gQJsDXDV4RNIUcwaR
 hg7M2/Tvg509OPkJI2SzZMyJJmlGvJ0V+4DTbyP6QH9WFPW8V31TwazSy0MYRxP723bJ
 7dsuEm5q7n2WpJ2g8YsdIyNnanoSFGyr45nQlf+HXbXPwGCncJUA+ZLx5W416VbDDg08
 shvBSRqdnYtRfiahFnRbsASZvgIIWOfFskfLm+nptjIF3xoUlKbff5gLe3tQzOBGT7Kd
 AJaiOwQRdwkfLxQlkMcIRn0/hhJXH4IdNc/OUw9rVHndDXWdrAwFI35jguW8yaVPB7+9
 pFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725448704; x=1726053504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THCoybtCjhxZhory7lq+TeYRAfxYhOty2574FQtkWoM=;
 b=CtVq9r5YxYysFs+WiUNJC0Ibv2rIHg/Fq50sRJAe6PZpPdpTfgkQvytkOATxFbDZ7V
 0p+BJs1LZ+v/LK8ynKVlMMuPeCKmdeJhRTlJ23VwluU10PSpHpRkhuDdkx4sG3eM3xec
 Qu+Cw0sJuyRqGgPN8G7DprqDIDW9qYRTQfy4qycv5Uojnn4gvgs0zn90vyLfH8OqdAZr
 mOWMT9vDN6/ynWNUAV3klouru3nDtuPtQUw2I3OqkkYbCkxR1Dqns49/UQZkLhnAS6wC
 wl6Cmo3V+6fc6/cogQpTcKD7uYfQVyMhxb6DgIy9TIgSJqlcNB6TcEcbuw9dC8RPnEDQ
 Ld2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyHeHLPVH/LstNOlBbjy77Nv2upQ7lFRTWxa7BfswUBQ4A7HTKShduTX3CheUGw8tXcu+gZK0vM5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAmGK3p53doQg6Aw5PbDo+cZbLJsulkRDMczTX9qEGcCMrPJMv
 tfI3cBJPSQdPF7Etw6Abkm9rfYPSTrwXQ7KKjQ0h8aoXXS6g5q0thvQWopCPvsKq2+Ie2AU3H2C
 K8vJp7pMIceGIm1z1WbRWX5vaBMid2/3q/+EgVg==
X-Google-Smtp-Source: AGHT+IGHwLyRn3KC291dpi3j6eIC+AUeCwsK7HHAdhWXMt49M/gC4aJ25UuW0e/7G89DA17z432TxYT+QHbeAI3HDoo=
X-Received: by 2002:a05:6902:2b04:b0:e1a:732c:d980 with SMTP id
 3f1490d57ef6-e1a7a02d66bmr21532499276.29.1725448704650; Wed, 04 Sep 2024
 04:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-12-robh@kernel.org>
 <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
In-Reply-To: <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 4 Sep 2024 12:18:07 +0100
Message-ID: <CAPY8ntAv3Xpq45ykwX_98WJKFBxqP6Os+6KvD5xzDTFz8a1idQ@mail.gmail.com>
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

Hi Rob

On Tue, 3 Sept 2024 at 20:19, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jul 31, 2024 at 2:13=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
> >
> > Use of_property_present() to test for property presence rather than
> > of_find_property(). This is part of a larger effort to remove callers
> > of of_find_property() and similar functions. of_find_property() leaks
> > the DT struct property and data pointers which is a problem for
> > dynamically allocated nodes which may be freed.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Ping!

Sorry, this fell through the cracks.

> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index d57c4a5948c8..049de06460d5 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *v=
c4_hdmi)
> >         struct device *dev =3D &vc4_hdmi->pdev->dev;
> >         struct platform_device *codec_pdev;
> >         const __be32 *addr;
> > -       int index, len;
> > +       int index;
> >         int ret;
> >
> >         /*
> > @@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *v=
c4_hdmi)
> >         BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) !=3D 0);
> >         BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) !=3D 0);
> >
> > -       if (!of_find_property(dev->of_node, "dmas", &len) || !len) {
> > +       if (!of_property_present(dev->of_node, "dmas")) {

The existing conditional is true if the property is not present or is 0 len=
gth.
Your new one is only true if the property isn't present, so it isn't the sa=
me.

Is there a more appropriate of_ call to return the length of the property?

Thanks
  Dave

> >                 dev_warn(dev,
> >                          "'dmas' DT property is missing or empty, no HD=
MI audio\n");
> >                 return 0;
> > --
> > 2.43.0
> >
