Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3188B9B55F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 20:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27E10E7B0;
	Wed, 24 Sep 2025 18:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+s+9hBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756410E7B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 18:15:59 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3304dd2f119so103736a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758737759; x=1759342559; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JcbuWi+Io8bnFro7IRwuS3doRGB03OgebBpyHP3b0As=;
 b=N+s+9hBnPeHTkDK+mV/v5IM3jeAztNWUJElXMAfu/iSe1eKFMnxyT27LUwid7gs61x
 qHkAcp51nysClS7ZqTqSjdvY9KrOEokdqxFP94OPZm33+Da3XgOsMOS6hkeU2FC74HkI
 PdnKxkKn4Gm7v5SzuMmERJjgIkz/SYl/VQQy3fN7fXBXDtgAZwThpqplCL8Qnqkz0M/b
 G3iR9BsP0OkSLPTCnIvebKzoMdlpluy/8QL9JspYCR5K/lJh+sEAhihn9eONVKG9zjkS
 EG/jFb6Ea6R+ZhA83HCLEYrHdCGk3djQ0tIjwhSrWXWwnyiixJ9KqaF/H7YenKGcUGjq
 +fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758737759; x=1759342559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcbuWi+Io8bnFro7IRwuS3doRGB03OgebBpyHP3b0As=;
 b=YyjGRjtxorUjd2dU3pYQiepujATdDFfVsVPycH4rwOK1g8Oe6ssLZGfbmFJr1IF+P5
 S9hpOlBZ6wscZO+c4GPnMRnOwsMe15jiT01P3vmjV8gbDQL/9tbbjbsMCXkLGu4hwIAR
 AxIglWDv2Es1ZUI8d1AiQ9DZTOASWxgcVEaQfZKK8U0BH71PEdAeEAzghVD/C58KooYg
 EgcsvLMMOJAlZkSVlrs7ADnW/qm8K+FX2075BSqUPHB4Xnvq3Kzc0YjEEhbuv2piz/Ea
 cIvfR1YHG0ViOLQF5JeH+JoC1hZQozDLDwarR1gqyO+bjqODhYu+M3N/IM21vjJzg2Ll
 zr2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzKplmGbMRWl6obv8AJ6N43OCMTf2Q8MN3kyfCuGS2nkXjl4AMkleU0wSmsoW1rc660jOEeofm7WQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoSxE1GbsJ64bPXdZD00t9PNZ8MtOOD38Gu+v5Z8rq+85IwCnk
 SmGQsqT2WtVFl4KbfYSoczXkZ0k92wb19zGB+HxHnN40ZS/QoePSa5whYOQoEKhy6yIdOtBnioe
 piCxDAqoijtrmxMTuyfCMBqaVD3K9mBM=
X-Gm-Gg: ASbGncvC1mHlJiHGkDd2w8IDqs9UE+/F+qFLvyYh0VlBurW924KvP0qclX64flHTsco
 G0KJGIX/2Bu9BYo26SNVRmtqS4Lh64GWatrdOxHsXn+r63ag/IMiW1x9vonsvdWyOFC17FFDZYg
 DYZ8Sz7J1djmIRG++y551DAyqn4/+XVyKMqIWGTlJWweOUA0wFQduOA54AJPjQDKDcNSYZXKKEv
 r6WAg==
X-Google-Smtp-Source: AGHT+IHrp5tqgdua1ITAPTFT5OarXplhOLiXY7sra+HIubTWu73xvhsas1hF0kW3xyrfI+mCZzmHvrcV1fNmRv3INHM=
X-Received: by 2002:a17:90b:2786:b0:327:e59d:2cc2 with SMTP id
 98e67ed59e1d1-3342a24776cmr760319a91.10.1758737758707; Wed, 24 Sep 2025
 11:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-3-uwu@icenowy.me>
 <20250922204349.GA1290045-robh@kernel.org>
 <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
In-Reply-To: <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 24 Sep 2025 20:15:46 +0200
X-Gm-Features: AS18NWCvbmWm8Uh8k0eTkgon1YhYqcVgJtn1frt8RyZne-mAquU2_sGmtRcjlzM
Message-ID: <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 moderated for non-subscribers <etnaviv@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

> > > > Verisilicon has a series of display controllers prefixed with DC
> > > > and
> > > > with self-identification facility like their GC series GPUs.
> > > >
> > > > Add a device tree binding for it.
> > > >
> > > > Depends on the specific DC model, it can have either one or two
> > > > display
> > > > outputs, and each display output could be set to DPI signal or
> > > > "DP"
> > > > signal (which seems to be some plain parallel bus to HDMI
> > > > controllers).
> > > >
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > > > Changes in v2:
> > > > - Fixed misspelt "versilicon" in title.
> > > > - Moved minItems in clock properties to be earlier than items.
> > > > - Re-aligned multi-line clocks and resets in example.
> > > >
> > > >  .../bindings/display/verisilicon,dc.yaml      | 127
> > > > ++++++++++++++++++
> > > >  1 file changed, 127 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > new file mode 100644
> > > > index 0000000000000..07fedc4c7cc13
> > > > --- /dev/null
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > @@ -0,0 +1,127 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Verisilicon DC-series display controllers
> > > > +
> > > > +maintainers:
> > > > +  - Icenowy Zheng <uwu@icenowy.me>
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^display@[0-9a-f]+$"
> > > > +
> > > > +  compatible:
> > > > +    const: verisilicon,dc
> > >
> > > This needs an SoC specific compatible. Generally licensed IP
> > > compatibles
> > > are useless because the specs aren't public and there's always
> > > integration quirks.
> >
> > This mimics the GPU IPs by the same vendor, see gpu/vivante,gc.yaml ,
> > which contain the exact same set of identification registers
> > (including
> > a "customer id" one that can differienate the same configured IP on
> > StarFive JH7110 and T-Head TH1520).
> >
> > If we can get vivante,gc to work w/o SoC specific compatible, then we
> > should be able to get verisilicon,dc to work too.
>
> Well maybe I should add etnaviv people to the recipient list, to allow
> them to tell us the magic behind vivante,gc .
>

Vivante GPUs are special because they contain registers that allow them to
be fully identified - see etnaviv_hw_identify(..).

We can read out the following information:
 - model
 - revision
 - product_id
 - customer_id
 - eco_id

This information, in combination with a hardware database (hwdb) in
kernel/userspace, is enough to support these GPUs/NPUs across
different SoC vendors.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
