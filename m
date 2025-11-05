Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C66C346C0
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3D610E6BA;
	Wed,  5 Nov 2025 08:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hRAX053p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942610E6BA;
 Wed,  5 Nov 2025 08:17:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC28041951;
 Wed,  5 Nov 2025 08:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A795C4CEF8;
 Wed,  5 Nov 2025 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762330657;
 bh=06k4jiJ4UrEXvHOJ4Ftew/dE8v3AQcvShbjYMBlJyaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hRAX053pqlS/biqlxS55e7WkR1rnJD2Ll3kHwh3ho0yO8FdKLq8ayRWOsL1uOb2Dw
 zgq7w2JbN/BivhMed+bG6PIb+g2X58+UN+hQpqC0yxZF99wdXMsrMCrApQlgjp87xG
 kwX4l7yRP0czu03WkNU4T2VEIR9gu4us44IiI5HGUE/WOHdPOse8JdL+3K0L9fbZoM
 uCa8GU/zMtaGemJiIezmBt2rQTVL+AAEE1dIKPJ8rf62ckcyZP/lgj6uA2TosgbQ8i
 CHfur3vNK+3Unfqiogfw8Ln53N7PhyMkWtf2hTntTjZhfjfkntPy0N5gmOz7g7zIZf
 cTivoQy8JqWdQ==
Date: Wed, 5 Nov 2025 09:17:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v7 1/4] dt-bindings: display: msm: sm6150-mdss: Add
 DisplayPort controller
Message-ID: <20251105-merry-liberal-macaw-ef387a@kuoka>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
 <20251104-add-displayport-support-to-qcs615-devicetree-v7-1-e51669170a6f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-1-e51669170a6f@oss.qualcomm.com>
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

On Tue, Nov 04, 2025 at 09:33:23AM +0800, Xiangxu Yin wrote:
> SM6150 uses the same DisplayPort controller as SM8150, which is compatible
> with SM8350. Add SM6150-specific compatible string for the DisplayPort
> controller.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

