Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25654B51617
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725EE10E2D0;
	Wed, 10 Sep 2025 11:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fTUmsG5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AA910E2D0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:50:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 508FD4387A;
 Wed, 10 Sep 2025 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D60CC4CEF0;
 Wed, 10 Sep 2025 11:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757505030;
 bh=Mqve2GlzuCnytDpGTk9tHKkadC70O5DHUUGd7vf/G5w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fTUmsG5HDreIpInwmgyZdNcXNx2hqdqP6qfXcPywMRX9Hj1Ru3YkS7n6GPpXECYdz
 mFiuMbqFopUta/wM3P2gMcyok8tOMih3woSxLB6BF5dYcTlFIdzJlt9VAM39M8INeW
 q3WQNOdElVDgMoJIXXm6ods1NWvC8/TiEILn0nCvEgWsszNEZztNf4jjcr1RGZjb9V
 Z+k17mqFFVTAB1oaWfdLYkNc80vZbv9dNAG4giobT4C0vwmBRkMbzG9jv4mvAhmjVB
 T5bHSH4zByLazl7SvyqpVs6FmFz7CIkmWrgZR499DYw2K441qsihyB/+ffKFQcP/Yu
 3lWFU8FQ008xw==
Message-ID: <c6c80870-386b-473d-b643-bcd64c86c692@kernel.org>
Date: Wed, 10 Sep 2025 13:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
 <20250910-leds-v4-1-1fc320488233@vinarskis.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250910-leds-v4-1-1fc320488233@vinarskis.com>
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

Hi Aleksandrs,

Thank you for your continued work on this.

One small remark below.

On 10-Sep-25 1:07 PM, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..045b7a4fcd3bdcfb19a02fe4435b40445c168115
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common leds consumer
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  Some LED defined in DT are required by other DT consumers, for example
> +  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> +  approach which is typically used as 'soft' binding, referencing LED
> +  devices by phandle makes things simpler when 'hard' binding is desired.
> +
> +  Document LED properties that its consumers may define.
> +
> +select: true
> +
> +properties:
> +  leds:
> +    oneOf:
> +      - type: object
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description:
> +          A list of LED device(s) required by a particular consumer.
> +        items:
> +          maxItems: 1
> +
> +  led-names:
> +    description:
> +      A list of device name(s). Used to map LED devices to their respective
> +      functions, when consumer requires more than one LED.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    leds {
> +        compatible = "gpio-leds";
> +
> +        privacy_led: privacy-led {
> +            color = <LED_COLOR_ID_RED>;
> +            default-state = "off";
> +            function = LED_FUNCTION_INDICATOR;
> +            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      v4l2_node: camera@36 {
> +        reg = <0x36>;
> +
> +        leds = <&privacy_led>;
> +        led-names = "privacy-led";

This should probable be:

        led-names = "privacy";

Now without the "-led".

Regards,

Hans


