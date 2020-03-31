Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23299199D45
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 19:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB086E86D;
	Tue, 31 Mar 2020 17:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA526E86D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 17:54:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o127so22686970iof.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VVqxzqCk/8iKLQzhs53o31LGL6xk02tsOhwWahTs5eM=;
 b=Od3rK8pbcTOj/8dJzBy2yjBEw37rAmJaCo9ftCYHjrXWfi9jSkwiTjEANq2yvT2PYC
 utajjafV02/W+bUajz/eKHLTjRGuh7Qpo0gaHXgMnVhvD8Wj402rlWD8n8VyKQmECTt3
 GlR7AyGHxM8GQN89KoAjQSMOXH0HoyZ2WaKI1GCruoTcnC+9s/NCXcXF3EO0AX2z4FAf
 LOEEVQW4GM53v7BoBSXPD2KlsOunFsQr1qWER5yzVGBg8SX9hQIkN2kz2hWUgFzrjKdq
 RyU+P+smGtUOYauB4IXk8iBVGEIaCwiZZ11tUf82PmLqfZ0lbxA1Yix4nGrEG8wPWE2D
 m5vg==
X-Gm-Message-State: ANhLgQ20EuUhO/bEr+TfOYzknAq1/vufVlJ1eOwMkVlbWHQl3pKbrNPs
 RCJhnb19VW/Xh0Mt34DT7Q==
X-Google-Smtp-Source: ADFU+vvXkSukGu2SPM2EgxgtLqkTK+D0VHQKKIdwAmLB0GUZ/sqJRqKEYT5sgfJXFkvT0QhqMfsF6A==
X-Received: by 2002:a05:6602:164b:: with SMTP id
 y11mr16703395iow.3.1585677245141; 
 Tue, 31 Mar 2020 10:54:05 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id l70sm6185605ili.81.2020.03.31.10.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 10:54:04 -0700 (PDT)
Received: (nullmailer pid 25121 invoked by uid 1000);
 Tue, 31 Mar 2020 17:54:01 -0000
Date: Tue, 31 Mar 2020 11:54:01 -0600
From: Rob Herring <robh@kernel.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200331175401.GA9791@bogus>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 -----------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 184 +++++++++++++++++++++
>  2 files changed, 184 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> new file mode 100644
> index 0000000..8a388bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for Qualcomm Technologies, Inc. WLED driver
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>

Should be the h/w owner (you), not who applies patches.

> +
> +description: |
> +  WLED (White Light Emitting Diode) driver is used for controlling display
> +  backlight that is part of PMIC on Qualcomm Technologies, Inc. reference
> +  platforms. The PMIC is connected to the host processor via SPMI bus.
> +
> +properties:
> +  compatible :

Drop the space ^

> +    enum:
> +       - qcom,pm8941-wled
> +       - qcom,pmi8998-wled
> +       - qcom,pm660l-wled

Wrong indent (1 space too many).

> +
> +  reg:
> +    maxItems: 1
> +
> +  default-brightness:
> +    maxItems: 1

maxItems is for arrays and this is a single scalar.

> +    description:
> +      brightness value on boot, value from 0-4095.

0-4095 sounds like a constraint.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

There should be a common definition for this.

> +        default: 2048
> +
> +  label:
> +    maxItems: 1
> +    description:
> +      The name of the backlight device.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string

Already has a type. Just 'label: true' is enough.

> +
> +  qcom,cs-out:
> +    description:
> +      enable current sink output.
> +      This property is supported only for PM8941.
> +    type: boolean
> +
> +  qcom,cabc:
> +    description:
> +      enable content adaptive backlight control.
> +    type: boolean
> +
> +  qcom,ext-gen:
> +    description:
> +      use externally generated modulator signal to dim.
> +      This property is supported only for PM8941.
> +    type: boolean
> +
> +  qcom,current-limit:
> +    maxItems: 1

Not an array.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      mA; per-string current limit; value from 0 to 25 with

25 sounds like a constraint.

> +      1 mA step. This property is supported only for pm8941.
> +    default: 20
> +
> +  qcom,current-limit-microamp:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

properties with unit suffix already have a type.

> +    description:
> +      uA; per-string current limit; value from 0 to 30000 with
> +      2500 uA step.

steps can be expressed using 'multipleOf'

> +    default: 25

25 can never be a multiple of 2500

> +
> +  qcom,current-boost-limit:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      mA; boost current limit.
> +      For pm8941 one of 105, 385, 525, 805, 980, 1260, 1400, 1680.
> +      Default, 805 mA.
> +      For pmi8998 one of 105, 280, 450, 620, 970, 1150, 1300,
> +      1500. Default 970 mA.

Constraints.

> +
> +  qcom,switching-freq:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      kHz; switching frequency; one of 600, 640, 685, 738,
> +      800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
> +      4800, 9600.
> +      Default for pm8941 1600 kHz
> +               for pmi8998 800 kHz

Constraints!

> +
> +  qcom,ovp:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      V; Over-voltage protection limit; one of 27, 29, 32, 35. Default 29V
> +      This property is supported only for PM8941.
> +
> +  qcom,ovp-millivolt:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      mV; Over-voltage protection limit;
> +      For pmi8998 one of 18100, 19600, 29600, 31100.
> +      Default 29600 mV.
> +      If this property is not specified for PM8941, it
> +      falls back to "qcom,ovp" property.
> +
> +  qcom,num-strings:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number of led strings attached;
> +      value for PM8941 from 1 to 3. Default 2
> +      For PMI8998 from 1 to 4.
> +
> +  interrupts:
> +    maxItems: 2

items:
  - description: ...
  - description: ...

> +    description:
> +      Interrupts associated with WLED. This should be
> +      "short" and "ovp" interrupts. Interrupts can be
> +      specified as per the encoding listed under
> +      Documentation/devicetree/bindings/spmi/
> +      qcom,spmi-pmic-arb.txt.

encoding is outside the scope of the binding.

> +
> +  interrupt-names:
> +    description:
> +      Interrupt names associated with the interrupts.
> +      Must be "short" and "ovp". The short circuit detection
> +      is not supported for PM8941.

Names should be constraints.

> +
> +  qcom,enabled-strings:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Array of the WLED strings numbered from 0 to 3. Each
> +      string of leds are operated individually. Specify the
> +      list of strings used by the device. Any combination of
> +      led strings can be used.
> +
> +  qcom,external-pfet:
> +    description:
> +      Specify if external PFET control for short circuit
> +      protection is used. This property is supported only
> +      for PMI8998.
> +    type: boolean
> +
> +  qcom,auto-string-detection:
> +    description:
> +      Enables auto-detection of the WLED string configuration.
> +      This feature is not supported for PM8941.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - label
> +
> +examples:
> +  - |
> +    pm8941-wled@d800 {

backlight@...

> +        compatible = "qcom,pm8941-wled";
> +        reg = <0xd800 0x100>;
> +        label = "backlight";
> +
> +        qcom,cs-out;
> +        qcom,current-limit = <20>;
> +        qcom,current-boost-limit = <805>;
> +        qcom,switching-freq = <1600>;
> +        qcom,ovp = <29>;
> +        qcom,num-strings = <2>;
> +        qcom,enabled-strings = <0 1>;
> +     };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
