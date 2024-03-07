Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EA8758BC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A0310E03C;
	Thu,  7 Mar 2024 20:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZYjwvrl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1291410E06E;
 Thu,  7 Mar 2024 20:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844269; x=1741380269;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MNbYvgSgQRsIFiIWAwaiyLeIg1+2Ny3pF5pXhtREL6Q=;
 b=aZYjwvrlHvdFTL1rGbos670/MbHNu22WmVA1rNYrAov4caNqNRaU/gZo
 bg9xJX78aZxsJ/4OIN5LyGllb9M3/hC1RMkdEh3rbm3keAdYee5ald8SQ
 noUbxGkCnTLNYXaXbXiYjDhmrvtoMIZg+xsTPSfavJM3pPnhnkR20qbzS
 ZFYtdf29KUoEfTvdORPSLQjzxVQtGb9vxZ6uTo1EM4FJtS6hWLjqR09vT
 C09gTtvjjqAySz1XI8LHW9TUd8+IJftJlMSrCFOnZCMd68++tpghV/syI
 /yXh3aBkoXGwdJ3X9HbxQd5d6EOdaHr/JMggbwL8iyr3wAzgOjYh178+4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4387435"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4387435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10124489"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:44:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/sysfs: switch to drm device based logging
In-Reply-To: <baae2d1e432ed9657857d3681c773e0373ddd9ad.1709843865.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709843865.git.jani.nikula@intel.com>
 <baae2d1e432ed9657857d3681c773e0373ddd9ad.1709843865.git.jani.nikula@intel.com>
Date: Thu, 07 Mar 2024 22:44:23 +0200
Message-ID: <871q8lwz4o.fsf@intel.com>
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

On Thu, 07 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> @@ -489,7 +489,6 @@ void drm_sysfs_connector_hotplug_event(struct drm_connector *connector)
>  	drm_dbg_kms(connector->dev,
>  		    "[CONNECTOR:%d:%s] generating connector hotplug event\n",
>  		    connector->base.id, connector->name);
> -

Oops.

>  	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
>  EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);

-- 
Jani Nikula, Intel
