Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCCA727CB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 01:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E094910E042;
	Thu, 27 Mar 2025 00:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cMTVcK3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073910E042
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 00:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743035790; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ep4+4OHjnet+T55CYlH3sDuhWLUsQUgkg7IJ7ir1vw6JNbyWjONhu2A33DxWh2+cZcFZmL4F6UO1bSyOKD/JTe37Pr3m+x5NKhsKjpZfndYaCg+1El/P7dBROCf1MnyOReZJGyz5fg1dUcG1GflEHzYCaN/BWhbycSQNv96PCFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743035790;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ikvz9WMNyJBjwYB1cpOBYo2vPcRIf/cvpfSEQFvHWmc=; 
 b=ZAgT7DyfzlJu/TWdFblefiN9V/NoaAgxKxmEhY14gGJQZQ/h7VFI6aeJdDTcjijAxKRrm9ihZwVgQUJiDzEnlsDj47uhQn53ItJjA+Zo9RL40hX0k/QIxQedVqklgCTTPpCrj9nRHp8DxYZh9UN3B1XKBjBrRDOx5r7+mxU1TRE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743035790; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ikvz9WMNyJBjwYB1cpOBYo2vPcRIf/cvpfSEQFvHWmc=;
 b=cMTVcK3y/PHfRupST1se0c8hMLCXZVFvnVxlqlee4Gg5H8yIuXL/shTu5Ym/T7J2
 vyLnhm+hD/j8orjCe9r//K75BGGBruwjFJ04iYwT2CMRZNMSmDtIOr69/Gv83tzBhlz
 KNaJ2OfDl7S/4uX7YRUCsf6KEVYYX5slYbolHqqo=
Received: by mx.zohomail.com with SMTPS id 1743035788153543.525982654246;
 Wed, 26 Mar 2025 17:36:28 -0700 (PDT)
Message-ID: <c0695bb2-4f47-4e4e-96f6-1d6302d075a4@collabora.com>
Date: Thu, 27 Mar 2025 03:36:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Add capset definitions
To: Aaron Ruby <aruby@qnx.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>
References: <YT3PR01MB58570C381CB52E7EF5B1E751AFA72@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <YT3PR01MB58570C381CB52E7EF5B1E751AFA72@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 3/25/25 18:42, Aaron Ruby wrote:
> From 73e0b6fb04d90b70de1f40e8e2ffc8fe497fa204 Mon Sep 17 00:00:00 2001
> From: Aaron Ruby <aruby@qnx.com>
> Date: Mon, 24 Mar 2025 16:18:43 -0400
> Subject: [PATCH] drm/virtio: Add capset definitions
> 
> Since the context-type additions to the virtio-gpu spec, these have been
> defined locally in guest user-space, and virtio-gpu backend library code.
> 
> Now, these capsets have been stabilized, and should be defined in
> a common space, in both the virtio_gpu header, and alongside the virtgpu_drm
> interface that they apply to.
> ---
>  include/uapi/drm/virtgpu_drm.h  | 6 ++++++
>  include/uapi/linux/virtio_gpu.h | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index c2ce71987e9b..9debb320c34b 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {
>          __u32 flags;
>  };
>  
> +#define VIRTGPU_DRM_CAPSET_VIRGL 1
> +#define VIRTGPU_DRM_CAPSET_VIRGL2 2
> +#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3
> +#define VIRTGPU_DRM_CAPSET_VENUS 4
> +#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5
> +#define VIRTGPU_DRM_CAPSET_DRM 6
>  struct drm_virtgpu_get_caps {
>          __u32 cap_set_id;
>          __u32 cap_set_ver;
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index bf2c9cabd207..be109777d10d 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {
>  
>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> -/* 3 is reserved for gfxstream */
> +#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
>  #define VIRTIO_GPU_CAPSET_VENUS 4
> +#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
>  #define VIRTIO_GPU_CAPSET_DRM 6
>  
>  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
> --
> 2.25.1
> 
> ----------------------------------------------------------------------
> This transmission (including any attachments) may contain confidential information, privileged material (including material protected by the solicitor-client or other applicable privileges), or constitute non-public information. Any use of this information by anyone other than the intended recipient is prohibited. If you have received this transmission in error, please immediately reply to the sender and delete this information from your system. Use, dissemination, distribution, or reproduction of this transmission by unintended recipients is not authorized and may be unlawful.

Your patch is corrupted by your mail client or provider, please fix it.

Please also follow the patch submission guild [1] and add your
signed-off-by to the patch.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-- 
Best regards,
Dmitry

