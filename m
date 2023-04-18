Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BA6E5F1F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 12:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C1610E74C;
	Tue, 18 Apr 2023 10:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F6F10E749;
 Tue, 18 Apr 2023 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681814840; x=1713350840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XrIVnSqbjfBT695aw5q9yftkIGRf5BwQKpP5FJnzK7s=;
 b=BLZ/vFQ0EemaslZHbFtZnIw6dbiDgNzgy6/KAYyr+Bn9hjupq6evUgye
 kOSbPhLbIuECO/zK5liE/VLmOslNt78N4PbR7EHezCU6BoDZ1MX8euo4N
 2gm5if08WE8fvpeoxfXBUHnF0XAyZTLZV9FIXrq4DD1Oxb+Yg/7msunDX
 mC/bui+1Kq6BKRNuVH8fi+wFxCWRdWeuXvDbBmlHo6UYDjGVz3lKgyw0l
 8wazfQ/dfsv0rFHxbYlxb5k9yILYnzhsZsmBqhli2nEm3CtdmVx1jcQ5r
 Yjbelx5Y7KweWo0bjGFf2jcQYdynP7p8bK7jSuIFr2LuGWoOTuMuuIbT+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410355522"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="410355522"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 03:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="802499730"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="802499730"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.234.43])
 ([10.213.234.43])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 03:47:16 -0700
Message-ID: <54b21ae8-33ce-0f5c-4e0b-1118d25b12bf@linux.intel.com>
Date: Tue, 18 Apr 2023 11:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <f708dbc2-cf55-6cf6-eef0-b69d00c3eee9@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f708dbc2-cf55-6cf6-eef0-b69d00c3eee9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/04/2023 17:20, Christian König wrote:
> Am 17.04.23 um 17:56 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Add support to dump GEM stats to fdinfo.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   Documentation/gpu/drm-usage-stats.rst | 12 +++++++
>>   drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++++
>>   include/drm/drm_drv.h                 |  7 ++++
>>   include/drm/drm_file.h                |  8 +++++
>>   4 files changed, 79 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>> b/Documentation/gpu/drm-usage-stats.rst
>> index 2ab32c40e93c..8273a41b2fb0 100644
>> --- a/Documentation/gpu/drm-usage-stats.rst
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -21,6 +21,7 @@ File format specification
>>   - File shall contain one key value pair per one line of text.
>>   - Colon character (`:`) must be used to delimit keys and values.
>> +- Caret (`^`) is also a reserved character.
>>   - All keys shall be prefixed with `drm-`.
>>   - Whitespace between the delimiter and first non-whitespace 
>> character shall be
>>     ignored when parsing.
>> @@ -105,6 +106,17 @@ object belong to this client, in the respective 
>> memory region.
>>   Default unit shall be bytes with optional unit specifiers of 'KiB' 
>> or 'MiB'
>>   indicating kibi- or mebi-bytes.
>> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
>> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
>> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
>> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
>> +- drm-memory-<str>^active:    <uint> [KiB|MiB]
> 
> What exactly does size/shared/active mean here?
> 
> If it means what I think it does I don't see how TTM based drivers 
> should track that in the first place.

Size is an analogue to process VM size - maximum reachable/allocated 
memory belonging to a client.

Shared could be IMO viewed as a bit dodgy and either could be dropped or 
needs to be better defined. For now I simply followed the implementation 
from Rob's RFC which is:

	if (obj->handle_count > 1)
		stats[0].shared += sz;

I can see some usefulness to it but haven't thought much about semantics 
yet.

Similar story with active which I think is not very useful. 
Implementation is like this:

	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
		stats[0].active += sz;

For me it is too transient to bring much value over the resident 
category. I supposed only advantage is that resident (as does purgeable) 
needs driver cooperation while active can be done like about from DRM 
core. Although I am not a big fan of counting these stats from the core 
to begin with..

Regards,

Tvrtko

>> +Resident category is identical to the drm-memory-<str> key and two 
>> should be
>> +mutually exclusive.
>> +
>> +TODO more description text...
>> +
>>   - drm-cycles-<str> <uint>
>>   Engine identifier string must be the same as the one specified in the
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 37b4f76a5191..e202f79e816d 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -42,6 +42,7 @@
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>   #include <drm/drm_print.h>
>>   #include "drm_crtc_internal.h"
>> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev, 
>> struct drm_pending_event *e)
>>   }
>>   EXPORT_SYMBOL(drm_send_event);
>> +static void
>> +print_stat(struct drm_printer *p, const char *stat, const char 
>> *region, u64 sz)
>> +{
>> +    const char *units[] = {"", " KiB", " MiB"};
>> +    unsigned int u;
>> +
>> +    if (sz == ~0ull) /* Not supported by the driver. */
>> +        return;
>> +
>> +    for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>> +        if (sz < SZ_1K)
>> +            break;
>> +        sz = div_u64(sz, SZ_1K);
>> +    }
>> +
>> +    drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
>> +           region, stat, sz, units[u]);
>> +}
>> +
>> +static void print_memory_stats(struct drm_printer *p, struct drm_file 
>> *file)
>> +{
>> +    struct drm_device *dev = file->minor->dev;
>> +    struct drm_fdinfo_memory_stat *stats;
>> +    unsigned int num, i;
>> +    char **regions;
>> +
>> +    regions = dev->driver->query_fdinfo_memory_regions(dev, &num);
>> +
>> +    stats = kcalloc(num, sizeof(*stats), GFP_KERNEL);
>> +    if (!stats)
>> +        return;
>> +
>> +    dev->driver->query_fdinfo_memory_stats(file, stats);
>> +
>> +    for (i = 0; i < num; i++) {
>> +        if (!regions[i]) /* Allow sparse name arrays. */
>> +            continue;
>> +
>> +        print_stat(p, "size", regions[i], stats[i].size);
>> +        print_stat(p, "shared", regions[i], stats[i].shared);
>> +        print_stat(p, "resident", regions[i], stats[i].resident);
>> +        print_stat(p, "purgeable", regions[i], stats[i].purgeable);
>> +        print_stat(p, "active", regions[i], stats[i].active);
>> +    }
>> +
>> +    kfree(stats);
>> +}
>> +
>>   /**
>>    * drm_show_fdinfo - helper for drm file fops
>>    * @seq_file: output stream
>> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct 
>> file *f)
>>       if (dev->driver->show_fdinfo)
>>           dev->driver->show_fdinfo(&p, file);
>> +
>> +    if (dev->driver->query_fdinfo_memory_regions)
>> +        print_memory_stats(&p, file);
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 89e2706cac56..ccc1cd98d2aa 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -35,6 +35,7 @@
>>   #include <drm/drm_device.h>
>>   struct drm_file;
>> +struct drm_fdinfo_memory_stat;
>>   struct drm_gem_object;
>>   struct drm_master;
>>   struct drm_minor;
>> @@ -408,6 +409,12 @@ struct drm_driver {
>>        */
>>       void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>> +    char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
>> +                           unsigned int *num);
>> +
>> +    void (*query_fdinfo_memory_stats)(struct drm_file *f,
>> +                      struct drm_fdinfo_memory_stat *stat);
>> +
>>       /** @major: driver major number */
>>       int major;
>>       /** @minor: driver minor number */
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 7d9b3c65cbc1..00d48beeac5c 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -375,6 +375,14 @@ struct drm_file {
>>   #endif
>>   };
>> +struct drm_fdinfo_memory_stat {
>> +    u64 size;
>> +    u64 shared;
>> +    u64 resident;
>> +    u64 purgeable;
>> +    u64 active;
>> +};
>> +
>>   /**
>>    * drm_is_primary_client - is this an open file of the primary node
>>    * @file_priv: DRM file
> 
