Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7A8FD51A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B9F10E3A7;
	Wed,  5 Jun 2024 18:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DzuCIoOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33F10E314;
 Wed,  5 Jun 2024 18:05:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38AFDCE18C7;
 Wed,  5 Jun 2024 18:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0F1C2BD11;
 Wed,  5 Jun 2024 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717610756;
 bh=+y3yaIyqBqQ+qBHCr47NqxdcQHNtVGTtw1CuuXvmOLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DzuCIoOMgM+pzFBzbvCyjZN42UWIwiaZK6pNVz3kvyxqniODrNgOtKnWXrWg8NlE/
 3eD723EsPgq5mps0oe5/pR/v46PSvROk+9Raucfi8oUK4SlHfkJzvtQovS2XyyG9rW
 c2ZaQUxTyCPHDdZlZ7uukErpYO1VY2Hd38We4Fku5gMyIF4RH6AsiOVan3wx93mjLQ
 RC4kOv48WgOePpBwRDTbJBGXPlfOu8lvAq79ZkC140eTdwrIhkmxuiZ5hTBzxjiDts
 d4wZRrGS8vG81M0FoeQ5bNW3JpSP4lfR73xsg2XaVCRzYpXOvuAtVxBe0gqJIsVHuQ
 HZ1L2Vhy9PWYA==
Date: Wed, 5 Jun 2024 11:05:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Connor Abbott <cwabbott0@gmail.com>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Message-ID: <20240605180553.GA2457302@thelio-3990X>
References: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
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

Hi Abhinav,

Just a drive by style comment.

On Tue, Jun 04, 2024 at 05:38:28PM -0700, Abhinav Kumar wrote:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 0a7717a4fc2f..a958e2b3c025 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -8,19 +8,15 @@
>  #include "a6xx_gpu_state.h"
>  #include "a6xx_gmu.xml.h"
>  
> -/* Ignore diagnostics about register tables that we aren't using yet. We don't
> - * want to modify these headers too much from their original source.
> - */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wunused-variable"
> -#pragma GCC diagnostic ignored "-Wunused-const-variable"
> +static const unsigned int *gen7_0_0_external_core_regs[] __attribute((__unused__));
> +static const unsigned int *gen7_2_0_external_core_regs[] __attribute((__unused__));
> +static const unsigned int *gen7_9_0_external_core_regs[] __attribute((__unused__));
> +static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __attribute((__unused__));

Please do not open code attributes. This is available as either
'__always_unused' or '__maybe_unused', depending on the context.
checkpatch would have warned about this if it was '__attribute__'
instead of '__attribute'.

Cheers,
Nathan
