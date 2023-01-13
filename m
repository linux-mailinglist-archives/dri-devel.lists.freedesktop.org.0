Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375ED669C03
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D84610EA22;
	Fri, 13 Jan 2023 15:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A2C10EA21;
 Fri, 13 Jan 2023 15:26:57 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id d127so17908116oif.12;
 Fri, 13 Jan 2023 07:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=w3iFRccbSDkEugBccIou+2bALCJO5axdL5vy8psmKe8=;
 b=AXVq4B/XBqCgNcT9z6umlSA9I7WUJpJZ7ienPs962JQc1nIVnwsBcakmzz0xCo2xDB
 9/EeOpiEVriAFAIJWruRiF5nMm0EWJqO3t9e8DCcH6OlxXl2elVW/9qtkwHEk6ye6dLq
 ZQkkBukwQnLD5TRYZ1F9VxUb6KbIPhytpTzanjuIXl1S9GLpyuONdc8D2nQt3CjW8VDN
 X4TqlS8kkGhzRDSfMxC5o2jRaxuOszmpsa7TQICoDpXlBcuzq4hU8v+YnHbkzMvbPjrT
 NKEZcXYXdb5TkUR83Ghuglt5iZswY69f6kbRImaUvxnWV3dB7I1Xk4QQrepUEGRz9NXl
 QafA==
X-Gm-Message-State: AFqh2kq6le8/Cr2UO/CjcB3EqtnPKx4/M5V2pIhIQN/0DgR+UP/knrzC
 pOAC+MgbZ5TU53uCe0tSlQ==
X-Google-Smtp-Source: AMrXdXtU5Q+EcHwM8fGnUFflgtn0JMNu0tQGWDvrXpPdN6wJh85fEDrBO+B8rxDkKl45atQuth7UAg==
X-Received: by 2002:a05:6808:18a8:b0:364:adbc:609b with SMTP id
 bi40-20020a05680818a800b00364adbc609bmr1610560oib.19.1673623617083; 
 Fri, 13 Jan 2023 07:26:57 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 be16-20020a056808219000b00359ad661d3csm9234840oib.30.2023.01.13.07.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 07:26:56 -0800 (PST)
Received: (nullmailer pid 2224506 invoked by uid 1000);
 Fri, 13 Jan 2023 15:26:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
Message-Id: <167362343145.2212490.16180994187587985655.robh@kernel.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Date: Fri, 13 Jan 2023 09:26:52 -0600
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
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
>  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org


mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

