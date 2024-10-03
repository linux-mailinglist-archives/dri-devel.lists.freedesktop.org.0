Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92498FAD5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 01:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961610E9BB;
	Thu,  3 Oct 2024 23:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BlGzvtsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9745710E9BA;
 Thu,  3 Oct 2024 23:44:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5EAB9A404E8;
 Thu,  3 Oct 2024 23:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4104BC4CEC5;
 Thu,  3 Oct 2024 23:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727999066;
 bh=44T/LQEyEbWv3qViR62MlA1E48CLDHvz2GFtXMPk8pI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BlGzvtskwYe/TRcheoHYxtJf6VDx935IjLJ19L02PqvMnFMx8vSMyP2jBTUJnX7zs
 pbgeUlDPHCOKP1Z4PLdqsK66XNJlyb5pjhFg0ZBc0DjT9Kuvq8h1WAWUZBT+GhE9gN
 N0iSozSIwVmL9f28X+BKR9tA+TR3dhtemcjtmNEN2ZXX2eJF9LBA0Ebk1smHhozATC
 BrvEObBgGAto91I/Rttqq+n3Od9DfLUd+AYd1tcwxMiwgj+6Ey+CmjWkWLyi3pvCHw
 JOj74WqfrjbyrrJhhJvLrw+MKHlRNHQE92Yc2nh+22LMayVZIv2HVOg+WblBotv9WW
 xxWxla7xaHzow==
Date: Thu, 3 Oct 2024 18:44:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: Re: [PATCH 5/5] dt-bindings: display/msm: merge SM8550 DPU into SC7280
Message-ID: <172799906304.1865895.9301789206572739030.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-5-91ab08fc76a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-5-91ab08fc76a2@linaro.org>
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


On Thu, 03 Oct 2024 10:14:22 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SM8550, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
>  .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 ---------------------
>  2 files changed, 2 insertions(+), 133 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

