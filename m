Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2198FAB9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 01:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598610E9A6;
	Thu,  3 Oct 2024 23:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SCivXwtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA69510E9A6;
 Thu,  3 Oct 2024 23:41:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F25695C5992;
 Thu,  3 Oct 2024 23:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0E3C4CEC5;
 Thu,  3 Oct 2024 23:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727998873;
 bh=izyo/MfvsnXCOlauszx1miz+7Gvkw2ssldnsTvhIVP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCivXwtGEbSKeZElFTxVQgRfL5vFjKzc3rrKnIJ0cHYk4TxyrYaf+h5ztyzKen1qb
 6Jd4BJh5v+rrRDsxEkIoLCiPUZkH4A6sYe+/BHuVPw8MYatgIDyi7Ge93Qv5b780y8
 UbvQX3xzVHB9s+RJv999b8M9FBkYfBAzXJOLlug0PlYZA5f01Zkmhd5kkJ0CoSEw36
 IyqdJ1DHfct/ZqAyyvKWU3zYYkEOAQQgzgmpcK6FeF2dZQyd8RddDUIjbQhvN3Fcj4
 6SBKEgq3sZhUpM1FoF2kllCun3EBnM7iyfeekQF1qLHgnJxXBviDnPc+BTywjCHcW7
 yFQtF2yo6p/wQ==
Date: Thu, 3 Oct 2024 18:41:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 3/5] dt-bindings: display/msm: merge SM8350 DPU into SC7280
Message-ID: <172799887185.1833455.5440021996602281505.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-3-91ab08fc76a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-3-91ab08fc76a2@linaro.org>
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


On Thu, 03 Oct 2024 10:14:20 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SM8350, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
>  .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 ---------------------
>  2 files changed, 1 insertion(+), 120 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

