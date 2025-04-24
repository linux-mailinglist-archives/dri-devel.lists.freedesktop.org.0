Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5157A9B6AA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 20:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA4310E06E;
	Thu, 24 Apr 2025 18:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NehH5t5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995B210E18B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 18:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745520412; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=n9Hih4Y/kZKdFwnTcatSV+iTG0xfq6bNanI6svWMjxAR0dTizQ/kQElG08MCb3FVQh9Cvqtt7DNJUKkwtVTqaBiCi/3BhpNtA8UPhHFZL9BRQ1fRmktyenCwgM614mh/rYFiK66FJa9hUQVCMNpTGuTZWnW1Ok8P7sGEef2ztbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745520412;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VnIRty3DmgrQ8Fp/zhn4k4TcM1bh8jcN0GPwYNWxrDM=; 
 b=YvWtlcYz0xPvI47VRy/NKuJzY3IPSFW4ea7WlJg25e6Q5+7jcAjBqVA52C1YtcN1CpV/XeMOwbvo10EoNGSgxEYyXje/AKDD2Br4Xix8EX1kc2sEE/hxwnYruPT/v+qD326retgM/3YLuuxHRYFj2Tfkhk1z/CW5QvGeb0i8kwY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745520412; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=VnIRty3DmgrQ8Fp/zhn4k4TcM1bh8jcN0GPwYNWxrDM=;
 b=NehH5t5PGXpo+WQlmxgvCzIvtkVKC3C4KzGIkRpNEHM6WcZtA7TWB+7xxROEHn+b
 bNTI/iM9fyXro4phR9Izi4klecwJOv1qej/1+BcTrC8EEQxN2KeEs4BA/LKZ31aX6MS
 KzufsL+vaOQrX7uZF4DPqeU5122cYU/Fh+WF/q0E=
Received: by mx.zohomail.com with SMTPS id 1745520410522235.14216279771347;
 Thu, 24 Apr 2025 11:46:50 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:46:45 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Florent Tomasin <florent.tomasin@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Message-ID: <sv54dpnwhkx7kh5rqwdqgahtno746ylpazvlclypetrcy2hazq@hztdh5jwrke5>
References: <20250424112637.3432563-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424112637.3432563-1-arnd@kernel.org>
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

Hi Arnd,

Thanks for the fix. I've already submitted a second attempt because I thought the build being broken
is something we ought to deal with ASAP. I've added you as a bug reporter and also made mention
of this thread in the new patch.

Kind Regards,
Adrian

On 24.04.2025 13:25, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When debugfs is disabled, including panthor_gem.h causes warnings
> about a non-static global function defined in a header:
>
> In file included from drivers/gpu/drm/panthor/panthor_drv.c:30:
> drivers/gpu/drm/panthor/panthor_gem.h:222:6: error: no previous prototype for 'panthor_gem_debugfs_set_usage_flags' [-Werror=missing-prototypes]
>   222 | void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>
> This could be changed to a static inline function, but as the normal
> one is also static inline, just move the #ifdef check in there.
> The #ifdef is still needed to avoid accessing a struct member that
> does not exist without debugfs.
>
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 4641994ddd7f..693842e10dee 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -209,17 +209,14 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>
> -#ifdef CONFIG_DEBUG_FS
>  void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
>  				   struct seq_file *m);
>  static inline void
>  panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
>  {
> +#ifdef CONFIG_DEBUG_FS
>  	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> -}
> -
> -#else
> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>  #endif
> +}
>
>  #endif /* __PANTHOR_GEM_H__ */
> --
> 2.39.5
