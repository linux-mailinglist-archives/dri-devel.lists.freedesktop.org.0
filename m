Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F9786E7FA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 19:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418D110E662;
	Fri,  1 Mar 2024 18:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IK8N7CTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68BC10E662
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 18:10:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB8F761A09;
 Fri,  1 Mar 2024 18:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524E8C433C7;
 Fri,  1 Mar 2024 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709316609;
 bh=oGgDYAMEcOek5vzs12UcoMNqw0pBRI+Tp6Tw2lcrknA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IK8N7CTxXCT+ZohlOgRwslhOwKmwn14JE//RO0B49dvzoU0LIQhX04JV9TqoA6xB3
 kZH1ErLMAK+dq4z/Lne+YMOjfFwrtGAyeGR8QvXI2IyTdV7wrFEERyDKF29Lq6/xIQ
 z2Aal86VP39Ab2yob5tMqJ5CJLpBO6Nr/bhi5+oM4v2m+rdP+jy5IbmeNcDvj8HS3K
 S7C/BCRe4HE6QNg4pXYsrBGO7jlsdcqDho7ZRR65wFGKfRXi6SjxWewX+5ZiAEFCiL
 t1cUzHAxEKftKEJuTfm89UIrrIEMeMOO9zH2j//+g+54Uk4f8nRXg3lLRQVb+He3mV
 juJGoyCGAIgXw==
Date: Fri, 1 Mar 2024 12:10:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma.B@microchip.com
Cc: krzysztof.kozlowski@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Message-ID: <20240301181007.GA2481641-robh@kernel.org>
References: <20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com>
 <796652d5-af57-4aca-87c2-10a7b0b55959@linaro.org>
 <11c545e2-45df-4587-a5c7-12b05c2f01e0@microchip.com>
 <9bf7e492-891c-4d8f-b388-3b2ebae611c1@linaro.org>
 <e5cb705f-56cc-47cc-beb5-700c9a35c8cf@microchip.com>
 <34388175-7d5b-4f6b-b264-e85b84e98677@linaro.org>
 <dc8181d9-c7c9-4817-96f1-84a1b64575d6@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc8181d9-c7c9-4817-96f1-84a1b64575d6@microchip.com>
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

On Thu, Feb 29, 2024 at 06:25:56AM +0000, Dharma.B@microchip.com wrote:
> On 28/02/24 3:53 pm, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 28/02/2024 11:18, Dharma.B@microchip.com wrote:
> >> On 28/02/24 12:43 pm, Krzysztof Kozlowski wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On 28/02/2024 07:59, Dharma.B@microchip.com wrote:
> >>>>
> >>>>>
> >>>>> I don't know what's this exactly, but if embedded display then maybe
> >>>>> could be part of this device node. If some other display, then maybe you
> >>>>> need another schema, with compatible? But first I would check how others
> >>>>> are doing this.
> >>>>
> >>>> Okay, then I think the driver also needs to be modified, currently the
> >>>> driver parses the phandle and looks for these properties. Also the
> >>>> corresponding dts files.
> >>>
> >>> Driver does not have to be modified in my proposal. You would still have
> >>> phandle.
> >>
> >> If I understand correctly, I could define the dt bindings as below
> >>
> >>     display:
> >>       $ref: /schemas/types.yaml#/definitions/phandle
> >>       description: A phandle pointing to the display node.
> >>
> >>     panel:
> >>       $ref: panel/panel-common.yaml#
> >>       properties:
> >>
> > 
> > So these are standard panel bindings? Then the node should live outside
> > of lcdc. If current driver needs to poke inside panel and panel could be
> > anything, then probably you need peripheral-props-like approach. :/
> 
> Thank you so much, so can I use something like this
> 
>    display:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: A phandle pointing to the display node.
> 
> patternProperties:
>    "^panel":

Just 'panel' and not a pattern.

However, that's not what the original binding had. It was a separate 
node. If you want to preserve that, then you'll need a separate 
schema file and a special 'select'. Something like:

select:
  anyOf:
    - required: [ atmel,dmacon ]
    - required: [ atmel,lcdcon2 ]
    - required: [ atmel,guard-time ]

Up to you and at91 maintainers if you want to have to update your dts 
files or not.

Rob
