Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9B89BBA5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01B211235B;
	Mon,  8 Apr 2024 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ig+Uas/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88562112356;
 Mon,  8 Apr 2024 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568373; x=1744104373;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DjmA4pwOW5nrvcnms0nJQ8CUScq1u0/xrtZ+kmbQe7U=;
 b=Ig+Uas/Ul6H/NB014jCThKwQ82+nsUEeRapp9TabHsFvhvkRd0gQduv6
 PMLor0Id1A2bayS4g+ipmqKCSBBDASB6YqV1cNExp69wH08rRD3uc163B
 2ELnne192GIwzo3FEaCtO0x810OeiQNni76Zb48dIee2uIjkvwjh4R+/w
 9O3K/UktRN+zLtrYEeC0q458L9E0OOt6gfxgvOy4FsEOiwWTTawYLhBT/
 Q3gylcFbbNvpS3uT9nYoNM0NVcOnsrJY+9s0plkZB/9IpaRZ2M/wkPDvL
 OCoiowQuJQDND4g6SmEcpRH+SViIPTMZIb2y+y+RLgE+SKDhHp3u955XG Q==;
X-CSE-ConnectionGUID: iQ//YW7YTVq/67N9BbQH5A==
X-CSE-MsgGUID: HINCG7z/RNqBUdjxJzSr0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18450603"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18450603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:26:12 -0700
X-CSE-ConnectionGUID: Oc2ykOJ8TE2EQMEwxCg1gw==
X-CSE-MsgGUID: mrEUrC8sT8yTxrdQsyifLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20260947"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:26:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: debug logging improvements
In-Reply-To: <62365cd0-fadf-47da-b8bf-d33e11f6dec7@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709843865.git.jani.nikula@intel.com>
 <62365cd0-fadf-47da-b8bf-d33e11f6dec7@suse.de>
Date: Mon, 08 Apr 2024 12:26:07 +0300
Message-ID: <874jccb3yo.fsf@intel.com>
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

On Fri, 05 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi,
>
> with your Oops on [5/6] fixed and my comment on [1/6] considered:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! I ended up dropping a couple of patches based on Ville's comment
about mode logging, and added a few more in v2. I tried to preserve your
R-b where I think I didn't change much or nothing at all.

BR,
Jani.

>
> Best regards
> Thomas
>
>
> Am 07.03.24 um 21:39 schrieb Jani Nikula:
>> Switch a handful of places over to drm device based logging and WARNs,
>> unify connector and crtc logging, etc.
>>
>> Jani Nikula (6):
>>    drm/modes: add drm_mode_print() to dump mode in drm_printer
>>    drm/probe-helper: switch to drm device based logging
>>    drm/modes: switch drm_mode_prune_invalid() to use struct drm_printer
>>    drm/modes: switch to drm device based error logging
>>    drm/sysfs: switch to drm device based logging
>>    drm/client: switch to drm device based logging, and more
>>
>>   drivers/gpu/drm/drm_client_modeset.c | 129 +++++++++++++++------------
>>   drivers/gpu/drm/drm_modes.c          |  51 +++++++----
>>   drivers/gpu/drm/drm_probe_helper.c   |  41 ++++-----
>>   drivers/gpu/drm/drm_sysfs.c          |  21 +++--
>>   include/drm/drm_modes.h              |   2 +
>>   5 files changed, 137 insertions(+), 107 deletions(-)
>>

-- 
Jani Nikula, Intel
