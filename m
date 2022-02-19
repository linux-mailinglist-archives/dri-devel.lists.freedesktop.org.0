Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782404BC3C3
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC0A10EB58;
	Sat, 19 Feb 2022 00:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DB210EADB;
 Sat, 19 Feb 2022 00:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645232083; x=1676768083;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=stI8A5iyhQKmZw+/MM0V81Rh500jSwDD5W/y/laqKQw=;
 b=gCyVOuoRcqnluCQ/L0SQlH/eSXNJ59Y72XzWA6RqkdbV5V/PjdyGzmjT
 b0Ry4CfDab1fRCMqWYCbc8/odjL4Gs1r4M7CLnOqzNdBDxDmKoGjvktFU
 X/6FQR6VtPXIFBD9gpPywuy+3pXEEqtXQLyLRabAV3yIZ+seslJ3e0cwW
 lnTPRgwCnPGL1mU3qlTKzkLUCJ2Lb9L7hcasOGQY47trw8HZjaCfxYhtl
 g4oFp9P3RP44+Spv1XcYeeTOUzMnWx+6shIjRuFWh35+E8XAWs1sfqE+1
 qiIKtGCtAI4d25L2o0bco+ULGxL6r+KUN9o1jEz9TKYCF31m1hSPH1a8m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="231224149"
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="231224149"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 16:54:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="572506130"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 18 Feb 2022 16:54:42 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 16:54:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 16:54:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 16:54:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 16:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbMrMAXr18A0L1L8Lc2uqpkLmvrvZPLlW0TsXfY9Fae/fFKhWogSRAZjNpfwOOLPL6v6li71L+3duhk9+5ObOewsKGr1WHRI6yD2W/JrZuJ/lFK1wZ9GIg9dz/oqGpDtXzEWiQbz2Uys9k1P6RkHz4uuDjosk4XLhH3U74k48CFNO7gH3vvwYxr09PpBe1iimZtTbM61NflUReyXM4CM8vo57bqwjsX5v4BKRWbKnWH5ItGgpwm9YHYNikF42T1Fg/UkJroPHPOCb1X1ntS9nsPQklVB8f7auYIaSa6VmHsWrNazZiCU1M5fr0gFaqu+NEpRWhsTjhjyTCA772bXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKTgHFc6HNeRVCcR2uKXrf5lg4C1w9hLURhb8pujb34=;
 b=In0nEUO+F+qGGVzbWamrDJP0Gx92fvcpCffOoj4Oa5VoYupbFRyzbfvI+/Yj3YNdvKwwzQv60TxwHe7w1BDzD9cbghE8AZRk4hq7xi072ELBG/bauXwQQmUtpXzaQNf5GwDAMR3ggHcIUrJwTPnlZodmrBBctZ6oKoB3oknljBtoF9SV2Thfz4HNcdwR0B8xvqw3dnHz6wmN4f0LSLCYuEcWogQGGNo/sseBrlqZkcCPjlcG5az5mu7AxwOCR2WEuVsvVWu618T9RaIkZ8gzJy22Oy05ZD3NXDq48JIfZV66Quu05Xn+Xq9bIV7Hvee4PBWqjzz5Lp6ajYW29NZCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN6PR11MB1620.namprd11.prod.outlook.com (2603:10b6:405:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Sat, 19 Feb
 2022 00:54:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.4995.024; Sat, 19 Feb 2022
 00:54:39 +0000
Message-ID: <3ca41e61-1072-67ad-ed26-43964fb1920f@intel.com>
Date: Fri, 18 Feb 2022 16:54:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/i915/guc: Initialize GuC submission locks and queues
 early
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR12CA0035.namprd12.prod.outlook.com
 (2603:10b6:301:2::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f36770-8603-4949-5446-08d9f342682a
X-MS-TrafficTypeDiagnostic: BN6PR11MB1620:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB1620362C33BB7959CE35B586BD389@BN6PR11MB1620.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xghUuHm8pMt6JNp8ZUkSLlA/sYMyr3kWiZd2b/q/QAFT2jAPkQvO2MvtW2ZtaQ++0E199+D7nEklXqYRiFvDz/WdyrqKkKWQz2DMcOEMdtlSLFmXZMFGpfam+pRfsyCXDuJmT1JZsxjr2+O1pNlOTEpE6ojJL1P/ZTIPhzS5AYfG4DMrZhtrkS118s/xMkv5L6gkwQ03srDEauW0i4q1kef2uz0Dpj1fEKaRx4RL/7kRyAc1GFZuh64toPI34dYFf1z2gqyhBRVhDjDOXg59SZGTqj7VvYMvGaXpiN5aPhHz/MBgwgbyNjHbkanUhfeF8pttZ16XPlrBKthtpUXRKtY7SeqYsGCdJULj+aSUXf/g1UDSK8yIIsE2o0J7KDN9gBCBOKJfN+iVgVlXAlrkV6V6eXE09OCDqP4KKfWfeqXrWBCszXfiWZXxtiodsp4YaJAUiL2m1BDq7BKRNjUg1IBCTtFZYPrIVPBjRjyL1RV2rytjLSLZOqyX9/uYn3limvrcQ3DIjXN335lamlR1Z7OAJa5nHchxuJjl5xMAIfDGMVuqXhY3WPlU4+5ZRrzhe0BPkx21kdJDhabOTdRWrywqcqq2mxQsaiSEInYbGvkeimcbCGl9TY0GqSBTCkFh0SenwZo6rck7mti0YANXio6gTZ1bpwAOn9EZjm5uOb3qWK+sRPyt8+vDVWG8/Q81AQYdxPSGc7+PiZYcRWt9yXLDN8YcmY0MasTKnOZ3JCglrRvDQ2JgiiCWe5cd0ZTJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(2616005)(26005)(186003)(2906002)(316002)(508600001)(86362001)(36756003)(6486002)(31686004)(966005)(66476007)(4326008)(8936002)(6666004)(5660300002)(31696002)(53546011)(8676002)(6512007)(83380400001)(450100002)(66556008)(6506007)(66946007)(107886003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxHUWRkQmF6K3ZBYndZcEdSenl3dTZMeUFFVHU5RlduN2pGK2xSdG1TMzRx?=
 =?utf-8?B?VHJwaW9pU0daWTNnYTZZcFVaYTV3MzJTUk82bmZGd1V3SzJiKzBwbmZXcWNq?=
 =?utf-8?B?V0ZGREtwTjVqU1E1YUp5WUUzL000SC9lT053UVNhZXcyNWFOK2NVa1JCUWFZ?=
 =?utf-8?B?bko2YlpRS3hDazkyamgrM3JYWmRCNndlM2lROGFGdEhSY0hQTndLVFoxR3VC?=
 =?utf-8?B?Rld4SmtHSGpMUUhnTTJSMjhGVjNwMnpZajlCVThmeFF2c0RzM2lOOExIL3lF?=
 =?utf-8?B?ekxZQzhzLzRpTUYxVS9CZWFlSTZOc2VRUDF2U0x6cjkwenZtOTg3L3FXQnVi?=
 =?utf-8?B?SDlWd3B0NytES3ZCMkR5R2lyN1FMOVNnellXQndVQWdEbURIUG5lcHlNRk1y?=
 =?utf-8?B?N0J6c1c3MFdEdjcwL2ZSdkFGTFRrYU9GUVdxV3o5b2N3WmZNR3JrMmxobUcx?=
 =?utf-8?B?OGdXS3ByNlp6YnBhQ082WG1qblVSK2FpQ2RONzhJNGR6VDROSG04K3c4Tm1w?=
 =?utf-8?B?Z1h5bEVYcm14N2ZlOUhKZlJ4V3cyeUlPM2JFS2dhRk9PU09pb2RSNDIxVVI4?=
 =?utf-8?B?dGowTVpLUnVHWXpuZnNqYkI5aWRqQmMzSk94UEdlVGFnRDRyMkM5MkwvSlhL?=
 =?utf-8?B?Wkw1akhzcmg3VThtaStSSStvUjY5THZyUVVUREppQlh3MDBLdWtWSE1SUTlB?=
 =?utf-8?B?NE00THdRdXJybVNRVzJGYVNlUXc1bk9WUy80eFlpbHhETDZ6ODhma0dtcEtC?=
 =?utf-8?B?bThwYkpMU3lXSlRpRm52QjRybTlpL2wzTExHRHh4MCsrVHgvY29kWUZnbHM0?=
 =?utf-8?B?VjZ6YTF0WWJhVkVIdzdTTWxTcUtGaXRLVHZQRTFZY2FpQjg5K2xZd3JWa24y?=
 =?utf-8?B?SGlrT1NERjVZekduRDNtYlJMaUtNRDMzTVFuTithR2JiRXhEWXVIck9MYWJw?=
 =?utf-8?B?TlFWMDJGRlRaUTN3Y1JEVDU4LzcyTUVXTm5RQ2VwTWtiMnhlanROMm1iQXJl?=
 =?utf-8?B?OEtEYjBuVUZGRVdoSFNlYWRQbFZIcnZaUCtVZURNcG5zdE5PWVA2NFBZN2tz?=
 =?utf-8?B?aFN0bmRZbndjT3duTmRqaUdUcThJMXNTZDNjOGdxODgvSkp5SzluOEtNOER0?=
 =?utf-8?B?K0FaUmVtUUE5QzcvMGtINm5wNVFLQkFnaWVqMEJZZEVCdnZuQWxvaUxFaVI0?=
 =?utf-8?B?RTVXZWsxdnNjNXo4R3F4bDRmcHIvLzRsUWl2ZmJHVjRqWFZQWDBEYjIzZ2R0?=
 =?utf-8?B?ZS9GWkhVeVBSRnpiSFkrcGw4YUU4UkYxVUpIVytqRndaR3Rnbk9YdWZTTFhw?=
 =?utf-8?B?Z3A2TjRHQnYrUkdYYWZTODJFVk5VWE5Gak1aUHJ1ZkVFSnlsazVRRkM4dDZD?=
 =?utf-8?B?MDByNjJZeWE5NVIzMFoxREQraWZhaU02bnQ3NEVPb0pyTEl5eWRBMVE1czNP?=
 =?utf-8?B?SGlFNmVKeUErZzRiSFZGZUg2Rk5GZ05LUkRXNEkrU0FRMzg1UFowZjUxSHEy?=
 =?utf-8?B?ZU1VeVp6Tm0yZGdQdXAxZjlEVWxoenBNQWJTNEFDamt1OGNiZjlZNG45YUNo?=
 =?utf-8?B?TTlYREhIQWFXQ1c4TzE4a0tEcWdrdU13RWphcGlRTGxlc3htODNmUE1jTjl0?=
 =?utf-8?B?RDNzMEF0M2hCVi84bUExMmx2b29xa1hsdlR6YXJ6OENzNWU1SC9OODk3SFUv?=
 =?utf-8?B?TTQyd2xUM3ZsQ2NUaGR3dzB1cW9JVmx3S3VxZEEvMnpwc2c5RVZka2M4R3dK?=
 =?utf-8?B?a2lZYlBmOHY0STdyY0h0L0lQSHI4bEszallpcUcrZTdkQ3VUTWozbVVkVHdo?=
 =?utf-8?B?Y1pLRm94TG84cmRqTjR4QzdLSGI4dUhwb21GSnRWaXp1NUVudVNvejlsbTl4?=
 =?utf-8?B?d1lxRzBXZVJKN21NVEVoUVFMSExnVEpQTlpjbTluRGhoRmNRUEVNa095Z3I5?=
 =?utf-8?B?Uk90R3lMei8xZ0M0RjVHOWZiYnZ0YXFSdmFsTlpIS2l6emp0d0oxUU5hMUYr?=
 =?utf-8?B?Ry9ITkdQcUY3bk9kMlJUd0lqclpEZkIyYkNFQ3RjRWFBekVEUTUvWk45S3NY?=
 =?utf-8?B?MWVKeFRQcC9Dd0NHOG9uN0I4M3VmSkV5Qk13Nlc3TEhKbGkwZk9FZDQ5NzBl?=
 =?utf-8?B?eW9lL2FkNjFNek0zaVlVV1lNYlQrb0Fpd3FHUUlGTnIwNVRwaS8vd1VidDVa?=
 =?utf-8?B?eU5BSURqa2traUQybUh1QkpTVUZ5SDNXSElPcnI5OFJuZ2dZaHYrVG54ZUFM?=
 =?utf-8?Q?s9SqS7N2XnzI7zeC8JKyEy733kKslPVJMhIG1fVFZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f36770-8603-4949-5446-08d9f342682a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 00:54:39.2662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6S/pN56JI1sLm01pj0x73EvLs9+yo1SLQ5z4ZRhS9FSwr4ijd77yNKaxj1vAXuFmGrdoeRfH7j3cZRvmDynGAbjFLyE9unHfN/jWC0hdg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1620
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/14/2022 17:11, Daniele Ceraolo Spurio wrote:
> Move initialization of submission-related spinlock, lists and workers to
> init_early. This fixes an issue where if the GuC init fails we might
> still try to get the lock in the context cleanup code. Note that it is
> safe to call the GuC context cleanup code even if the init failed
> because all contexts are initialized with an invalid GuC ID, which will
> cause the GuC side of the cleanup to be skipped, so it is easier to just
> make sure the variables are initialized than to special case the cleanup
> to handle the case when they're not.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4932
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++---------
>   1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0da..2160da2c83cbf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1818,24 +1818,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	 */
>   	GEM_BUG_ON(!guc->lrc_desc_pool);
>   
> -	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> -
> -	spin_lock_init(&guc->submission_state.lock);
> -	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> -	ida_init(&guc->submission_state.guc_ids);
> -	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> -	INIT_WORK(&guc->submission_state.destroyed_worker,
> -		  destroyed_worker_func);
> -	INIT_WORK(&guc->submission_state.reset_fail_worker,
> -		  reset_fail_worker_func);
> -
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>   	if (!guc->submission_state.guc_ids_bitmap)
>   		return -ENOMEM;
>   
> -	spin_lock_init(&guc->timestamp.lock);
> -	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
>   	guc->timestamp.shift = gpm_timestamp_shift(gt);
>   
> @@ -3831,6 +3818,20 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> +
> +	spin_lock_init(&guc->submission_state.lock);
> +	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> +	ida_init(&guc->submission_state.guc_ids);
> +	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> +	INIT_WORK(&guc->submission_state.destroyed_worker,
> +		  destroyed_worker_func);
> +	INIT_WORK(&guc->submission_state.reset_fail_worker,
> +		  reset_fail_worker_func);
> +
> +	spin_lock_init(&guc->timestamp.lock);
> +	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
> +
>   	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);

