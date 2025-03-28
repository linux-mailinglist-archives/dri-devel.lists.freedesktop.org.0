Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ABCA74233
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A6210E07E;
	Fri, 28 Mar 2025 02:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Lm20C/7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483AC10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743127507; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YMz5o93WjaGpXQ3AdI+h5g/7MnCGoXBXGGK6++wg43UtG9QoWIa3Gmfk/CKgG9u8hSwaHksVM+P97vwQp3KbVUPT8a+A4cwkaia0/ST/HR7v5qPNmOFqIxtXsE/mBtBbFjoFGBWHDmQdPUB6eZNnUgZt+XHBbbzZRiHNuVkWgWM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743127507;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=foYxZ8ZvdvfA2cwyyn2qKiMDU8j5+24lGGGNjQFNZik=; 
 b=gGPgWPeUtqOQlcaWj6dEJToRAzykipCYe9ObSjpqrl0gdvmyE1NVHDtKJQwezrHk+d/KHGrLJXTNu97lrg1n44llSRPGN4871NJjnTHNqTPvOp2nxarWZt6fzz2A3P8uezytYBzBKHVl66Q97ENg6SqasA41S8/8bnLZBe8wzl8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743127507; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=foYxZ8ZvdvfA2cwyyn2qKiMDU8j5+24lGGGNjQFNZik=;
 b=Lm20C/7I5IR7Jr4WImLgD6YZLybdIJGBcaWZu7XCPe7ukRszd4koqGlkJExLcDdR
 2eHN0w8IBQFA1CB3ZKumeyxllzYU9DACEOtgcFIUa73+A9W7qc+8FD/HkIAmPP+qd4K
 dBR6gtWuQe3fFKhWC6QBFDcBFLyZcTNGR20owt18=
Received: by mx.zohomail.com with SMTPS id 1743127504426600.9463314908267;
 Thu, 27 Mar 2025 19:05:04 -0700 (PDT)
Message-ID: <4eda682a-f5b9-418a-a0a9-2adbff3f1b55@collabora.com>
Date: Fri, 28 Mar 2025 05:04:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Add capset definitions
To: Aaron Ruby <aruby@qnx.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <YT3PR01MB5857E808EDF6949F2DF517FDAFA12@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <YT3PR01MB5857E808EDF6949F2DF517FDAFA12@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 3/27/25 18:25, Aaron Ruby wrote:
> 
> Since the context-type additions to the virtio-gpu spec, these have been
> defined locally in guest user-space, and virtio-gpu backend library code.
> 
> Now, these capsets have been stabilized, and should be defined in
> a common space, in both the virtio_gpu header, and alongside the virtgpu_drm
> interface that they apply to.
> 
> Signed-off-by: Aaron Ruby <aruby@qnx.com>
> ---
>  include/uapi/drm/virtgpu_drm.h  | 6 ++++++
>  include/uapi/linux/virtio_gpu.h | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index c2ce71987e9b..9debb320c34b 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {
>  	__u32 flags;
>  };
>  
> +#define VIRTGPU_DRM_CAPSET_VIRGL 1
> +#define VIRTGPU_DRM_CAPSET_VIRGL2 2
> +#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3
> +#define VIRTGPU_DRM_CAPSET_VENUS 4
> +#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5
> +#define VIRTGPU_DRM_CAPSET_DRM 6
>  struct drm_virtgpu_get_caps {
>  	__u32 cap_set_id;
>  	__u32 cap_set_ver;
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index bf2c9cabd207..be109777d10d 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {
>  
>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> -/* 3 is reserved for gfxstream */
> +#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
>  #define VIRTIO_GPU_CAPSET_VENUS 4
> +#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
>  #define VIRTIO_GPU_CAPSET_DRM 6
>  
>  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */

Applied to misc-next, thanks!

Your email provider still adding junk to email, but git-apply worked
this time. In a such cases sending patches from a personal email address
is an option.

You should add r-b and other tags to new patch version that were given
to a previous version. I corrected it.

Again, please follow the kernel patch submission guide, use
scripts/get_maintainer.pl and etc.

-- 
Best regards,
Dmitry
