Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E076E539
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 12:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF3E10E5E6;
	Thu,  3 Aug 2023 10:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F202A10E5E2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 10:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691057231; x=1722593231;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=z6A0YbDv/5oLwtXekns+uqqOSresOOHsM1dXNSB2vNs=;
 b=Yhb5jDrcnm9dcAGlkMo9JJLb2rPAU268rYAFwYasHym/0yNqELjUua/9
 1f/IEJVDhGy1AovwJyJjSCmi3lTAseGOJ42VGpkyI08j6YXnnvdsEzhYT
 op4wbJB+IxP3p7/iMKwTefV2fI3n7QFDIXSXy7Sbv4iVD0XXh0x3jtTod
 MnYQ6RsW4ZdWQ0NDGEtOOCCJ05rWbva7XRU5MbDr8DnVVnXUsXSzrF0Nd
 UXVSniq5DeOsw11AmRsXjQ3gRcQIsyKJs0lTSPbf/QBEPBydCFg5tggWp
 gbKP0bafcUusC8J4n6z215FUY2RYdS/w+WZ9IktouMeMSm5TwqxL+RAtB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368731700"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="368731700"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 03:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872873727"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 03:07:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/doc: use proper cross-references for sections
In-Reply-To: <20230803095734.386761-1-contact@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230803095734.386761-1-contact@emersion.fr>
Date: Thu, 03 Aug 2023 13:07:07 +0300
Message-ID: <878rasv3qs.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Aug 2023, Simon Ser <contact@emersion.fr> wrote:
> When I originally wrote these docs, I couldn't manage to insert a
> cross-reference to a section. Here's how it can be done.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  Documentation/gpu/drm-kms.rst | 2 ++
>  Documentation/gpu/drm-mm.rst  | 2 ++
>  include/uapi/drm/drm.h        | 9 ++++-----
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index c92d425cb2dd..ca9210e47266 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -360,6 +360,8 @@ Format Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
>     :export:
>  
> +.. _kms_dumb_buffer_objects:
> +
>  Dumb Buffer Objects
>  ===================
>  
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 3d5dc9dc1bfe..513197359aba 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -517,6 +517,8 @@ DRM Cache Handling and Fast WC memcpy()
>  .. kernel-doc:: drivers/gpu/drm/drm_cache.c
>     :export:
>  
> +.. _drm_sync_objects:
> +
>  DRM Sync Objects
>  ===========================

Care to fix that title underline too, in a separate patch, please?

This one's

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 863e47200911..75ec985d95e5 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -673,8 +673,8 @@ struct drm_gem_open {
>   * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IMPORT
>   * and &DRM_PRIME_CAP_EXPORT.
>   *
> - * PRIME buffers are exposed as dma-buf file descriptors. See
> - * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
> + * PRIME buffers are exposed as dma-buf file descriptors.
> + * See :ref:`prime_buffer_sharing`.
>   */
>  #define DRM_CAP_PRIME			0x5
>  /**
> @@ -756,15 +756,14 @@ struct drm_gem_open {
>  /**
>   * DRM_CAP_SYNCOBJ
>   *
> - * If set to 1, the driver supports sync objects. See
> - * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + * If set to 1, the driver supports sync objects. See :ref:`drm_sync_objects`.
>   */
>  #define DRM_CAP_SYNCOBJ		0x13
>  /**
>   * DRM_CAP_SYNCOBJ_TIMELINE
>   *
>   * If set to 1, the driver supports timeline operations on sync objects. See
> - * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + * :ref:`drm_sync_objects`.
>   */
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14

-- 
Jani Nikula, Intel Open Source Graphics Center
