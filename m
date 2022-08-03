Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F858851A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 02:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1AD916E4;
	Wed,  3 Aug 2022 00:21:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA0111B302;
 Wed,  3 Aug 2022 00:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659486065; x=1691022065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sY3WUiVTqNytpiJ8sKStpIrUhN4KiEwqomGkCnV4S+0=;
 b=MqwMYgnePmIM29sXllfPe06uH7C9QMU507/mpceYUa1dQ7prSnojF5+l
 87Xt/vm8+TlVKGVmkj9kNEl89nSqyRmTayw29lAlEnj6dFAY5NAK3sq/T
 M3vX/jBZRS+FdSsPkfdisa4fkITwUVccvKWO4os2VDNyQyzAo0McE9zN0
 R0ZCB1SjjQsHTyDj86ylbxwC3ZGGHf+g76xDJCQxCjBBCLLa1Jjf9ylJH
 id7u4HGi1yaP3CSIheZ0lkTk8HrNfpSsSeI6a50O9Li+kok4jeyOqqY6w
 Ix4J8056zF0/j5otR8aQjKUXhPZuOxiQhpwC3NXunkPxQF5ca+wr3Wrum w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290763861"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="290763861"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 17:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="553120776"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 02 Aug 2022 17:21:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:21:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 17:21:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 17:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD+sakhDVJiVKv9uAykQmRAIQYhilfxe2vh54Ef7pFhXzmiY9nqRDedD66UavwhUzGNmxZDNs7t+hdhsQxihjUPuo9IezD1CEeErZOYSnmxLyGEdbG+69NT4lQUvizG/jMaNALST35rTTpSXR2lELwBJlbgbQbCjXO382XkJF6AJqSBueHEyqGLE9vTl00EBNfH0EOT/zMEtB+Q2MSpdYVlKiyzW4LCK7J5efDeq2smwoDVC7Vw5z/zu7QuhHNFs2cqpGknlH2yMVMj6I7RSEdj/inDM+na8qTAycU4dvIn9LtEYur2oKzjtm6Dgc9CYDa2TS4jNYMsOEeCcAmbHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyKH2ixCgGUrRsgxl5slTYe+DrdNNR0uQxKb8MUnRPc=;
 b=cUyYQZQF+YggWFnVxrfsakLmrFk4Wb59/VMnRpuS08Oyf3e6vqcsRtAHqyZE8i+kWMutQtbN2BXvwXY91ILNUzgsgfY6hm1PimHCpVkZYWsc+zZiLsZWUCC4mHF7jsC3glo4pTQm8hDig35zaLGnm7ynf4QAqnzaaQpz373W5v+bL/fRx7fagL9ALiskyxzPfMIA+8evPd1FPlSBn9kiC79yjACRmEm04yNsKE0o0RvfZfUlRuBI8y811xIhMl2/tlOXGXRBpR5Y4batsAzqbC1SY94a/LeZGwM1GghCwVN6QdxE+/69mr9LxK7sAFm98jHDUhjceLaLIMsGSCB+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 00:20:55 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 00:20:54 +0000
Message-ID: <bbb4cb7f-8158-1d3b-7adf-39e628e0b06c@intel.com>
Date: Tue, 2 Aug 2022 17:20:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/guc: Record CTB info in error
 logs
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-5-John.C.Harrison@Intel.com>
 <d9f6c68a1795ffd207bcaec3c7482241c1dce1ce.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d9f6c68a1795ffd207bcaec3c7482241c1dce1ce.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e33c10c3-15b2-499c-d116-08da74e607b9
X-MS-TrafficTypeDiagnostic: SA1PR11MB5804:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tdIVQazIyP9MOyHHIQVg13Li7zUT3pK5E05AmXyA1gi4mvY+RR6LYhvhFH8++jwAd+ioOIGmv41hjlGcivF4yZsz30OTlSA0QEGYp6G8A30FXy9HJTJEOj4Ezl4+FCKJZkJJB2BfcZz77tqUdfe/oTQ2GlEf4ZFPwiD3jgOVi1EOtkxqLtn6RffvT7HXpZUnnO3bGLmqjtvq11cnY2fWo2TFT0L1sQEG9KVh5IYL3mRLX09cCvxSo8M+zhFyw0kT56xpehVTRRket3QKcF/CRAo3yTRFC6xdmBjFk/MVCxQucFYQu7PpWq90qtLE3hFxXe1B414BtpKcQwXQ+/ClHQ5Zy2n2lSiVWXU189gWAsJZNUNLD20aC24EeKIB9zzzb2qVu5Nclrk2JUQs2yhXdgPIv7S7GePXzaZxMnhpvoa86v0wYHem03ncZSJt/AxbCQlAZ3EsnvZMXOuLasR++BfXrdKRYK+j5IColDPelyDl488DTz4UvVwl0Pt0P/sOKfS13l1IrUiaar8trlzISPg9HWIh3PxBiX8PKYs3RZ9Avgz/jWYnodBfh66apCDQJHEPUnvxDcjyDhbKFex3N3lO18OhmiUFEYra2jKJb1u25gECL3MMJKmKAKdh20Yei6CN9KHfBg6vmPUwhcb5+KQfaXfdWVB94KETv1Yb527OUAolXujonv6Y4xrXRQ+Te6xsoplWS1juD28O67MleZyOjK6ywIoCnpxoTn3ZMT+5N5riRlNSqAE8q75lmBHPICCDMsmngy6hyuQhu+jLfiuWb58QcPps33pLZhQ2Cj05Yccs6ciiOEiGRc5q+VU1Jgqwkpo34p7EMQWDvA9JZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(39860400002)(366004)(346002)(396003)(66476007)(66946007)(66556008)(8936002)(8676002)(4326008)(478600001)(450100002)(38100700002)(186003)(6486002)(5660300002)(82960400001)(31696002)(316002)(110136005)(86362001)(53546011)(6506007)(41300700001)(31686004)(83380400001)(2616005)(2906002)(36756003)(26005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WllpSmhKNVM3VVVROGlXKzN0a2FQTUsyUHdvZnU3ckkvaEl2Um4wZXUzOG5t?=
 =?utf-8?B?SUJlbkR3aHZKc1NXOFVJMmI4eFR5cnJOSFJ1bnpIM1B0eUdNMzdTNUFRZDU2?=
 =?utf-8?B?WGc0a0p5Z1hlYUxrY2owZERvYXZLekE3MS9mcjZIaDB6R1hrWG13VjlncVZZ?=
 =?utf-8?B?enhmWFB6a0F6NE41OExiUlJxdG1UUmRVQmpyVTFpUVpjM1dMRmhMdjZ5bks3?=
 =?utf-8?B?TnJHMk13cnRtYS9RQWlnRGZtUmhUNnZ6K0w4OUVDY3RuREozeWRYclpoaVV5?=
 =?utf-8?B?aGdza0UrVGR3VlBzNm5UcG1kYjdINUFSSjlPaFVZU1pacTNHTWJFQ0tRL3pN?=
 =?utf-8?B?cGZZYTFzWWVYckZvZExtVmFrSUxGK2NOMXo3RlpVZXp4SURQdXZkVGJpWitr?=
 =?utf-8?B?T3NkTklqd3RoRFRwelhnWEVpSitWdTlRMTRERjNMeXY3eVNwN0FleE53aHpa?=
 =?utf-8?B?WUtza0QwTEp1TEllS0dSM2FoQVBnLzF1SncvdHlDVzZvcjJ0d3FwS2RLb0Ez?=
 =?utf-8?B?djJUNUMxcGNNbXNtSzhZM1RVYXFKakRCdXhyWmVQdGxuOFF3Z2c2bG5xSXYr?=
 =?utf-8?B?bWZEbit3MUpoc3pvVnBRRVZpWEZUQmpLSHJQQytVOGV6alcwMWNhblZubGFr?=
 =?utf-8?B?enNCL2NTcGMyMkw3emYxZlNSWGJGNjEzblYxaDJDNmRlZmZWc21iOTRxWnJV?=
 =?utf-8?B?Q0FjYVNCdG0reXhFMUJRM05yT0wyR3ZqbitZRHYvaVlqTDVGaHc2WGtlYW12?=
 =?utf-8?B?RjJBMWJtRHlnRGpmTTV4S0t5TE11cURyMXJSdCtKN3l4VGJzL0NjL3pkL0dS?=
 =?utf-8?B?VWoxQ21pMnFvamZHbjNRV3lQUlI0RUNBQ245ZXZoKzVIb3AxMk5JU2piSEFI?=
 =?utf-8?B?SGJTZFl0Mmw1RTJuUTdYZmhPcnZTU0UvZnVpQmtBTWRGZEZ0WGprcUdHN3Fj?=
 =?utf-8?B?V1U1T0xqaHdQeEptQU5PMGNpbHNIVTMvYUVjMHlMTUo2V0ZZemRlTmlkcHVv?=
 =?utf-8?B?bll4RlF0MHN0T0d1djVFNk9HVU9VRzdVYkFjNk44U3UyaTVFVTRZWThWUGdN?=
 =?utf-8?B?NUs0NUIxaUpMVzRHOTNkaVpuMENpeFBsQ0NnOXdqMm5pRzBHZDNPbHoxbGdM?=
 =?utf-8?B?eEtYbEhTMEtMbmJjUXhzc1BJcFBUQmIrVHFsK0NoZzM0R1BYUStGK1ExWTF6?=
 =?utf-8?B?K0JJejNtQXpRVE00cEIwbkorVzY1TldOV3BJSXN3d2tlM2NlaW9WK2Y1aE56?=
 =?utf-8?B?d2p3LzZmQkxEWFkreWtZdXNtbXQva1h2b2QyWjRrbVpvT3hZVUZOcTJHK2gv?=
 =?utf-8?B?MjhDT2hRcXZuZ0R3OUdFeENtRXl3V09KSjlla3dqSzl0ZHpTTGJqNnFSKzly?=
 =?utf-8?B?amJ0MVpqZ2ZibldPaWM2eU9tZDlmaWRsaStkd2NWVFRPZ0V4d1N0ckxZRHdO?=
 =?utf-8?B?ZEUxdXIyTUFScVQvaC80UDA4NXlOOFpMRksrMkJXVVJsd2xyYm5KWkRaRjBn?=
 =?utf-8?B?MHFZVXpzUzFYbERHM0xZWEZjdUhpVHAxM2JpWkNNUktNU1kzMGlOaVBaSWhB?=
 =?utf-8?B?aTB2ZXV0Y1VXQjBtOEtrWHF2T1JHemtpd3FyTVdlZWc2dUNTbnZFMUlPclFi?=
 =?utf-8?B?eWlLYTVWbHZ1MHVieTVvWXN2Q0lCWVB3ZWY0eFI2U0Jac0tZYTVzZXpnRGZ2?=
 =?utf-8?B?dVM5M2p6aVNXdVJqS3grUnN4VVpFYzdtWWtuNXNFUHdHTmdHNHZFbEtZV3kr?=
 =?utf-8?B?eHNxRkJxRFZQWnhGL0k3b1o5RE1oaXdFY1FYbjgrVnZxRUxIdDZ5Q1psZHpQ?=
 =?utf-8?B?aWo1ZlZsZnVpUVp3dUFIbGppUW9LNW03TkFlSWVMNXRhMmptbUVwWU5yTFpq?=
 =?utf-8?B?TTZjVmFENnFWUHA3aU9ZUno1YmhRcHJDM21vTlVQQVIvM2o0bmV0UWRLc0VX?=
 =?utf-8?B?SmVVamdNVE03Sk1UbkVSdjdDSTh4ZUZyTVViVVhKOG9TTHQvaEREcUxaUTlX?=
 =?utf-8?B?TlY1Mk5KRC9LOE9McXIyRGR6M2xCNTk4aU0rdFpIanhrUnRpSXlGWXl1cUd3?=
 =?utf-8?B?QjNlSWFqczdpeVc3eE9MQ0JYOVowYWc4bE9OTGNlZ0JCR3NlQklYQnpmQXZU?=
 =?utf-8?B?dEVpblNzWmhsZXQ2V291eTcwVkVaMEFCSG5udWdjSnhmWjIvR2lvb01IOFJo?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e33c10c3-15b2-499c-d116-08da74e607b9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 00:20:54.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihcDd/ZTtf9fxAzZYr6HktkIIGt6ZUnqt5B6YhmCq4ivS0x4BlYOlAq2uedhY4eziX+6pAtgMo9xICkm/Eqd9a7errMmGykQYRQvxcBKzw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/2022 11:27, Teres Alexis, Alan Previn wrote:
> One minor NIT (though i hope it could be fixed otw in as it adds a bit of ease-of-log-readibility).
> That said, everything else looks good.
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>   
> On Wed, 2022-07-27 at 19:20 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When debugging GuC communication issues, it is useful to have the CTB
>> info available. So add the state and buffer contents to the error
>> capture log.
>>
>> Also, add a sub-structure for the GuC specific error capture info as
>> it is now becoming numerous.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 59 +++++++++++++++++++++++----
>>   drivers/gpu/drm/i915/i915_gpu_error.h | 20 +++++++--
>>   2 files changed, 67 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index addba75252343..543ba63f958ea 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -671,6 +671,18 @@ static void err_print_pciid(struct drm_i915_error_state_buf *m,
>>   		   pdev->subsystem_device);
>>   }
>>   
>> +static void err_print_guc_ctb(struct drm_i915_error_state_buf *m,
>> +			      const char *name,
>> +			      const struct intel_ctb_coredump *ctb)
>> +{
>> +	if (!ctb->size)
>> +		return;
>> +
>> +	err_printf(m, "GuC %s CTB: raw: 0x%08X, 0x%08X/%08X, cached: 0x%08X/%08X, desc = 0x%08X, buf = 0x%08X x 0x%08X\n",
>> +		   name, ctb->raw_status, ctb->raw_head, ctb->raw_tail,
>> +		   ctb->head, ctb->tail, ctb->desc_offset, ctb->cmds_offset, ctb->size);
>>
> NIT: to make it more readible on first glance, would be nice to add more descriptive text like "raw: Sts:0x%08X,
> Hd:0x%08X,Tl:0x@08X..." also, the not sure why cmds_offset is presented with a "x size" as opposed to just "desc-off =
> foo1, cmd-off = foo2, size = foo3"?
The line is long enough as it is. I'd rather not make it even longer. 
Same for '<name>: <address> x <size>' rather than '<name> _addr = 
<address>, <name>_size = <size>'. It's useful for readability to keep a 
single CTB channel on a single line but not if that line is excessively 
long.

John.

>> +}
>> +
>>   static void err_print_uc(struct drm_i915_error_state_buf *m,
>>   			 const struct intel_uc_coredump *error_uc)
>>   {
>> @@ -678,8 +690,12 @@ static void err_print_uc(struct drm_i915_error_state_buf *m,
>>   
>>   	intel_uc_fw_dump(&error_uc->guc_fw, &p);
>>   	intel_uc_fw_dump(&error_uc->huc_fw, &p);
>> -	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->timestamp);
>> -	intel_gpu_error_print_vma(m, NULL, error_uc->guc_log);
>> +	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->guc.timestamp);
>> +	intel_gpu_error_print_vma(m, NULL, error_uc->guc.vma_log);
>> +	err_printf(m, "GuC CTB fence: %d\n", error_uc->guc.last_fence);
>> +	err_print_guc_ctb(m, "Send", error_uc->guc.ctb + 0);
>> +	err_print_guc_ctb(m, "Recv", error_uc->guc.ctb + 1);
>> +	intel_gpu_error_print_vma(m, NULL, error_uc->guc.vma_ctb);
>>   }
>>   
>>   static void err_free_sgl(struct scatterlist *sgl)
>> @@ -854,7 +870,7 @@ static void __err_print_to_sgl(struct drm_i915_error_state_buf *m,
>>   	if (error->gt) {
>>   		bool print_guc_capture = false;
>>   
>> -		if (error->gt->uc && error->gt->uc->is_guc_capture)
>> +		if (error->gt->uc && error->gt->uc->guc.is_guc_capture)
>>   			print_guc_capture = true;
>>   
>>   		err_print_gt_display(m, error->gt);
>> @@ -1009,7 +1025,8 @@ static void cleanup_uc(struct intel_uc_coredump *uc)
>>   {
>>   	kfree(uc->guc_fw.path);
>>   	kfree(uc->huc_fw.path);
>> -	i915_vma_coredump_free(uc->guc_log);
>> +	i915_vma_coredump_free(uc->guc.vma_log);
>> +	i915_vma_coredump_free(uc->guc.vma_ctb);
>>   
>>   	kfree(uc);
>>   }
>> @@ -1658,6 +1675,23 @@ gt_record_engines(struct intel_gt_coredump *gt,
>>   	}
>>   }
>>   
>> +static void gt_record_guc_ctb(struct intel_ctb_coredump *saved,
>> +			      const struct intel_guc_ct_buffer *ctb,
>> +			      const void *blob_ptr, struct intel_guc *guc)
>> +{
>> +	if (!ctb || !ctb->desc)
>> +		return;
>> +
>> +	saved->raw_status = ctb->desc->status;
>> +	saved->raw_head = ctb->desc->head;
>> +	saved->raw_tail = ctb->desc->tail;
>> +	saved->head = ctb->head;
>> +	saved->tail = ctb->tail;
>> +	saved->size = ctb->size;
>> +	saved->desc_offset = ((void *)ctb->desc) - blob_ptr;
>> +	saved->cmds_offset = ((void *)ctb->cmds) - blob_ptr;
>> +}
>> +
>>   static struct intel_uc_coredump *
>>   gt_record_uc(struct intel_gt_coredump *gt,
>>   	     struct i915_vma_compress *compress)
>> @@ -1684,9 +1718,16 @@ gt_record_uc(struct intel_gt_coredump *gt,
>>   	 * log times to system times (in conjunction with the error->boottime and
>>   	 * gt->clock_frequency fields saved elsewhere).
>>   	 */
>> -	error_uc->timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
>> -	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>> -						"GuC log buffer", compress);
>> +	error_uc->guc.timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
>> +	error_uc->guc.vma_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>> +						    "GuC log buffer", compress);
>> +	error_uc->guc.vma_ctb = create_vma_coredump(gt->_gt, uc->guc.ct.vma,
>> +						    "GuC CT buffer", compress);
>> +	error_uc->guc.last_fence = uc->guc.ct.requests.last_fence;
>> +	gt_record_guc_ctb(error_uc->guc.ctb + 0, &uc->guc.ct.ctbs.send,
>> +			  uc->guc.ct.ctbs.send.desc, (struct intel_guc *)&uc->guc);
>> +	gt_record_guc_ctb(error_uc->guc.ctb + 1, &uc->guc.ct.ctbs.recv,
>> +			  uc->guc.ct.ctbs.send.desc, (struct intel_guc *)&uc->guc);
>>   
>>   	return error_uc;
>>   }
>> @@ -2039,9 +2080,9 @@ __i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask, u32 du
>>   			error->gt->uc = gt_record_uc(error->gt, compress);
>>   			if (error->gt->uc) {
>>   				if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>> -					error->gt->uc->is_guc_capture = true;
>> +					error->gt->uc->guc.is_guc_capture = true;
>>   				else
>> -					GEM_BUG_ON(error->gt->uc->is_guc_capture);
>> +					GEM_BUG_ON(error->gt->uc->guc.is_guc_capture);
>>   			}
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
>> index d8a8b3d529e09..efc75cc2ffdb9 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
>> @@ -125,6 +125,15 @@ struct intel_engine_coredump {
>>   	struct intel_engine_coredump *next;
>>   };
>>   
>> +struct intel_ctb_coredump {
>> +	u32 raw_head, head;
>> +	u32 raw_tail, tail;
>> +	u32 raw_status;
>> +	u32 desc_offset;
>> +	u32 cmds_offset;
>> +	u32 size;
>> +};
>> +
>>   struct intel_gt_coredump {
>>   	const struct intel_gt *_gt;
>>   	bool awake;
>> @@ -165,9 +174,14 @@ struct intel_gt_coredump {
>>   	struct intel_uc_coredump {
>>   		struct intel_uc_fw guc_fw;
>>   		struct intel_uc_fw huc_fw;
>> -		struct i915_vma_coredump *guc_log;
>> -		u32 timestamp;
>> -		bool is_guc_capture;
>> +		struct guc_info {
>> +			struct intel_ctb_coredump ctb[2];
>> +			struct i915_vma_coredump *vma_ctb;
>> +			struct i915_vma_coredump *vma_log;
>> +			u32 timestamp;
>> +			u16 last_fence;
>> +			bool is_guc_capture;
>> +		} guc;
>>   	} *uc;
>>   
>>   	struct intel_gt_coredump *next;
>> -- 
>> 2.37.1
>>

