Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059E6953B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 23:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D7C10E08A;
	Mon, 13 Feb 2023 22:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFF010E08A;
 Mon, 13 Feb 2023 22:21:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7152A61321;
 Mon, 13 Feb 2023 22:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB4CC433A0;
 Mon, 13 Feb 2023 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676326863;
 bh=MAFEEpooP81rHga3hyR7q68TKMP8X0VWoBWQ9cj/IzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oY5aS8mtACHUYH8oywWM6PjXK2+FSJBLfIVpkFu2Jdb+zxScYYMPG8EciOaW4TYKW
 6SFFbpineQMZPTgCG1eGylsVifVPfhJywExsLjKGoQy9ED197UcBhOlqq3qH42kpxd
 Wba2KBUMwAniSj3T0B6O5Txu2V1k9yXDwXycuqYFJxtWpZM+vUY89fQf2fx/wBGsU3
 O4QJZBJiaAwJ/iHkuRCWttpA1yuzII8YnX4i3sgLZekmNNL1FO3m5pWYin6NxuySHS
 PtpJloWMCtKfIDSpWCR7zHS0Se0dcSFN4Q/Z9WKltWTJTf2HrpGo1yvP91LgvDf0AB
 e5kZCxnxMo9Ww==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK
 board
Date: Mon, 13 Feb 2023 14:23:00 -0800
Message-Id: <167632698310.557014.3960232028013864693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Feb 2023 15:38:33 +0200, Dmitry Baryshkov wrote:
> Add A660 device to the Qualcomm SM8350 platform and enable it for the
> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
> noticed that DT nodes on SM8350 are greatly out of the adress sorting
> order, so patches 2-4 reorder DT nodes to follow the agreement.
> 
> Changes since v1:
> - Dropped merged patches
> - Expanded commit messages to mention the sort order (by the node
>   address)
> - Rebased on top of latest Bjorn's tree
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display/msm/gmu: add Adreno 660 support
      (no commit info)
[2/6] arm64: dts: qcom: sm8350: reorder device nodes
      commit: f5f6bd58186afa4ec1ebcd074bc30255826e8480
[3/6] arm64: dts: qcom: sm8350: move more nodes to correct place
      commit: 1417372f4f846fbc28b4306370eb011d1f0853ca
[4/6] arm64: dts: qcom: sm8350: finish reordering nodes
      commit: 51f83fbbf1c8d7a09885099f9a8f25b3c9139797
[5/6] arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
      commit: 54af0ceb75958a8b7e62138646cfa6c114e71a77
[6/6] arm64: dts: qcom: sm8350-hdk: enable GPU
      commit: a8ecd17bb681d1743309b0d2a4622b643b61d69c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
