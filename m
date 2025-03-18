Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A4A66CE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 08:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81AE10E34E;
	Tue, 18 Mar 2025 07:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ay0EVHEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991F310E34E;
 Tue, 18 Mar 2025 07:55:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1D134A476B3;
 Tue, 18 Mar 2025 07:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA15C4CEDD;
 Tue, 18 Mar 2025 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742284505;
 bh=D4iMGhhuzept8ULjmWzbTssS4mIzRCuc7D7FjZeefVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ay0EVHEdmwjg6EwY1oj4Rnz6tLXQXjlk5J28ENJcy0uroi2w7MMralceARzOD+9ie
 xELU4DOwu2ExqI/2U4vXcsaQgBiSjKxOetS2X8o7V2f49Smx23WhjQb+YzgYGBjgy1
 G7DmhvM+EbYb9NlLn2DKMozCCHkUsShuszHZ15i+RZGXVlkoZ6MuFIKRmoj8jMPxna
 7MPHOFk4r60Y6S5GQpYLWlx4fQ7JzD7+bGbh39ICLYM7WcEpr0diy2sXCgI7Yjx57A
 XMUnbEHzl+84wc92pB0fltjf93E/buBI+6AxyJ+YqrUWg4KMkDmrq9V1HfJMhlZDbz
 amry7CiVquiIg==
Date: Tue, 18 Mar 2025 08:55:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Kumar Gala <galak@codeaurora.org>, 
 Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
Message-ID: <20250318-hungry-nimble-marten-dfb4db@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
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

On Mon, Mar 17, 2025 at 07:44:36PM +0200, Dmitry Baryshkov wrote:
> On Qualcomm platforms in addition to regulators the RPM also provides
> clocks via the child clock-controller node. Describe it properly in the
> schema.
> 
> Fixes: 6b42133d2189 ("dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema")

Fixes should rather point to original binding, because the conversion
did not miss them. They were not there in the first place. Coversion
should add them, to match existing DTS, but still the mistake is in the
TXT binding.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

