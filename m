Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD089646F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BEF112501;
	Wed,  3 Apr 2024 06:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="a47v2UiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5B112501
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:16:44 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513d4559fb4so7464671e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1712125002; x=1712729802;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUWOAlRew8Y9zlqvI12IsW4qhw1mXgmiBgk1qsYuJAE=;
 b=a47v2UiOus9Gp9+n4uqLeXHSdkWV/5hXeVlZYHRzTPwx8zQRzaRIiGj3wMuwfrnI/q
 ANojNisLDQnzQ7+s7YHderIWJQr2y1E56aiJkohI4K1Lhfnc5yEVFUdGlCtCSA9NxujR
 +Ie6SimHPU1gneh2p9cw0SMf4hJ5x+PKkHxOT8OazxRFPjwA3Lf6YWvbIHaCHsEhGZ2S
 wpYXgzM1KRqzbygVp4Om5pz+hVY4KPg9g9Wo6WqSPxVMrV4IsXMzCLjochiX8Yjl4B5E
 WTI660ZcwScMDx3Q0SemBA+Ff5/5oDc/5NH72bXH2TH37wptV+a3B/RkmYYP73R73E9T
 s6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712125002; x=1712729802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUWOAlRew8Y9zlqvI12IsW4qhw1mXgmiBgk1qsYuJAE=;
 b=kxrfnDIiS2DPpfEZCj9Tgl2i51xWjFnylsi1hhVTWvD9B9oVdNXFtDvEMBk4b/YxlC
 tSfd7R71zarPk+1Mt0MpQDXYWQG74F7TCff4KBpQK5EEuUEkNe+RELTk8kktrRooj/5N
 1YbbAyPJvCOURebzR08wkvPFpXM6N0L30v0gCrw9CxjSD7UaP8Tn9eRya92y6AmrUQe3
 7kfZ9ixoC8Z0rEURq9mGVLz+dD+5gdLwxxxX9Rq7neTyrlKfTkKTJDFAXZDm0mb80tuH
 LvPAtck6N1DPuMnpGWN9QLWbt3Crey5A+K+DvEotfhioo2/e/r9RUW8BNydilaiXV5bN
 YHyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1EGi52ngkfv8XHGJgZjF4rwUoshrBNPUN5c3gquhNJBexH8SFRJE+1uJAI7xjyt7Tq+sXcQeugnQDDZ89sEMHv+rHZ13x2JiZApDt4mE2
X-Gm-Message-State: AOJu0YycP4I59xcpveiAUmo6LnSAWUwo2rODulJVnsrfTmAB6fDMU9h1
 RXso4/yAPQyWBNGI/Qacz+YxpSOTbXmnW3cwqvqhkMiYZU1cAPoY+WK8KyLWwe75//Ka/1eaQS5
 4lpu2bG9zsJGiSmnRIoZrxqWBK0nB4JRbkS93MQ==
X-Google-Smtp-Source: AGHT+IHxy5L7IuAClTzOQvPqVmBmGzm4Jxd5dXHEawLJyCom6nIx29NzDwr6gHy4UOjn+UPEdfsKmGeIOhgk1vX2hCY=
X-Received: by 2002:a19:6a13:0:b0:516:a0a5:a444 with SMTP id
 u19-20020a196a13000000b00516a0a5a444mr8832014lfu.2.1712125002295; Tue, 02 Apr
 2024 23:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402105925.905144-2-alex@shruggie.ro>
 <20240402-sheet-retread-025759b22faf@spud>
In-Reply-To: <20240402-sheet-retread-025759b22faf@spud>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Wed, 3 Apr 2024 09:16:31 +0300
Message-ID: <CAH3L5QooAXDYAxOdMkPrW1mx04ZgTv_kMU5VSAby9J3Hb_RFOg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: bridge: lt8912b: document
 'lontium,pn-swap' property
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, adrien.grassein@gmail.com, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, 
 marius.muresan@mxt.ro, irina.muresan@mxt.ro
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

On Tue, Apr 2, 2024 at 9:06=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Tue, Apr 02, 2024 at 01:59:25PM +0300, Alexandru Ardelean wrote:
> > On some HW designs, it's easier for the layout if the P/N pins are swap=
ped.
> > The driver currently has a DT property to do that.
>
> "currently", because 1/2 adds it. bindings patches should precede the
> driver patches in the series, so please swap the patches and remove this
> portion of the description.

ack;
i'll invert the order and remove this;

>
> >
> > This change documents the 'lontium,pn-swap' property.
> >
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,l=
t8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt89=
12b.yaml
> > index 2cef252157985..3a804926b288a 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.=
yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.=
yaml
> > @@ -24,6 +24,12 @@ properties:
> >      maxItems: 1
> >      description: GPIO connected to active high RESET pin.
> >
> > +  lontium,pn-swap:
> > +    description: Swap the polarities of the P/N pins in software.
> > +      On some HW designs, the layout is simplified if the P/N pins
> > +      are inverted.
>
> Please explain what configuration of a board would cause these to be
> swapped, rather than why someone might want to configure the board this
> way. I've got no idea what this hardware is actually doing, so this is
> being pulled out of a hat, but I'd expect something like "Some boards
> swap the polarity of the P/N pins, use this property to indicate this to
> software".

ack
if it's fine with you, i'll use your suggested description;

for a broader context, we were using a DSI-HDMI converter [1] from
SomLabs on a different (than SomLabs) board;
and we were not seeing anything on the HDMI-connected display;
as I understand it, some DSI-HDMI bridges support P/N auto-inversion;
this one doesn't AFAICT;
on this DSI-HDMI converter [1], we've noticed that the P/N pins were
inverted from the DSI to the chip (vs what we expected to see)
after changing the register value (for the P/N swap), it worked;
our conclusion was that, the design of the converter (board) was done
as-such, because it made the layout easier

[1] https://wiki.somlabs.com/index.php/SL-MIPI-LVDS-HDMI-CNV-11_Datasheet_a=
nd_Pinout

>
> > +    type: boolean
>
> The type here should be flag.

ack; i'll change the type

>
> Cheers,
> Conor.
>
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > --
> > 2.44.0
> >
