Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3836C7CD61
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 12:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751610E032;
	Sat, 22 Nov 2025 11:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kf36F0ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7010E02A;
 Sat, 22 Nov 2025 11:02:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C15C86013B;
 Sat, 22 Nov 2025 11:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7C8C4CEF5;
 Sat, 22 Nov 2025 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763809348;
 bh=u3vNlreaF3sMxKexlEEHR5h7DRPdDWRk4D1WoCuLwwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kf36F0ab6hEphz4Iab5i/4rvEVv9WrLWboPUQ1huSj1p1I6juSFIGs/K08ew8f+FD
 QLgwXMxCUmrsHFFIdo9CTJ2LcBMQuBu14iMMnBQ/masfc3OTyzoaW1Lq0Q1Y0t+Nw8
 Q7aMyYl22QWIUrPP8mtpXh2aWcBO1FUXgZx/MdFBdZ/0VAFG2wxKSeuIp0x754KMyM
 4rSlXx15zXN97HH5Eesb230NS4HNJXaK6BceA/wHnJjSwuWkxXZfPmfj3D0E1nOkCC
 0GMoe6U4WQC80fcFfYgoyyRASDGXuEebCjb26JpnDLrFeaRbuRyYJZDOVTbLqoT4CV
 h9MYyQxa8LnoA==
Date: Sat, 22 Nov 2025 12:02:25 +0100
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
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
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

On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
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
> +      required:
> +        - clocks
> +        - clock-names
> +
>      else:

I am pretty sure you break not only intention/logic behindi this else,
but actually cause real warnings to appear.

The else was intentional, right? So the pattern further will not match
some of devices defined in if:. Now else is for different part, so only
612 out of these devices is excluded.

There is a reason we do not want ever else:if: in bindings. If it
appeared, sure, maybe there is some benefit of it, but it means you need
to be more careful now.

>        if:
>          properties:
> 
> -- 
> 2.51.0
> 
