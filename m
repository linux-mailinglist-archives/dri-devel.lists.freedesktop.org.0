Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764449DB999
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D47E10E237;
	Thu, 28 Nov 2024 14:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w2g7SRcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1110E237
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:29:24 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ffb5b131d0so7983301fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732804162; x=1733408962; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=;
 b=w2g7SRcE92TUkYfFCKZtwRqNMS7qyQpIBLJV96fgujEw5TzCGCmNVrdbE9Mr31dn7x
 Uf4z19EPpN1Ur6Co6Q8SwI4BjLQFb1rsio+4xd0DLLrm8Bqns48yWlELJLFT98l7Vbru
 OmFSiGu19ExyOJkC5+zBxoaHp//L7zDh8Hb3mN0sJcTOcNsmksX8rBGUo/DczCTLafyd
 bgl7FyH8Hr5uox2HGkWcV8ydaNh416qKuUU1Qcsvsqq7TAvmEvFWR+Xpznh2Cnis0dL1
 Txa17TCLrkE0WGSybji82Q5Qi1p8EXhGN3c6Yc2twdV0sU4cueUEuIEZJobiCj3zpk5v
 uS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732804162; x=1733408962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=;
 b=MO4S1BNKhykLskX5jL7TWZx948JcyPwDWHPZJ8z+uTjHIm7MD85lBnl1+PKMKeVlzG
 FwUMzuVFe/qosw/tNFeppmxKd7/ETMhcMv4ruoMQou40uYmYnlqCjexYvowq+gHweoC9
 nlc55jNF1b7MJPJCNWrGjvRDwY3f1Cr1I4uslLETeHy9z++LS2jjcFrOCKIVIQ6HTEsi
 fmxpnDsRDJOotSD66noFg88CxdXKhZUn52pV3i7hy2SBakC/vIj5lFUFxCKnRwH7rxMw
 h0Ecmn11bnrMbVzEq9NM05Wa4W4GMVIpKn22569j4BPRs33gaoW3Wm8ddUnoIDTYgEiH
 lpiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOzocU8hzSVGWf50P46cihD2KLnkT9aYi6G6fsiLpDSgOefpyS/zDDymUnWctKJAbYhOqlQoSoJnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUP9duK4jZe5bxnidW2yCGpgrApxKIBCjRb90eMsFwrytuojGN
 SwzRA4spyQauNX43HwOJoAB1h+pqWlrlE++l8XzStyfDC+YRaYVERRxxs7a15lbAf3ZgluFEjIG
 i
X-Gm-Gg: ASbGncsFB9DffjM7g82j1xoDn1FIGyfyYnuIWXlAHdrbvwoZqP+vRcs+pdJxpR6TR5W
 uhoJhkFdO5G4NqGjKDVB5tqX3/Pvjg1nLcBu6Z2vNiMkZfPh1lTq8YoobM41pt1grPR0iVBeX0/
 6t6Pmf24oDOMpo51TDkQsvDcU7pDYxmeTRlwHRWAQtkkSlDUr6FIHJpRS8O+G/bj4X9xBI/2/ox
 lyQVGSiJza1OKgqD848yYjkZ9lLwEkU+h965S0X/8nTWUJowu2hr+Qb/n37HKz6KfjiAiImbwBf
 p+dLUr8Gx3OxudXzD24K2JWJVVBpMw==
X-Google-Smtp-Source: AGHT+IHyweCAzP9pLJO4NLISzRUT/iPlUo6AXMrkwOg8DkwU8W+NduHNwNsOOPQzb40Ox1rkWfW9sg==
X-Received: by 2002:a05:651c:1607:b0:2ff:d49f:dd4a with SMTP id
 38308e7fff4ca-2ffd60293b7mr29667881fa.21.1732804162195; 
 Thu, 28 Nov 2024 06:29:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbeb8f0sm2073581fa.35.2024.11.28.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:29:20 -0800 (PST)
Date: Thu, 28 Nov 2024 16:29:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, marex@denx.de, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <3jojqg2auvktifilp5qt7tcppsfagk3zrlrmjxlnwxnehd6fwg@y7nxhhtp5t6y>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
 <20241127151630.GA3515396-robh@kernel.org>
 <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
 <20241128-mottled-nostalgic-oriole-be31ce@houat>
 <56f9bee2-74bd-4150-abab-fbc1459d7e36@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56f9bee2-74bd-4150-abab-fbc1459d7e36@norik.com>
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

On Thu, Nov 28, 2024 at 11:57:16AM +0100, Andrej Picej wrote:
> Hi Maxime,
> 
> On 28. 11. 24 11:29, Maxime Ripard wrote:
> > On Thu, Nov 28, 2024 at 09:46:33AM +0100, Andrej Picej wrote:
> > > On 27. 11. 24 16:16, Rob Herring wrote:
> > > > On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> > > > > From: Janine Hagemann <j.hagemann@phytec.de>
> > > > > 
> > > > > Add an optional property to change LVDS output voltage. This depends on
> > > > > the connected display specifications. With this property we directly set
> > > > > the LVDS_VCOM (0x19) register.
> > > > > Better register property mapping would be quite tricky. Please check
> > > > > bridge's datasheet for details on how register values set the LVDS
> > > > > data lines and LVDS clock output voltage.
> > > > > 
> > > > > Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> > > > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > > > ---
> > > > >    .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
> > > > >    1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > index 48a97bb3e2e0..5b2c0c281824 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > @@ -58,6 +58,12 @@ properties:
> > > > >                      - const: 2
> > > > >                      - const: 3
> > > > >                      - const: 4
> > > > > +              ti,lvds-vcom:
> > > > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +                description: LVDS output voltage configuration. This defines
> > > > > +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> > > > > +                  details on how register values set the LVDS data lines and
> > > > > +                  LVDS clock output voltage.
> > > > 
> > > > Constraints? 0 - 2^32 are all valid values?
> > > 
> > > Not really, only first 6 bits, which also means that this can be uint8 then.
> > > Will fix with other issues.
> > 
> > Also, generally speaking directly using register values is really
> > frowned upon, even more so when they match a value expressed in a
> > standard unit.
> 
> Yes, I am aware that this is not how devide-tree/device drivers should work.
> But setting this values based on wanted LVDS voltage will be quite tricky.
> Matching a value expressed in mV would be quite hard, take a look in the
> bridge datasheet [1], Chapter 6.5 Electrical Characteristics (|VOD|).
> Basically both:
> - LVDS data line output and
> - LVDS clock voltage
> is determined by the CSR 0x19.3:2. So when checking which Reg setting CSR
> 0x19 should be set to both conditions should meet specifications of the
> connected display. Output voltage for the same CSR 0x19 setting differs
> between LVDS data lines and LVDS clock.
> 
> Anyway, I'll prepare a v2 which only sets a part of this register, a
> bitfield (2 bits) that is responsible for LVDS differential output voltage.

Please use mV to specify the value in device tree. Yes, it's not easy.
Yes, it is still recommended for multiple reasons.

> 
> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F
> 
> Best regards,
> Andrej
> 
> > 
> > Maxime

-- 
With best wishes
Dmitry
