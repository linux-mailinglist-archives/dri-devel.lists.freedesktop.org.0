Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043E64C040
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 00:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0590F10E371;
	Tue, 13 Dec 2022 23:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0647E10E1F0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 23:06:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b3so7575455lfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=kQ9UDEKrGBlUcNO4sH3ZDmuGjEg0UnW+K0pM704i6h4=;
 b=EGJYsfsdcAfUgmOpZg5H+z1o0EFyoU43QuVvL1htgp3oMzcw4T7CFqEnzUyIV6sEVH
 iMwFo/ZITg75aSSv9eHw1EMtytTUQZcoo1PpRnIjp2T/mqSWh9InDNRx0fnTCWSj8ELI
 a/A8MpamBle04ND8JnGfcgbBsnBgpTEck5elM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQ9UDEKrGBlUcNO4sH3ZDmuGjEg0UnW+K0pM704i6h4=;
 b=MNf1ZTn8SD1JjYqYabki3gCMhnkpeE39mjkOiVKta6EExCgu5qJ9nGVO7MIZDc9GkR
 U5oB8sWZBugNGyAixSF4ivj9x0Ao23mUkrT3cfTnpDN1Yp/UpDi91jGAOaUZv1McqfmG
 MY/njn01aAFpWOtKC+9791AoqEPzGkfh4qELZ+DpEz+Vxsnc/7LYK10Wyk498dT65Swn
 glzcSNrlRcXbIA4JpWZ/SSuwArOz0fH2IE1vaj/hWMR3M2YDcVsq/uTqfIFg/26hws1/
 OuAcXhBSe48TYyEU8pUbkwe3TyRgLW9y+0UqmFAEh8pUKflvBH9NKFroj3XA0eWKjXIS
 mlaA==
X-Gm-Message-State: ANoB5pmtID6dObWHaDPJUB3ZVgQW+vwMFW8NBSpIKKDJpx3vn33zVKVz
 /nLZBARTpxs4MuUSMyvEKzjkTbmAp0TCEpvym8EeHg==
X-Google-Smtp-Source: AA0mqf7E+0gYIlsn+eJZUnoQxwAAegzX06aJJjONxcWqY6lnTQGcJuvpNtrGrbvAPrVBHen0DXMLaf3G2kd78m/boGs=
X-Received: by 2002:ac2:4189:0:b0:4b1:2447:6971 with SMTP id
 z9-20020ac24189000000b004b124476971mr27184258lfh.83.1670972806927; Tue, 13
 Dec 2022 15:06:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Dec 2022 15:06:46 -0800
MIME-Version: 1.0
In-Reply-To: <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 13 Dec 2022 15:06:46 -0800
Message-ID: <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-12-13 13:44:05)
> Add both data-lanes and link-frequencies property into endpoint

Why do we care? Please tell us why it's important.

>
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
>
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
>
> Changes in v10:
> -- add menu item to data-lanes and link-frequecnis
>
> Changes in v11:
> -- add endpoint property at port@1
>
> Changes in v12:
> -- use enum for item at data-lanes and link-frequencies
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
                                                       ^
Stray ` here? -----------------------------------------/

> ---
>  .../bindings/display/msm/dp-controller.yaml        | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af..8fb9fa5 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -96,14 +97,37 @@ properties:
>
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: "/schemas/graph.yaml#/$defs/port-base"
>          description: Input endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
>
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: "/schemas/graph.yaml#/$defs/port-base"

I thought the quotes weren't needed?

>          description: Output endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

Does this need 'unevaluatedProperties: false' here?

> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +
> +              link-frequencies:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 1620000000, 2700000000, 5400000000, 8100000000 ]
> +
> +    required:
> +      - port@0
> +      - port@1
>
>  required:
>    - compatible
> @@ -193,6 +217,8 @@ examples:
>                  reg = <1>;
>                  endpoint {
>                      remote-endpoint = <&typec>;
> +                    data-lanes = <0 1>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>                  };

So far we haven't used the output port on the DP controller in DT.

I'm still not clear on what we should do in general for DP because
there's a PHY that actually controls a lane count and lane mapping. In
my mental model of the SoC, this DP controller's output port is
connected to the DP PHY, which then sends the DP lanes out of the SoC to
the next downstream device (i.e. a DP connector or type-c muxer). Having
a remote-endpoint property with a phandle to typec doesn't fit my mental
model. I'd expect it to be the typec PHY.

That brings up the question: when we have 2 lanes vs. 4 lanes will we
duplicate the data-lanes property in the PHY binding? I suspect we'll
have to. Hopefully that sort of duplication is OK?

Similarly, we may have a redriver that limits the link-frequencies
property further (e.g. only support <= 2.7GHz). Having multiple
link-frequencies along the graph is OK, right? And isn't the
link-frequencies property known here by fact that the DP controller
tells us which SoC this controller is for, and thus we already know the
supported link frequencies?

Finally, I wonder if we should put any of this in the DP controller's
output endpoint, or if we can put these sorts of properties in the DP
PHY binding directly? Can't we do that and then when the DP controller
tries to set 4 lanes, the PHY immediately fails the call and the link
training algorithm does its thing and tries fewer lanes? And similarly,
if link-frequencies were in the PHY's binding, the PHY could fail to set
those frequencies during link training, returning an error to the DP
controller, letting the training move on to a lower frequency. If we did
that this patch series would largely be about modifying the PHY binding,
updating the PHY driver to enforce constraints, and handling errors
during link training in the DP controller (which may already be done? I
didn't check).
