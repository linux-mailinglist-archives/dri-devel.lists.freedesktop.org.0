Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE7C7CD7F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 12:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2310E02A;
	Sat, 22 Nov 2025 11:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PqP+NJq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF82910E02A;
 Sat, 22 Nov 2025 11:03:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D5116013B;
 Sat, 22 Nov 2025 11:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD48C4CEF5;
 Sat, 22 Nov 2025 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763809396;
 bh=0DMcLICAtrc9uXC9WUUyA7qUt6f/1V2goqvqubrmE60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PqP+NJq+gUuYdw/RUTgMGNShL+AibwOFyVqRMRsFXmCMMC6X86RlgCkWn1im3lqip
 x/PfKlwI7gY4EpqCG0qjJw/IPlan2Yg4OG2rm0qk78T9IO/4gniW2LC+0J1IK0ObuP
 2amjXXFk8JgJoOiM61xSBoeY/3sYlZ/UxrhSenYH4Z/wknk+00ruHwrrXaj62qQgZU
 fkRyibqPkQckodqNrzb2kKJrpmd83VMmtqgqiXzFaaLxXxKAwvC2F9sYSiCSeg1bJ9
 E/Q9ICbW8+utfxYVfi9b+XNcDanR8tUNBZdzZoH4ihYdw/Zctu3bSID9jBURH58Wa3
 UZfFrIw2IAoxA==
Date: Sat, 22 Nov 2025 12:03:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
Message-ID: <20251122-clever-ambitious-mastodon-8b1a1e@kuoka>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-3-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-3-9f4d4c87f51d@oss.qualcomm.com>
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

On Sat, Nov 22, 2025 at 03:22:17AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> support. Compared to GMU, it doesn't manage GPU clock, voltage
> scaling, bw voting or any other functionalities. All it does is detect
> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> it doesn't require iommu.
> 
> So far, only Adreno 612 GPU has an RGMU core. Document it in
> qcom,adreno-rgmu.yaml.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 127 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

