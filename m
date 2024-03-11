Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983F87843A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AE110F8D1;
	Mon, 11 Mar 2024 15:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKFAHIQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3501410F8D1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710172385; x=1741708385;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v+wuBa/BgTlch3Hp7DQUmjmgTRfLhJHuA5orgNDkNvQ=;
 b=YKFAHIQKSM/Cz492xDWPZ5FLfVCYU1H7HAsFPzqiz/InX0r+zWajKnW4
 8b1nmave68SAdZh+H1+JnoOxRM4w/EXpXSPZvzhN42nMksIRCeu8gckFk
 hZQIUkrWjvLc6nY01HhE2dYxaIea1BsZ+owKKciyx9HE1HTjVLw7iKgkD
 vMc+ddb51zD9Hy1oOpXbg7zRW78lqRavYovpGB1qStPFy8Pf0AtSPovLx
 wCXe+guqsydqH1AnLqLOq49CBWVYqtVfmaNQ7h5jaMFwzcl8W/iUz37hn
 mhTYVNY+4TyYh6dzVzaFhqwecjHVUfjQR8S8WPkjuXbKoDEjUYUWrbG15 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16246823"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="16246823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11126760"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:53:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
In-Reply-To: <Ze8k2Mbmw4IaGgv8@e110455-lin.cambridge.arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240311111619.249776-1-jani.nikula@intel.com>
 <20240311124826.44cc69ba@collabora.com> <87cys1t299.fsf@intel.com>
 <20240311125445.4bab1712@collabora.com> <87a5n5t0mt.fsf@intel.com>
 <Ze8YJhmZgruRfNBo@e110455-lin.cambridge.arm.com>
 <871q8gu8lh.fsf@intel.com>
 <Ze8k2Mbmw4IaGgv8@e110455-lin.cambridge.arm.com>
Date: Mon, 11 Mar 2024 17:52:59 +0200
Message-ID: <87y1aosr38.fsf@intel.com>
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

On Mon, 11 Mar 2024, Liviu Dudau <liviu.dudau@arm.com> wrote:
> On Mon, Mar 11, 2024 at 04:49:30PM +0200, Jani Nikula wrote:
>> On Mon, 11 Mar 2024, Liviu Dudau <liviu.dudau@arm.com> wrote:
>> > So with this revert we're OK with an undefined symbol if !CONFIG_PM, but we're not happy
>> > with a recursive dependency that is only triggered for COMPILE_TEST? I would've thought
>> > IOMMU_SUPPORT options is a better one.
>> 
>> It's a real config.
>> 
>> # CONFIG_COMPILE_TEST is not set
>
> So I can select CONFIG_ARM64 and CONFIG_X86_LOCAL_APIC at the same time? DRM_PANTHOR depends on ARM || ARM64
> and X86_LOCAL_APIC depends on X86_64. At some moment the recursive dependency detector should've stopped as
> there are no common dependencies between DRM_PANTHOR and X86_LOCAL_APIC and going further just triggers false
> positives. I'm curious how you've created your config now.

The thing is, I don't have *any* of the dependencies ARM || ARM64 ||
COMPILE_TEST set in the config that triggered this. I don't have
DRM_PANTHOR set. But make olddefconfig detects a circular dependency
nonetheless.

It's possible the issue is in kconfig. I don't know. But not being able
to even dodge the warning makes it a show stopper. I wouldn't even know
what to change in the config.


BR,
Jani.


-- 
Jani Nikula, Intel
