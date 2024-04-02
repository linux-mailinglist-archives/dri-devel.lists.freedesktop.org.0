Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327F2895A2F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 18:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A410FE9E;
	Tue,  2 Apr 2024 16:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikVnJcs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5550D10EA31;
 Tue,  2 Apr 2024 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712076790; x=1743612790;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+OIETa7FqtPMYZEyetZK7bSBPqtgACHlQcapBmBrB1s=;
 b=ikVnJcs1tBJ8SnyaglXPhvUo5AgyJftd5ri8/MnztMYAx31SxS0STVBQ
 0cu5l+Qi26fpOPAPoFfrKZjHELnkM/PgXuXUkuGgx1eOlcXDE0w5vnrAG
 2nZo31yC2/SoJ5VX+cY9ufoIhvmc7W6hIzw7PHsQlgO20iVT0P5H843bo
 RxtLzXwoyIZ/TYiFUbTktKC7LbpTPwPkNiZKQvB/iXb2UbisnZjQR41W7
 lckCSiEVZR0JIefE/idwClETC6ULLzIRH4TRiTMoPYVRBhdSp+k+oDvTr
 NkbRZtUrA/mSVimMTwvc5rXkvjZhxKCPqxFiFlnyFVYrQLshZgoPsm8hh g==;
X-CSE-ConnectionGUID: cDsqCvVMQw6aCcavFp65gw==
X-CSE-MsgGUID: uNt6LdDwSQuHifHcQaiE1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7107284"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7107284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 09:53:08 -0700
X-CSE-ConnectionGUID: ffg8/aPXSdikW95Gpql1bg==
X-CSE-MsgGUID: UqZyC5N1Sx2Vz2k/GRMH4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18552508"
Received: from pramona-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.179])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 09:53:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org, open list
 <linux-kernel@vger.kernel.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>, "open
 list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, "open list:RADEON and
 AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVER
 FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open
 list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open
 list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, "open
 list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 03/14] drm/gma500,drm/i915: Make I2C terminology more
 inclusive
In-Reply-To: <fde7a0da-1981-48db-95e2-96d45655c11c@linux.microsoft.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-4-eahariha@linux.microsoft.com>
 <87a5mcfbms.fsf@intel.com>
 <7d5e6ed0-ffe9-46c2-b3b4-a4a47c09532e@linux.microsoft.com>
 <87ttkjesx8.fsf@intel.com>
 <fde7a0da-1981-48db-95e2-96d45655c11c@linux.microsoft.com>
Date: Tue, 02 Apr 2024 19:52:48 +0300
Message-ID: <87o7aremfz.fsf@intel.com>
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

On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
> On 4/2/2024 7:32 AM, Jani Nikula wrote:
>> On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>> On 4/2/2024 12:48 AM, Jani Nikula wrote:
>>>> On Fri, 29 Mar 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>>> in the specification.
>>>>
>>>> gma500 and i915 changes should be split. See MAINTAINERS.
>>>>
>>>> Might also split the i915 changes to smaller pieces, it's kind of
>>>> random. And the changes here are not strictly related to I2C AFAICT, so
>>>> the commit message should be updated.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>
>>> <snip>
>>>
>>> I will split gma500 and i915 into their respective patches if possible in v2.
>>>
>>> Can you say more about the changes being "not strictly related to I2C"? My
>>> heuristic was to grep for master/slave, and look in the surrounding context for
>>> i2c-related terminology (i2c_pin, 7-bit address, struct i2c_adapter, i2c_bus, etc)
>>> to confirm that they are i2c-related, then following the references around to
>>> make the compiler happy. For e.g., I did not change the many references to bigjoiner
>>> master and slave because I understood from context they were not i2c references.
>>>
>>> A couple examples would help me restrict the changes to I2C, since as mentioned in the
>>> discussion on Wolfram's thread, there are places where migrating away from master/slave
>>> terms in the code would conflict with the original technical manuals and reduce correlation
>>> and understanding of the code.
>> 
>> I guess I was looking at the VBT changes in intel_bios.c. Granted, they
>> do end up being used as i2c addresses. No big deal.
>> 
>> I think I'd expect the treewide i2c adapter changes to land first, via
>> i2c, and subsequent cleanups to happen next, via individual driver
>> trees. There's quite a bit of conflict potential merging this outside of
>> drm-intel-next, and there's really no need for that.
>> 
>> BR,
>> Jani.
>> 
>
> Great! Just so I'm clear, do you still want the i915 changes split up more, along with them being
> split off from gma500?

If we can merge the i915 changes via drm-intel-next, it's probably fine
as a big i915 patch. Just the gma500 separated. (The struct
i2c_algorithm change etc. necessarily has to go via I2C tree of course.)

BR,
Jani.



>
> Thanks,
> Easwar

-- 
Jani Nikula, Intel
