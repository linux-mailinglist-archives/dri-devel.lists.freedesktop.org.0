Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D898B6DB6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 11:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D0F10E7D3;
	Tue, 30 Apr 2024 09:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/lxu9fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7BA10E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714468120; x=1746004120;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o1HIXoCG6+dP9wwsNWFiBzq6Y22+5YvyYqfV7tqpPJ4=;
 b=K/lxu9fyods2Fa/HtgDaJbfe+k+hWQK5pPdgt6QL4QvOP8UQTS/yDGdF
 EbAtXXXgz5CWUB4raK3EJDrRwzoUSG8u4u3xNYKl8be6Pfxmmgj6rcd/w
 /IfYk0aMjjrGw0znZOuWu34Crn9jSDD5KYaAMMD7oJ58Sth1HjuE4TAl4
 rgV8aL/yK7dck8S8q739OXBvZy6qaPJIeC7JnmZ4XmPM+aOmH0Rqd0UzP
 7RV9SmuZANe9AgMmwAhsULHZbX9QXOsNlMVV/0pw5gUzuFNwcgiwus6iO
 geNN3zik7QQKX5uT8BonYPzfnp/NbD49arGQB8NaS+5ixszdjgBT6DcXP Q==;
X-CSE-ConnectionGUID: 3vRVf87+QAKF86jpwbf3Ag==
X-CSE-MsgGUID: URUYb707S8e6VgOo9IlW/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10701075"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10701075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 02:08:39 -0700
X-CSE-ConnectionGUID: CIuK3YJLR3Wg2AsQpuYjHA==
X-CSE-MsgGUID: pewBzL4FRS6hbL7Fr8M8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26499214"
Received: from vkats-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.167])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 02:08:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
In-Reply-To: <_D910BUYB2AisyF_XxxuoFt4VA001Sls_51rM1qF7q9EFsxTkEEMsqKc86OQ3p3xHu9wsHRws0JG_SkqFtqxu_9_tcp1uwaPjVUAntXoyqg=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240429164336.1406480-1-jani.nikula@intel.com>
 <_D910BUYB2AisyF_XxxuoFt4VA001Sls_51rM1qF7q9EFsxTkEEMsqKc86OQ3p3xHu9wsHRws0JG_SkqFtqxu_9_tcp1uwaPjVUAntXoyqg=@emersion.fr>
Date: Tue, 30 Apr 2024 12:08:35 +0300
Message-ID: <87jzkf2p64.fsf@intel.com>
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

On Tue, 30 Apr 2024, Simon Ser <contact@emersion.fr> wrote:
> On Monday, April 29th, 2024 at 18:43, Jani Nikula <jani.nikula@intel.com> wrote:
>
>> The driver date serves no useful purpose, because it's hardly ever
>> updated. The information is misleading at best.
>> 
>> As described in Documentation/gpu/drm-internals.rst:
>> 
>> The driver date, formatted as YYYYMMDD, is meant to identify the date
>> of the latest modification to the driver. However, as most drivers
>> fail to update it, its value is mostly useless. The DRM core prints it
>> to the kernel log at initialization time and passes it to userspace
>> through the DRM_IOCTL_VERSION ioctl.
>> 
>> Stop printing the driver date at init, and start returning the empty
>> string "" as driver date through the DRM_IOCTL_VERSION ioctl.
>
> Sounds good to me.
>
> Acked-by: Simon Ser <contact@emersion.fr>

Thanks!

> BTW, I wonder if the driver version number (major/minor/patch) is useful?
> Do drivers update it?

I think most things these days should depend on capabilities rather than
versions.

i915 is at 1.6.0 and the last change was commit 2228ed67223f ("drm: i915
updates"). 18 years ago. From that perspective, I'd be happy to drop
them too.

However, amdgpu is at 3.57.0, with an elaborate changelog in
amdgpu_drv.c, and the last change was commit 91963397c49a ("drm/amdgpu:
Enable tunneling on high-priority compute queues"). Less than six months
ago.

I wonder if we could stop initializing and printing the version for
drivers that don't care, and leave it for drivers that do? Obviously
feels more risky than the date.

BR,
Jani.


-- 
Jani Nikula, Intel
