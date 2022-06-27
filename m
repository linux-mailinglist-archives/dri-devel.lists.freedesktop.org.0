Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615E55BB43
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B699C1120A6;
	Mon, 27 Jun 2022 17:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D166C1121E7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 17:15:04 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k15so10238682iok.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=An//ZVIBHusXq7ojPg64QggrwNUop5VEk57ILCBBv0U=;
 b=XsfRgiFY9pq61qNwToPBaEexI79UPNr/F9Y1ZFmkP/fL0pwm/INHWNzcsXv5YG/yt9
 xmwNqlny2MPVLFVv3KlOrI+u84xTjogoIpJpPrP//WvG9xMltuw/Rxnvs3DN0mzYzV/z
 3aLJR94SGQglAfYXiPHlt2bv/QQ3cWU2hL3Jda3QbccQdCPMPK7Enx2HQP9OvcvTWRtC
 GUBcmKeH2EWDGamUFtFbQdRGHCd5Ta81ImYSACbjRLSAVoSyAhVLVlEUd5RbI0y0t1G8
 Ka0togwmE6UgwW1KM5nO1JlqQyKK1f0PuRI1z/80RK7IrZYQcAtAhvNxG2yCLWjNdoAv
 GNPw==
X-Gm-Message-State: AJIora+lAeGta0BaEmybzXhpAsFgZRLWbzpe2lZp62xtSbetJquNsQrP
 efpVPmPing58c6T+22US6g==
X-Google-Smtp-Source: AGRyM1trlOnex3HcAYrl5SVQu6l8zcvR+jlYFtBQiWM5jDgBNdFpV78MBBeicB8VYl+Oe0sIBxfwBA==
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id
 h7-20020a056638338700b0033c9f9e5a17mr2713672jav.12.1656350104060; 
 Mon, 27 Jun 2022 10:15:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a056638059700b003320e4b5bb7sm5118946jar.57.2022.06.27.10.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 10:15:03 -0700 (PDT)
Received: (nullmailer pid 2608313 invoked by uid 1000);
 Mon, 27 Jun 2022 17:15:00 -0000
Date: Mon, 27 Jun 2022 11:15:00 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220627171500.GA2600685-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
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
 jee.heng.sia@intel.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 09:06:34PM +0000, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 21:56, Serge Semin wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> >> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> >> this.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
> >>  1 file changed, 35 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> >> index e25d44c218f2..f2b9e3f062cd 100644
> >> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> >> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> >> @@ -135,19 +135,41 @@ properties:
> >>        of the designware controller, and the upper limit is also subject to
> >>        controller configuration.
> >>
> >> -patternProperties:
> >> -  "^.*@[0-9a-f]+$":
> >> -    type: object
> >> -    properties:
> >> -      reg:
> >> -        minimum: 0
> >> -        maximum: 3
> >> -
> >> -      spi-rx-bus-width:
> >> -        const: 1
> >> -
> >> -      spi-tx-bus-width:
> >> -        const: 1
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        const: snps,dwc-ssi-1.01a
> >> +
> >> +then:
> >> +  patternProperties:
> >> +    "^.*@[0-9a-f]+$":
> >> +      type: object
> >> +      properties:
> >> +        reg:
> >> +          minimum: 0
> >> +          maximum: 3
> >> +
> >> +        spi-rx-bus-width:
> >> +          const: 4
> >> +
> >> +        spi-tx-bus-width:
> >> +          const: 4
> >> +
> >> +else:
> >> +  patternProperties:
> >> +    "^.*@[0-9a-f]+$":
> >> +      type: object
> >> +      properties:
> >> +        reg:
> >> +          minimum: 0
> >> +          maximum: 3
> >> +
> >> +        spi-rx-bus-width:
> >> +          const: 1
> >> +
> >> +        spi-tx-bus-width:
> >> +          const: 1
> > 
> > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> 
> 8 too? sure.

Then no constraints needed because the common definition already has 
this presumably.

Rob
