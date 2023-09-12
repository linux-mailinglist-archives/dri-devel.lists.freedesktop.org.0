Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBFB79D702
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 19:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5425F10E44B;
	Tue, 12 Sep 2023 17:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211E710E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 17:01:36 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E81EF66072B4;
 Tue, 12 Sep 2023 18:01:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694538094;
 bh=XGlNAhRdPXO/CVxaBfaU+R1lxP9eWdQQ0iJwXNREACQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Fd17yMXHTH20mN4mXh8JVEEB4d069PZL3cUp7KY2Rk1OCWI4cpH+3h6udTtvxjnCB
 RDKHlLk5tB5KshHXuffH2Ek5PMIDnkI013k5HJmVVkiDm13gFwkrMwoZD+VuW49O7G
 2XMLqu5RzCBPkW7puEW1CfDvp5KbsUPsy+D0uCmNv6O407oE4JpimvR5Ca1mrrsxgg
 4ZVl8lcOMeCVQMzba/hdCxkHWdqMf27r86V8VHKMkxs4UfMdLMI0V9GDmxii4kfgdc
 TjcL8hijrQZqbiEDpCZ55a580BupKPEQw8iCyoxfAfwgWwk8DYf6BpPmKua6B5BMGU
 MOK1oJuWVpSzA==
Message-ID: <9d8a92ef-3442-2317-ada7-71d5e76573be@collabora.com>
Date: Tue, 12 Sep 2023 14:01:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 8/9] drm: ci: Enable new jobs
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-9-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-9-vignesh.raman@collabora.com>
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
> Enable the following jobs, as the issues noted in the
> TODO comments have been resolved. This will ensure that these jobs
> are now included and executed as part of the CI/CD pipeline.
> 
> msm:apq8016:
> TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
> 
> mediatek:mt8173:
> TODO: current issue: device is hanging. Fix and remove this rule.
> 
> virtio_gpu:none:
> TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - Reworded the commit message
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index d85add39f425..1771af21e2d9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -108,9 +108,6 @@ msm:apq8016:
>       RUNNER_TAG: google-freedreno-db410c
>     script:
>       - ./install/bare-metal/fastboot.sh
> -  rules:
> -    # TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
> -    - when: never
>   
>   msm:apq8096:
>     extends:
> @@ -273,9 +270,6 @@ mediatek:mt8173:
>       DEVICE_TYPE: mt8173-elm-hana
>       GPU_VERSION: mt8173
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
> -  rules:
> -    # TODO: current issue: device is hanging. Fix and remove this rule.
> -    - when: never
>   
>   mediatek:mt8183:
>     extends:
> @@ -333,6 +327,3 @@ virtio_gpu:none:
>       - debian/x86_64_test-gl
>       - testing:x86_64
>       - igt:x86_64
> -  rules:
> -    # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
> -    - when: never
> \ No newline at end of file
