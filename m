Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDAB2E72E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E449B10E377;
	Wed, 20 Aug 2025 21:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oihkB/d6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A5F10E364;
 Wed, 20 Aug 2025 21:08:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 606EBA54B57;
 Wed, 20 Aug 2025 21:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80C6C4CEE7;
 Wed, 20 Aug 2025 21:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755724084;
 bh=rkoobUseBl3ZPCzxbYJUmI8ZVFYkuSdLZI+boJGT8UU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oihkB/d6bpuibPKO7CVwMQ1R8sWllUitiVtdBsUS035RrAaBSORoBP936GmEIOsbu
 OjULfbVu+pQfvp8jTOoJyz0e6MVlvFM9oi6QWxgpuJQgtivFicURpKEfobLF0866nf
 qbhhahV5cBcAWDgxDq6/d/tMq50+hvWGhmleVCS+7nvUo0ye0IyNyQVIulpizy/mLO
 VqV7qeC0YV7tWXSDwSsP7Jin6VG+A++3DMHUBQl3UzhNhwcoLc2ETx3SgG+7ihvuCc
 wECvB67E1XPAUPi9vquTOpqkaDk6gSIg8erCwUnLSE0K8Rla8SQpyYWiKFqjWS6IJe
 XJxwBTnEKC6uA==
Date: Wed, 20 Aug 2025 16:08:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <175572408273.1071685.13722769967964549822.robh@kernel.org>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
 <20250815-dp_mst_bindings-v6-5-e715bbbb5386@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-dp_mst_bindings-v6-5-e715bbbb5386@oss.qualcomm.com>
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


On Fri, 15 Aug 2025 17:30:32 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller. Expand
> corresponding clock bindings for these platforms and fix example
> schema files to follow updated bindings.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 63 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 +++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++--
>  5 files changed, 99 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

