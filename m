Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59C629A04
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA69B10E3D7;
	Tue, 15 Nov 2022 13:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA3F10E3D4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:23:42 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g12so24431486lfh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqH00M5tmI+hJaxcTJuo6fH1GrWWsoOr/MknXsui2eE=;
 b=Nltim8rZvpTvTZ7pTQ+/8Gx82aBXz5lw5ke1QBpq3c+LocGqtCtn1/6Stckq+Il3zV
 5ruuF/Zqqjx4K9dLBDERJDofKCMxQ9ufaPTL9SFIUGO0wRyG5qrAt9ihgo6fQduY2fTi
 TuYCM7r61DP2vrSEGfsF1W1mk3hBrZwNrnO751Pi0ExY1UW47kjy3Qmrctr0IEdgabTd
 +h1H/5wtUK8b7DsKZ028xikl8tyFKr7zj8a4r43m2RTGoW+RhaygRJWL7C+QPruO/k+U
 g19v1kZYLqb6PqnECKVDKoO9fz4HVwfPoD4hR+R50WlQAdCtbg9PztoCOccxW9RCl0yK
 0m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FqH00M5tmI+hJaxcTJuo6fH1GrWWsoOr/MknXsui2eE=;
 b=PQ40PeD8H0Q9AfVlewdFySxrmfl2XZ++DHOZ/91JOOZ0+yueYpWUeSXRKcS2khESh1
 RE/K4V6RGdeZNkUPi6CBMZIr5fd4L4Dr3XwqaT6FGBtgKEBQXeF4tq0j8VbwjRnGeP2K
 PRI3LpnW8gO5lXyXd/LRrPTg0oKj0ImIMJ+oRXoYwfDvnEfuQeRY+ns5+jXAOyX72wdu
 2hZuXJQTyLymTdPpm66O2d7cIMSAIK2APJRnsB55EewcbaMxwiERjZvu3Jo1iuKaqp41
 4cRWtRc/dDk+6a6F9M2GXkxXQLGihsWD0uFFZCcvz2I+VYvkcEXQG9ADit1QjWClrrKF
 f79Q==
X-Gm-Message-State: ANoB5plS95xgyIi56J1okoJyMYa1UBkCBEl6Gj0TJQcIt+2iOp1bI/MV
 bHbGcKaEbCpQXXYDO/qsCu9frQ==
X-Google-Smtp-Source: AA0mqf5RdniR/Ee7x0mXUJxIEQ22iEk//HmT/2HMJe3jl/3wCB3uyHvScYI+6SXd/oMtdJrhfu1akw==
X-Received: by 2002:a05:6512:329c:b0:494:79b6:c7a2 with SMTP id
 p28-20020a056512329c00b0049479b6c7a2mr6218139lfe.513.1668518621156; 
 Tue, 15 Nov 2022 05:23:41 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a2eb98c000000b00278e7800715sm2402884ljp.16.2022.11.15.05.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:23:40 -0800 (PST)
Message-ID: <d2ed5161-7411-359c-021f-548fa45352ac@linaro.org>
Date: Tue, 15 Nov 2022 14:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 00/12] Enable Display for SM8350
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, quic_vpolimer@quicinc.com, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115111721.891404-1-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115111721.891404-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/11/2022 12:17, Robert Foss wrote:
> Dependencies:
> https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/
> 
Looks like only patches 0-3 reached linux-arm-msm and freedreno lists?

Konrad
> Branch:
> https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v2
> 
> This series implements display support for SM8350 and
> enables HDMI output for the SM8350-HDK platform.
> 
> Changes from v1:
>   - Added R-b tags from v1
>   - Added qcom,sm8350-dpu binding patch
>   - Added qcom,sm8350-mdss binding patch
>   - Corrected sm8350.dtsi according to new dpu/mdss bindings
>   - Bjorn: Removed regulator-always-on property from lt9611_1v2 regulator
>   - Bjorn: Moved lt9611 pinctl pins into a common node
>   - Bjorn/Krzysztof: Moved status property to last in node
>   - Krzysztof: Changed hdmi-out to hdmi-connector
>   - Krzysztof: Fixed regulator node name
>   - Krzysztof: Changed &mdss to status=disabled as default
>   - Krzysztof: Changed &mdss_mdp node name to display-controller
>   - Krzysztof: Fixed opp-table node name
>   - Krzysztof: Fixed phy node name
>   - Dmitry: Split commit containing dpu & mdss compatibles string
>   - Dmitry: Added msm_mdss_enable case
>   - Dmitry: Fixed dpu ctl features
>   
> 
> Robert Foss (12):
>    dt-bindings: display: msm: Add qcom,sm8350-dpu binding
>    dt-bindings: display: msm: Add qcom,sm8350-mdss binding
>    drm/msm/dpu: Refactor sc7280_pp location
>    drm/msm/dpu: Add SM8350 to hw catalog
>    drm/msm/dpu: Add support for SM8350
>    drm/msm: Add support for SM8350
>    arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
>    arm64: dts: qcom: sm8350: Remove mmxc power-domain-name
>    arm64: dts: qcom: sm8350: Use 2 interconnect cells
>    arm64: dts: qcom: sm8350: Add display system nodes
>    arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
>    arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc dsi-hdmi bridge
> 
>   .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 +++++++
>   .../display/msm/qcom,sm8350-mdss.yaml         | 240 +++++++++++++
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts       | 332 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8350.dtsi          | 226 +++++++++++-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 210 ++++++++++-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_mdss.c                |   4 +
>   8 files changed, 1108 insertions(+), 26 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> 
