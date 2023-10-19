Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41207D00D3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 19:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9055E10E52C;
	Thu, 19 Oct 2023 17:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EEE10E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 17:45:22 +0000 (UTC)
Received: from i5e861907.versanet.de ([94.134.25.7] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qtX5C-0006Vb-V4; Thu, 19 Oct 2023 19:45:19 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Thu, 19 Oct 2023 19:45:17 +0200
Message-ID: <3083498.U7HbjWM52l@diego>
In-Reply-To: <SN6PR06MB534289953F0A72345D679A7EA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <df3c067f-8732-46bf-aa93-852f41e9e4e9@linaro.org>
 <SN6PR06MB534289953F0A72345D679A7EA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Chris,

Am Donnerstag, 19. Oktober 2023, 16:43:56 CEST schrieb Chris Morgan:
> On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> > On 18/10/2023 18:18, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> > > powered by the Rockchip RK3566 SoC.
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > index a349bf4da6bc..a6612185a7ff 100644
> > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > @@ -674,6 +674,11 @@ properties:
> > >            - const: powkiddy,rgb30
> > >            - const: rockchip,rk3566
> > >  
> > > +      - description: Powkiddy RK2023
> > > +        items:
> > > +          - const: powkiddy,rk2023
> > 
> > This cuold be just enum in previous entry :/ but I remember we talked
> > about this once with Heiko.
> 
> For hardware that requires a different device tree, is that possible?
> While most of the devices I've worked on for the RK3566 series are very
> similar for the moment only 1 is identical (the RG353P and the RG353M)
> and can use the same device tree.

In my reply I pointed to the Rock PI 4A/4A+/B/B+/C family, which also has
different devicetrees but is part of the same family of device designs.

So similar Powkiddy RK3568 based gaming handhelds also sound like
a nice family name in the description ;-) .


Heiko


