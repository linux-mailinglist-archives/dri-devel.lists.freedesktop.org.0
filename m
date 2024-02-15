Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A205B85590C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 03:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC9610E162;
	Thu, 15 Feb 2024 02:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m8kV5y6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828D010E162;
 Thu, 15 Feb 2024 02:56:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9AEB4CE24BD;
 Thu, 15 Feb 2024 02:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A3AC433F1;
 Thu, 15 Feb 2024 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707965798;
 bh=yvs/U+kUCiyR07Pib58VdwJ/XOtbMmpXBVFg4jf9vAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m8kV5y6kZ/Vq0xa+v6cnaIZ5mCEfJLuZhxYRRbS4uom1kKgd4IgZmx+P2paZdUoD9
 bBIP2NcGelcd8lU6kzotI/tmMaV0o4//INI6K64AdimC6Re9I6uwV4EjyZZfNSCh3e
 OA/SA7mUUyH5uh6CqN5PjG8XEeHh/TvBq2uGd7FZ8GCkPnZdRmp6P38GFDxTwmY6sF
 Z1N3C1/HSiRKP4ckhs4Kdo97oPTlZzLT/geHtRTEEOucJi19W3eISooC4qLbJuGsBk
 cek5KQZPrMXNJaAxPyyNIyynL11Vl6l23EGS6emrDBZnsUGbjRUZ3FRl/AhMQMoen9
 a0lXiOTa3/75w==
Date: Wed, 14 Feb 2024 20:56:36 -0600
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm: Document the DPU for
 X1E80100
Message-ID: <20240215025636.GA2577530-robh@kernel.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
 <20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org>
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

On Wed, Feb 14, 2024 at 11:24:31PM +0200, Abel Vesa wrote:
> Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
> they are similar.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> index a01d15a03317..c4087cc5abbd 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> @@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,sm8650-dpu
> +    enum:
> +      - qcom,sm8650-dpu
> +      - qcom,x1e80100-dpu

Patch 1 uses this in the example, so this patch needs to come first.

>  
>    reg:
>      items:
> 
> -- 
> 2.34.1
> 
