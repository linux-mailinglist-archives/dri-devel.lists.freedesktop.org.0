Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344E8C40A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670D110E739;
	Mon, 13 May 2024 12:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DU0tHuKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FF310E73D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:24:50 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ed96772f92so34722805ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715603089; x=1716207889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uEdXqbZ7OmVXroYRzO4MQldyt0w8o8Vs1CnZronQ5I=;
 b=DU0tHuKxBeZ7HvQhZcB8Ky64/2NHA3hHsqsxibAsaxMq58WpBYdB3zAN1KKWb2Dd7G
 PhmvfdnStc+s0Xn0mIVB3QaJ/3VFKBziN5EvNyVG/+ddwFEqMYf1H9Mmg14pFH+zLu7s
 Vzi1ysmNnRmWzofGxPyhGQWjtZx9mBDu+0ybgr4VwUj+UHRWtkCQK8Cu0hCxHzPYt3Hh
 k+tqQJVQsfjZTXozgZtBfMJomq7lQ2QKNjbYunnoBRH31jyn8C0Gsixc/AyqoGy2/7KK
 GlmBICGIxxGXyXkPngxXNVYsbdZ0bNviTJpymRF12K1X5KsCDIQhsfhNg81UfPErT4qE
 ixzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715603089; x=1716207889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uEdXqbZ7OmVXroYRzO4MQldyt0w8o8Vs1CnZronQ5I=;
 b=uhe2//Y9/ox7dT8kbXx5QWOxQzpTQXwdpDOGHJbRCRIVhOLStOEpGEkLKqcRv1KOZ5
 xpMzo+bttPpUY6/X0ILuYFcUH/n7LssZoWyB3ThMe/+QFddQ/IpEga7kxN+mIzLLhrM6
 1acWmLFpgPJbv2XtS5jFZtZmtlBubqireMNrYuT1EG+Zj9GJSE25lMqPxwBRM8t0hdLJ
 0Yx024J/kNblPDMpwVbJBbioLFErJI8z9B7h9dbgp4cypgePa6+YIcvSBeVpbF73ei1z
 tt6EkR76QMkjO9Zn1CnOUZfDqK1ZxPBBS60zrNaq+JO2CmAjRJQy6Gt5XVv/67pNq7Om
 3mtA==
X-Gm-Message-State: AOJu0YwL1GIl/7IZ/jANF3vRJ96dKk3FxQ80uQbzMDG12EYgn4ttdh0F
 7Vi7LIhhP/k+IZEreFje2VPCKmgY4BJ6VRaNkCkC4a7POyooTTThPqv7OpSEsMwaDFSMHeH2sno
 AAByiTmu+FBH+/jwViqPHWNQjIlXBtg==
X-Google-Smtp-Source: AGHT+IHdqWutAgLlnkeZq9lfl0ycFYjE0nnS3IKxHwLVKS8LDItaYXZI9kZ+SBHOfXOhLhe5WXWhAIXZE8Bv1REbIiY=
X-Received: by 2002:a17:902:e847:b0:1e0:f473:fd8b with SMTP id
 d9443c01a7336-1ef43c0f5f4mr119026505ad.9.1715603089219; Mon, 13 May 2024
 05:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240305004859.201085-1-aford173@gmail.com>
 <20240305004859.201085-2-aford173@gmail.com>
 <CAHCN7xLsEvP0A3mQJRzX=nXGr30WD4RU9vQVw9ynqzSi6cDNRg@mail.gmail.com>
In-Reply-To: <CAHCN7xLsEvP0A3mQJRzX=nXGr30WD4RU9vQVw9ynqzSi6cDNRg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 13 May 2024 07:24:36 -0500
Message-ID: <CAHCN7xJGnutJ8szxqG+AHyEU5ULOMAcn8Q21N0=FBp18EYSqmQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge
 HPD
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com, 
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Apr 16, 2024 at 4:18=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Mar 4, 2024 at 6:49=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
> >
> > The DSI to HDMI bridge supports hot-plut-detect, but the
> > driver didn't previously support a shared IRQ GPIO.  With
> > the driver updated, the interrupt can be added to the bridge.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Shawn,
>
> Patch 1/2 has been applied and sits in linux-next.  Are you OK to
> apply this to the IMX branch so the hot-plug detection can work?


Shawn,

Do you want me to repost this patch separately since patch 1/2 has
already been applied?

adam
>
> Thank you,
>
> adam
>
> adam
> > ---
> > V2:  No Change
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch=
/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> > index a08057410bde..fba8fd04398d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> > @@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
> >                 compatible =3D "adi,adv7535";
> >                 reg =3D <0x3d>, <0x3c>, <0x3e>, <0x3f>;
> >                 reg-names =3D "main", "cec", "edid", "packet";
> > +               interrupt-parent =3D <&gpio4>;
> > +               interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
> >                 adi,dsi-lanes =3D <4>;
> >                 #sound-dai-cells =3D <0>;
> >
> > --
> > 2.43.0
> >
