Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BAD2237F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 04:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA610E6AA;
	Thu, 15 Jan 2026 03:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o5sRyKeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D310E235;
 Thu, 15 Jan 2026 03:00:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AA526012B;
 Thu, 15 Jan 2026 03:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D411EC4CEF7;
 Thu, 15 Jan 2026 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768446009;
 bh=8009av0T/l3R7imn5/vZj1JvTowoP4HVKgq4Jvr3i1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o5sRyKeTV/pwiZo7EpP0+Jl3swaLCr8lx8uB48JzAC6AK0gUOD2O7KzOsXYlidAmc
 TeWqA3ksd51agv8D15cMAtx+nxLbcox3nrMJZE3Tvde9tedLP1EIII7YRc8CwIlzOt
 YC3IxBO3md5ZZ5PoieTIQ1aZwCiWo1QFWshmpZDRGdoUaBi1ZY3xpWlE+j/NthgexG
 gabpEXpRlgW3N5etfRpQ3Mzxo2ldZ0LkB6KLUGeK06Pp5QoIaF5lXOmJDL8Qy+QRjL
 +xqEMI+huCOQfyL24lwGOFBT6bJO/Cc5/7jEk6JhbRPhT5z7vLC3YKO8YobPoBbiZj
 Yqbx+Eh/RxXGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v5 0/5] Support for Adreno 623 GPU
Date: Wed, 14 Jan 2026 21:00:01 -0600
Message-ID: <176844599496.144315.632973922304964900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
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


On Wed, 03 Sep 2025 12:49:51 +0530, Akhil P Oommen wrote:
> This series adds support for A623 GPU found in QCS8300 (internal codename - Monaco)
> chipsets. This GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Since the last revision, there is a new board support (monaco-evk) in the mailing
> list. But I am skipping support for it in this series due to the heavy code churn
> happening in that file at the moment. For Bjorn's convenience, I will share a
> separate DT patch for gpu support for that board later.
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
      commit: 96ea45304d786f6bcf4b553a05eb90675bc0f2f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
