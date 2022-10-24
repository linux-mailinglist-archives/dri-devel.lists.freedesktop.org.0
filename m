Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063D60B7F6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F7010E05B;
	Mon, 24 Oct 2022 19:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C252882B5;
 Mon, 24 Oct 2022 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666640308; x=1698176308;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1lj55ro7TGwrbpRhZH20ndtLZ9QBVbOAkMwP+vs6V20=;
 b=RqcUGA/ivU3M9+KHWFs0Jx4vnutdwmbiG8ppgYZaF+DO0tyL1RgMpRuD
 cdJ0Jt/W72bMap9R7BzlOyfpuQRi+jaoWp+LOC4NS+IvOUauD9VbDNl5+
 n1fxSA9W9+kNiEIoXgAQCZjT98UWNxZwVnCGisOX8YM0nE2TjfK49DEwg
 gcXs+Jw+PFoD7mIbfdEje1wu51WsTmSR9sehJf0EuWS7gBPrz8lX7IstZ
 Za9vHzt511duby8x+oB0egHe0E656636lElrKCbCgqhBKdmzfcMlkLS6l
 SWbl9+X+dbnG/yBom2P0KifFhX0EDz+6ZoR+w7q2Ahx47I2vW1dWC/b0U Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="309194143"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="309194143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 12:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="626176512"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="626176512"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 24 Oct 2022 12:38:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 12:38:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 12:38:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 12:38:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 12:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9zkAOGX6t31L1SmwPyJZOuZU9O3Q3Z/f6hvh0c0I3RxL8PoruqKfh+dJedE+uRyVQqc93BXnnDyEBlLbcO40uVVF//yggFX4QDJ+eGHpQN4LXgDJ5ntZ7nOlgs4taUBOnQBMxWvC8942n4jqKkVXZ4QFv0n0/0STVcmRLERp9AZgIA+ifkhF2cbNjo9b9k0IvgD4v9/+BrQBfcJtR+IeLl1hzDFMz87BPchv0BqnvxvTHOw8AQIOOODQSF6XfbhYbUROs+HbeUl2JiDIjCiTGkAR3Trjqio6yHQwWodVvHkdd0900b3JvIYYlDBjpnTGJaFAHC5jFxT4F3PhObY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/8kl815vmeNyRE6vA97OsIFME4EVRGhadfmO2D14q4=;
 b=Dj651Q8K7SxU3FoH9RJ8SLTATxYLfYyul3KYg7qQ+aOw5AGHqTVA/sVHzAbzwdHbdFl/Lup27N9PIA0Q8nyJ6+LUfWOsaab2bYlhHdm3hjiFAgUvQLvs/zmRfpRo/coExkymEgkj5A/wKC9gXyQ4MWsJ5l7wDvMf/zJA62nrlO/PqRPRuQCbcqmOVXDnsSrNOma7AFTxxO9X+/V+qUKamn9bITu8xbpePqw+hslq4FQprFidyhRjaBbF18e/5i/ovRxkvynX7oplawAVgjqH5d1pBBsnG6m5Vq0NQa49PqvqW1xo/w8Q2YH4+19kCPkqMUjkMRLWCgUyr2826iojpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 19:38:22 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 19:38:22 +0000
Message-ID: <86b3b825-04c8-327a-e961-26c0a6c0e13b@intel.com>
Date: Mon, 24 Oct 2022 12:38:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/slpc: Use platform limits for
 min/max frequency
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221018183031.33704-1-vinay.belgaumkar@intel.com>
 <8735biqf22.wl-ashutosh.dixit@intel.com>
 <30cc2c72-38f6-7d30-91f0-709b55b472fd@intel.com>
 <87v8ocpgxl.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87v8ocpgxl.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SJ0PR11MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: e200721c-2403-497d-7be5-08dab5f74fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thuwbDm0/bP06n92v+GQF+twg8EafMrrVDfpmzs2O+6wMmGgovod34JcR4ZDeaSNQ4hXaihh+5q/Mp/G2RiTtCdcsem3UxddEhQo7dxuR2pMP0/HUpJHz6MPQSQVzjvAMPy5TY1qubXwhai09f0Tghdm1VQD5Rl+5Jr1bkC1gf/izodJKSNeuR7GralPK2mrfmS3FYAZVv9zB/gNl1P2t/2X1me5r6urTLfbpWLYRSTBvQqrLchvGlFO0md+9K0HBmF4N6FJ35bJP2kvDI/zn3CUnItmn+cW76KPzK2tkKn55ZhWu/DhaNan6Naz2vn5jV9CBcKUubpUBmeULzU0iGJF6xv4Q//xd3oK8Rn16V+u1+bRsCQ73hDa+LgCAhGbciShzI7ohWNHnCIWFgjbdJHdi4sMd+5HwGFNurtAaqjuOB7Rhvw97ipxx/ngFikilt+th0KssdmB8WF/RPgd7zrXI+Z90Im3xrGkB7ewmZ4zGDReINSQ6LBBUGXn59MHwukqyeJgdg+qrmg3BZx91fmXLGjljHnMEmsVs6OnqcoFNaa0TAs7EUvMc+XCcImx5A9EKxjHID3hGFUym6KpIJhqQipVMnlAoMKtdGvsAFqw7tefVIDs3oYN48d0h4IzDf4+CBCgjN+w4dtzG94A+fdTmfyXWwh95//TekwMkXdAhKZ0cgR2GGrQsWLKfMbiSKXOyjuEYt4t7nk6fCpWX7tOr2yFV4W3oO8zuMbpHWO8vdVna16YHVqdKRQbIK33/mQigexaNZs+kKTOjse1v2wU3cUPxGsRJX7/X6sv5b0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(36756003)(31686004)(66556008)(38100700002)(41300700001)(6486002)(8676002)(4326008)(6862004)(31696002)(82960400001)(86362001)(83380400001)(53546011)(186003)(8936002)(2616005)(2906002)(107886003)(66476007)(6636002)(5660300002)(450100002)(6506007)(66946007)(6512007)(478600001)(316002)(37006003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YndWUXB5YlBaSzI2dU5ycUFldjA0Qnk2MjN5OWdkVzNXbG9qcE1oNU5wRXAz?=
 =?utf-8?B?cFdqTzYxRVJMRWdMVjB5UEljN0xEZzVmbVZwSTg2Rzg3WXg4N1VGOC9uVzI5?=
 =?utf-8?B?UGthNWhScWQvcHd6Y3kyWVN4d2ZZZ2xKSXZDTXVlWWVwRlVyRW1xRHV4WXpt?=
 =?utf-8?B?NmxyQXA5WG80ZkY3SjhQRzNIOWd4QmE1M0c3azBFWDlPakwrelpXUXF5RWs1?=
 =?utf-8?B?a3YyTldvcWlTY0JndHgvdGVocGwvakRMdHpadEg4UEJpRUcvOHY2Z2dQTW8z?=
 =?utf-8?B?aHdqZnFZK3l0MHNVaTg4T1VHa0ZhVzNtSTVFT0xZTWhZOG02U3VNekJFTzJq?=
 =?utf-8?B?TFB0TGRveURpQmI0K28wVXpTWlJZQUFNQzUzN1ZvdlMwT0RMVDhwZVVTR0Jp?=
 =?utf-8?B?dmJ6cFA1TGc1UjZZQVd1NTQzZTB0Y2FlZU5ONTc1OC91WXFQR3ZQUE1rZkhw?=
 =?utf-8?B?WXZaWldLcG9DMjlFbHB5YnpUUTlqeW9oY2tUTzIyU2Vqd0lvYk9jWDRkczY0?=
 =?utf-8?B?TXZ3aXY3d084WFhKS05BRWVWU3VBK3k1a1RvM21VeGhIRVZ6cklEaDEzWG1q?=
 =?utf-8?B?Z0NwVVptQTA1c1EzV0RQY01PRmJkOWlJS2czLzBtR0lTaW1GbHN2ZkZhemNY?=
 =?utf-8?B?TzBHaHRVdTczWkdwL243VnZ4U2gyYzQwYmJtZGcvYmVSZHlVdjh6VkQ4T2xW?=
 =?utf-8?B?Ymd5VWhFZW16SGNBcktmSVVmakZhMit0RkkvMG84SjVNUzg4OHJDeEJXWHlI?=
 =?utf-8?B?dHE5Y1lpK3B3UytoRXJXK2EySDJ0QmRNalFpb3hpL0pyN3hrVXNIc3owT3Vz?=
 =?utf-8?B?WHBkTGc2OW5OUHVYOHBEcloxRENkZ3EvWFZ1UUVSSlk3eGhneEp1T29kU2tZ?=
 =?utf-8?B?ZkN0WXdvckpML21sSStZUVFHTG51UTJ1QkRBR0VVaVkwZGh6a2VsY1Z3Qndu?=
 =?utf-8?B?MnRnQzVIZjY4bCtZbjAxTkdQUG5nbThpeCtGY2VSN0N2dXFyVk1wNUxuWFI1?=
 =?utf-8?B?Nnk5cDVXZVllSmtlNHNHSnA0ai9qM2dvS0YxR2lTVmxjcU1zdFJ2Wkk2Mnhm?=
 =?utf-8?B?MUo1ei9LaEJ3L05IdXBZWWtYcDVvcHAxQ0hVUncrZFQzeGZua3VUVG1IQmgr?=
 =?utf-8?B?Ym1qUGNBZkI1clV5eGdjZVFNcitrL0w1NU5valljaFhnTkYzMDlBV0VGbDBK?=
 =?utf-8?B?Z01hUjdFTUR4eERqWXdmL1RJeTZmZ2VlU3NsbC91bWhVVVEva3czeHprVUR3?=
 =?utf-8?B?YWNzRWtOYlBHbnBCQjJXTW5QQ05nM1gxcTgwZFpka3ZiZzduazlReC90S2Rk?=
 =?utf-8?B?WHBLSmx5NkNWOUgvUUlFeWd0Zk5rTGI4c01Ga05RS1FodGJMRG14UWpCV0dD?=
 =?utf-8?B?VDRlMTlDTC9PQ25xU2RqSi8wR21JQWNwcWFPWEFWRWFYL1VYUGdLRXRqcDVW?=
 =?utf-8?B?cTJjNjZHaGIrR0xOOWk0b0t4a0ZxcHBBcEgzS3VmRWpzV2c1bDduZmwwNENG?=
 =?utf-8?B?MVhVT0Jjd1R5YlFYeTlzK09CalJiSEVBREhFemVhMnQyeURBck1DTmpzejFi?=
 =?utf-8?B?V290ZFVtWGMrVzRpMEdQRDVwRk1MQlZ5SlgrRVp1ZHRKY1I3bkgxYWZ4VUY5?=
 =?utf-8?B?SDFoWkMxUWNQeVhMZDVkMjN2RWt0TFk2NW1jbU5JODlhTThQM2ZSZEtGb0lD?=
 =?utf-8?B?OXBVRllrMUl3U0VTRVBwWUpWQW5EeFdZWXlDcTZTOUp6YzllZkVYUi9XYlQz?=
 =?utf-8?B?WGlyTkE0RzhUOEJUMmRuc2tGRnl4U1pxMWJuSklzVGRvMC9oaEJDR1RWRFRS?=
 =?utf-8?B?Vi9pcWNiMnUzQVA2eG15NEJUZ2c0ZjFxd0E1K0tQZkZaU2VSUG9CUXRzT2E5?=
 =?utf-8?B?Vy9lTDJOVExhQkNMeURoWk5VK1hjYVgzd0orSzdZZlU2QU96NE41VStzNHRw?=
 =?utf-8?B?UHpCZ2o4cFFFNWd5UzZCQXpWYlBHNGVsZjIyQTV3eFNxaXQ4Y3JVb2xMU1F2?=
 =?utf-8?B?Z3pWdmVqaUZtQjZPZEdteGJOZHNIUWZDbDlUSGJ5U01CdmZmRHVqd3g3MlZ1?=
 =?utf-8?B?ZEN4eFpqQWRiWEUzTVNqYThZems3eVpHWndIa25GR2dhNEh3ZzNqYXUvSk44?=
 =?utf-8?B?aTdKR0xOdDZRY3A4WEJXZTUycVdWQjFPazd3eFY4ZVdROEZFcEZURjJDU2Fi?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e200721c-2403-497d-7be5-08dab5f74fa8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:38:22.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN5kbV9hXp5szrTVoTCODZRNxKLd+CvYv0rPznZQXYgg/PGfTqR1LaSZ2p6ZE7CXStrLXHnyUot10UP/x40wFm/0QzJaFR6tju/7DFL/9dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
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
Cc: intel-gfx@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/21/2022 10:26 PM, Dixit, Ashutosh wrote:
> On Fri, 21 Oct 2022 18:38:57 -0700, Belgaumkar, Vinay wrote:
>> On 10/20/2022 3:57 PM, Dixit, Ashutosh wrote:
>>> On Tue, 18 Oct 2022 11:30:31 -0700, Vinay Belgaumkar wrote:
>>> Hi Vinay,
>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>>>> index 4c6e9257e593..e42bc215e54d 100644
>>>> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>>>> @@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>>>> 	enum intel_engine_id id;
>>>> 	struct igt_spinner spin;
>>>> 	u32 slpc_min_freq, slpc_max_freq;
>>>> +	u32 saved_min_freq;
>>>> 	int err = 0;
>>>>
>>>> 	if (!intel_uc_uses_guc_slpc(&gt->uc))
>>>> @@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int test_type)
>>>> 		return -EIO;
>>>> 	}
>>>>
>>>> -	/*
>>>> -	 * FIXME: With efficient frequency enabled, GuC can request
>>>> -	 * frequencies higher than the SLPC max. While this is fixed
>>>> -	 * in GuC, we level set these tests with RPn as min.
>>>> -	 */
>>>> -	err = slpc_set_min_freq(slpc, slpc->min_freq);
>>>> -	if (err)
>>>> -		return err;
>>>> +	if (slpc_min_freq == slpc_max_freq) {
>>>> +		/* Server parts will have min/max clamped to RP0 */
>>>> +		if (slpc->min_is_rpmax) {
>>>> +			err = slpc_set_min_freq(slpc, slpc->min_freq);
>>>> +			if (err) {
>>>> +				pr_err("Unable to update min freq on server part");
>>>> +				return err;
>>>> +			}
>>>>
>>>> -	if (slpc->min_freq == slpc->rp0_freq) {
>>>> -		pr_err("Min/Max are fused to the same value\n");
>>>> -		return -EINVAL;
>>>> +		} else {
>>>> +			pr_err("Min/Max are fused to the same value\n");
>>>> +			return -EINVAL;
>>> Sorry but I am not following this else case here. Why are we saying min/max
>>> are fused to the same value? In this case we can't do
>>> "slpc_set_min_freq(slpc, slpc->min_freq)" ? That is, we can't change SLPC
>>> min freq?
>> This would be an error case due to a faulty part. We may come across a part
>> where min/max is fused to the same value.
> But even then the original check is much clearer since it is actually
> comparing the fused freq's:
>
> 	if (slpc->min_freq == slpc->rp0_freq)
>
> Because if min/max have been changed slpc_min_freq and slpc_max_freq are no
> longer fused freq.
>
> And also this check should be right at the top of run_test, right after if
> (!intel_uc_uses_guc_slpc), rather than in the middle here (otherwise
> because we are basically not doing any error rewinding so causing memory
> leaks if any of the functions return error).
ok.
>
>>>> +		}
>>>> +	} else {
>>>> +		/*
>>>> +		 * FIXME: With efficient frequency enabled, GuC can request
>>>> +		 * frequencies higher than the SLPC max. While this is fixed
>>>> +		 * in GuC, we level set these tests with RPn as min.
>>>> +		 */
>>>> +		err = slpc_set_min_freq(slpc, slpc->min_freq);
>>>> +		if (err)
>>>> +			return err;
>>>> 	}
> So let's do what is suggested above and then see what remains here and if
> we need all these code changes. Most likely we can just do unconditionally
> what we were doing before, i.e.:
>
> 	err = slpc_set_min_freq(slpc, slpc->min_freq);
> 	if (err)
> 		return err;
>
>>>> +	saved_min_freq = slpc_min_freq;
>>>> +
>>>> +	/* New temp min freq = RPn */
>>>> +	slpc_min_freq = slpc->min_freq;
> Why do we need saved_min_freq? We can retain slpc_min_freq and in the check below:
>
> 	if (max_act_freq <= slpc_min_freq)
>
> We can just change the check to:
>
> 	if (max_act_freq <= slpc->min_freq)
>
> Looks like to have been a bug in the original code?
Not a bug, it wasn't needed until we didn't have server parts 
(slpc_min_freq would typically be slpc->min_freq on non-server parts).
>>>> +
>>>> 	intel_gt_pm_wait_for_idle(gt);
>>>> 	intel_gt_pm_get(gt);
>>>> 	for_each_engine(engine, gt, id) {
>>>> @@ -347,7 +363,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>>>>
>>>> 	/* Restore min/max frequencies */
>>>> 	slpc_set_max_freq(slpc, slpc_max_freq);
>>>> -	slpc_set_min_freq(slpc, slpc_min_freq);
>>>> +	slpc_set_min_freq(slpc, saved_min_freq);
>>>>
>>>> 	if (igt_flush_test(gt->i915))
>>>> 		err = -EIO;
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index fdd895f73f9f..b7cdeec44bd3 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>>
>>>> 	slpc->max_freq_softlimit = 0;
>>>> 	slpc->min_freq_softlimit = 0;
>>>> +	slpc->min_is_rpmax = false;
>>>>
>>>> 	slpc->boost_freq = 0;
>>>> 	atomic_set(&slpc->num_waiters, 0);
>>>> @@ -588,6 +589,32 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>>>> 	return 0;
>>>>    }
>>>>
>>>> +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +	int slpc_min_freq;
>>>> +
>>>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
>>>> +		return false;
>>> I am wondering what happens if the above fails on server? Should we return
>>> true or false on server and what are the consequences of returning false on
>>> server?
>>>
>>> Any case I think we should at least put a drm_err or something here just in
>>> case this ever fails so we'll know something weird happened.
>> Makes sense.
>>
>>>> +
>>>> +	if (slpc_min_freq == SLPC_MAX_FREQ_MHZ)
>>>> +		return true;
>>>> +	else
>>>> +		return false;
>>>> +}
>>>> +
>>>> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +	/* For server parts, SLPC min will be at RPMax.
>>>> +	 * Use min softlimit to clamp it to RP0 instead.
>>>> +	 */
>>>> +	if (is_slpc_min_freq_rpmax(slpc) &&
>>>> +	    !slpc->min_freq_softlimit) {
> This should be swapped around:
>
> 	if (!slpc->min_freq_softlimit && is_slpc_min_freq_rpmax(slpc))
>
> So we should only have to call is_slpc_min_freq_rpmax if
> slpc->min_freq_softlimit is 0 (that is only once the first time during
> init).
ok.
>
>>>> +		slpc->min_is_rpmax = true;
>>>> +		slpc->min_freq_softlimit = slpc->rp0_freq;
>>>> +		(slpc_to_gt(slpc))->defaults.min_freq = slpc->min_freq_softlimit;
>>>> +	}
>>>> +}
>>>> +
>>>>    static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>>>    {
>>>> 	/* Force SLPC to used platform rp0 */
>>>> @@ -647,6 +674,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>>
>>>> 	slpc_get_rp_values(slpc);
>>>>
>>>> +	/* Handle the case where min=max=RPmax */
>>>> +	update_server_min_softlimit(slpc);
>>>> +
>>>> 	/* Set SLPC max limit to RP0 */
>>>> 	ret = slpc_use_fused_rp0(slpc);
>>>> 	if (unlikely(ret)) {
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> index 82a98f78f96c..11975a31c9d0 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>> @@ -9,6 +9,8 @@
>>>>    #include "intel_guc_submission.h"
>>>>    #include "intel_guc_slpc_types.h"
>>>>
>>>> +#define SLPC_MAX_FREQ_MHZ 4250
>>> This seems to be really a value (255 converted to freq) so seems ok to
>>> intepret in MHz.

yes, GuC returns the value in MHz.

Thanks,

Vinay.

>>>
>>> Thanks.
>>> --
>>> Ashutosh
