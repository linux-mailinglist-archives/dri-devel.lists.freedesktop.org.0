Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A2D9F2D0A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94E610E562;
	Mon, 16 Dec 2024 09:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KlYjIsnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A791310E562;
 Mon, 16 Dec 2024 09:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 986195C1101;
 Mon, 16 Dec 2024 09:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CD2C4CED0;
 Mon, 16 Dec 2024 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734341597;
 bh=yndVn34bCyl1mk7624b3uy12Ns2e5Qunxm39WYYBdts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KlYjIsnBEL4QGqc+5XEvmXKjI9BYHk2jAGISl3dcIy6WB3L/Go8Hde9JbdNRaABg/
 5CuPLu9J43l7Q9SbWGUGlCBcwl2+yLzInKyrobgT2mdvAWJmAiUAjpjIsthSUFLBev
 Jxvi+VhWZJ8RCmKAAzJtif9WnKBTUy+lfWKpD6MG6vHOhfQRx+cdbD3LdRMjd5k7GC
 kJ9mEX5eqKmWt9UsfeT1bsOAL0P6OnNjjag4be6LE1mwediA8y3MimeP00gqZoEqEz
 H83HllpQgXB32Wgxtpdk88dFA4fLyC46ezfaXfdWh1tSHzc0opwF2lzSpYLFZhCkO8
 ozOKCR0Rb89tQ==
Date: Mon, 16 Dec 2024 10:33:15 +0100
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
Subject: Re: [PATCH RESEND v2 1/4] dt-bindings: display/msm: gpu: Document
 A612 GPU
Message-ID: <zzqp3ejgdtaala6ksdwnlmfv7c32o43eghqbmulp2f2p4pqlvs@5ihzuzav3tah>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-1-47f3b312b178@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-qcs615-gpu-dt-v2-1-47f3b312b178@quicinc.com>
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

On Fri, Dec 13, 2024 at 05:01:03PM +0530, Akhil P Oommen wrote:
> A612 GPU requires an additional smmu_vote clock. Update the bindings to
> reflect this.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 6ddc72fd85b04537ea270754a897b4e7eb269641..1276331cb262e64cc94d6a9973463b3c1ff8b7a8 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -217,6 +217,42 @@ allOf:
>        required:
>          - clocks
>          - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,adreno-612.0
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
> +        clock-names:
> +          items:
> +            - const: core
> +              description: GPU Core clock
> +            - const: mem_iface
> +              description: GPU Memory Interface clock
> +            - const: alt_mem_iface
> +              description: GPU Alternative Memory Interface clock
> +            - const: gmu
> +              description: CX GMU clock
> +            - const: xo
> +              description: GPUCC clocksource clock
> +

Missing constraints for reg. xxx and xxx-names cannot be different.

Best regards,
Krzysztof

