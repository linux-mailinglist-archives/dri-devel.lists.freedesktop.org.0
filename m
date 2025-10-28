Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E6C16D3D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827CA10E149;
	Tue, 28 Oct 2025 20:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="lMwF2qR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1CF10E149
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761684811; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g8EjycDcqhGwlKbtxYiWa2PfFsO8TZkkNhlgLAeD7q7igYwYZrH2k1AymiEmD9lNq8rHNRQZV6FA4bjCI0YeqdwyGVRJsEMuJOQj5OaVvcY+Z1Gd+394AcNvuDaKfh3Z0z/2w7WDzKkiAwU/RnG32o6vmETKpmqveFknx4IlJys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761684811;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Uoa0l908M7uaK/BpElXvfipCJAZA8oa5gvDtlPIWeEE=; 
 b=dXjKtfXdJxBUTMxP8Y6UoRV7RncemrAVu49xP+eSAiPdLOhY0X0INH/cLrJqHhNxU85xh2asihIo4zB5CBvTJY/OkqXjOmMghuc6X8pdXRiMZKLlyl+wQbrZPGSGt1avgzJkemccTPGaIh4jRXIb8cvsjRyzzMDzicRkS7V201s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761684810; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Uoa0l908M7uaK/BpElXvfipCJAZA8oa5gvDtlPIWeEE=;
 b=lMwF2qR/oBJIzRXuisJG8fCGVaQwBeU1dYP6cMnxx8qlyMC34TXwCedLPQzcZvZH
 5Gk21fSZsR/egZGHHKrQbt5czqH1IrG3sqZwJBBFwH3Rlbj6Q1Cx9jE5Db3UqMiqT4R
 2bwEui5v0TEuk5vU7gMGNXPXk3AzMmZFKD+TGnzM=
Received: by mx.zohomail.com with SMTPS id 1761684809056372.7090557520545;
 Tue, 28 Oct 2025 13:53:29 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Date: Tue, 28 Oct 2025 21:51:43 +0100
Message-ID: <6599426.lOV4Wx5bFT@workhorse>
In-Reply-To: <aQD5gwByEmX6GQK9@e110455-lin.cambridge.arm.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-1-98fc1cc566a1@collabora.com>
 <aQD5gwByEmX6GQK9@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 28 October 2025 18:12:35 Central European Standard Time Liviu Dudau wrote:
> On Fri, Oct 17, 2025 at 05:31:08PM +0200, Nicolas Frattaroli wrote:
> > The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> > control the power and frequency of the GPU. This is modelled as a power
> > domain and clock provider.
> > 
> > It lets us omit the OPP tables from the device tree, as those can now be
> > enumerated at runtime from the MCU.
> > 
> > Add the necessary schema logic to handle what this SoC expects in terms
> > of clocks and power-domains.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 37 +++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > index 613040fdb444..860691ce985e 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > @@ -45,7 +45,9 @@ properties:
> >      minItems: 1
> >      items:
> >        - const: core
> > -      - const: coregroup
> > +      - enum:
> > +          - coregroup
> > +          - stacks
> >        - const: stacks
> 
> I'm not sure how to parse this part of the change. We're overwriting the property
> for mt8196-mali anyway so why do we need this? And if we do, should 'stacks'
> still remain as a const?

The properties section outside of the if branches outside here
specifies a pattern of properties that matches for all devices.

In this case, I changed it so that the second clock-names item
may either be "coregroup" or "stacks". Yes, the third "stacks"
remains, though if you wanted to be extra precise you could
then specify in the non-MT8196 cases that we should not have
stacks followed by stacks, but I'd wager some checker for
duplicate names may already catch that.

However, I don't think it's a big enough deal to reroll this
series again.

Kind regards,
Nicolas Frattaroli

> 
> Best regards,
> Liviu
> 
> >  
> >    mali-supply: true
> > @@ -110,6 +112,27 @@ allOf:
> >          power-domain-names: false
> >        required:
> >          - mali-supply
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8196-mali
> > +    then:
> > +      properties:
> > +        mali-supply: false
> > +        sram-supply: false
> > +        operating-points-v2: false
> > +        power-domains:
> > +          maxItems: 1
> > +        power-domain-names: false
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          items:
> > +            - const: core
> > +            - const: stacks
> > +      required:
> > +        - power-domains
> >  
> >  examples:
> >    - |
> > @@ -145,5 +168,17 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    gpu@48000000 {
> > +        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> > +        reg = <0x48000000 0x480000>;
> > +        clocks = <&gpufreq 0>, <&gpufreq 1>;
> > +        clock-names = "core", "stacks";
> > +        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        interrupt-names = "job", "mmu", "gpu";
> > +        power-domains = <&gpufreq>;
> > +    };
> >  
> >  ...
> > 
> 
> 




