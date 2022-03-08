Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB194D0D1D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 01:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB2310E1B2;
	Tue,  8 Mar 2022 00:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481910E1B2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 00:57:37 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id n7so7495746oif.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 16:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gq59UE3cTSs3qNXLzpjqXYkCpDSstIwAsqV4QUkUf5U=;
 b=08dROTWtccJtF4gdz/1Ah5mDGFQBGci9ov/TA+qo/bSZAtl67VSs0wObduqeJU0nyG
 U4NIqRECgF4C+n1lJ2vzR3F6YW22dmvrCwKXy0sPDPO9sBPq+4jcj33jy8yu6vrQEdte
 Q9nMXu5PZ92KDQuo2C5GBkY2peHzoqVFt9C4ioj12PG+POHupNrRZISf7MnfoLrzmDUn
 pUap44/rMPlFtD0FQ2NPJv/TttggBYU704gcVgtGbK5waFPMQqgModHEiAzYtXC53gOf
 wMwYUJI4loJL0Thypo3RUgafQg7OVYr9iIgf43nb9PE6W65bSl/0THTyArtNFxWkuC5H
 qJpw==
X-Gm-Message-State: AOAM532obCP39Bh2A0AU6Snlc4ZUNW9sNSRL4MUAfoOp60QH8VqUJZvJ
 wZdXXHP6vX5E+t6p9CfE4w==
X-Google-Smtp-Source: ABdhPJyNzfmC3eXDfqkGUdgxXQi9iFr9d6NGbT86dkIYFRYjW7BxPs5o55rCdVmWsq7DztwRgxOOLg==
X-Received: by 2002:a05:6808:169f:b0:2d7:9bbd:ae82 with SMTP id
 bb31-20020a056808169f00b002d79bbdae82mr1085492oib.136.1646701056249; 
 Mon, 07 Mar 2022 16:57:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05687072c200b000d9ae3e1fabsm6217940oak.12.2022.03.07.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 16:57:35 -0800 (PST)
Received: (nullmailer pid 3606977 invoked by uid 1000);
 Tue, 08 Mar 2022 00:57:33 -0000
Date: Mon, 7 Mar 2022 18:57:33 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to
 yaml
Message-ID: <Yiap/f48pLUXzaQ0@robh.at.kernel.org>
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-3-joel@jms.id.au>
 <44308465-db4c-80e7-2beb-b0f676d16edf@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44308465-db4c-80e7-2beb-b0f676d16edf@canonical.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, dri-devel@lists.freedesktop.org,
 Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 05, 2022 at 10:49:05PM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2022 01:03, Joel Stanley wrote:
> > Convert the bindings to yaml and add the ast2600 compatible string.
> > 
> > The legacy mfd description was put in place before the gfx bindings
> > existed, to document the compatible that is used in the pinctrl
> > bindings.
> > 
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
> >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
> >  .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
> >  3 files changed, 69 insertions(+), 58 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> > new file mode 100644
> > index 000000000000..8ddc4fa6e8e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/aspeed,gfx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED GFX display device
> > +
> > +maintainers:
> > +  - Joel Stanley <joel@jms.id.au>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - aspeed,ast2400-gfx
> > +          - aspeed,ast2500-gfx
> > +          - aspeed,ast2600-gfx
> 
> That's different than original bindings - new patch. It's not currently
> supported, so adding it is more than just updating bindings to current
> state.
> 
> > +      - const: syscon
> > +
> > +  reg:
> > +    minItems: 1
> 
> maxItems?
> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  memory-region: true

Also need to define how many (maxItems: 1).

> > +
> > +  syscon: true
> 
> You need at least description. I see old bindings did not mention it
> (except that it is required)... I think you also need a type, because it
> is not a standard property.
> 
> > +
> > +  reg-io-width: true
> 
> Some constraints? Can it be anything from syscon schema?
> 
> Best regards,
> Krzysztof
> 
