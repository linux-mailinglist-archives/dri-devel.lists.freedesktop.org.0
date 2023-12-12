Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA380F45E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 18:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8167E10E638;
	Tue, 12 Dec 2023 17:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7748110E0C3;
 Tue, 12 Dec 2023 17:21:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3FDBAB81827;
 Tue, 12 Dec 2023 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F8C433C9;
 Tue, 12 Dec 2023 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702401688;
 bh=iJbsCCsQPExgoBlXs13IszghcdhAlE8CqVmzx5/6CUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NjNBK6p0cc6mZk7B3InU4ICb7IP8uBhF+KNLoACi3S+7zVAKgZH0b4X9E9LQy9kMZ
 ITnv4OYQg+erUKTrk1aeZ+z+pit1r0iUPHhFCjKFPbYyC2Obok34R0/U9ZG4NLIv+2
 7DcaScI78W4tvHyFDsQuTQ4V0gkWACMGbK/PuI/iSscysuZjFqbo0R8k0ko/JfW8KM
 tRyB4SCg6BmzBDnDt1tQtJXeNrc2LKWW/mj8JeArHn120+W4epFDm5cAbtHJlqgeJE
 lBqjabQH3m6Wd/qKL4NGv3UnTyP4rZmK45YWaPn2q7xOQBYFLHjUU9gWn7sXx5PyAf
 vCLa5e4BJUQkg==
From: Will Deacon <will@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andy Gross <agross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Robert Marko <robimarko@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, cros-qcom-dts-watchers@chromium.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Sean Paul <sean@poorly.run>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 00/12] RB1/QCM2290 features
Date: Tue, 12 Dec 2023 17:20:55 +0000
Message-Id: <170238433491.3098250.94876533885104502.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
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
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-pm@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 15:43:57 +0100, Konrad Dybcio wrote:
> This series brings:
> - interconnect plumbing
> - display setup
> 
> for QCM2290/QRB2210 and
> 
> - CAN bus controller
> - HDMI display
> - wifi fw variant name
> 
> [...]

Applied SMMU update to will (for-joerg/arm-smmu/updates), thanks!

[05/12] iommu/arm-smmu-qcom: Add QCM2290 MDSS compatible
        https://git.kernel.org/will/c/28af105cb650

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
