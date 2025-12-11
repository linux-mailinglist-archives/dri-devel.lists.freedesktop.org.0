Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB79CB5704
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 11:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1302E10E7C6;
	Thu, 11 Dec 2025 10:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jWbcp8Av";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2310E7C6;
 Thu, 11 Dec 2025 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765447288;
 bh=z2AQUlVcFXNG1+oOsi1lBzZm3wHr0r1xZSybqjdX1sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jWbcp8AvvOgZXr32egMjjzAaXev84ZkhmhZRTQiZ5DfqkBvebCTLoK4b4lHxz2axN
 fAbeV5pbGCHfnhmkxpZJZF5YPhq0Yq3OT20vKB43AnwNyCzU4KgIioR+cQ82tcWLLi
 5wOH+OVlUEpSkq82lw4SXR0k7LOVE3za+96Qct9IQAXgCbls24fbxQkjNHRcq74TtB
 jPNovr83kVN9xWToDdl6zm+laDkexjDgO9h4AUNNhdIrGqjiy/ZmjOSMYUqLJKtzMp
 e6bKFt1J6TZzF3ITh3kEZTz++Eb8giwBJlenqEwWVEEwKTirIScmAuUFDPPbqdfT2f
 N2dX3xnWOQinA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E341517E1544;
 Thu, 11 Dec 2025 11:01:27 +0100 (CET)
Date: Thu, 11 Dec 2025 11:01:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 02/13] drm/gem-shmem: Fix the MODULE_LICENSE() string
Message-ID: <20251211110122.0a5c975d@fedora>
In-Reply-To: <20251209140141.94407-3-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209140141.94407-3-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue,  9 Dec 2025 14:41:59 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
> value does not declare the module's exact license, but only lets the
> module loader test whether the module is Free Software or not.
> 
> See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
> "GPL v2" bogosity") in the details of the issue. The fix is to use
> "GPL" for all modules under any variant of the GPL.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index f4e77f75ec81..2a67da98da25 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -896,4 +896,4 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>  
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("GPL");

