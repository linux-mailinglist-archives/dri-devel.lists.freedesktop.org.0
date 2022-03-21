Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E957B4E3040
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 19:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E499B10E389;
	Mon, 21 Mar 2022 18:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865BA10E381;
 Mon, 21 Mar 2022 18:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647888674; x=1679424674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=liNSd2xa+lJ4SS3qV9QWDSj8MrY6Z3a5C88xdFlFR1M=;
 b=mNIq2TkLi7p0jEZMnZOa3EvnjNUhwrxhqqB3TlKoAloU5N/teTpF5BeL
 ivWJb/K+pM6SYXHjeNETvuhluA7PX2tJ7UAeluTyDMiinHx3znD1AWCL0
 X7R2nuwewhzl+l+wYSN/32gsiUbI7mCQbjeMZ+7X9PspHn+m5PPmA5QAk
 ORZqrvdi3L5VOwJj6MzOMwG+hU2/12KBo21Rh5a8KjgAB/ZB/lBrusU0X
 Cv2BnD9s2wnNBL7Qv7ZcO1ExdVWYTAIv+T24xsozTDTJXL7RcgnzNyWht
 BYcXNVPjlU0fjkTOaI8k1ZSaHey6KWoVXvzAIyIHeP2TA/WeXwPHZ8SRH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344055816"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
 d="scan'208,217";a="344055816"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 11:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
 d="scan'208,217";a="646708118"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2022 11:51:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 11:51:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 11:51:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 21 Mar 2022 11:51:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 11:51:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyiB8yBFydjUovi1bxj3DnZUDdHFRh+WENj5l+iHUD0xFCpcE+Ik+mj1O3aD0TMga7egR82l3l7enm04bXRPnk7+aHvefbd0UE03zy+qNKq7td4mv6go9Jx76y+U0P94osgKGOLbHcIRQU4rRUD/QNGACDDQzQXUnDDmPJvgyqwue3VndrX8d2Np5UWaxSNvFFA3JfZQnc3OYHQD6h3AKHYAXEGH7VfVHMOxwn0pKXy2hDrU13L3ZrG0LKBW+EULW7dNXjMhurWbRE5Qxp6XwsKNZEbZDK4sZTzUR6umQwwbdS9FYzA0IAIKJ+Gu78ljItfIjJmQ6DNKJC9tzoGGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/b8wDn6iayENnDLhZi8xAUuevTNyx5gr3lVmFmQxDY=;
 b=SuCR++EO3f5A3CC2ZRltKPWIxtDq8mT/kEUbTmppxlcipRr5Cwq9MeNz/aLoGOx1qloeli/Tl0+xGRWk/L1jpHSrlJE+/cwHJZBjJg8uDA4GRMlQC68EohdgnD27i6dHhi748lUy72cfZlpMG67wEj8+l1k9I2wiBd6Je/q9OUTj+c/9REx+KzjfNihye4z8W4UQiCy4qgKtqk1PoSvv/59P1tD4O1FGsLlLPPISb/eFstnqGgI2tkX56b/DNicvkhxGUCBfMIliyq/4pPR4depSZzaoYz51w92KFPpn6okAbo8tALlkWBVGnGJ8UDQgw2loluqX6YqAAL5hcc0dug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1535.namprd11.prod.outlook.com (2603:10b6:301:d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 18:51:11 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 18:51:10 +0000
Content-Type: multipart/alternative;
 boundary="------------WOgwwis3QLRvf2mu6gngkujM"
Message-ID: <dc53a249-1a6b-298b-2969-199b97af159f@intel.com>
Date: Mon, 21 Mar 2022 11:51:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
 <b986f2a7-c0d3-b145-dd45-54d25e10a8be@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <b986f2a7-c0d3-b145-dd45-54d25e10a8be@linux.intel.com>
X-ClientProxiedBy: MWHPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:300:c0::13) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4134e523-8187-45f9-b88b-08da0b6bc410
X-MS-TrafficTypeDiagnostic: MWHPR11MB1535:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB1535EABBDAA05FF0E852EE3CE1169@MWHPR11MB1535.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dS9I4lBGNtm0s0idGkH7SMTv0goMCOMWTwIREj/quXV/x3zcLSyIpnPhAd41hB8PytsZrKZSiOUCGG+iRtGEui6b1Po8FstvT9Xsp6kZGMmyc+b77k+B+IY4ZXViWF0cGXL3Sx3i0oaDBv7MoDRcRpo09rrVIZ4Hq5FZ8asQV3qLQHJmrCfYBrumx9K3YqKZeNH8cJJy1WnIqLU6VG/sT3magb6oil4zCgHMMU4E0xfJRnGQNieSsPjY6tkWv1XBJk8n2qfVJUOz+nE750S4TXfd43bbS4F9INa9jHIEBVDY6DiaTgPHLy2MFbQKDgsXG4ZbaBzegvJ7KtksBxJskrnhzlg7XyOJLZ1SKF7XkCmjvUb+hESNqEB3SkDONQWA9LkgYYeXBGPFoSYYFho3K3hcGkyso4DrZrGcGMISIQAqd5pe6Lhv3u+PXPLDR4U+8kTTDDCjbGJT8CwZCfNyz8/MKXNISKLqwctBI9lz7xKsFmfVnWJREbHY4ogDoXyyK+NQUJbYSem6ABjGtcoRyNFv4nv0uRG4GgCdkrOU8ahUjTrs2XLiDYiVjLuk1fFDIEMAZisHe0L537vjA6Vmb8GIanibCVxiodAVS9aIrsPWQW7fbQEt87UYg+NawMH0qvztAv6XuOwGqRGfUvq81qzCorQQLJUYcCvrAyTaQRBELIVBGAPetStF7V85wKk0chN1SwCcLOZ5g5qj+aV36ceZfvYY+IwuwoV/c337CNLZg2kwa1R0EVrjHP5XpN7bczamECLnO3Arkn1W8mFcyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(44832011)(5660300002)(31696002)(86362001)(38100700002)(82960400001)(2906002)(83380400001)(316002)(66574015)(36756003)(6512007)(110136005)(186003)(6506007)(4326008)(66556008)(66476007)(66946007)(53546011)(8676002)(508600001)(33964004)(6486002)(31686004)(2616005)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTcxR29KUitGZjhHTVN4eUNhL0lweXhwKzJhQjdiQUk0Ui8rb05CaTcramcw?=
 =?utf-8?B?M0JOZzVtbDhLM0FVeW8xb0VMUkhIVytNLzVkcWxBdmJVSUxWWWZkNW9jalFR?=
 =?utf-8?B?aWlNYmsrd2xTa1A1NiszemdXSVk4ZnpId1A4M3NySWJtWTRRWkttaHpvcEZF?=
 =?utf-8?B?TEFFMVA2M1VhSmFrNWJsV245R056cTRSaGZweWhJRWowRDZxNkNUWjNmeG9Z?=
 =?utf-8?B?NjhYSFUxVmozeEgvVnR6eGFnbGVaN2tnUVRRTmdVT1J3MnlheVJiSmFLd1hV?=
 =?utf-8?B?RnhiN21ZYjFRYTQrR2pBZEFjbUJtTmRzRml1MVpZQzVDcS9nRDJOMEZZZVdL?=
 =?utf-8?B?TElzQmJwemZNK09vOHZpQzF2b1ZLclI2a1VaRVFJMnVtUkpqNnR1dTBvc3FY?=
 =?utf-8?B?OFBIU3hwS2lxYUZLOUJhZ1BWZW5XUUh3cFhJMmUwbjdjWk5EMVFLeGdIekFy?=
 =?utf-8?B?dmpQQ0FRdXQ1cmQ2dkdNd2JlNlF3M2NKTzBGVUxLSXJUR0piY2NHS2RKMzZy?=
 =?utf-8?B?MjR2ajRCb3luQStVOUtqTHBtSXVJakxvcVVHTXFwSFJUN1R1RkZvVDJ2ZmRW?=
 =?utf-8?B?d2FPeUFiOUpEV2VBTG5OQyt1Q3ZNcmV1cjl4QTd5Ykw3aUs2WEd2T1dPWXhP?=
 =?utf-8?B?SzNWbUNsNVFDcnNDZjllRFAvT0x3eXNDbitNTzJrNkZINUlacXp6OXJLZHM5?=
 =?utf-8?B?dVFJMndtY1A0ZmVKYTNhS0pwTmdadXlXWFF5ZXhBcGJsVXV4d1FqcHZZUlNI?=
 =?utf-8?B?N0pDR0x2djdWdUlQN0FuUjlwSUV0SlBXMXB4Q3RLUSsyVDlNek8xUXZOYUNp?=
 =?utf-8?B?cXEvU0dLMFJkb1lPemdVVGk4Q21CTHdlZWd6N2l2c20vaGMzcHcrbjM5VDRw?=
 =?utf-8?B?aW9rZldVaU8wZ1NsdFN4UjdIMjd1emd1WlJ4RkpTVjFNZzBWV2FTMWJTYjhr?=
 =?utf-8?B?eXlaaEQ4aGw1NTBodmVTVEZiNlczSkpWWmtaZTBSQ3VIMWVnWGlTeVh2M21s?=
 =?utf-8?B?bTJFZmxBRWxHUTY2dUptK2FDTndVcUJpSG5QZ0RZbThKVHc1b20wMXdWcUFt?=
 =?utf-8?B?ck9LbUVZNlpYdGw1WlcrcWJuZHB6QnEyVlRrV25JUXVnb3F4c2Z3blRDbU12?=
 =?utf-8?B?V0VRNlFKVC9acTRLZmthOWVlbWd1M1JZSHhGcmhMUjV5dXNiRXRmckhtTWdq?=
 =?utf-8?B?Qi9LdUF6dENPYVZMakZsWm90UWFLblpBSzlLVkNvckYwK2VoZmtVeUJxS2l0?=
 =?utf-8?B?RkUvTXRIVVk5bmN1Y3BYQ2kzSHA4a20yUThyZXZDeXVJUTRlWFBNenl2OCtZ?=
 =?utf-8?B?MTFUcG5tTnh3bWdWMlRBd2VDU1ROSEg1ZHh0MFdqdGxOd0ZkU1JEMVEzTy9S?=
 =?utf-8?B?cjhrMDhaSzRRaGE2RitEV0J6WmpOQ3Y2bnN6R3p3RFpuWi9GblU5TUdJdHhH?=
 =?utf-8?B?THphaUFscSt0c1JsL29mVkJoUGxwamxUNG81clNsOERDRjZRMUFyZWg2cHZQ?=
 =?utf-8?B?SGhzQmxuYnJGUkhtY2tjUzNLdXNBVisrSmx2Qy80R2RDWDR1WUNkZ1lQdW1O?=
 =?utf-8?B?U0x6VFk0U0UrYXVFOCsvNUdwRG96NnpIN0tsVUdTU01zb0d0NllmK1BrT3lS?=
 =?utf-8?B?TTN2SjZxVytEbFBJZHVzUGhLbVN6NjN0a1VEcUYvODl1SWtEWDB4TGUzZFpu?=
 =?utf-8?B?alFJUUxobHZYSzQrdHVYZHhJMjdjU3AwcGtIWnA2RmRjd2kxYnNDUmtKNzFE?=
 =?utf-8?B?bU9hV2R5Q0xYL09Nc1dBZUlTeVhnckxEV20wYTZtQm1lWXlwaXR2dU5YRklt?=
 =?utf-8?B?SmNUTFRlb3dvVFRpMXNLbTZHblZGNzQ4enY2K0hTZkhhZmp0UWFQUEhpeTg5?=
 =?utf-8?B?aktpdnAzRFdsVVcxTEY1S1UyVUFuOFM4ZHZnblNQOEx6ZVJ6MTh2cnpwclR5?=
 =?utf-8?B?bnQzT1ptb1k5SFJySXRjK2IxSTMxVkJYZC92VU42RTlWSWNuWjZqazNDdE00?=
 =?utf-8?B?RytJem5HaFNRS0dKeFROc2JXc0gyTEtqUEtWcG1ObFU0OEJNYmE1eEh0WE1X?=
 =?utf-8?B?ekJDdnRhUFF0QzhqM2kva2tRcEwxUDVMNHBCUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4134e523-8187-45f9-b88b-08da0b6bc410
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 18:51:10.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0m2Cfn+qL67WHwh1f5WByBFA1C2Gli7Hgiers4ISNtqBEVqFn6q7aYzc5e1+SvbMJ0IZUU5D+ulQ1EU22jx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1535
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------WOgwwis3QLRvf2mu6gngkujM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2022-03-21 4:07 a.m., Thomas Hellström wrote:
>
> On 3/21/22 11:30, Tvrtko Ursulin wrote:
>>
>> On 19/03/2022 19:42, Michael Cheng wrote:
>>> Previous concern with using drm_clflush_sg was that we don't know 
>>> what the
>>> sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>>> everything at once to avoid paranoia.
>>
>> And now we know, or we know it is not a concern?
>>
>>> To make i915 more architecture-neutral and be less paranoid, lets 
>>> attempt to
>>
>> "Lets attempt" as we don't know if this will work and/or what 
>> can/will break?
>>
>>> use drm_clflush_sg to flush the pages for when the GPU wants to read
>>> from main memory.
>>>
>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
>>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> index f5062d0c6333..b0a5baaebc43 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> @@ -8,6 +8,7 @@
>>>   #include <linux/highmem.h>
>>>   #include <linux/dma-resv.h>
>>>   #include <linux/module.h>
>>> +#include <drm/drm_cache.h>
>>>     #include <asm/smp.h>
>>>   @@ -250,16 +251,10 @@ static int 
>>> i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>>>        * DG1 is special here since it still snoops transactions even 
>>> with
>>>        * CACHE_NONE. This is not the case with other HAS_SNOOP 
>>> platforms. We
>>>        * might need to revisit this as we add new discrete platforms.
>>> -     *
>>> -     * XXX: Consider doing a vmap flush or something, where possible.
>>> -     * Currently we just do a heavy handed wbinvd_on_all_cpus() 
>>> here since
>>> -     * the underlying sg_table might not even point to struct 
>>> pages, so we
>>> -     * can't just call drm_clflush_sg or similar, like we do 
>>> elsewhere in
>>> -     * the driver.
>>>        */
>>>       if (i915_gem_object_can_bypass_llc(obj) ||
>>>           (!HAS_LLC(i915) && !IS_DG1(i915)))
>>> -        wbinvd_on_all_cpus();
>>> +        drm_clflush_sg(pages);
>>
>> And as noticed before, drm_clfush_sg still can call 
>> wbinvd_on_all_cpus so are you just punting the issue somewhere else? 
>> How will it be solved there?
>
> I think in this case, drm_clflush_sg() can't be immediately used, 
> because pages may not contain actual page pointers; might be just the 
> dma address. It needs to be preceded with a dmabuf vmap.

Could you elaborate more with using a dmabuf vmap?

Doing a quick grep on drm_clflush_sg, were you thinking about something 
similar to the following?

if (obj->cache_dirty) {
WARN_ON_ONCE(IS_DGFX(i915));
obj->write_domain = 0;
if (i915_gem_object_has_struct_page(obj))
drm_clflush_sg(pages);
obj->cache_dirty = false;
}


Thanks,

Michael Cheng

> But otherwise this change, I figure, falls into the "prefer 
> range-aware apis" category; If the CPU supports it, flush the range 
> only, otherwise fall back to wbinvd().
>
> /Thomas
>
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>>         sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
>>>       __i915_gem_object_set_pages(obj, pages, sg_page_sizes);
--------------WOgwwis3QLRvf2mu6gngkujM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2022-03-21 4:07 a.m., Thomas
      Hellstr=C3=B6m wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:b986f2a7-c0d3-b145-dd45-54d25e10a=
8be@linux.intel.com">
      <br>
      On 3/21/22 11:30, Tvrtko Ursulin wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        On 19/03/2022 19:42, Michael Cheng wrote:
        <br>
        <blockquote type=3D"cite">Previous concern with using
          drm_clflush_sg was that we don't know what the
          <br>
          sg_table is pointing to, thus the usage of wbinvd_on_all_cpus
          to flush
          <br>
          everything at once to avoid paranoia.
          <br>
        </blockquote>
        <br>
        And now we know, or we know it is not a concern?
        <br>
        <br>
        <blockquote type=3D"cite">To make i915 more architecture-neutral
          and be less paranoid, lets attempt to
          <br>
        </blockquote>
        <br>
        &quot;Lets attempt&quot; as we don't know if this will work and/or =
what
        can/will break?
        <br>
        <br>
        <blockquote type=3D"cite">use drm_clflush_sg to flush the pages
          for when the GPU wants to read
          <br>
          from main memory.
          <br>
          <br>
          Signed-off-by: Michael Cheng <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:michael.cheng@intel.com">&lt;michael.cheng@intel.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
          <br>
          &nbsp; 1 file changed, 2 insertions(+), 7 deletions(-)
          <br>
          <br>
          diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
          b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
          <br>
          index f5062d0c6333..b0a5baaebc43 100644
          <br>
          --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
          <br>
          +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
          <br>
          @@ -8,6 +8,7 @@
          <br>
          &nbsp; #include &lt;linux/highmem.h&gt;
          <br>
          &nbsp; #include &lt;linux/dma-resv.h&gt;
          <br>
          &nbsp; #include &lt;linux/module.h&gt;
          <br>
          +#include &lt;drm/drm_cache.h&gt;
          <br>
          &nbsp; &nbsp; #include &lt;asm/smp.h&gt;
          <br>
          &nbsp; @@ -250,16 +251,10 @@ static int
          i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object
          *obj)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * DG1 is special here since =
it still snoops
          transactions even with
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * CACHE_NONE. This is not th=
e case with other HAS_SNOOP
          platforms. We
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * might need to revisit this=
 as we add new discrete
          platforms.
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; *
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * XXX: Consider doing a vmap flush or s=
omething, where
          possible.
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * Currently we just do a heavy handed
          wbinvd_on_all_cpus() here since
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * the underlying sg_table might not eve=
n point to struct
          pages, so we
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * can't just call drm_clflush_sg or sim=
ilar, like we do
          elsewhere in
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * the driver.
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i915_gem_object_can_bypass_llc=
(obj) ||
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!HAS_LLC(=
i915) &amp;&amp; !IS_DG1(i915)))
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbinvd_on_all_cpus();
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_clflush_sg(pages)=
;
          <br>
        </blockquote>
        <br>
        And as noticed before, drm_clfush_sg still can call
        wbinvd_on_all_cpus so are you just punting the issue somewhere
        else? How will it be solved there?
        <br>
      </blockquote>
      <br>
      I think in this case, drm_clflush_sg() can't be immediately used,
      because pages may not contain actual page pointers; might be just
      the dma address. It needs to be preceded with a dmabuf vmap.
      <br>
    </blockquote>
    <p>Could you elaborate more with using a dmabuf vmap?</p>
    <p>Doing a quick grep on drm_clflush_sg, were you thinking about
      something similar to the following? <br>
    </p>
    <div style=3D"font-family: 'Liberation Mono', monospace; white-space: p=
re"><div><span style=3D"color: undefined; background: undefined; font-weigh=
t: normal; font-style: normal; text-decoration: none"> </span><span style=
=3D"color: #dcdccc; background: undefined; font-weight: normal; font-style:=
 normal; text-decoration: none">        </span><span style=3D"color: undefi=
ned; background: undefined; font-weight: normal; font-style: normal; text-d=
ecoration: none">if (obj-&gt;cache_dirty) {</span><span style=3D"color: #dc=
dccc; background: undefined; font-weight: normal; font-style: normal; text-=
decoration: none">                                               </span><sp=
an style=3D"color: undefined; background: #705050; font-weight: normal; fon=
t-style: normal; text-decoration: none"></span><span style=3D"color: #dcdcc=
c; background: undefined; font-weight: normal; font-style: normal; text-dec=
oration: none">                                                 </span></di=
v><div><span style=3D"color: undefined; background: undefined; font-weight:=
 normal; font-style: normal; text-decoration: none"> </span><span style=3D"=
color: #dcdccc; background: undefined; font-weight: normal; font-style: nor=
mal; text-decoration: none">                </span><span style=3D"color: un=
defined; background: undefined; font-weight: normal; font-style: normal; te=
xt-decoration: none">WARN_ON_ONCE(IS_DGFX(i915));</span><span style=3D"colo=
r: #dcdccc; background: undefined; font-weight: normal; font-style: normal;=
 text-decoration: none">                                  </span><span styl=
e=3D"color: undefined; background: #705050; font-weight: normal; font-style=
: normal; text-decoration: none"></span><span style=3D"color: #dcdccc; back=
ground: undefined; font-weight: normal; font-style: normal; text-decoration=
: none">                                              </span></div><div><sp=
an style=3D"color: undefined; background: undefined; font-weight: normal; f=
ont-style: normal; text-decoration: none"> </span><span style=3D"color: #dc=
dccc; background: undefined; font-weight: normal; font-style: normal; text-=
decoration: none">                </span><span style=3D"color: undefined; b=
ackground: undefined; font-weight: normal; font-style: normal; text-decorat=
ion: none">obj-&gt;write_domain =3D 0;</span><span style=3D"color: #dcdccc;=
 background: undefined; font-weight: normal; font-style: normal; text-decor=
ation: none">                                         </span><span style=3D=
"color: undefined; background: #705050; font-weight: normal; font-style: no=
rmal; text-decoration: none"></span><span style=3D"color: #dcdccc; backgrou=
nd: undefined; font-weight: normal; font-style: normal; text-decoration: no=
ne">                                                 </span></div><div><spa=
n style=3D"color: undefined; background: undefined; font-weight: normal; fo=
nt-style: normal; text-decoration: none"> </span><span style=3D"color: #dcd=
ccc; background: undefined; font-weight: normal; font-style: normal; text-d=
ecoration: none">                </span><span style=3D"color: undefined; ba=
ckground: undefined; font-weight: normal; font-style: normal; text-decorati=
on: none">if (i915_gem_object_has_struct_page(obj))</span><span style=3D"co=
lor: #dcdccc; background: undefined; font-weight: normal; font-style: norma=
l; text-decoration: none">                      </span><span style=3D"color=
: undefined; background: #705050; font-weight: normal; font-style: normal; =
text-decoration: none"></span><span style=3D"color: #dcdccc; background: un=
defined; font-weight: normal; font-style: normal; text-decoration: none">  =
                                               </span></div><div><span styl=
e=3D"color: undefined; background: undefined; font-weight: normal; font-sty=
le: normal; text-decoration: none"> </span><span style=3D"color: #dcdccc; b=
ackground: undefined; font-weight: normal; font-style: normal; text-decorat=
ion: none">                        </span><span style=3D"color: undefined; =
background: undefined; font-weight: normal; font-style: normal; text-decora=
tion: none">drm_clflush_sg(pages);</span><span style=3D"color: #dcdccc; bac=
kground: undefined; font-weight: normal; font-style: normal; text-decoratio=
n: none">                                 </span><span style=3D"color: unde=
fined; background: #705050; font-weight: normal; font-style: normal; text-d=
ecoration: none"></span><span style=3D"color: #dcdccc; background: undefine=
d; font-weight: normal; font-style: normal; text-decoration: none">        =
                                         </span></div><div><span style=3D"c=
olor: undefined; background: undefined; font-weight: normal; font-style: no=
rmal; text-decoration: none"> </span><span style=3D"color: #dcdccc; backgro=
und: undefined; font-weight: normal; font-style: normal; text-decoration: n=
one">                </span><span style=3D"color: undefined; background: un=
defined; font-weight: normal; font-style: normal; text-decoration: none">ob=
j-&gt;cache_dirty =3D false;</span><span style=3D"color: #dcdccc; backgroun=
d: undefined; font-weight: normal; font-style: normal; text-decoration: non=
e">                                      </span><span style=3D"color: undef=
ined; background: #705050; font-weight: normal; font-style: normal; text-de=
coration: none"></span><span style=3D"color: #dcdccc; background: undefined=
; font-weight: normal; font-style: normal; text-decoration: none">         =
                                        </span></div><div><span style=3D"co=
lor: undefined; background: undefined; font-weight: normal; font-style: nor=
mal; text-decoration: none"> </span><span style=3D"color: #dcdccc; backgrou=
nd: undefined; font-weight: normal; font-style: normal; text-decoration: no=
ne">        </span><span style=3D"color: undefined; background: undefined; =
font-weight: normal; font-style: normal; text-decoration: none">}</span><sp=
an style=3D"color: #dcdccc; background: undefined; font-weight: normal; fon=
t-style: normal; text-decoration: none">        </span></div></div>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Michael Cheng<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:b986f2a7-c0d3-b145-dd45-54d25e10a=
8be@linux.intel.com">But
      otherwise this change, I figure, falls into the &quot;prefer
      range-aware apis&quot; category; If the CPU supports it, flush the
      range only, otherwise fall back to wbinvd().
      <br>
      <br>
      /Thomas
      <br>
      <br>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:b986f2a7-c0d3-b145-dd45-54d25e10a=
8be@linux.intel.com">
      <br>
      <blockquote type=3D"cite">
        <br>
        Regards,
        <br>
        <br>
        Tvrtko
        <br>
        <br>
        <blockquote type=3D"cite">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sg_=
page_sizes =3D
          i915_sg_dma_sizes(pages-&gt;sgl);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __i915_gem_object_set_pages(obj, p=
ages, sg_page_sizes);
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------WOgwwis3QLRvf2mu6gngkujM--
