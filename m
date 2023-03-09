Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306F6B1BF3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 08:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869EF10E79F;
	Thu,  9 Mar 2023 07:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2B10E79E;
 Thu,  9 Mar 2023 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678345571; x=1709881571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YkwWNOL0LMXpJr3yc3889PleEyiAAkCBpigm2ErMI+o=;
 b=DusxH7D9kKIYbNEdmlUMBVygFk+/rYL2RXKl3lLfQSYjAJTABZkTBJE8
 S00M5n221W4lTf1+fg2mBWHNzpS7soho0bs12u69048UqlrY4nJ9FxS7j
 H7ShhFbGpdrd3MLNo4c2NgqR02C3Zz0Ql8LHZ/PnxksPipJKKnG3Gemdi
 dtg0e+rFv2iRzpq5a1cQfLwgOMri06E+gPDftgFImq+zykWzfFBIgiigz
 Ox3PR7qCrc10JrNh0LCKzO1cumjbXVKWywLEtCWVTvC+Y6L6SwAWwGwjN
 8BivMXa9flTK+j43+J+IkpXWIKKSIlbmhF0yFI5sSxf/ELHIZ2L62EKFT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="336386612"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="336386612"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 23:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746207030"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="746207030"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.10])
 ([10.249.254.10])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 23:06:09 -0800
Message-ID: <68a6a01a-6a98-0f9e-9d4b-ede48ac6665f@linux.intel.com>
Date: Thu, 9 Mar 2023 08:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/7] drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-4-thomas.hellstrom@linux.intel.com>
 <c1a9f255-9ee4-c020-9767-afb2591faaec@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <c1a9f255-9ee4-c020-9767-afb2591faaec@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

Thanks for reviewing these.

Ack to merge reviewed patches through drm-misc-next?

Thanks,

Thomas


On 3/8/23 09:49, Christian König wrote:
> Am 07.03.23 um 15:46 schrieb Thomas Hellström:
>> New code is recommended to use the BIT macro instead of the explicit
>> shifts. Change the older defines so that we can keep the style 
>> consistent
>> with upcoming changes.
>>
>> v2:
>> - Also change the value of the _PRIV_POPULATED bit (Christian König)
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
>> ---
>>   include/drm/ttm/ttm_tt.h | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index b7d3f3843f1e..977ca195a536 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -83,12 +83,12 @@ struct ttm_tt {
>>        * set by TTM after ttm_tt_populate() has successfully 
>> returned, and is
>>        * then unset when TTM calls ttm_tt_unpopulate().
>>        */
>> -#define TTM_TT_FLAG_SWAPPED        (1 << 0)
>> -#define TTM_TT_FLAG_ZERO_ALLOC        (1 << 1)
>> -#define TTM_TT_FLAG_EXTERNAL        (1 << 2)
>> -#define TTM_TT_FLAG_EXTERNAL_MAPPABLE    (1 << 3)
>> +#define TTM_TT_FLAG_SWAPPED        BIT(0)
>> +#define TTM_TT_FLAG_ZERO_ALLOC        BIT(1)
>> +#define TTM_TT_FLAG_EXTERNAL        BIT(2)
>> +#define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>   -#define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(4)
>>       uint32_t page_flags;
>>       /** @num_pages: Number of pages in the page array. */
>>       uint32_t num_pages;
>
