Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695F5A1DD3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 02:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CCF10E06A;
	Fri, 26 Aug 2022 00:52:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D176910E043;
 Fri, 26 Aug 2022 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661475170; x=1693011170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vetaIzHUteD7EBJEFTJ+Mjzf7UnlYuSdRjExJb55a2w=;
 b=JbphLAy32UvTyGUHo1jBTa0W1v00qWxrwMMAEcd1wEZPZTCt8C4zWFhb
 ZtqPjQyfm7OEziIkIC8l/Uwd9Sir0mLn5zN55tonyW9RLbqnvNMS57L8q
 iYxLeT1gp5svjLo09xeNwzWRfAmO0SEF8LeTxioQjmaMhauWfDpD/aYOP
 qP9OtvP0cGW8BSlnWA5N0vD0KmYPVjdbAniqGDaS0Ij0KdWfObBdzpemX
 Ssm2wCX6HsELwVFfcsgezq3+d2z0lK3pJadjvD5XKRSen7alqodjS44Bp
 5kyxUA41e3+xR5MEi6GRqaQv1VSHmp+p0jmro3y8ndRzxtuAUQ7Y+Y5+n Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295172580"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="295172580"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 17:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="713747580"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2022 17:52:49 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 17:52:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 17:52:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 17:52:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 17:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBR2Uuvfvn3sO3iNzl4IRUJeAS3KA+H5qWR22Y2zFC4tDL+pFVtOmruXzKn9J8+Bv3TAmmhRcNlSOXZ8sDPOjaRrQ+zQZvu8uy0oaideg3SWLPmWGTtLXfm/OirT5Rb5iIJ4Hshrs3Z8G/cYPHfGplHJiJGhftxJ3oJhwSwzTbIM8JIq1KpKoVNKldw9juX04jN1/awuH7aphCs46w3GUtO2wOtUYyndmhtj499ISUA/ZIx2IAlEzA0nDko5HE5rKUez0Ql34yhX6JFg41ahLFilNHeqATEY5Sqk9CqhiylM+DvYAHJrhyLOrRVpXeMs0+YiNreMzE61zGZ+Bzhurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaR8BGYV/Ekb7wc91kWiYLw/NF5nM8vBu/XV/VWs6ek=;
 b=PZb3pcp3MetwntKBBKIkaVcjHjm9vnCkRVyxv866atYLqVz6hnPZkRgUYT/PnuQTm+dTORc0kc64frLlIi2JbxujGWKbZa3DCk3nZfz/JC+WLhKG2NRqqkT5ZCrqrDOy13hVakzidkId7N5RicO4Cat6GFKC7mEiG1UReCR716P9JnI7rg4kohIYjUEtjDCgtlXbbCnbLhRTvg4KNSg9+oWADP6EkPamAu8w3D7sTODw+VDRuYVUD1hI8ybIFrAboqLexCoCAWb4uImjl/tCVh7E0hOFbVK1TRs7q4Oj0UOHP9cWzfAVy/1Od6r3aw9PVce3zCK+u+sxh/JJUe3qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 00:52:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d%6]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 00:52:41 +0000
Message-ID: <90d08182-22db-3af8-402b-d5756f2ea2d1@intel.com>
Date: Thu, 25 Aug 2022 17:52:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/uc: Support for version reduced
 and multiple firmware files
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220816202837.1778495-1-John.C.Harrison@Intel.com>
 <20220816202837.1778495-2-John.C.Harrison@Intel.com>
 <7e1ae824-b262-91c3-3254-79e2dbef6575@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7e1ae824-b262-91c3-3254-79e2dbef6575@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e973178b-e747-4ac9-363b-08da86fd4733
X-MS-TrafficTypeDiagnostic: PH0PR11MB4773:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNLvrTw0rls9f0gWHQAsAg9YgJQ3nkxx/0PDXYQxt8bL/Z36WZC2J7gWaC0AVH4Af48r1lQmY3bThO1aYLcJGAoF999oXtkfIaShon+g5cduu6QA7gGUd/ju7JgykxdSdblTYEfTzVwm7F1owREhEarszQ/tUl108XQzufmphc/YbKc8uqrTYXHm14IPeyIZvXGrkciIOKN42Yk5hHJh6tsmQIYsVKLNTglWW0ediqp7udlg2PTldnK3XRaQKpz2AqcBsFvKvup9ByNpHl78EPbPATFYoiKRTFB/QlKr1bwZ1r9QXRI0B+nqpnj9Ft4YdtdoiX9qp8HCcpuFAyIHi0QqIghIwom7my4eznRXjECQLRsFGE2qDVrQTxCkJs38RCd9H+CLkxRt1ng2ezeoaxsgDlOumkJ36zyHgzMrlgm5MkDkHItVAbLmul4ukHcZ6gzfi5XscOK/WjRqTtEOnDhc6fnUAoMM1qeUawb6rm+vNX9Z9Y9eTfjbYEli9mWRPIHBkYbUpWXyk+4vtIIJ4jAaD0/bh4CN/kTpOW3MCS0WxiIxTsIM2xsVah1STk1Hg5Pkds0V8qRmw2vLAXoeNkZ7Zxa6BvtlT7r9d9uBNd8BWW67PQwMBuXjqnDVPQKTA5FiwKkIZlCnIqluqaBqmUdxnxWkNPTJl0dZsBwhvJMUPapL0AcAMcuqHqVaaQj0bx+usYD0v+FzPw2BC2ufN4hmePb22b8xiNXrmO81FZYKfzL7R6XYco1CmDuUXhbXiKjpjIb/sAdG8mI1Uzo5VkEFCAjQTy35cy4Dsvv+qDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(346002)(396003)(366004)(136003)(86362001)(6666004)(6506007)(6512007)(53546011)(26005)(31696002)(41300700001)(478600001)(82960400001)(38100700002)(6486002)(83380400001)(2616005)(186003)(450100002)(36756003)(66556008)(66476007)(2906002)(66946007)(4326008)(8936002)(31686004)(5660300002)(30864003)(8676002)(316002)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0l3cm1EMzdSOEgwV29GS3hQNkhEN01wZXJ3VWxhS09EMTNVaDBqSGx2MkdY?=
 =?utf-8?B?cTU2MjBxUnRteU9GcEY1cm9zTDVkQ3NXOERxcDAzTm9TUHJrQTY2ZmxNd1RE?=
 =?utf-8?B?cHNKUnlZcEpQRlhLaFEzc0ZTajNNQlBhWENBcUFTQlhaZ0d2T2NaSXBPRmMx?=
 =?utf-8?B?RzRHMVBZQTdYSUZIblNUQzRaeG8wZ0tGS21LTGIrbVhkM3NlUWZnTDJvWFd2?=
 =?utf-8?B?LzlQYmRtSGIxampDRGNZRHFPTFMvbmkyMnFzRVFQa0NPbUVCOGxmZzdGSVJo?=
 =?utf-8?B?VXRyakczQ284WXJVejhTUkQwaXVHN05IVXZoWGhTamlyU0ErSEhTZkFZLy9x?=
 =?utf-8?B?TGZZbmpIcWhEQ21sMk1JTzVSRm45RjU1djExWDNzOGFCZS9PSVl1akx3d1Zj?=
 =?utf-8?B?ajYvY0xOZjMyT1hPbjJtY3JhSGVwc25yZFp2S2locmlUajVIU3FXNGQ5TDJV?=
 =?utf-8?B?RklBV3NoWFVqckMrQzZJd001RmVvcld4TVlHK24zcHJxNVlkT3hwekczNkFF?=
 =?utf-8?B?QTRKUk5JL1lIdHplY2wvT2J3V3I4VUdjUTdsOHdmZXRwTWl0OG9uNVJrRTBo?=
 =?utf-8?B?eEJyVWoxREJlaXFEUEU4RitSQW4zeUpkUTNyNWdoZkxsNE5TNFBVS2FhQWl5?=
 =?utf-8?B?SGMxeGhKZXBsMHFJR2tNLzNsSVhJZEF4Mk9LaUxiV0gzTno2RFUrSlZpd0dB?=
 =?utf-8?B?aUJaMW9PMmZOMCsxWHg3ZFhzb3paWUxFcFk4MjM4b3ZpWncwYW1hdjhnMDNn?=
 =?utf-8?B?Zm9PV3NUU255bzFVUGVTdkpIUTNnRVhKUytVRFpRM044SkxlRkEyU01rajRo?=
 =?utf-8?B?Smh2bm02aXZBeUx6TmdsSTNjRE1ISFV3N2p3VU5sOGZKc3RjOUNZQTdzdkZT?=
 =?utf-8?B?a3NURDZuUXZxZzJrUUJKajVzN3pEM2kyNjdwTW9jVC9FaU9EQjdhZGxacWlU?=
 =?utf-8?B?Y2l0UDdmSkxvbXo5VGJYL0U1V3VLM3ZxN2plR0gwUDBxNVV2Z2xSa1FXdTVS?=
 =?utf-8?B?elEyczk0alJHVFVFSE55ZEM1dzVIeUNXMzZBU0lhM3krVldQTHAzWWZGbXVv?=
 =?utf-8?B?MkNaZnF4akdhVFJTdk1IaEwzazJXZkFXUTAwMy96Q3pzQ1BoMWYzb0RPNFpy?=
 =?utf-8?B?SkhCRER6MFdpNzNTeStEVkJnRzdUbE1OOUVlcmlUa1dGQzd2OWVlYklNZVFD?=
 =?utf-8?B?VWZLalNQbTlwWE5zODcyUGlBenc2cUZhU2JJRzhMbVJrMG9UZ2xyU1JBaHpv?=
 =?utf-8?B?TkZkM2VZbTQ5SG15eTQrNUVhOUlsaEJrd29iQjE5b2MrWjNXQWZjZlg5Ym5T?=
 =?utf-8?B?bzdaME9sSkNtbHkva1lJd1o2MS9ydmNWQzN6aUhzZ3NoalJDVjBiUWcvb2w2?=
 =?utf-8?B?dGg1MjA0WW16M09kTzBBcGwwblMvbC9BdlZTRjJvcEhWT25wR2FHSTlYVSs5?=
 =?utf-8?B?enphcDR5YzFIclo4NHA2MVdoL1dBZHhoYVRjNVRiSFNuS2VENkJONXVaa0c2?=
 =?utf-8?B?eEJlL0I1dkVqZnRNWEttQTE3d0djVkRqdlIyK3FGZGRvMkZpQ2pJSjJXbDBl?=
 =?utf-8?B?MS9meEdmcVg0YnlIam5ub0x5NHBlc2JTQmc2a1JYVXNQb3VuR2ljUDluNlJ1?=
 =?utf-8?B?eGpVVFJJVVhtZkhWaE0xdlhUS01wQUx4OHRHaTFaZTZRQ01KZklNdk1DVXNt?=
 =?utf-8?B?TWZLMkVhYnJ5UVQ4aVpRQ2ptQnI2cUlGMGswMS9xT3M5Vm9xZWtpcUNXQXpP?=
 =?utf-8?B?c3pkVnpMam9aVUlORGdwdEJaMThQZVA4VkgzcDMxSk1RSmcyZUVXWTEyOHJS?=
 =?utf-8?B?cTMzN1AwSFNVY2x2RWhkZHNTM1IwZXcwekJ6YlRLc0M2RHhkVUJnMDVvMWZD?=
 =?utf-8?B?eVRLTkJtVHhEVWRZdnZxQXhHajkwUm1OaWxiQzFxU2VoUi9IYXVncVJpV3ZB?=
 =?utf-8?B?b3NCL0FldlgvSGsxRzlKTjRNZE1mNjRvNjRxWHdtWkNreUZyQVVCWWE0aVRJ?=
 =?utf-8?B?VFpjdlhDc1BQbS82K1BtMmVHbnhKaDRIS2VLZ1k5WEF6eDNJNG1xZURzWmIr?=
 =?utf-8?B?Mm83dkt3VERBTGVzbkYzcS9LOWhZd2hOcW4yWktzSlR1ckRIRHBhM0pnbmpv?=
 =?utf-8?B?M2M0L3JrNzU1djBqRktrYjZPMkRueGJteWlHMVBCZUxVRUlWdzROZFR0blJ0?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e973178b-e747-4ac9-363b-08da86fd4733
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 00:52:40.9482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW2GmvALaXK7ChcxFtsrQaCre2HCo5xJBaCVdiAQNnd1GviqyWocA1ZFdxwpuSE/pHxi8v9Bjdbsk+mzvEUSCFGu17KVzgvNc2Rwd6qzaH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/2022 21:49, Ceraolo Spurio, Daniele wrote:
> On 8/16/2022 1:28 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There was a misunderstanding in how firmware file compatibility should
>> be managed within i915. This has been clarified as:
>>    i915 must support all existing firmware releases forever
>>    new minor firmware releases should replace prior versions
>>    only backwards compatibility breaking releases should be a new file
>>
>> Hence this patch cleans up the single fallback file support that was
>> added as a quick fix emergency effort. That is now removed in
>> preference to supporting arbitrary numbers of firmware files per
>> platform as normal.
>>
>> The patch also adds support for having GuC firmwrae files that are
>> named by major version only (because the major version indicates
>> backwards breaking changes that affect the KMD) and for having HuC
>> firmware files with no version number at all (because the KMD has no
>> interface requirements with the HuC).
>>
>> For GuC, the driver will report via dmesg if the found file is older 
>> than
>> expected. For HuC, the KMD will no longer require updating for any new
>> HuC release so will not be able to report what the latest expected
>> version is.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  10 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 396 +++++++++++-------
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  33 +-
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  16 +-
>>   5 files changed, 275 insertions(+), 184 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 0d17da77e7872..d1715971fdd79 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc 
>> *guc)
>>       if (guc->submission_initialized)
>>           return 0;
>>   -    if (guc->fw.major_ver_found < 70) {
>> +    if (guc->fw.file_found.major_ver < 70) {
>>           ret = guc_lrc_desc_pool_create_v69(guc);
>>           if (ret)
>>               return ret;
>> @@ -2303,7 +2303,7 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>       GEM_BUG_ON(intel_context_is_child(ce));
>>       trace_intel_context_register(ce);
>>   -    if (guc->fw.major_ver_found >= 70)
>> +    if (guc->fw.file_found.major_ver >= 70)
>>           ret = register_context_v70(guc, ce, loop);
>>       else
>>           ret = register_context_v69(guc, ce, loop);
>> @@ -2315,7 +2315,7 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>           set_context_registered(ce);
>>           spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>   -        if (guc->fw.major_ver_found >= 70)
>> +        if (guc->fw.file_found.major_ver >= 70)
>>               guc_context_policy_init_v70(ce, loop);
>>       }
>>   @@ -2921,7 +2921,7 @@ static void 
>> __guc_context_set_preemption_timeout(struct intel_guc *guc,
>>                            u16 guc_id,
>>                            u32 preemption_timeout)
>>   {
>> -    if (guc->fw.major_ver_found >= 70) {
>> +    if (guc->fw.file_found.major_ver >= 70) {
>>           struct context_policy policy;
>>             __guc_context_policy_start_klv(&policy, guc_id);
>> @@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct 
>> intel_context *ce)
>>   static void __guc_context_set_prio(struct intel_guc *guc,
>>                      struct intel_context *ce)
>>   {
>> -    if (guc->fw.major_ver_found >= 70) {
>> +    if (guc->fw.file_found.major_ver >= 70) {
>>           struct context_policy policy;
>>             __guc_context_policy_start_klv(&policy, ce->guc_id.id);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index f2e7c82985efd..0697128cc3362 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -436,8 +436,8 @@ static void print_fw_ver(struct intel_uc *uc, 
>> struct intel_uc_fw *fw)
>>       struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>         drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
>> -         intel_uc_fw_type_repr(fw->type), fw->path,
>> -         fw->major_ver_found, fw->minor_ver_found);
>> +         intel_uc_fw_type_repr(fw->type), fw->file_found.path,
>> +         fw->file_found.major_ver, fw->file_found.minor_ver);
>>   }
>>     static int __uc_init_hw(struct intel_uc *uc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 58547292efa0a..eb3a15f0fa479 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -41,7 +41,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>           "%s firmware -> %s\n",
>>           intel_uc_fw_type_repr(uc_fw->type),
>>           status == INTEL_UC_FIRMWARE_SELECTED ?
>> -        uc_fw->path : intel_uc_fw_status_repr(status));
>> +        uc_fw->file_found.path : intel_uc_fw_status_repr(status));
>>   }
>>   #endif
>>   @@ -52,83 +52,113 @@ void intel_uc_fw_change_status(struct 
>> intel_uc_fw *uc_fw,
>>    * Note that RKL and ADL-S have the same GuC/HuC device ID's and 
>> use the same
>>    * firmware as TGL.
>>    */
>> -#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>> -    fw_def(DG2,          0, guc_def(dg2,  70, 4, 1)) \
>> -    fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
>> -    fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
>> -    fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
>> -    fw_def(ROCKETLAKE,   0, guc_def(tgl,  70, 1, 1)) \
>> -    fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 1, 1)) \
>> -    fw_def(JASPERLAKE,   0, guc_def(ehl,  70, 1, 1)) \
>> -    fw_def(ELKHARTLAKE,  0, guc_def(ehl,  70, 1, 1)) \
>> -    fw_def(ICELAKE,      0, guc_def(icl,  70, 1, 1)) \
>> -    fw_def(COMETLAKE,    5, guc_def(cml,  70, 1, 1)) \
>> -    fw_def(COMETLAKE,    0, guc_def(kbl,  70, 1, 1)) \
>> -    fw_def(COFFEELAKE,   0, guc_def(kbl,  70, 1, 1)) \
>> -    fw_def(GEMINILAKE,   0, guc_def(glk,  70, 1, 1)) \
>> -    fw_def(KABYLAKE,     0, guc_def(kbl,  70, 1, 1)) \
>> -    fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
>> -    fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
>> -
>> -#define INTEL_GUC_FIRMWARE_DEFS_FALLBACK(fw_def, guc_def) \
>> -    fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
>> -    fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3))
>> -
>> -#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>> -    fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
>> -    fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
>> -    fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
>> -    fw_def(ROCKETLAKE,   0, huc_def(tgl,  7, 9, 3)) \
>> -    fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3)) \
>> -    fw_def(JASPERLAKE,   0, huc_def(ehl,  9, 0, 0)) \
>> -    fw_def(ELKHARTLAKE,  0, huc_def(ehl,  9, 0, 0)) \
>> -    fw_def(ICELAKE,      0, huc_def(icl,  9, 0, 0)) \
>> -    fw_def(COMETLAKE,    5, huc_def(cml,  4, 0, 0)) \
>> -    fw_def(COMETLAKE,    0, huc_def(kbl,  4, 0, 0)) \
>> -    fw_def(COFFEELAKE,   0, huc_def(kbl,  4, 0, 0)) \
>> -    fw_def(GEMINILAKE,   0, huc_def(glk,  4, 0, 0)) \
>> -    fw_def(KABYLAKE,     0, huc_def(kbl,  4, 0, 0)) \
>> -    fw_def(BROXTON,      0, huc_def(bxt,  2, 0, 0)) \
>> -    fw_def(SKYLAKE,      0, huc_def(skl,  2, 0, 0))
>> -
>> -#define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
>> +#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>> +    fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>> +    fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
>> +    fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>> +    fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
>> +    fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>> +    fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>> +    fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
>> +    fw_def(ELKHARTLAKE,  0, guc_mmp(ehl,  70, 1, 1)) \
>> +    fw_def(ICELAKE,      0, guc_mmp(icl,  70, 1, 1)) \
>> +    fw_def(COMETLAKE,    5, guc_mmp(cml,  70, 1, 1)) \
>> +    fw_def(COMETLAKE,    0, guc_mmp(kbl,  70, 1, 1)) \
>> +    fw_def(COFFEELAKE,   0, guc_mmp(kbl,  70, 1, 1)) \
>> +    fw_def(GEMINILAKE,   0, guc_mmp(glk,  70, 1, 1)) \
>> +    fw_def(KABYLAKE,     0, guc_mmp(kbl,  70, 1, 1)) \
>> +    fw_def(BROXTON,      0, guc_mmp(bxt,  70, 1, 1)) \
>> +    fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>> +
>> +#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
>> +    fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
>> +    fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \
>> +    fw_def(ELKHARTLAKE,  0, huc_mmp(ehl,  9, 0, 0)) \
>> +    fw_def(ICELAKE,      0, huc_mmp(icl,  9, 0, 0)) \
>> +    fw_def(COMETLAKE,    5, huc_mmp(cml,  4, 0, 0)) \
>> +    fw_def(COMETLAKE,    0, huc_mmp(kbl,  4, 0, 0)) \
>> +    fw_def(COFFEELAKE,   0, huc_mmp(kbl,  4, 0, 0)) \
>> +    fw_def(GEMINILAKE,   0, huc_mmp(glk,  4, 0, 0)) \
>> +    fw_def(KABYLAKE,     0, huc_mmp(kbl,  4, 0, 0)) \
>> +    fw_def(BROXTON,      0, huc_mmp(bxt,  2, 0, 0)) \
>> +    fw_def(SKYLAKE,      0, huc_mmp(skl,  2, 0, 0))
>> +
>> +#define __MAKE_UC_FW_PATH_BLANK(prefix_, name_) \
>> +    "i915/" \
>> +    __stringify(prefix_) name_ ".bin"
>> +
>> +#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
>> +    "i915/" \
>> +    __stringify(prefix_) name_ \
>> +    __stringify(major_) ".bin"
>> +
>> +#define __MAKE_UC_FW_PATH_MMP(prefix_, name_, major_, minor_, patch_) \
>>       "i915/" \
>>       __stringify(prefix_) name_ \
>>       __stringify(major_) "." \
>>       __stringify(minor_) "." \
>>       __stringify(patch_) ".bin"
>
> This needs a comment to explain all these different path types, 
> something like: "Following the Linux Firmware Guidelines (see relevant 
> documentation for details), we expect GuC binaries to be identified 
> only by platform+major version, while HuC binaries don't have an 
> interface with i915 so they're only identified by platform. However, 
> for backward compatibility reasons, we also need to keep supporting 
> older firmwares using the full platform_major.minor.patch 
> nomenclature." .
>
>>   -#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
>> -    __MAKE_UC_FW_PATH(prefix_, "_guc_", major_, minor_, patch_)
>> +#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
>> +    __MAKE_UC_FW_PATH_MAJOR(prefix_, "_guc_", major_)
>> +
>> +#define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
>> +    __MAKE_UC_FW_PATH_MMP(prefix_, "_guc_", major_, minor_, patch_)
>>   -#define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
>> -    __MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
>> +#define MAKE_HUC_FW_PATH_BLANK(prefix_) \
>> +    __MAKE_UC_FW_PATH_BLANK(prefix_, "_huc")
>> +
>> +#define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
>> +    __MAKE_UC_FW_PATH_MMP(prefix_, "_huc_", major_, minor_, patch_)
>>     /* All blobs need to be declared via MODULE_FIRMWARE() */
>>   #define INTEL_UC_MODULE_FW(platform_, revid_, uc_) \
>>       MODULE_FIRMWARE(uc_);
>>   -INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
>> -INTEL_GUC_FIRMWARE_DEFS_FALLBACK(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
>> -INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
>> +INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH_MAJOR, 
>> MAKE_GUC_FW_PATH_MMP)
>> +INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, 
>> MAKE_HUC_FW_PATH_MMP)
>>     /* The below structs and macros are used to iterate across the 
>> list of blobs */
>>   struct __packed uc_fw_blob {
>> +    const char *path;
>> +    bool legacy;
>>       u8 major;
>>       u8 minor;
>> -    const char *path;
>> +    u8 patch;
>>   };
>>   -#define UC_FW_BLOB(major_, minor_, path_) \
>> -    { .major = major_, .minor = minor_, .path = path_ }
>> +#define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> +    .major = major_, \
>> +    .minor = minor_, \
>> +    .patch = patch_, \
>> +    .path = path_,
>> +
>> +#define UC_FW_BLOB_NEW(major_, minor_, patch_, path_) \
>> +    { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> +      .legacy = false }
>> +
>> +#define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>> +    { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>> +      .legacy = true }
>>   -#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
>> -    UC_FW_BLOB(major_, minor_, \
>> -           MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
>> +#define GUC_FW_BLOB(prefix_, major_, minor_) \
>> +    UC_FW_BLOB_NEW(major_, minor_, 0, \
>> +               MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
>
> All these macros are a bit confusing, but AFAIU you want to record the 
> expected minor on the i915 side but not encode it in the fetch path 
> and only use it for logging purposes. Maybe add a comment to explain 
> this? otherwise it is just confusing that we say we only want major on 
> one side and we include the minor on the other.
>
>>   -#define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
>> -    UC_FW_BLOB(major_, minor_, \
>> -           MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
>> +#define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>> +    UC_FW_BLOB_OLD(major_, minor_, patch_, \
>> +               MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>> +
>> +#define HUC_FW_BLOB(prefix_) \
>> +    UC_FW_BLOB_NEW(0, 0, 0, MAKE_HUC_FW_PATH_BLANK(prefix_))
>> +
>> +#define HUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>> +    UC_FW_BLOB_OLD(major_, minor_, patch_, \
>> +               MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>>     struct __packed uc_fw_platform_requirement {
>>       enum intel_platform p;
>> @@ -152,13 +182,10 @@ static void
>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>> intel_uc_fw *uc_fw)
>>   {
>>       static const struct uc_fw_platform_requirement blobs_guc[] = {
>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
>> -    };
>> -    static const struct uc_fw_platform_requirement 
>> blobs_guc_fallback[] = {
>> -        INTEL_GUC_FIRMWARE_DEFS_FALLBACK(MAKE_FW_LIST, GUC_FW_BLOB)
>> +        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>> GUC_FW_BLOB_MMP)
>>       };
>>       static const struct uc_fw_platform_requirement blobs_huc[] = {
>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
>> +        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>> HUC_FW_BLOB_MMP)
>>       };
>>       static const struct fw_blobs_by_type 
>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>           [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>> @@ -184,49 +211,89 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>       fw_count = blobs_all[uc_fw->type].count;
>>         for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
>> -        if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
>> -            const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>> -            uc_fw->path = blob->path;
>> -            uc_fw->wanted_path = blob->path;
>> -            uc_fw->major_ver_wanted = blob->major;
>> -            uc_fw->minor_ver_wanted = blob->minor;
>> -            break;
>> -        }
>> -    }
>> +        const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>>   -    if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
>> -        const struct uc_fw_platform_requirement *blobs = 
>> blobs_guc_fallback;
>> -        u32 count = ARRAY_SIZE(blobs_guc_fallback);
>> +        if (p != fw_blobs[i].p)
>> +            continue;
>>   -        for (i = 0; i < count && p <= blobs[i].p; i++) {
>> -            if (p == blobs[i].p && rev >= blobs[i].rev) {
>> -                const struct uc_fw_blob *blob = &blobs[i].blob;
>> +        if (rev < fw_blobs[i].rev)
>> +            continue;
>>   -                uc_fw->fallback.path = blob->path;
>> -                uc_fw->fallback.major_ver = blob->major;
>> -                uc_fw->fallback.minor_ver = blob->minor;
>> -                break;
>> -            }
>> -        }
>> +        if (uc_fw->file_wanted.path &&
>> +            uc_fw->file_wanted.major_ver == blob->major)
>> +            continue;
>
> This needs a comment to explain that this function can be called 
> multiple times if the first fw we look for is not found on disk. Also, 
> how does this work with new vs legacy blob with the same version? e.g. 
> if new style dg2_guc_70.bin is not on disk, but old style 
> dg2_guc_70.4.1 is, the major is 70 in both cases. Or am I missing 
> something?
>
>> +
>> +        uc_fw->file_found.path = blob->path;
>> +        uc_fw->file_wanted.path = blob->path;
>> +        uc_fw->file_wanted.major_ver = blob->major;
>> +        uc_fw->file_wanted.minor_ver = blob->minor;
>
> The naming of "wanted" vs "found" here is a bit misleading, because 
> found is assigned here before we even attempt the fetch, so  we 
> haven't actually found it. Looks like you're before the fetch you're 
> using this mainly for printing, so can't you use file_wanted instead 
> and only assign file_found after the fetch?
The behaviour is actually the same as before. It's just that rather 
being 'path' the name is now 'found_path'. And I'd rather not change the 
behaviour too much because there are random other bits of code making 
assumptions about stuff.

I'm thinking that 'selected' is actually the better name. That matches 
the firmware state machine entry that corresponds to this point in the 
process. It is also more accurately what is going on - we have selected 
file X even though we really wanted file Y (where the two may or may not 
be the same).  That keeps this code sensible and keeps all the other 
state machine code correct and operational too.


>
>> +        break;
>>       }
>>         /* make sure the list is ordered as expected */
>>       if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST)) {
>>           for (i = 1; i < fw_count; i++) {
>> +            /* Next platform is good: */
>>               if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>                   continue;
>>   +            /* Next platform revision is good: */
>>               if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>                   fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>                   continue;
>>   -            drm_err(&i915->drm, "Invalid FW blob order: %s r%u 
>> comes before %s r%u\n",
>> -                intel_platform_name(fw_blobs[i - 1].p),
>> -                fw_blobs[i - 1].rev,
>> -                intel_platform_name(fw_blobs[i].p),
>> -                fw_blobs[i].rev);
>> +            /* Platform/revision must be in order: */
>> +            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>> +                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>> +                goto bad;
>>   -            uc_fw->path = NULL;
>> +            /* Next major version is good: */
>> +            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>> +                continue;
>> +
>> +            /* New must be before leggacy: */
>
> typo legacy
>
>> +            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>> 1].blob.legacy)
>> +                goto bad;
>> +
>> +            /* New to legacy also means 0.0 to X.Y, or X.0 to X.Y */
>> +            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>> 1].blob.legacy) {
>> +                if (!fw_blobs[i - 1].blob.major)
>
> I'd add a comment here to remind that we don't track the versions with 
> HuC
>
>> +                    continue;
>> +
>> +                if (fw_blobs[i].blob.major == fw_blobs[i - 
>> 1].blob.major)
>> +                    continue;
>> +            }
>> +
>> +            /* Major versions must be in order: */
>> +            if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>> +                goto bad;
>> +
>> +            /* Next minor version is good: */
>> +            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>> +                continue;
>> +
>> +            /* Minor versions must be in order: */
>> +            if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>> +                goto bad;
>> +
>> +            /* Patch versions must be in order: */
>> +            if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>> +                continue;
>> +
>> +bad:
>> +            drm_err(&i915->drm, "\x1B[35;1mInvalid FW blob order: %s 
>> r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>> +                intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>> 1].rev,
>> +                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>> +                fw_blobs[i - 1].blob.major,
>> +                fw_blobs[i - 1].blob.minor,
>> +                fw_blobs[i - 1].blob.patch,
>> +                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>> +                fw_blobs[i].blob.legacy ? "L" : "v",
>> +                fw_blobs[i].blob.major,
>> +                fw_blobs[i].blob.minor,
>> +                fw_blobs[i].blob.patch);
>> +
>> +            uc_fw->file_found.path = NULL;
>>           }
>
> This has grown big enough that it should probably be moved to a mock 
> selftest. Can be done as a follow up.
>
>>       }
>>   }
>> @@ -259,7 +326,7 @@ static void __uc_fw_user_override(struct 
>> drm_i915_private *i915, struct intel_uc
>>       }
>>         if (unlikely(path)) {
>> -        uc_fw->path = path;
>> +        uc_fw->file_found.path = path;
>>           uc_fw->user_overridden = true;
>>       }
>>   }
>> @@ -283,7 +350,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>> *uc_fw,
>>        */
>>       BUILD_BUG_ON(INTEL_UC_FIRMWARE_UNINITIALIZED);
>>       GEM_BUG_ON(uc_fw->status);
>> -    GEM_BUG_ON(uc_fw->path);
>> +    GEM_BUG_ON(uc_fw->file_found.path);
>>         uc_fw->type = type;
>>   @@ -292,7 +359,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>> *uc_fw,
>>           __uc_fw_user_override(i915, uc_fw);
>>       }
>>   -    intel_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
>> +    intel_uc_fw_change_status(uc_fw, uc_fw->file_found.path ? 
>> *uc_fw->file_found.path ?
>>                     INTEL_UC_FIRMWARE_SELECTED :
>>                     INTEL_UC_FIRMWARE_DISABLED :
>>                     INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>> @@ -305,32 +372,32 @@ static void __force_fw_fetch_failures(struct 
>> intel_uc_fw *uc_fw, int e)
>>         if (i915_inject_probe_error(i915, e)) {
>>           /* non-existing blob */
>> -        uc_fw->path = "<invalid>";
>> +        uc_fw->file_found.path = "<invalid>";
>>           uc_fw->user_overridden = user;
>>       } else if (i915_inject_probe_error(i915, e)) {
>>           /* require next major version */
>> -        uc_fw->major_ver_wanted += 1;
>> -        uc_fw->minor_ver_wanted = 0;
>> +        uc_fw->file_wanted.major_ver += 1;
>> +        uc_fw->file_wanted.minor_ver = 0;
>>           uc_fw->user_overridden = user;
>>       } else if (i915_inject_probe_error(i915, e)) {
>>           /* require next minor version */
>> -        uc_fw->minor_ver_wanted += 1;
>> +        uc_fw->file_wanted.minor_ver += 1;
>>           uc_fw->user_overridden = user;
>> -    } else if (uc_fw->major_ver_wanted &&
>> +    } else if (uc_fw->file_wanted.major_ver &&
>>              i915_inject_probe_error(i915, e)) {
>>           /* require prev major version */
>> -        uc_fw->major_ver_wanted -= 1;
>> -        uc_fw->minor_ver_wanted = 0;
>> +        uc_fw->file_wanted.major_ver -= 1;
>> +        uc_fw->file_wanted.minor_ver = 0;
>>           uc_fw->user_overridden = user;
>> -    } else if (uc_fw->minor_ver_wanted &&
>> +    } else if (uc_fw->file_wanted.minor_ver &&
>>              i915_inject_probe_error(i915, e)) {
>>           /* require prev minor version - hey, this should work! */
>> -        uc_fw->minor_ver_wanted -= 1;
>> +        uc_fw->file_wanted.minor_ver -= 1;
>>           uc_fw->user_overridden = user;
>>       } else if (user && i915_inject_probe_error(i915, e)) {
>>           /* officially unsupported platform */
>> -        uc_fw->major_ver_wanted = 0;
>> -        uc_fw->minor_ver_wanted = 0;
>> +        uc_fw->file_wanted.major_ver = 0;
>> +        uc_fw->file_wanted.minor_ver = 0;
>>           uc_fw->user_overridden = true;
>>       }
>>   }
>> @@ -341,8 +408,8 @@ static int check_gsc_manifest(const struct 
>> firmware *fw,
>>       u32 *dw = (u32 *)fw->data;
>>       u32 version = dw[HUC_GSC_VERSION_DW];
>>   -    uc_fw->major_ver_found = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, 
>> version);
>> -    uc_fw->minor_ver_found = FIELD_GET(HUC_GSC_MINOR_VER_MASK, 
>> version);
>> +    uc_fw->file_found.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, 
>> version);
>> +    uc_fw->file_found.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_MASK, 
>> version);
>>         return 0;
>>   }
>> @@ -357,7 +424,7 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>       /* Check the size of the blob before examining buffer contents */
>>       if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < 
>> %zu\n",
>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> +             intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path,
>>                fw->size, sizeof(struct uc_css_header));
>>           return -ENODATA;
>>       }
>> @@ -370,7 +437,7 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>       if (unlikely(size != sizeof(struct uc_css_header))) {
>>           drm_warn(&i915->drm,
>>                "%s firmware %s: unexpected header size: %zu != %zu\n",
>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> +             intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path,
>>                fw->size, sizeof(struct uc_css_header));
>>           return -EPROTO;
>>       }
>> @@ -385,7 +452,7 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>       size = sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>> uc_fw->rsa_size;
>>       if (unlikely(fw->size < size)) {
>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < 
>> %zu\n",
>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> +             intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path,
>>                fw->size, size);
>>           return -ENOEXEC;
>>       }
>> @@ -394,16 +461,16 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>       size = __intel_uc_fw_get_upload_size(uc_fw);
>>       if (unlikely(size >= i915->wopcm.size)) {
>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > 
>> %zu\n",
>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> +             intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path,
>>                size, (size_t)i915->wopcm.size);
>>           return -E2BIG;
>>       }
>>         /* Get version numbers from the CSS header */
>> -    uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> -                       css->sw_version);
>> -    uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> -                       css->sw_version);
>> +    uc_fw->file_found.major_ver = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> +                        css->sw_version);
>> +    uc_fw->file_found.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> +                        css->sw_version);
>>         if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>>           uc_fw->private_data_size = css->private_data_size;
>> @@ -422,9 +489,11 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>   {
>>       struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>> +    struct intel_uc_fw_file file_ideal;
>>       struct device *dev = i915->drm.dev;
>>       struct drm_i915_gem_object *obj;
>>       const struct firmware *fw = NULL;
>> +    bool old_ver = false;
>>       int err;
>>         GEM_BUG_ON(!i915->wopcm.size);
>> @@ -437,27 +506,30 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       __force_fw_fetch_failures(uc_fw, -EINVAL);
>>       __force_fw_fetch_failures(uc_fw, -ESTALE);
>>   -    err = firmware_request_nowarn(&fw, uc_fw->path, dev);
>> -    if (err && !intel_uc_fw_is_overridden(uc_fw) && 
>> uc_fw->fallback.path) {
>> -        err = firmware_request_nowarn(&fw, uc_fw->fallback.path, dev);
>> -        if (!err) {
>> -            drm_notice(&i915->drm,
>> -                   "%s firmware %s is recommended, but only %s was 
>> found\n",
>> -                   intel_uc_fw_type_repr(uc_fw->type),
>> -                   uc_fw->wanted_path,
>> -                   uc_fw->fallback.path);
>> -            drm_info(&i915->drm,
>> -                 "Consider updating your linux-firmware pkg or 
>> downloading from %s\n",
>> -                 INTEL_UC_FIRMWARE_URL);
>> -
>> -            uc_fw->path = uc_fw->fallback.path;
>> -            uc_fw->major_ver_wanted = uc_fw->fallback.major_ver;
>> -            uc_fw->minor_ver_wanted = uc_fw->fallback.minor_ver;
>> +    err = firmware_request_nowarn(&fw, uc_fw->file_found.path, dev);
>> +    memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
>> +    if (!err || intel_uc_fw_is_overridden(uc_fw))
>> +        goto done;
>> +
>> +    while (err == -ENOENT) {
>> +        __uc_fw_auto_select(i915, uc_fw);
>> +        if (!uc_fw->file_found.path) {
>> +            /*
>> +             * No more options! But set path back to something
>> +             * valid just in case it gets dereferenced.
>> +             */
>> +            uc_fw->file_found.path = file_ideal.path;
>> +            break;
>>           }
>> +
>> +        err = firmware_request_nowarn(&fw, uc_fw->file_found.path, 
>> dev);
>>       }
>> +
>>       if (err)
>>           goto fail;
>>   +    old_ver = true;
>> +done:
>>       if (uc_fw->loaded_via_gsc)
>>           err = check_gsc_manifest(fw, uc_fw);
>>       else
>> @@ -465,18 +537,41 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       if (err)
>>           goto fail;
>>   -    if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
>> -        uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
>> -        drm_notice(&i915->drm, "%s firmware %s: unexpected version: 
>> %u.%u != %u.%u\n",
>> -               intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> -               uc_fw->major_ver_found, uc_fw->minor_ver_found,
>> -               uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
>> -        if (!intel_uc_fw_is_overridden(uc_fw)) {
>> -            err = -ENOEXEC;
>> -            goto fail;
>> +    if (uc_fw->file_wanted.major_ver) {
>> +        /* Check the file's major version was as it claimed */
>> +        if (uc_fw->file_found.major_ver != 
>> uc_fw->file_wanted.major_ver) {
>> +            drm_notice(&i915->drm, "%s firmware %s: unexpected 
>> version: %u.%u != %u.%u\n",
>> +                   intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path,
>> +                   uc_fw->file_found.major_ver, 
>> uc_fw->file_found.minor_ver,
>> +                   uc_fw->file_wanted.major_ver, 
>> uc_fw->file_wanted.minor_ver);
>> +            if (!intel_uc_fw_is_overridden(uc_fw)) {
>> +                err = -ENOEXEC;
>> +                goto fail;
>> +            }
>> +        } else {
>> +            if (uc_fw->file_found.minor_ver < 
>> uc_fw->file_wanted.minor_ver)
>> +                old_ver = true;
>>           }
>>       }
>>   +    if (old_ver) {
>> +        /* Preserve the version that was really wanted */
>> +        memcpy(&uc_fw->file_wanted, &file_ideal, 
>> sizeof(uc_fw->file_wanted));
>> +
>> +        drm_notice(&i915->drm,
>> +               "%s firmware %s (%d.%d) is recommended, but only %s 
>> (%d.%d) was found\n",
>
> This is going to be a weird message if we were looking for new style 
> guc_70.0 and found old style guc_70.4 instead. Can we limit this log 
> to when the found version is smaller than the wanted one?
That can't happen. It might say 'wanted guc_70.bin (70.4) but found 
guc_70.4.0.bin (70.4)' but you can't have 'wanted 70.0 but found 70.4'. 
We won't ever push a new style firmware that is older than an existing 
legacy style. And if the driver knows about X.4 then it will have X.4 as 
the new style table entry, not X.0. So irrespective of what the user has 
on their system, the 'wanted' will always be equal or greater than 'found'.

John.



>
>> + intel_uc_fw_type_repr(uc_fw->type),
>> +               uc_fw->file_wanted.path,
>> +               uc_fw->file_wanted.major_ver,
>> +               uc_fw->file_wanted.minor_ver,
>> +               uc_fw->file_found.path,
>> +               uc_fw->file_found.major_ver,
>> +               uc_fw->file_found.minor_ver);
>> +        drm_info(&i915->drm,
>> +             "Consider updating your linux-firmware pkg or 
>> downloading from %s\n",
>> +             INTEL_UC_FIRMWARE_URL);
>> +    }
>> +
>>       if (HAS_LMEM(i915)) {
>>           obj = i915_gem_object_create_lmem_from_data(i915, fw->data, 
>> fw->size);
>>           if (!IS_ERR(obj))
>> @@ -503,7 +598,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>                     INTEL_UC_FIRMWARE_ERROR);
>>         i915_probe_error(i915, "%s firmware %s: fetch failed with 
>> error %d\n",
>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
>> +             intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path, err);
>>       drm_info(&i915->drm, "%s firmware(s) can be downloaded from %s\n",
>>            intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
>>   @@ -645,7 +740,7 @@ int intel_uc_fw_upload(struct intel_uc_fw 
>> *uc_fw, u32 dst_offset, u32 dma_flags)
>>     fail:
>>       i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> +             intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_found.path,
>>                err);
>>       intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>>       return err;
>> @@ -864,18 +959,19 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw 
>> *uc_fw, void *dst, u32 max_len)
>>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct 
>> drm_printer *p)
>>   {
>>       drm_printf(p, "%s firmware: %s\n",
>> -           intel_uc_fw_type_repr(uc_fw->type), uc_fw->wanted_path);
>> -    if (uc_fw->fallback.path) {
>> -        drm_printf(p, "%s firmware fallback: %s\n",
>> -               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->fallback.path);
>> -        drm_printf(p, "fallback selected: %s\n",
>> -               str_yes_no(uc_fw->path == uc_fw->fallback.path));
>> -    }
>> +           intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path);
>> +    if (uc_fw->file_found.path == uc_fw->file_wanted.path)
>
> Was this meant to be a != check? otherwise it's the same print twice
>
> Daniele
>
>> +        drm_printf(p, "%s firmware wanted: %s\n",
>> +               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_wanted.path);
>>       drm_printf(p, "\tstatus: %s\n",
>>              intel_uc_fw_status_repr(uc_fw->status));
>> -    drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
>> -           uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
>> -           uc_fw->major_ver_found, uc_fw->minor_ver_found);
>> +    if (uc_fw->file_wanted.major_ver)
>> +        drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
>> +               uc_fw->file_wanted.major_ver, 
>> uc_fw->file_wanted.minor_ver,
>> +               uc_fw->file_found.major_ver, 
>> uc_fw->file_found.minor_ver);
>> +    else
>> +        drm_printf(p, "\tversion: found %u.%u\n",
>> +               uc_fw->file_found.major_ver, 
>> uc_fw->file_found.minor_ver);
>>       drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>>       drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 7aa2644400b98..5c1751773c756 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -64,6 +64,17 @@ enum intel_uc_fw_type {
>>   };
>>   #define INTEL_UC_FW_NUM_TYPES 2
>>   +/*
>> + * The firmware build process will generate a version header file 
>> with major and
>> + * minor version defined. The versions are built into CSS header of 
>> firmware.
>> + * i915 kernel driver set the minimal firmware version required per 
>> platform.
>> + */
>> +struct intel_uc_fw_file {
>> +    const char *path;
>> +    u16 major_ver;
>> +    u16 minor_ver;
>> +};
>> +
>>   /*
>>    * This structure encapsulates all the data needed during the process
>>    * of fetching, caching, and loading the firmware image into the uC.
>> @@ -74,11 +85,12 @@ struct intel_uc_fw {
>>           const enum intel_uc_fw_status status;
>>           enum intel_uc_fw_status __status; /* no accidental 
>> overwrites */
>>       };
>> -    const char *wanted_path;
>> -    const char *path;
>> +    struct intel_uc_fw_file file_wanted;
>> +    struct intel_uc_fw_file file_found;
>>       bool user_overridden;
>>       size_t size;
>>       struct drm_i915_gem_object *obj;
>> +
>>       /**
>>        * @dummy: A vma used in binding the uc fw to ggtt. We can't 
>> define this
>>        * vma on the stack as it can lead to a stack overflow, so we 
>> define it
>> @@ -89,25 +101,8 @@ struct intel_uc_fw {
>>       struct i915_vma_resource dummy;
>>       struct i915_vma *rsa_data;
>>   -    /*
>> -     * The firmware build process will generate a version header 
>> file with major and
>> -     * minor version defined. The versions are built into CSS header 
>> of firmware.
>> -     * i915 kernel driver set the minimal firmware version required 
>> per platform.
>> -     */
>> -    u16 major_ver_wanted;
>> -    u16 minor_ver_wanted;
>> -    u16 major_ver_found;
>> -    u16 minor_ver_found;
>> -
>> -    struct {
>> -        const char *path;
>> -        u16 major_ver;
>> -        u16 minor_ver;
>> -    } fallback;
>> -
>>       u32 rsa_size;
>>       u32 ucode_size;
>> -
>>       u32 private_data_size;
>>         bool loaded_via_gsc;
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 32e92651ef7c2..83cbb3589c9be 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1004,8 +1004,10 @@ static void cleanup_params(struct 
>> i915_gpu_coredump *error)
>>     static void cleanup_uc(struct intel_uc_coredump *uc)
>>   {
>> -    kfree(uc->guc_fw.path);
>> -    kfree(uc->huc_fw.path);
>> +    kfree(uc->guc_fw.file_found.path);
>> +    kfree(uc->huc_fw.file_found.path);
>> +    kfree(uc->guc_fw.file_wanted.path);
>> +    kfree(uc->huc_fw.file_wanted.path);
>>       i915_vma_coredump_free(uc->guc_log);
>>         kfree(uc);
>> @@ -1669,12 +1671,10 @@ gt_record_uc(struct intel_gt_coredump *gt,
>>       memcpy(&error_uc->guc_fw, &uc->guc.fw, sizeof(uc->guc.fw));
>>       memcpy(&error_uc->huc_fw, &uc->huc.fw, sizeof(uc->huc.fw));
>>   -    /* Non-default firmware paths will be specified by the modparam.
>> -     * As modparams are generally accesible from the userspace make
>> -     * explicit copies of the firmware paths.
>> -     */
>> -    error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
>> -    error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
>> +    error_uc->guc_fw.file_found.path = 
>> kstrdup(uc->guc.fw.file_found.path, ALLOW_FAIL);
>> +    error_uc->huc_fw.file_found.path = 
>> kstrdup(uc->huc.fw.file_found.path, ALLOW_FAIL);
>> +    error_uc->guc_fw.file_wanted.path = 
>> kstrdup(uc->guc.fw.file_wanted.path, ALLOW_FAIL);
>> +    error_uc->huc_fw.file_wanted.path = 
>> kstrdup(uc->huc.fw.file_wanted.path, ALLOW_FAIL);
>>       error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>>                           "GuC log buffer", compress);
>

