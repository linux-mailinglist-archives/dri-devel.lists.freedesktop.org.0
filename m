Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0566A4D2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D417F10E203;
	Fri, 13 Jan 2023 21:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5C10E203;
 Fri, 13 Jan 2023 21:11:16 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 f88-20020a9d03e1000000b00684c4041ff1so3201922otf.8; 
 Fri, 13 Jan 2023 13:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luAGLKKbhZaaB2JSoQizSdSMKFqku7/SQlTvGVUwEXM=;
 b=yvI0yC6GD/JDl0+/nJUNrEaz2alLUmFcN28kDggq2j++w1M+5qMzE6qTcATjLI/hlt
 ylha4GzoeIYZfYPaTFa4qakdboz1btaF7ZH/ny7263jPE0XOw5StbZb8Bcy3LXDQLbyz
 hTFVx6Mo2lN8vZG39kLTqidf/84FiEvwhqQOVEQYonwnfPub03QABFu/8SmC+AH1PB6q
 P6L6UwGKxBAFRg7pLLoxv3cA8dLt4AM+OuLMFg8fDnQnx9SdUjXt6YjOTVYKwehbN5/u
 9kERFNr18MeQBnr7tXnNDn5xgbjDh3h7NeM8FpPzGsxc47m9BOLH1oPBO86w7szdWfmr
 HznQ==
X-Gm-Message-State: AFqh2kql8nLdaxBohPKRc/J6L5u70fMksjFewPSSn8J/5quhuwJDZQJj
 YkwY2uEe9V8bEtX+GoFhZQ==
X-Google-Smtp-Source: AMrXdXtUvUrJ2oTWz8Ht97YcbiU9WNAxZzE1IB4sdZ4haln+t0n822e24B5iXwvgwP6TaVyUbgJF+w==
X-Received: by 2002:a05:6830:43:b0:670:99fe:2dcc with SMTP id
 d3-20020a056830004300b0067099fe2dccmr38358170otp.18.1673644275551; 
 Fri, 13 Jan 2023 13:11:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dz9-20020a056808438900b0035b4b6d1bbfsm9671400oib.28.2023.01.13.13.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 13:11:15 -0800 (PST)
Received: (nullmailer pid 2947870 invoked by uid 1000);
 Fri, 13 Jan 2023 21:11:14 -0000
Date: Fri, 13 Jan 2023 15:11:14 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema
 to YAML format
Message-ID: <20230113211114.GA2925393-robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
 <167362343145.2212490.16180994187587985655.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167362343145.2212490.16180994187587985655.robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 09:26:52AM -0600, Rob Herring wrote:
> 
> On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> > Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
> >  - MSM8996 has additional "iommu" clock, define it separately
> >  - Add new properties used on some of platforms:
> >    - interconnects, interconnect-names
> >    - iommus
> >    - power-domains
> >    - operating-points-v2, opp-table
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
> >  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
> >  2 files changed, 138 insertions(+), 132 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org
> 
> 
> mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
> 	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
> 
> mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
> 	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

If your thought is to drop 'qcom,msm8953-mdp5' here that doesn't really 
seem great.

Rob
