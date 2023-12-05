Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8740805CAF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAC610E5B0;
	Tue,  5 Dec 2023 18:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003C710E5B0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:00:09 +0000 (UTC)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CFBE6660715D;
 Tue,  5 Dec 2023 18:00:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701799208;
 bh=BJnfYEP4jnzEj4xC3SBzSpdhlHMoXjr4hMbNgToqNCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZrmM49NoOB3x8hr/saLAgZ24NK1r5XWWETIfoXyilPXQw0teXOUfW/q9LhuUIpsEP
 RXlGXacDZ5FwLpr1yhlqHD3schTPsf5KHXDlFbxPtnQN78DuT4kADVCfdIvry2bRSE
 WSlVcOqqrUWHsHOv2SDEizYb9ROTxZ1coDO/bdOIRO0Dw3ssvk8/hcWg9lzZIs62cF
 svBTTfCxg3O8YBLRGac9/7HiYDyjQ5de5yWPAFi+zk2ba+pR1ZEa/axQtGTgVoB/0a
 0xsf0Ys2vZOz6chQenCg1G3WCGcBSHTRAeNvTNqkRPyb9Ou2SX3wcjXhz2rbDFw3Dx
 EDTTvY+oEWndQ==
Message-ID: <92256a4b-f957-40ac-af90-d5ea03da497b@collabora.com>
Date: Tue, 5 Dec 2023 15:00:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] drm: ci: virtio: Make artifacts available
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-8-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-8-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/11/2023 09:18, Vignesh Raman wrote:
> There were no artifacts available for virtio job.
> So make the artifacts available in the pipeline job.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v5:
>    - Added a new patch in the series to make artifacts available for virtio jobs
> 
> v6:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index e0fdc55c9b69..2c9a1838e728 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -329,6 +329,8 @@ virtio_gpu:none:
>     script:
>       - ln -sf $CI_PROJECT_DIR/install /install
>       - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
>       - install/crosvm-runner.sh install/igt_runner.sh
>     needs:
>       - debian/x86_64_test-gl
