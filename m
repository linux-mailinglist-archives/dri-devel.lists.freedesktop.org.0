Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C5871ABC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3341129EE;
	Tue,  5 Mar 2024 10:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YPw2pNpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180521129E7;
 Tue,  5 Mar 2024 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709634099;
 bh=nzGENR6qPVPcbYLF4x3N7tmWM6ERhotNjmvi/Zt/WQg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YPw2pNpIepIbB+3vJ5Z06Bdl1TptFLGJ0VsudVqJCHg30R8rbAT2F7jBIBmivp4I7
 NFLJYQx1ERVW7s5/j0U+U5wFD3SpGmRg+Gi1fJp+5qk9BupBIhjL7tjIVAKf2x4peI
 iqibceRInpRuLJEI8axpebcBrb8uxlaa91cWY5vUmzwZNm8cFOdUU/fN+cAUBlYZyb
 CZIj/EliXPM6ACSl8vKwxR5qDMlZI/ESdkGimn+bcXRW0L9MOCacsCPe67nnq+Tk4P
 tgnOx0mkgTNFgXtZyALuNGIhZThWaXb5pekq3aEcqSHmZFwj6wQnqr7a5zrA5BuO0D
 857ea9Cb3r7DA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A204E3781FEF;
 Tue,  5 Mar 2024 10:21:36 +0000 (UTC)
Message-ID: <dbaf7eee-9a54-18f4-cdd2-c782581261e8@collabora.com>
Date: Tue, 5 Mar 2024 15:51:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ci: update device type for volteer devices
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, david.heidelberg@collabora.com,
 sergi.blanch.torne@collabora.com, guilherme.gallo@collabora.com,
 robdclark@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240305101626.36357-1-vignesh.raman@collabora.com>
Content-Language: en-US
In-Reply-To: <20240305101626.36357-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

Below is the pipeline with the job passing,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1119672

Regards,
Vignesh

On 05/03/24 15:46, Vignesh Raman wrote:
> Volteer devices in the collabora lab are categorized under the
> asus-cx9400-volteer device type. The majority of these units
> has an Intel Core i5-1130G7 CPU, while some of them have a
> Intel Core i7-1160G7 CPU instead. So due to this difference,
> new device type template is added for the Intel Core i5-1130G7
> and i7-1160G7 variants of the Acer Chromebook Spin 514 (CP514-2H)
> volteer Chromebooks. So update the same in drm-ci.
> 
> https://gitlab.collabora.com/lava/lava/-/merge_requests/149
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>   drivers/gpu/drm/ci/test.yml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 0857773e5c5f..8bc63912fddb 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -252,11 +252,11 @@ i915:cml:
>   i915:tgl:
>     extends:
>       - .i915
> -  parallel: 8
> +  parallel: 5
>     variables:
> -    DEVICE_TYPE: asus-cx9400-volteer
> +    DEVICE_TYPE: acer-cp514-2h-1130g7-volteer
>       GPU_VERSION: tgl
> -    RUNNER_TAG: mesa-ci-x86-64-lava-asus-cx9400-volteer
> +    RUNNER_TAG: mesa-ci-x86-64-lava-acer-cp514-2h-1130g7-volteer
>   
>   .amdgpu:
>     extends:
