Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4489809996
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 03:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBB110E248;
	Fri,  8 Dec 2023 02:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7C410E013;
 Fri,  8 Dec 2023 02:53:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 21C7FB82AEB;
 Fri,  8 Dec 2023 02:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE1DC433CB;
 Fri,  8 Dec 2023 02:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702004006;
 bh=ySYaqR1gCbXQ0lYTZYxnK4X5Qq4e8T45+LzfCUwAkb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EYXb0/w8cSPIWtlvc2E+KYDUjlvzlUSXIT7oNdaYNdWeYmEr/B+LcxKRXDqcZFNbj
 JONnPz+wgnz6t80BRCYDirxPMpwAqj1N7Kp9OdSySUQ0RVS7flrZG7Ps96uAuiGL7w
 iL45D10LSebLvOfYRE0nRtxP9oeMkQP4x3C85e7lRmvDtB/SFZecyt5lHmrXttxUQp
 16UEjWOsdNCbkkmb+nPmhAYpUmJIcCep6lGcbXO8GuhOyuXkihNeicFCaE45vi2EoI
 Uqd9SVuRbdzCwHBwfVX3JK4RpCJm+YVcdkxRr7no2vgjwca9zYzW+i9Vv2pg3e4Ze4
 hNA1NEZAJT/eA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 0/4] Adreno 643 + fixes
Date: Thu,  7 Dec 2023 18:57:30 -0800
Message-ID: <170200426929.2871025.2570466324360786509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 20 Nov 2023 13:12:51 +0100, Konrad Dybcio wrote:
> as it says on the can
> 
> drm/msm patches for Rob
> arm64 patches for linux-arm-msm
> 
> for use with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25408
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: Add ZAP shader support
      commit: 0ab1bef0b7c359e672cc2b8d51f0179cefa369fc
[2/4] arm64: dts: qcom: sc7280: Fix up GPU SIDs
      commit: 94085049fdad7a36fe14dd55e72e712fe55d6bca
[3/4] arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
      commit: 31edad478534186a2718be9206ce7b19f2735f6e
[4/4] arm64: dts: qcom: sc7280: Add 0xac Adreno speed bin
      commit: 6a7f8c635dab30233df93b5566d4169ed956b71b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
