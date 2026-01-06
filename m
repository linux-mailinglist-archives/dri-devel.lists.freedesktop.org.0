Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1DCF9DDC
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8074710E520;
	Tue,  6 Jan 2026 17:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tQiYK3UX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A90D10E09D;
 Tue,  6 Jan 2026 17:52:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ACD5B4074D;
 Tue,  6 Jan 2026 17:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66F5C116C6;
 Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767721978;
 bh=J49Ah6r3ppiaT0Ccz51lpd4pEOWs7B7UD75ItEoFIzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tQiYK3UXUjhruabV0TEB87eqcDD8yGQHz/zC5Qr6s9pFNQMNkOrM2Gu5bIL9b7dgl
 eoQr5tItFOr4rqvdfUbcoXExCZE2DqcXquPXXkQj+ZhlZo5+PMJMNWqP59Ud+NqmBc
 UUjeIiSMbVzoz/eYmAgkxHosjp7HjYXJfO4wfareJzA/LNN3sOu4w0DzHR3bU0QiSD
 nHbiI24Dv4FYKUawiWsFHdxVyHJGPAHzdEBSlNKBvwChhcvg8uq8bKUgAUz5FMtdHg
 Nu0ZUFDI53GPBDxqKyvXG1GzLm5D3RBBWGHGOZkj0fP4RKmXjH99KtPMHDquLdv+r1
 7XaURL/dJMkiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/4] Add DisplayPort support to QCS615
 devicetree
Date: Tue,  6 Jan 2026 11:52:52 -0600
Message-ID: <176772196932.3106040.4674734843475910105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 04 Nov 2025 09:33:22 +0800, Xiangxu Yin wrote:
> This series enables DisplayPort functionality on QCS615 platforms.
> It introduces the required bindings, updates SM6150 dtsi for DP controller
> and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
> connector and link configuration.
> 
> Depends-on:
> https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
> https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: talos: Add DisplayPort and QMP USB3-DP PHY
      commit: b7ad04269d6825b1c88de17e698a356bac5f3197
[4/4] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
      commit: b5a3112bfd5742a5d831c0bdfac2cf6e6796ac9d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
