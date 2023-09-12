Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B4779D6DE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1AC10E43F;
	Tue, 12 Sep 2023 16:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C8110E448
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:53:29 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A4E6366071C9;
 Tue, 12 Sep 2023 17:53:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694537608;
 bh=6lCw98iaIKfYLWDPpsaLngfvT7UkpYXBkxsUlQltt4U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HYfJFGquoDoVsDxe6BGBe0qelSuhXeWbnnGgmDdlnr0VEJcGlFU1NRGDlWWa1BHPk
 3rvq9wH/ct+khzCMCSLfwGZAtFUyhxc44G3pfnwq7En5GmyzxiPqGuRe0bZa1KqZhR
 udwBfkv5gJ4ZyVZMqmN4Dwo0t109kVqn69E0xSXAak5zH7ZiR6ujn8EgXSb3TxoaTx
 WGxtHRMLrTdzpv8PEzvTKYGXhXJzsdJ7g0pT3jEduTOIzt+j2WCMIggAlv7ZSOsM8s
 BKneObztNcl1r+TdzXbUMFdTSmNhOALKKbF8tOVPqV+niknSEws4uu56RIlenGRfpx
 9pIcWiuVQhvwg==
Message-ID: <b15fe4b9-9907-72e9-c1a0-35b065aa4732@collabora.com>
Date: Tue, 12 Sep 2023 13:53:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 5/9] drm: ci: Enable regulator
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-6-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-6-vignesh.raman@collabora.com>
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
 angelogioacchino.delregno@collabora.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2023 12:22, Vignesh Raman wrote:
> Enable CONFIG_REGULATOR_DA9211=y to fix mt8173 boot issue.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig
> 
> ---
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 817e18ddfd4f..ca95e141a7ae 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -184,6 +184,7 @@ CONFIG_HW_RANDOM_MTK=y
>   CONFIG_MTK_DEVAPC=y
>   CONFIG_PWM_MTK_DISP=y
>   CONFIG_MTK_CMDQ=y
> +CONFIG_REGULATOR_DA9211=y
>   
>   # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
>   CONFIG_ARCH_TEGRA=y
