Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3781B1FF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19A10E65D;
	Thu, 21 Dec 2023 09:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F2410E65B;
 Thu, 21 Dec 2023 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703150442; x=1734686442;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=96B+pd4txH8TB/G+gGuBY/s8O6+EVbQaCFzgWWFh6UM=;
 b=I4VYdeJ7Z8Ba97yBFy77Z2bLqeBFSGukuPago8B5nRNRLmUzD4t5Rcg0
 WZlGTxrx/kNou4OqbQzjbD++inmGeuNZb//2dpcaT4yMu1kEa4oB9sYG5
 hJBE/i81AdqoGXMszhVwHbqcVFPM4DfIxTUsrx+IXtFX0wESyi4T8kJXt
 DIrSjorRaUrZ9FwV9M8qN0dtN4lU9CDRAFs+Rin2+p3yva5qfvZB6nXYX
 OGy/tJqCCQVjvZI2xgrIs1v4wFmZ8J4UqvinSDjjelIoQdh6p+rGfNf1W
 SeYjM6loMkfRo6iEedMLnTA8MeIWhP0j/gYvr4jFK0apPNHJ7QVO6hICn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="380934570"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="380934570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="752882556"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="752882556"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 01:20:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 01:20:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 01:20:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 01:20:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 01:20:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEQIyOPtrlr+6fliniTA9JNO6ost+K6dElHya/vl9lijxn9Yq/gRJRUfqTsBLokyvQnss+YJLQ0Gai4UOF9CPFQQ8eRjI2OXGgxjopX4qSbRzySU58Wxe/DD2YRPWlRgH101OlqwVY875KrDHnp2i594Bmbas9GusmpZofefe9dHO/QhTaZq4b8dgkUnlZpAySifViH+Wf7CiYVAbgGeuYxodezrYXzxldI0vLOSQsN7q1RkO51N2GsMhkU1fKvkOo3mAetLWXYtWeJ78QcY1kbwXG1HyVia40SBPChOw4q8LDbi05KrAmdMhemRdiPnOyROelysjqVD+9TyzqdShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot+XEwaGkJ7PdDhzJYcFpLE9T94kuS3U8zEzeZ3bUyo=;
 b=EuWFReYjjKuTR3Aa91ClJ8j5SQDEwHRnS8B5CGkfqHjP5Com7D4ymuDI3gNc/T0TO32RORQeaegM3dI62l37rxxd/MFod2PLmXNmTdqvtqIL28zZUoe+QAyM3Kcew16hdB1ZXasAbMM1hI26zRVMQNjxgaUu81nqtFfPB7h/NdIH0p4IeeMs4EOSdEFWczbl73kZKy09jE9mEeorl3Mr621drOUNhA4Mvo7PPN1c3rSVdO7Ujh6FUb4FGHNdNnKhy6RvYeUcZmmwqKKWLMyjtQxxCLXql/oJuj43ylgj4sjLLcoif8OG0LGlmtgTCDddTmCPO8kC8tLWw6ZgWMmgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 09:20:39 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::c4b8:c08:c263:c2cb]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::c4b8:c08:c263:c2cb%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 09:20:39 +0000
Message-ID: <1f20cb51-8245-4821-86c1-712c6e711909@intel.com>
Date: Thu, 21 Dec 2023 10:20:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/i915/guc: Use the new gt_to_guc() wrapper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
References: <20231206204644.105064-1-andi.shyti@linux.intel.com>
 <20231206204644.105064-3-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20231206204644.105064-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0064.eurprd06.prod.outlook.com
 (2603:10a6:10:120::38) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e5d3c-891c-4999-e52e-08dc02061931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODSsdah0P9mcHxykdwm1xEZem8lcfLC5nnAqnEE3VR3I/8BThngQrGJruDafKwQzCRyFZ7/mJ90tA8yQn9nc5Pb766S7+wQSwp2VBTRQCzOuilptEeeMQHpQNs6wGJ+hwCtPMVkOwZm+E+ojdBH7Xv+5AKRon8KK7bdAdq08d4uYKOSAPM0V1UWZi2e9nrJOVQdQdnG5Gfzpgl7QlqzKmgRSHbUUvMEC/F0cO30RPnKG+uxhR9vJVH8nkEVg8heF8hh5q4aOJ9VITWQ3VQxg1Ud8bVHJR868HcT/RI6s3N9pKmHOTCS0Dxnll5XLiuK9HU7ZLGmWu+Rc9CYu72DgPcf5Yj9VqLq5I2/ioAcXNf6TGYdu/grhlGPR9JBkSOgK0SBSHMPUrzefHs9DcyO8/9tjxlRSANfR2bqIoIqT2kibX0Hnzfx5EdkAqrjjGIJLeAUZYuOqPZT71wjCJHuss7FlH9CWojTK3mmrq9P/jEv9q/ekaQYg8pDmqpggQw9am0WXn12bq2I3O8dRjzvLEu6+IWrP4k2PXyTntVL0OkN1bR2s6gFUwweexv4uDgnuVIbbjgcjLMpi/aoFNNSC4nvdWenbHLq6gnDLx+A+vck7aRCyDEpZhYFGJXyx7z/lsq3nIe0Hc9VVkLAr4EkCJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6636002)(6486002)(66946007)(66556008)(66476007)(53546011)(6506007)(6512007)(478600001)(31696002)(36756003)(31686004)(83380400001)(26005)(2616005)(2906002)(30864003)(5660300002)(316002)(110136005)(54906003)(8936002)(8676002)(4326008)(44832011)(86362001)(38100700002)(82960400001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBjaC9LYTFKcXBRVERISlNpV3dhUWp1U0p0N01aRFgyT3NicjV6NGlDYlB1?=
 =?utf-8?B?N2ZHdEFzbC82NXY1UmNCbEZ1RHBNSDdtbG1SYnphbnhZMlUvbmoyRXJPVklR?=
 =?utf-8?B?OGgwcUhlQjBLNFRvZjErYmNwbTB5SksrOTVGS21RbTV0b0ZnNWFDL2srRkho?=
 =?utf-8?B?ZVcyUEh4MFpaZFJMV04xMXEweGlScmlVbU5vZnloSnh2ajgvcC9CNlVWcG5a?=
 =?utf-8?B?cFVqeUViL1ZseWZVV1MvaDlyRm1MMjkrVnZ2bG4wRzVmTStGWW1KNzltRW1W?=
 =?utf-8?B?N0RURjVmaTB6RmRjT0hteHQwbnIwMFRJUEJmbUFKeUliRDhJN3VHQTF6Uy93?=
 =?utf-8?B?VkZIWnptU2U5QkxBNGNGSXFSbWRNRTZjQ0lHR3lJdUYvN1RlTmRBdEYzNjha?=
 =?utf-8?B?ZVVKS0c1YVVhYnk5UTdpdjVQdFlvcUZRVzdhc2JkK3VIK0lIL09VSnJqNUhF?=
 =?utf-8?B?UTlCUERWRmpLWUZYZWF1V0Q3WTh4VVlsTE52NHduVmk3TWJZTWlhRXpDTjFJ?=
 =?utf-8?B?ZVhxZmFIQ0pTSDBsNmp5dFNwMWdVNGRKc0NLYm50aWRYTEhRSGE5bXhNTUpl?=
 =?utf-8?B?cGp2OVVTUXMzK3NZYlh1dFM2TCtiV3JMK25WeHkrOWNWTjFCSHV1eEd2TG5G?=
 =?utf-8?B?TVhPMVFma0lSSmN6VnQwL0Y2MjIzakI0R1RQbjVOMVdHQUU5V1JaT29MSjRT?=
 =?utf-8?B?REJLR21XZHpMYW5odDArdCtYYzlQZ3lZdGswd2RVbWkwb2JkYU1LRm5tbENO?=
 =?utf-8?B?QWFUcWlWSC9uYWR1SnM4eHFkUUs5aytPMWwwZ0xvaVJnZGplTHJOcW80M204?=
 =?utf-8?B?ajdRYkQzZTBKOThVMFp1Nno5a0YwUldBUnc4eWVIeFd5N1lSK292YXdlT280?=
 =?utf-8?B?ZTJVR3ZiaUpoa1ZJb3NudlZMYWNXVUMrL3lxZmpaaVNKaUE0azZZcHIxaXFy?=
 =?utf-8?B?WjUvcnpKNDh0NU1OWGNMY0hSV3dIMW9vSTk4bTkxdXp0MnpHdFYxSExVcUNX?=
 =?utf-8?B?VW5VN09HQTNQRlFZd0wyaWdTZCs5VzhzTHM4MWJNWE5BcHVHb3piZXNkTFpQ?=
 =?utf-8?B?M2Fnc3AwVjAyYjZnc2pRcUlQNi96dzRwK0Fzbnh6S0laV1krQXlYTjhyRWFk?=
 =?utf-8?B?anpXMTJGYm1HV3lnWjNvbFFmVjVMNkVxVkJPTFNPR2pJL1U2RFdKZGJrRmZZ?=
 =?utf-8?B?UXR6emJMOUxHcTZ5Tjc2eFlDWGIySTVDSWM1UG5ha0tnNkxDWTN3Qit5cTRI?=
 =?utf-8?B?UlVUN1ZQMXRxMkpqKytOakxRNlhVYW9aL2FlWWtsUlQrdjkwYk1XWGliMHNK?=
 =?utf-8?B?eFNORWFWNTFkenkzaUQ1RDdrR2FUUnV6V25rV0QxRDJnL0xISVh0MmN5a2F3?=
 =?utf-8?B?MDZBelB2ZGJTQ2xSZDM3bzVvaHpibzFGbHZ5TGFCNTZPdXZ0eXROKzhKUkto?=
 =?utf-8?B?Qm01dHF3a2ZtZStKUEd1ZzNQb2VqYmRCNE9zanJ1RGdhUkJpMFhoNWt3QWJw?=
 =?utf-8?B?MW1UTy84TkRKMnZyUGUyanNaVVQrY2UwT0RFNGJIZnRJTHdwbXFqRk1ZSW1V?=
 =?utf-8?B?anE4Nk44dldSeVF0REF4dzJ2WllKd2huL1poTG5NeEhQd0h5KzNlSWJreUJO?=
 =?utf-8?B?Rk1WdWhoUUduWjFOQnBxSkhyRCtIY2w2WVA1REZlOVNFcHlxRzRYU3Vwb1hw?=
 =?utf-8?B?SUcrYk5GQlNMVU1qVDZXQzBtQ3BCZDRkYVFCSlVQZFdoVjBtc2QzdGtpLytP?=
 =?utf-8?B?cFgxZ0NVaHVFTS9BdmpWcFQvMXhkSStOKzAyblhDYk5hK2hCaURqVFluMjRT?=
 =?utf-8?B?UnhjK20raEVkWDJGY0tQbERveDRGcENlT2pyTDZxYm9oejJvWmozQ2xLRVFR?=
 =?utf-8?B?a3FEMVJNWXFHVkV2WWlaQXdMZmVydXJEdHNmbTd0QXgxVCs4ZkFMNmVFRG8v?=
 =?utf-8?B?NTVzejNiVnFFZ05wV1M1OGdWU3F0eDVlUEpLaUNQMzVTOEpSc043RDFjbnVG?=
 =?utf-8?B?Mk5mSGpnOUkzWG9SalRjRUszTFA4OGJydnFaSGdzVlY2cEI1QXBaY242aFAw?=
 =?utf-8?B?WVFLR3I1QUVnOE5hNFA4bU01L2hvVFRZYWVJU1RzejBScDVSQ2hkQkJBODll?=
 =?utf-8?Q?3wyW8nftC2VyoReexejyaQrVT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e5d3c-891c-4999-e52e-08dc02061931
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 09:20:39.7183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OS3tuNwwwRc+wT+Z0Ag5wiBUimz9Wo9P3AHiPMkw0SU6iJkDA8vRpydGEYmaA32oNJlkZwO+FI4UA+xouKKrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/6/2023 9:46 PM, Andi Shyti wrote:
> Get the guc reference from the gt using the gt_to_guc() helper.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  4 +--
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  |  3 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  6 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |  2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 28 +++++++++----------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 +--
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  4 +--
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
>   9 files changed, 28 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index e2e42b3e0d5d..3b69bc6616bd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -298,7 +298,7 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>   	memcpy_toio(gsc->local_vaddr, src, gsc->fw.size);
>   	memset_io(gsc->local_vaddr + gsc->fw.size, 0, gsc->local->size - gsc->fw.size);
>   
> -	intel_guc_write_barrier(&gt->uc.guc);
> +	intel_guc_write_barrier(gt_to_guc(gt));
>   
>   	i915_gem_object_unpin_map(gsc->fw.obj);
>   
> @@ -351,7 +351,7 @@ static int gsc_fw_query_compatibility_version(struct intel_gsc_uc *gsc)
>   	void *vaddr;
>   	int err;
>   
> -	err = intel_guc_allocate_and_map_vma(&gt->uc.guc, GSC_VER_PKT_SZ * 2,
> +	err = intel_guc_allocate_and_map_vma(gt_to_guc(gt), GSC_VER_PKT_SZ * 2,
>   					     &vma, &vaddr);
>   	if (err) {
>   		gt_err(gt, "failed to allocate vma for GSC version query\n");
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> index 40817ebcca71..a7d5465655f9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> @@ -358,7 +358,8 @@ static int proxy_channel_alloc(struct intel_gsc_uc *gsc)
>   	void *vaddr;
>   	int err;
>   
> -	err = intel_guc_allocate_and_map_vma(&gt->uc.guc, GSC_PROXY_CHANNEL_SIZE,
> +	err = intel_guc_allocate_and_map_vma(gt_to_guc(gt),
> +					     GSC_PROXY_CHANNEL_SIZE,
>   					     &vma, &vaddr);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 63724e17829a..1ef470e64604 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -956,7 +956,7 @@ u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
>   
>   struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
>   {
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	u8 guc_class = engine_class_to_guc_class(engine->class);
>   	size_t offset = offsetof(struct __guc_ads_blob,
>   				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index a4da0208c883..84a8807391c5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -1441,7 +1441,7 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
>   	if (!cap || !ee->engine)
>   		return -ENODEV;
>   
> -	guc = &ee->engine->gt->uc.guc;
> +	guc = gt_to_guc(ee->engine->gt);
>   
>   	i915_error_printf(ebuf, "global --- GuC Error Capture on %s command stream:\n",
>   			  ee->engine->name);
> @@ -1543,7 +1543,7 @@ bool intel_guc_capture_is_matching_engine(struct intel_gt *gt,
>   	if (!gt || !ce || !engine)
>   		return false;
>   
> -	guc = &gt->uc.guc;
> +	guc = gt_to_guc(gt);
>   	if (!guc->capture)
>   		return false;
>   
> @@ -1573,7 +1573,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
>   	if (!gt || !ee || !ce)
>   		return;
>   
> -	guc = &gt->uc.guc;
> +	guc = gt_to_guc(gt);
>   	if (!guc->capture)
>   		return;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index cc9569af7f0c..b67a15f74276 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -111,7 +111,7 @@ static bool has_table(struct drm_i915_private *i915)
>   static int guc_hwconfig_init(struct intel_gt *gt)
>   {
>   	struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
> -	struct intel_guc *guc = &gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(gt);
>   	int ret;
>   
>   	if (!has_table(gt->i915))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 04f8377fd7a3..4f51cc5f1604 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -391,7 +391,7 @@ static inline void set_context_guc_id_invalid(struct intel_context *ce)
>   
>   static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
>   {
> -	return &ce->engine->gt->uc.guc;
> +	return gt_to_guc(ce->engine->gt);
>   }
>   
>   static inline struct i915_priolist *to_priolist(struct rb_node *rb)
> @@ -1233,7 +1233,7 @@ static void __get_engine_usage_record(struct intel_engine_cs *engine,
>   static void guc_update_engine_gt_clks(struct intel_engine_cs *engine)
>   {
>   	struct intel_engine_guc_stats *stats = &engine->stats.guc;
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	u32 last_switch, ctx_id, total;
>   
>   	lockdep_assert_held(&guc->timestamp.lock);
> @@ -1298,7 +1298,7 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
>   	struct intel_engine_guc_stats stats_saved, *stats = &engine->stats.guc;
>   	struct i915_gpu_error *gpu_error = &engine->i915->gpu_error;
>   	struct intel_gt *gt = engine->gt;
> -	struct intel_guc *guc = &gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(gt);
>   	u64 total, gt_stamp_saved;
>   	unsigned long flags;
>   	u32 reset_count;
> @@ -1525,7 +1525,7 @@ static void guc_fini_engine_stats(struct intel_guc *guc)
>   
>   void intel_guc_busyness_park(struct intel_gt *gt)
>   {
> -	struct intel_guc *guc = &gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(gt);
>   
>   	if (!guc_submission_initialized(guc))
>   		return;
> @@ -1552,7 +1552,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>   
>   void intel_guc_busyness_unpark(struct intel_gt *gt)
>   {
> -	struct intel_guc *guc = &gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(gt);
>   	unsigned long flags;
>   	ktime_t unused;
>   
> @@ -2130,7 +2130,7 @@ static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
>   static void guc_submit_request(struct i915_request *rq)
>   {
>   	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> -	struct intel_guc *guc = &rq->engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(rq->engine->gt);
>   	unsigned long flags;
>   
>   	/* Will be called from irq-context when using foreign fences. */
> @@ -2596,7 +2596,7 @@ static int __guc_context_set_context_policies(struct intel_guc *guc,
>   static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	struct context_policy policy;
>   	u32 execution_quantum;
>   	u32 preemption_timeout;
> @@ -2672,7 +2672,7 @@ static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
>   static void prepare_context_registration_info_v69(struct intel_context *ce)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	u32 ctx_id = ce->guc_id.id;
>   	struct guc_lrc_desc_v69 *desc;
>   	struct intel_context *child;
> @@ -2741,7 +2741,7 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
>   						  struct guc_ctxt_registration_info *info)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	u32 ctx_id = ce->guc_id.id;
>   
>   	GEM_BUG_ON(!engine->mask);
> @@ -2804,7 +2804,7 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	intel_wakeref_t wakeref;
>   	u32 ctx_id = ce->guc_id.id;
>   	bool context_registered;
> @@ -4435,7 +4435,7 @@ static void guc_sched_engine_destroy(struct kref *kref)
>   int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   
>   	/*
>   	 * The setup relies on several assumptions (e.g. irqs always enabled)
> @@ -5193,7 +5193,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   
>   void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   {
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	struct intel_context *ce;
>   	struct i915_request *rq;
>   	unsigned long index;
> @@ -5255,7 +5255,7 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>   				    struct i915_request *hung_rq,
>   				    struct drm_printer *m)
>   {
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(engine->gt);
>   	struct intel_context *ce;
>   	unsigned long index;
>   	unsigned long flags;
> @@ -5707,7 +5707,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   	if (!ve)
>   		return ERR_PTR(-ENOMEM);
>   
> -	guc = &siblings[0]->gt->uc.guc;
> +	guc = gt_to_guc(siblings[0]->gt);
>   
>   	ve->base.i915 = siblings[0]->i915;
>   	ve->base.gt = siblings[0]->gt;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index ba9e07fc2b57..9b5141b422e5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -384,7 +384,7 @@ int intel_huc_init(struct intel_huc *huc)
>   	if (HAS_ENGINE(gt, GSC0)) {
>   		struct i915_vma *vma;
>   
> -		vma = intel_guc_allocate_vma(&gt->uc.guc, PXP43_HUC_AUTH_INOUT_SIZE * 2);
> +		vma = intel_guc_allocate_vma(gt_to_guc(gt), PXP43_HUC_AUTH_INOUT_SIZE * 2);
>   		if (IS_ERR(vma)) {
>   			err = PTR_ERR(vma);
>   			huc_info(huc, "Failed to allocate heci pkt\n");
> @@ -488,7 +488,7 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>   int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
> -	struct intel_guc *guc = &gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(gt);
>   	int ret;
>   
>   	if (!intel_uc_fw_is_loaded(&huc->fw))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 362639162ed6..6ba7a659d54a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -807,7 +807,7 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
>   static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
>   					   struct intel_uc_fw_file *huc_selected)
>   {
> -	struct intel_uc_fw_file *guc_selected = &gt->uc.guc.fw.file_selected;
> +	struct intel_uc_fw_file *guc_selected = &gt_to_guc(gt)->fw.file_selected;
>   	struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
>   	struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
>   	bool new_huc, new_guc;
> @@ -1209,7 +1209,7 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
>   	 * since its GGTT offset will be GuC accessible.
>   	 */
>   	GEM_BUG_ON(uc_fw->rsa_size > PAGE_SIZE);
> -	vma = intel_guc_allocate_vma(&gt->uc.guc, PAGE_SIZE);
> +	vma = intel_guc_allocate_vma(gt_to_guc(gt), PAGE_SIZE);
>   	if (IS_ERR(vma))
>   		return PTR_ERR(vma);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index c900aac85adb..68feb55654f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -144,7 +144,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>   static int intel_guc_steal_guc_ids(void *arg)
>   {
>   	struct intel_gt *gt = arg;
> -	struct intel_guc *guc = &gt->uc.guc;
> +	struct intel_guc *guc = gt_to_guc(gt);
>   	int ret, sv, context_index = 0;
>   	intel_wakeref_t wakeref;
>   	struct intel_engine_cs *engine;
