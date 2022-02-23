Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDCA4C06AC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5E10E1F2;
	Wed, 23 Feb 2022 01:12:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4E510E1A3;
 Wed, 23 Feb 2022 01:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645578761; x=1677114761;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rx9wC39oVObb540BMo+C+FqD2O9QiR08ntE1Q1/S5Y4=;
 b=M9HkS1Vut2iJbiQ+enwmo2tguO8RGdW1yb2esW+1PdNGYcu5uxzqM62s
 QwDRebxKN6BGxT2Ir1Z19NLWskVi9M/fUx40RusipEGgwPvAx9D+Z+Uf6
 0hf21z9eTQPzx9x21M9uQAWsH2hOmhawcsjO+TAC7ToNgHERvXZ6f7oaK
 Y42UGn5Me1PAXB8wfkkuQe/uBM0v3Ym42+tfeO/zhMXUY7DPU0EIl1xae
 IIOCX6uK+RX75igpa8DcsIuNrKEMWE1AMQ9oSbey4ktdIFTMapaj62AnP
 qRiWhBz5/ZMU8zUy7RsX1UbJyTLhaHCtMcJDn2qnjA8EBqhcQ8TF6sLWg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231829289"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="231829289"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="706835552"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 22 Feb 2022 17:12:40 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:12:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 17:12:40 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:12:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt/ivJl725oPscJO9X9SSaSzHNQtrwWTGa+0CfUJN0806DhuUW24uR/aM+s6herm6t1LI17QT8Ve00+RECsvluUp3L6ZETQ+61HmI1oPCf54Co+lklGTG5mjYyelbdzAFZU0Vl/ikVowqOPQJRrLh4T/fRqIlzniiZ7LjYfE9R46fBtX9QvVijZkHRXiI96dkPi5XU2yQfdZXrebQ0WgZ0qV8ShS0dEvjAed1jX1ZXWqfJtHHsFrEWmvSRqveEIKyCtI0JPgvhBG2i8SGZGGpDd/DNAryKVHTOq+YaUk7jncE5SvZqnY228HnYowgB3CgrBRvcWToe6ZTUDX1DVR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWQvFuSWwanOMwi8xKXVGXPlp1tqMO1l8kiwSqLvHtg=;
 b=C5xyfePLZ/+QLD9W+wb2zOOt833t/f+/GzoDYYW7e2jbkF3s4IJAwpLXkS6wGMxMDSWSj95y+9QDUdCNMmGKPms31t7wDMKasxD8pmTVuBxieHBaUBXtvglGumy1hxeDb3KvJ+7zEcU242DskBgcUlOq+msf+5r4EvFqk6jZ4pw5BE0VQ37SY1AUKT3n+LNCc+/RT5QCe+3Iju3TvKFA5RB97kZsOlq+pGL87e1PZTaX5yOq6K237JpJ7FknoiASiZ3RJo4zQ0fjUQYeKOwpMWAjNhCS4lKT5iK4GP8wrmNm/H+CHpEwro97URmrjN4IOhyAWb0sND8apdQRyVdY6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.21; Wed, 23 Feb 2022 01:12:39 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:12:38 +0000
Message-ID: <cc5b20ac-86b4-2d8a-8d53-c4b870213b10@intel.com>
Date: Tue, 22 Feb 2022 17:12:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/guc: Move lrc desc setup to
 where it is needed
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-6-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fae95ba-8ed1-43bd-9e59-08d9f6699554
X-MS-TrafficTypeDiagnostic: DM6PR11MB4673:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB4673D49B0C015003E8BA0184F43C9@DM6PR11MB4673.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2yr6co7gSK6YZLhufr080wUjv0AHnX55PIZEDJ0agzQ0JDpANfWazzqn1IPONSqqgATPDk8+Mz2WyjXyZDB/opV8QIZUnLFe4Xx4NZYuEXTkt+CjDlfNinMBsMthOO41bU5HBy/n0PQM/3b6uOnbZ45v9ZYL4zJBIjC6WqfR+z8xPxvqoDaNHSc1a1O9ifWhtZertHIZ7zNPWFHZgdtFpNuAy0qmgSsREWXVjTRGAtfYX+L/d+o+u7fLIiM1UwCXbCYnx3NkcBT6EC139mt2ORUEPNR4UKd5rCXXmc2o9t+PivIBX91pemmiv9nwZuPcnJm5Mo6SABePSy0DWeguHzCKIdsI44UhPt91y4Bf+f8P+s/cOD2/lcFh2LvSk3U9b2l3G0rMM7Prgj17TUqYv2AaJ/jw7pLB5dMaupGDCpuQG9tMeWk6UzC0n9aNWKosI5Zc84kdRa5pLR133utjukok2GrvzFOpqIlxe4bt/NAdwb9JBEiaYW8SHROszD2kq/9XMWO7XEbCH2Dyx4TFYzgvTBuVjuQlCq01R58AigNK108GNbLUF7j/mosQbWZkG42FUX2bhAJCBkw06YsppUhjG7I79dZzvYzYx11iDNDdbQnTKPKZeWphUQj70wB//wRlCWdWZWd93fbJdd0rYluIHQHG8G2tbYgSu7QpFXc4gBzawAmWYVge+JmPqFAWPj24LF9MN6/NmtA8Quln+GBf/EA7kC6FDHsemDFW+GvDx9m7nL2DeZJihWQljQO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(4326008)(6512007)(450100002)(2906002)(8676002)(66556008)(5660300002)(8936002)(26005)(53546011)(6506007)(2616005)(508600001)(186003)(31696002)(6486002)(86362001)(38100700002)(31686004)(36756003)(82960400001)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWtnTTN1Q2NXcUc5OVhoQ0Uvd2RGOTRwKzdDYUtiem1rRE41VjlTQUJra2dK?=
 =?utf-8?B?SVljUjFZektBbTNHZXl3OE4yU0V1Q3hlMUpUM0w3QjltRllEb0xReWFDQ3pl?=
 =?utf-8?B?UmwxUEg4L0JMWnVpQXkxNDlEek9sVWhkRFdpWVVyZkpYTHpHdGtsM2poOXBm?=
 =?utf-8?B?VlQ4QVhqWWgzVlRZMnlMaktzamgxRGM4Mk1FU29xbExEbzAvTVFSWThuMGda?=
 =?utf-8?B?NXhYU1dDZUZYSElKb1VJRnEyMjNjbUY5ZUhzVW9QamUxMzVnTnYxeUZ0ckIz?=
 =?utf-8?B?YlJ3Ri95T2NtUElyZFYzdmo1Q0xLM2w0ZHhaK2JPaGhDdWsyQnRaVWlWcFFY?=
 =?utf-8?B?eW9OUGJVcFNaZmNEMXVad1FTWFc5ZUpjMVhCWjZ5alF3Qmh4VlUvSlhPTXZN?=
 =?utf-8?B?ZllQcEtPczdibUNaclBHQStZZ0NxclJSLzZVZ3NFUVZwaERNZEVDOVExU2d3?=
 =?utf-8?B?VXZEbVBlS2pFWEZlRmk1eUVmbzY0THhNbXUrL25hRC81NE9aVzNjaWQzQmdl?=
 =?utf-8?B?T1pxaXk2TUhiQzR2eEw0aU0vV0JsN0RmRTZpcGpxdk1uMW1kYUZma1FPQTEw?=
 =?utf-8?B?TGcrckE0WUJmTDFoa3BiV1g4T0xseHQ0LzdsdmVVajhrMFlGQVREWjhjci9z?=
 =?utf-8?B?aGJKNm1NMUdyNDBxWVlHczBFVjk0K0s5eFJab3dJUEJERXVIT0kvM0V1THBy?=
 =?utf-8?B?eU1QdUlzZFU0WWg5cWpqeHM3eTBUNTZ6bCsxRmNaaiswTGVqTGUzSE1OdVhD?=
 =?utf-8?B?TGI2bzJiWk5vL2RReXo3c0pua0tGNkVTRUNTc3JvLzdJMGlMS1d4RE1pNSts?=
 =?utf-8?B?bFJPSWtoMnE1VE9jRUhvaVNQSmtBc1NPMWFMa2lRR2ZOZk14UWs4T3JUeFNE?=
 =?utf-8?B?RU56V3FhL3QyQXpSRUpVS0ZKdnJTblpXd3hzQk13Q25nOFZRb05kY3pWZ01T?=
 =?utf-8?B?RjZZWUhtcmNndGRqRHpvVjZYTGdzRzZiWEVad1pLV1V5VmhwWVFYRU1VYlJt?=
 =?utf-8?B?aVdEZzhpczdvR0w5eGRZdXByUVc1RGVzVjQzMm5NWHczUnZMUzRzbHdtK3hp?=
 =?utf-8?B?UkdhcHpYS25YakFUa3F5RzBCZG83c1FrNmg5RFlMbEpTemRlVFZ1UFlxRVFN?=
 =?utf-8?B?SHVLTFhOYkpROFpZTDRGT1o0WFdsVmNpdTNmeUUzYk9hemtYdzdRWnhzVHBv?=
 =?utf-8?B?dmxsMFduZm9Cc2hFL1pHWURJbHlWeVpjaUZlQTZZRGx5TXBwaFNXRFdBQ2l2?=
 =?utf-8?B?dGR6V2ZlUWl1RVpCVStDN0d6VmM3QXdzbGQxeXJXOEM3WE4xN1ExVkZVdXBk?=
 =?utf-8?B?VituUDlYU2pUNzVkUjdtK1hBejdIcWdZL2cwa2xpbk1CWFQyV1p5MVBOUzNz?=
 =?utf-8?B?NFh6Q3RkMXVkbTlqZW43RmlVMHgvMjdlQWdud2JDZS9SRXQ1enMzUFJrdnNW?=
 =?utf-8?B?VkJjdm1seko1QUxNd1Nuc3Fua0RPTEMwN0ZrRnNvV1dXeDI1Qit6a3NRYTZy?=
 =?utf-8?B?R3R1SDdMYlJHUktlUlZabThmVVJVV1UyWWNXbTl3OWxkUEE5ekVPakR3Yjd0?=
 =?utf-8?B?ZkJlalZ2THNnVkhPYzB4TjUwNEVVamo4MnFkTk9wWEZvY211YTc4Rys4OC9r?=
 =?utf-8?B?MlhPWFk0d1ZEU0NsUmd5aU9STjg3WWU0MU1xVzh5YWtUS1dGUm0zalRkdjVp?=
 =?utf-8?B?UFRUaWxWVVBaUkZnSG1JTlEwT3ZwdzkwaWVBV2I3TTd1SjZpbkdiTE10ck5v?=
 =?utf-8?B?aWNOanNhQnpYS1pFVjdrbE56K1pib2l0YVNBeGJyamhHbnJFTkFNOWxRMHI5?=
 =?utf-8?B?VFZmWFJSaUg1UCtCWElGZ0N1elVqUC95SnZXc2I1MGI4ak5xTFg0K00xYWFR?=
 =?utf-8?B?bHl5L1dUbkRRL2NKYllTbmQvZERRY2xja3l1ZXE5cEFld1RKK1I5NUFWQTdq?=
 =?utf-8?B?a1hJZ0NmY2UvN0dUamZCbE5vN1c2UmRLdWRSREplcUIza3RmUU5YZFd3YXN0?=
 =?utf-8?B?dDRxeDB2dWNwa1UzVm9VQXVicm84djh2UTZaQVNrOVRiZ2VlQWpRNnV2cE4y?=
 =?utf-8?B?bG5rWjArTU9GUHQwUER3ei9ZdTZsSU9POU4rZHdDWEUzT3JTbS9IVnBEZWhv?=
 =?utf-8?B?aEJ3YXpYVFZRd2RmYnhuTlphU2FVVG1vbjlZZXU1S0cxUDBuYUZHMXpLZ1Qr?=
 =?utf-8?B?ZWl6MG9icUNIL2tFaDNuN25QT0Fma0x2b290RmRkYjIwbUl4NzBMazhGVjJR?=
 =?utf-8?B?NE9BekJNaUVUemRNdm9KRXpYZDFBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fae95ba-8ed1-43bd-9e59-08d9f6699554
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:12:38.9485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5fGFNzyZriAv4bkCKwCYPUo+CR3krvpZCqT/ya4ty0GFRI/XjvSqqL7UdihOJT6LlIaa6Q9o9NM0NJzsOgQnVrS1zqomiR4WuLwWa7ml5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
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



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor was being initialised early on in the context
> registration sequence. It could then be determined that the actual
> registration needs to be delayed and the descriptor would be wiped
> out. This is inefficient, so move the setup to later in the process
> after the point of no return.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0ab2d1a24bf6..aa74ec74194a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2153,6 +2153,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
>   					     0, loop);
>   }
>   
> +static void prepare_context_registration_info(struct intel_context *ce);
> +
>   static int register_context(struct intel_context *ce, bool loop)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> @@ -2163,6 +2165,8 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> +	prepare_context_registration_info(ce);
> +
>   	if (intel_context_is_parent(ce))
>   		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
>   						      offset, loop);
> @@ -2246,7 +2250,6 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   	struct intel_context *child;
>   
>   	GEM_BUG_ON(!engine->mask);
> -	GEM_BUG_ON(!sched_state_is_init(ce));
>   
>   	/*
>   	 * Ensure LRC + CT vmas are is same region as write barrier is done
> @@ -2314,9 +2317,13 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   	bool context_registered;
>   	int ret = 0;
>   
> +	GEM_BUG_ON(!sched_state_is_init(ce));
> +
>   	context_registered = ctx_id_mapped(guc, desc_idx);
>   
> -	prepare_context_registration_info(ce);
> +	if (context_registered)
> +		clr_ctx_id_mapping(guc, desc_idx);
> +	set_ctx_id_mapping(guc, desc_idx, ce);

I think we can do the clr unconditionally. Also, should we drop the 
clr/set pair in prepare_context_registration_info? it shouldn't be 
needed, unless I'm missing a path where we don;t pass through here.

Daniele

>   
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware

