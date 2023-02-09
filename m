Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD268FE77
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAE810E8F8;
	Thu,  9 Feb 2023 04:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7209110E1F0;
 Thu,  9 Feb 2023 04:21:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E15C2B81FFD;
 Thu,  9 Feb 2023 04:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53158C433EF;
 Thu,  9 Feb 2023 04:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675916494;
 bh=q12p7eZHBxQbbpAcbSwCfdY+opa1+EkxvIOWze4/zAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/APx6iphluKKbsqfkMBLMtE1ZhYs6yRjrIXfSoEItVbtU1MLlEt6NAnC9px2rbru
 uVNlOCgPbI8qscLy7vRu0jfyluGPzprJUtGEH5yzlMRCjt2HfYwJxPa+EO8liB3FaL
 H8QN5qRJix+ntIb5M9t1W9RVEFTrb4SsYNClF1GhbuIutRNHbYCsHgC1BxvqOHc68h
 DJSQBq+KiolEjtRdtv7BtDJENcXehEOlcWNZpUITcOKjH1m+ou+lQCBkkOKOIcK/+2
 QI24QRxTm7tXWlRrZlTCKiyMOstuVGfzKBEuITebt7UjkHsoHQ/YvvkKmXfh/HQlKJ
 k/2w60BE3ezYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/8] arm64: dts: qcom: sm8350: enable GPU on
 the HDK board
Date: Wed,  8 Feb 2023 20:22:50 -0800
Message-Id: <167591660372.1230100.2973091993035118368.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Feb 2023 16:56:59 +0200, Dmitry Baryshkov wrote:
> Add A660 device to the Qualcomm SM8350 platform and enable it for the
> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
> noticed that DT nodes on SM8350 are greatly out of the preagreed order,
> so patches 4-6 reorder DT nodes to follow the agreement.
> 
> Changes since v1:
> - Fixed the subject and commit message for patch 1
> - Fixed GMU's clocks to follow the vendor kernel
> - Marked Adreno SMMU as dma-coherent
> - Dropped comments targeting sm8350 v1, we do not support that chip
>   revision.
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
      commit: bdd133c2eeffad142e7c8a48ab7e86e1ca37e67d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
