Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423173423F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 18:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D5210E07C;
	Sat, 17 Jun 2023 16:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5F310E07C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 16:34:37 +0000 (UTC)
Received: from i53875b22.versanet.de ([83.135.91.34] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qAYsg-0007Kt-6E; Sat, 17 Jun 2023 18:34:30 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maximilian Weigand <mweigand2017@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: backlight: lm3630a: add entries to
 control boost frequency
Date: Sat, 17 Jun 2023 18:34:28 +0200
Message-ID: <7491264.lOV4Wx5bFT@diego>
In-Reply-To: <17576d81-a342-0b77-367a-eb9f2b97b734@linaro.org>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
 <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
 <17576d81-a342-0b77-367a-eb9f2b97b734@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Maximilian Weigand <mweigand@mweigand.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Samstag, 17. Juni 2023, 12:12:17 CEST schrieb Krzysztof Kozlowski:
> On 14/06/2023 21:08, Maximilian Weigand wrote:
> > From: Maximilian Weigand <mweigand@mweigand.net>
> > 
> > Add 'ti,boost_use_1mhz' to switch between 500 kHz and 1 MHz boost
> > converter switching frequency, and add 'ti,boost_frequency_shift' to
> > activate a frequency shift to 560 kHz or 1.12 MHz, respectively.
> > 
> > Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
> > ---
> >  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> > index 3c9b4054ed9a..ef7ea0ad2d25 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> > @@ -33,6 +33,18 @@ properties:
> >      description: GPIO to use to enable/disable the backlight (HWEN pin).
> >      maxItems: 1
> >  
> > +  ti,boost_use_1mhz:
> 
> No underscores in property names.
> 
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
> > +      If present, change the boost converter switching frequency from the
> > +      default 500 kHz to 1 MHz. Refer to data sheet for hardware requirements.
> > +    type: boolean
> > +
> > +  ti,boost_frequency_shift:
> > +    description: |
> > +      If present, change boost converter switching frequency from 500 kHz to
> > +      560 kHz or from 1 Mhz to 1.12 Mhz, respectively.
> 
> So just make it a property choosing the frequency, not bools, with
> proper unit suffix.

i.e.
ti,boost-frequency-hz = <x>;
with x being 500000, 560000, 1000000, 1120000

with the driver failing when the frequency is not achievable
with the two knobs of 1mhz and shift.



