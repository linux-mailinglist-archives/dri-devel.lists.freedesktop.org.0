Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B89259A76B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC53B10EBDC;
	Fri, 19 Aug 2022 21:02:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EFF10E328;
 Fri, 19 Aug 2022 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660942955; x=1692478955;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NH23wX1hJlP4f5WaW8Ha9HMBqkgKiAlq5L1Nx0eH14s=;
 b=Q1oHWeQcS0kbHF9CaNCOrgMhZdzfDAlPG5o2KsBKg+QS2/K3gX5AiF1t
 kOUQdyLnnQtgg3WF6X2TrrVWlKunAe35xNX7D0nLCq+5ZKbndYdTark8s
 3TlKmMlT2CBvCbsue8UYS1PnoXCJ1hodL5KP2IrgAXMgfU6wdzeWg+uLw
 KCZO8Q9o0Lp2TBZVg/cL5RnV5mCR/Y+g6yd6lkMhQRshMfykYvT2Gz8hl
 yb4OWklLaFFwlJG8DF1doh2VckSk+foFi9riJ1o7J+mnOP05geX0Xdcuc
 tzE4GZnNhKvm3Q2MlKr/YMicV/nZeuNOXASN0TpiN1rMcih+/QG1q+K8t Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="273487332"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="273487332"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 14:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="750651286"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2022 14:02:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 14:02:33 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 14:02:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 14:02:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 14:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jG8w3D8xxlKzhxo7AXKNbuAdosvdlfSJv3EzSzqvpT4A+A6b2h27R587GRQKRixPKH5CkxI9Jovn6J9LIi1S6i9tqEKjAPchznC+fDGdAzPc1kSEuhXQL6KNmE6Vo98EPYN3rh7c2Rc3Qi9bKXIWe12i6Ups6er0b8Rx0n84g0GY+KP+gkQ502V3lxjefS2LUV2yPLwKW5EWH50bRnLQf02mIR2vhZo+gyenbKTW8aAIQz/BLIMx1fqs1505mRntXAYJMsLNhUBFeFgE5pTLIz+GSwgeAM8h1es+yAX2If858ZsMN0d5dIXfSEWBxwpJyWbWuJKVT7LS9Z6Qi1Nk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgwwxaVhTAVAlx5CngNW3+m2nwIsmx8Y5qaD5VdLDNc=;
 b=DHeRTQiljqI8BaZE2f+ptm1TQgVoSgeYUCZ5FKTEeuuSTrFDKYlZ/w1q7ELPx7oanqanHRCD1ngIwP8CSZsJyvUjWVrLaj7KMcHRLdbN0TNNUCziIJ1TSrgQ1mtKCK2CAC36g2DoI5/Cbotz6fV/0PFqjYKYj0tIQY7I+qmaTYGphB2ccCg/ep399kBBa6l922lv2sfcXcXuknb2b59JNGJfnyO6I+nL9qHFzE+Bbohs3ciqETwMSeXYzZ8r3Fvr9trXyt6xcdj7xDD1O6Dcerq4qyPu3nG90b6Uxn00lrjHarGhuqFTGRBx1VWTEex4EXRCoVOfHk+jsGM3MDZ0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Fri, 19 Aug
 2022 21:02:32 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e%5]) with mapi id 15.20.5504.028; Fri, 19 Aug 2022
 21:02:32 +0000
Message-ID: <76993a22-6f37-2fab-7b86-ae56a3e9f7e5@intel.com>
Date: Fri, 19 Aug 2022 14:02:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-4-John.C.Harrison@Intel.com>
 <87a680o6jm.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87a680o6jm.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27bc2263-81c2-4671-cd14-08da8226221a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4975:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BgZnXa2982X/QUVWUJPPxtypHfRDdYH/XOLtLkcTniI7uWu8FXktEKX9MpdVPohE4laW8InNjq1oI9NLg+pWgABOQzGvl6GLO4XPwLeuZtuNqePuaI3PGFTsuBAbaHov+fW0P7L0hZ7Cc8KTGROpRVl5rDc7HbAtSnIuYa0K81rMhm/QMxQk0bgrSM7bBOuxF8eBQODT/IAeyaP3aU7Bvs6qWrvp2ubkvTdFBAuBAYGyMn52aIVSCZXuSKjb0ceSur8WV4owovi5v56douNJoXq48T/Ad17RDyJMtAOh0iIUtAnRvreme0YzfVOv9BTSkPt6m//tnYpCrlrRMgTe4lXUDNR6gCzndqICgfMyO/Hp73iFnuiCbEZvuVFwQ4Uk5WyMcCx40MUBZ32oH/JbBiYvRAfu2idUXuaj0IrWE1Nh8ZD/sCdGr2YdQ3boLQR000DSfc1LwV5KkwS6Nvx2V8L5185LePBLdr6xRDAYBVK9GXYzRN7ckwEIJ9Rc5eBH2Ned0gqo99oWkaIYQX/VC0Y5D9xDiOPtHa/1IM/rxz7P6EzvWBmKOv1mKgYiVkp+zPbFJyxx34VU3aGn+2zocx2WEWXncT853DMUfIaQiEz1RezWuR/R/XEkw6xOX9rlKjVkJBllOFhtc7/woK/rkd/ur3MgendlFJIgDYUwtbDiFbQYdozKM0ZxCH7mwWpMCdSNGyOu8HpihwVi9oZSNhMZn6CuMF1l8e5faCgYW1Q8/Sp0wdDzO9DXllDeZKk3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(39860400002)(346002)(376002)(83380400001)(2616005)(82960400001)(186003)(86362001)(38100700002)(4326008)(66556008)(31686004)(8676002)(66946007)(66476007)(31696002)(36756003)(316002)(2906002)(8936002)(5660300002)(966005)(6486002)(41300700001)(478600001)(6506007)(53546011)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFVlTE9aMU1BZGVxRVA0emlHUTMrUU9BL2NEbEpxaVhxRm1vQjNYQ1ZTYjZM?=
 =?utf-8?B?S1lOY2hicU4vRjllV3VTbDBjU1gvQWtCbWJWNXNlMGtlYkdkL2oyOHpXNmYz?=
 =?utf-8?B?TU5UN2FQVm4yM0JQTVBNeHpvTUp2NXVwWmk5aVV6aElPWWJQNUNpODZNK2R5?=
 =?utf-8?B?WXZrYndjM3hVQUdXdnRCa1dZdzQzR3JvUlQrb3MzUEJxTEd5aUNtMTNkS0lK?=
 =?utf-8?B?ZFJxckVwamNsSm9maUNDaXIxTU10dkxxbXJtVWlpcGJ0WW1PdFo3aENYcWUr?=
 =?utf-8?B?RUVVOCtaa1dWZlZTMlFocmk5b2s5c2E2NGlGTnM1eGFOMHFvdXU1ZXgxTytv?=
 =?utf-8?B?WHJjZCtFcjh2WVdGMlVqNjNiQTg0ekdNZFVNNHhNdEg5TUlTazd3OHpoT20x?=
 =?utf-8?B?L054clhScjZtNFRzMEh5NEM1TU83QlVvSUpXZUhwbzEyb3dseUFKN1F0U1BF?=
 =?utf-8?B?Q3BBeHFYR2NmS0Nyb2I0T2FUS04rWFNSUVRQR1ZtTHRmVmZrbW44dTJ1Q1dJ?=
 =?utf-8?B?U2VUSU1wZDl3SXB1N2s4R2ZiYm8zNnZSclUzUVBSZGdNbXdaVEFMbTRIL09q?=
 =?utf-8?B?N1FnTCtmWDgrMnRpL0hKa2tWYVA4cjcrZVNuQm9ROUdHS2RERmFrZ0VvcHo3?=
 =?utf-8?B?NC9Xd2d4VjF1Ni9wem9WUHRuSHk0eEpPZzROdDI1MTFzcENNTDFWYTY0cHNh?=
 =?utf-8?B?S0NVY3o5TnJFSko5U0dFWjRPSkxNVUtjQXJhZEFiVTREK2cwVWQybEtnWFo5?=
 =?utf-8?B?Ni9zbVpiTDZyTkY1MitYQTV6amVjNXhtVzY5U0NudWtxZzZvMG12UnBYTldE?=
 =?utf-8?B?djdtL0RPTXFRZ0doVXQ0c0Q4c2tyUzZMS2F6dTdBMVFCNnJGWDFSeDdPTFFh?=
 =?utf-8?B?bkVuS1UzaHpVbGUyUnJoSlk2VTRHSUxQTlBKS2d3bVJsZXN3N0JVR2dGdFFw?=
 =?utf-8?B?S1lwYnNPUnJIUW9OUWtIMTdScy9qbE1ROU4xeHpoVml1dVRlcDd2cER6cWFQ?=
 =?utf-8?B?N0E4SHQrcUVZc3c2anpxY25wTXZBMHdrWnl6N0J5M3ZPRmVhNVJvNUNnWUly?=
 =?utf-8?B?WTdXNW52Y1AxVG9BMG9KMmlOTkM1eUJxeUp3dFhaTDIxeTRUUlppL0pFRnl5?=
 =?utf-8?B?OUtKZHNCbjc5Y1NyQUExc2NwTzUva3ZzK01CZ2lNa0hyOEd4R2pnWllOOW5P?=
 =?utf-8?B?U2Y1U1lkR29PVkRvMDNUMjB5Z3Rsem1wbXp4UGxNWS9VdVkyRjBxcitLcWIx?=
 =?utf-8?B?NmZXQlh4S2JEOXcyU2ljOVcxSTV0d1JHMkJsOWx1N0hMYThzend3TGhSMjFF?=
 =?utf-8?B?RHFoQmFjUHdnWUtvdXdpNmdYQkdKN1dUcDZhWTlFTmVLSjdTYzQyVlYxVGlS?=
 =?utf-8?B?a1FMR0NDQVRvVG5TdXdvMXFudlRPRHJ6R1IwKzZJK0ZRQWJTdXd5QVVxNTMr?=
 =?utf-8?B?cStYWCsrbTlMTU40NytSd1A2ZDhwbFM3bnI5VHdQZ05vdFVCYVplZmNOZFV3?=
 =?utf-8?B?ZU95MFB3b09FOVlTL1hhY0l0UWFEVDh6ZVdrODhNN3ptYmRkbzJkaTR6Rm1y?=
 =?utf-8?B?dk9UeHFwQmpqUUpidnRGZ2RXbG5QSG9pY3Qza1JVUlpJd3h2WURXRjAycDVK?=
 =?utf-8?B?bjJvelVNdzRyc3k1amswQ0RxQXRNYm1UTGNtMW5rNEVTNGs2RVFDdnVicjBo?=
 =?utf-8?B?UW1aRnN6WGhUbGFPaXE1VEdXVkJUNmltRDJzcC8zQkRtUm43NFVhVzJsS054?=
 =?utf-8?B?MldKcXRZV01sVDNBcTArcmQ4Q2F3WGw2NGhoN3VLRDRVSUVRRFB2V2lJR2Nl?=
 =?utf-8?B?UVAyL1VWRDc0U0k3SnBEM1dZMHFIa3psNDVybW84MjZNVldlMEF4b1M4YkV5?=
 =?utf-8?B?eFhKbVZyRVRjdUMvREdxV05DcjBjSHN3cVVjbHVWWFhoMlgvRFJmQ2dRK1lx?=
 =?utf-8?B?YmZHT29lQVE0a2FjWFB6ck5xRTA1bkFrRWVEUlVkbGRvbjJEUkF3MC9aMmxO?=
 =?utf-8?B?c2F1SGVzM1hPazgwamJTb08vV3JudXZCZy9CV0pGamNMMVB5NUozODJRTjlv?=
 =?utf-8?B?cmpzNkpEcm5YdnVWTVV0SVRXVkZBY1pEc1BGMlNWRE1BdUloVUhOQzRndFFu?=
 =?utf-8?B?Wkd4RnlOY2JEdG41ZlZ0Rzd6cktVQ1ppMDJGb01GdWVTdjY2blF2eXJZSHFk?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bc2263-81c2-4671-cd14-08da8226221a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 21:02:32.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2eHyMfUjBWpPzVI9Dn7RRqFHm13lsfjYrEXaxnXv8B4zZwG0WD/S/JI10qKw5KzV1nZ9YdHiKlzZKxx2tyQHgV/7Bkgbix1hYHGcW91cZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

On 8/19/2022 03:45, Jani Nikula wrote:
> On Wed, 27 Jul 2022, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> It is useful to be able to match GuC events to kernel events when
>> looking at the GuC log. That requires being able to convert GuC
>> timestamps to kernel time. So, when dumping error captures and/or GuC
>> logs, include a stamp in both time zones plus the clock frequency.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  2 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 19 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h     |  2 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  2 ++
>>   drivers/gpu/drm/i915/i915_gpu_error.c      | 12 ++++++++++++
>>   drivers/gpu/drm/i915/i915_gpu_error.h      |  3 +++
>>   6 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 60d6eb5f245b7..fc7979bd91db5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -1007,6 +1007,8 @@
>>   #define   GEN11_LSN_UNSLCVC_GAFS_HALF_CL2_MAXALLOC	(1 << 9)
>>   #define   GEN11_LSN_UNSLCVC_GAFS_HALF_SF_MAXALLOC	(1 << 7)
>>   
>> +#define GUCPMTIMESTAMP				_MMIO(0xc3e8)
>> +
>>   #define __GEN9_RCS0_MOCS0			0xc800
>>   #define GEN9_GFX_MOCS(i)			_MMIO(__GEN9_RCS0_MOCS0 + (i) * 4)
>>   #define __GEN9_VCS0_MOCS0			0xc900
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 2706a8c650900..ab4aacc516aa4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -389,6 +389,25 @@ void intel_guc_write_params(struct intel_guc *guc)
>>   	intel_uncore_forcewake_put(uncore, FORCEWAKE_GT);
>>   }
>>   
>> +void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
>> +{
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +	intel_wakeref_t wakeref;
>> +	u32 stamp = 0;
>> +	u64 ktime;
>> +
>> +	intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
> Why does this function print runtime info alone? Seems kind of random,
> considering what intel_device_info_print_runtime() actually
> prints. Should it print both device info and runtime info, or nothing at
> all?
Hmm. That was added specifically to print the rawclk value (and only for 
the rawclk value) because that was the frequency that the GuC time stamp 
register ticks at. I think we later worked out that the CS frequency was 
more correct. Hence printing gt->clock_frequency lower down. I guess I 
forgot to go back and remove the rawclk print, though.

So yeah, it can be removed.

John.


>
> This conflicts with [1] and I don't know what to do about it. The first
> instinct is to just remove it.
>
> BR,
> Jani.
>
>
> [1] https://patchwork.freedesktop.org/patch/msgid/4be86d7a0737b2c49eee460d29d42843418536fe.1660137416.git.jani.nikula@intel.com
>
>> +
>> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
>> +		stamp = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
>> +	ktime = ktime_get_boottime_ns();
>> +
>> +	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", ktime, ktime);
>> +	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", stamp, stamp);
>> +	drm_printf(p, "CS timestamp frequency: %u Hz, %u ns\n",
>> +		   gt->clock_frequency, gt->clock_period_ns);
>> +}
>> +
>>   int intel_guc_init(struct intel_guc *guc)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index a7acffbf15d1f..804133df1ac9b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -464,4 +464,6 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>>   
>>   void intel_guc_write_barrier(struct intel_guc *guc);
>>   
>> +void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index 991d4a02248dc..07d31ae32f765 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -764,6 +764,8 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>>   	if (!obj)
>>   		return 0;
>>   
>> +	intel_guc_dump_time_info(guc, p);
>> +
>>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>>   	if (IS_ERR(map)) {
>>   		DRM_DEBUG("Failed to pin object\n");
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 32e92651ef7c2..addba75252343 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -678,6 +678,7 @@ static void err_print_uc(struct drm_i915_error_state_buf *m,
>>   
>>   	intel_uc_fw_dump(&error_uc->guc_fw, &p);
>>   	intel_uc_fw_dump(&error_uc->huc_fw, &p);
>> +	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->timestamp);
>>   	intel_gpu_error_print_vma(m, NULL, error_uc->guc_log);
>>   }
>>   
>> @@ -720,6 +721,8 @@ static void err_print_gt_global_nonguc(struct drm_i915_error_state_buf *m,
>>   	int i;
>>   
>>   	err_printf(m, "GT awake: %s\n", str_yes_no(gt->awake));
>> +	err_printf(m, "CS timestamp frequency: %u Hz, %d ns\n",
>> +		   gt->clock_frequency, gt->clock_period_ns);
>>   	err_printf(m, "EIR: 0x%08x\n", gt->eir);
>>   	err_printf(m, "PGTBL_ER: 0x%08x\n", gt->pgtbl_er);
>>   
>> @@ -1675,6 +1678,13 @@ gt_record_uc(struct intel_gt_coredump *gt,
>>   	 */
>>   	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
>>   	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
>> +
>> +	/*
>> +	 * Save the GuC log and include a timestamp reference for converting the
>> +	 * log times to system times (in conjunction with the error->boottime and
>> +	 * gt->clock_frequency fields saved elsewhere).
>> +	 */
>> +	error_uc->timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
>>   	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>>   						"GuC log buffer", compress);
>>   
>> @@ -1833,6 +1843,8 @@ static void gt_record_global_regs(struct intel_gt_coredump *gt)
>>   static void gt_record_info(struct intel_gt_coredump *gt)
>>   {
>>   	memcpy(&gt->info, &gt->_gt->info, sizeof(struct intel_gt_info));
>> +	gt->clock_frequency = gt->_gt->clock_frequency;
>> +	gt->clock_period_ns = gt->_gt->clock_period_ns;
>>   }
>>   
>>   /*
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
>> index 55a143b92d10e..d8a8b3d529e09 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
>> @@ -150,6 +150,8 @@ struct intel_gt_coredump {
>>   	u32 gtt_cache;
>>   	u32 aux_err; /* gen12 */
>>   	u32 gam_done; /* gen12 */
>> +	u32 clock_frequency;
>> +	u32 clock_period_ns;
>>   
>>   	/* Display related */
>>   	u32 derrmr;
>> @@ -164,6 +166,7 @@ struct intel_gt_coredump {
>>   		struct intel_uc_fw guc_fw;
>>   		struct intel_uc_fw huc_fw;
>>   		struct i915_vma_coredump *guc_log;
>> +		u32 timestamp;
>>   		bool is_guc_capture;
>>   	} *uc;

