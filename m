Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30683705A72
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 00:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388E10E373;
	Tue, 16 May 2023 22:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19B810E373;
 Tue, 16 May 2023 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275208; x=1715811208;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bdq2TreEETXyfbU8H5V75wK/VY9zUEvX+E/Vz5vHKG0=;
 b=B/P4J2lBRMk7c1dBs2wLD+eQFzDV15TaBwf8vs3riqV48rbltNvEw4X4
 nhLnC8WJ4X2ElUaQkoFdvOYuc3VVWnTCklTE+vCU6EdPGwkfb5YOCDbR7
 Jt3+F2tBAB4Ox1j9AhrFWdqIbix+nrcKLuPg3mYP7lZdXZGBo2O0Pt1aR
 zE7BLF//3fW+Rtp6JHA8R1/FOU17x2vXvEN/e7cPSQrp+uno/zIHZI7wV
 BrMM7b9DmjG4UtoSTGNXavOfr7RsqUwKCMapDWfC/sFe2xVsZ2gVt+SHD
 8VPumASu6grw1z1rwBSxt8fT1lxjXG4gmeEnZnOQrtzLSx01fd73DDcdM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="350442903"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="350442903"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="875809982"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="875809982"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 16 May 2023 15:13:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 15:13:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 15:13:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 15:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTNpdrLnwrMUYPLe+nJecj+pTpYt8XJk5n5KykMfcy3OA1J9PpVR15dgRpSECPnzBahSmyGTQP12wudjD9/IRMmhTrGRe1z+q0IYjVet5UTpU4tjowehffVU2fWZxhfJkAYLh5kLtAEveHr5rYzCmaM6+mE+Z0eezo9H376sc3m4FxC/K/CNHOR7NVVFxXGuAbfkHxh4d1tQLjLoBTkCnCdaAltI+MWjXR6FWnENMvR2p7El9wB+8Q7+spbFrmrLg17OnJhjbH5OXYVi4Bro7NHE/fTAiCznYGErgJjnCLC30zkIcmOjK0bfr5VarL4wgRUKS6ewQEPwMKqn1kUPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q4RhXT5QFfC4o7ABNJbs/fwL9nUAEqndNN2CrSw7LE=;
 b=bZcX6msGSia4/xYzAxhVuDlEG9wNs5eEQ2QfgLquzGK2isO5h2fqruzFWx3Tmgl8R+g6fSSOJ62A6XEHUx+3Z0/pmns4WjFaEqpYNYDpIwjxwVcK83l0DRdOCYVNqw4I0Hoo8+qqunIoeAzTceuhjNzSezOvfPjKYXCvMBuM1uMAyToP3V+8TcTskWTk2Wp4WxN5z1e5z+PSm9KlzCvj/AgOWkChqLeiONl5FmbzA6b9Cff4XdGW6pb5zDOZsXLyiW/Eyg1Xo4uRyD6IL1gkL5DOM3aEGqIqhuvpgp+gME62M4N+OHXPnkHiaHnVQ+LPJKvBq4v8jsVaQNh+DFnAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Tue, 16 May 2023 22:13:22 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::3435:8461:a51:17fc]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::3435:8461:a51:17fc%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 22:13:20 +0000
Date: Tue, 16 May 2023 15:13:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/pmu: Change bitmask of enabled events to u32
Message-ID: <ZGP/7UvMtspSByjp@orsosgc001.jf.intel.com>
References: <20230516092445.184823-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230516092445.184823-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff6d471-7f53-471d-da75-08db565ac1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JASUIr85fSbk7TW+aAYgoOwxLuWSifqhc0HWgyH8N8iIIumexB/6RUi+jKMmCuQdJoE2lOZ517vKDpIqiMN3hZH36OEr/DDO/QDVYDhxR6QIFahd/abk8RmwDUuPYS8BEgugpUXF/G6I7DjCaadxO7HiIqgeT4ozfN8Nt6R4ykQ3X3snHCdXidqq5Zh+igvSa2SIMFscoFZKPnnnIVU2dGOjZ37Uyy4K3cRh25TW78CY3MJavZ3328DE5Qv9m47FIeLy6eJBWEj6VIF3Xy0AaJLBDoRd4S7ocMYL+HxlBq3+LGoobGzLAXErACcONh1UshsfiSW2UtYJAfXB2jhRzVQY5qoG/cel9TkxP8Th15I1jQSDPqjUnyTwFwlXcE27t+P116C1BzDCQfeTC18JnRpZo721/FNasBU7e0MxGPZRhU8CYFjiXjQtq8RLwTmYW/JwDYi/YMkVTa4aMmeC4p76G2b5+th/kg8/EQgTGZq4vHQEAsj3YuVWQhyi5a106Eh/l91KuQIRVNaOH10oIuwW23iZjkrEeFgaErTp5dtb5HnB2cASkn+yHd3OLbur
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(6666004)(6486002)(83380400001)(6506007)(6512007)(26005)(186003)(5660300002)(82960400001)(54906003)(86362001)(41300700001)(316002)(38100700002)(66556008)(66476007)(66946007)(6916009)(8676002)(4326008)(8936002)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckE2Z0g5TUF4RW02UEJZVG40elJKMTJXUHRVd0xhTi8rbENrS0FyUGFHM3N6?=
 =?utf-8?B?TlI1WUR3eFVzZ1M0QmNpaU9VcTdmYlJqdXpCakJBdCtFSWlEdEVOL24rV2Nh?=
 =?utf-8?B?QjVBcklJYldqNkJTYldIb2l2elY2Ty9qb3lmSkFuRndVUnRoR3ExRXVSSlBt?=
 =?utf-8?B?dEZJQW0wTmZKcTlsbmNBOXBORDRHR0pCUG5GeC9NdjRFRjNsUzJ1SktjS0xh?=
 =?utf-8?B?aWtqTFdTT0twU3hONUNzNmRKSlFWbnJZUUdmVnlhcklKejQrUVVBM0pQaTVY?=
 =?utf-8?B?am9Hbk85aFBvT1RrVERXbkZYQXRPc21LZzhnQzFpWUtxdjlPWjZMeXpqb2o5?=
 =?utf-8?B?TUVtTjdxcmFNTWdYRTc1TEpxZ1VsVGkvUHdqQ1VLV0lURWx4UnZ1cVpicDF3?=
 =?utf-8?B?SDlQZTV3OTlFTGFJWHNISkJXQUNCRHdTM3ZvS0E2RVNoTzNXQ05WNTk5M3ZX?=
 =?utf-8?B?cGRUYTJoK2krOVZDdndDZyttQnNVbkpZQVNkVk9kbXZ1bUtSRGxjVklaenhO?=
 =?utf-8?B?UGVUOVBNL25Yb0kvRlNaZ2IwQjNCYlZ5emhFRlAzSHR1eWt6Vm45aTRMMDh3?=
 =?utf-8?B?Q21jcHRRQjlQbDNTbWVWbkd3eTRyQzRrK1lyeDRuZ3R3RU04MEdvaTdZb2JD?=
 =?utf-8?B?OW4wblhvSnFJM29aS3ZrUXpXWVhhRlFXa2h2cldrTmRTa1NLOVo3K29mU0tj?=
 =?utf-8?B?L1RrVTdHK3dRVlp0ZFhJUEVGODNpTWJpYlg0T0lFZ0lXZ2c0ak4xYys3bVBO?=
 =?utf-8?B?OU82T1VzSVdJUFFMS3d3ZUZMRVRBbjlFSlVEbWFLekhhYTlFLzJncjdHaXVD?=
 =?utf-8?B?Y0tXdFhtYnlxMkxRWFY0WHJZR05VdG1VQnFMUGZoWXhaREdUc0ZYK0dYZC9V?=
 =?utf-8?B?RzZlY3lpMGZhdkc4Z2lZV0RrT0VCNzMrRkJyTUFyOTYyRnFZMVBqNFlDdEYx?=
 =?utf-8?B?dVBIaGQ5QmNKSGMxS1RHN045Q1hjalA5MEZxTDVVeWdoak9oZnhqNDdjWUFX?=
 =?utf-8?B?VS9wYmVaYmNmNmNDY2tuejhFVVdleUNXNmhmOTJUaG5RTXhPOS85YW4veEhG?=
 =?utf-8?B?OFJDQS9LZlVqaTZTRTFnVkE0d3FIa0FqdzA0Y1hiOXJxNzl3V3k2Sm9XcGVk?=
 =?utf-8?B?RmYzbDdiZnBNUXRwSStwaXpCbzR1OXF6a3ZCVW01SVVhNS9OVVRneTk1TDZn?=
 =?utf-8?B?VDNVbzNxenI3QVIwRHZFUEZKNk8wTWhpYUgvVXYwVldUVEZPVFNwb1lhYWEv?=
 =?utf-8?B?clBNU3REOXYwYVZkOW1zVWNkc1hUbWtyQ2lHczFzMG9XV01SVFV3dVBTWkVt?=
 =?utf-8?B?OUxFRHdtdlJKMUszYzIxQlYrSXZiUkJDR2ZrZDQ4U0tBM1Z0Y2doQUpGK1pZ?=
 =?utf-8?B?QUdyUW50L05PYUd6azFQSUM4amE0WG5VWmZRUkVwSGZCUHAyUmNMQlo2MHR4?=
 =?utf-8?B?UlpDWGlkYnF4SmdoV2taRE44UTdhRDVsNkk5NW1SamJxZmgvSUpoR21KTUp2?=
 =?utf-8?B?bThZb3prdGc1NHpPR0ttbTJMQU5ZQ1A2dDYxQ25POVR5U3RpNE9MWVBzbFR2?=
 =?utf-8?B?djJOamZFUER6Y3JZN3l3Tmc5KzMzbWo4aVU1a1pwTUpPUFcvVFpsV1lQVHVw?=
 =?utf-8?B?WHNpMlhoSE9GQ0tpUGYrdStZcm1JSkNlNXpkQ0RyN2pFZkx3VVliSlRENWRi?=
 =?utf-8?B?QWNIdUE1Z0hTYlhPQUdseVNPdDRIYkhxZDYrZHRWaFNhNGNUZy9ISGxvYldG?=
 =?utf-8?B?OGp4K29BSjE5YzhKQzlpRWdjdWRrYWFRQzJTNndlZU1HbEw3OWRreC9ZTks3?=
 =?utf-8?B?dmt3U3V6Q3hNYW04alIxc0RubHplRDJqS09mL1phUlRKSGtDbnFRaEVrN2dL?=
 =?utf-8?B?RGo0aGYzTW1DaExmSG54ZktLWGlKQnFuZUNDdzJpOEF3emxkUDB2MWVTZHJz?=
 =?utf-8?B?VFNkaHhhMDcwVlNRcHBwQ2QzVDh1WHR5S2xBZCtFTVlwSWJjZWU2R3lOYi9h?=
 =?utf-8?B?ZDBzWmVuNUZPaW1tNndOaVpaeXkvdVNLdG9YejJXN0hiMVFWRFFxOUNzLzFR?=
 =?utf-8?B?Skt4V1NzY1VKd3hBRlA0M2VGSGdxYmZGMEtWNFBYdDdmY3hIeXpSNk03Q2or?=
 =?utf-8?B?SG9ndzVCWWxxR1JCbU1NWlhxVXgzS3ZhWTFlNEQraFVoYm1rN0tLZnZ2WGVQ?=
 =?utf-8?Q?ObRcyhRtmsWCJ7NHrV142qg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff6d471-7f53-471d-da75-08db565ac1d5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 22:13:20.4606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HTuz6CJsSG0h68X+1dmWWNWqKjCEoyrOUXCyaHwt8FJxlLSHZGxankPyJDw0d3djRz3GF1bTyvVdLfmdOQHXM7rGAJTzpsViCptnl38k0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 10:24:45AM +0100, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>Having it as u64 was a confusing (but harmless) mistake.
>
>Also add some asserts to make sure the internal field does not overflow
>in the future.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>I am not entirely sure the __builtin_constant_p->BUILD_BUG_ON branch will
>work with all compilers. Lets see...
>
>Compile tested only.
>---
> drivers/gpu/drm/i915/i915_pmu.c | 32 ++++++++++++++++++++++----------
> 1 file changed, 22 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>index 7ece883a7d95..8736b3418f88 100644
>--- a/drivers/gpu/drm/i915/i915_pmu.c
>+++ b/drivers/gpu/drm/i915/i915_pmu.c
>@@ -50,7 +50,7 @@ static u8 engine_event_instance(struct perf_event *event)
> 	return (event->attr.config >> I915_PMU_SAMPLE_BITS) & 0xff;
> }
>
>-static bool is_engine_config(u64 config)
>+static bool is_engine_config(const u64 config)
> {
> 	return config < __I915_PMU_OTHER(0);
> }
>@@ -82,15 +82,28 @@ static unsigned int other_bit(const u64 config)
>
> static unsigned int config_bit(const u64 config)
> {
>+	unsigned int bit;
>+
> 	if (is_engine_config(config))
>-		return engine_config_sample(config);
>+		bit = engine_config_sample(config);
> 	else
>-		return other_bit(config);
>+		bit = other_bit(config);
>+
>+	if (__builtin_constant_p(config))
>+		BUILD_BUG_ON(bit >
>+			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>+							 enable)) - 1);
>+	else
>+		WARN_ON_ONCE(bit >
>+			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>+							 enable)) - 1);

The else is firing for the INTERRUPT event because event_bit() also 
calls config_bit(). It would be best to move this check to config_mask() 
and leave this function as is.

Thanks,
Umesh 

>+
>+	return bit;
> }
>
>-static u64 config_mask(u64 config)
>+static u32 config_mask(const u64 config)
> {
>-	return BIT_ULL(config_bit(config));
>+	return BIT(config_bit(config));
> }
>
> static bool is_engine_event(struct perf_event *event)
>@@ -633,11 +646,10 @@ static void i915_pmu_enable(struct perf_event *event)
> {
> 	struct drm_i915_private *i915 =
> 		container_of(event->pmu, typeof(*i915), pmu.base);
>+	const unsigned int bit = event_bit(event);
> 	struct i915_pmu *pmu = &i915->pmu;
> 	unsigned long flags;
>-	unsigned int bit;
>
>-	bit = event_bit(event);
> 	if (bit == -1)
> 		goto update;
>
>@@ -651,7 +663,7 @@ static void i915_pmu_enable(struct perf_event *event)
> 	GEM_BUG_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> 	GEM_BUG_ON(pmu->enable_count[bit] == ~0);
>
>-	pmu->enable |= BIT_ULL(bit);
>+	pmu->enable |= BIT(bit);
> 	pmu->enable_count[bit]++;
>
> 	/*
>@@ -698,7 +710,7 @@ static void i915_pmu_disable(struct perf_event *event)
> {
> 	struct drm_i915_private *i915 =
> 		container_of(event->pmu, typeof(*i915), pmu.base);
>-	unsigned int bit = event_bit(event);
>+	const unsigned int bit = event_bit(event);
> 	struct i915_pmu *pmu = &i915->pmu;
> 	unsigned long flags;
>
>@@ -734,7 +746,7 @@ static void i915_pmu_disable(struct perf_event *event)
> 	 * bitmask when the last listener on an event goes away.
> 	 */
> 	if (--pmu->enable_count[bit] == 0) {
>-		pmu->enable &= ~BIT_ULL(bit);
>+		pmu->enable &= ~BIT(bit);
> 		pmu->timer_enabled &= pmu_needs_timer(pmu, true);
> 	}
>
>-- 
>2.39.2
>
