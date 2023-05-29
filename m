Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB5714909
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D294C10E276;
	Mon, 29 May 2023 12:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF3610E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:05:16 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4A9FE20090;
 Mon, 29 May 2023 14:05:13 +0200 (CEST)
Date: Mon, 29 May 2023 14:05:11 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Visionox R66451
 AMOLED DSI panel bindings
Message-ID: <as7krteqlebacth7agthw23vkjicdasx6lgen3zrmc2zgj6o74@srxljdzvq4xt>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-1-4210bcbb1649@quicinc.com>
 <dzekdzubv6y5evn4j62hnntjdexcdi5ar2wj6hcm3dffx5jei4@h32wgmfalzvl>
 <0d436948-b0b7-0727-0852-51f64aefa43f@linaro.org>
 <sf4fsrvuvgn42ucrwgqlrgprlr3sofq4wqeeuxryzeubxqs4kz@r4dmwzproti4>
 <1c5dd13f-8221-09e6-5b7d-a06135ce97f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c5dd13f-8221-09e6-5b7d-a06135ce97f7@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-26 09:42:33, Neil Armstrong wrote:
> On 22/05/2023 16:51, Marijn Suijten wrote:
> > On 2023-05-22 11:05:38, Neil Armstrong wrote:
> >> On 21/05/2023 12:30, Marijn Suijten wrote:
> >>> On 2023-05-16 13:20:30, Jessica Zhang wrote:
> >>>> Document the 1080x2340 Visionox R66451 AMOLED DSI panel bindings
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> ---
> >>>>    .../bindings/display/panel/visionox,r66451.yaml    | 59 ++++++++++++++++++++++
> >>>>    1 file changed, 59 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..6ba323683921
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
> >>>> @@ -0,0 +1,59 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/display/panel/visionox,r66451.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Visionox R66451 AMOLED DSI Panel
> >>>> +
> >>>> +maintainers:
> >>>> +  - Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> +
> >>>> +allOf:
> >>>> +  - $ref: panel-common.yaml#
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: visionox,r66451
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +    description: DSI virtual channel
> >>>> +
> >>>> +  vddio-supply: true
> >>>> +  vdd-supply: true
> >>>> +  port: true
> >>>> +  reset-gpios: true
> >>>
> >>> Normally for cmd-mode panels there is also a `disp-te` pin which is
> >>> optionally registered in dsi_host.c as GPIOD_IN, but on **ALL** my Sony
> >>> phones this breaks vsync (as in: mdp5 stops receiving the interrupt, but
> >>> we can see disp-te in /proc/interrupts then).
> >>
> >> Describing it as a gpio is wrong, it should be described as a pinctrl state instead.
> > 
> > We defined both in our DTS, what weirdness does it cause when then
> > requested using GPIOD_IN?  It'd still be beneficial to see the vsync
> > interrupt raise in /proc/interrupts (but it's just a waste of CPU cycles
> > OTOH, this is all handled in the MDP hardware after all, so it's not
> > something I'd like to enable by default).
> 
> Sure, but it's a sw hack, the pin has a TE function which directly goes to
> the DSI logic, claiming it as a GPIO will set it as GPIO function.
> 
> On some platforms, PINMUX is only on output and input is always directed
> to all HW blocks, seems it's not the case here !

Ah that makes total sense!  The PINGROUP() is only passed this mdp_vsync
function but internally provides the gpio function as well, which it'd
have to use to read it as GPIO from the SoC-side: and this indeed seems
to "disconnect" that pin from the MDP HW block.  Thanks for mentioning
this, I totally overlooked it.

Should we document/clarify this in any way, or perhaps remove the
disp-te handling altogether (dsi_host.c doesn't use this interrupt for
anything, though we could leave it for debug purposes if describing /
wrapping it more clearly).  Downstream also sets this pin in DT but
doesn't ever request a GPIO/IRQ on it, afaik.

- Marijn

> > Anyway, this is what we ended up doing to "fix" the bug (only bias the
> > pin via pinctrl, omit the disp-te DTS property).  Thanks for confirming!
> > 
> > - Marijn
> > 
> >>
> >> Neil
> > 
> > <snip>
> 
