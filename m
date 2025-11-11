Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE7C4C2CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 08:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C2D10E138;
	Tue, 11 Nov 2025 07:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IMob0ZfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E583110E138;
 Tue, 11 Nov 2025 07:50:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9246361915;
 Tue, 11 Nov 2025 07:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9736C4CEFB;
 Tue, 11 Nov 2025 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762847434;
 bh=oUpC387GOG+scMgq73fcTcbxVzxmSK2/5OLQR2Y2jNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMob0ZfD44J4BlJiPK4v9d+USC8LaYmuTo2h/N6KUYluazUj4oBym09P3HqQ2GtCb
 5V2eQ1GAWULEai3y83riVrBFGwdcKzmP2I/aGFo6PyMXWW3YAW/VgOnbaU0I3Ws6RN
 RF+7xiRK51aGPwh8jBdMYG4O1etN4Mx1kxNbJTBvZEz/+hPfCUKu334GduKC50ytmT
 2fWvzPwg8OuWussEFBkC0sxM/YqxmVWkvjHB/Bv1uqgFjRYdIAkPp1l3Cg60Ay2RXU
 5p5AySOeJKt+Aogwv0H8+1aE/pZ83D58JP5ITHvLzbAKzOsZlmbfWJ/BOIGbz/RyzG
 0ePqZF4epfbrg==
Date: Tue, 11 Nov 2025 08:50:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
Message-ID: <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
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

On Mon, Nov 10, 2025 at 10:07:27PM +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to support the gpu smmu present in
> the Glymur chipset.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

So you ignored entire review? I drop the patcshet from DT patchwork.

Best regards,
Krzysztof

