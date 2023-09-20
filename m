Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C47A8E4D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 23:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F86510E472;
	Wed, 20 Sep 2023 21:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303EF10E472
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 21:16:50 +0000 (UTC)
Received: from [192.168.2.59] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DFD9E6607243;
 Wed, 20 Sep 2023 22:16:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695244608;
 bh=/uXms4Ed0qkrcDVFyQbXMXWBrNgU3tQ1s6X3LMw/2tE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q9pRvLrN+euSDPP8sfjWJdYDUzEydPa9mcUkM0MdVkElMlKoLPetbflXunq/aOIrf
 CgSm/NL7YsWEUW8TlsxexXtN7k1hP1mfnmTcmB2H/Dd/66UFQghIoVhPJMiyO2ErVP
 AuLXMGpJkzrRv68oQeL4RP7EwsXKO38QsqPXFvyf7fa9+OgmEJS3Uu00UptjzGCVsJ
 cmPAh1yKHDwr5m0JvfGUf0L11UeCbrtwc+tgqgBT41/aOp+uelfvN9ytFR0Lz4/b+m
 ZKAuTloeT6W2FDc3ChPLTeihVgZUXdmFPxP/GapKxGdLExuxvqN7DZeT7o1iZtRcdX
 te9jaD9nUFoag==
Message-ID: <a7b783c8-b1c8-90e3-b6c7-7fa8c6d24d21@collabora.com>
Date: Thu, 21 Sep 2023 00:16:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/virtio: add definition for venus capset
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20230915105918.3763061-1-ray.huang@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230915105918.3763061-1-ray.huang@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/15/23 13:59, Huang Rui wrote:
> This definition is used fro qemu, and qemu imports this marco in the
> headers to enable venus for virtio gpu. So it should add it even kernel
> doesn't use this.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Hi all,
> 
> We would like to add a new definition for venus capset, it will be used for
> qemu. Please see details on below discussion:
> 
> https://lore.kernel.org/qemu-devel/b82982aa-5b9e-481e-9491-b9313877bcaa@daynix.com/
> 
> Thanks,
> Ray
> 
>  include/uapi/linux/virtio_gpu.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index f556fde07b76..0e21f3998108 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
>  
>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> +/* 3 is reserved for gfxstream */
> +#define VIRTIO_GPU_CAPSET_VENUS 4

Could you please add all other capsets, so we won't needed to do it
again in the future


-- 
Best regards,
Dmitry

