Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0659655C08C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2C1139FA;
	Tue, 28 Jun 2022 11:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0D31138D9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:06:11 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s14so14481174ljs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=74ZknYvbAERmU3fgiRR2mY3FgoTL84vsypu6NISs3NA=;
 b=dDWLan8xSf2psi8Ku75yN5OgwcTLoIo4QLRQchGf/tnOHIEErsIqClR6R6jj0hHnE1
 glxdqv+Q+oNFas8s3KUFWDNz6pCfCPGtgu3GDRYlMy8tJSqLISPSkAXtSSB18Fc1cBl9
 K3i6ywdqZ7ooQdcDjGUO7jYYHtuMLkvdmJ0B7dpE8NaXa1Etww0PTwkNOS43/A+TUy5U
 fbSKJaRnMnBzQpBS8IlH8etIJaUkiMjzJuedU3YNzOd/a7muD3ZZ5O3Ejx5xtKj1NDNE
 X0K/TmyZEHl6Tx4YK+iB9mRmODqCTxt7r/nNT2QWhS3fceeeluPSUjYTDUwqbKQzyWX0
 vMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=74ZknYvbAERmU3fgiRR2mY3FgoTL84vsypu6NISs3NA=;
 b=GohR9IKqo/YSMtsQGHU314OnOgRgEH6b/Zd8ZC+GZhTS+7hwPADaRYYNg/v09vwD6g
 2feebi9/nYnH8o+UWuEJLoyY/AHmkSym+ivV7Oi6rYbkbEUIqvZSsHxyrymyrUVp5jfY
 pIWKFq6W1WVW8I+Pnel7fLk0arTGfQBWa+n5HYb2eevbE7q/uarl2k0L3tllgAVxEIux
 9VvgmpeYdzwlm/X5KOV6w78RPwzGA9sdJaK5xUgWFK3G5kzHrFoFmLLxPJTo3eEGR+e0
 2khnxmQUPSnld7vtt+0fY4nYkDtzNnOggwXUgQ9TDcB9gK/FQY6Gzl1YEjmdpgPM5SyL
 p4DQ==
X-Gm-Message-State: AJIora/uKbUgtl3WZMlCaI6KYlipH/dnzVMSNuIwQgiD2S+ht2WUs1Gs
 GI+C5+lNWptYOm8tHo9RuyA=
X-Google-Smtp-Source: AGRyM1uuwEf2Hbf380gJgJC1h2WOLcL2fEEXBsO7Ix96Zj9MMadTRjHIHgo7LzQz1OVzJUoUH5Gl+w==
X-Received: by 2002:a2e:b88a:0:b0:25b:c698:eede with SMTP id
 r10-20020a2eb88a000000b0025bc698eedemr4258515ljp.205.1656414369905; 
 Tue, 28 Jun 2022 04:06:09 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a056512371400b0047f9f075e04sm2156981lfr.296.2022.06.28.04.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:06:09 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:06:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/14] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Message-ID: <20220628110606.5xdzqxwrrqwymgvn@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-6-mail@conchuod.ie>
 <20220627233025.GA3167724-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627233025.GA3167724-robh@kernel.org>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <mail@conchuod.ie>, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Heng Sia <jee.heng.sia@intel.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Jun 27, 2022 at 05:30:25PM -0600, Rob Herring wrote:
> On Sat, Jun 18, 2022 at 01:30:27PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The Canaan k210 apparently has a Sysnopsys Designware timer but
> > according to the documentation & devicetree it has 2 interrupts rather
> > than the standard one. Add a custom compatible that supports the 2
> > interrupt configuration and falls back to the standard binding (which
> > is currently the one in use in the devicetree entry).
> > 
> > Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> > index d33c9205a909..9a76acc7a66f 100644
> > --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> > +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> > @@ -12,6 +12,9 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - items:
> > +          - const: canaan,k210-apb-timer
> > +          - const: snps,dw-apb-timer
> >        - const: snps,dw-apb-timer
> >        - enum:
> >            - snps,dw-apb-timer-sp
> > @@ -21,9 +24,6 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > -  interrupts:
> > -    maxItems: 1
> > -
> >    resets:
> >      maxItems: 1
> >  
> > @@ -41,7 +41,23 @@ properties:
> >  
> >    clock-frequency: true
> >  
> > -additionalProperties: false
> > +unevaluatedProperties: false
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: canaan,k210-apb-timer
> > +
> > +then:
> > +  properties:
> > +    interrupts:
> > +      maxItems: 2
> 

> When more than 1, you need to define what they are and the order.

Please see my note to v2 of this patch:
Link: https://lore.kernel.org/lkml/20220627211314.dc2hempelyl5ayjg@mobilestation/

-Sergey

> 
> > +
> > +else:
> > +  properties:
> > +    interrupts:
> > +      maxItems: 1
> >  
> >  required:
> >    - compatible
> > @@ -60,8 +76,8 @@ oneOf:
> >  examples:
> >    - |
> >      timer@ffe00000 {
> > -      compatible = "snps,dw-apb-timer";
> > -      interrupts = <0 170 4>;
> > +      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
> > +      interrupts = <0 170 4>, <0 170 4>;
> >        reg = <0xffe00000 0x1000>;
> >        clocks = <&timer_clk>, <&timer_pclk>;
> >        clock-names = "timer", "pclk";
> > -- 
> > 2.36.1
> > 
> > 
