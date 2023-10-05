Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC47BA1D7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 17:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B87910E41C;
	Thu,  5 Oct 2023 15:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0303410E41C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 15:01:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4887C15;
 Thu,  5 Oct 2023 08:01:42 -0700 (PDT)
Received: from [10.57.2.146] (unknown [10.57.2.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 761603F5A1;
 Thu,  5 Oct 2023 08:01:01 -0700 (PDT)
Message-ID: <17bbd391-e6df-4a01-9bbb-d0583d7621c4@arm.com>
Date: Thu, 5 Oct 2023 16:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/gpu: fix Panfrost documentation build
 warnings
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231005141239.132783-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231005141239.132783-1-adrian.larumbe@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2023 15:12, Adrián Larumbe wrote:
> Fix issues revealed by `make htmldocs` after adding Panfrost DRM
> documentation file.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: d124dac2089c ("drm/panfrost: Add fdinfo support GPU load metrics")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310030917.Txzlpoeq-lkp@intel.com
> ---
>  Documentation/gpu/drivers.rst  | 1 +
>  Documentation/gpu/panfrost.rst | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index 3a52f48215a3..45a12e552091 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -18,6 +18,7 @@ GPU Driver Documentation
>     xen-front
>     afbc
>     komeda-kms
> +   panfrost
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
> index ecc48ba5ac11..a07f6821e994 100644
> --- a/Documentation/gpu/panfrost.rst
> +++ b/Documentation/gpu/panfrost.rst
> @@ -5,7 +5,7 @@
>  .. _panfrost-usage-stats:
>  
>  Panfrost DRM client usage stats implementation
> -==========================================
> +==============================================

This fix is already present in drm-misc-next - I think Boris must have
fixed it when applying.

With that dropped:

Reviewed-by: Steven Price <steven.price@arm.com>

>  
>  The drm/Panfrost driver implements the DRM client usage stats specification as
>  documented in :ref:`drm-client-usage-stats`.

