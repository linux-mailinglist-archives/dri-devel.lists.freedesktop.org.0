Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF679D6BF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F77C10E43D;
	Tue, 12 Sep 2023 16:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7062510E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:50:17 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 61A08660716C;
 Tue, 12 Sep 2023 17:50:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694537415;
 bh=b3Pjb5sxufyfJz4YTfjIpaTwu6GqQK/gK7r+UI5k7ik=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IC9XweikCd8wdErjDdbQJM9Njzz31wFTIAhGgOAzdnnoYQbU1AUs+Pa5veanwx2A0
 gLLM2cy4TlTjTQk7gPqHVr6yclTb2wKyv/uos04WCaDGVZDGRIkGwx5wseNTvXb5ta
 bvOUi9N3zM8Pn0T66BaMTWLsVvPk3gqqS5hoRlbWBnRoIJ4B4UHtVFQ2S8TUqo5NWC
 3gwc4F9mg1yp5NZ1QSLgG0WpgL7XqH0+4f2AWkODos/y7qgBvM/L51HdqtIydeqjP7
 r8Y/i0H2Ups3oRZm3knp/sGrKMJEf/RoyLdD4Ct38HA6vceS+yqCVNzuerEg0an/Db
 Dz8ha0wHIjCjg==
Message-ID: <113c0ae6-d7f1-b4d5-dc1a-2264cc815644@collabora.com>
Date: Tue, 12 Sep 2023 13:50:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/9] drm: ci: igt_runner: Remove todo
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-2-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-2-vignesh.raman@collabora.com>
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
> /sys/kernel/debug/dri/*/state exist for every atomic KMS driver.
> We do not test non-atomic drivers, so remove the todo.
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
>   drivers/gpu/drm/ci/igt_runner.sh | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 2bb759165063..5bf130ac57c9 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -15,7 +15,6 @@ cat /sys/kernel/debug/device_component/*
>   '
>   
>   # Dump drm state to confirm that kernel was able to find a connected display:
> -# TODO this path might not exist for all drivers.. maybe run modetest instead?
>   set +e
>   cat /sys/kernel/debug/dri/*/state
>   set -e
