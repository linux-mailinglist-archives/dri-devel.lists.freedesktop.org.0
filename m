Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9340997EC4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0410E888;
	Thu, 10 Oct 2024 08:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB29810E888
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 08:10:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E75EC497;
 Thu, 10 Oct 2024 01:10:36 -0700 (PDT)
Received: from [10.1.33.28] (e122027.cambridge.arm.com [10.1.33.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 255E73F64C;
 Thu, 10 Oct 2024 01:10:05 -0700 (PDT)
Message-ID: <d086651e-410e-4ac6-8825-d192abeac38f@arm.com>
Date: Thu, 10 Oct 2024 09:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/gpu: Fix Panthor documentation build
 warnings
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: kernel@collabora.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241009214346.2308917-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241009214346.2308917-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 09/10/2024 22:43, Adrián Larumbe wrote:
> Fix Panthor documentation build errors uncovered by the makedocs target
> when building with extra warnings enabled.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: f25044688b04 ("drm/panthor: add sysfs knob for enabling job profiling")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  Documentation/gpu/drivers.rst         | 1 +
>  Documentation/gpu/drm-usage-stats.rst | 1 +
>  Documentation/gpu/panthor.rst         | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index b899cbc5c2b4..7b1282e2d807 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -22,6 +22,7 @@ GPU Driver Documentation
>     afbc
>     komeda-kms
>     panfrost
> +   panthor
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index a80f95ca1b2f..12ca3193bf15 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -186,4 +186,5 @@ Driver specific implementations
>  
>  * :ref:`i915-usage-stats`
>  * :ref:`panfrost-usage-stats`
> +* :ref:`panthor-usage-stats`
>  * :ref:`xe-usage-stats`
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index cbf5c4429a2d..3f8979fa2b86 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -4,7 +4,7 @@
>   drm/Panthor CSF driver
>  =========================
>  
> -.. _panfrost-usage-stats:
> +.. _panthor-usage-stats:
>  
>  Panthor DRM client usage stats implementation
>  ==============================================

