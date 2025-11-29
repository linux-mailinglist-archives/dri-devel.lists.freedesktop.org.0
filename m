Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C2C947CD
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 21:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23F510E21B;
	Sat, 29 Nov 2025 20:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCp9XUg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0CC10E21B;
 Sat, 29 Nov 2025 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448144; x=1795984144;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=uYgVsf2MTQl3h82f/CYYelPTwNa+rIKmOBuKCFccqQA=;
 b=BCp9XUg2A7KdkaPiMmV0FGOT8XiHDnBhzPQGAXlivfmq6RDYh+aC1kSn
 oyO1/ftCtlaU6WbhGAyrYiXkn7Kkkjyblfn5tB51DQMFOVML7iVOi9hRv
 9QRkheMe0fZWUNMlmqYBQE36i2UE+/wtWTYbLR8UFZbV7gsfEMEBE5e4d
 RGPH2RIz+jFXU1KD0/6SeMQ89qZnJRZ1f7Go1xZ3tJJRhJkDPg2sNAKgz
 yAtFDG66IoQzuPfhzkb6NHm4U/nmsMqgvmbZT2rgOZQvEEkaD7uMa8+eX
 5516+3eNAa663aa54y/TLZ/8wO57JzBtxR76XgtxndpvdxGCvfjhpKQxw g==;
X-CSE-ConnectionGUID: 6VmMKMUVSneTkQ5suUxpnA==
X-CSE-MsgGUID: XBClhmcfTzifBR86S5G4oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77533581"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="77533581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:29:03 -0800
X-CSE-ConnectionGUID: wmLclJv7RJaIBRg910RcVQ==
X-CSE-MsgGUID: RgFjJghNR02ow2px5OfSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="197911362"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:29:01 -0800
Date: Sat, 29 Nov 2025 21:28:59 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 jani.nikula@linux.intel.com, Arunpravin.PaneerSelvam@amd.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH] drm/buddy: release free_trees array on buddy mm teardown
In-Reply-To: <370852a0-508b-4635-b46c-344e1b488363@intel.com>
Message-ID: <c666a349-b962-358f-3394-fa321b4cdb34@intel.com>
References: <20251120093022.276551-1-michal.grzelak@intel.com>
 <370852a0-508b-4635-b46c-344e1b488363@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-687312643-1763978318=:5787"
Content-ID: <04b8a172-0a6b-bbf5-23d9-07fcb8bc4fc9@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-687312643-1763978318=:5787
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <12b04cac-0b3b-371c-a679-dd7143e7a347@intel.com>

On Thu, 20 Nov 2025, Matthew Auld wrote:
> On 20/11/2025 09:30, Micha³ Grzelak wrote:
>> During initialization of DRM buddy memory manager at drm_buddy_init,
>> mm->free_trees array is allocated for both clear and dirty RB trees.
>> During cleanup happening at drm_buddy_fini it is never freed, leading to
>> following memory leaks observed on xe module load & unload cycles:
>>
>>      kmemleak_alloc+0x4a/0x90
>>      __kmalloc_cache_noprof+0x488/0x800
>>      drm_buddy_init+0xc2/0x330 [drm_buddy]
>>      __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>>      xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>>      xe_device_probe+0x326/0x9e0 [xe]
>>      xe_pci_probe+0x39a/0x610 [xe]
>>      local_pci_probe+0x47/0xb0
>>      pci_device_probe+0xf3/0x260
>>      really_probe+0xf1/0x3c0
>>      __driver_probe_device+0x8c/0x180
>>      driver_probe_device+0x24/0xd0
>>      __driver_attach+0x10f/0x220
>>      bus_for_each_dev+0x7f/0xe0
>>      driver_attach+0x1e/0x30
>>      bus_add_driver+0x151/0x290
>> 
>> Deallocate array for free trees when cleaning up buddy memory manager
>> in the same way as if going through out_free_tree label.
>> 
>> Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
Thanks Matthew for your review. I will resend the patch to get the
change merged via the drm-misc.

BR,
Micha³
--8323329-687312643-1763978318=:5787--
