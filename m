Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38052A591D8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA3B10E3F6;
	Mon, 10 Mar 2025 10:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3F0910E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:52:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF0C1153B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:52:53 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26F0A3F5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:52:42 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:52:34 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, chenlinxuan@uniontech.com
Subject: Re: [PATCH] drm/arm: Suppress "ARM devices" menu if not essential
Message-ID: <Z87EcmftDZ1QOLL0@e110455-lin.cambridge.arm.com>
References: <D20815A68EE4902F+20250310072357.52841-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D20815A68EE4902F+20250310072357.52841-1-wangyuli@uniontech.com>
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

On Mon, Mar 10, 2025 at 03:23:57PM +0800, WangYuli wrote:
> Manifestly, the "ARM devices" menu is appropriate only for the ARM
> architecture.
> 
> Inasmuch as every single item in this menu is predicated on
> (ARM || ARM64 || COMPILE_TEST), it is therefore illogical for the
> "ARM devices" menu itself not to be predicated upon
> (ARM || ARM64 || COMPILE_TEST), and displaying a blank menu in other
> architectures is unwarranted.

Arm's Display IP is not tied to the Arm architecture. Anyone can license
and use the IP with any CPU architecture. The fact that so far the IP has
only been present in a handful of devices doesn't mean we should restrict
the drivers.

What is the issue that you're trying to solve here?

Best regards,
Liviu

> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/gpu/drm/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index c901ac00c0c3..0aa6a54567b6 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menu "ARM devices"
> -	depends on DRM
> +	depends on DRM && (ARM || ARM64 || COMPILE_TEST)
>  
>  config DRM_HDLCD
>  	tristate "ARM HDLCD"
> -- 
> 2.47.2
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
