Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2493060E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 16:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD94810E0EE;
	Sat, 13 Jul 2024 14:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CAZEydLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1033610E0EE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2uav3E+ul5MKOMdkhowuT56kv7DKLoyRdOZKVM19EEY=; b=CAZEydLxUESyjA1vgRrRLZWHEE
 RqgXmGfD0CaroWWf/h61GzwyUFVMfuFlNowiZQVmEzcsyV6TvIdwaBR+cBQeFPMkg9i4xy6FYtIUC
 c8s5O+PjryICK6pbO23V1Wvl+FBn/8kVWhz1if5EEPCj7m2qPGzNwHn5BY3PS3X/AzsM6SxT3bvZn
 XetpBjDB0+R2ZlF98WUd1WXJwIie4s/joow7LOjfjUgUlRUqbyPq0FisETP5QL0hFNWmdi6btayfV
 N3UqQw3cmV2oDoeFqm1QLRgg0IWrXAy23RpiD+tOqCOsX/CpgxDFSWz7I82jnmj6lRNJr18G+290O
 ix5jBiZg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sSeCF-00Ekth-20; Sat, 13 Jul 2024 16:57:59 +0200
Message-ID: <b6752bc2-d27c-45fa-a35a-578939371a61@igalia.com>
Date: Sat, 13 Jul 2024 11:57:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Expose memory stats through fdinfo
To: Iago Toral <itoral@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240711142736.783816-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240711142736.783816-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/11/24 11:25, Maíra Canal wrote:
> Use the common DRM function `drm_show_memory_stats()` to expose standard
> fdinfo memory stats.
> 
> V3D exposes global GPU memory stats through debugfs. Those stats will be
> preserved while the DRM subsystem doesn't have a standard solution to
> expose global GPU stats.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Applied to drm-misc/drm-misc-next!

Best Regards,
- Maíra

> ---
> 
> * Example fdinfo output:
> 
> $ cat /proc/10100/fdinfo/19
> pos:    0
> flags:  02400002
> mnt_id: 25
> ino:    521
> drm-driver:     v3d
> drm-client-id:  81
> drm-engine-bin:         4916187 ns
> v3d-jobs-bin:   98 jobs
> drm-engine-render:      154563573 ns
> v3d-jobs-render:        98 jobs
> drm-engine-tfu:         10574 ns
> v3d-jobs-tfu:   1 jobs
> drm-engine-csd:         0 ns
> v3d-jobs-csd:   0 jobs
> drm-engine-cache_clean:         0 ns
> v3d-jobs-cache_clean:   0 jobs
> drm-engine-cpu:         0 ns
> v3d-jobs-cpu:   0 jobs
> drm-total-memory:       15168 KiB
> drm-shared-memory:      9336 KiB
> drm-active-memory:      0
> 
> * Example gputop output:
> 
> DRM minor 128
>    PID      MEM      RSS       bin          render           tfu            csd        cache_clean        cpu       NAME
> 10257      19M      19M |  3.6% ▎     || 43.2% ██▋   ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | glmark2
>   9963       3M       3M |  0.3% ▏     ||  2.6% ▎     ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | glxgears
>   9965      10M      10M |  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | Xwayland
> 10100      14M      14M |  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | chromium-browse
> 
> Best Regards,
> - Maíra
> 
>   drivers/gpu/drm/v3d/v3d_bo.c  | 12 ++++++++++++
>   drivers/gpu/drm/v3d/v3d_drv.c |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index a165cbcdd27b..ecb80fd75b1a 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -26,6 +26,17 @@
>   #include "v3d_drv.h"
>   #include "uapi/drm/v3d_drm.h"
>   
> +static enum drm_gem_object_status v3d_gem_status(struct drm_gem_object *obj)
> +{
> +	struct v3d_bo *bo = to_v3d_bo(obj);
> +	enum drm_gem_object_status res = 0;
> +
> +	if (bo->base.pages)
> +		res |= DRM_GEM_OBJECT_RESIDENT;
> +
> +	return res;
> +}
> +
>   /* Called DRM core on the last userspace/kernel unreference of the
>    * BO.
>    */
> @@ -63,6 +74,7 @@ static const struct drm_gem_object_funcs v3d_gem_funcs = {
>   	.vmap = drm_gem_shmem_object_vmap,
>   	.vunmap = drm_gem_shmem_object_vunmap,
>   	.mmap = drm_gem_shmem_object_mmap,
> +	.status = v3d_gem_status,
>   	.vm_ops = &drm_gem_shmem_vm_ops,
>   };
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index a47f00b443d3..e883f405f26a 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -184,6 +184,8 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
>   			   v3d_queue_to_string(queue), jobs_completed);
>   	}
> +
> +	drm_show_memory_stats(p, file);
>   }
>   
>   static const struct file_operations v3d_drm_fops = {
