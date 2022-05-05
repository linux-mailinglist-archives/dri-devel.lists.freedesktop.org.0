Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BB551C884
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26D810EE5C;
	Thu,  5 May 2022 18:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555EF10EDEA;
 Thu,  5 May 2022 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651777009; x=1683313009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DObCr8a/djpXnA9iilg6UAh37n1qsOPCWuOSyRJYGYc=;
 b=O8VNoiRyeRfYhu83DSdYov+vQ/3EItVEt5+LzsSrC7XbsGgtQRc8q2UD
 MVfmvfP5bmC9t8L28NYx3t3J0Ev/08AZ5Uiv1/gkaL+PeuOkvhpQgagUu
 /9N1KleZakmoQlKb42m22pmTZ6rkL7zWrkJ7IUWoLh7BInB+csHsO6Znv
 amodz2Fa2fPrjQCgxj7Fvqc/+pQQz9bjtx38bfHlFzpw6kNn1OuKcd0G5
 93VCdX2t82bkR2OvQqlxxXUe1JEmPN/1AuGUNubh3XlEiYUJHzq7TJSOP
 LHPf1rZ/jiPSm3A+YwhGDNAYOlO17q/fGFuwp3H/MEN0QbH2H5yDRLjEF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248126550"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248126550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 11:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="537483016"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 05 May 2022 11:56:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 11:56:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 11:56:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 5 May 2022 11:56:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 5 May 2022 11:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpU2F+1heJvwHkxUPrKJIMUtfh/S8YFKxKuGb5DJY/nqNJkdvUw9mwyY9jFEsDil2GRRI27G/bLTnCSyUDxhm0zPFjHfuQv3V+OgByuJsqrEwoVcokbGxa6q11lNc7fc2X+DkgTPe3O7tBviy7HIH8VLN5NPmK7gp8qDDbPyNkBEuIIFuHEJdGQrWr+YGre7vhM8bs1W2z81FChQvxDOZ/nkrW9DmIdrVC3AAJeCyrr/jIdNs59SmooM7ZMYiYXOJUuwowMVEV+hIM1kVv1Z7GvqKx/FXBe9aGOtD66YsdkpZoSDZcc+PCaeDhl7AWMdpatVCeQoYt/HPStgbpwWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuOsZhx+dx5BXImfN443jx3jmeN7T994pBw0nc4GEPA=;
 b=DHber549wYnzvpUKDOughnxXcuDpK7KigJ/5pzUvfis64fAh0R39s0KDUM3xjkusWocNrat6U5ZtviiV2GMEuppyXfndRTD7tSSXFG9Xzdo6pgxczY/3a4hv+OCmk81Yskxip//yKqg2J+TEE2FmF+hhns5KyrJq3HyR3n3+i2bq7Xiuf+hxmPn9ep1N1Wjau58vv01oo858YxGF9ANkCqiXHtDDsnd7zLcU+XzW4V6VL+mzVdVbI+x5LplveoYFskLlVYgLlDoi6Fvxk2XK92mXlsqrtpXCsMLK+g4NqAzgAHl4z3WMhTZ/3BxEPWCe4pjlrd05C1lj/tkiIJn+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN6PR11MB2816.namprd11.prod.outlook.com (2603:10b6:805:5b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 18:56:46 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976%6]) with mapi id 15.20.5186.028; Thu, 5 May 2022
 18:56:46 +0000
Message-ID: <95b167c3-08a4-0323-a538-c0f34cc3a13d@intel.com>
Date: Thu, 5 May 2022 11:56:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/i915/guc: Support programming the EU priority in
 the GuC descriptor
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220504234636.2119794-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220504234636.2119794-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1acdfcb-aa0d-4697-c46a-08da2ec9007c
X-MS-TrafficTypeDiagnostic: SN6PR11MB2816:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB2816D1EE1EE44FCFCA5682A3BDC29@SN6PR11MB2816.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWQaWwDY/Kfy0UT77LRx7EB+ej9ilYxtZWxuIGspV6o+iCAxgEWP66dAbqB/JYfI1noeKYgXg2FuNVX6cJcXfGaD98gYZMdgJ46n7jUg06zpPfhXjp9XZbyAtqapvQFiUle9QSlxQtVU2dkIon7okQ70CD+Frv8K32PgiRvr7el7sN2pPaCwceTh4y2fTPb+Dpn4APg5cobbJj34KN0bf6GLMkY+F5NgZEtHmdSAnpU1xQj5jGyyk4juxuZWngU4OTwt1DrTlOvT2t1ZJEhOJaYL33s2srzAIlK0ONO9z4VDFg1lQ/KgH05zdhMaM37xbMBZg7WDHpK1OQjYqXmfpgbn4bd96nXZ5HA80oLqpiB4n5HlUqi4hV1/9dmRIt1M3AcHh6AWuUc8WvSJYSmsndhvQjG+6TlvRIVW/cWjbgNzda9NOu0F0k1M8t2snVsJzmQbHkMeja/Xn7/NIa9PUzCQL9cwvgXiJr+ItaZjG3CckVp/IXOBUfdHrca8RNpBtdA8658reYMHHOct/F7wevdqLHx2O2rg7hlG2pz20SLxHG9beJT8275lJf7IHv5d3vtj2NnSF89QdZV85k/PmcKaXkOYJUvAyrJUzyOxwnBAdZ6U00eO4I6X9qJP7KD3uWqdoBs3ZCMCQ326TktXikUBEfW1ZuHok/w5YANiQTP+ZP6eHQqamjLWrFWM3uWpiv1d1QHi7jr7CdXK02uusiVrhPpn3ZdjYY3o8ODXD/KRgFCIiaKCjPpYk47aSIGu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(82960400001)(83380400001)(6486002)(36756003)(31686004)(6666004)(53546011)(2906002)(6506007)(2616005)(186003)(107886003)(316002)(450100002)(6512007)(66556008)(66946007)(66476007)(26005)(4326008)(8676002)(5660300002)(31696002)(38100700002)(54906003)(86362001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3lHOXVjOTdRdk1RaUpIWkZXL3pUejJxVXIvOWRIMlZmTGlLS2RhcSt3MmFO?=
 =?utf-8?B?NWJ1YWw3NFU2NEQ5cXp4cTNkVVdheTZ1bWJ5Y2lJTE5TRUpQMzR5WDZPMUNt?=
 =?utf-8?B?UC9UcW9jUVRUSkdYeXRKZzlJSXkwQ2pXRmRneUxmS3F0OTV1N29sVUQycW9V?=
 =?utf-8?B?K0JiOUFuYXFjNWJIZE5kYXhMMVlCWWZveFVzbHJNN2laVEp2VXBIaFNLRGxk?=
 =?utf-8?B?RzRrMmJxcjNDZzdYajVUbXlXV0dqTFJGR2EzemlGMkZ1TytydWNoRWxoNFAw?=
 =?utf-8?B?bG9wUi9aZ01IM0VZeFRabHoyZjlOVVFDUU9nbVlFZFNnQ2M0OVRCV2xaSlc1?=
 =?utf-8?B?ZjBKRVFwbTREU3NSMW9kSHBORFZnSTE5a3FHVnlXQmdzTEhQQUFhaGF4UTJs?=
 =?utf-8?B?bFJxeFNzRVo0RDVPV3RtZVdsTnAyVEgxNTN2N2tKOXBER3VqbDA2TmU2VGFr?=
 =?utf-8?B?MzVSMlB3MTBYUWpuOTVRUDArSVFVOEpMOVZxeUV0akc5YkFqWkJlK0dpVmQy?=
 =?utf-8?B?NG8yakNzZG9OUjZrV0pYeVpYa0g2RjhBVFp4Mnd3R1hKcWcyWkwvWkxyN3Qv?=
 =?utf-8?B?bGtGZ2loem5rQmk3T0Jod3FNN2dwc21SeTlkOVdmZlRFa2RDR2ZZVWVhcm04?=
 =?utf-8?B?OXFSemxOTFFBTkFoV0RkTXlBdDJsdzZjb2ZrQStXOGtDNTltWVlsNmpQQWRZ?=
 =?utf-8?B?cUJuNVZ1eU1JRkx2Yzg4MzZYdHNwd2ZSNkQ0UVZqRHFjYjlWS3BHRFdySUFK?=
 =?utf-8?B?aVFLcStZZlNuRHVTYXNtS1lFSlZHMU1BaFdwaklZVmhmSjg4dzE5VU1IU3dq?=
 =?utf-8?B?cVFQaUhMSGQwWHJ6d2Z6UitVajVNd3pEUFBBMzFCb05IQ051NE1haE10bzRH?=
 =?utf-8?B?SEt4OGY3NkUzdXBBcUttZEw5ZzRkQzZoWktBakRuWjAzNEJ2Q0krU3Fienl4?=
 =?utf-8?B?SElCVmI4SklNV1dpNWhYWG82MHVyUzJQTWZwQjY4L0VGZVFFMHJOMkZ4S2dZ?=
 =?utf-8?B?MjJ3ZDdLa0ZrakNKYXgzdWZnb3ZpelpZdEo0Mkx6dWhxM2prZFZtbmRaWW52?=
 =?utf-8?B?VXRPQzZ0LzJNU3VrVTZpUDViL2gwRWUyck51L2tNeitncEt6TGFFcThqa0Zx?=
 =?utf-8?B?aU0wZ01RbWJmOWI2NG9hRHJwSlQwaVdpSmZWc3RtWHpZMWVsbVA1N1ZlOVE4?=
 =?utf-8?B?WXd1WlhydHF4WEFMeXVDbEdxODB1c2xQaStITjA5YnRidjBaTUVpNUgxOXNh?=
 =?utf-8?B?ZE5EZk41M1RBOUNNVklyYS8ycmFqVy8xMjlVdzAzUlp5YlhVVlAxTmRYMFJ4?=
 =?utf-8?B?UDEwS1lJT1Y5OER5ZWlwWFk2UW5MNjNnVTBRTjcyd29PZElpWGk1MEpldHgx?=
 =?utf-8?B?SU5scWxRS3hUamJNTXFDNlBRZG5Pa3pUNVZuc2s1N2drWFNnemZyZjJiVjBY?=
 =?utf-8?B?OWx5LzlkRkwwb0Q5MkJuZG1sTDJxajFaeTNxSTFidmVxQ2ROODVNUEFwS2xm?=
 =?utf-8?B?YTVJRDF4S3ZLYU52L0I2ck9BdDdYNkNjSGhwSVcvS3R6Qm1CQ1drRUZkSXhn?=
 =?utf-8?B?ME9mdkxFVy9QaDJ5RXNadjJTT3ViQi9KM3lVOVlMb1AwMDZPTWhTZ1ZiVnVm?=
 =?utf-8?B?RGpJVndKVk1jeWxIckdTNENhZFpuNTNzMXZzdmpYdERsdjNMWE5iVXZFck5v?=
 =?utf-8?B?YTREdDZyV3RHcHp0NUlaaTBkdlQ3WDVHb3NJcW9GTkQ0SmN5V0E0NUIvbG54?=
 =?utf-8?B?UFMwRUYzUjBUMXpZV0pxcStxTjdpZk1QY1ZHaVFjSng3eWozdjErUXhaaEND?=
 =?utf-8?B?RWZsa2t2eWFkbDZnNFYzR0liU3kyMy9tbHNPc09iQ1Q5ZERjTDA3SHdCeUJ3?=
 =?utf-8?B?UEJyaVhyTVo5RWZmaEgxTmNYeHdDRjlpU3lIQ3pZTlNmVjU5UTlleTBlU2xa?=
 =?utf-8?B?Y3hQakdRUUpJNXRlem5qdThSQTJSYUdQOWZUakY4eHZoaTQzUHNaRUYzT0Za?=
 =?utf-8?B?YjJkN2l6SzhkTHFSRFpSdmhqa3VaK3dkRVJmL3JNbCszMTNKdWNjV2tRU2Uy?=
 =?utf-8?B?ZEh2SnFhT3JES2djZnlqTFRScmNjZFBBR2N4RUVuRGJUZURaMjVoUlBFTU1T?=
 =?utf-8?B?NHFmKzFEQ0ZJeXMwY3NFd0hMbDBqalkzY2RBYjdybWJ0RUhrT2JHOTJZOE5q?=
 =?utf-8?B?STBFZzNxR3pnTk52d25adkZBTVU1L0x2Z0E4cmwwMCtqVWloZjdOQ2tlZ0Nj?=
 =?utf-8?B?VjR6UUpCaUxoVWdWNHl6S0E3aVRCcHV0ZzB5YjFxT3NZdFlhd0J5UkVsY2gv?=
 =?utf-8?B?cWorVlVrTU94TnR6YzVEYkpmMlFjcHAyODR3ejJWZnA1dmhvN2Y2b1NSNDRv?=
 =?utf-8?Q?M0G980DHNrM1Jsrw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1acdfcb-aa0d-4697-c46a-08da2ec9007c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 18:56:45.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6y/YQx99NU3mLzHzOyuVVXW+gxp6eSr842eC/cLE5SYZ4tVX5a8y88vSpz/fDbVbuS8Q3oPK3L5fAdvRfSbJtUqKzwj1jLfYDxtuVZ36IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2816
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
Cc: Matthew Brost <matthew.brost@intel.com>, Aravind
 Iddamsetty <aravind.iddamsetty@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/2022 16:46, Daniele Ceraolo Spurio wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> In GuC submission mode the EU priority must be updated by the GuC rather
> than the driver as the GuC owns the programming of the context descriptor.
>
> Given that the GuC code uses the GuC priorities, we can't use a generic
> function using i915 priorities for both execlists and GuC submission.
> The existing function has therefore been pushed to the execlists
> back-end while a new one has been added for GuC.
>
> v2: correctly use the GuC prio.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../drm/i915/gt/intel_execlists_submission.c  | 12 +++++++++-
>   drivers/gpu/drm/i915/gt/intel_lrc.h           | 10 ---------
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 +++++++++++++++++++
>   3 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 86f7a9ac1c394..2b0266cab66b9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -661,6 +661,16 @@ static inline void execlists_schedule_out(struct i915_request *rq)
>   	i915_request_put(rq);
>   }
>   
> +static u32 map_i915_prio_to_lrc_desc_prio(int prio)
> +{
> +	if (prio > I915_PRIORITY_NORMAL)
> +		return GEN12_CTX_PRIORITY_HIGH;
> +	else if (prio < I915_PRIORITY_NORMAL)
> +		return GEN12_CTX_PRIORITY_LOW;
> +	else
> +		return GEN12_CTX_PRIORITY_NORMAL;
> +}
> +
>   static u64 execlists_update_context(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
> @@ -669,7 +679,7 @@ static u64 execlists_update_context(struct i915_request *rq)
>   
>   	desc = ce->lrc.desc;
>   	if (rq->engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
> -		desc |= lrc_desc_priority(rq_prio(rq));
> +		desc |= map_i915_prio_to_lrc_desc_prio(rq_prio(rq));
>   
>   	/*
>   	 * WaIdleLiteRestore:bdw,skl
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
> index 31be734010db3..a390f0813c8b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.h
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
> @@ -111,16 +111,6 @@ enum {
>   #define XEHP_SW_COUNTER_SHIFT			58
>   #define XEHP_SW_COUNTER_WIDTH			6
>   
> -static inline u32 lrc_desc_priority(int prio)
> -{
> -	if (prio > I915_PRIORITY_NORMAL)
> -		return GEN12_CTX_PRIORITY_HIGH;
> -	else if (prio < I915_PRIORITY_NORMAL)
> -		return GEN12_CTX_PRIORITY_LOW;
> -	else
> -		return GEN12_CTX_PRIORITY_NORMAL;
> -}
> -
>   static inline void lrc_runtime_start(struct intel_context *ce)
>   {
>   	struct intel_context_stats *stats = &ce->stats;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 75291e9846c50..8bf8b6d588d43 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2394,6 +2394,26 @@ static int guc_context_policy_init(struct intel_context *ce, bool loop)
>   	return ret;
>   }
>   
> +static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
> +{
> +	/*
> +	 * this matches the mapping we do in map_i915_prio_to_guc_prio()
> +	 * (e.g. prio < I915_PRIORITY_NORMAL maps to GUC_CLIENT_PRIORITY_NORMAL)
> +	 */
> +	switch (prio) {
> +	default:
> +		MISSING_CASE(prio);
> +		fallthrough;
> +	case GUC_CLIENT_PRIORITY_KMD_NORMAL:
> +		return GEN12_CTX_PRIORITY_NORMAL;
> +	case GUC_CLIENT_PRIORITY_NORMAL:
> +		return GEN12_CTX_PRIORITY_LOW;
> +	case GUC_CLIENT_PRIORITY_HIGH:
> +	case GUC_CLIENT_PRIORITY_KMD_HIGH:
> +		return GEN12_CTX_PRIORITY_HIGH;
> +	}
> +}
> +
>   static void prepare_context_registration_info(struct intel_context *ce,
>   					      struct guc_ctxt_registration_info *info)
>   {
> @@ -2420,6 +2440,8 @@ static void prepare_context_registration_info(struct intel_context *ce,
>   	 */
>   	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
>   	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
> +	if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
> +		info->hwlrca_lo |= map_guc_prio_to_lrc_desc_prio(ce->guc_state.prio);
>   	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   
>   	/*

