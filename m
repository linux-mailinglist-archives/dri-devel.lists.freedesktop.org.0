Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2460D76E6BF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 13:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B511D10E136;
	Thu,  3 Aug 2023 11:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2F610E136
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691061866; x=1722597866;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=h/u7Qoujnwhpr4R7reFZ9/KV4Cq4XvzQ1UQXPJ4rxLY=;
 b=hgDx1YD37u4P0IKexJYVf6N6oqZTyuDyv3yk459a2zfUZHlNSlJtFCzS
 MGtSG3eWhNNu6r4V7CfGMHnflccgf0eBUEV1TFs6JI9biDxLSUl/f789i
 FvpAfEFSfnTuYUHqA3LCYov7Xq6IT3Imhpw5GgYme0ABp/5sAirXuybVz
 UuDQGc7CtIw+bRAcQNFWGqPS4rDRoHtnPDgoxoUIpk8UInxJPS2g7x5cX
 NM1c26HYwxL9HdQl5Av8TBnQcyW7WaNkDpEW9srS15T4msgbikoc8WbJP
 LyzFS9tde0+s0/R5+bjfdaeoqnaZ4lWYDTI8D2l1Fgn32o6nnWZzDNyQh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367300198"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="367300198"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 04:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="706503885"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="706503885"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 04:24:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/doc: fix underline for section "DRM Sync Objects"
In-Reply-To: <20230803102505.392577-1-contact@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230803102505.392577-1-contact@emersion.fr>
Date: Thu, 03 Aug 2023 14:24:22 +0300
Message-ID: <875y5wv061.fsf@intel.com>
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

On Thu, 03 Aug 2023, Simon Ser <contact@emersion.fr> wrote:
> It doesn't line up.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  Documentation/gpu/drm-mm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 513197359aba..c19b34b1c0ed 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -520,7 +520,7 @@ DRM Cache Handling and Fast WC memcpy()
>  .. _drm_sync_objects:
>  
>  DRM Sync Objects
> -===========================
> +================
>  
>  .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>     :doc: Overview

-- 
Jani Nikula, Intel Open Source Graphics Center
