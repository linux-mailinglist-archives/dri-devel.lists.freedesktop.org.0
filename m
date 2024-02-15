Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430C856F2C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 22:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCDC10E049;
	Thu, 15 Feb 2024 21:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7D310E049
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 21:17:58 +0000 (UTC)
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1raj73-0000Yz-48; Thu, 15 Feb 2024 22:17:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quentin.schulz@theobroma-systems.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: ltk500hd1829: add variant
 compatible for ltk101b4029w
Date: Thu, 15 Feb 2024 22:17:43 +0100
Message-ID: <16747948.geO5KgaWL5@diego>
In-Reply-To: <20240215-boat-grid-d50f0eccec67@spud>
References: <20240215090515.3513817-1-heiko@sntech.de>
 <20240215090515.3513817-3-heiko@sntech.de>
 <20240215-boat-grid-d50f0eccec67@spud>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 15. Februar 2024, 18:06:06 CET schrieb Conor Dooley:
> On Thu, Feb 15, 2024 at 10:05:14AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Add the compatible for the ltk101b4029w panel, that is really similar
> > to the ltk500hd1829.
> 
> Please mention what makes the devices incompatible. "really similar" is
> vague and could be used for a device that was only cosmetically
> different.

ok, I'll modify the paragraph to:

=======
Add the compatible for the ltk101b4029w panel, that has the same
manufacturer, general bringup and supplies but a different dsi-init-
sequence as the ltk500hd1829 .
=======

> With that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.
> 
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> > index c5944b4d636c5..d589f16772145 100644
> > --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> > @@ -14,7 +14,9 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    const: leadtek,ltk500hd1829
> > +    enum:
> > +      - leadtek,ltk101b4029w
> > +      - leadtek,ltk500hd1829
> >    reg: true
> >    backlight: true
> >    reset-gpios: true
> 




