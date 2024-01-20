Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4578334CC
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 14:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5612910E24A;
	Sat, 20 Jan 2024 13:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DF510E24A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 13:25:32 +0000 (UTC)
X-HalOne-ID: 2b7d9276-b797-11ee-ac2f-31e85a7fa845
Received: from mailrelay1.pub.mailoutpod3-cph3.one.com (unknown [104.37.34.38])
 by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPS
 id 2b7d9276-b797-11ee-ac2f-31e85a7fa845;
 Sat, 20 Jan 2024 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nis0MFICALDl8ueriEsSxywhUejA62uue/J5cXFxeyE=;
 b=VUaePavB9fYtt07l5KK9wUaWbFvslcUItlQeESzh4+PC+JlHKIjokXvAqJq5A2UuZe6H1zG6M76ym
 P1YY+x5r5Va+/5/mR3KXN+AxHNC1YLPpSoFb4S+8xtDvhQYB+BQ8kR+vZZ4NCr6OGGphDdehmISCj7
 5Ynb/XUBqGxkCWzbTcFmtvnCSboHLKvnvE/0h8NHRJuIhsNrPYInYoTlZ/zYwr1r4gByarY6MK6kX1
 w2vtccBTqwq94HXCNGzR6y2LD1oD6/Ub35yPmR2CnkL9xmiCDUWFGOPO8O7bVlzw/XcESFiHD4E9r6
 q7QIKsn9LU0K5DTnpaBUJe/gnpm7wJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nis0MFICALDl8ueriEsSxywhUejA62uue/J5cXFxeyE=;
 b=mDrAf03QUCGkLVFzLWy1mb2nZd8MPZrNGY9zpcn2vCt5UPndHii5ObDnSFLMBBl9sOveAhAWjnD8N
 UE5eIIHBA==
X-HalOne-ID: 298bbbbb-b797-11ee-a599-1ff1563c5748
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 298bbbbb-b797-11ee-a599-1ff1563c5748;
 Sat, 20 Jan 2024 13:23:58 +0000 (UTC)
Date: Sat, 20 Jan 2024 14:23:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>,
 Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240120132356.GA345206@ravnborg.org>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
 <20240119195151.GB938671-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119195151.GB938671-robh@kernel.org>
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
Cc: conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 linux4microchip@microchip.com, tzimmermann@suse.de, devicetree@vger.kernel.org,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org, lee@kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>, alexandre.belloni@bootlin.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 conor.dooley@microchip.com, thierry.reding@gmail.com, mripard@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev,
 u.kleine-koenig@pengutronix.de, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dharma & Rob.

> > To make the DT binding backward compatible you likely need to add a few
> > compatible that otherwise would have been left out - but that should do
> > the trick.
> > 
> > The current atmel hlcdc driver that is split in three is IMO an
> > over-engineering, and the driver could benefit merging it all in one.
> > And the binding should not prevent this.
> 
> I agree on all this, but a conversion is not really the time to redesign 
> things. Trust me, I've wanted to on lots of conversions. It should be 
> possible to simplify the driver side while keeping the DT as-is. Just 
> make the display driver bind to the MFD node instead. After that, then 
> one could look at flattening everything to 1 node.

Understood and thinking a bit about it fully agreed as well.
Dharma - please see my comments only as ideas for the future, and
ignore them in this fine rewrite you do.

	Sam
