Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B49F3502
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDC710E27F;
	Mon, 16 Dec 2024 15:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eLPC5Mtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F4310E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 15:53:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A2F21BF209;
 Mon, 16 Dec 2024 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734364430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuTRv0vuTZ0VwJUnE4hrLu3RN+h0ws0emLL1w4UELQ4=;
 b=eLPC5MtxucGs6C9aYXHpAlqhEfz1wsdFGZ1JzX1vaiuvk5pRwSaVQKU2lLOSsLFQE18gua
 1/IgTr+KSPcfUB03mc4kZN7+8pFjHPsVy/p+t1nRLQw/TlERLXH9Q4HODNSALgNm+mOb7O
 PUKU50LLlnq+TkncnOyu5S71QT6AMTQOf7WJmsmmMioQj45JfYakM2mVozxJh9cxInsimI
 SDffBlHhzAWlW0230I1MQckdmvQ6ZP5PknhgeeJiBmXXVRqILfya4v26NZtCi7zb55VGV7
 j1mhcTzzNGUfXkf9yDV3LK2muAZAN8sjEr5QQ2llMe6l64WJ3jOXYhCp59++3Q==
Date: Mon, 16 Dec 2024 16:53:46 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Tianma
 TM070JDHG34-00 panel
Message-ID: <20241216165346.4b522b25@booty>
In-Reply-To: <egqtfrmretlglzhizdgq32bioxqtydcz7ftv7j6ftj2or6vhch@tre2xmuz3pry>
References: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
 <20241210-tianma_tm070jdhg34-v1-1-9fb7fe6b6cf0@bootlin.com>
 <egqtfrmretlglzhizdgq32bioxqtydcz7ftv7j6ftj2or6vhch@tre2xmuz3pry>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

On Mon, 16 Dec 2024 11:09:37 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Tue, Dec 10, 2024 at 06:28:03PM +0100, Luca Ceresoli wrote:
> > Add the Tianma Micro-electronics TM070JDHG34-00 7.0" LVDS LCD TFT panel.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 18b63f356bb4bbf6d2c8e58b13ebb14c5f4004ad..30f655e82666bb1aa227edd26bd8d3621a39e74f 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -281,6 +281,8 @@ properties:
> >          # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
> >        - tianma,tm070jdhg30
> >          # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
> > +      - tianma,tm070jdhg34-00  
> 
> So tm070jdhg34 or tm070jvhg33? Comment says one, implementation different.

My bad, I swapped the two lines. Apologies, v2 on its way.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
