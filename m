Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF691C45405
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067F410E2B4;
	Mon, 10 Nov 2025 07:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DMNpbAEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BB910E287;
 Mon, 10 Nov 2025 07:48:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5BE406014D;
 Mon, 10 Nov 2025 07:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AD8C16AAE;
 Mon, 10 Nov 2025 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762760923;
 bh=BzHOFsDMJBp7C7OzOH9Q8RWPWW0zUaINqu9SN7m2AM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DMNpbAEFVtH95qn/QNEiLu+vQT8sV6AtRlKVul3A8HIJxdYaGgxlGjVCiHKfm55xn
 jP/5Y5R6V1huY5ynsqGtb5F/pWUKlH6HqGly5WdrHh8w/JQjWPnTVpPBX27CX1WT6k
 PbGZUIPuKu1GgrdVvBm8tplLkc/nsGqXa7GMSah2+cGr9KeyaRq8gbOEGwqTv+p4AN
 o/bWNHwcgPshE5fuBCd67u6B9391aVzMQGlGdGg+XaUd+SOC7CkVFhR7mEuQlwgjDc
 mho5a2lM9DxVEnZnUZnW+Jz3kTzwCDxNnLn3Kk5T6kxx13yNvKXVusqF3WQyTYPX5x
 BCl9QxhVqdXjQ==
Date: Mon, 10 Nov 2025 08:48:40 +0100
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
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <20251110-wise-lurking-roadrunner-f0cec3@kuoka>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-2-a2d7c4fbf6e6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107-qcs615-spin-2-v2-2-a2d7c4fbf6e6@oss.qualcomm.com>
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

On Fri, Nov 07, 2025 at 02:20:07AM +0530, Akhil P Oommen wrote:
> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
> which replaces GMU. But it doesn't do clock or voltage scaling. So we
> need the gpu core clock in the GPU node along with the power domain to
> do clock and voltage scaling from the kernel. Update the bindings to
> describe this GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 826aafdcc20b..a6bbc88e6a24 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -45,11 +45,11 @@ properties:
>            - const: amd,imageon
>  
>    clocks:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 7
>  
>    clock-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 7
>  
>    reg:
> @@ -387,6 +387,34 @@ allOf:
>        required:
>          - clocks
>          - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-612.0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GPU Core clock
> +
> +        clock-names:
> +          items:
> +            - const: core
> +
> +        reg:
> +          items:
> +            - description: GPU Reg memory
> +
> +        reg-names:
> +          items:
> +            - const: kgsl_3d0_reg_memory

What happened with the second entry? Please describe the hardware
COMPLETELY (see writing bindings doc).

Best regards,
Krzysztof

