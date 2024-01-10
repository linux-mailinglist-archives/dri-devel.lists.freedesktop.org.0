Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA88296A8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B8E10E581;
	Wed, 10 Jan 2024 09:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E02610E581
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704880487; x=1736416487;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fz3HHcnEpzJqKX2cqYtopb/n3sCDXgjZL125ZAV+az8=;
 b=Mhh8u8N9aIMAsgtkiezlfuWIUDoHQUFYAQ9dhYea8l386uGFGyQEbe77
 bboB1Bhl0j1pBtsbHGyGqbx4pYNUxdjRPYrSg04ygdaoJ9rMOU9SHEE4q
 jVMyDAwqz3KcqU/YMWb3/GNcxpg7Q6XI9uwVqONc5XeAhp13ykJGIWIHK
 Y728fiE6scWNfC24lwfInIOfGtdQbHhS5e9Fl+4cK+RpuokGysRjCXitw
 z/jTsfJ+H1r/VbPI8v8zVP8SjgdRKDF2j5yU6g4j35VSaO5JeM/7dezLX
 rhnQupjXJJjYIzWykigq3+jMV5ukp2FGrvSpiAxqI2ws5cd4iy5083kfG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395621581"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395621581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 01:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="23891522"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 01:54:44 -0800
Message-ID: <547ccabe-f88d-4246-a6e1-cce327a2f058@linux.intel.com>
Date: Wed, 10 Jan 2024 10:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/shmem-helper: Fix comment describing dma-buf mappings
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240109104305.604549-1-jacek.lawrynowicz@linux.intel.com>
 <ZZ1Gnvitssne-e5r@phenom.ffwll.local>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZZ1Gnvitssne-e5r@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.01.2024 14:14, Daniel Vetter wrote:
> On Tue, Jan 09, 2024 at 11:43:05AM +0100, Jacek Lawrynowicz wrote:
>> `shmem->map_wc was` set to `false` but the comment suggested WC was
>> enabled for imported buffers.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index e435f986cd13..1532f1766170 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -75,7 +75,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>>  
>>  	if (private) {
>>  		drm_gem_private_object_init(dev, obj, size);
>> -		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
>> +		shmem->map_wc = false; /* dma-buf mappings are never write-combined */
> 
> I think neither is correct, because for a dma_buf import it is up to the
> importer to set up everything, including whether mappings should be
> write-combined or not. And setting this to false ensures that helpers
> don't muck around with the caching setting.
> 
> Also there's private buffer objects for other reasons, but the overlap
> between drivers that have those and which use shmem helpers is zero.
> 
> So I think overall a better comment would be:
> 
> 		/* This disables all shmem helper caching code and leaves
> 		 * all decision entirely to the buffer provider */
> 
> Maybe in a very old version where shmem helpers didn't correctly use the
> dma_buf functions there was some justification for the original comment,
> but that's been long ago fixed in a series of patches to make sure
> dma_buf_vmap/mmap are used consistently and directly.
> 
> Care to respin with a wording of your choice for the comment? If you're
> bored you could also try to dig through history a bit and collect some of
> the commits that made this comment largely obsolete, since I don't think
> any of the map_wc == true paths are even reachable anymore for private
> objects ...

I think that it would be better to add drm_WARN() here - similar to WARNs for import_attach.
Only v3d sets map_wc in gem_create_object() and it is easy to fix.
Would these warnings make sense?

__drm_gem_shmem_create():
drm_WARN(dev, shmem->map_wc, "Object caching is controlled by the underlying dma-buf\n");

__drm_gem_dma_create():
drm_WARN(dev, dma_obj->map_noncoherent, "Object caching is controlled by the underlying dma-buf\n");

Regards,
Jacek
