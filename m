Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E86401A2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 09:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5D210E6AA;
	Fri,  2 Dec 2022 08:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7848810E6AA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 08:11:25 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AAE54240005;
 Fri,  2 Dec 2022 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1669968681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAptEfvYgIwFK8ngkctQU/JTtGEWZC2Koz9VlQAcRkA=;
 b=kstJhwEO+cLVVec3Sk9Sa/uvB4r26XymgSL33QXP8njtUT0BOxFIWIvPdYUnPHe+NQ9YnV
 8v32TN8SCY7ufUMPXXrCfRJHlIQm8PlGtwD4KSJ1q+A2/NR42Zd0+HWuJQRET6uDEIpf/v
 /vMIijMbtujIVkMZtWkARcIL2Wax80uO+EEn6wGnkEawZMpXyyCb7UTIq23yz8HZhqEruq
 sTVeVu0bO793DjT3K4Wql5mZvpZyHc9mlzTN/SJEgzIuhMuiCmqR6IROge5OD3ws1YnU5Q
 lujAdDH/jD7nAhFgQhWBUp9+T9UPjn7wDdKaRu32IH4cta0RDt+nFQvtdawnUg==
Date: Fri, 2 Dec 2022 09:11:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Message-ID: <20221202091117.52a9a8f0@booty>
In-Reply-To: <20221201231636.GA1660613-robh@kernel.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-3-luca.ceresoli@bootlin.com>
 <20221201231636.GA1660613-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

On Thu, 1 Dec 2022 17:16:36 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, Nov 28, 2022 at 04:23:17PM +0100, Luca Ceresoli wrote:
> > The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> > input module. Add it to the allowed properties and augment the existing
> > nvidia,tegra20-vi example to show a 'vip' property.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changed in v2 (suggested by Krzysztof Kozlowski):
> > - rename "i2c3" -> "ic2"
> > - add review tag
> > ---
> >  .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 69 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> > index 782a4b10150a..5b5583c2b562 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> > @@ -74,6 +74,22 @@ properties:
> >    avdd-dsi-csi-supply:
> >      description: DSI/CSI power supply. Must supply 1.2 V.
> >  
> > +  vip:
> > +    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Input from the VIP (parallel input capture) module
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/properties/endpoint  
> 
> You can drop 'endpoint'. You only need port nodes if there's no extra 
> properties in the endpoints.

Oh, nice, will remove in v3.

Krzysztof, can I keep your Reviewed-by after this change?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
