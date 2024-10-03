Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8B98FACA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 01:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D7010E9AB;
	Thu,  3 Oct 2024 23:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TlIMlzQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E905710E23D;
 Thu,  3 Oct 2024 23:43:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33F5D5C5A69;
 Thu,  3 Oct 2024 23:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32AFC4CEC5;
 Thu,  3 Oct 2024 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727999031;
 bh=T81lsStQ9X3gO/r8Iw0HI7telktUoho0zLgX1MlJofA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TlIMlzQsnnSej7bHvawbI+wuF+Gl9B6Rop0s/Ojv05A5i3+vV/Luxx2I8Cyw4Jl5D
 MwgdDlFJDS2SNlwkjxwcltV8WmQJXWFrHTy++4PgvRXmJzW/i6j3bMqjfK3f5H2eqF
 kq3Bi4Hy8IlKvsX8SvE2SwoucZX+BnbcCPa6vpMpKw0DkEBBrDqkDvIyeZTLe8KxzT
 drArZ6YL4qj5In9C7NbEBiO9PM4fTLTL1lj/dP+woRsXEX3/QpgRjhxl3Uovu6vvrd
 YtV5vi9CrLaoO7j7bCuOG9SDBwhGQzbI3rFy2KPI+ZRqZ4r7YCRCJjKCY7y1Kbxu5T
 dVajMa8Z6lMMg==
Date: Thu, 3 Oct 2024 18:43:50 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: merge SM8250 DPU into SM8150
Message-ID: <20241003234350.GA1852693-robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-2-91ab08fc76a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-2-91ab08fc76a2@linaro.org>
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

On Thu, Oct 03, 2024 at 10:14:19AM +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SM8150 and SM8250, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  4 +-
>  .../bindings/display/msm/qcom,sm8250-dpu.yaml      | 99 ----------------------
>  2 files changed, 3 insertions(+), 100 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
