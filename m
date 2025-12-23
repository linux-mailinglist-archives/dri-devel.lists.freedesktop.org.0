Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38428CD864F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 08:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C225610E13B;
	Tue, 23 Dec 2025 07:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9OXOtEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183D210E0A5;
 Tue, 23 Dec 2025 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766475340; x=1798011340;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=GoVVuQPx5MANIkgi6ok4qNZjCDp3WEAv094GdSH4f8U=;
 b=A9OXOtEVJhnYiYi7blykydLSZIKiE4RNRSIHTl3zCV6MDqCdQeJ8ElY7
 OYVU3+EV7Kznvpi9zSmaqmjZYYgMwcvW/5FBuJngU7eLCkEf6PMCg+wWU
 2fqB+l+5ISFgdLQVefmDfxjW0ZNHqx37edRhXMsJpJeaNoDQideDHXmFx
 ZGQDEDrZ465xXOkeCFQm3Jk+lGcy1Wjr7/lv1mumcRoHfBZJ7IW7/zUzp
 h/4sLkEJ94vgdiQt7GMmy8zXUdl+ofTVrF30YH1dTfDzGIY4sCHkjxAo3
 Mymxg/2ytb1RTwOh7+8nwa9GwUw7wRaSZ6Kx39SpTF6bufEYF2KLnaYWu Q==;
X-CSE-ConnectionGUID: q5J+zkn5QhyfiPnsKc0bUQ==
X-CSE-MsgGUID: Na6li9w7QbCPA5iOG5KtHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85738629"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="85738629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 23:35:38 -0800
X-CSE-ConnectionGUID: WcCNC9Q3QpuVrw933z+fng==
X-CSE-MsgGUID: JygOzk5QRY2J45H2i1trNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="200629228"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 23:35:36 -0800
Date: Tue, 23 Dec 2025 08:35:34 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
cc: "Grzelak, Michal" <michal.grzelak@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "Brost, Matthew" <matthew.brost@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm
 teardown
In-Reply-To: <DM4PR11MB54560DF369537BCE07175297EAA9A@DM4PR11MB5456.namprd11.prod.outlook.com>
Message-ID: <771e8879-4122-8bea-826f-97f9f75932d8@intel.com>
References: <20251219193237.1454565-1-michal.grzelak@intel.com>
 <DM4PR11MB54560DF369537BCE07175297EAA9A@DM4PR11MB5456.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-2016406912-1766395563=:1476941"
Content-ID: <143e0a7b-07e9-adf1-e70b-4eb4b739d550@intel.com>
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

--8323329-2016406912-1766395563=:1476941
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <c1c28b95-9cba-320c-1597-14bec3f357d8@intel.com>

On Fri, 19 Dec 2025, Lin, Shuicheng wrote:
> On Fri, Dec 19, 2025 11:33 AM Micha³ Grzelak wrote:
>> During initialization of DRM buddy memory manager at drm_buddy_init,
>> mm->free_trees array is allocated for both clear and dirty RB trees.
>> During cleanup happening at drm_buddy_fini it is never freed, leading to
>> following memory leaks observed on xe module load & unload cycles:
>>
>>     kmemleak_alloc+0x4a/0x90
>>     __kmalloc_cache_noprof+0x488/0x800
>>     drm_buddy_init+0xc2/0x330 [drm_buddy]
>>     __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>>     xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>>     xe_device_probe+0x326/0x9e0 [xe]
>>     xe_pci_probe+0x39a/0x610 [xe]
>>     local_pci_probe+0x47/0xb0
>>     pci_device_probe+0xf3/0x260
>>     really_probe+0xf1/0x3c0
>>     __driver_probe_device+0x8c/0x180
>>     driver_probe_device+0x24/0xd0
>>     __driver_attach+0x10f/0x220
>>     bus_for_each_dev+0x7f/0xe0
>>     driver_attach+0x1e/0x30
>>     bus_add_driver+0x151/0x290
>>
>> Deallocate array for free trees when cleaning up buddy memory manager in
>> the same way as if going through out_free_tree label.
>>
>> Fixes: d4cd665c98c1 ("drm/buddy: Separate clear and dirty free block trees")
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> I also meet this issue. And the fix LGTM. It has the same logic as the failure path of drm_buddy_init().
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

Thank you Shuicheng for the review and confirmation. Will update the
commit message along your R-B in next round of resend.

BTW, do you have any recommendation regarding the tree via which this
change should be merged? Asking since I don't have the commit bit to any
of drm-* trees.

BR,
Micha³
--8323329-2016406912-1766395563=:1476941--
