Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AB4D1851
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197DC10E5BD;
	Tue,  8 Mar 2022 12:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14F510E608;
 Tue,  8 Mar 2022 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646743899; x=1678279899;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lNPuPzRLaunxQwdSRIF6od9IRn1Yu4QpcK5gsAyVDLw=;
 b=EsEWHq16uIcOmAw+6tVAbnhct3NWRpiRU1RlS6M1/erXAz/L0R7O4S6Q
 c8BVYiCHaJDkgWA6dj5Ji2NIBYj/Ud1WADH2CbxeYSDd4jnxKWQboaeC0
 PIfPFF6HtypsQtptFyKwK5XOt6ews8rTSZmcOYrp7jFeWdZvV5p9vXPDG
 /KlC3rofOgmZDUE2qyP6KCnabxzwWL/1L4ZaO2xbAjnHh7oxcjWehAkAR
 x6GphDHgVDSUrI50sOnybG5IVD/U9CWYMK4H+G2v6x+qoPH/7k6NvUD6r
 sADrsxH+eBpnyCCQ5whxFwOty6gQeYN+4nA3XjN5ANqrw8TakBAnLkDjj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317903777"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="317903777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 04:51:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="537556442"
Received: from mrynekx-mobl3.ger.corp.intel.com (HELO [10.252.3.128])
 ([10.252.3.128])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 04:51:37 -0800
Message-ID: <8189fc23-f9d7-9daf-f3a7-8e5054425e0d@intel.com>
Date: Tue, 8 Mar 2022 12:51:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: pull in drm_buddy.c
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
References: <20220208151228.344997-1-matthew.auld@intel.com>
 <4dfd15b6-e402-f15d-f793-6d31e591fb20@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <4dfd15b6-e402-f15d-f793-6d31e591fb20@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2022 07:32, Christian König wrote:
> Am 08.02.22 um 16:12 schrieb Matthew Auld:
>> Make sure we pull in the kernel-doc for this.
>>
>> Reported-by: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks. Could you also push this?

> 
>> ---
>>   Documentation/gpu/drm-mm.rst | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index 198bcc1affa1..f32ccce5722d 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -466,6 +466,15 @@ DRM MM Range Allocator Function References
>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>      :export:
>> +DRM Buddy Allocator
>> +===================
>> +
>> +DRM Buddy Function References
>> +-----------------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
>> +   :export:
>> +
>>   DRM Cache Handling and Fast WC memcpy()
>>   =======================================
> 
