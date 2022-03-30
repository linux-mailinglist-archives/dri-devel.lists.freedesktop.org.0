Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6DB4EBB82
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC7410F2FC;
	Wed, 30 Mar 2022 07:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3110F2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648624381; x=1680160381;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=S3KxlqpAiRQvo7CwvnwKhJatyrTMRuWoZ27++SG90YM=;
 b=JhL4u0tbfOeltywBvV1dQAlrNSaB2wYZF5lilWQ0ntJPuqzuyH37sWuu
 844O0Yam2aOPpZO4EsaZCwFByXs4KvLCwvgivOFamNZecNfbJeGd6lqmH
 wCOGSH5kaPubGwI6p03Boaz7aDRpFcClRM3LiJembNUPjDxXFfWEromzl
 q7Pb1A64bs6H1dMQXe2g7kgKddgSPg5VtukV7bFwCjWfIyheSo2M2XG7/
 r6zZwI50m5tcgiWRnoNNsh4TtPY7Dl7IRJ9DCq2PY9j5IQlR7d6D9a1Zi
 ZM//8GN6U7F6yOJmLTqHI+F95yIbr16DWWIO79u+OZyrlGzVzoi+1XVit g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="257048516"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="257048516"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 00:12:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565358299"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 00:12:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Subject: Re: [PATCH 6/8] drm/display: Move HDCP helpers into display-helper
 module
In-Reply-To: <20220322192743.14414-7-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-7-tzimmermann@suse.de>
Date: Wed, 30 Mar 2022 10:12:12 +0300
Message-ID: <87lewrdicz.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Mar 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 21f16394012f..0ad78c73af7c 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -23,11 +23,11 @@
>  
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_hdcp_helper_helper.h>

This helper helper crept in a few places.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
