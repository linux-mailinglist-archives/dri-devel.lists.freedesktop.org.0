Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0309D6A1D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C832810E481;
	Sat, 23 Nov 2024 16:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OdjP/2gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB2C10E47C;
 Sat, 23 Nov 2024 16:28:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D4F83A4049E;
 Sat, 23 Nov 2024 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17970C4CECD;
 Sat, 23 Nov 2024 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732379284;
 bh=4kW1hmaRcvlW822s40y2EmNJ6JjAbCgKF+oCMp92zm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OdjP/2gm7hiTwtGDqfK0SBqJNDJFcKbVC0EY/2C+H0qYmNbeQAhvEUp+uf3cKSsFC
 zPn/BP7qIIsTA8dHcM9ToBBd5PpdR8mlERcZV1FK8mtkm46H4cPTY3y38RPRON6j/i
 qbY/RI3amOroUnQdw7QGiKrJH5usRR7lEYxY9NUhZ2IF89sE31ze9/tw1iLlv6ywVP
 NqbNZhFcWSDIgfIKczxfXRjY6HcGEWlev1BH+aFU4YowMy3oymW29pKSsOl1bXcoYQ
 dahDTEdSpMlH9U7qFuoZkvkmo4mnrPWaOyXUUluYTHg0HUrEXytlpLvRO8lcpLSnls
 gLqZpjYOC1OiA==
Date: Sat, 23 Nov 2024 17:28:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/9] dt-bindings: display/msm: dsi-controller-main:
 Document SM6150
Message-ID: <grizxfiq3zlquijtufhtjnnwlq2cl264ouzxrglroafreoujoz@lk2rjcaa6lxy>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:45PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document general compatibility of the DSI controller on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..a7fbb5af4b0583e88ebcad07dd004046c38f95ee 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -30,6 +30,7 @@ properties:
>                - qcom,sdm845-dsi-ctrl
>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
> +              - qcom,sm6150-dsi-ctrl

This is incomplete change. Where is the rest for clocks? See entire
file.

Best regards,
Krzysztof

