Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E46C17BE1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 02:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAA610E6CA;
	Wed, 29 Oct 2025 01:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E780710E6CA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:05:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EA6A1C2B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 18:04:58 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3F133F63F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 18:05:05 -0700 (PDT)
Date: Wed, 29 Oct 2025 01:04:42 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
Message-ID: <aQFoKoWIlf7xPzZX@e110455-lin.cambridge.arm.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-1-98fc1cc566a1@collabora.com>
 <aQD5gwByEmX6GQK9@e110455-lin.cambridge.arm.com>
 <6599426.lOV4Wx5bFT@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6599426.lOV4Wx5bFT@workhorse>
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

On Tue, Oct 28, 2025 at 09:51:43PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 28 October 2025 18:12:35 Central European Standard Time Liviu Dudau wrote:
> > On Fri, Oct 17, 2025 at 05:31:08PM +0200, Nicolas Frattaroli wrote:
> > > The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> > > control the power and frequency of the GPU. This is modelled as a power
> > > domain and clock provider.
> > > 
> > > It lets us omit the OPP tables from the device tree, as those can now be
> > > enumerated at runtime from the MCU.
> > > 
> > > Add the necessary schema logic to handle what this SoC expects in terms
> > > of clocks and power-domains.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 37 +++++++++++++++++++++-
> > >  1 file changed, 36 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > index 613040fdb444..860691ce985e 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > @@ -45,7 +45,9 @@ properties:
> > >      minItems: 1
> > >      items:
> > >        - const: core
> > > -      - const: coregroup
> > > +      - enum:
> > > +          - coregroup
> > > +          - stacks
> > >        - const: stacks
> > 
> > I'm not sure how to parse this part of the change. We're overwriting the property
> > for mt8196-mali anyway so why do we need this? And if we do, should 'stacks'
> > still remain as a const?
> 
> The properties section outside of the if branches outside here
> specifies a pattern of properties that matches for all devices.
> 
> In this case, I changed it so that the second clock-names item
> may either be "coregroup" or "stacks".

Why would we want to do that for non-MT8196 devices? It doesn't make sense to me.
The overwrite in the if branch should be enough to give you want you want (i.e.
core followed by stacks and only that).

> Yes, the third "stacks"
> remains, though if you wanted to be extra precise you could
> then specify in the non-MT8196 cases that we should not have
> stacks followed by stacks, but I'd wager some checker for
> duplicate names may already catch that.
> 
> However, I don't think it's a big enough deal to reroll this
> series again.

I'm not asking you to re-roll the series but if you agree to drop that
part I can make the edit when merging it.

Best regards,
Liviu

> 
> Kind regards,
> Nicolas Frattaroli
> 
> > 
> > Best regards,
> > Liviu
> > 
> > >  
> > >    mali-supply: true
> > > @@ -110,6 +112,27 @@ allOf:
> > >          power-domain-names: false
> > >        required:
> > >          - mali-supply
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: mediatek,mt8196-mali
> > > +    then:
> > > +      properties:
> > > +        mali-supply: false
> > > +        sram-supply: false
> > > +        operating-points-v2: false
> > > +        power-domains:
> > > +          maxItems: 1
> > > +        power-domain-names: false
> > > +        clocks:
> > > +          maxItems: 2
> > > +        clock-names:
> > > +          items:
> > > +            - const: core
> > > +            - const: stacks
> > > +      required:
> > > +        - power-domains
> > >  
> > >  examples:
> > >    - |
> > > @@ -145,5 +168,17 @@ examples:
> > >              };
> > >          };
> > >      };
> > > +  - |
> > > +    gpu@48000000 {
> > > +        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> > > +        reg = <0x48000000 0x480000>;
> > > +        clocks = <&gpufreq 0>, <&gpufreq 1>;
> > > +        clock-names = "core", "stacks";
> > > +        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> > > +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> > > +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        interrupt-names = "job", "mmu", "gpu";
> > > +        power-domains = <&gpufreq>;
> > > +    };
> > >  
> > >  ...
> > > 
> > 
> > 
> 
> 
> 
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
