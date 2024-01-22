Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DFC83699E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CF10E6F2;
	Mon, 22 Jan 2024 16:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod3-cph3.one.com
 (mailrelay4-1.pub.mailoutpod3-cph3.one.com [46.30.211.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E122A10F502
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=xAGeSXO7EYCYJmljPUEN1rFUpiw71f4rCC8gSgFu1n8=;
 b=HZRfxWW7RKvIzlLrWQDFVCTBUG5Jn1GeeZVFbfHhTfHQ1bK6ANABb9Ao3YCp7+9OkCan+DgMbN0gB
 7Z6KlrAcBHvLa52KHKbxsUqobDFzMYHyLl6dfJGWrIEFQIKuMaMeLya7L4Eh72a62yQva2BsUtXYIi
 +gdaDjCy4jtdh6K9Xj57QU5JN2kgd5whs5nSSgDF4oLqiLpM91y1BC+FQTSm91Qy+iPBuudeeBL0By
 3oqdvR5O2eBoJfSzKzc2UkKgr4HXz9su5ap3kEIpK0h0Q+C7KIITFpAYbR3Qv8tCLRpzgdQthfnm38
 QbWPO99YbFnwplbHV2K64bQXu/dELTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=xAGeSXO7EYCYJmljPUEN1rFUpiw71f4rCC8gSgFu1n8=;
 b=bKfCDk0HafSg+g3RaIu9TrzIt2gHb++4e++SaoHzG8BuWLN7Mzyav7YHusF+tvo7FeLOMboYIg9IK
 gXQFr1jBg==
X-HalOne-ID: ee3a7b61-b93f-11ee-a7a3-9f04b458b84a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id ee3a7b61-b93f-11ee-a7a3-9f04b458b84a;
 Mon, 22 Jan 2024 16:04:34 +0000 (UTC)
Date: Mon, 22 Jan 2024 17:04:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240122160433.GB511247@ravnborg.org>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
 <20240119195151.GB938671-robh@kernel.org>
 <20240120132356.GA345206@ravnborg.org>
 <6c6e4ddc-b3df-484e-961f-6efbd52defd6@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6e4ddc-b3df-484e-961f-6efbd52defd6@microchip.com>
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
Cc: conor+dt@kernel.org, Linux4Microchip@microchip.com, tzimmermann@suse.de,
 alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lee@kernel.org, bbrezillon@kernel.org,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 claudiu.beznea@tuxon.dev, Conor.Dooley@microchip.com, thierry.reding@gmail.com,
 mripard@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 u.kleine-koenig@pengutronix.de, daniel@ffwll.ch, airlied@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dharma,
On Mon, Jan 22, 2024 at 03:52:17AM +0000, Dharma.B@microchip.com wrote:
> On 20/01/24 6:53 pm, Sam Ravnborg wrote:
> > [You don't often get email from sam@ravnborg.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > Hi Sam & Rob,
> > Hi Dharma & Rob.
> > 
> >>> To make the DT binding backward compatible you likely need to add a few
> >>> compatible that otherwise would have been left out - but that should do
> >>> the trick.
> >>>
> >>> The current atmel hlcdc driver that is split in three is IMO an
> >>> over-engineering, and the driver could benefit merging it all in one.
> >>> And the binding should not prevent this.
> >>
> >> I agree on all this, but a conversion is not really the time to redesign
> >> things. Trust me, I've wanted to on lots of conversions. It should be
> >> possible to simplify the driver side while keeping the DT as-is. Just
> >> make the display driver bind to the MFD node instead. After that, then
> >> one could look at flattening everything to 1 node.
> > 
> > Understood and thinking a bit about it fully agreed as well.
> > Dharma - please see my comments only as ideas for the future, and
> > ignore them in this fine rewrite you do.
> > 
> >          Sam
> Based on your insights, I'm contemplating the decision to merge Patch 2 
> [PWM binding] with Patch 3[MFD binding]. It seems redundant given that 
> we already have a PWM node example in the MFD binding.
> 
> Instead of introducing a new PWM binding,
>    pwm:
>      $ref: /schemas/pwm/atmel,hlcdc-pwm.yaml
> 
> I will update the existing MFD binding as follows:
> 
> properties:
>    compatible:
>      const: atmel,hlcdc-pwm
> 
>    "#pwm-cells":
>      const: 3
> 
> required:
>    - compatible
>    - "#pwm-cells"
> 
As already commented, this looks nice.
But as Rob said, this should be a 1:1 conversion from text to yaml,
and then clean-up can come in the second step.

	Sam
