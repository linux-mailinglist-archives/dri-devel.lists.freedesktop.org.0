Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AB6787E8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785D10E564;
	Mon, 23 Jan 2023 20:35:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F0C10E560;
 Mon, 23 Jan 2023 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674506119; x=1706042119;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ws8JkEOLUKfFhhqkmQRu55EwPKs3jCtkphDIoe2pip0=;
 b=N+H9z6/GcFkK2FEhsJIF9pAsgXqCr+wBVCMOeLVOmfS2CUA7W49shza2
 Vv/DbWMiK+Oo6PrcYxQpiVKeW7Cndaji1Fnu+57OQmcPWq/JPrdtMlFOt
 bcpaSi+8yvLF+oRgLVolojCK+QyGDTHS018++9XZMWuSXznO/YZAhjlIV
 s1pQUV74CD9lSTfFmb0jnoCgsDh5b9PzK+/zZzCJP/v40s3V+S5Rit/Yr
 3Qj9Hqp8Zu/dFBB1vSQKrE0YqErpVyWUFj2GHmzmntWB3nhHGp/oV17xb
 9jKzn1FrCAhaATn/rVb8XxaY5bv6WwOAvv7QQ6md166fMpj8mqjPrkv7b w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="326179619"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="326179619"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 12:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785796261"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="785796261"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 12:35:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 12:35:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 12:35:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 12:35:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 12:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLk/zicjUIR8DlxH097HxTiY6x0pa7c/PYnCrlBZ8od/iS8yteCqNCv8x7V2CTB5Xg6s58lHSvN6G3sHTlEDivxWxIYRlchJTOukDA7y+kdW+76ZYAReyxpXdH+LOdPVxkY6Ld4TsvmkUSYGecih6gCAqVw0QnTNqaMr3XOe1bJKP79nMGbEOo4VBLersa3hHHKiiWSrZWbEcbraYHZgX1wczyNsGay75E42yFKJTSxiql8HSlU5yIkGp4cASjQLpnvZZISmoUtEs0yXTp1oPU21QRjSnlq/AIpi3bRPvxR29tLX4ouMrD1hTLdOKxlv7KLtW8nSVJrhgJdZFV6T3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARqmCC+6dL+/kwjSDJVDhPlo6ctURJuf8y30j8xbLhc=;
 b=YmS3JXTZsk1apw62NBlKzIqzlaJHSmn+Sn1gzKqccnpXjtNkUGt8EnwTDVl22p8WlBpQuDDjobkDeqqdJOIsBJnUZ88CQHuA0oPAttDwOMH2gfQM/03P/yOv44XsKqriKnl0WWuwQnnAb6bOqowJgbmq5uajrFpTqgsRG5KPkNQIWKlJ6fC7FNSWM58MA8IBkczdDoqPZZJAVCViClND7uitnkUydaU/7jW/7eql4rUFqkUCMmlaUk0Wta4asKIV2ayWvgcI9tNBk8StU2iHiWMc1e6k+pn50P0Y4cHcJbb5P1gSE2Fz8wUYR5AFZ5kgtIxS+Sg4f/85daGOSCRbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Mon, 23 Jan
 2023 20:35:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 20:35:13 +0000
Message-ID: <780c4024-4691-66d7-2894-ccae19c4bb0b@intel.com>
Date: Mon, 23 Jan 2023 12:35:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/7] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-2-John.C.Harrison@Intel.com>
 <fd011cd7-7212-ff77-0e1d-56cdc1372e3a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <fd011cd7-7212-ff77-0e1d-56cdc1372e3a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3484c5d5-0272-43a3-53b0-08dafd815454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jio3e5BWiXU29uCjsQUeTVHVjnjqtKGjNIQciQge1k4p9295jYMp3VLE0fL2zcNVjz2lM0MzBeTWfvY6wFnmytIjZIC5qlXeiNBjvGnmnm/sB7u6WMfs/lnh+LUq3z5OyuauazEYRLSGr7deehnrKZjifJCv1VspWuhj01c4WsyVEpGmAM2Zw/GKMHmaAqU+ZNUStnoQRBIBQCzLV+gV4OSAkg/xEp+2a6vWVspq/X7Ae52cq0cHJAGxOQc37j9p3EqGrFjXHqwOqJDf4cFwy+GNZqToTcMHToBYXRLSpWR0t+4E/FnIbp/9wIAWL90SMFrcrvludx1XF+hNvExjjJQJlnHWJZ7m8LtL0537mAwsT1pwEtFYOzmVG687NiwacxbGJJdY3cyBPIhIcbTwx0krku+8+9ZGo4C5wmHOQYx2YE2/whzz4ySlWLzNT9p2yYn4PVfh0XP7ZeaiNrkdWyqI6gFEdqdGctbBanqE89p65rgVkGISlCXLHs9EBygTJ4XKuFNmn0rarhSJ94Mh6YCyT2cG5NjOuOQImZwlM5LRx08TWVCOYRfFVkG/ogQUuYkGorG9gULCtwZDBnaMgMeyea5jGj/32kBK8VzFs+HvTbSWp0LCD2pgj3U/8DEyM0iyLsyUqxer0ZFycjpJ7o3R7AET1r19KnjF8WYiWcqBpV2mS9wYi15tZ000sKIWa5sJ+bCZmhp/eWmIBox+vc8XJpwlgLmh23ZvUG75JC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199015)(8676002)(5660300002)(66476007)(82960400001)(4326008)(316002)(53546011)(66556008)(2616005)(36756003)(6506007)(41300700001)(8936002)(38100700002)(86362001)(83380400001)(478600001)(26005)(6512007)(186003)(31686004)(6486002)(30864003)(2906002)(31696002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFhWd3pDS1BWU1F5a2poMEc1ZVFPczVWK1pjS0xRMGhHRC8yYS93dEI2b3BH?=
 =?utf-8?B?eFNmQWF4aGZuWWx4dnhNU2pTT1A3REVJMWEzK1FLWCtyR3pvclJGQXdoK1lX?=
 =?utf-8?B?d2Jub1NTdEhhUk0yMjVGc2I2ZTlyRGprMGw4MXdpWHRndnBNaDNKNkZ0czhh?=
 =?utf-8?B?cHd4NWVDM0RSa3c3ODM0c085c2xwc1FpUTBUS3QwMXAvYTZuSytlNUVIbHVC?=
 =?utf-8?B?WFR3SitxV2FrQUkxV0lyUlI2Q0E1MDNRU2N0aWZCb2VZczVDOWg3S25tTERH?=
 =?utf-8?B?Q1c0SEZPWmxDUkpSV1JkK1B5cWp1MjAvQjBMYWZ4YkN0M0lLK3VhUG9BSGZM?=
 =?utf-8?B?dUtFL1AyTGRNRFdVbTNIbzQ3a2M3VDltV0FLM3dxWDRxVjZyL2RDQ3cvQytt?=
 =?utf-8?B?VklaZWR1UUhTNlp5WWNCWTJtZnBkZXJwK2g5MnR5L1FjWUY5dEI1SCtWZ3N2?=
 =?utf-8?B?R0xGNlMyeVArYW91L1JqVmIzT09udHArZEFOa0svbk1TcTFqMkkrMkczYmVD?=
 =?utf-8?B?OXBrUXlEc2lycnZYZUNvZ3pxVjVRWVhYbmFMYjVuTWlTN2xoN3FiS0d1TFhP?=
 =?utf-8?B?d3Y5VG1PU2p5T0pTcWJmQWxHNHhJV2pXdVgyNCtWVituNnlxWS9UdjM3QkRL?=
 =?utf-8?B?RGhQekxQT1E3MFEvMnVvckpYNG1EZUVYajZTYzZhN3gxVERGZ3pEaFF2UVNx?=
 =?utf-8?B?bjZHMEpjN3c4SzA1T1VWNmFLaUFaWkxzckN1MExORlkxT1haQitSb0l2LzdF?=
 =?utf-8?B?dlBqZFBKTENkOGpwREVKSzB1aEFndk1EQnlSZ055WXFNMngxMEIvdWUrdHgz?=
 =?utf-8?B?YU5temVrd2JkcmtldTUveldBUnVDNitVeENKdGlMOVN0bFhDQjdHTFB4SEs0?=
 =?utf-8?B?NndFZ2pjNnJmVy9ITW1yOFVHZ0l1QTVhK2Q1Z0d6YVQyTWoySHBJRERGemN2?=
 =?utf-8?B?NkcyU3hZTXlVNFFqNzRlMW5aRGh6RGF0blVPMHZDc2IyUVA0OHJ3QTM2L0dC?=
 =?utf-8?B?cEtwQW14azhaOXZIeXhNUXV0OEtMcC9QYjNrQ2VPaU5GNTFyUkVuVXFaSkVF?=
 =?utf-8?B?VGR4L0ZQOGhyY2JRL25yQVpBOWpKMkdCNzg1c2ppRzFGZFBwTUtlOFNqaU9m?=
 =?utf-8?B?UWp0a0ZQc1pXVmpCQlZlYm5IdmYvaFJZTzlxSlFmOXZWQ0lPTjF1R3VtZU1u?=
 =?utf-8?B?N0JKTUN4TEoyMVczRHFTZm5makhrTlNTZ2RHSVdmaVYreFFZSXU2ZGFPcDR4?=
 =?utf-8?B?N1AyNmlJNUFSWHpCQkFGdVBqQTZlSHZVRGE1QnlwaVIrNGNzdWFualMvOFpn?=
 =?utf-8?B?VHBpWW91WXd4bW1QMlNRSnNWaUlYRzJON1FpbUZPbTJ4WnJLZXY1N3JZNG1J?=
 =?utf-8?B?L0JpckhMekpjcHpvQUVkNysvZWFoUXVHaXJWdlF5UEhHTW9Hb0tZZ0hNcTBl?=
 =?utf-8?B?MmRJcUZhTmJ5Y2NBc1FYS3JYLy84b0dtbmdNWTd2N0ZPeXFOazlMVXRqZDVI?=
 =?utf-8?B?NXVaK0JmVGQyUkExYmk0TW5NbjJsMm9VTm55T1hrMkFIYzFkeUtmUDRMQXZ4?=
 =?utf-8?B?Rmd3QjlYUXB4blc4VUZEQlJHSTFpamR0RUdIRndqL3VPZTg2LzZScGF6SkIv?=
 =?utf-8?B?MmUzOFVtb203SGVWa3ZtZkpqL3JnZ2t5eGJ0VThabmhXVTl2Y2V5RWVUd1RK?=
 =?utf-8?B?aVlPdTZ3dHM1c05QZVFPUzVXelgwSU52dHJSMko4S25JQjRRb2Q0QzlQa1cw?=
 =?utf-8?B?dllPRTNaSTNMTFF4SytQSkVMVElzdU5YREI0d2ZMQkhZSXZkMDNBU2w4TzRS?=
 =?utf-8?B?NklSTnZGZE4wUjNqNUM4R3ZJVXgyZDdCYll0NDJSd09pQk5VWE50YUE4bzli?=
 =?utf-8?B?QzM5NGdieVFFdnRRV2Z2WUZrZXVSV1QrNUR4Z0ZJZHJjVllvOFlGWUtST25N?=
 =?utf-8?B?L3htOFZHZzhWYWtxbGRSQmdUdW1IME85RWcrNGMxSEVmdWxhangvSlc0TVFk?=
 =?utf-8?B?VDZLYlkrVStFaWxBbTh3NjN1L0F4LzB1bjZzajl6RE9WVDhJb1IzODhLTlo3?=
 =?utf-8?B?NGhDbGVSY0pKWm4zaWZRRCtydHA3Y0hOcSs0Y0ZKVFQyVTJTSkREZ1Z3Vmpr?=
 =?utf-8?B?RHB3WXBONUYvdEN5R2t6ZUZVTVVWZnZJNGlEQVk3TU92eDdvV0E2U21DU3J3?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3484c5d5-0272-43a3-53b0-08dafd815454
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 20:35:13.5642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvzF1rSocbZaFGnY8XAOfp+ePGideYQKEVrUOaXrleb1ibAxriIAeyox7oikfQu24+zPY8AbEhlKm6jry6xr4beqCvZVHgBgeKGnzUClIn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/2023 09:51, Tvrtko Ursulin wrote:
> On 20/01/2023 23:28, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When GuC support was added to error capture, the locking around the
>> request object was broken. Fix it up.
>>
>> The context based search manages the spinlocking around the search
>> internally. So it needs to grab the reference count internally as
>> well. The execlist only request based search relies on external
>> locking, so it needs an external reference count but within the
>> spinlock not outside it.
>>
>> The only other caller of the context based search is the code for
>> dumping engine state to debugfs. That code wasn't previously getting
>> an explicit reference at all as it does everything while holding the
>> execlist specific spinlock. So, that needs updaing as well as that
>> spinlock doesn't help when using GuC submission. Rather than trying to
>> conditionally get/put depending on submission model, just change it to
>> always do the get/put.
>>
>> In addition, intel_guc_find_hung_context() was not acquiring the
>> correct spinlock before searching the request list. So fix that up
>> too. While at it, add some extra whitespace padding for readability.
>
> Is this part splittable into a separate patch?
I guess it could but it seems closely related to all the other locking 
fix ups in this patch.

>
>>
>> v2: Explicitly document adding an extra blank line in some dense code
>> (Andy Shevchenko). Fix multiple potential null pointer derefs in case
>> of no request found (some spotted by Tvrtko, but there was more!).
>> Also fix a leaked request in case of !started and another in
>> __guc_reset_context now that intel_context_find_active_request is
>> actually reference counting the returned request.
>> v3: Add a _get suffix to intel_context_find_active_request now that it
>> grabs a reference (Daniele).
>>
>> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full 
>> GPU reset with GuC")
>> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context 
>> reset")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Michael Cheng <michael.cheng@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Bruce Chang <yu.bruce.chang@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_context.c           |  4 +++-
>>   drivers/gpu/drm/i915/gt/intel_context.h           |  3 +--
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  6 +++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++++-
>>   drivers/gpu/drm/i915/i915_gpu_error.c             | 13 ++++++-------
>>   5 files changed, 28 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c 
>> b/drivers/gpu/drm/i915/gt/intel_context.c
>> index e94365b08f1ef..4285c1c71fa12 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>> @@ -528,7 +528,7 @@ struct i915_request 
>> *intel_context_create_request(struct intel_context *ce)
>>       return rq;
>>   }
>>   -struct i915_request *intel_context_find_active_request(struct 
>> intel_context *ce)
>> +struct i915_request *intel_context_find_active_request_get(struct 
>> intel_context *ce)
>
> TBH I don't "dig" this name, it's a bit on the long side and feels out 
> of character. I won't insist it be changed, but if get really has to 
> be included in the name I would be happy with 
> intel_context_get_active_request().

Personally, I see the 'find' component as meaning it is a search not 
just a dereference of an existing pointer and therefore being a useful 
part of the name. I don't think there is a simple name that encapsulates 
everything that is going on here. But I don't feel too strongly about it 
if you really think the shorter version is better.

One could add some kerneldoc... but it would be almost the only function 
in the whole of intel_context.h with such. Not sure if that is 
intentional because "obviously it should be obvious what a function is 
doing by reading the code and documentation is a waste of space that 
gets out of date and inaccurate" and we aren't meant to kerneldoc 
internal behaviour or if it's just the general lack of documentation for 
any driver code.


>
>>   {
>>       struct intel_context *parent = intel_context_to_parent(ce);
>>       struct i915_request *rq, *active = NULL;
>> @@ -552,6 +552,8 @@ struct i915_request 
>> *intel_context_find_active_request(struct intel_context *ce)
>>             active = rq;
>>       }
>> +    if (active)
>> +        active = i915_request_get_rcu(active);
>>       spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>>         return active;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h 
>> b/drivers/gpu/drm/i915/gt/intel_context.h
>> index fb62b7b8cbcda..ccc80c6607ca8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
>> @@ -268,8 +268,7 @@ int intel_context_prepare_remote_request(struct 
>> intel_context *ce,
>>     struct i915_request *intel_context_create_request(struct 
>> intel_context *ce);
>>   -struct i915_request *
>> -intel_context_find_active_request(struct intel_context *ce);
>> +struct i915_request *intel_context_find_active_request_get(struct 
>> intel_context *ce);
>>     static inline bool intel_context_is_barrier(const struct 
>> intel_context *ce)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 922f1bb22dc68..fbc0a81617e89 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -2237,9 +2237,11 @@ static void engine_dump_active_requests(struct 
>> intel_engine_cs *engine, struct d
>>       if (guc) {
>>           ce = intel_engine_get_hung_context(engine);
>>           if (ce)
>> -            hung_rq = intel_context_find_active_request(ce);
>> +            hung_rq = intel_context_find_active_request_get(ce);
>>       } else {
>>           hung_rq = intel_engine_execlist_find_hung_request(engine);
>> +        if (hung_rq)
>> +            hung_rq = i915_request_get_rcu(hung_rq);
>>       }
>>         if (hung_rq)
>> @@ -2250,6 +2252,8 @@ static void engine_dump_active_requests(struct 
>> intel_engine_cs *engine, struct d
>>       else
>> intel_engine_dump_active_requests(&engine->sched_engine->requests,
>>                             hung_rq, m);
>> +    if (hung_rq)
>> +        i915_request_put(hung_rq);
>
> Argh... this is so horrible - not your patch - but the existing state 
> of GuC backend was plugged in. I honestly don't know what to suggest 
> here at this point... Above we have:
>
>     if (guc)
>         intel_guc_dump_active_requests(engine, hung_rq, m);
>     else
> intel_engine_dump_active_requests(&engine->sched_engine->requests,
>                           hung_rq, m);
>
> As per your analysis the execlists code wants one lock held over that, 
> especially when it calls intel_engine_dump_active_requests, which the 
> GuC backed will also call from intel_guc_dump_active_requests (!) just 
> needs a different lock held around it.
Because the lock is effectively the backend implementation lock, not a 
top level driver global lock. So each backend has its own private lock 
around its own private data. It just so happens that both backends have 
a vaguely common list of tracked requests that can therefore be dumped 
by a common helper, even though the lists are managed completely 
differently.

>
> Is the lock held by intel_engine_dump over the call to 
> engine_dump_active_requests truly useless in case of GuC? Or just 
> wrong scope (too wide)?
Basically, yes. So far as I can tell, it is useless. It is locking a 
list that is only used by the execlist backend. The whole thing is a 
mess. Execlists was the only way to be and so ruled the universe. Then 
GuC came along and said 'hang on, that doesn't work for me'. Much 
horridness ensued.

Roll on Xe with it's correct layering...

>
>>   }
>>     void intel_engine_dump(struct intel_engine_cs *engine,
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b436dd7f12e42..ad4b2848b0f83 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1702,7 +1702,7 @@ static void __guc_reset_context(struct 
>> intel_context *ce, intel_engine_mask_t st
>>               goto next_context;
>>             guilty = false;
>> -        rq = intel_context_find_active_request(ce);
>> +        rq = intel_context_find_active_request_get(ce);
>>           if (!rq) {
>>               head = ce->ring->tail;
>>               goto out_replay;
>> @@ -1715,6 +1715,7 @@ static void __guc_reset_context(struct 
>> intel_context *ce, intel_engine_mask_t st
>>           head = intel_ring_wrap(ce->ring, rq->head);
>>             __i915_request_reset(rq, guilty);
>> +        i915_request_put(rq);
>>   out_replay:
>>           guc_reset_state(ce, head, guilty);
>>   next_context:
>> @@ -4820,6 +4821,8 @@ void intel_guc_find_hung_context(struct 
>> intel_engine_cs *engine)
>>         xa_lock_irqsave(&guc->context_lookup, flags);
>>       xa_for_each(&guc->context_lookup, index, ce) {
>> +        bool found;
>> +
>>           if (!kref_get_unless_zero(&ce->ref))
>>               continue;
>>   @@ -4836,10 +4839,18 @@ void intel_guc_find_hung_context(struct 
>> intel_engine_cs *engine)
>>                   goto next;
>>           }
>>   +        found = false;
>> +        spin_lock(&ce->guc_state.lock);
>>           list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>>               if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>>                   continue;
>>   +            found = true;
>> +            break;
>> +        }
>> +        spin_unlock(&ce->guc_state.lock);
>> +
>> +        if (found) {
>>               intel_engine_set_hung_context(engine, ce);
>>                 /* Can only cope with one hang at a time... */
>> @@ -4847,6 +4858,7 @@ void intel_guc_find_hung_context(struct 
>> intel_engine_cs *engine)
>>               xa_lock(&guc->context_lookup);
>>               goto done;
>>           }
>> +
>>   next:
>>           intel_context_put(ce);
>>           xa_lock(&guc->context_lookup);
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 9d5d5a397b64e..5c73dfa2fb3f6 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1607,7 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
>>       ce = intel_engine_get_hung_context(engine);
>>       if (ce) {
>>           intel_engine_clear_hung_context(engine);
>> -        rq = intel_context_find_active_request(ce);
>> +        rq = intel_context_find_active_request_get(ce);
>>           if (!rq || !i915_request_started(rq))
>>               goto no_request_capture;
>>       } else {
>> @@ -1618,21 +1618,18 @@ capture_engine(struct intel_engine_cs *engine,
>>           if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>> spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>               rq = intel_engine_execlist_find_hung_request(engine);
>> +            if (rq)
>> +                rq = i915_request_get_rcu(rq);
>> spin_unlock_irqrestore(&engine->sched_engine->lock,
>>                              flags);
>
> Is it possible to consolidate this block with the one in 
> engine_dump_active_requests? They seem identical..
You mean as per the next patch that replaces both blocks with a common 
helper function - intel_engine_get_hung_entity?

> <snip>
> If locking can be untangled to work correctly for both callers.
The next patch reworks the debugfs dump code to have correct and minimal 
locking. That allows the search to be extracted into a common helper.

John.

>
> Looks like I can't do a quick review on this but need to set aside a 
> larger chunk of time. I'll try tomorrow.
>
> Regards,
>
> Tvrtko
>
>>           }
>>       }
>> -    if (rq)
>> -        rq = i915_request_get_rcu(rq);
>> -
>>       if (!rq)
>>           goto no_request_capture;
>>         capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>> -    if (!capture) {
>> -        i915_request_put(rq);
>> +    if (!capture)
>>           goto no_request_capture;
>> -    }
>>       if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>           intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>>   @@ -1642,6 +1639,8 @@ capture_engine(struct intel_engine_cs *engine,
>>       return ee;
>>     no_request_capture:
>> +    if (rq)
>> +        i915_request_put(rq);
>>       kfree(ee);
>>       return NULL;
>>   }

