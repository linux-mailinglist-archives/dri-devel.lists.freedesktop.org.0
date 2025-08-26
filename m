Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB5B357D5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EC010E61A;
	Tue, 26 Aug 2025 09:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln9gGsBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A110E61B;
 Tue, 26 Aug 2025 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756198870; x=1787734870;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wNi8U4BKi46wRXn85gVAMyHoI8/9fYMifteo41G9sQM=;
 b=Ln9gGsBQOg4UplJaO+Vq2zuVEYnd0pwE7Cj10dZEvRLJ0phHh81qfR2a
 CmiVOQeNLD7zK4pHbTBDiMmQkWImLU8JExZy8cTzfeCMLzj84VZqg30Db
 zfTh7as9IXVvExHFlo/e+jCPMHWKctZwPc6ZuKdFM03CHsq8SBXOQBhVH
 AakTdXO/FcYIGdIcfRtUsbDDlrTue6sV/bQV2Dq54GUrYL7AFnJHNEtNp
 r5tfDJRH1/x5tt1SFIwR2SpodRLQ6PwGQHuJ/RIkffMzpvjetwBnxTQOI
 qE0U+tGKN5HJ4MbFLxUaXUc6iMP0D1GDZM+TZRc1XJen0r4btf1JI/5EO w==;
X-CSE-ConnectionGUID: 3t9ca/ipTxixSExK5Dqbkw==
X-CSE-MsgGUID: x6uWWQzER4WORkxBbzjfpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58284578"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58284578"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:01:09 -0700
X-CSE-ConnectionGUID: +FgLqVGAQZqkyNyEXrf/PA==
X-CSE-MsgGUID: FMsI8F8zTr+oW60Dn4BNyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169906177"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.150.174])
 ([10.247.150.174])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:01:06 -0700
Message-ID: <e5dd9dfa-5888-4d27-bee5-f6550fab01de@linux.intel.com>
Date: Tue, 26 Aug 2025 14:31:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 2/5] drm/xe/RAS: Register netlink capability
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ruhl@freedesktop.org, Michael J <michael.j.ruhl@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-3-aravind.iddamsetty@linux.intel.com>
 <aJ-sC4CNk2Ztnyw7@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aJ-sC4CNk2Ztnyw7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 16-08-2025 03:22, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 12:19:53PM +0530, Aravind Iddamsetty wrote:
>> Register netlink capability with the DRM and register the driver
>> callbacks to DRM RAS netlink commands.
>>
>> v2:
>> Move the netlink registration parts to DRM susbsytem (Tomer Tayar)
>>
>> v3: compile only if CONFIG_NET is enabled
>>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v2
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |  2 ++
>>  drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
>>  drivers/gpu/drm/xe/xe_device_types.h |  1 +
>>  drivers/gpu/drm/xe/xe_netlink.c      | 26 ++++++++++++++++++++++++++
>>  4 files changed, 35 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 80eecd35e807..e960c2dbe658 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -304,6 +304,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>  	i915-display/skl_universal_plane.o \
>>  	i915-display/skl_watermark.o
>>  
>> +xe-$(CONFIG_NET) += xe_netlink.o
>> +
>>  ifeq ($(CONFIG_ACPI),y)
>>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>  		i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 806dbdf8118c..ca7a17c16aa5 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -363,6 +363,8 @@ static const struct file_operations xe_driver_fops = {
>>  	.fop_flags = FOP_UNSIGNED_OFFSET,
>>  };
>>  
>> +extern const struct driver_genl_ops xe_genl_ops[];
>> +
>>  static struct drm_driver driver = {
>>  	/* Don't use MTRRs here; the Xserver or userspace app should
>>  	 * deal with them for Intel hardware.
>> @@ -381,6 +383,10 @@ static struct drm_driver driver = {
>>  #ifdef CONFIG_PROC_FS
>>  	.show_fdinfo = xe_drm_client_fdinfo,
>>  #endif
>> +#ifdef CONFIG_NET
>> +	.genl_ops = xe_genl_ops,
>> +#endif
>> +
> we should definitely have a drm function to register it instead of hard-coding
> it here, regardless if we go with the group split or not.
> It is not okay forcing this to every platform, even the ones without any RAS
> available for instance.
ok.
>>  	.ioctls = xe_ioctls,
>>  	.num_ioctls = ARRAY_SIZE(xe_ioctls),
>>  	.fops = &xe_driver_fops,
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 3a851c7a55dd..08d3e53e4b37 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>  
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_netlink.h>
>>  #include <drm/ttm/ttm_device.h>
>>  
>>  #include "xe_devcoredump_types.h"
>> diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
>> new file mode 100644
>> index 000000000000..9e588fb19631
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_netlink.c
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <net/genetlink.h>
>> +#include <uapi/drm/drm_netlink.h>
>> +
>> +#include "xe_device.h"
>> +
>> +static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	return 0;
>> +}
>> +
>> +/* driver callbacks to DRM netlink commands*/
>> +const struct driver_genl_ops xe_genl_ops[] = {
>> +	[DRM_RAS_CMD_QUERY] =		{ .doit = xe_genl_list_errors },
>> +	[DRM_RAS_CMD_READ_ONE] =	{ .doit = xe_genl_read_error },
>> +	[DRM_RAS_CMD_READ_ALL] =	{ .doit = xe_genl_list_errors, },
>> +};
> this is another space that is strange. you declare it here and drm
> magically uses it. Another reason for more explicity registration.
> and with the struct drm_ras where these commands are part of that.
> as well as the group name, etc.

agree, this shall be part of explicit registration.

Thanks,
Aravind.
>
>> -- 
>> 2.25.1
>>
