Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6683305C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BDE10E1EF;
	Fri, 19 Jan 2024 21:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8264810E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=pO8iBfnjG9hH6vbSRTnXqbEv232F90DY50ha8PvFEd8=;
 b=GjhB6wRaysDcllp1zsaNynkQl6JNvD+hw2s6dm55JB+H5rGwsfSuOcZwCpp/lTxl/tW2aDNE3z5MN
 cCvOWaF/N+ToEspVuSSnuBo8lOkUaVrjwSwe9Mao6GtlEfGoyVttyZq4CzBCuxJBNVPwITHT+XDF/d
 xCmbQtnQjMmh5WAe3LGVVn7hMkGrIbRdPEifGr3r3e5Vk0aYqyWLs8EoJEg0BLnf0pRNxtqOpifSLP
 DVUq8fj27NFfrJ8Zz/XqxG80zSTseJDWRryFpPf4WZbhGKwSVmENvDTHhLLoa0JpcuEViBFLJCmpXh
 r9GP2gowfi3qn7OXJhAZxLkYdx+O+5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=pO8iBfnjG9hH6vbSRTnXqbEv232F90DY50ha8PvFEd8=;
 b=5hc1wO07ZIzFI0AGFuC0N6Bpa19KNWG4JJyX/eWazj1u2M5PzREmbIABVmM0wXHM4e5cZxcwJvtgo
 tXdJqTLCQ==
X-HalOne-ID: 6d92ffab-b712-11ee-b81e-dfbeffc51846
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 6d92ffab-b712-11ee-b81e-dfbeffc51846;
 Fri, 19 Jan 2024 21:33:48 +0000 (UTC)
Date: Fri, 19 Jan 2024 22:33:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240119213347.GA304371@ravnborg.org>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
 <e308b833-8cfe-41c0-954e-f1470108394a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e308b833-8cfe-41c0-954e-f1470108394a@microchip.com>
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
 Linux4Microchip@microchip.com, tzimmermann@suse.de, devicetree@vger.kernel.org,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, robh+dt@kernel.org, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, mripard@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev,
 u.kleine-koenig@pengutronix.de, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dharma,

On Fri, Jan 19, 2024 at 08:41:04AM +0000, Dharma.B@microchip.com wrote:
> Hi Sam,
> On 19/01/24 1:00 am, Sam Ravnborg wrote:
> > [You don't often get email from sam@ravnborg.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Dharma et al.
> > 
> > On Thu, Jan 18, 2024 at 02:56:09PM +0530, Dharma Balasubiramani wrote:
> >> Converted the text bindings to YAML and validated them individually using following commands
> >>
> >> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> >> $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> >>
> >> changelogs are available in respective patches.
> >>
> >> Dharma Balasubiramani (3):
> >>    dt-bindings: display: convert Atmel's HLCDC to DT schema
> >>    dt-bindings: atmel,hlcdc: convert pwm bindings to json-schema
> >>    dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> > 
> > I know this is a bit late to ask - sorry in advance.
> > 
> > The binding describes the single IP block as a multi functional device,
> > but it is a single IP block that includes the display controller and a
> > simple pwm that can be used for contrast or backlight.
> yes.
> > 
> > If we ignore the fact that the current drivers for hlcdc uses an mfd
> > abstraction, is this then the optimal way to describe the HW?
> > 
> > 
> > In one of my stale git tree I converted atmel lcdc to DT, and here
> Are you referring the "bindings/display/atmel,lcdc.txt"?
Correct.

> > I used:
> > 
> > +  "#pwm-cells":
> > +    description:
> > +      This PWM chip use the default 3 cells bindings
> > +      defined in ../../pwm/pwm.yaml.
> > +    const: 3
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    maxItems: 2
> > +    items:
> > +      - const: lcdc_clk
> > +      - const: hclk
> > 
> > This proved to be a simple way to describe the HW.
> > 
> > To make the DT binding backward compatible you likely need to add a few
> > compatible that otherwise would have been left out - but that should do
> > the trick.
> again you mean the compatibles from atmel,lcdc binding?

If the new binding describes the full IP, as I suggest, then I assume
you need to add the compatible "atmel,hlcdc-pwm" to be backward
compatible. Otherwise users assuming the old binding will fail to find
the pwm info. I am not sure how important this is - but at least then
the device trees can be updated out of sync with the current users.

I hope this explains what I tried to say, otherwise do not hesitate to
get back to me.

	Sam
