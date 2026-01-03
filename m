Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665DCF028E
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 17:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024A210E36C;
	Sat,  3 Jan 2026 16:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u47nYwSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4CB10E00C;
 Sat,  3 Jan 2026 16:03:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE20260017;
 Sat,  3 Jan 2026 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292C9C113D0;
 Sat,  3 Jan 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767456185;
 bh=9dgNMg9WfEeZx00hbAC0YpEF/0WX0CU/tJfCl2/C81Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u47nYwSgrTN2ibSb11P6lUyzCCS9SdK216WggLkh7vqk0mULVB+w6xd4Vb6sMBQzY
 GSoja3ibvJhEBeapjpLBOLNeCoYr5gbEMdIh16wXyRzDXuPV8b0Yhj4w5RGg5nZf4b
 pBV31pCYb1kj2s2v23MZh4SWNzEk9AnAZ6vXn9OAdTlpdfRjSsxE6ukg8B2IpjRgpa
 6WDeYMMLoNXR0lQg6Y60AZzYGsthv36tbmexfwm4ziOWv/j5ohSFxzwkqBx7iefx/L
 J3/3f2AQeGRBNNpc8/VcmvTTIqwamLtcqtOPEnOgsZRX6YWpwpkBXaiP9yl7Xs3O5d
 5GKcd+YVliOGg==
From: Bjorn Andersson <andersson@kernel.org>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Sat,  3 Jan 2026 10:02:55 -0600
Message-ID: <176745617461.2631416.12790593319351767238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
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


On Tue, 30 Dec 2025 18:03:24 +0530, Akhil P Oommen wrote:
> This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
> chipsets. The closest gpu which is currently supported in drm-msm is A660.
> Following are the major differences with that:
>         1. gmu/zap firmwares
>         2. Recommended to disable Level2 swizzling
> 
> Verified kmscube/weston/glmark2-es2.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: lemans: Add gpu and gmu nodes
      commit: 6940c66825e4c27c53b33e367806ac1dc922583d
[2/4] arm64: dts: qcom: lemans: Add GPU cooling
      commit: 4a6488a8070b95702d6f5dec444fbddfaaaff8cf
[3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      commit: dbff283922e32eaa3d81233b69c02ef2abe7ee9b
[4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
      commit: 247b55ddf76ee65b1a63e5c834341a07996de07d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
