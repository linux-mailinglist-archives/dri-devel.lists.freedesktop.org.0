Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9989B84B9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13910E92A;
	Thu, 31 Oct 2024 20:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gnhMAKa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38AF10E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:56:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53a007743e7so1560192e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730408182; x=1731012982; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wcGe16S8C8s7dwE7spgvv4ewwqDlWbIAjr6C3TYG2q0=;
 b=gnhMAKa6slDRxcoamOr6dGfkgaezzKZeN0b2jRQC5BdLBc5n5VMG//IGL1vWcIKiqx
 VpYtscmhLrOKHHL0dYv3ov3Lo+83lC8iZB1DwzIj6FIqR+dGSSCIqS1DJI950AnqFz+I
 O+ilUgbuegVrB/7B83HP+DC/BSnt9ZzeDv1zx0eUG786aenb9P7d1zB1IX4tzkvera88
 BFk7kBpbu63oxWCsT5hfWbOiItwz7SM/zHVz3ZB3l+D4eyAAOTLT/nm5QQuxjsPbsuqj
 2ckQEGpyKJsL68Us+k7qWTIyAHL/mDzYchrmibLmD+ct3nShJ/0po30NsozXf9bH5VMA
 Qr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730408182; x=1731012982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wcGe16S8C8s7dwE7spgvv4ewwqDlWbIAjr6C3TYG2q0=;
 b=l4Pz3UHKUZkq9v8tRH6Q+Tdpjr7YbJDTWQFowmwC2zNtqBQYwfbDqa0Jfjopi0oY2n
 eaRnPdVGmEzrYX78d5us2Gf9uRPbTBNmgMfkTNSjPj8s8Q/lYM/VyjoUekaw0/FW2DlD
 dMHt8iFEfVhaf68mvQQ/+Lx/LfqqIJg1Zhz0D5wiKRgkYTBgWkEisx/08zooX433hyET
 QdO7CnnL45PXjIKqvQMYVtyPwJSoljYiFLVjz5dwn7q4tmw/WYpO4rWEdU3brbzD4QY2
 Jmz7DtjEnTIbhrOZ8hHjDPD/fC2+MNkqZpttC7+QHk2/RiFOxxo/0/MyaRIb6Yd98yhq
 9W0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYg4OvM4Vbc6sua7QiJjW5VAokRp8VED6SMv5S3yfBC1kXt4LI92/wAakPXyQdYwQyx8RhLddQA60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxlCTQ/FNCQoFJ1b5BS6wHTWUQVnkVvdLhqRubZq2BO3LNXv7S
 PESfZKkcikUW5Iw3JAxhJHllKaS6SWiX93iDt75vKVy4g4IfkjXvklNX8IPJqx8=
X-Google-Smtp-Source: AGHT+IH1Dxv4hPTZoRhxByuTLT7M0QZnSUS3wobA+1jRRApV2idHM9Yb0PVuIF7o5aoJiS6cP3lHOQ==
X-Received: by 2002:a2e:4c12:0:b0:2f6:6074:db71 with SMTP id
 38308e7fff4ca-2fdec5f831amr20876381fa.17.1730408182016; 
 Thu, 31 Oct 2024 13:56:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef8a66b8sm3316571fa.78.2024.10.31.13.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 13:56:20 -0700 (PDT)
Date: Thu, 31 Oct 2024 22:56:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Message-ID: <xmfohy6lpyfdc33gqt7vyagfqfhqwyb67id6gla6ydmah6ryuu@jll5fz2wx7dg>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
 <22f3pkf63uphnx3opld6ibkhptbtxqoguqgu6iswb6w4hzkxxd@pwbdwjdodcnc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f3pkf63uphnx3opld6ibkhptbtxqoguqgu6iswb6w4hzkxxd@pwbdwjdodcnc>
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

On Thu, Oct 31, 2024 at 09:55:45PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 29, 2024 at 02:02:11PM +0800, Sandor Yu wrote:
> > Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v17->v18:
> > - remove lane-mapping and replace it with data-lanes
> > - remove r-b tag as property changed.
> > 
> > v16->v17:
> > - Add lane-mapping property
> > 
> > v9->v16:
> >  *No change
> > 
> >  .../display/bridge/cdns,mhdp8501.yaml         | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > new file mode 100644
> > index 0000000000000..e4b900ecf1ac9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cadence MHDP8501 DP/HDMI bridge
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandor.yu@nxp.com>
> > +
> > +description:
> > +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-mhdp8501
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: MHDP8501 DP/HDMI APB clock.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description:
> > +      phandle to the DP/HDMI PHY
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Hotplug cable plugin.
> > +      - description: Hotplug cable plugout.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: plug_in
> > +      - const: plug_out
> > +
> > +  data-lanes:
> > +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> > +    minItems: 4
> > +    maxItems: 4
> > +    description: Lane reordering for HDMI or DisplayPort interface.
> 
> So, HDMI or DP port? I don't think the format is actually the same, so
> it is either-or.

Please ignore this, I've misread the text.


-- 
With best wishes
Dmitry
