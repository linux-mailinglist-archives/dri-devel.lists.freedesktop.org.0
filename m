Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A635550EB41
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480BA10E368;
	Mon, 25 Apr 2022 21:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A58C10E368
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:18:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d6so14912403ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=24iOF1MSGz5s6cCyjfamucZLvCAzW+z+udRAosCU0zY=;
 b=IKCjLomd/fBFKtHP7jTm5t+W2FCOv7AOIpQTxPrtj949PY1Tsrb/D6jZuxB1xNoSYP
 GWBX5KG9TOQnKlzchsow3SoefF2kBW7rQ2HKQYl95HTmbBgI32JNTGqDNermeWSyTZtL
 Hf42Do0mf0k3Q96cMYnFlH/CAVL53m+8sBlv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=24iOF1MSGz5s6cCyjfamucZLvCAzW+z+udRAosCU0zY=;
 b=1Gos4XvdpWDQIkUT5G7H5cTd4DpQIXBjpYNJsSpmc4vKrZnGNQLMEp8jbWA22zdxb6
 gvpcwu6BNzuJlTxKXRIFwV3K2fUK9C7LOg3u4YP4bCH32V6/x55nJpgdf7PGP0TNzbmN
 kjf7kQX33LLa311IdyZt/5XloYaTdBnQrMeUpDEAU36skXOxbKTrR4T6txrAOxFbvK/H
 r1MUas/gYxmrLxwLIZ7qGPNuSgyg7vVNbusMY6yJe419B5Emebfd1pTVIhT9DsdnwdnA
 yXh5ScqO1a65iYHFD4+kzdFTor6NnBtsJN6OdiXHa11tBzlEanmsnGDeN9jZFuJvasZ5
 k6gQ==
X-Gm-Message-State: AOAM532hob2cBn4LK0Qkq0ojuEAMwa7/46ddLAwwVAFt7H8RnNas4Gkg
 jGxRFTUjQ29htrcx0f4xkEG8JLHx6wuHiva+
X-Google-Smtp-Source: ABdhPJzmncznnWrk2+wgI2nBZ1lPxUzlqjxPDDHA4MNS1bKOnTR/UKsMVS7L9f8twI/wPKMoK8GGjg==
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr21080264edb.288.1650921535652; 
 Mon, 25 Apr 2022 14:18:55 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 i12-20020a05640200cc00b00421058b175esm5117089edu.53.2022.04.25.14.18.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:18:53 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so317541wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:18:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr26954889wmb.29.1650921531776; Mon, 25
 Apr 2022 14:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
In-Reply-To: <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Apr 2022 14:18:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
Message-ID: <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, quic_kalyant <quic_kalyant@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-phy@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 25, 2022 at 2:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-04-25 14:06:42)
> > We're supposed to list the supplies in the dt bindings but there are
> > none in the DP controller bindings. Looking at the Linux driver and
> > existing device trees, we can see that two supplies are expected:
> > - vdda-0p9-supply
> > - vdda-1p2-supply
> >
> > Let's list them both in the bindings. Note that the datasheet for
> > sc7280 doesn't describe these supplies very verbosely. For the 0p9
> > supply, for instance, it says "Power for eDP 0.9 V circuits". This
> > this is obvious from the property name, we don't bother cluttering the
> > bindings with a description.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  .../devicetree/bindings/display/msm/dp-controller.yaml      | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index cd05cfd76536..dba31108db51 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -76,6 +76,9 @@ properties:
> >    "#sound-dai-cells":
> >      const: 0
> >
> > +  vdda-0p9-supply: true
> > +  vdda-1p2-supply: true
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> > @@ -137,6 +140,9 @@ examples:
> >
> >          power-domains = <&rpmhpd SC7180_CX>;
> >
> > +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
>
> Having 'a' in 'vdda' typically means 'analog' for 'analog' circuits, so
> I'd expect this to only matter for the phy that contains the analog
> circuitry. It would be great to remove the regulator code from
> drivers/gpu/drm/msm/dp/dp_power.c and move the regulator_set_load() call
> to the phy driver if possible. Hopefully qcom folks can help clarify
> here.

Interesting. Oddly enough, the sc7280 datasheet doesn't list the "_A".
It calls these "VDD_VREF_0P9" and "VDD_VREF_1P2". However, on the
schematic in front of me someone labeled these pins on the sc7280 with
the "A". ...and the driver looks for a supply with the "a". :-/

It would be good to get clarification from someone with better information.

-Doug
