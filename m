Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F07580F4A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 10:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A18F10E034;
	Tue, 26 Jul 2022 08:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61288112164;
 Tue, 26 Jul 2022 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658824866; x=1690360866;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cDvh1RXCJi/hmIjoLQ82PzKrIfG7t8B0IO+umeOg2jA=;
 b=YfA615uPbkKhmpn/dp/F6gw6HOd2nOiOtXArkbLEMLegmAyixGov1ixZ
 SndouPBf+6ZPaMPr56eRvWIYjf0HZZDMq1Jm/spCkCxv+Y+oMFJhIJVe3
 FxRV6IBPPxN85b0KNfjZ2FbyctxFw1KCi36PqSebo2oxmDKOOe8ivZUKn
 qy0uZv0sPuOCRqeICaAnTaclYhFSXjhQpErRUVPDULkh+RvYFcdEUOJ/S
 RtpfMyqB75iuxbp6+BN0Xpp7ilIy+W8iucfWBw93P5IPZB11Gt77Zvcyo
 rcz2HB/VWs2IC06DUGceqS2a1brQtTEhst2HuamnPml/uIhy/0laKR8qi Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="285447301"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="285447301"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 01:41:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="927243867"
Received: from atilson-mobl2.ger.corp.intel.com (HELO [10.213.238.124])
 ([10.213.238.124])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 01:41:04 -0700
Message-ID: <52b519d6-ea46-35a9-81fd-256a44937dbd@linux.intel.com>
Date: Tue, 26 Jul 2022 09:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
 <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
 <ceba1244-33a8-9b74-6379-4d0569ca9bdb@amd.com>
 <b7b44b45-4143-963c-3279-87bdc6f727c1@suse.de>
 <3b66f6fe-422a-62e9-ff55-74d9f631d6e3@linux.intel.com>
 <3897e61d-6e30-8626-aac0-4ac1ef9957c2@gmail.com>
 <d78e0eab-74b8-443b-950a-7adaf963e595@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <d78e0eab-74b8-443b-950a-7adaf963e595@suse.de>
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/07/2022 08:46, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.07.22 um 19:14 schrieb Christian König:
>> Am 25.07.22 um 17:27 schrieb Tvrtko Ursulin:
>>>
>>> On 24/07/2022 19:28, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 22.07.22 um 17:47 schrieb Christian König:
>>>>> Hi Tvrtko,
>>>>>
>>>>> scratching my head what exactly is going on here.
>>>>>
>>>>> I've build tested drm-tip a couple of test in the last week and it 
>>>>> always worked flawlessly.
>>>>>
>>>>> It looks like that some conflict resolution is sometimes not 
>>>>> applied correctly, but I have no idea why.
>>>>
>>>> It worked last week, but must have been reintroduced meanhwile.
>>>> Please fetch the latest drm-tip and rebuild. The attached config 
>>>> produces the error on my system.
>>>
>>> What is the status with this? I hit a conflict on an implicated file 
>>> just now trying to rebuild drm-tip:
>>>
>>> Unmerged paths:
>>>   (use "git add/rm <file>..." as appropriate to mark resolution)
>>>         deleted by us: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>
>>> I had an other i915 conflict to solve and as grep amdgpu_vram_mgr.h 
>>> drivers/gpu/drm/amd produced nothing I just did a git rm on it and 
>>> pushed the resolution.
>>>
>>> Let me know if I broke something, re-broke something, or whatever.. 
>>> Build of amdgpu certainly still looks broken on my end, both before 
>>> and after me rebuilding drm-tip so maybe I just preserved the breakage.
>>
>> It looks like that somehow re-broke, but I'm not sure how.
>>
>> I've fetched drm-tip on Friday at around 1pm CET and build it and that 
>> worked perfectly fine.
>>
>> Essentially the status of drm-misc-next for the following files should 
>> be carried on in drm-tip:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> 
> I've reset these files to their state as in drm-misc-next and updated 
> drm-tip. It appears to be working again from what I could test locally. 
> Please try at your earliest convenience.

Builds for me now - thank you!

Regards,

Tvrtko
