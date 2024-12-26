Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA49FCE92
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 23:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C073E10E188;
	Thu, 26 Dec 2024 22:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="be8VsyU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D26410E181;
 Thu, 26 Dec 2024 22:39:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE96AA40F49;
 Thu, 26 Dec 2024 22:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8157CC4CED3;
 Thu, 26 Dec 2024 22:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735252760;
 bh=IA7k5C2AS+nLKhVxq0RIAeQWDFWdSUNqLZjob+STCgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=be8VsyU4/0n/4r5iNCubsQ/IrvULAPBPcO24RnxvNVoCzNuCdNG4wE3mHHhYKhin0
 jajp82e5CfszRKhbFrmiZStB9twHYmTiCsij4mcguEKiuTo/lYnMugPzZ0+DEGMFI7
 438blUtRocOkDYMMyvJaWU4/flu2plXVqu8/WMz2UzVHztAzDSEe3i/e8c/fv6Thrp
 LDpbzqvj2BRPMD0dTN62zPx1JAhA3Bi9sVQmyNuq0dQUIEk/NNBndXVrG70ujX8aXT
 KwsXJ9atI25p/9wVsCsnfueMGxe+LI9Q0lYuFMqmE434Oo+bydbC0N7L7Wyjh6zcUg
 nC2Rr7d331FkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/7] drm/msm: adreno: add support for DDR
 bandwidth scaling via GMU
Date: Thu, 26 Dec 2024 16:38:45 -0600
Message-ID: <173525273263.1449028.15610576942299813913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
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


On Tue, 17 Dec 2024 15:51:13 +0100, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also vote for DDR Bandwidth
> along the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote parameters and bandwidth to
> achieve full functionnality.
> 
> [...]

Applied, thanks!

[6/7] arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      commit: 1ba40079267930643eade4282258562085d4319d
[7/7] arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU
      commit: 63c21d61b46197b6295e12dbf29adff29c18ae2c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
