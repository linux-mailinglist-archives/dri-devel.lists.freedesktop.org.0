Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C792983F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 16:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE01110E112;
	Sun,  7 Jul 2024 14:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WSLQIOrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EA810E112
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2024 14:00:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2AD14602E2;
 Sun,  7 Jul 2024 14:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B8C3277B;
 Sun,  7 Jul 2024 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720360805;
 bh=w6E61bZ+Nc7fH6AkO+e1UuyFuM7XFN8xxnB02WH7ZKU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WSLQIOrT+HiXM06ezax1CgdZzJMHs2tG5p/jyZL40Lyw64OJOn7VqHCvKzOnIun9w
 s6ST+JTzdDi/wUlJxGDtpaa7S67wAm8LsvS3nk6EF2jmqHpACQtZmaZhEN9ITntz9h
 oSlOd+vaSa6FqkrEQqIC26H/duwTwWRglBg+m8+vqVtwj/uOUguCQ1apde1zAXaOKo
 r8adn0m09tsmfZgiuAspuVbUhn9e3m/WQFOH2bmo0g411k/tqr10rq7BEDXSGVGW6u
 xlHDmlI7kiCyi/i0l/1/L5E4GrkAOYIYX9gukSOar80Orpno/GMgL2BbmICI6SbMho
 eDEjO6rBIVHvg==
Message-ID: <cd558335-6e72-46d1-911b-68ccbb211136@kernel.org>
Date: Sun, 7 Jul 2024 15:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-3-victor.liu@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240705090932.1880496-3-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2024 11:09, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing units
> that operate in a display clock domain.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> new file mode 100644
> index 000000000000..dc9579897b76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Display Engine
> +
> +description:
> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> +  is driven by a video timing and cannot be stalled. Implements all display
> +  specific processing.
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8qxp-dc-display-engine
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: cfg
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: shdload
> +      - const: framecomplete
> +      - const: seqcomplete
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  fsl,dc-de-id:
> +    description: Display Engine instance number
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

No, drop. For the same reason as earlier patch.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: video output

Eh, mixing children with and without addresses is considered poor design.

> +
> +patternProperties:
> +  "^dither@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: fsl,imx8qxp-dc-dither
> +
> +  "^framegen@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: fsl,imx8qxp-dc-framegen
> +
> +  "^gammacor@[0-9a-f]+$":

This looks like you are organizing bindings per your driver architecture.

Best regards,
Krzysztof

