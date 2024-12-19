Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFC9F7BF4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 14:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34610E085;
	Thu, 19 Dec 2024 13:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D636010E085
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 13:06:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD1A1758
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 05:07:04 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B2E73F528
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 05:06:36 -0800 (PST)
Date: Thu, 19 Dec 2024 13:06:26 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?B?QWRyacOhbiBNYXJ0w61uZXo=?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>;
Subject: Re: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Message-ID: <Z2QaUjCrgT3FkCjD@e110455-lin.cambridge.arm.com>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218181844.886043-3-adrian.larumbe@collabora.com>
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

On Thu, Dec 19, 2024 at 02:18:42AM +0800, Adrián Martínez Larumbe wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> A previous commit enabled display of driver-internal kernel BO sizes
> through the device file's fdinfo interface.
> 
> Expand the description of the relevant driver-specific key:value pairs
> with the definitions of the new drm-*-internal ones.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  Documentation/gpu/panthor.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index 3f8979fa2b86..23aa3d67c9d2 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -26,6 +26,10 @@ the currently possible format options:
>       drm-cycles-panthor:     94439687187
>       drm-maxfreq-panthor:    1000000000 Hz
>       drm-curfreq-panthor:    1000000000 Hz
> +     drm-total-internal:     10396 KiB
> +     drm-shared-internal:    0
> +     drm-active-internal:    10396 KiB
> +     drm-resident-internal:  10396 KiB
>       drm-total-memory:       16480 KiB
>       drm-shared-memory:      0
>       drm-active-memory:      16200 KiB
> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>  
>  Where `N` is a bit mask where cycle and timestamp sampling are respectively
>  enabled by the first and second bits.
> +
> +Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
> +These values convey the sizes of the internal driver-owned shmem BO's that
> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> +sync object arrays and heap chunks. Because they are all allocated and pinned
> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> +VM's and groups currently being scheduled for execution by the GPU.
> +`drm-shared-internal` is unused at present, but in the future it might stand for
> +the size of executable FW regions, since they do not belong to an open file context.
> -- 
> 2.47.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
