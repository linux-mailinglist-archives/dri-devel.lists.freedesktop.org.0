Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E46808524
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A212610E7ED;
	Thu,  7 Dec 2023 10:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F54210E852
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701943667; x=1733479667;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uk15A8QKQ8ycJNU0cX26IuAICSD58obvOMcwCOOR8g0=;
 b=mWpaxI+1JPS2z42eWE0ZuLRawt2Jc6849LMjCMmF42YUMHU1ERa6b0bG
 qYkSpxszLsbzfvReCZp+j85Lu/i6FVmWUmwnZhnqBzALiD0FEG3tr9hqO
 ANlobPzDhXZu1g/3RJZ1wY5jOAvhn06OrHdFL2vAjG/RvPOnASNdb2ajN
 fJsqrUT8DmxZslme+0ULrbS+fyO0GDIAzNChgt/XkId/eA5FuKVZdzHoG
 1ZZdDeddoU0nRu7Um8mk+ZVw6TPh4/XsMDrx0U39TjwF0y6SbITbxhnQ+
 jlVvp1u5D2W3pSnGwZErX4QCiLx058q9PgbM9HGaWqkRsbPeDA1GqX5// w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12922232"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12922232"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862430968"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="862430968"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:07:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: bbaa <bbaa@bbaa.fun>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [Bug Report] drm/edid: drm_edid_override_connector_update
 returns a incorrect value
In-Reply-To: <57BBFAAD83255278+587e2f64-3507-4af9-bca4-43194400c68c@bbaa.fun>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <57BBFAAD83255278+587e2f64-3507-4af9-bca4-43194400c68c@bbaa.fun>
Date: Thu, 07 Dec 2023 12:07:40 +0200
Message-ID: <87fs0e1g2b.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Dec 2023, bbaa <bbaa@bbaa.fun> wrote:
> Hello everyone,
>
> drm_edid_override_connector_update seem return a incorrect value.

You seem to have posted this twice; already replied at
https://lore.kernel.org/r/87jzpq1go5.fsf@intel.com

-- 
Jani Nikula, Intel
