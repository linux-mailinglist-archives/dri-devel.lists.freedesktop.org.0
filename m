Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826A722D5A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 19:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CE710E2FC;
	Mon,  5 Jun 2023 17:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F4D10E1CB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 17:09:40 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-ba86ea269e0so6054969276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685984979; x=1688576979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4GWJEMZcMO5R6CDwitNhGNBkGuDXmhHZQItLXpH0uTo=;
 b=pdj/9TlRmRWlyOYd2VLiS64oTqpWOU5PMoiNL5+SGh4vpokaM+qFex8O9+ljopL6Ek
 HBHAvWJQ0M7e3j7sWibBIHzTbZ7f0rfjCT19VhAxApvCJvkBEPAgvtJD/iULeeRRvCsi
 K35kvKwzQOmmk0iNm9NTpfGFzEPZdQgW4GpiloBxi+Vz0V3YRJrdjU9HBlFfsBa4rHBZ
 AMMH3+pYaBrY1aT1mSRJiwNLndUGS6EZpe7XL9uEaZ5GKuZDs2fYRQG8OrwCZzXYkbDw
 +AMx1QTVgl/f3GRDvoqcC+bh1ZarvG2crDi3cMscnTGrZkgloX4ChOL359x5llIys0Fd
 qNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685984979; x=1688576979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4GWJEMZcMO5R6CDwitNhGNBkGuDXmhHZQItLXpH0uTo=;
 b=dAtqR/bJrbiQkD3Qw6WDuU9noNJIaTS3PTIiclHbFGce6rPeoewqzkEZmMlyT9VwK9
 SrC2VozlpbPE/WT/s4oBObJiKOjM8ExO7zB+trdupL6rl9UbCDl4RIM5VYSF+7pHU8DH
 OjxOcPbyXE+0TcWBeyGSZDRZM4sYZHtNHPBkYfWyr3/19GOKi6Ygq+L+ZOkVk0afFj7D
 xCO+7DMIPj6MwDmpVfgvQVHgmYlzrx+z0E6/jGVNnQURp1PNMZH92GQcPhDX7J0IAyXg
 YRNF3evL5AXiqaF/Gjn+pwkbpXl/yd6ksTPSnZnsDzPPMDGggaeg4d6aC78agbBg7cM3
 RmEw==
X-Gm-Message-State: AC+VfDyEG75TBf+aQAMhITl6uzNhyC/TUxlOOIrsj0uwwz0iNQb/TM+k
 X0C5n8sDGFNFAposkXPveu1aUhj4GYd9eXUyKGuMIw==
X-Google-Smtp-Source: ACHHUZ4p/Fv7/1YL5aK6ni9BSkRIpB2mD0PTUJxt1VEJdkmZiqICIOae+tEFI3eDyVtAjNHYulgKIeUo+lKq/F6nazA=
X-Received: by 2002:a25:ade5:0:b0:b9e:6d83:7bcf with SMTP id
 d37-20020a25ade5000000b00b9e6d837bcfmr12259782ybe.27.1685984979703; Mon, 05
 Jun 2023 10:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-5-998b4d2f7dd1@linaro.org>
 <e9da7236-5915-b9df-59dc-c2baa960f52b@linaro.org>
 <ea8d1808-b04c-332f-834a-c3f237e0b931@linaro.org>
In-Reply-To: <ea8d1808-b04c-332f-834a-c3f237e0b931@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Jun 2023 20:09:28 +0300
Message-ID: <CAA8EJprAiB8xrrx23fX95PnVockeH=6omppEwDJAxU6kGS5LwA@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] dt-bindings: display/msm: Add SM6375 MDSS
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Jun 2023 at 20:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4.06.2023 20:04, Krzysztof Kozlowski wrote:
> > On 23/05/2023 09:46, Konrad Dybcio wrote:
> >> Document the SM6375 MDSS.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
> >>  1 file changed, 216 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> >> new file mode 100644
> >> index 000000000000..3aa4f0470c95
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> >> @@ -0,0 +1,216 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6375-mdss.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm SM6375 Display MDSS
> >> +
> >> +maintainers:
> >> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
> >> +
> >> +description:
> >> +  SM6375 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
> >> +  like DPU display controller, DSI and DP interfaces etc.
> >> +
> >> +$ref: /schemas/display/msm/mdss-common.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: qcom,sm6375-mdss
> >> +
> >
> > Same as 6350 - drop items.
> Ack
>
> >
> > Similar concern about interconnects, although we don't have header file
> > for them, so I assume we will fill it up later.
> Yep, they'll come later and other SoCs may need a bump up for a third icc
> path soon..

4th ;-)

>
> Konrad
> >
> > Best regards,
> > Krzysztof
> >



-- 
With best wishes
Dmitry
