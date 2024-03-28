Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046AC890BFD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 21:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA210E7B5;
	Thu, 28 Mar 2024 20:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EkTv1rFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355E010E7B5;
 Thu, 28 Mar 2024 20:52:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E7F08CE2CF8;
 Thu, 28 Mar 2024 20:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0769AC43394;
 Thu, 28 Mar 2024 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711659170;
 bh=M9alpGSonvC9HQq088c3j8Jt1zhm8w+ga/H5dJYrQe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EkTv1rFJvYbq0ASv6+ZA/X/T9fbUnAVKggRTD4ISVPJI3XLJaE/ENHWXn0uOFgphW
 gsgdgG8jSDEQQKLX8nzb+GV/LqtgJfPqfNDJXW1Xn5KvQGB86MdXWzzhVKZn+rLUgS
 OdUXEb/lRPhsfeLTKPydek6xgxuiZoH8U/vmLpXddHCuGo0Z3Btaetplz4BYKdTkUl
 TZmYiPg+HTg9i+Im20o52OZnRaw2oxbx5a6vZ3ODm/tOoPnF+oal3HeNnfVbzdhK7E
 2Sn1+LDNgkotXphJ8oRsVUI19laBrBmkw4fBk1KNkNyYCzi74HoJwC6ClS/2ylgdhx
 hMF+2NUMpslWA==
Date: Thu, 28 Mar 2024 15:52:47 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: msm: sm6350-mdss: document DP
 controller subnode
Message-ID: <20240328205247.GA324023-robh@kernel.org>
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
 <20240328-sm6350-dp-v1-2-215ca2b81c35@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-sm6350-dp-v1-2-215ca2b81c35@fairphone.com>
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

On Thu, Mar 28, 2024 at 10:42:45AM +0100, Luca Weiss wrote:
> Document the displayport controller subnode of the SM6350 MDSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> index c9ba1fae8042..d91b8eca6aba 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> @@ -53,6 +53,16 @@ patternProperties:
>        compatible:
>          const: qcom,sm6350-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm6350-dp
> +          - const: qcom,sm8350-dp

Just use 'contains' here with qcom,sm6350-dp. The full schema will check 
the order.

Rob
