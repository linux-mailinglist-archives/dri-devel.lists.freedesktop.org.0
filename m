Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CCB8BD4D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 04:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7010E264;
	Sat, 20 Sep 2025 02:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nsFf0vI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502E10E264;
 Sat, 20 Sep 2025 02:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2CB12450E0;
 Sat, 20 Sep 2025 02:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8E9C4CEFA;
 Sat, 20 Sep 2025 02:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758335023;
 bh=fgsoUIP29w2rcYoFOf9ihmp8h1h3DCFxYScd1U/hZAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nsFf0vI/PgJ/KN30pYAJvZEgjzuzQh14FuJQ0sdSukAdR8RtJZlSEWNcnT52o5Coc
 iAjv0pH/iJX/3rODx8abnUnQumeK9BBsYZI8XQvIej8KSv98wKe/lk+pa5F/h3eIdP
 gVK/9FcClJtqMl+j5RVAHst4R+NTDexn/LvLlhM3wsYJKskQGyOH0LbrGz5CEnBw8/
 hiYueMHtAo/BuZJNL3FBSIo1mK1zKooW3rPV+UjMypGn/X7/eKHma2lt77c/jCwK2K
 LHXduKIatAHokUkYvSL78XgGOKuXTAf9n3NruR8+fI+EUEL9CJvYJDwCwxp1gKUKHi
 jo/LvYEO0rpGw==
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] Support for Adreno 623 GPU
Date: Fri, 19 Sep 2025 21:23:38 -0500
Message-ID: <175833500891.491899.13406233219294339363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
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

[3/5] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      commit: 0099675695aab4356f7d05c507edb60fe72a4973
[5/5] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
      commit: 9da690f1b649c9900dd97b9bcd78e4a5ec61f2ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
