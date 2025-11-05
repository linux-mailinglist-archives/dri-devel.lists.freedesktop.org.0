Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C508EC36D1C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AB010E08A;
	Wed,  5 Nov 2025 16:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q7oZHYTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D28F10E08A;
 Wed,  5 Nov 2025 16:53:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E62E3443B5;
 Wed,  5 Nov 2025 16:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07744C4CEF8;
 Wed,  5 Nov 2025 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762361614;
 bh=DUyB+B+LRdmSbh3dWzcC+TDqeeRozuT/fTVcVlRoLwA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q7oZHYTg9wmwfGsdZTavf0N8zPTFvaUa2dJLRSBAL2PSUXV77MZppD+KvVagGvLc+
 jz5q/AsMODLhoVEoOCu2LVU6rID75sMxJYYuPKbSJ5tlGyouotEQFNYpTAPFfzNiVn
 AE8GnbFUfXtxO8o6/Dj8qad2mTuTV/VQQypKkxUAkV43Xj2kN+qxCbeelL3SXMhcwM
 Nf9oDm19ts/A79WshWE3Y/R/WkI/XDS/sVPQogSjlvL4avmDh45RC+oz3bdIyP/mdz
 uR5/8FTkqC/RCiYZVqzjfUzjzQ67QI8bKotYeEO6vJ+jimxh/dIrknLl/0JN4J8ZX5
 tUd8ZkXITO5VQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/5] DRM/MSM: Support for Adreno 663 GPU
Message-Id: <176236160052.37047.12923795229672394506.b4-ty@kernel.org>
Date: Wed, 05 Nov 2025 16:53:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 05 Nov 2025 22:15:44 +0530, Akhil P Oommen wrote:
> This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
> chipsets. The closest gpu which is currently supported in drm-msm is A660.
> Following are the major differences with that:
> 	1. gmu/zap firmwares
> 	2. Recommended to disable Level2 swizzling
> 
> Verified kmscube/weston/glmark2-es2. This series is rebased on top of
> v6.17-rc1.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: nvmem: qfprom: Add sa8775p compatible
      commit: 466b5ef60fa7619f638fe08201ed9b66d0737556

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

