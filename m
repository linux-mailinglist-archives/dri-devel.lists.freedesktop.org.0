Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F0B3D023F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 21:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6E6E06D;
	Tue, 20 Jul 2021 19:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D366E06D;
 Tue, 20 Jul 2021 19:45:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209414325"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="209414325"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 12:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="564524945"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2021 12:45:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 12:45:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 12:45:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 12:45:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 12:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoVK91vn+u/9uRiEB91l3X5qr0Vh9MToQHcrKDeaDPHoQqK3A4/qRcLGE0jXKaRlBzIxgcsOw5VQrj0Z2wb9mizT92WiXcG7puYp+hlkxxYBApIKof/MPc20cwVzWVIHKz7pQE3pNO8NZ85bNgXY4knJMwDuOcAFYFzVZgmbusJvHsxpFLGoVzPSV+MKIXjs2ps60opx9XQvob4M03DjXp+3Q7+5d5aHMJb4Mg9nG8GrdoPPy+4PpKYdEoMBjNXmLm6S47qKyT64oLGtl/eBTRUo7jeTKVbM1S7YpNsebbvkRVcRL3yynWy2RoF+KA4zxaund1mI1F6z0Uh1BL7jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOjSM4d5xwlrF10nDQU4BtotNlutfN3XsrhPNp2K2Cw=;
 b=bEjmQDfWFhB7fkh456SUqq2WmJfMzPKbW3GEOnyET2K9wQS5MtXn54Htm7Hzpa2BfSAV2OFChWf0vBwD+gKWsWjJBWs4xHlxBKXRtvlKn2b0ZJKk5pLbQuZwFhF7W2UaWGnA2xCveqfZB9Q1yRqXfKIydn+qTho/idREPgSBD3Y+Z016ZjmPJdeTLiHKx4JPzHYruBHer/y1+L57hCXkb/vM0cIzmcGy+8hvhgUWoa/kXJxUcZn1QRGoRzZETk8isKwupemFg5KE+isCGwSpGUDxCXERDT3jeHT6oOOcuuDToxlWcO6bA20OURBxv0fADJY2smXP7c6zKmA1nVbMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOjSM4d5xwlrF10nDQU4BtotNlutfN3XsrhPNp2K2Cw=;
 b=aiDRmOOQk+CxDsCTk+0mG48MLJ+livcrl2JaAE+ZUeZOo2U9YyrFg9xXjaBe9X1VP3GrYh8AI+GPiJyhsgjWqQOE8cVzAUoKA8FRntODxLX4zZOY3HjENaU268FVIG/HhXgGS23sLmmYQcBOD7Vpq9XDPnkvoZotVoomu0MM27U=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 19:45:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 19:45:39 +0000
Subject: Re: [PATCH 23/51] drm/i915/guc: Direct all breadcrumbs for a class to
 single breadcrumbs
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-24-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <5beee7a0-f0cc-2848-0ef8-dabb38af9c10@intel.com>
Date: Tue, 20 Jul 2021 12:45:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.10 via Frontend
 Transport; Tue, 20 Jul 2021 19:45:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a5e065-402d-42f5-b9ae-08d94bb6f388
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56271F9B1D13EFF17ABFB5AFBDE29@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTmUam+yhEwsZpuSrp68dEROSAQY1NZmPVXgAzsuPHZOwG8zz4eLYxuHmz0Zx1KkE0XwHN6DqUY0IsodNYPx1p9sesSEzy2GM5YCs4Pnn6WxzCJj+uYgUmflAqcc+sqNXyEGULE8MuogY9Uw+2rZj527dd0FiQxbL2JmlG2aR+25lrz3IedupwLGcMHU2kPFdgXupEsR7VTMhUuGieA+ZxPFGFhVZG5uKUN+AWE8XY04qaCRTbiYkoAGAgV4Txwb/lKISeJignz0eTjtwmnIFPVFLFyXzMxypqnuumhrEFOcPwG7DyvJ9+RNQyRt+9EVxWwRJLeMARSjvKdWs4KbtRswMCZOsUnAVBT/EyWlHv15ikLMV+wcZDWBiq3/ZTojIWhYw7+D5vvSdm04KRLmaUy3MZXiPcpKaxlu4ZTsHps1/mhBljCIWXNIvTmBduBCcUeTAKnAbHDCklhmTdU0VIXhTuM4bu+SBu3i/U59c9O2MZCaxU334cE0qT10cVKoUnib+mT6ho9LO0yXIJr4bZBRIM/lpOroIw91Cisz4YY4VG4oPV9/5vhxusvwSEFg8E287rdcuIH/m88d1I779LcIjqzP3zT2LFSIm9syWHrvaIU/E0yV7DHrNhr4r50Y/K0K/9hLjfPVr8+ubZ4pAT8hOdDIx3/XSS6TzooZkVIlQu9Dkm4Po5glc5k7iVYCKXNGGKCD0K0oiVTsrhFkwkSSwvjDSQo46obo/czEjujcoMgbTa9mBsBTEsmaWdRN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(16576012)(38100700002)(36756003)(30864003)(478600001)(450100002)(186003)(316002)(31686004)(8676002)(6486002)(53546011)(83380400001)(107886003)(2616005)(8936002)(5660300002)(86362001)(2906002)(31696002)(4326008)(66556008)(66476007)(956004)(26005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhyajJWSHBtQzJoRWtZTksxSTRqY2JEWHZoRlBJcTd4VVlhZUpYWEVZUHlL?=
 =?utf-8?B?RXVBdm1zdGF0UW5STXB6emtnOG9ZSUNGRXA3MWhIUkYxc1dNR1dIeGxnZ2dT?=
 =?utf-8?B?YTZDRnJLRUR4ZnBrajhYU3plVmdWK1JyUC91ZlkyVVBIMnlpTnlEOWwzZW03?=
 =?utf-8?B?b3hpbldoaHBTMDR3WC9EZWZWWTBxcDBWZm16MERTUlBiNFdtV1MraVh1cWpR?=
 =?utf-8?B?blgvQUdwc21zUDNUUTAxYkQza0pKWE5DTTFRUlNpczVqTlJhR1hJa1BOMGEz?=
 =?utf-8?B?bnRjWnNNaTErdEpJUkRtRWlCSnU4Zm1yWGVCQkFiWlJ3V0F6aEJ6UGdnUS9K?=
 =?utf-8?B?RmxxRG84bk1jQm9iOGJWNW1RZ3p2YldGWm43UktQSGV0bEFqS0JJdlcxU0I1?=
 =?utf-8?B?Y0NicnNDUFdEbGorQVZIY3MzVnZpSTN4dUd5azk3a2FkQUw4SjZ3c3k4d1Zr?=
 =?utf-8?B?aEtQVWtqc0RmaDZ1aXRyZ2ZXdkNHeUZoc1c4dm90ZDN4M3I2MnNuclRiWURN?=
 =?utf-8?B?TmNhUnVEa2VnRVcrQi81UUp0bTJ5Ymt4Vlo1T0pGVFJwNEdqUGxKaVpTdTlT?=
 =?utf-8?B?VlpsbE9KWkJvRDU3a1Ftd0R1ekVXWlpTNTN0dkVjWXF1N0lmUGtJeGFxOEZW?=
 =?utf-8?B?b1BuTzV3QWh1R0VCZ1Z2bVRpZ2czemNsaDdzUnYyK1RXc3ljalZjY3RtYVhQ?=
 =?utf-8?B?SXZYTkR2MGFzTFpuN2JzUk9HMUI5OXBqK3BmNTJlYmZzYTd2ZkRPUHA2c0hX?=
 =?utf-8?B?U2tpMjVURVZtb01URDUrSkh2MVM1T3FjV0RNQmZVd2YyTXNiWktPU2VvWXY1?=
 =?utf-8?B?SllxVE9QUEtJdk9PaHVWNGJSN3o0ajVGRklXdlhOYUZRTkpiL1VGSEo0N2Zk?=
 =?utf-8?B?YjFJWURxcE5sOVRmbHF1OVprYUxPV1BnZ3RxSk5GbG9KRy8rOHdjRWNZMFdo?=
 =?utf-8?B?VHZBbTRibmV5WFBVUlNPR01Yb2htdUQ5Q0E3eWxabHZtUmR6ZzhiaUhNRFkv?=
 =?utf-8?B?WTVmbk9wbGRNT3NYTjRHeFc2Z2dra1pmdFAzN0Y3NzNwMGlzYnRDTGVPNUJs?=
 =?utf-8?B?WWpvNzQwRkppMDJKT0kxNzFvS0FjMkVEb09hbDJtNXlTVlRSUXdiN2U3RnRR?=
 =?utf-8?B?dFRyTTFJK3Q4OEFDZVdLUE00bFpReTdvNFF2dWIzSEN4U0FKTzlKTlpJVWNL?=
 =?utf-8?B?Q0dJbUlmaDB4N0dkMWxzV0Z5UUlHV3FPWEVLUGhrSE9IVXJrTnN6YXk1NENT?=
 =?utf-8?B?cVhtN0I3Q2FwdmlyU0hOL1BRQ2lWYlRYL3pTdmxEVEVPSmM0ZVZIZTNUN1Z2?=
 =?utf-8?B?ZHpYN09tcFdycEttM2hSUVVoKy9Ia20xQUNWbEg1SWlXOWZCWHoyNTcwRWxE?=
 =?utf-8?B?d1ZqK1lNeVZTNFFMM2V1TG9yTS9Pci85OHExR295Sm1FZVdJNkZ4TVFOK1pv?=
 =?utf-8?B?cUZwNzRlR2p5UVVTdy8wZWZxVFRvMmlnVTBJTDJGTGs3U25hUFpoYmpWNzQz?=
 =?utf-8?B?T0gzNWlFVWJmZDhUK0s1K1N4cFI2S1Y5ODhjeXRnekpkTkVxRlFuYVU1ZUU4?=
 =?utf-8?B?dkhYemJBeGNNQVlLYVoxNjcyMWlTVzZWUUxFYi9sSWUxOVFnczEzNm9TUGRn?=
 =?utf-8?B?SnozVW51MEpFbzdhTWIyNEFzSDI4b2NRZ09EczBzdEpQRUFzdkU2cVA4R2Yz?=
 =?utf-8?B?VElKNEZEcjdPSWdOZlR2aWMvbnliOVZFd2ZubTNwSElqTmw1L0poWTFUTmpX?=
 =?utf-8?Q?twDyu8ucNseRcduOA90nz5P+MQZdEq8KfDwu+yD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a5e065-402d-42f5-b9ae-08d94bb6f388
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 19:45:39.2954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOxH8HeOCLQE2fBAmnL6wSWubGYDXlp4eHhFrtHVvGZoSDdC8wTJ9hvPCRGLFaBYEz32obotn7sBbVrXUlzQQ8rImNRFW+QNFUQJ/xSONIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> With GuC virtual engines the physical engine which a request executes
> and completes on isn't known to the i915. Therefore we can't attach a
> request to a physical engines breadcrumbs. To work around this we create
> a single breadcrumbs per engine class when using GuC submission and
> direct all physical engine interrupts to this breadcrumbs.
>
> v2:
>   (John H)
>    - Rework header file structure so intel_engine_mask_t can be in
>      intel_engine_types.h
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> CC: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   | 41 +++++-------
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   | 16 ++++-
>   .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |  7 ++
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  3 +
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 28 +++++++-
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  2 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
>   drivers/gpu/drm/i915/gt/mock_engine.c         |  4 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 67 +++++++++++++++++--
>   9 files changed, 133 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index 38cc42783dfb..2007dc6f6b99 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -15,28 +15,14 @@
>   #include "intel_gt_pm.h"
>   #include "intel_gt_requests.h"
>   
> -static bool irq_enable(struct intel_engine_cs *engine)
> +static bool irq_enable(struct intel_breadcrumbs *b)
>   {
> -	if (!engine->irq_enable)
> -		return false;
> -
> -	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> -	engine->irq_enable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> -
> -	return true;
> +	return intel_engine_irq_enable(b->irq_engine);
>   }
>   
> -static void irq_disable(struct intel_engine_cs *engine)
> +static void irq_disable(struct intel_breadcrumbs *b)
>   {
> -	if (!engine->irq_disable)
> -		return;
> -
> -	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> -	engine->irq_disable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> +	intel_engine_irq_disable(b->irq_engine);
>   }
>   
>   static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
> @@ -57,7 +43,7 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
>   	WRITE_ONCE(b->irq_armed, true);
>   
>   	/* Requests may have completed before we could enable the interrupt. */
> -	if (!b->irq_enabled++ && irq_enable(b->irq_engine))
> +	if (!b->irq_enabled++ && b->irq_enable(b))
>   		irq_work_queue(&b->irq_work);
>   }
>   
> @@ -76,7 +62,7 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
>   {
>   	GEM_BUG_ON(!b->irq_enabled);
>   	if (!--b->irq_enabled)
> -		irq_disable(b->irq_engine);
> +		b->irq_disable(b);
>   
>   	WRITE_ONCE(b->irq_armed, false);
>   	intel_gt_pm_put_async(b->irq_engine->gt);
> @@ -281,7 +267,7 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
>   	if (!b)
>   		return NULL;
>   
> -	b->irq_engine = irq_engine;
> +	kref_init(&b->ref);
>   
>   	spin_lock_init(&b->signalers_lock);
>   	INIT_LIST_HEAD(&b->signalers);
> @@ -290,6 +276,10 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
>   	spin_lock_init(&b->irq_lock);
>   	init_irq_work(&b->irq_work, signal_irq_work);
>   
> +	b->irq_engine = irq_engine;
> +	b->irq_enable = irq_enable;
> +	b->irq_disable = irq_disable;
> +
>   	return b;
>   }
>   
> @@ -303,9 +293,9 @@ void intel_breadcrumbs_reset(struct intel_breadcrumbs *b)
>   	spin_lock_irqsave(&b->irq_lock, flags);
>   
>   	if (b->irq_enabled)
> -		irq_enable(b->irq_engine);
> +		b->irq_enable(b);
>   	else
> -		irq_disable(b->irq_engine);
> +		b->irq_disable(b);
>   
>   	spin_unlock_irqrestore(&b->irq_lock, flags);
>   }
> @@ -325,11 +315,14 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs *b)
>   	}
>   }
>   
> -void intel_breadcrumbs_free(struct intel_breadcrumbs *b)
> +void intel_breadcrumbs_free(struct kref *kref)
>   {
> +	struct intel_breadcrumbs *b = container_of(kref, typeof(*b), ref);
> +
>   	irq_work_sync(&b->irq_work);
>   	GEM_BUG_ON(!list_empty(&b->signalers));
>   	GEM_BUG_ON(b->irq_armed);
> +
>   	kfree(b);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
> index 3ce5ce270b04..be0d4f379a85 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
> @@ -9,7 +9,7 @@
>   #include <linux/atomic.h>
>   #include <linux/irq_work.h>
>   
> -#include "intel_engine_types.h"
> +#include "intel_breadcrumbs_types.h"
>   
>   struct drm_printer;
>   struct i915_request;
> @@ -17,7 +17,7 @@ struct intel_breadcrumbs;
>   
>   struct intel_breadcrumbs *
>   intel_breadcrumbs_create(struct intel_engine_cs *irq_engine);
> -void intel_breadcrumbs_free(struct intel_breadcrumbs *b);
> +void intel_breadcrumbs_free(struct kref *kref);
>   
>   void intel_breadcrumbs_reset(struct intel_breadcrumbs *b);
>   void __intel_breadcrumbs_park(struct intel_breadcrumbs *b);
> @@ -48,4 +48,16 @@ void i915_request_cancel_breadcrumb(struct i915_request *request);
>   void intel_context_remove_breadcrumbs(struct intel_context *ce,
>   				      struct intel_breadcrumbs *b);
>   
> +static inline struct intel_breadcrumbs *
> +intel_breadcrumbs_get(struct intel_breadcrumbs *b)
> +{
> +	kref_get(&b->ref);
> +	return b;
> +}
> +
> +static inline void intel_breadcrumbs_put(struct intel_breadcrumbs *b)
> +{
> +	kref_put(&b->ref, intel_breadcrumbs_free);
> +}
> +
>   #endif /* __INTEL_BREADCRUMBS__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> index 3a084ce8ff5e..72dfd3748c4c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> @@ -7,10 +7,13 @@
>   #define __INTEL_BREADCRUMBS_TYPES__
>   
>   #include <linux/irq_work.h>
> +#include <linux/kref.h>
>   #include <linux/list.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
>   
> +#include "intel_engine_types.h"
> +
>   /*
>    * Rather than have every client wait upon all user interrupts,
>    * with the herd waking after every interrupt and each doing the
> @@ -29,6 +32,7 @@
>    * the overhead of waking that client is much preferred.
>    */
>   struct intel_breadcrumbs {
> +	struct kref ref;
>   	atomic_t active;
>   
>   	spinlock_t signalers_lock; /* protects the list of signalers */
> @@ -42,7 +46,10 @@ struct intel_breadcrumbs {
>   	bool irq_armed;
>   
>   	/* Not all breadcrumbs are attached to physical HW */
> +	intel_engine_mask_t	engine_mask;
>   	struct intel_engine_cs *irq_engine;
> +	bool	(*irq_enable)(struct intel_breadcrumbs *b);
> +	void	(*irq_disable)(struct intel_breadcrumbs *b);
>   };
>   
>   #endif /* __INTEL_BREADCRUMBS_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 9fec0aca5f4b..edbde6171bca 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -212,6 +212,9 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
>   
>   void intel_engine_init_execlists(struct intel_engine_cs *engine);
>   
> +bool intel_engine_irq_enable(struct intel_engine_cs *engine);
> +void intel_engine_irq_disable(struct intel_engine_cs *engine);
> +
>   static inline void __intel_engine_reset(struct intel_engine_cs *engine,
>   					bool stalled)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index b7292d5cb7da..d95d666407f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -739,7 +739,7 @@ static int engine_setup_common(struct intel_engine_cs *engine)
>   err_cmd_parser:
>   	i915_sched_engine_put(engine->sched_engine);
>   err_sched_engine:
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   err_status:
>   	cleanup_status_page(engine);
>   	return err;
> @@ -948,7 +948,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
>   	GEM_BUG_ON(!list_empty(&engine->sched_engine->requests));
>   
>   	i915_sched_engine_put(engine->sched_engine);
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   
>   	intel_engine_fini_retire(engine);
>   	intel_engine_cleanup_cmd_parser(engine);
> @@ -1265,6 +1265,30 @@ bool intel_engines_are_idle(struct intel_gt *gt)
>   	return true;
>   }
>   
> +bool intel_engine_irq_enable(struct intel_engine_cs *engine)
> +{
> +	if (!engine->irq_enable)
> +		return false;
> +
> +	/* Caller disables interrupts */
> +	spin_lock(&engine->gt->irq_lock);
> +	engine->irq_enable(engine);
> +	spin_unlock(&engine->gt->irq_lock);
> +
> +	return true;
> +}
> +
> +void intel_engine_irq_disable(struct intel_engine_cs *engine)
> +{
> +	if (!engine->irq_disable)
> +		return;
> +
> +	/* Caller disables interrupts */
> +	spin_lock(&engine->gt->irq_lock);
> +	engine->irq_disable(engine);
> +	spin_unlock(&engine->gt->irq_lock);
> +}
> +
>   void intel_engines_reset_default_submission(struct intel_gt *gt)
>   {
>   	struct intel_engine_cs *engine;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 8ad304b2f2e4..03a81e8d87f4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -21,7 +21,6 @@
>   #include "i915_pmu.h"
>   #include "i915_priolist_types.h"
>   #include "i915_selftest.h"
> -#include "intel_breadcrumbs_types.h"
>   #include "intel_sseu.h"
>   #include "intel_timeline_types.h"
>   #include "intel_uncore.h"
> @@ -63,6 +62,7 @@ struct i915_sched_engine;
>   struct intel_gt;
>   struct intel_ring;
>   struct intel_uncore;
> +struct intel_breadcrumbs;
>   
>   typedef u8 intel_engine_mask_t;
>   #define ALL_ENGINES ((intel_engine_mask_t)~0ul)
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 920707e22eb0..abe48421fd7a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3407,7 +3407,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
>   	intel_context_fini(&ve->context);
>   
>   	if (ve->base.breadcrumbs)
> -		intel_breadcrumbs_free(ve->base.breadcrumbs);
> +		intel_breadcrumbs_put(ve->base.breadcrumbs);
>   	if (ve->base.sched_engine)
>   		i915_sched_engine_put(ve->base.sched_engine);
>   	intel_engine_free_request_pool(&ve->base);
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 9203c766db80..fc5a65ab1937 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -284,7 +284,7 @@ static void mock_engine_release(struct intel_engine_cs *engine)
>   	GEM_BUG_ON(timer_pending(&mock->hw_delay));
>   
>   	i915_sched_engine_put(engine->sched_engine);
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   
>   	intel_context_unpin(engine->kernel_context);
>   	intel_context_put(engine->kernel_context);
> @@ -376,7 +376,7 @@ int mock_engine_init(struct intel_engine_cs *engine)
>   	return 0;
>   
>   err_breadcrumbs:
> -	intel_breadcrumbs_free(engine->breadcrumbs);
> +	intel_breadcrumbs_put(engine->breadcrumbs);
>   err_schedule:
>   	i915_sched_engine_put(engine->sched_engine);
>   	return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 372e0dc7617a..9f28899ff17f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1076,6 +1076,9 @@ static void __guc_context_destroy(struct intel_context *ce)
>   		struct guc_virtual_engine *ve =
>   			container_of(ce, typeof(*ve), context);
>   
> +		if (ve->base.breadcrumbs)
> +			intel_breadcrumbs_put(ve->base.breadcrumbs);
> +
>   		kfree(ve);
>   	} else {
>   		intel_context_free(ce);
> @@ -1366,6 +1369,62 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> +static bool
> +guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
> +{
> +	struct intel_engine_cs *sibling;
> +	intel_engine_mask_t tmp, mask = b->engine_mask;
> +	bool result = false;
> +
> +	for_each_engine_masked(sibling, b->irq_engine->gt, mask, tmp)
> +		result |= intel_engine_irq_enable(sibling);
> +
> +	return result;
> +}
> +
> +static void
> +guc_irq_disable_breadcrumbs(struct intel_breadcrumbs *b)
> +{
> +	struct intel_engine_cs *sibling;
> +	intel_engine_mask_t tmp, mask = b->engine_mask;
> +
> +	for_each_engine_masked(sibling, b->irq_engine->gt, mask, tmp)
> +		intel_engine_irq_disable(sibling);
> +}
> +
> +static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
> +{
> +	int i;
> +
> +       /*
> +        * In GuC submission mode we do not know which physical engine a request
> +        * will be scheduled on, this creates a problem because the breadcrumb
> +        * interrupt is per physical engine. To work around this we attach
> +        * requests and direct all breadcrumb interrupts to the first instance
> +        * of an engine per class. In addition all breadcrumb interrupts are
> +	* enabled / disabled across an engine class in unison.
> +        */
> +	for (i = 0; i < MAX_ENGINE_INSTANCE; ++i) {
> +		struct intel_engine_cs *sibling =
> +			engine->gt->engine_class[engine->class][i];
> +
> +		if (sibling) {
> +			if (engine->breadcrumbs != sibling->breadcrumbs) {
> +				intel_breadcrumbs_put(engine->breadcrumbs);
> +				engine->breadcrumbs =
> +					intel_breadcrumbs_get(sibling->breadcrumbs);
> +			}
> +			break;
> +		}
> +	}
> +
> +	if (engine->breadcrumbs) {
> +		engine->breadcrumbs->engine_mask |= engine->mask;
> +		engine->breadcrumbs->irq_enable = guc_irq_enable_breadcrumbs;
> +		engine->breadcrumbs->irq_disable = guc_irq_disable_breadcrumbs;
> +	}
> +}
> +
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>   {
>   	struct intel_timeline *tl;
> @@ -1589,6 +1648,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   
>   	guc_default_vfuncs(engine);
>   	guc_default_irqs(engine);
> +	guc_init_breadcrumbs(engine);
>   
>   	if (engine->class == RENDER_CLASS)
>   		rcs_submission_override(engine);
> @@ -1831,11 +1891,6 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
>   	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
>   	ve->base.saturated = ALL_ENGINES;
> -	ve->base.breadcrumbs = intel_breadcrumbs_create(&ve->base);
> -	if (!ve->base.breadcrumbs) {
> -		kfree(ve);
> -		return ERR_PTR(-ENOMEM);
> -	}
>   
>   	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
>   
> @@ -1884,6 +1939,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   				sibling->emit_fini_breadcrumb;
>   			ve->base.emit_fini_breadcrumb_dw =
>   				sibling->emit_fini_breadcrumb_dw;
> +			ve->base.breadcrumbs =
> +				intel_breadcrumbs_get(sibling->breadcrumbs);
>   
>   			ve->base.flags |= sibling->flags;
>   

