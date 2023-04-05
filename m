Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAE96D72FE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 06:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDBF10E2E3;
	Wed,  5 Apr 2023 04:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4EC10E2D0;
 Wed,  5 Apr 2023 04:06:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D51BC63961;
 Wed,  5 Apr 2023 04:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177E7C433EF;
 Wed,  5 Apr 2023 04:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680667594;
 bh=CtE9+GA9FFI2yjCWgFYXyUkZbnUatcRFlqiAUZluLhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XDr29GHb0dqq9DTymcIwcFbUHv72LQvaX1gq2gheD7ntif81Iok6hCzAEB8FlXuoc
 V5RACM5gVAt11NAjQLzVGv/w8AB2PfAqqyJ8AXFKeErCOzEfbWn8MlnZB9s0WEGLMh
 oDDitS+brOP2Nr6Re2X4eAmpW/Y8cDhcK3beDMpjjmnmtRGflCxpvW0NBMLmAZIXab
 5lirNCdU+a5/SeuZu3RnJ0HZZJcpeW+thJAiCvl9pR02EVUnLy0yNQK3TOeb5zEFqK
 BpqT7cUtiHGiM0GNyMRU3dZ7AoqoXuLMwdgv0Iy7j6CaaqUUUz9tdSmFH5c8fpG5Zh
 qGrcbrBuFPmfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Paul <sean@poorly.run>
Subject: Re: (subset) [PATCH v2 0/4] arm64: qcom: sm8450: bindings check
 cleanup
Date: Tue,  4 Apr 2023 21:09:05 -0700
Message-Id: <168066774416.443656.11788481622365287210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Mar 2023 10:28:45 +0100, Neil Armstrong wrote:
> A few fixes to pass the DT bindings check successfully
> for sm8450 qrd & hdk DTs.
> 
> The following are still needed to pass all the checks:
> - https://lore.kernel.org/r/20230308082424.140224-3-manivannan.sadhasivam@linaro.org
> - https://lore.kernel.org/r/20230130-topic-sm8450-upstream-pmic-glink-v5-5-552f3b721f9e@linaro.org
> - https://lore.kernel.org/all/20230308075648.134119-1-manivannan.sadhasivam@linaro.org/
> - https://lore.kernel.org/r/20230306112129.3687744-1-dmitry.baryshkov@linaro.org
> - https://lore.kernel.org/all/20221209-dt-binding-ufs-v3-0-499dff23a03c@fairphone.com/
> - https://lore.kernel.org/all/20221118071849.25506-2-srinivas.kandagatla@linaro.org/
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: sm8450: remove invalid properties in cluster-sleep nodes
      commit: 35fa9a7fc577a4d1ed541ff37d9dda83b0635e4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
