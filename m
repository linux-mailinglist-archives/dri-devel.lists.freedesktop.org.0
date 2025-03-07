Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F53A5741D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 22:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EFF10E05D;
	Fri,  7 Mar 2025 21:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BO8+HRZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571BA10E05D;
 Fri,  7 Mar 2025 21:55:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3449EA4536C;
 Fri,  7 Mar 2025 21:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3F9C4CED1;
 Fri,  7 Mar 2025 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741384545;
 bh=HHaLvWmewEA0UB1/ZT/LTbWWfHBvq2qa7R4z05u++JU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BO8+HRZHaRE5kBHYT5HbpF7Opg3fQElryBtTp79LF07A/DKXJqfN1cBNszyyLOZLp
 Zj/UXPE/cnP+e1xIVF4dASEHoSMqTI7lluUu8NU92nhImuS417cLyVFasX2YQMzUic
 YntmikDx2twsr+L8tnb+7HTCbaB7d+IyjtvEVFtEcF6jzuXO6Z7dbfvynPPfAWDWOf
 kCHS3DX+UD7q5dyC6Rg5pK+O42N3h0IZjjuXJ14StHMBGdmHHRMCpOut2u9e5+BZOd
 refk7J2V+p1cayr1hOWGseGVZOtr3QHuGI4MTnCgwfk0N/nuNcgAfJfQ4llGrtREjC
 ROgVzbuJzoNTw==
Date: Fri, 7 Mar 2025 15:55:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-usb@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, iommu@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 01/11] dt-bindings: iommu: qcom,iommu: Add optional TBU
 clock
Message-ID: <174138454322.672545.5612308446106419533.robh@kernel.org>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-1-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-1-0c84aceb0ef9@oss.qualcomm.com>
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


On Thu, 06 Mar 2025 19:11:13 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some MMU instances feature a Translation Buffer Unit (TBU), which comes
> with its own clock. Allow describing it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

