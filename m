Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2340B8020B6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 05:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038E810E083;
	Sun,  3 Dec 2023 04:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23A10E083;
 Sun,  3 Dec 2023 04:51:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BB95BCE0920;
 Sun,  3 Dec 2023 04:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969F3C433C9;
 Sun,  3 Dec 2023 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701579106;
 bh=+mcK+T08LUgzP9YfqK4zh9i6t9Yd2MbXJsZSM5gqgbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ClC7S2eTLXzjsH0+pEQz0cSBjgV2+nHLT/+/akgQpyM7CS2/bBplE4exGO6GkgQZ7
 VTVz8K0QniTpz5KqPi5Nx1PIRakIfq4FA4KhQcJRc3k46YFSCl9XM1mX9Ti0Jyttmm
 FS1QvTXU0B7qTzCvAJRZTOejdiPDOGZm5rbMkj2BQ0xDrVR7jjaXvLKoVGyhz36KaL
 ArZHVVgjV+UpXE3Qu2wBb+2M7RC/1nvkfQ4mvtkZPSz6kX2IcDvl9f3HQpr3In/C97
 JlIux05ueGDr+TxzCzUM0rZtjisw9dOk2vykOZ/xLbq/OKrqCwC5SF9hANg79srjq3
 QtwOlcTpMTwpA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: (subset) [PATCH v3 00/12] RB1/QCM2290 features
Date: Sat,  2 Dec 2023 20:54:35 -0800
Message-ID: <170157925828.1717511.10065827987884757444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

Applied, thanks!

[06/12] arm64: dts: qcom: sc7180: Add the missing MDSS icc path
        commit: 8786398f8686d1a4267ab52f830b25f17e6d62fc
[07/12] arm64: dts: qcom: sc7280: Add the missing MDSS icc path
        commit: c657056d99878c8a8ea84d5d4a9101bcb90b47f2
[08/12] arm64: dts: qcom: qcm2290: Add display nodes
        commit: a2b32096709dbf4af02675d98356a9d3ad86ff05
[09/12] arm64: dts: qcom: qcm2290: Hook up interconnects
        commit: 5b970ff0193d67da4a8d2d5fda50dd8ddb50a71e
[10/12] arm64: dts: qcom: qrb2210-rb1: Set up HDMI
        commit: 616eda24edd48b8b56516886c51d211fbfd2679b
[11/12] arm64: dts: qcom: qrb2210-rb1: Enable CAN bus controller
        commit: 252bc7ad359478dba8d77bce9502f2cc7bb547a3
[12/12] arm64: dts: qcom: qrb2210-rb1: add wifi variant property
        commit: b6a56a5a25d6273729b2b5139d58e3d390318ed2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
