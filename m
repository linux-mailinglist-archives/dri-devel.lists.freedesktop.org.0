Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246B47F4B7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 00:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A1F10E17C;
	Sat, 25 Dec 2021 23:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41C610E17B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Dec 2021 23:34:20 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id l11so11187727qke.11
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Dec 2021 15:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hKmiJe9CRNgJf7UKsyNMbeFwV2C9Zr81lTDn8hmzix0=;
 b=Q28iL1AYg7u1wgTeD88BO76yK/PvAg1JIx36hv5AeDOftSk4C7vX5+x+5QS1SwieAI
 NvS341MRKNZGbrh0IiT7H9JPT2EWO6agyxWdOHoON+E0SEu+mL7GEHl0FIq3DLgEKnhI
 vl56SmnmhpxPn94uYVCXUDMyb7OkwkrqlHR49xnoinLoUcMXi7PRR3xzBOFMYkBiQfFD
 ak7lQWyG5eC9GjS5kxSS8RxZGL6qb8pN/VpspvQXtb8JS6KQd5OQsVQfNl0joVzjHnK3
 F2JsDFNDUoQXUtnJ05RoRnRHrgLZmbqdD7lLn1xC5M3EBxPHrDfuC5A+hMMLKFqFfiPd
 JdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKmiJe9CRNgJf7UKsyNMbeFwV2C9Zr81lTDn8hmzix0=;
 b=3VJSjrRGkbc6XsC6p34l15g7aAGyysFPRkpuh04Bgf3QaH8PcDFrtnZooikxinf/4w
 ACBMtmCUpkINGOh+sIxobaNwKnC1nfk+GiSVVn5R+CYCnnnDzoP8k0LOFr9pl8yWmc1o
 0XyegDN4R22eTH7cPxh9nmbKM7OtKJJ7RETIiQqhGsY808YVBwdlN5yx9GJbNA9ebfLl
 KXn55yjJUib3+MhbkW6ZLodVLy0hu+3fN3E0+Sv6G/OqOx6wQsRPM/pa4qAQvVTLsgRv
 E92RHOwb7m24Q5KTjMq8SBuGY9qiGLml9ClrtToaC3EF/mdfY+bJNG/atkU9CjNcDpPT
 as4g==
X-Gm-Message-State: AOAM533YM0y680WCM8yxJ19ICOXq/lT3W9vReiXqmRAF92n4pdnf1vr9
 8N2TLDnccPu9BdXCHx4Yed9r7ZRf1Nre1CLyPwfz3Q==
X-Google-Smtp-Source: ABdhPJycrFxGBnGfEcnR2q0JIRn89NOokVvBiwqZGL7sWhIfpdXaSUXQlfcv2oQSwG3HlxQE75zgkhzz7s2ETGg2eMQ=
X-Received: by 2002:a05:620a:797:: with SMTP id
 23mr8425912qka.30.1640475259623; 
 Sat, 25 Dec 2021 15:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20211225205352.76827-1-david@ixit.cz>
In-Reply-To: <20211225205352.76827-1-david@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Dec 2021 02:34:08 +0300
Message-ID: <CAA8EJpoVuNDS2uD2g8W_40XVO2jS=6GtRQFxAnyPpd_QuHim8g@mail.gmail.com>
Subject: Re: [PATCH] Discussion: dt-bindings: display: msm:
 dsi-controller-main: fix the binding
To: David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 25 Dec 2021 at 23:54, David Heidelberg <david@ixit.cz> wrote:
>
> This binding is not much validating the old DSI v2.
>
> Currently we don't differentiate old v2 from new versions,
> so we need to figure out how to validate them.
>
> I propose specific compatible depending on mdss version, but I would be
> glad, if someone with deeper knowledge proposed the names.
>
> I'm willing to implement it then and back from autodetection.

I'd suggest to use hardware-specific compatible for apq8064 (and maybe
other v2 hosts if somebody adds support). For example
"qcom,apq8064-dsi-ctrl" or "qcom,dsi-ctrl-apq8064" (no strong
preference here).
For 6G hosts it will probably make sense to use IP versions instead
("qcom-dsi-ctrl-6g-v2.4.1").

>
> David
> ---
>  .../display/msm/dsi-controller-main.yaml      | 53 ++++++++++++-------
>  1 file changed, 35 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 35426fde8610..6688ddcd7526 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -27,22 +27,34 @@ properties:
>      maxItems: 1
>
>    clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display escape clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> +    oneOf:
> +      - minItems: 7 # APQ8064
> +        maxItems: 7
> +      - items:
> +          - description: Display byte clock
> +          - description: Display byte interface clock
> +          - description: Display pixel clock
> +          - description: Display escape clock
> +          - description: Display AHB clock
> +          - description: Display AXI clock
>
>    clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +    oneOf:
> +      - items: # DSI v2 (APQ8064)
> +          - const: iface # from dsi_v2_bus_clk_names
> +          - const: bus
> +          - const: core_mmss
> +          - const: src # from dsi_clk_init_v2
> +          - const: byte # from dsi_clk_init
> +          - const: pixel
> +          - const: core
> +      - items:
> +          - const: byte
> +          - const: byte_intf
> +          - const: pixel
> +          - const: core
> +          - const: iface
> +          - const: bus
>
>    phys:
>      maxItems: 1
> @@ -66,15 +78,17 @@ properties:
>
>    assigned-clocks:
>      minItems: 2
> -    maxItems: 2
> +    maxItems: 4
>      description: |
>        Parents of "byte" and "pixel" for the given platform.
> +      For older v2, "byte", "esc", "src" and "pixel".
>
>    assigned-clock-parents:
>      minItems: 2
> -    maxItems: 2
> +    maxItems: 4
>      description: |
>        The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
> +      For older v2, Byte, Escape, Source and Pixel clock PLL outputs.
>
>    power-domains:
>      maxItems: 1
> @@ -124,6 +138,9 @@ properties:
>        - port@0
>        - port@1
>
> +patternProperties:
> +  '^(avdd|vdd|vdda)-supply$': true # FIXME only APQ8064 supplies
> +
>  required:
>    - compatible
>    - reg
> @@ -135,8 +152,8 @@ required:
>    - phy-names
>    - assigned-clocks
>    - assigned-clock-parents
> -  - power-domains
> -  - operating-points-v2
> +  # - power-domains # v2 doesn't seems to need it?
> +  # - operating-points-v2 # v2 doesn't have opp implemented yet
>    - ports
>
>  additionalProperties: false
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
