Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0F4AF6A3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666D810E315;
	Wed,  9 Feb 2022 16:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBFF10E315
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:28:15 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHpp8-0002r1-Gg; Wed, 09 Feb 2022 17:28:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 1/5] dt-bindings: gpu: mali-bifrost: describe clocks
 for the rk356x gpu
Date: Wed, 09 Feb 2022 17:28:05 +0100
Message-ID: <3297396.uCXnvZdJcx@diego>
In-Reply-To: <01b78d95-fdf3-060a-831d-dae2abbc7109@wolfvision.net>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
 <1644420908.380944.391811.nullmailer@robh.at.kernel.org>
 <01b78d95-fdf3-060a-831d-dae2abbc7109@wolfvision.net>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Am Mittwoch, 9. Februar 2022, 16:46:28 CET schrieb Michael Riesch:
> Hi Rob,
> 
> On 2/9/22 16:35, Rob Herring wrote:
> > On Wed, 09 Feb 2022 09:51:06 +0100, Michael Riesch wrote:
> >> From: Alex Bee <knaerzche@gmail.com>
> >>
> >> The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
> >> Reflect this in the SoC specific part of the binding.
> >>
> >> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> >> [move the changes to the SoC section]
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >> ---
> >>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > ./Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml:173:12: [warning] wrong indentation: expected 12 but found 11 (indentation)
> 
> D'oh! Sorry for the stupid mistake, I found that yamllint was indeed
> missing.
> 
> Lines 173 and 174 need an extra space. In the case that a v6 is required
> I'll fix this. But of course I wouldn't say no if this could be fixed
> when the patch is applied :-)

My guess is, Rob's bot filters out the easy wrongs, so I'm not sure if he
actually looks at these in person.

So doing a v6 might actually be better for a Review :-)


Heiko


> > 
> > dtschema/dtc warnings/errors:
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/patch/1590238
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 




