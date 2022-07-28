Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C8584699
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 21:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6645710ED74;
	Thu, 28 Jul 2022 19:38:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B3B10EFE5;
 Thu, 28 Jul 2022 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659037130; x=1690573130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kI064CGGvui9vQnGFSdTcUmqtedvY93cICq0H8TeMFY=;
 b=NlqEXmfFSFIQxpBnMTvxRhW5Xj3nxDgCIqlUTTmy4PCVGRvyx51eAvkx
 elPtkl2bb8LRdUkN6vPxEVsLES4Vb3ep4G8cwX7TBpo5GpwYyp0ovVjNY
 qnTn4XhHrJO8lfvd2WS8CD04GziM464u52Tra2P1Y+d5K1Z9Derbl3p1k
 zZMupGVtiOH6yCH5pCobGrRSZMXGarwdO1YGmJJbHDVZ3BxuRFa0+kp7l
 FH8odEEFKwW1WMpA2PKDJoWShGUP553mF3R0IQkV8AaI4E1B/9XaFWh9s
 d3fHLLL62lJjvHf92xdB6XNZxDetHHVozhmP805WBsM2V8auDTzZBje8E g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="289371306"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="289371306"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 12:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="576617753"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 12:38:48 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 12:38:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 12:38:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 12:38:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 12:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn+1PkBkA6cs0spUMWYpd7iJmIRYR1w73pLVXJkiQEZbl7mnc4OBRWyn9pwl66WtvFE8qT4G6hen9e0XwXwmee8lQVxTdp3QFlVYVph8GU/08kRy3MUmwF5WAwc0XXG9SYYajqB86fX30dKtXOB13lH6AM31uD5BQme2k+8E7FE65bnUWdbpHcPshVpTb6XpirAWxJvK9gIWG8tIrde/J1/3eME0eVEvS82QYTBUHjiDNmbBekUPlm5Ms57qDM+MkK8NbpN0zJa2qc0bY/0MUy72NyfRIDyf0xhWdt3tIam9T8K4Drd5Ol0QcYUcZIW3HISM/6CL8mOa64BJ+S+xkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxvfokva8lxuLko/3WSQ6aSb5vIvKjrv6gLg+TNO72o=;
 b=IYLGWsgL1DRHgK2bJuOUTw3KmXIxb4CjReO9rzyf8P7HH1/kBJFd45+uv+RFQFr+FuWZG/ty8LCidnt5QtM7W+5w+eZ2xPRZ/VMm6/+HrDfL2KR4yLwdk9GJKjwOG7ZIAxurWToM8c8q/koZEKr4cQOCw7zHS6lDeea2ACxgjdNcueDZO71JZEMUK8Yu1uLz9vAD6h/U09yGO7aLZYTsigj8Nr3Zy5xIX8sTeTSbbULSHEH+v0ryWC2zL1lpvnK6z0tI3Tn6r3mozNiRN8UAJnthOIyofTiseVVIHxSTLwYYTQBbDC+EVERv9f72eFNTPk1Cux6oLrWH1KkMptzydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH2PR11MB4438.namprd11.prod.outlook.com (2603:10b6:610:4a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 19:38:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 19:38:40 +0000
Message-ID: <23cce78a-7bf7-9881-806a-5ee2da0a6ed3@intel.com>
Date: Thu, 28 Jul 2022 12:38:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/guc: Don't abort on CTB_UNUSED
 status
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-7-John.C.Harrison@Intel.com>
 <d1f3646b-ff37-0120-4284-7861b23e30b3@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d1f3646b-ff37-0120-4284-7861b23e30b3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65acd373-5d32-4021-34b2-08da70d0c5b2
X-MS-TrafficTypeDiagnostic: CH2PR11MB4438:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kdX6FrSUSpt8efy51OeoRlSOYG0+scuRvww1BhGarrO2WHHiJUjGdYsoTfaFaJ6bPtwfhcV+nLKbuM91jT+0vinTT+jHqc1aKmCCPj3pF2DPAPsRo91UlAOazzAU7yo3MhQjmyynydV2FOkUYr3t/SjVXimnoesZIfxK5qT+QLSfUicqxGR1wGrYVh2MWQSXKs7oabRYHMLBtSqGDQg2EtT17qOLFusgrpVx/AAaFuUnKZKXaIT0t4bY7oAfRb+FUQz44hFWTZXbD3fbY7E/zowh71WSJoEN1oyqxTNrICRou+nFRwcDhpgRy+48m/LCxHimfMPooaAopedOCr2emQvXKX93xD8TEMmOAlUJhLpGZbxVeXpAE26j+2Z6fGrQvyH6N4emCrVgixteGg8I60PpfDK/cZ9AtUHRmjHmKeVSBP9WXGJebE5i25lbPOFaZWx/Kqc1W3/T6Fgw1XIP8gGqt77xEEB7FNRN35QxBG2pjIxTqWXMsTOxhihQcFcTyz56b2y69bTdcQryrvAyt25Iu2qqWbIRWjuvjY3xNVvDeHz66VHhB7CTcu1mWTuCJ3P87WSznDvqntruT7tkwI8m9EMstj4MtxVltoCyNPD90mk9I+5gtTLrRkNU9g6s8xWBshcHcuXGwYTRaN26M/1qreorGi3ePGm5Qe9ZMkMJgKwP7C1JcLFlK6pOepgbmskfeGDTFX2u9msEAYID7/LOS2NX9oy0ZoWk0bkZXM25CdrCQQ2foxPKgOdWAD+HG1jRSyhZ9FiHm+SiEKTWNfmZm0NxNeyapHrw8H8LDSkp8f/8lwq0iVMdwa+yAWXu98gKc1bW4XcwnalqFkOxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(396003)(376002)(39860400002)(66946007)(8676002)(4326008)(5660300002)(8936002)(31696002)(316002)(66556008)(6512007)(6486002)(6506007)(478600001)(82960400001)(66476007)(41300700001)(53546011)(31686004)(26005)(86362001)(36756003)(83380400001)(186003)(38100700002)(2616005)(450100002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW5aZzlheHk4bTFGc2tqYVVVR1BTZi93SlRDTElENVcyNExCU3dybVJhUVlC?=
 =?utf-8?B?Z0VURzVTUkFMSHpIL0hyZDlYNHQwOXhwbXZVRkpkSTJxclV0U2RxU01YYU0w?=
 =?utf-8?B?cDJaMVpPVkNEbWJad1JWSHIyM1FWR21zeGNiS2Y3SXk4TFpOYStMSlVUckpT?=
 =?utf-8?B?bnU2WEprbUJ6TlVYWkNWUDFGVnlXcEFJRHJ2ZFFMN3p3SzJOQlBDZG12R0VH?=
 =?utf-8?B?TnBNRm9OUmV5ZGNYR1N6bDA4VnllODM1Z2ozdVFOTndDcDBvRGhXSWdLNE51?=
 =?utf-8?B?THJhTjcybityeFd2Vjl3YzRpSWJZRTdhVzBzK0lpdUI4L21KV3NIdHRYc090?=
 =?utf-8?B?RjR2c3BLR28wRXUxVGcrZ0ozMGpCaW1CT2grS2NDcEhJa25Za2FMUW1uRjBu?=
 =?utf-8?B?YUZaQ3ZUeU81eWdoNFpKVWVrcy80ZW9QQytqdkNVdm5PZWFTTk1VNlVSd3dp?=
 =?utf-8?B?M0xpdWcxdUJFWU54U2M0MmFqRHc2NU5Nenp3YlVWbUsrT25RVnBNQmI2UTlo?=
 =?utf-8?B?dkdsTlYvSEhTMFdYU2ExajZsRzVsZk9jL3R2cHZ3VEJCR0dLeU5la1hXQkdD?=
 =?utf-8?B?dWtMQVVwYWI3ZWxsQVhqOXdSMk5UbWVHRVNEN1ZkMzFHTmNUYVJaWXJka0Yz?=
 =?utf-8?B?RExadlgxSUp6NEh0TG4vMTBZVVlPeXhGWU5MWjNNRmZMSTRualdrVVlkbVll?=
 =?utf-8?B?bDEvMlJrS3Z0NWxISkt1QzNpVUUxb1QzZG42cGNoTG43bjFNZ2dBSEpvQ28w?=
 =?utf-8?B?VHVhZEJMYllXVXRJMGgyZWNYeGpDSXJQYTIxNEJ4d2JmV3p4T0xUbTJUOXo1?=
 =?utf-8?B?RTBzNDV5L1NJYlhwMFM3QWxpTnhOWG1KR3dGdG9KZkRROFpIdzF6MzRLWkJr?=
 =?utf-8?B?bHFOSzhOMWI2a002ZG5tSWJSSUdPRDgyeEZ6bFFCRzJvVEJITWlnKzFET1lo?=
 =?utf-8?B?OS93MkVVR0wxb2xkL2hSZ2pTazhueUZJMnUxU0Vic2o1OEFNS1hJT2F0ZGxk?=
 =?utf-8?B?a0V1SzE4ZmVhWVlRZjVPaWs2YVhJU2NRR1lxWE5KV0wvdlNPY0c0dXJQVnNt?=
 =?utf-8?B?a2EwK3FRaGxuRUhrdkxEZ1NlUkNJaUc3cWlobXU5bmplYzVIbUdBV2JQakI5?=
 =?utf-8?B?eGlYdmI5NUhSWEMvaUZXVnlzYmloNkQ5U0xoMllqWHhIQnBFZitob3F3Qi8x?=
 =?utf-8?B?eEEva3hjRmZMOEVWWnBOQTdFV1JINjcyUHpVNmp1dHNmT25IVFdkQjk1bldu?=
 =?utf-8?B?YzVhdXhCelpINXIwU0QzK3VEdlFWc1Q5V3BMVmhST2NlVTlVcEdyeGo4Q3Jl?=
 =?utf-8?B?S3RIVUtVV0ROZjZ3STFGZitYSm9NdkZJOWlNa2QrN05aZHRCdVdMYy9reURT?=
 =?utf-8?B?SlB5ZXo2SGJjWVJkcVQ5UnJNRzRzdUdZS0ZKQWNKOXQ0K0lNc2dTWnZzWHFv?=
 =?utf-8?B?SnZJeFBtTFNJMTVsa2ZHNEtnTWRuVGxHVGNzOGM0cGc2WHo5aDIySjh2UG8y?=
 =?utf-8?B?N2NOaU1oNkxoNldsV0t4dmdmdTM5anNQa1BzZllCSnByT2cxOFZBOFZrTk5K?=
 =?utf-8?B?VWxnNVZlSFAzekRxSDVBdzF6ZVhHN3h4aUh6dXBDeDQ0QXo1djJORGtvSjMy?=
 =?utf-8?B?R0lqbk9UVGZhRy9hVGdYclRRWUNmRlN5UVZBa0xFbndCbDhvcUQ3V3J2WmpP?=
 =?utf-8?B?N0NhelRVcXRxVmt0bi9zdnRpRXg4R2Y4SFMybkpFMnBQS0Q1WHEvSGlwSVFW?=
 =?utf-8?B?TDVZaU8rUHVncmF6MlRFMXdPU2JPcXFyMnZpN2hmaVlHUGx4a2VXUnpObHRx?=
 =?utf-8?B?VHBxUWNKOG10V3VpeXVsdUFOUEI3djZ5MVhpcUVieVB2UkhoNjczazR4QWM1?=
 =?utf-8?B?WWdqbVpiOTlHT3FKVDZ5SkZVOVdWTm5xQzFYbXZtUXoxeTRYdHZkNWtZWHZH?=
 =?utf-8?B?ai9rUU1uU1lubGJhYVRENEMyWktadG5jT3NSSDV6YmVYQWJ4TWtJeWFSTzIr?=
 =?utf-8?B?REk1Ui85MmRFaFpSaHBDNmlaT1lwc1llWjdBc0k1cjEyK0lUTURDUFo4Y2N3?=
 =?utf-8?B?Tkl6SWQwbVVuSVpzRkFKU2xIUzZPUkMrK1FNQjh6S0RKZmU4aldUYWtsQ1hT?=
 =?utf-8?B?QzlBdnhldGFNb2k4UkxUcythWnN3MDhNUGZjK2pDWThsSk1WQkJZNmpZU2VB?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65acd373-5d32-4021-34b2-08da70d0c5b2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 19:38:39.9895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuE4By4yUcPlX4rPCVg4Q2mVqtedT5QLQcYKIXeWIG11gIAXCp6GMvkmOXAN+drNC3WRt+Zx20uGhT/ri5xeJZ24St+xB18sf/l8qwW6LDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4438
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

On 7/28/2022 12:06, Michal Wajdeczko wrote:
> On 28.07.2022 04:42, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When the KMD sends a CLIENT_RESET request to GuC (as part of the
>> suspend sequence), GuC will mark the CTB buffer as 'UNUSED'. If the
> hmm, GuC shouldn't do that on CLIENT_RESET, GuC shall only mark CTB as
> UNUSED when we explicitly disable CTB using CONTROL_CTB as only then CTB
> descriptors are known to be valid
GuC very definitely does do that.

>
>> KMD then checked the CTB queue, it would see a non-zero status value
>> and report the buffer as corrupted.
>>
>> Technically, no G2H messages should be received once the CLIENT_RESET
>> has been sent. However, if a context was outstanding on an engine then
>> it would get reset and a reset notification would be sent. So, don't
>> actually treat UNUSED as a catastrophic error. Just flag it up as
>> unexpected and keep going.
> we should have already marked locally that CTB is disabled, either as
> part of the explicit disabling of CTB with CONTROL_CTB, or implicit due
> to issued CLIENT_RESET, but in both cases we shouldn't try to read CTB
> any more, even it there are any outstanding messages ...
>
> is this due to a race with ct->enabled ?
As per review comments on previous revision, it was only hit during POC 
work of a hardware w/a that led to the G2H processing code being called 
even when no G2H message had been sent.

And you can't mark the CTB as disabled before sending a H2G message. 
That would result in not sending the CLIENT_RESET H2G at all. We do mark 
it disabled after having sent the message. But there will always exist a 
potential race condition where GuC sends us a message before we get that 
far.

>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  8 +++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c      | 18 ++++++++++++++++--
>>   2 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> index df83c1cc7c7a6..28b8387f97b77 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> @@ -37,6 +37,7 @@
>>    *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
>>    *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
>>    *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
>> + *  |   |       |   - _`GUC_CTB_STATUS_UNUSED` = 8 (CTB is not in use)         |
>>    *  +---+-------+--------------------------------------------------------------+
>>    *  |...|       | RESERVED = MBZ                                               |
>>    *  +---+-------+--------------------------------------------------------------+
>> @@ -49,9 +50,10 @@ struct guc_ct_buffer_desc {
>>   	u32 tail;
>>   	u32 status;
>>   #define GUC_CTB_STATUS_NO_ERROR				0
>> -#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
>> -#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
>> -#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
>> +#define GUC_CTB_STATUS_OVERFLOW				BIT(0)
>> +#define GUC_CTB_STATUS_UNDERFLOW			BIT(1)
>> +#define GUC_CTB_STATUS_MISMATCH				BIT(2)
>> +#define GUC_CTB_STATUS_UNUSED				BIT(3)
> nit: our goal was to use plain C definitions in ABI headers as much as
> possible without introducing any dependency on external macros
Except that checkpatch complains like a complainy thing.

>
>>   	u32 reserved[13];
>>   } __packed;
>>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index f01325cd1b625..11b5d4ddb19ce 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -816,8 +816,22 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>>   	if (unlikely(ctb->broken))
>>   		return -EPIPE;
>>   
>> -	if (unlikely(desc->status))
>> -		goto corrupted;
>> +	if (unlikely(desc->status)) {
>> +		u32 status = desc->status;
>> +
>> +		if (status & GUC_CTB_STATUS_UNUSED) {
>> +			/*
>> +			 * Potentially valid if a CLIENT_RESET request resulted in
>> +			 * contexts/engines being reset. But should never happen as
>> +			 * no contexts should be active when CLIENT_RESET is sent.
>> +			 */
>> +			CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
>> +			status &= ~GUC_CTB_STATUS_UNUSED;
> do you really want to continue read messages from already disabled CTB ?
> maybe instead of clearing GUC_CTB_STATUS_UNUSED bit we should just return?
GuC could have sent us a valid message right before shutting down its 
end of the CTB. We should still process that message. Note that the 
clear is only of the local status variable. The CTB itself is still 
marked as closed by GuC.

John.


>
> Michal
>
>> +		}
>> +
>> +		if (status)
>> +			goto corrupted;
>> +	}
>>   
>>   	GEM_BUG_ON(head > size);
>>   

