Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E85B466F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 14:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A84210E1CC;
	Sat, 10 Sep 2022 12:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C697310E1CC
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 12:55:07 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3452214cec6so48831277b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=H9+aEqiuPXTD/0BZaNY7OkRWAFHFJteXc5O3Y0RlriU=;
 b=mBHDGwsHzU8tUV9CsDzMvAXPhxljy4Z/pZKGE4kQymHkgT8ih+5G40SzDLbN0kydlr
 2tjDhbT4XnoRojq0JPdXDKumG2iQzpTlod5jENB0Cm9jPsLf+C8Pno1eaDHvK2vv0B94
 kEwzHuGm9EWHRfiL5Mi+LeccMdIBUaH3HdQCPcpJFiQLybFtiFFgow+Hb4LrlXukH5Jk
 6MQn8oaQF5MsKJZ/DHvGM+7k+ekMr/btC25EG+mB3XqY74ddKV4jEin1nU1so8g744At
 T1F+z15ipWU2Fji4Ho5ed+7xdgKVX6OvR6gIkUvrdVIsEDmRHc3wpW8aeTJmAwBVbZke
 a44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=H9+aEqiuPXTD/0BZaNY7OkRWAFHFJteXc5O3Y0RlriU=;
 b=DrA5XwZoBi5iiyE4xZgbLXwGSUe3oHGSmc8q5cMUJ4uXQIl+mCv5F1HQDsVqQQzicE
 Jm9ESgUkB1bRsI0pEpBXCHa2V5NbQKoUiZpJM6AV0ZTCmWAzz2vadDZ/sWf7yE1kVkS5
 iIeaF4RkomC2FEPADEkl92F49944Z/9+c/4T74K43PBeB/UuE5O4DdNrJaR4Dsb2flaL
 RPX8bmv41mLFqkZcerA6Za9SAzckkz7mt76JBK9UmZyKc9739Rpkx16/w60ODyVaC++Y
 dSPWJ9PFm18FkjKfl53M33LT4PT2dDhgmgnC+cIIkKBWGuQr7lkna+5da97rj1RTv6Es
 f6bw==
X-Gm-Message-State: ACgBeo3FiBtf5PmZ+2JRpzXY6VhWtWDAzJSvTSXad3ZBT8z/d2IbocFI
 WycisTC1haL5SA5G5rJ14AasLZQ9v90OgG7h7UV72g==
X-Google-Smtp-Source: AA6agR5M01fLD1dnWRcihDf9ksYjlQdjkT0J9p3TdYpAK/1HdHOcbQhPoqH8kNrR1WJrJnAvY1r3ksR1w8AubJ+eWUI=
X-Received: by 2002:a0d:ffc5:0:b0:341:6cc1:c589 with SMTP id
 p188-20020a0dffc5000000b003416cc1c589mr15944568ywf.418.1662814506532; Sat, 10
 Sep 2022 05:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
In-Reply-To: <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Sep 2022 15:54:55 +0300
Message-ID: <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,
 mdss bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Sept 2022 at 11:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/09/2022 00:23, Rob Herring wrote:
> >>>>
> >>>> This should be ref to dsi-controller-main.yaml... or based on previous
> >>>> Rob's feedback you dropped it everywhere in children?
> >>>
> >>> I don't think I said. I thought about it some, as yes, we normally have
> >>> done as you suggested. The downside is with a ref we'll do the whole
> >>> validation of the child node twice (unless the referenced schema has a
> >>> 'select: false') whereas here only 'compatible' is validated twice. This
> >>> way also complicates checking for unevaluatedProperties/additionalProperties.
> >>>
> >>> So maybe better to keep with the 'normal' way and make this a ref.
> >>
> >> Well.. I tried using $ref in the previous iteration, but then I faced
> >> the fact that I can not use it. Using the $ref the node gets validated
> >> even if it is disabled, and we do not want to do this. The nodes are
> >> usually split in way that regulators are specified in the board DT file.
> >> Thus disabled dsi/dsi-phy nodes do not get all the required regulators.
> >> And dt-validate happily dumps tons of warnings for disabled nodes. Thus
> >> I ended up with the compatible rather than $ref.
> >
> > Only warnings about required properties? Those are supposed to get
> > filtered out if the node is disabled. Maybe being in a $ref doesn't
> > work.
>
> This seems to break regardless it is in $ref or when you directly
> reference the schema.
>
> I tested display/msm/dpu-sc7180.yaml on modified DTB when a required
> property is missing (I removed reg-names) and:
>
> 1. When node is enabled:
>
> c7180-idp.dtb: display-controller@ae01000: 'reg-names' is a required
> property
>
>         Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>
> rch/arm64/boot/dts/qcom/sc7180-idp.dtb: display-controller@ae01000:
> Unevaluated properties are not allowed ('interrupt-parent',
> 'interrupts', 'operating-points-v2', 'opp-table', 'ports',
> 'power-domains' were unexpected)
>
>
> 2. When node is disabled the first error disappears (so no clue which
> one is missing) but schema does not pass:
>
> qcom/sc7180-idp.dtb: display-controller@ae01000: Unevaluated properties
> are not allowed ('interrupt-parent', 'interrupts',
> 'operating-points-v2', 'opp-table', 'ports', 'power-domains' were
> unexpected)
>
>         From schema: Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>
>
> However I think there is no such problem, as Dmitry said, that ref
> changes anything. There will be always failure - either from parent
> schema (using $ref) or from device child schema (the one which actually
> misses the property).

Initially I stumbled upon this issue with the dsi and dsi_phy nodes
for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
emit warnings regarding the missing -supply properties despite nodes
being disabled. If I use `compatible' here, the schema checks pass.
Thus I'd prefer to leave `compatible' here. Not to mention that it
also allows specifying a tighter binding than just using the $ref.

-- 
With best wishes
Dmitry
