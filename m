Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5DC5BD66
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 08:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3B10E9BF;
	Fri, 14 Nov 2025 07:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SrjLvpGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313BA10E9BF;
 Fri, 14 Nov 2025 07:47:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 37FAF60127;
 Fri, 14 Nov 2025 07:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3B9C4CEF1;
 Fri, 14 Nov 2025 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763106426;
 bh=KS+VcO/NTMZzXSDvNP23TtVP+SjCFQ9HliVU+Se9klE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SrjLvpGY9ZtMNfRbSPRpEaPKz4dzOPNPThw5cZ9xjU65B15xf2Jo5Aubz8cS0ERcE
 ncTWY/ZI5nAnG0H0eBfetkm0jwty0SCzjnSYrEL+QR8XCi789VW4IeSadplEOmLWUS
 +hhTVprQ1mUi6R017Y5xTvSqdTfHRGBWXjUaVyZlRy3A2PwTXGcwwxC5heiU/LpQQ2
 IXabMdeE2HRfZcjEAer4to1wQ+jRhCsql08OJ1RoAsTNIE+z9Y5RgOx38So4GiAuFC
 a3ndCVZZBEcJbUA5p6gzjpGJd4RfgBTtBzYHPg5fDJ6n/m14gn75xkt0+C/sind/jp
 dIijx0E9vUj2w==
Date: Fri, 14 Nov 2025 08:47:04 +0100
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
Subject: Re: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
Message-ID: <20251114-astonishing-marmoset-of-performance-33cdba@kuoka>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
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

On Fri, Nov 14, 2025 at 04:59:15AM +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to document the GPU SMMUs present in
> Kaanapali and Glymur chipsets.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

