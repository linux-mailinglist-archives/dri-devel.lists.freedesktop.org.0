Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0C47B648
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 00:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E834C10F23A;
	Mon, 20 Dec 2021 23:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C28710F23A;
 Mon, 20 Dec 2021 23:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640044377; x=1671580377;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OXXzB4/f1bDHQLdeIp94C8PiQquuOprFpITYS8GEEaQ=;
 b=VMGcW5BiCzVHSTVl/vcB9BamWf5Pyrm5adDGdHRR+tSSV69sZo94aw4S
 Wcife7+QcGeGmbjbt/q/0mhN7AJ2C/fYRTJHO6Dpgr19jeVvDzgXsqtXM
 /O/mct6iXMO6+0DnujVKD2K/RditlwCsh6NKxDvcS1JwjlyVLTGn7S9eJ
 LR++HUorF5IFUyloTVchEgPu2YKBUFlPrtHW5WszAaZmb7ubVag3qMEHu
 LJbrlWezdADof+9p05uR6EguTf+JlGvT4ZDq18wjW8LDZtzcqcpf24ldb
 BkRIAx5L/uvv5qXs0pnFZbo785GcfmHakiBHRmggRS60FvEHSS5AfT4iw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240513046"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="240513046"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 15:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="570026139"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2021 15:52:57 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 15:52:56 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 15:52:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 20 Dec 2021 15:52:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 20 Dec 2021 15:52:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7QGAck24XEtKhNu1fC5c72JDvM521w1oQsPH6WmUoxs5CVA6Y9nJ6w2F3vg3AtS85eHH9DsVdjBeYQ0Qx2e2Cg1i8MM6kQpP0RkPIudq6jrh4TnFo9U3oLhyXLNBZJ34OVZMVYsAJRuXp6lBCrrdS5OBiY8sa67aBWL6p+YUYtkTWMkoIVCGrpBBzCMH4L47s8Tg6aMxhNt1w7kJuOwuAegDXI0iIIsF3q3FO9Dq7JTKcz8PnbrBvd/1E0OriYISPk9IXUbCJJC5rf1lBQ0k+2zVPzD4eUPU3+Wbea4/n0Y3zO5PTpNtis3kLh+s6zVx6DZNx2uU1QJnjV5RcDluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQTSDOdKJammWhq5P22+4qgfzf3VlihkcN+KN5vbACE=;
 b=D0f6p8J4oMDa6OESdcGqbMrrTpD6Lk48PZS1uTlH3G7Ik75lX4o8fvnWl0DoitCNriONcOpcS8nOUUR/aObFJBsEL5R2nXgUpG2Ep6OrMSo98vOgBVXg27KaaVp5RGP/qIuPJ7v/TkD/nUPL33BawAmdIjznYqepH3DNkdrJAaA6utzJ+vt+zu8wn3srHuw4/t6dmm5ahBIoEjJRUw4qjMWft1JmKiEDoIv4Uw9M4WOrCVdF8Hpg9cbRHItCjmWI9wo8Nq94qCRef2fDBBtNN4LOwrWxEHM6enYkZHSdoB7SkNJPHURtmLMsrZqMBPBqKfE4buOv+4352U3EkPmxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 23:52:53 +0000
Received: from PH0PR11MB5660.namprd11.prod.outlook.com
 ([fe80::1024:475a:a9a0:f5da]) by PH0PR11MB5660.namprd11.prod.outlook.com
 ([fe80::1024:475a:a9a0:f5da%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 23:52:53 +0000
Message-ID: <4a5ab73b-d68e-bc1a-ea26-d149ef338925@intel.com>
Date: Mon, 20 Dec 2021 15:52:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Request RP0 before loading
 firmware
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <john.c.harrison@intel.com>
References: <20211216233022.21351-1-vinay.belgaumkar@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20211216233022.21351-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To PH0PR11MB5660.namprd11.prod.outlook.com
 (2603:10b6:510:d5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: affe5b19-aefd-4eef-3c5c-08d9c413d686
X-MS-TrafficTypeDiagnostic: PH0PR11MB5673:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5673DA41BD61007E9A637A0C8C7B9@PH0PR11MB5673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBdZzyd6v0Wb6JdfJESV3deg+AkkReVVoyAiudDN5S1rJA1TZbd7WKEoCxQ/qdLokfFfYUsIsDA9YmIyzO4r9M+DHhMuUgNU4nuTAmS4wXHHrDoxzv9I7mr9E8Vu9v9QIdWyJTKlmZD68pV8q+duofNKnLtMch0h/D/+cDmWYzsfVHA4p/FS1iauh11rMhhWvAxkrT6Ps1kbGnEazfXQt4mK1DpSIm24+Aq2EOQ8oEmCuYf/WFumITA4rlNbpuUNpgHUeoy/VJpWAmgk6rTPwRdcVtUuOr/mlKcloSXvuMIz6pUMBom6AOBw2KxSEYNcJE4XpblUeVzf8H8rwWsVOqn5+P2hFaDs/3Db64rV+u0IZQ1tO2dp9fDxh3HiMqWUpQfC9qiqWDJCJluvIF0g2hz9RmwNJGYIUb5TIvnx9gPS2otxOEEgPjx4d0X2xjkZorfSl599eHWZWQ3qQOQGlK5QSFEIQWF0h2UiPhATiaeFpJI8NbN1HUUFZiKWfyq+Peifu8yWrCdrQICWzkBcWWvgIz/2BQma6/lB9+0ZaLUUYtWh0+7JqBQn2PYJ13NTAovqKQE4e+dWq7hzzepKxkxhhr+DRuFPdmFYL5BUDrVJAja9JprEW3q3FBsATd+AgvoNqjRj2lkPNt1Ael7QEMyjuWYeV7tvcOPthND3H/cIghWo33P0u808Zd/Rj8Cnj10uBpEFAE0IjFkOezSSwisBS3sJyipgmbX/gKJgVFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5660.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(2906002)(2616005)(508600001)(6512007)(6506007)(82960400001)(86362001)(5660300002)(38100700002)(316002)(31686004)(36756003)(83380400001)(6636002)(31696002)(53546011)(66476007)(186003)(66556008)(8936002)(8676002)(450100002)(26005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNvWEdESDZYZXNIWGZGVjRJVDBiL2lLRFVYcEJockpBNUg5UTYwQ1FYNFk3?=
 =?utf-8?B?RWVyWldtN2p1ek1HUFpyQW5FY09WemJGenE5ejB3emROWCtnSEd0N2gyVTc5?=
 =?utf-8?B?Qm5Na1JyL2pWT2k1c2phTDF1UFlnY0tLNGxaVjIrNUVQVXluR2NkZWc0RlBK?=
 =?utf-8?B?aVI0TU5OQ3ZpZ2o0aFdvdHhmd0loLzQzTUUzM0RWZkFLdlpFNlAxNmVHN3Fw?=
 =?utf-8?B?ZjB0cTBZVHIyanpLdEMxd1lqRHgzUUJBZ0RaQVkrU01Oc01DSzBYWWxUamFB?=
 =?utf-8?B?R09SV3NzbWxaQ01uRStQbFBla0FMbzdVbVd0blgwVnBzRmVxV3hSUCs2OXhm?=
 =?utf-8?B?VGd5dU8yOGFGSG5zeE42ODd3VmcySzJuMjVadlVGWGdQNE45K1VwZWcxM3ZH?=
 =?utf-8?B?VG1vMGVDUDFEeWlMYUlEdW5aQy95SWM3MGxkWDRMS1BYazBZVERhYnhUVHdt?=
 =?utf-8?B?Z1NXVUpGRHAwOUFZbEhpZjhrRVdKeTNFYW5LNjZNTmpCU2NTRnFYWGdJd2hs?=
 =?utf-8?B?RmhHcXYrZ1Q3U244eHhsemZvbW4rRnVPSHhEYUtranYyMFA1YkhHQm80Y1h6?=
 =?utf-8?B?djRnMGFTMUJaZTVUNm9DeGZITTR6bUhnVkNOQ0VZd2l5NU1BVk1qMW9OZXIz?=
 =?utf-8?B?NjBkcDBMVHZxYWhocVNWYU91bDdWcWNtYVl0RFNRaXNpMStteFBDUWtxZzZq?=
 =?utf-8?B?b3VtYmZoYkxjNTEyRERXZnRNcC9VYzdaNVNuRktsYkNMcm1EcTdVbmhhcHBU?=
 =?utf-8?B?Uzhtd3A4OHVkajJ6Y3YwRE43Rys2dU4zdXg0UnU1dTdFZUV1NmN1bDZqWm5z?=
 =?utf-8?B?dzdNRHJyM1k5dWlXV21wVDlEZ2JWckd2bkM3dFlQQ1hqajN0WnJvbi9TVjZt?=
 =?utf-8?B?bUh0TytRcUpEM2cvSXdIZlVSSUhzQTNZRjVOTUFBeWNRcTQ0QXo0VU9WM3VG?=
 =?utf-8?B?QTZwWVh1RGRwL3RzU0FiM0V3aHVEUGRFRG45ZUc1SjBUQzNHU1N1MGtZWDNo?=
 =?utf-8?B?d1hUV3FDU3g0YjhvTGRxcS9mc3YxOVlKbXdGTU5taHZxQy9YVUsxckU3TTcv?=
 =?utf-8?B?dHA4RkNBR1p1ckNmbkFDKzdCMTVWMGI3WkN0Q205YkRTWTVxL2dUQnFlM3Z2?=
 =?utf-8?B?SmFGNm83eldKMWZ2ZlZIYTkyRGhtVDJZbUpHeXF4NFpBblk0RnlUQnVQTUVk?=
 =?utf-8?B?K04wTWhXNUNpK3F0bHMzT0JtQ0k4ZjAwUEhCTG5xODRFRkxMbk9xYjFHSnlj?=
 =?utf-8?B?U1BUMmZ6T0Vob0IxTEdvNHEyWDRhWkhHQ2JFbTdvN1B5a3ArMm9XOEJ6ekNR?=
 =?utf-8?B?TWhTdVB6YUtiZE4xaTdxYkE0blArRHFmZDE1UjRERGp2M3BDdCtaZWprTjA0?=
 =?utf-8?B?K3VSZkRXRDB6UWNyNnp2SVBraDNsU1p5OHd6L2lUSkFBaDZlRERFcnlJT2hC?=
 =?utf-8?B?QUpMbkZTN2s3bVZsQTN6WWt4WUhncmwvcXlEbThWd1B3dnlpTTFSeG9IaWU1?=
 =?utf-8?B?c0pEd0tMVGdTaEJqWVk0RnE1RVFwNkU5dkg1Ti9IYzZNZGZDMXhvak85NE9L?=
 =?utf-8?B?SXBmNThMbVVCME5OaG52dXRXMlY1bDgzblJTRnkrQjErVGJPM3Qwd3pGSEtW?=
 =?utf-8?B?M0VNOU1JVEtxYTNrd3ZVREVEWmJLbnNUNGRLWlZSQW5CRzZtS1JhZEY3TE9P?=
 =?utf-8?B?emQ2ZmpwUGVBZXBDUU5Kck1MaDRPU21pR2lLVnkrcDJRZUpsNmlCUXdNSDF4?=
 =?utf-8?B?NzNpYnhILzZOYW1SM0F4MlBEaktjRys4bng2L012SHZ4WFJ4d2h2QjdxZG1v?=
 =?utf-8?B?cHdYVDRMUzcyVkxjZVFIMStUL3ZubFc3Sk1zMm5xajBZbVpsTmVQUUJkVXhP?=
 =?utf-8?B?aCtncXh2ZTVxTS9kRUY4QlloakxONU9mVTdNTExRRU9RVkVxVGM4aC91VDVV?=
 =?utf-8?B?b3JLaDc0WW5OMmVqN0hJUW1NZ2xsS09uQ0p6cXd2anhSRzNYWURGRTllam9o?=
 =?utf-8?B?Z2duY1MzbUQ3VE9nTVRtSHJQdWdSQVh4U25FV3BORVV6RGxwa3p4Ym8rTjlh?=
 =?utf-8?B?NzQ3MmU3NGxiQjRJeTlwRjNNbDNWYW5aQ1dYbUdvSGZzZmxvL0RjUllmUENx?=
 =?utf-8?B?Nlc5R1FMZGhPMTFlTTZMU1Vob2cvS282R3VFNklEanpjQ1JPTnptTElxbG1m?=
 =?utf-8?B?cHhMdVNPQmEzREMxd1NIMUVpZFJZOWk4TktUSzlPdVlGRHZwM3hrVmJUdWVT?=
 =?utf-8?B?QzNwYVQ5UzVyV2ptR0Q4NkJZWVdRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: affe5b19-aefd-4eef-3c5c-08d9c413d686
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 23:52:53.4918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NemE9ql4NHvwCO22yvQUvZSM+mxzP602Pj0Ou2QfCh3lzw0TtjXJz5m5XhKTQwmar8ZFQu+VITE3/2cX9oy4tk60P7nzy3U8Q3gUmO/VZ1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/16/2021 3:30 PM, Vinay Belgaumkar wrote:
> By default, GT (and GuC) run at RPn. Requesting for RP0
> before firmware load can speed up DMA and HuC auth as well.
> In addition to writing to 0xA008, we also need to enable
> swreq in 0xA024 so that Punit will pay heed to our request.
>
> SLPC will restore the frequency back to RPn after initialization,
> but we need to manually do that for the non-SLPC path.
>
> We don't need a manual override in the SLPC disabled case, just
> use the intel_rps_set function to ensure consistent RPS state.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c   | 59 +++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_rps.h   |  2 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 ++++
>   drivers/gpu/drm/i915/i915_reg.h       |  4 ++
>   4 files changed, 74 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 07ff7ba7b2b7..d576b34c7d6f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2226,6 +2226,65 @@ u32 intel_rps_read_state_cap(struct intel_rps *rps)
>   		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
>   }
>   
> +static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
> +{
> +	struct intel_uncore *uncore = rps_to_uncore(rps);
> +	u32 state = enable ? GEN9_RPSWCTL_ENABLE : GEN9_RPSWCTL_DISABLE;
> +
> +	/* Allow punit to process software requests */
> +	intel_uncore_write(uncore, GEN6_RP_CONTROL, state);
> +}
Was there a specific reason to remove the set/clear timer functions ?
> +
> +void intel_rps_raise_unslice(struct intel_rps *rps)
> +{
> +	struct intel_uncore *uncore = rps_to_uncore(rps);
> +	u32 rp0_unslice_req;
> +
> +	mutex_lock(&rps->lock);
> +
> +	if (rps_uses_slpc(rps)) {
> +		/* RP limits have not been initialized yet for SLPC path */
> +		rp0_unslice_req = ((intel_rps_read_state_cap(rps) >> 0)
> +				   & 0xff) * GEN9_FREQ_SCALER;
> +
> +		intel_rps_set_manual(rps, true);
> +		intel_uncore_write(uncore, GEN6_RPNSWREQ,
> +				   ((rp0_unslice_req <<
> +				   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
> +				   GEN9_IGNORE_SLICE_RATIO));
> +		intel_rps_set_manual(rps, false);
> +	} else {
> +		intel_rps_set(rps, rps->rp0_freq);
> +	}
> +
> +	mutex_unlock(&rps->lock);
> +}
> +
> +void intel_rps_lower_unslice(struct intel_rps *rps)
> +{
> +	struct intel_uncore *uncore = rps_to_uncore(rps);
> +	u32 rpn_unslice_req;
> +
> +	mutex_lock(&rps->lock);
> +
> +	if (rps_uses_slpc(rps)) {
> +		/* RP limits have not been initialized yet for SLPC path */
> +		rpn_unslice_req = ((intel_rps_read_state_cap(rps) >> 16)
> +				   & 0xff) * GEN9_FREQ_SCALER;
> +
> +		intel_rps_set_manual(rps, true);
> +		intel_uncore_write(uncore, GEN6_RPNSWREQ,
> +				   ((rpn_unslice_req <<
> +				   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
> +				   GEN9_IGNORE_SLICE_RATIO));
> +		intel_rps_set_manual(rps, false);
> +	} else {
> +		intel_rps_set(rps, rps->min_freq);
> +	}
> +
> +	mutex_unlock(&rps->lock);
> +}
> +
Small function name nitpick maybe unslice_freq ? Just a suggestion.
>   /* External interface for intel_ips.ko */
>   
>   static struct drm_i915_private __rcu *ips_mchdev;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index aee12f37d38a..c6d76a3d1331 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -45,6 +45,8 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_punit_req(struct intel_rps *rps);
>   u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_state_cap(struct intel_rps *rps);
> +void intel_rps_raise_unslice(struct intel_rps *rps);
> +void intel_rps_lower_unslice(struct intel_rps *rps);
>   
>   void gen5_rps_irq_handler(struct intel_rps *rps);
>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 2fef3b0bbe95..3693c4e7dad0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -8,6 +8,7 @@
>   #include "intel_guc.h"
>   #include "intel_guc_ads.h"
>   #include "intel_guc_submission.h"
> +#include "gt/intel_rps.h"
>   #include "intel_uc.h"
>   
>   #include "i915_drv.h"
> @@ -462,6 +463,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	else
>   		attempts = 1;
>   
> +	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
> +
>   	while (attempts--) {
>   		/*
>   		 * Always reset the GuC just before (re)loading, so
> @@ -499,6 +502,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>   		ret = intel_guc_slpc_enable(&guc->slpc);
>   		if (ret)
>   			goto err_submission;
> +	} else {
> +		/* Restore GT back to RPn for non-SLPC path */
> +		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>   	}
>   
>   	drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
> @@ -529,6 +535,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>   err_log_capture:
>   	__uc_capture_load_err_log(uc);
>   err_out:
> +	/* Return GT back to RPn */
> +	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
> +
>   	__uc_sanitize(uc);
>   
>   	if (!ret) {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1891e7fac39b..b2a86a26b843 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9399,6 +9399,7 @@ enum {
>   #define   GEN6_OFFSET(x)			((x) << 19)
>   #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
>   #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT	23
> +#define   GEN9_IGNORE_SLICE_RATIO		(0 << 0)
>   
>   #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
>   #define GEN6_RC_CONTROL				_MMIO(0xA090)
> @@ -9434,6 +9435,9 @@ enum {
>   #define   GEN6_RP_UP_BUSY_CONT			(0x4 << 3)
>   #define   GEN6_RP_DOWN_IDLE_AVG			(0x2 << 0)
>   #define   GEN6_RP_DOWN_IDLE_CONT		(0x1 << 0)
> +#define   GEN6_RPSWCTL_SHIFT			9
> +#define   GEN9_RPSWCTL_ENABLE			(0x2 << GEN6_RPSWCTL_SHIFT)
> +#define   GEN9_RPSWCTL_DISABLE			(0x0 << GEN6_RPSWCTL_SHIFT)
>   #define GEN6_RP_UP_THRESHOLD			_MMIO(0xA02C)
>   #define GEN6_RP_DOWN_THRESHOLD			_MMIO(0xA030)
>   #define GEN6_RP_CUR_UP_EI			_MMIO(0xA050)

Regards,

Suja

