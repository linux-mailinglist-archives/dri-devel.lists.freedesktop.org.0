Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8319D39E7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3C510E720;
	Wed, 20 Nov 2024 11:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69A9110E720
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:50:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D541480
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:51:19 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E203D3F66E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:50:48 -0800 (PST)
Date: Wed, 20 Nov 2024 11:50:45 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 florent.tomasin@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2 0/3] drm/panthor: Coherency related fixes
Message-ID: <Zz3NFRSF1GEbtbEN@e110455-lin.cambridge.arm.com>
References: <20241030225407.4077513-1-akash.goel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030225407.4077513-1-akash.goel@arm.com>
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

On Wed, Oct 30, 2024 at 10:54:04PM +0000, Akash Goel wrote:
> This patch series contains 3 cache coherency related fixes for the
> Panthor driver.
> - The first fix, regarding the Inner-shareability, is mandatory to
>   ensure things work on all platforms (including Juno FPGA) when
>   no_coherency protocol is selected.
> - The second fix regarding the coherency feature/enable register is
>   required to avoid potential misalignment on certain platforms.
> - The third fix, regarding the potential overwrite of buffer objects,
>   has been prepared speculatively & it may not be required in practice.
> 
> v2:
> - Added r-b tags for the first 2 patches
> 
> Akash Goel (3):
>   drm/panthor: Update memattr programing to align with GPU spec
>   drm/panthor: Explicitly set the coherency mode

Pushed the first two patches to drm-misc-next.

Best regards,
Liviu

>   drm/panthor: Prevent potential overwrite of buffer objects
> 
>  drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h    | 10 +++++++++
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 28 +++++++++++++++++-------
>  4 files changed, 60 insertions(+), 9 deletions(-)
> 
> -- 
> 2.25.1
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
