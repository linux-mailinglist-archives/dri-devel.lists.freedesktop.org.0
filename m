Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08191B8E7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0786A10E10E;
	Fri, 28 Jun 2024 07:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QNhxyMSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A3610E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:49:23 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso3318911fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719560961; x=1720165761; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3n4lUcycdMQ3kKfIM5iWr5aZZYsbiBaz6fBAdV+RFUA=;
 b=QNhxyMSgS/di2prqi4Qz/uCxeIb6mkwJ224d0iQPLbx7kramdT+440IQx8DxTqSS9D
 kifMtqiekS5xC+KGonHKk3yUIR3cgI4mi2NWu5x0kaNsMSYo7bBIiSp9WxACYXXMrBNc
 Xw7PfeMIcx3QdraVEWYBklGOaO8Oqlq8DLnqI4vl+7uUQxiN9ccKh15Fs+vuKe0vTu3l
 vIiw/rGctKYUpYFNMH42hnsK4J7x2DaTivohYWX1GHfRwhayDXtiBmYkgs9bycbG1nUP
 ElIhD6gKV9BStfv2ZIuRdrQefyPhoRzssXeUZnOy76t1uKBcPcd6S7tu8Up5zKePHY+e
 Vz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719560961; x=1720165761;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3n4lUcycdMQ3kKfIM5iWr5aZZYsbiBaz6fBAdV+RFUA=;
 b=wGSguAYfVeavckn/1GzRaUxKV7jMWb1NiTtqVLBq8hlF/WGko+E+8pc8ygM+9lKtRQ
 fCnoV557dVT47VoT/oJdwKVhtCEo1eZRmzvGTlt/WejsHb7xu5bjJPo3h9iP9l470XAD
 DNuwUVnUdhoLiMIj4SsEcunwJICmLrUvmL2MXXkQR/QvgjvyhKVb7+YJS+7ksgJ7dSeh
 9KNR5pGjO9grmvGah9nu+fAN3cHKDV416C0Dy2d8n04Vnm+3Z4l7NNW++3IIIq9DhuJf
 0LvjFU9OcNQlXsY33k+4Tw6CtBH4IUWGmXUx18yx6JqSt6+syM73R1ahcuuzs6vSXhOg
 GY7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpKixc/gHASOU9dKfJmRzPcGZBTweeRmD9G2bDkeWY5e8xiX0FjFLed3EFf09IG3ViWZPbWUIs5NaIfQYfrDtE1AZ+YZQonHwyFf+qTVpX
X-Gm-Message-State: AOJu0Ywc8MeJxGBDuwQv07Hm1/mwbrdSE7BX1ZIb22J8iaABrIT4APHo
 J8HJjjg+Ui7vacCDX3GCldz5dXGiPBA66zmqoLzbV6qTvznFFa+Cw7Gwos6veCA=
X-Google-Smtp-Source: AGHT+IFgdWWt6QizMbUEw8zOQHS4r9yxk4aTjYOpJkS9saJqX2dR+ej/kTOnXMw05r8RHY1JZr9nMw==
X-Received: by 2002:a19:5f5a:0:b0:52c:c9b6:df0f with SMTP id
 2adb3069b0e04-52cdf8260f2mr9926203e87.61.1719560960944; 
 Fri, 28 Jun 2024 00:49:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab27b6bsm196141e87.156.2024.06.28.00.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 00:49:20 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:49:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Conor Dooley <conor@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <3wwp34miu2pibsylv3v2sjzyeso2ugslutm2zqnddlx4ipily2@bcrfetrjngft>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240627-display-quantum-48c2fa48ed1a@spud>
 <2fe0c2c0-2f67-4549-b62f-3b9db005d3f7@freebox.fr>
 <46d7c95f-20b0-4526-8583-1d8878afaa2f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46d7c95f-20b0-4526-8583-1d8878afaa2f@kernel.org>
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

On Fri, Jun 28, 2024 at 09:36:57AM GMT, Krzysztof Kozlowski wrote:
> On 27/06/2024 18:45, Marc Gonzalez wrote:
> > On 27/06/2024 18:25, Conor Dooley wrote:
> > 
> >> On Thu, Jun 27, 2024 at 01:13:03PM +0200, Marc Gonzalez wrote:
> >>
> >>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> >>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> >>> It supports 4 TMDS channels, HPD, and a DDC interface.
> >>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> >>> for power reduction. Several methods of power management are
> >>> implemented to reduce overall power consumption.
> >>> It supports fixed receiver EQ gain using I2C or pin strap to
> >>> compensate for different lengths input cable or board traces.
> >>>
> >>> Features
> >>>
> >>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> >>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> >>> data rate, compatible with HDMI 2.0b electrical parameters
> >>> - DisplayPort dual-mode standard version 1.1
> >>> - Programmable fixed receiver equalizer up to 15.5dB
> >>> - Global or independent high speed lane control, pre-emphasis
> >>> and transmit swing, and slew rate control
> >>> - I2C or pin strap programmable
> >>> - Configurable as a DisplayPort redriver through I2C
> >>> - Full lane swap on main lanes
> >>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> >>>
> >>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> >>>
> >>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >>> ---
> >>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> >>>  1 file changed, 51 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >>> new file mode 100644
> >>> index 0000000000000..21c8585c3bb2d
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >>> @@ -0,0 +1,51 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: TI TDP158 HDMI to TMDS Redriver
> >>> +
> >>> +maintainers:
> >>> +  - Arnaud Vrac <avrac@freebox.fr>
> >>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: ti,tdp158
> >>> +
> >>> +  reg:
> >>> +    description: I2C address of the device
> >>
> >> Is reg not required? How do you communicate with the device if the i2c
> >> bus is not connected? Is the enable GPIO enough to operate it in some
> >> situations?
> >>
> >> Otherwise this looks good to me, but given Maxime commented about the
> >> complexity of the device, I'm probably out of my depth!
> > 
> > Valid question.
> > 
> > As discussed in my brilliantly expanded commit message (:p)
> > the device can be configured in various ways, either through I2C registers
> > or by pin strap. We use the device in its default settings, so we don't
> > touch any I2C registers, thus I'm not sure the reg property is required.
> 
> But then how would it be represented in the DT? Where / under which parent?
> 
> If this is supposed to be always in I2C bus in DT, then you always need
> reg. If you could place it in other place, then your reasoning is valid
> - reg is optional.

As far as I understood, the device is connected to I2C bus, it just
doesn't need to be programmed. So I'd conclude that reg is required.

-- 
With best wishes
Dmitry
