Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FEC58F2F0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5910113D1A;
	Wed, 10 Aug 2022 19:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251111B443;
 Wed, 10 Aug 2022 19:20:32 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id l24so12945636ion.13;
 Wed, 10 Aug 2022 12:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=eax0+SGVw4tBj19ILUSTbTcJRsETWk3FdReG+6FrUnA=;
 b=emyFkF953MkZyFV8jXD8on0pru6/xoFq2hZYuP0cAV7KVDiLUyQ5OhZjXytBsQnEpR
 FkYLaus2NNMQ+/4+TO54FDc+wvynKJNb48h+RYoavNHmgZMKw1cEojDmv4pz7e/cy4YI
 y7FP/CRb7HrAJEZQjEJwyb4G3Hckx+DAf1EWzcu+LoaNb//sot76cdC+jgasIXC/rZmB
 hUSCIkMBYOccwVxXQeofCNjf1SsCnNT7WKewg6axvbCQ1xJi9L5h6G52OE7XXnFz/xn3
 Ty1tdtQnQVmXrOfuRd995G2AlqjgJ92cACPtC3kMhKX7aZ76gPHU+AKnNTeRBZHlMpgJ
 3XHQ==
X-Gm-Message-State: ACgBeo0BZ/KBRKb+Nzl8TxS13JwqvcrKP3mzU5rf/1ZAkI5rOZHd5BuT
 hnFODpdKojKul/DhHfMcmw==
X-Google-Smtp-Source: AA6agR6FFKbmn+Fpy3ft72ITauYQistHwXv5H9dilXQOuhTLEsIachLlOd8qiJZOFeLXy1VKLShs/Q==
X-Received: by 2002:a05:6638:24d0:b0:342:70d4:7ad1 with SMTP id
 y16-20020a05663824d000b0034270d47ad1mr13422064jat.14.1660159232216; 
 Wed, 10 Aug 2022 12:20:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a02c543000000b003427e69f2b8sm7775181jaj.144.2022.08.10.12.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:20:31 -0700 (PDT)
Received: (nullmailer pid 378129 invoked by uid 1000);
 Wed, 10 Aug 2022 19:20:29 -0000
Date: Wed, 10 Aug 2022 13:20:29 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Message-ID: <20220810192029.GF200295-robh@kernel.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-2-bjorn.andersson@linaro.org>
 <c5cc8752-d7e2-b870-6887-c025137ed8a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5cc8752-d7e2-b870-6887-c025137ed8a1@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 05:47:52PM +0300, Krzysztof Kozlowski wrote:
> On 10/08/2022 06:50, Bjorn Andersson wrote:
> > Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> > Qualcomm SDM845 and SC8280XP platforms.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 94bc6e1b6451..90f9302d1731 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -16,11 +16,14 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > +      - qcom,sdm845-dp
> >        - qcom,sc7180-dp
> 
> Alphabetical order, please.
> 
> The DTS warnings from the bot look unrelated to this patch.

Yes, but there are a ton of them and I thought Bjorn might care. Looks 
like the schema is pretty out of sync with reality and they don't really 
look like dts side fixes.

Rob
