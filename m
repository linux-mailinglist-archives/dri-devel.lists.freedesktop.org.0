Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726489F2D1C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F10A10E07C;
	Mon, 16 Dec 2024 09:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPg7QYkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA57B10E07C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:39:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0E348A4092B;
 Mon, 16 Dec 2024 09:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A632C4CED0;
 Mon, 16 Dec 2024 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734341992;
 bh=Noet9CaazzQbUxDP3jlUjci//p8ZmHg5ytb0poaBeSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPg7QYkHgCIBeZAkDMgsiOONxQRoLefzvS3eQj7pks5uj3zAjewbrKbOw+eLfPyOp
 J0LnonXM/39JiJQdZfKmFApk1D4T+mH97ZyjpnLxGGA4xrXrlc82o9tKSYUnuvVBUb
 6T41ZXO4sir8GWcbjhfOhBnthu5SdzuYn46qMWNPjb8sSjihEhBV34k5MOtvIBfDAo
 cSSs1Bjh2RpZUEkEs85qcDARcae1h4oR/UTMeAWKDdP1xBp6v96V2IxEOucXdMR7o1
 sYBqjjUMolfIP8aT9nLWp7cxP7mIFe1KxFAJ5IQM9rHsxku4CapRijYtCmZ8haJsS/
 yAGe27XwjIiLg==
Date: Mon, 16 Dec 2024 10:39:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/4] dt-bindings: display/msm/gmu: Document RGMU
Message-ID: <fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-2-47f3b312b178@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-qcs615-gpu-dt-v2-2-47f3b312b178@quicinc.com>
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

On Fri, Dec 13, 2024 at 05:01:04PM +0530, Akhil P Oommen wrote:
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC support. Compared to GMU, it

What is IFPC?

> doesn't manage GPU clock, voltage scaling, bw voting or any other
> functionalities. All it does is detect an idle GPU and toggle the
> GDSC switch. So it doesn't require iommu & opp table.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index b1bd372996d57138a0e80f8d93df09943775fdfa..6889dda7d4be71535dff1a62ca30f980bfc6128d 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -27,6 +27,7 @@ properties:
>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>            - const: qcom,adreno-gmu
>        - const: qcom,adreno-gmu-wrapper
> +      - const: qcom,adreno-rgmu
>  
>    reg:
>      minItems: 1
> @@ -267,12 +268,14 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,adreno-gmu-wrapper
> +            enum:
> +              - qcom,adreno-gmu-wrapper
> +              - qcom,adreno-rgmu

Does your new rgmu has clocks, interrupts etc? If yes, define them. If
not, disallow them.

Best regards,
Krzysztof

