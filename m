Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA157C0E3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 01:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DD418ABFF;
	Wed, 20 Jul 2022 23:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA5718ABFF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 23:32:39 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y2so116380ior.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 16:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uTw5TM8NIkj7Y2Npa+S/jOHSj+YeoroLMLD1j/HNVQw=;
 b=gcUYOtRucXxWEjDte5z3Uep6G4PpywkVr1sRUY3QyLCDrW8CnvkV+iy9wfNAF5gAcy
 ntHQVwV3yNzYw9umHLaUG1QYrcNb+zH/2hW0sXApy3K09WYRS2VqTu4oKv3M197Hv+E0
 g/kafRaHNDQGv7n25b90EhZ2F2vXuV8A7JzRZRCkooUEf7unGA84aLvDaP9jpLZqfgva
 2UQJObtU5hO3UyJpy/HwhTJE070lIsMzyoZSg+9/V3qiZoV8cYeZtLcq2Au5ml98iHmq
 Divoq8Q+IUWMf3reLE63KKFLS5U8xa5cqoOGCs5cbmMqpTn7t7q96yOFsSx1IP8lDH/S
 bQkQ==
X-Gm-Message-State: AJIora9h0+70kh0K/QP6x63wQeltfKl4IrrwcE11tMWmf5tL+Z+9sl60
 /E8CDj0dDBWroKKhdLw7Rw==
X-Google-Smtp-Source: AGRyM1ufbECga9pyQXyTVMLdTt5n/U5W3j3M1T/W2MXkulykIVZgEBZMlc66M25vXLcty1OcHT8LiA==
X-Received: by 2002:a05:6602:2b8a:b0:67b:c57f:b4bc with SMTP id
 r10-20020a0566022b8a00b0067bc57fb4bcmr17058794iov.55.1658359958428; 
 Wed, 20 Jul 2022 16:32:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a022413000000b0033efe711a37sm117507jaa.35.2022.07.20.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 16:32:37 -0700 (PDT)
Received: (nullmailer pid 4185445 invoked by uid 1000);
 Wed, 20 Jul 2022 23:32:35 -0000
Date: Wed, 20 Jul 2022 17:32:35 -0600
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: ti,am65x-dss: Add IO CTRL
 property for AM625 OLDI
Message-ID: <20220720233235.GA4180021-robh@kernel.org>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-3-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719080845.22122-3-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Krunal Bhargav <k-bhargav@ti.com>, Darren Etheridge <detheridge@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rahul T R <r-ravikumar@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 19, 2022 at 01:38:39PM +0530, Aradhya Bhatia wrote:
> Add am625-io-ctrl dt property to provide access to the control MMR
> registers for the OLDI TXes.
> 
> These registers are used to control the power input to the OLDI TXes as
> well as to configure them in the Loopback test mode.
> 
> The MMR IO controller device has been updated since the AM65x SoC and
> hence a newer property is needed to describe the one in AM625 SoC.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 11d9b3821409..672765ad1f30 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -118,12 +118,33 @@ properties:
>        and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>        interface to work.
>  
> +  ti,am625-oldi-io-ctrl:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description:
> +      phandle to syscon device node mapping OLDI IO_CTRL registers, for
> +      AM625 SoC. The mapped range should point to OLDI0_DAT0_IO_CTRL,
> +      and map the registers up till OLDI_LB_CTRL. This property allows
> +      the driver to control the power delivery to the OLDI TXes and
> +      their loopback control as well.

What's wrong with the existing ti,am65x-oldi-io-ctrl other than the less 
than ideal naming? And you just continued with the same issue so the 
next part will need yet another property. Sorry, no. Just use the 
existing property.

> +
>    max-memory-bandwidth:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        Input memory (from main memory to dispc) bandwidth limit in
>        bytes per second
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ti,am65x-dss
> +then:
> +  properties:
> +    ti,am625-oldi-io-ctrl: false
> +else:
> +  properties:
> +    ti,am65x-oldi-io-ctrl: false
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.37.0
> 
> 
