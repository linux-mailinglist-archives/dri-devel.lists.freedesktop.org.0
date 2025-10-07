Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E6BBFE7B
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 03:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCEE10E170;
	Tue,  7 Oct 2025 01:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kIpfst5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BDB10E170;
 Tue,  7 Oct 2025 01:08:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5DED61188;
 Tue,  7 Oct 2025 01:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7998FC4CEF5;
 Tue,  7 Oct 2025 01:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759799304;
 bh=4mZ2Pd7g7yEA1a/btYS4fCpf+KxY0K6O7rgNoBX5KJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kIpfst5KFmC7qevzDNx9HzQobP57DvqFlF2zEOAmbfTjskVex3r4K0egK5ODyVxRc
 pSRv4XR4rgfydQmwv3PD7qWkS8e/Yno9sSLUIsTzbZh0ypIWb08mw2reke9yQQqadO
 Q7Kh4iv/sLIJvArPRDiIfxxmBiJwGvKeZ144P+C2dvPpnShd4UplGq7JMBnaiZr40v
 HTo0bHtLmqqJzqqV6ZzQNuPm9LLVhxvay3FGjldmoleHApa2P/iGEulXiy8wI+VErM
 LeEQNtFz6fR8Z/O1R3YBnE3r00qIRui7g+tfPLW6fTWSndmxolva3GTQWGJntez+Rl
 9azlF3FT+3Usg==
Date: Mon, 6 Oct 2025 20:08:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, devicetree@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 17/17] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
Message-ID: <175979930291.705827.13931250728494462568.robh@kernel.org>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
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


On Tue, 30 Sep 2025 11:18:22 +0530, Akhil P Oommen wrote:
> Document Adreno 840 GMU in the dt-binding specification.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

