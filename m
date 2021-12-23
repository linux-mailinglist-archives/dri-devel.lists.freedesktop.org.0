Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C809A47DC57
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D53710E219;
	Thu, 23 Dec 2021 00:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA73910E219;
 Thu, 23 Dec 2021 00:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640220525; x=1671756525;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Hrmu2N5E3nGtDP3EnXHvh//+ir8uj/+no9P82rzwRU=;
 b=ZIFAnEx4/cWVY7tHQyKFR16zxrNsVPdN6pyxj9sl74aB3kqefOkBAJeu
 WPWUcq0AGn5m1g8HS3hr88tF4jxcC14VSWHx3WNLhlqWVEggq6h6PpLSL
 1Fu52a7WnCUr4zvo/Dp9Bq9/7XH3LcUXUzSPU4UquCwVTOFhKEqu/4uNA
 gwZXOQEO4P+ZAKOzTBZ0vGDUO53wLFuKZVfSyTsJetT19Qqr01ETvs7iv
 tBq7ia5VpMlC5D+9njVydt/dsrW4lHF5RA2spgtEje8mY5eCgu/S6QvrP
 gfmvOclZiMqzmlpRfSAdUz09qMJ0NJz7PEgFCUXtu4lmSwEtHlGBmlnwf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="227576698"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="227576698"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 16:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="466836799"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 22 Dec 2021 16:48:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 16:48:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 22 Dec 2021 16:48:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 22 Dec 2021 16:48:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8pqo9SmSQSgXDCXuK2ewzkTrMS6bKlgxHyjvSubEIPvMkyfbAY89o1LwJFYFXxAqwgOMPw2LQ3KFbKz61vIoT1EmKs3Eq2eKlN9N4r0e/IxlglBI/gtQxwAuBokKpvYRJsnfOkF0Mfmxmyv6IDco8aZdi8i4Lld9EB6wGLOMLqha7L46614QVLpb08LLX66AsOEpl9PjOUiPCRFgGU9o01b8yrbNLQnDUy9rjaVlM/ycn6lpLLx5DIB4itxMGXd/FsSmdvZnv47YEH8UxWTwzPTEvpQbWQ4Ay4v3LrEYU98Czbpgnd6Zf9eXNwsM2J9PbWj1LP+1CH9qU5sCw5sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gS1hWUXTiR5H5l4R6KVSOywl8DbIuS8NyoBQHO8tBgg=;
 b=ekuNUefBhDvl2mni15xX/Y+ERRJOqzW/hbrMOjWfzAdePFYbfKjUR9M3I1v/fXjIhU01LzJNeaE0zMF+nSoIlnKzxp4ommyfOkBKLDw75Tgc6Iwc3BT8YtMrCIBq79ViXmyGSCL2nBIMsr9y60FJrNbX2Z4oUjY1SY7JLEHqxVPtVBNNswSzpZ6Ngu8OFYklIzm+kPGKrsYATSsXoufpPIIM4V4qhlc/swEEeLC/BPOZfa5jdtpMB7sOoPJ72hwgc7zFskeLafwX0JqEiIGhH1iTqserz2JLmT2M5B7Q71VwIYPYRV91bc9uz0AwRpHT/j1R+TUK4LS/NGeTUM9H1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3478.namprd11.prod.outlook.com (2603:10b6:a03:7b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Thu, 23 Dec
 2021 00:48:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 00:48:39 +0000
Message-ID: <81b87979-5f03-3841-b580-ad596e641805@intel.com>
Date: Wed, 22 Dec 2021 16:48:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/i915/guc: Use lockless list for destroyed contexts
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211222232907.12735-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211222232907.12735-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:301:1::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5c14cef-993d-454a-e97b-08d9c5adf578
X-MS-TrafficTypeDiagnostic: BYAPR11MB3478:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB34787DE509524DADAF208CF7BD7E9@BYAPR11MB3478.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1q3vCE3Bk6LQTI4/yCpS/m2tgiRHn2jTVqGQw1PHrJdrVMbjoShIwiVOVgxwpV0YvJtsDUwB1oePqWF0WPRaJRErWlTzcnXhXYXMt22bsHY5jsXyc9iNKOBw3STujaC2LpwU8S45IW4QLHkCN5p5e1a56KVgRhMHDRG2SDSVqkVpRK60lfUv0soNs1FUXmF30yomHRG5o1xlVob+42XqUSzVjuhSKiFkZligWj0hia/st8Ullz1Ih/O/dbiMluZAEzoIXFR4cdeH7z1NrNTAsu5I9hmA3kmD0a5S+mqmE4Ut80IqLJpew2c2xOzGYl/HrD6QY9jof2gpOCEQPkIhTk3NnKaondDUf9z5a/z4xLfqcF/+0Gft2Hch9ly1k01nu6GOg9CRuLDzdAPzVsVHxxeU1kTU7ZjMkkEEkkIyiXutYR6Hl8LEDoTXqmIH3jbfQjjwelNIC+pwz79M/PdbQUZ3ceD4wg0dy15ynMowE4qBa1cpw1Hrmw6+7+d3SUPB9TBRzJ3W8XypJpXHsLnEDbgMzBsNXaP9DMgUl2jUy1wRbEQbqPa0ZpE0OqdcwLKG7+ipoWabRN4PARUI70B2aKAAGjzQyodXQpkgMpvOheQRQj5hMe+5b5tveUEsAF8oJOyFFJzdbDOftSuRTlxJsCymfz9C5aADsC81i6UtT5vKlZULYT/Joq19APBigwrPtZhLa/OahFNoF2xQFUMxtkK6DrdsWg1iNc7qjNkAvk2A//lTz1UaZLMtdKvabU6n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(450100002)(508600001)(26005)(31686004)(316002)(53546011)(6506007)(5660300002)(36756003)(83380400001)(8676002)(4326008)(186003)(2906002)(6486002)(66946007)(6666004)(6512007)(66476007)(2616005)(107886003)(38100700002)(66556008)(86362001)(82960400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1lsMTNVNUZ1dDN0ajVZYndLNXpDbmRKa1NoRVRKTCs0TEJsc3dqMXJWeHJz?=
 =?utf-8?B?dDNpM09uMEtRbnJFUXp1ZVRBV0txWDJsb0wrK09SQmRWTEsybndjWXNLdXA0?=
 =?utf-8?B?YUpIRHNsTnFTOWNtRll3aGE1blljcXovZ042WFhuVWlOR28rK1h6Nm9GaTd4?=
 =?utf-8?B?RHJ4OFNaeW83MGRsbnJYSktsMTVsZS9FeG1TM0p3Q24yekVENUxUYmZGODV0?=
 =?utf-8?B?dHkweS95eFdhZHZFUVVSV0N0eEUrcGp0d0hlSG1CRm5qeHVjcE1zUjdFRkU1?=
 =?utf-8?B?S1I0Ym52UFBiN3JrVWRHeW5xQ2hIWW5JNUhtWnM3RVh3Vko4V3ZJd09TVWND?=
 =?utf-8?B?eTEySWdqVHdYMlZJbWFoeUgrQXdRNnR0RFRvd2txNU5ZcnVTRmRobzg4MTVn?=
 =?utf-8?B?RE5Oak5WckZ0ZFJXS1NiNVg4Nk8zUUpGeDJ5cDA5UjJZS0toVXgyMTU2K2dK?=
 =?utf-8?B?andRV3liUk8wVlpmNGQxT3VUaVlUR1ZmWGlDRnhMQzBiK2lvRUYyZWt0R0ht?=
 =?utf-8?B?cTgvcDgrQXE5V1RPMDNNMjI2cTZ4RWY0V2ttWHZaOGZpcjc4NWZDL2ZwKzR0?=
 =?utf-8?B?TlpvUXFqQzJIWHhOY0RYL2ZyenorSzJQUys4SXRMQjh0ZmMyY3F6QXllQnhY?=
 =?utf-8?B?U2FsOXNmV2RPVjB0Nk13K3BxQzQ5NGZpbHo2RjZkQmY3bldlakRSQW0vM2x3?=
 =?utf-8?B?NzZGYlRHbmZPcElwSkVkR0FKWlZ2a1ZwVDFVbGNGaHIxNWRCTXJ3a1V1MFIr?=
 =?utf-8?B?ciszZmJRbk9HYS9QbWw3aVFQS3oxd3NIM0Jrb015YmRYMXhyWGwwN2ZIaUg3?=
 =?utf-8?B?WGc3aGdJNkNFcCsvUHlvTzl5ZEY5TXNtbTN0cWJULzJkMHZxNG1CZmlDL2VX?=
 =?utf-8?B?Z2pOM2c4QVpkZUdYSEN0UGcwT2NBMktsSWtLSEZxTGQrY0I2M2M4amlTYU1B?=
 =?utf-8?B?ZWpYWUwxeWY0MncremplRGRJamYwVm1rQUIyb1JNaVlEdGxzQi9sbTNNWkRR?=
 =?utf-8?B?ZStiOTRQYisrVWtJMjVURmJ5dUZJbjdmUFNDZ2xNQzJVVEZIL3MzdFlVcEtj?=
 =?utf-8?B?MnJOTStuS3ZXRitOVHpNeTM2REk3bzFwcm5XZW1wdGc5NnBMc2E1VEx6MWI0?=
 =?utf-8?B?bkNjWXlnbVVLVzNpc3JQT2VlWFRwWHJ0T3RxWlJOeGR0NUM4OG00SlB4TjRu?=
 =?utf-8?B?VVJvR3RIWENVL0ZUV1JhSUNTNUI5bFJiRHNLY0p0UmVuZytLTHpGUmllaFlB?=
 =?utf-8?B?bWpuSDYrV29zUnc5MXpYeXFMeFJ0Z0NIQnZnUGlGKy9FaTN0cnJlbmtoekRB?=
 =?utf-8?B?WWVjNkltZWYwSExyanFKKzNaSmNJam9qdFNveWtuY2NSdU9peTFoNUVycEFm?=
 =?utf-8?B?VXZzWXJSeG9OOFpuUWpDZG5oRjMra09zS1BFWlA3aFR3b3JTSTlFVXFzK1hY?=
 =?utf-8?B?bTVDWThhTVdUWVpzYUhEWTVISTZZanZIQXNCUm1LS3o0WVhua2pkV0J6dTA2?=
 =?utf-8?B?Yi9tK0l1dHU4blhkYWx3Ty94WVR6bkFjZDVYR1ZleEZiRmVxN2JySGNhRFhR?=
 =?utf-8?B?ZnV0b3RsWU1QMlg0ZzBxYnBZNFVFZVBjWUJleFpEZ3ZtRlR1ZlVJZmJabm41?=
 =?utf-8?B?TVZmSlZVclhNWUFJcU1VVWRBSzNTQkE3WXRJNEVIQkNrYWdFbjRIYktYWlRv?=
 =?utf-8?B?OXBBb1Y0QnBHZFpMc0VRMkVXY2tLUzI3VXBzS2ljR2dFQlFpUks2c0QzMlM1?=
 =?utf-8?B?MG9HbWdWRmdtSkJmcGplN3IyamQ3Y2k0bHRPeVRIVXRnb3c2MUF1Mnp3dHBG?=
 =?utf-8?B?MGpucGpuQnBxQW1FeGk3WFU2eGpkb1VhR053WTJrZFdoK3Bsbjh2NUVkNXhL?=
 =?utf-8?B?S3R5cG81VUdmNVozOG9UOUEreExnMmpQRTVFUlpCYVpVbEdBYTdPYTBqMlAy?=
 =?utf-8?B?R0g2TFplZCtyNkdibjNTbXJzdE1ZNHdQbk4vdzlKbzBoMmRkWWZFUDZZVHJv?=
 =?utf-8?B?ZlNZVWVER3BRT3lORDByVTIvSm9WY2pGWkVVVTJUWG9Eak9YU2xMQjAyNTA5?=
 =?utf-8?B?cTdwSTB5QlJKMGlLY1hUWkpUMVpBQ3pyYXdrbG9pMHIxUzl4Rm9iMDVqSjdZ?=
 =?utf-8?B?TDIzTWZOTnJvTk1lak1VWHNhUXV1MFd0R0JCemNpQzdSdlFOcndURWhKZWlS?=
 =?utf-8?B?RG94dzg2SGVDcVJEMjdSYkw0ckpzZ3dwUGQvNEU1dmd6OG1DVjBLS1Q0Ylgy?=
 =?utf-8?Q?b7dRJeVCAiwsiS/bOPcXMtrNfFEktlSjI5Pxdgzvr8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c14cef-993d-454a-e97b-08d9c5adf578
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:48:38.9554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns3n8mtf9QrGPcvm6GBQOhIRuDCDtGvgZF83gyfWI10AnQAL2Swf0Dn7jYidqm9k/4duhW1zsW13uwomIaz7/qmmUE+tcBObqcpMZlBHIm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3478
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
Cc: daniele.ceraolospurio@intel.com, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/22/2021 15:29, Matthew Brost wrote:
> Use a lockless list structure for destroyed contexts to avoid hammering
> on global submission spin lock.
I thought the guidance was that lockless anything without an explanation 
longer than War And Peace comes with an automatic termination penalty?

Also, I thought the simple suggestion was to just move the entire list 
sideways under the existing lock and then loop through the local list 
safely without requiring locks because it is now local only.

John.


>
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  2 -
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  3 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 44 +++++--------------
>   4 files changed, 16 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5d0ec7c49b6a..4aacb4b0418d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -403,8 +403,6 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id.link);
>   
> -	INIT_LIST_HEAD(&ce->destroyed_link);
> -
>   	INIT_LIST_HEAD(&ce->parallel.child_list);
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 30cd81ad8911..4532d43ec9c0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -9,6 +9,7 @@
>   #include <linux/average.h>
>   #include <linux/kref.h>
>   #include <linux/list.h>
> +#include <linux/llist.h>
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   
> @@ -224,7 +225,7 @@ struct intel_context {
>   	 * list when context is pending to be destroyed (deregistered with the
>   	 * GuC), protected by guc->submission_state.lock
>   	 */
> -	struct list_head destroyed_link;
> +	struct llist_node destroyed_link;
>   
>   	/** @parallel: sub-structure for parallel submission members */
>   	struct {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index f9240d4baa69..705085058411 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/xarray.h>
>   #include <linux/delay.h>
> +#include <linux/llist.h>
>   
>   #include "intel_uncore.h"
>   #include "intel_guc_fw.h"
> @@ -112,7 +113,7 @@ struct intel_guc {
>   		 * @destroyed_contexts: list of contexts waiting to be destroyed
>   		 * (deregistered with the GuC)
>   		 */
> -		struct list_head destroyed_contexts;
> +		struct llist_head destroyed_contexts;
>   		/**
>   		 * @destroyed_worker: worker to deregister contexts, need as we
>   		 * need to take a GT PM reference and can't from destroy
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0a03a30e4c6d..6f7643edc139 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1771,7 +1771,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	spin_lock_init(&guc->submission_state.lock);
>   	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>   	ida_init(&guc->submission_state.guc_ids);
> -	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> +	init_llist_head(&guc->submission_state.destroyed_contexts);
>   	INIT_WORK(&guc->submission_state.destroyed_worker,
>   		  destroyed_worker_func);
>   
> @@ -2696,26 +2696,18 @@ static void __guc_context_destroy(struct intel_context *ce)
>   	}
>   }
>   
> +#define take_destroyed_contexts(guc) \
> +	llist_del_all(&guc->submission_state.destroyed_contexts)
> +
>   static void guc_flush_destroyed_contexts(struct intel_guc *guc)
>   {
> -	struct intel_context *ce;
> -	unsigned long flags;
> +	struct intel_context *ce, *cn;
>   
>   	GEM_BUG_ON(!submission_disabled(guc) &&
>   		   guc_submission_initialized(guc));
>   
> -	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> -		spin_lock_irqsave(&guc->submission_state.lock, flags);
> -		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> -					      struct intel_context,
> -					      destroyed_link);
> -		if (ce)
> -			list_del_init(&ce->destroyed_link);
> -		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> -
> -		if (!ce)
> -			break;
> -
> +	llist_for_each_entry_safe(ce, cn, take_destroyed_contexts(guc),
> +				 destroyed_link) {
>   		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   	}
> @@ -2723,23 +2715,11 @@ static void guc_flush_destroyed_contexts(struct intel_guc *guc)
>   
>   static void deregister_destroyed_contexts(struct intel_guc *guc)
>   {
> -	struct intel_context *ce;
> -	unsigned long flags;
> -
> -	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> -		spin_lock_irqsave(&guc->submission_state.lock, flags);
> -		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> -					      struct intel_context,
> -					      destroyed_link);
> -		if (ce)
> -			list_del_init(&ce->destroyed_link);
> -		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> -
> -		if (!ce)
> -			break;
> +	struct intel_context *ce, *cn;
>   
> +	llist_for_each_entry_safe(ce, cn, take_destroyed_contexts(guc),
> +				 destroyed_link)
>   		guc_lrc_desc_unpin(ce);
> -	}
>   }
>   
>   static void destroyed_worker_func(struct work_struct *w)
> @@ -2771,8 +2751,8 @@ static void guc_context_destroy(struct kref *kref)
>   	if (likely(!destroy)) {
>   		if (!list_empty(&ce->guc_id.link))
>   			list_del_init(&ce->guc_id.link);
> -		list_add_tail(&ce->destroyed_link,
> -			      &guc->submission_state.destroyed_contexts);
> +		llist_add(&ce->destroyed_link,
> +			  &guc->submission_state.destroyed_contexts);
>   	} else {
>   		__release_guc_id(guc, ce);
>   	}

