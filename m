Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB3D79D6D7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFBD10E23E;
	Tue, 12 Sep 2023 16:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321CB10E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:52:56 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CC7D866071C9;
 Tue, 12 Sep 2023 17:52:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694537575;
 bh=TVo8blOVOG3UIRsd0gEuMSvu6J/PcJyo+tO8L2Vpang=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WgqcopKFLk6Cp6RK+TO4+r+Pc+vI3zhvU7M99sa3ToH4A0zqU96YwnP5NcsOae1Nt
 GQwZGaxHmvOkQsDW6PuEX2U8yAAfuPZo5l15rHiKMqZa5hVSWGUpNzOGG2H0ydAiaT
 WcDf1rhF62wJGyTlXZMDQTHKJvKwZgvMKkKO+naJRwE+N4lMDTUNQcBDNTiPgJHGPm
 9fkfIr3BY1S9t30UMea7pQX/FE0Es1u3dT06Vj6jyfWAu+CYwZskcjtlgN9N4ykd60
 BV4IzEMzhniqm5oZfVxzGJN/p4QVF9BL1pd/f0yHwrgJMHNI5pB1cHyzvE7+5ryLES
 33ChqUPD+xpZg==
Message-ID: <44b7c0d5-bfa5-bac1-83d5-debc2365b1ae@collabora.com>
Date: Tue, 12 Sep 2023 13:52:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 4/9] drm: ci: virtio: Update ci variables
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-5-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-5-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2023 12:22, Vignesh Raman wrote:
> Update ci variables to fix the below error,
> ERROR - Igt error: malloc(): corrupted top size
> ERROR - Igt error: Received signal SIGABRT.
> ERROR - Igt error: Stack trace:
> ERROR - Igt error:  #0 [fatal_sig_handler+0x17b]
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 6473cddaa7a9..d85add39f425 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -316,8 +316,11 @@ virtio_gpu:none:
>     stage: virtio-gpu
>     variables:
>       CROSVM_GALLIUM_DRIVER: llvmpipe
> -    DRIVER_NAME: virtio_gpu
> +    DRIVER_NAME: virtio
>       GPU_VERSION: none
> +    CROSVM_MEMORY: 12288
> +    CROSVM_CPU: $FDO_CI_CONCURRENT
> +    CROSVM_GPU_ARGS: "vulkan=true,gles=false,backend=virglrenderer,egl=true,surfaceless=true"
>     extends:
>       - .test-gl
>     tags:
