Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC7BBFE59
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 03:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DEE10E16C;
	Tue,  7 Oct 2025 01:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZLliQOXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8D810E16C;
 Tue,  7 Oct 2025 01:06:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6425459E5;
 Tue,  7 Oct 2025 01:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBFDC4CEFF;
 Tue,  7 Oct 2025 01:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759799195;
 bh=udAwqmPlvLpoTKxdXhd/iHxSrAV/aOnuJnJ4qcFUSk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZLliQOXLokvUxwlRReyLimgj6aYOZ+mBXOBL9ot10DjLmtjTfbnlqdnooZwLrfr7l
 LzVT4slr6VR0+VTstaLPLg1z0XmSUX+52YwajRHE2txrNIdA1RcKulpPmNVq+YLzev
 sM1dffzmruPTzKSNOG++2WAewRwO9kivYHpFaLP+80ZWr2HsJxzYViQhOGfwDjiyvZ
 UWFXIZ/eDTm/nKOOvDvebQSkMEoWbjKDlLcSRngKIIp8G3I3vLohdWIBibGyN9FcIa
 oqcW80jRQlh1JFuNGMRMHITlcMcF78pjqSXnIR49GiV4BRYnEqDT+9ln/woHCdUKVZ
 ly652VN4e28Yg==
Date: Mon, 6 Oct 2025 20:06:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Bjorn Andersson <andersson@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Subject: Re: [PATCH 16/17] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
Message-ID: <175979919379.698258.13712668305314906075.robh@kernel.org>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
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


On Tue, 30 Sep 2025 11:18:21 +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to support the gpu smmu present in
> the Kaanapali chipset.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

