Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465C50EB30
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8EB10E1BC;
	Mon, 25 Apr 2022 21:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AD410E234
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:14:26 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id e189so18577300oia.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=X8qBR4k7N3biK/baIHugbINU/cSkeqhq6SIFIR2b73g=;
 b=BYv54WpQMfcQHf9EDLt0vgrF2mLVZ5MNLfSA6GV7H7W7HA8OQtn7WOTar0ykA6Lj4a
 UpNrT8Qi8xqIO/wlkhnFrZ5jjWJNWcJZpKzS02rhG2lomL9AdL2U+20NFJZVe9+KiWs5
 HjAvLJpl+dL1J7dLUDPXLywfNY6mcNrqC62mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=X8qBR4k7N3biK/baIHugbINU/cSkeqhq6SIFIR2b73g=;
 b=L0k9PH07CzVUPxFmfKRb6CZaOpBXYuaNWcCLHKXSnLwaFzFdV8KWe+6voiLDA4WTsm
 PzU0nQusApedYojMh61a4nds/39f23wGfMMT0igURn/oCdkpMfGaKk798SRApmwMcFR4
 Nh8y8n9sZR0YrS+8jMtfkrjmxmv4o+9YznIuNg9Vcc+A18IjW/llBg1RghFH55TJMs59
 O2S8O+2Qi6iRWSrtklXVhXHoBSSjURQ80gycK1K797rw6yhoPNEywJqqHi0U1tmIURjp
 vObUwnfH74qmGtaG+mTlaPZ16Y/A0HTMkEsCQKbfjmwA5ZKOsl76lGq74sQsrk25MLQD
 wNTw==
X-Gm-Message-State: AOAM533nHnwkjiXYWabgfSHFP/mxfeP9vfQ0gVDJ28RnNOcgwJeQEiNA
 Ql2orjtQCCMERsdqZ/SPigitjz6bWJscRLBYLe9IDw==
X-Google-Smtp-Source: ABdhPJztvQbfhKUVNaMO1H0yxKW2QJXWNd3iFmKb0M3Orpq7oisRwtkCiiqoU7PJj6ZXQ7WmO1sLao/x8L0uFXM5LbY=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5332637oiw.193.1650921265969; Mon, 25
 Apr 2022 14:14:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 14:14:25 -0700
MIME-Version: 1.0
In-Reply-To: <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 14:14:25 -0700
Message-ID: <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To: Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2022-04-25 14:06:42)
> We're supposed to list the supplies in the dt bindings but there are
> none in the DP controller bindings. Looking at the Linux driver and
> existing device trees, we can see that two supplies are expected:
> - vdda-0p9-supply
> - vdda-1p2-supply
>
> Let's list them both in the bindings. Note that the datasheet for
> sc7280 doesn't describe these supplies very verbosely. For the 0p9
> supply, for instance, it says "Power for eDP 0.9 V circuits". This
> this is obvious from the property name, we don't bother cluttering the
> bindings with a description.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  .../devicetree/bindings/display/msm/dp-controller.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index cd05cfd76536..dba31108db51 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -76,6 +76,9 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>
> +  vdda-0p9-supply: true
> +  vdda-1p2-supply: true
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
> @@ -137,6 +140,9 @@ examples:
>
>          power-domains = <&rpmhpd SC7180_CX>;
>
> +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;

Having 'a' in 'vdda' typically means 'analog' for 'analog' circuits, so
I'd expect this to only matter for the phy that contains the analog
circuitry. It would be great to remove the regulator code from
drivers/gpu/drm/msm/dp/dp_power.c and move the regulator_set_load() call
to the phy driver if possible. Hopefully qcom folks can help clarify
here.

> +        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
