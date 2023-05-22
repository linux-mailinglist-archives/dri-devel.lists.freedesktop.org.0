Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D179570C556
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05C910E1FF;
	Mon, 22 May 2023 18:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B5910E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 18:38:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D663A62266;
 Mon, 22 May 2023 18:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1846C4339B;
 Mon, 22 May 2023 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684780726;
 bh=k+ztUyrowKth864y9ceYmAWMGnjd0ateRI2+IBMBGTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6zapAYinGWGAXCgi9YCLSqCkeZnvJoOD5d8xvy4wRW6jNl2ohF6pVQ8u56HA5CQU
 8Za7fHKyr84PXQCmNRIYldR3q/LuumWnYUU+P+c01FQIg2UcLFQRuOE4UdTlSUBoEK
 EpCcqYgAtTPftXzLuCb3kw1HUH4PoXDzk58p1FgYwp+yvR4QYioOn0fqCbJUzZ5dsq
 +YrJ0D8Wlo3UIp0UcgrDkr3H4lx1uQOIkyDFRlOADYWQE66ktZjDb7hCCxU3+OeX+f
 51gB3iRedQvPG6uMfsJsvNOMkMq9hxwlseWSW48z1BF2ycigUX8oMUut5BHNsxnNV0
 HiIW8YJY3DECg==
Date: Mon, 22 May 2023 19:38:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v3 1/6] dt-bindings: net: brcm,unimac-mdio: Add
 asp-v2.0
Message-ID: <20230522-outshine-resample-f0c96c9345ca@spud>
References: <1684531184-14009-1-git-send-email-justin.chen@broadcom.com>
 <1684531184-14009-2-git-send-email-justin.chen@broadcom.com>
 <2be2af5e-d117-fa2c-f960-e7f0c3ca3d0b@conchuod.ie>
 <ce4a0153-1a6b-92d5-b760-489b09bbec73@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce4a0153-1a6b-92d5-b760-489b09bbec73@broadcom.com>
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
Cc: andrew@lunn.ch, dri-devel@lists.freedesktop.org,
 Justin Chen <justin.chen@broadcom.com>, edumazet@google.com,
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 richardcochran@gmail.com, opendmb@gmail.com, Conor Dooley <mail@conchuod.ie>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 robh+dt@kernel.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 11:25:54AM -0700, Florian Fainelli wrote:
> On 5/22/23 11:17, Conor Dooley wrote:
> > On Fri, May 19, 2023 at 02:19:39PM -0700, Justin Chen wrote:
> >  > The ASP 2.0 Ethernet controller uses a brcm unimac.
> >  >
> >  > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> >  > Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> >  > ---
> >  >  Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
> >  >  1 file changed, 2 insertions(+)
> >  >
> >  > diff --git
> > a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> > b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> >  > index 0be426ee1e44..6684810fcbf0 100644
> >  > --- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> >  > +++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> >  > @@ -22,6 +22,8 @@ properties:
> >  >        - brcm,genet-mdio-v3
> >  >        - brcm,genet-mdio-v4
> >  >        - brcm,genet-mdio-v5
> >  > +      - brcm,asp-v2.0-mdio
> >  > +      - brcm,asp-v2.1-mdio
> >  >        - brcm,unimac-mdio
> > 
> > 
> >  From V(N-1), there was some discussion between Rob & Florian:
> >  > > How many SoCs does each of these correspond to? SoC specific
> > compatibles
> >  > > are preferred to version numbers (because few vendors are disciplined
> >  > > at versioning and also not changing versions with every Soc).
> >  >
> >  > So far there is a 1:1 mapping between the number of versions and the
> >  > number of SoCs, and the older SoC uses v2.0, while the newer one uses
> > v2.1.
> > 
> > Rob's not around right now, but I don't really get why if there is a 1:1
> > mapping you don't just name these things after the SoCs?
> 
> There is a 1:1 mapping now, but in the future there may be more SoCs with a
> given implemented version. This is especially true for the MDIO controller
> which has been largely unchanged since it was introduced.

Figured that'd be it, but what was written in the previous thread made
the opposite appear true!
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> > Also, my mailer **refused** to let me reply to you because of something
> > to do with a garbage S/MIME signature? Dunno wtf is happening there.
> 
> Our SMTP server is configured to automatically wrap the message in a S/MIME
> envelope, nothing invalid though AFAICT. What's your email client?

Mutt - I guess it was user-error because getting S/MIME stuff
auto-populated the security field on my end. Annoying but w/e...
