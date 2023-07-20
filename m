Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A275B071
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14D310E5C6;
	Thu, 20 Jul 2023 13:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69010E5C6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:52:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76E7CC0002;
 Thu, 20 Jul 2023 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689861156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RuvPFmG9ZFC9+7jm4gOrOBVSo5fimZfSmfuIWCXVc4M=;
 b=NuAnMN5XhRNe4iSNbCsbYt3hLB86U7IAdDLR5+sN2pLJfm5zbPooAJjyM21kk1I8uWBl6N
 CVqu6vs+gBdjwlIlVNUyUFIvJInVpbLXGzLykm5UAD/ONGPOB793kBlx1V1fTiCoi01XWI
 U229AiYkvY53eMQEmv4h6XoR183btcUiAkrpDQw1vQX/1Dpzv688BnyUQpg3TjBhEn1PgL
 V/9vKN7Pv3HJK6XjZ9oOmJz/UzALITbXFCn8Kpkdib8tgxCsys/3qmG34sQgDPiQq72OXu
 v/AflvuUodgUZ78BJkaNrk1zyFw6RCVSRt61RpAqd5dYUkL0iUHqD8zkfrVMfw==
Date: Thu, 20 Jul 2023 15:52:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Message-ID: <20230720155233.604cc5cc@booty>
In-Reply-To: <a4ad14db-f3e6-a9a9-c7a9-b64bf2b3d33d@linaro.org>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
 <20230719152147.355486-2-luca.ceresoli@bootlin.com>
 <a4ad14db-f3e6-a9a9-c7a9-b64bf2b3d33d@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

thanks for reviewing.

On Wed, 19 Jul 2023 21:12:14 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 19/07/2023 17:21, Luca Ceresoli wrote:
> > Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> > connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> > 480x800 panel based on it.  
> 
> 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index aee340630eca..3c38699ee821 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6515,6 +6515,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
> >  F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> >  F:	drivers/gpu/drm/tiny/ili9486.c
> >  
> > +DRM DRIVER FOR ILITEK ILI9806E PANELS
> > +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> > +S:	Maintained
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc  
> 
> Nope, same for recent one-driver-subsystem. It's like a second try...
> You do not have git tree for one driver. The git tree is for subsystem,
> not driver.

I see, no problem, I'm removing the T: line in v2.

As this came from copy-pasting another panel driver, should the T: line
be removed from every "DRM DRIVER FOR * PANELS" entry? I could send a
patch to do that, if that makes sense.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
