Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D971563A14
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD4D18B096;
	Fri,  1 Jul 2022 19:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C5818B095
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:41:14 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id m13so3275677ioj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 12:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RHrkVsGF6yh4atuN/qmRjWl7VEZw4egW+a3OkfBFnbM=;
 b=Hunsc+LR+Yba1Ju96m9SaM+7IfcR9sqD69aHqn+TepTX5O6QKJvMgkP+9F8B+7Iqq7
 ARAAwt7L7VuDuTb+qbr1VcPjg/62zTmHJxtaD7m2kzk5V0V3HAQds5A+nHIETLn95e1N
 /PW1ti4t6V/vitLuqbnAcmMKvIrSCZnPc/969qoJ14bGJ+9CJHgN5M+9C4/7d1yJPgQy
 HGNi1/2RbCnwBb+TwziKlADWD8u36veAlvRcSQkKkrLelcnFeiMF8+Dk8tI9P0UFsZ5p
 DrOjcLZFee28V32JNEqzVoP0RtWgiBzRtU11pqVhJHoA5ZQhKD3rv1YNeFkKUZDxTNgG
 yYrg==
X-Gm-Message-State: AJIora+/QTh6PZiK6EzWPjsJeIHBUP40FnPgqDHXs9AtvHk4l/oqADdo
 a2NOQ/DGSxFY9TBDYeJ+0Q==
X-Google-Smtp-Source: AGRyM1tlsN2RCONvqgzA0GpBUrUts90pmA7r74l1wJj1YnzPtK+Cu6hEsfzhUTYnzJsijdJvLVfcBg==
X-Received: by 2002:a05:6638:33a4:b0:33e:9335:9f0e with SMTP id
 h36-20020a05663833a400b0033e93359f0emr5171953jav.260.1656704473689; 
 Fri, 01 Jul 2022 12:41:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a02a381000000b00339c855eb15sm10186415jak.27.2022.07.01.12.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:41:13 -0700 (PDT)
Received: (nullmailer pid 1390347 invoked by uid 1000);
 Fri, 01 Jul 2022 19:41:10 -0000
Date: Fri, 1 Jul 2022 13:41:10 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <20220701194110.GA1388036-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
 <20220630215540.cifnzovya57bgbsw@mobilestation>
 <f7d64f1d-9fb8-6259-cd60-8bfc65636300@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d64f1d-9fb8-6259-cd60-8bfc65636300@microchip.com>
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 11:12:53PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/06/2022 22:55, Serge Semin wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Wed, Jun 29, 2022 at 07:43:34PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> >> controller, but according to the documentation & devicetree it has 6
> >> interrupts rather than the standard one. Support the 6 interrupt
> >> configuration by unconditionally extending the binding to a maximum of
> >> 8 per-channel interrupts thereby matching the number of possible
> >> channels.
> >>
> >> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> >> index 4324a94b26b2..e33ef22aec9c 100644
> >> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> >> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> >> @@ -34,7 +34,9 @@ properties:
> >>        - const: axidma_apb_regs
> >>
> >>    interrupts:
> > 
> >> -    maxItems: 1
> >> +    description: per channel interrupts
> > 
> > Description is inaccurate. It's either combined or per-channel IRQs.
> 
> I will change it to:
>   interrupts:
>     description: |

Don't need '|'.

>       If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
>       will be per-channel interrupts. Otherwise, this is a single combined IRQ
>       for all channels.
>     minItems: 1
>     maxItems: 8
> 
> How's that sound?

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
