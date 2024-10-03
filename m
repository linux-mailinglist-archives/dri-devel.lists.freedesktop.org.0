Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC698FABF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 01:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968BE10E9B6;
	Thu,  3 Oct 2024 23:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZiOkC1zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4910E9B6;
 Thu,  3 Oct 2024 23:42:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3CC5D5C5BDE;
 Thu,  3 Oct 2024 23:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6013C4CEC5;
 Thu,  3 Oct 2024 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727998979;
 bh=M/19+YjrbzMQNuvvKNV9vc0WcA3QjMBGJW1OYQ/eqkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZiOkC1zb3gbrPSUlUg1SbdXA4vCWKviRLtPuFy87GghYvn+oM8eMkKTnN2fWJ9smb
 hR2ZhF+tWUSo8cByTeubsFAYGvKZvMQReb/GP3GnauYGuUbrfCV4Qng6JM7Wscucuf
 3tnJka1PqHwTgx8ZR/aI00CiRkQ2MUj9onnDXfJykjmeZMOK385jBBKo4ZY0mSekvN
 TVoZ/3e45AlDdLxn8oQgGld2RFQyM/VNh758xbX8kIZCX1+CU4VQAx+X9t6BotuO+d
 5YogddsTPhkfmS9k6Xh05IUdY7/tZVDSAhEKfzpQMjs82wF0UKkRoCz31TN86x/x6q
 TLKyCy12zYKVw==
Date: Thu, 3 Oct 2024 18:42:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: display/msm: merge SM8450 DPU into SC7280
Message-ID: <172799892217.1842244.9103312532953204323.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-4-91ab08fc76a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-4-91ab08fc76a2@linaro.org>
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


On Thu, 03 Oct 2024 10:14:21 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SM8450, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ---------------------
>  2 files changed, 2 insertions(+), 139 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

