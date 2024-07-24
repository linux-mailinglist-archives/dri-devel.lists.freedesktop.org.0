Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF093B63A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7265610E78A;
	Wed, 24 Jul 2024 17:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BDy2fDbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A0810E783
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721843716;
 bh=+Cz8FMfqaSMVQTCt9LPQa3f7UPH6cU0zFsty7wI3sNc=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=BDy2fDbL9j9U1m82H+p5L6AIfTBoPApmg9sbJSWHdf8uqZsZSHhR5frvHtXURwwkk
 mc4FnrFPtZdqee3TYsOjsEmEkE051h3o1faEziwJKOilcSpn/C6mllJQz49B5KSW9h
 4gwNKoH9omVmwL6YjO62oopO2Pzkzphyx9x4g5uu1X6Hn9KWBhswquzkianRj/8IWr
 rWP3kYqL5g9KTAPLWGGCS8D0P1ubqalUKyjueF8Ug9hyWNOIyEzRh+gpPWiI6CQBxu
 +srJYXPCUylazyFl20tIQ3COCHcKmKwiQU2hMwCHfsYMc6QJLT2CLLEQEji4qe8zsQ
 CaWSY9kBLaF/Q==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E3CFC3781144;
 Wed, 24 Jul 2024 17:55:15 +0000 (UTC)
Message-ID: <7b41a75a-1d52-4cc4-a12e-6ed2be313f02@collabora.com>
Date: Wed, 24 Jul 2024 20:55:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/virtio: Add DRM capset definition
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20240714205502.3409718-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20240714205502.3409718-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 7/14/24 23:55, Dmitry Osipenko wrote:
> Define DRM native context capset in the VirtIO-GPU protocol header.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  include/uapi/linux/virtio_gpu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index 0e21f3998108..bf2c9cabd207 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -311,6 +311,7 @@ struct virtio_gpu_cmd_submit {
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
>  /* 3 is reserved for gfxstream */
>  #define VIRTIO_GPU_CAPSET_VENUS 4
> +#define VIRTIO_GPU_CAPSET_DRM 6
>  
>  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>  struct virtio_gpu_get_capset_info {

Applied to misc-next

-- 
Best regards,
Dmitry

