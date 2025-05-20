Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84352ABCCEC
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 04:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387DA10E297;
	Tue, 20 May 2025 02:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VIwcS3Eo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44910E0BF;
 Tue, 20 May 2025 02:15:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92E84A4AB02;
 Tue, 20 May 2025 02:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B255C4CEE4;
 Tue, 20 May 2025 02:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747707317;
 bh=g6jZXMWAASQQayHaZW8MlORaAe0WEAlxX9oX2O9V4OA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VIwcS3Eo6vPobAzbGYGcOhFDUgd92VyIv4WqcIC/GPKDzzMTemxehtleoQuxsuOYr
 o+ILHkKeRw8zA3AJQrUcDZMHwMr68nWv57e1E33NdXS3Ze+MsNYT6GZZbWqIzOBjCu
 ebgkVsCoaVa/hyRkhCkTOO6C+J5owDQXLPFjExW3gj1YyB0cuqNvnYEAHWqFrn3vX8
 zYzxzHfHYTwD++bxnFgdUhv1FvSmCcTHpBhTemN4C44jwwc7pTBsFj+vmOu6WzuIrP
 w5qaWskxqwb7dB7jQ9bkzXGrW2YBD8WE8lUylyHgHAv3lgllSbEG3EoArp4NeV3wUE
 sp6FBNUwcBrpw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 00/10] drm/msm: add support for SAR2130P
Date: Mon, 19 May 2025 21:14:45 -0500
Message-ID: <174770727711.36693.10469297206946224831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
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


On Sat, 08 Mar 2025 03:42:18 +0200, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: sar2130p: add display nodes
        commit: 541d0b2f4dcd9514265b3a3f7f797525caabc1db

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
