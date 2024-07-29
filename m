Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36293EBC7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 05:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F9210E2AC;
	Mon, 29 Jul 2024 03:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EDRy8Alj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A79410E2AC;
 Mon, 29 Jul 2024 03:09:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8DE38CE021D;
 Mon, 29 Jul 2024 03:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25655C116B1;
 Mon, 29 Jul 2024 03:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722222590;
 bh=qGGqw71micBXJaxsXmYl7/ikb6fEH786nZP1LH2K67g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDRy8Alj7pCf8ehwMe8nZmF0kvOxHfoiUpmGC2NTrEnUld/VshbLgo+YpZogWA8Lc
 OobPt4gVIemc3bubHDY/K2415bYqiUi+ewv/tAFkxV9pQFx364hSHOrfifNY7V2oJ2
 8DdhiZJsVDtNO2hsnNRWTNNUxcxJ2YXQp2USESkxTufa4cll5QP36oTQj7DB4mz5+7
 c4P7ki5V6tMQEQ7/7685GLCK8/jDh2E6Wq2RGRD5FsDUd+H5vxc0pxi8mit7x6gpqw
 eby+qHk4W4gGJJj9IriXsNL4TL36yGavtfiaHF0Ol1UnWmBH6SwyKu7TFsPGb4Tgma
 quA+SGf4/OLaQ==
Date: Sun, 28 Jul 2024 22:09:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, robdclark@gmail.com, sean@poorly.run,
 quic_abhinavk@quicinc.com, 
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org, airlied@gmail.com, 
 daniel@ffwll.ch, fekz115@gmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH 1/2] drivers: drm/msm/a6xx_catalog: Add A642L speedbin
 (0x81)
Message-ID: <4v5kl65wurifvkpious5ae4zhpv7zklejalg4sp4vcjiwhfbv2@o7jee7jil5ke>
References: <20240722184314.36510-1-danila@jiaxyga.com>
 <20240722184314.36510-2-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722184314.36510-2-danila@jiaxyga.com>
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

On Mon, Jul 22, 2024 at 09:43:13PM GMT, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 

Please make sure the subject prefix matches other changes in the same
driver/files.

Regards,
Bjorn

> According to downstream, A642L's speedbin is 129 and uses 4 as index
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 68ba9aed5506e..99f0ee1a2edea 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -869,6 +869,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
>  			{ 117, 0 },
> +			{ 129, 4 },
>  			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
>  			{ 190, 1 },
>  		),
> -- 
> 2.45.2
> 
