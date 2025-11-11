Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF42C4C2BB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 08:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764E10E4F3;
	Tue, 11 Nov 2025 07:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JoFTKMV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD7410E138;
 Tue, 11 Nov 2025 07:49:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BDCBD43B0D;
 Tue, 11 Nov 2025 07:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B81C19423;
 Tue, 11 Nov 2025 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762847398;
 bh=LtD7jh1jiHyiFX3iVP+B4S4da4HrLV4LEooD4oBo27c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JoFTKMV5c9VBms5D1QoGJ/1cmQlq6ndI44MgJvLg+2cKTvNT7VCTKai7D8BJaSmsL
 1lXEZ/4I8pKMhvjzVyTP07+o9t+mBRZzL7jx/AfC5SqyiBA3CYQw1j4mwskoWdsesY
 FAX1tlQ6elMo6Z2UKve1n3Sb9XIhxk4Vnhok3b1nXsSbEa77ohIzvPU4cbbLgQcx59
 lmRb1KLQhdPI9nVBwQGBqkglY+ZtLQkcvzl/PyC+3aqowHCzu+pUffziPJsf/4fmSY
 Hq0aErDgQz7DV6zwmH3X/2iNtV8uUVM0K5DHDOwwZiAbMEA5uOGHP57205mbfEVYFZ
 iiW/zl9nKuv8A==
Date: Tue, 11 Nov 2025 08:49:55 +0100
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
Subject: Re: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
Message-ID: <20251111-magnetic-jasper-slug-3abc3e@kuoka>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
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

On Mon, Nov 10, 2025 at 10:07:26PM +0530, Akhil P Oommen wrote:
> Document Adreno X2-85 GMU found in Glymur chipsets in the
> dt-binding specification. It is very similar to Adreno 840
> GMU with the additional requirement of RSCC HUB clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

