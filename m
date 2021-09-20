Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CD411344
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 13:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CA96E47E;
	Mon, 20 Sep 2021 11:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412306E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:02:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="202605552"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="202605552"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 04:02:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="556181119"
Received: from svandens-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.216.120])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 04:02:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
In-Reply-To: <20210920101334.249832-1-msp@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920101334.249832-1-msp@baylibre.com>
Date: Mon, 20 Sep 2021 14:01:57 +0300
Message-ID: <874kafv7bu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> This short sentence references nothing for details about memory manager.
> Replace it with the documentation file for DRM memory management.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  Documentation/gpu/drm-internals.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 06af044c882f..bdcdfc4ede04 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -126,8 +126,8 @@ Memory Manager Initialization
>  Every DRM driver requires a memory manager which must be initialized at
>  load time. DRM currently contains two memory managers, the Translation
>  Table Manager (TTM) and the Graphics Execution Manager (GEM). This
> -document describes the use of the GEM memory manager only. See ? for
> -details.
> +document describes the use of the GEM memory manager only. See
> +Documentation/gpu/drm-mm.rst for details.

Please use rst references instead of a file reference.

BR,
Jani.

>  
>  Miscellaneous Device Configuration
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Jani Nikula, Intel Open Source Graphics Center
