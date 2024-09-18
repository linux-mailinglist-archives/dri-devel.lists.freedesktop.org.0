Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8B97BFA0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 19:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B23710E5FB;
	Wed, 18 Sep 2024 17:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jb/FLAzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E927510E5FB;
 Wed, 18 Sep 2024 17:29:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3ABEE5C58BE;
 Wed, 18 Sep 2024 17:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC2DC4CEC2;
 Wed, 18 Sep 2024 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726680555;
 bh=5RTDuijP9fJkOz811bYIghMnhBUgzhcb2J0NWydmciU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jb/FLAzRSfcTClNv/Iwql3RJDcCWp3WfcuCTPvHCCo/ToYmkGfcVMKpQOeGRKaLPE
 /elsy90yJHtfbWmxjOAyjg7U96cUulHOiVwFgdivKyqxQbRDrPquz1p7YB9RT0d705
 PqGxkl/+vDZfS8d8SMGrAgcCa6qF/XZ76wuShzooIOn1eQcyqAyLXegdZXO2h7kqFS
 eUnnFsHRPu6RtPj7/fX8oajm4iY+Za/rThQ1rfULVPHP82/FsdgKW8CjxPAnmVPmsW
 EGHR2mV2dbtj1ZPqmQ/IeiVAA3mpJ/tj8bAX+1SvzNzu7eskVNeoLM7MvTpWA7On+l
 q5LMNMrOnxIkQ==
Date: Wed, 18 Sep 2024 12:29:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno@lists.freedesktop.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display/msm/gmu: Add Adreno 663 GMU
Message-ID: <172668055336.1832877.11076449182367280767.robh@kernel.org>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-2-25fea3f3d64d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-a663-gpu-support-v1-2-25fea3f3d64d@quicinc.com>
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


On Wed, 18 Sep 2024 02:08:42 +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Document Adreno 663 GMU in the dt-binding specification.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

