Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 945FA4EAE5A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 15:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA5810F0AF;
	Tue, 29 Mar 2022 13:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806BD10F0AF;
 Tue, 29 Mar 2022 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648560238; x=1680096238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1nH4WfYB8ZdPpbPvS8i5wcRco+mxmFbGi+wXJQn11xo=;
 b=Jq4+DhUYrqQMDGDDtGxJG3PNnctdH3fhw2TVkcSi119PJMDcYZIwVC/u
 t4eScSI/JwTL9+wHyy8Rnq/LjisXmRursnguEksGNnpJgYfnhkh0CvA1u
 5GVecbHnXZ9G6M7JMoaky/oXIgyxJnWpo8kTJQpafMJS0W3KxGe+Cypk3
 N5c8TNlv4S6eFUq2zXwLyhCH72Cd0xGeaGwleGxpAMncdKVyMvr9k2cMy
 ZWwj43N5ELM6lmAPiBoYPO4Lqkh0DXm90O0CZ6bpdijBkFVubszkJxK7K
 mjm0xr2dAv3fxFk6s3oIUZy6wQN70A7HmXa7sALoq9MdgTcRwFtnMyAt+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259220151"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259220151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 06:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="502886004"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 29 Mar 2022 06:23:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 29 Mar 2022 06:23:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 29 Mar 2022 06:23:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 29 Mar 2022 06:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3YjdHkSKoNV4RMXS8QjlHVR3omNuTO2TedzddmR3Tdldvcz+748gcjMBmTTSYAyz1f/bZ0wREs+JndmDdX099SIOeg5wJiK077GrC+YgY0ugdaeNuqFf5uN9oe+9syvONbCie4NIGthOIHqkaPNP1CvqldV3mN3aBDfgFnsM8mVgKi3tWV+/39mF1YmAIwb6WdBms3XFnZmRJ3BGHkDrxHuJ3MHPPD3D6ZyPzyV+4zOXacE6bhAwSOS7KY86jCaGx1XlWLLjctvAdQ2y1HyrBmbHPFIKWHpCTMwuTcF3WLxk2hEXD+o8Wu9nsB3dIllCu1IB/mI5+eGFfQgY5qVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EJszPqrnDhZw3mu3Ejtnpo2ZSx45Yv5CEbE6uzuppo=;
 b=RM3BeKxSxLY+Syx5OtMccn1fbO8mRm9oDrkSJ7LCLHbyBHEoMvuV740bhrV15I8yVu1yK4pIBhoa2ooX6oaEfWkzSY+ef1zuMvsS8/cQdCI5n3E7K+YcPj8Ejydice+0FAvdsWvHjkjBzd/YVBi/sbPfYqgmMtsKxraC8VOWnlZ+JEau1+uQ05pZAe1+OH89s6HxkXfKv21IXqLbgDK7RIkBN+PBIbptHfkvOJOIm+TiGHewvxKRGAj/aqi0I7XW2lD3JUYl+6IMeMvLQ+EQoqDc4ZmNmCSpS4+yzn2734Xn/PpwwhycSBluMp7jm9ktFxbQRG6JEqJ41c72Tng29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by CY4PR11MB1349.namprd11.prod.outlook.com (2603:10b6:903:30::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Tue, 29 Mar
 2022 13:23:53 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564%8]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:23:53 +0000
Date: Tue, 29 Mar 2022 18:53:42 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, Hellstrom Thomas
 <thomas.hellstrom@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 3/9] drm/i915/gt: Optimize the migration and clear loop
Message-ID: <YkMIXjJoMobhv21A@bvivekan-mobl.gar.corp.intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
 <20220328190736.19697-4-ramalingam.c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220328190736.19697-4-ramalingam.c@intel.com>
X-ClientProxiedBy: PN1PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::14) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7752087c-713c-4bed-9beb-08da11875e4d
X-MS-TrafficTypeDiagnostic: CY4PR11MB1349:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB13497B48DA32B610F3DA5EC49F1E9@CY4PR11MB1349.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wA9PyG6bd0uC1Y0JuymIM+t9q9ElAVH2wEDr/G/WO3GVFNuJ2r0Ns7791F47VqFuTDFgW+XZaLJmNVhb2tNGcWaV0ohdg7LyqvnyVUYmH9W/KmMbkk7sA250yJlq3ENiOVvwqFQedywr/t2pPteKMxZooJ40HizmjwCtW9J88wXKywgspZtt8MclD5vRGhRQ1pwHeMVP+RcT75/oyhagkrBzTmXvAakFY047uM7gfHxeRN7Js8KHQIAnd1Ef8UK+2J3rY0WwOf0lJrDw+DwBvoi7RkQuaun9bx3Mx2ZfEQb6UCXmoteqkHrYUKY3x62fAmstCOyi6amkHyI1dZe0UisasMqIYBcMZlN749kr5akT1SAN+9V9fUwftFz3T66V5tCBJzgP3nIDuGJEt9b8zBlh0zudAf9y6PNNdv89pOr2J7Yy/TtkuZqTL4MO2HvSPpsrZRVJ5wFjwhuXDC5MhaOdK9RwiPvFEXKWZBAE3dIJovbdgZXsGbwZCW30N2I2CxPw7kmKSD/mGUX9lDbC4LKUrlXAKwkWIKxXp0O8Gs4OzYGoe9OdaM/sLclCh7TIzutx/+/cGher1A3MIKTcokhLY4dPNQ162W8oh9OVGWH+PCg/SIn4pJU9MUd/9f3RJJ7Ay9qU2C3u5UI9Z5Q7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(110136005)(26005)(54906003)(6666004)(6512007)(6506007)(53546011)(186003)(66574015)(82960400001)(6486002)(86362001)(38100700002)(44832011)(508600001)(5660300002)(8676002)(66556008)(66476007)(66946007)(2906002)(8936002)(4326008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1k2cUg2dFM2N3hTeUtxUDRoQzdPSnhRa1hoRzVWdmNhbXFRM1B6emlyTksr?=
 =?utf-8?B?elRoK3FtaWh4MDNuRERmYXF5bURSUXBoQVEySHJPTzBOa0dzbU5wTmRPeHUx?=
 =?utf-8?B?V0lxbXRDVkhEMWcvbFpUNTV2R0VzSVo5bWhVeXRmV1dhS2NmRDR1SllMRk1t?=
 =?utf-8?B?Q24xRGhzWkVFclJwT0lYb1M0amRsdWVjN2xCdHp3NElhREpVb3lYTHJjWEtz?=
 =?utf-8?B?dkJBRmtWTVJvSE5Id0VvdmZhTnNzQi9BdHVQeTZpdm9pNWZGWmNXS1NDN3NX?=
 =?utf-8?B?Q1ZKN2lvV1QwdWVKYW0yUGxnS0NqeXEwQXVSL2RqdEswaTlleVRZc0QxSEk2?=
 =?utf-8?B?RDBpRVdXRUZNcG5EbFJVYWZvNUZrNklud0x1SFRrVVRGQWdic0huZTFGVVVC?=
 =?utf-8?B?S2ZnWGNLYlNJZktKRy94RVdGWkRjMlNtVXhGWmZ0RGpRdG1weC9UTVhjQTlB?=
 =?utf-8?B?QlMvY2V5Um8ySFZldXdyWEJWWUJwUXVybmpJd3k4aUtSZll5dmhMR2JiRm8y?=
 =?utf-8?B?OTZ4UUdsOEtKbnpabDloemRjNUhkQ2ZtSU9CMTN0NVRsenRQN3VNU2RzWVVq?=
 =?utf-8?B?dXVoRTVHb2E5Q2JselpNZ3E4M0VWVXB6dXUzZTNiamhodG5NT3lrWFZ0Z3pl?=
 =?utf-8?B?UU9Ra1FVRjZyenF3UTJjRnNobldvc0NyOXgyZGVyM1JWVFNZcXoyaWo5Sncv?=
 =?utf-8?B?MTFQZkNEYnJ1SkhJajQzaTdydW5oU0J4bXFBSTVRSGE4cHh2ck1XVGJBR0w5?=
 =?utf-8?B?TDl3ZHdFSzB3MjA0MnNTUWhHTlVXdnhYOVpXZ2UwZGVFdHFRT2gyWi80cU13?=
 =?utf-8?B?eFA5WWVxUkt3OVRMci9tZVdlekpxTDdrT0c5UzdzYy9veVhoZG1CTVpnYnFr?=
 =?utf-8?B?c21Tdk84YXBBTmFya0xNcWpuS3MyNE5leXpyTlZaVGhyWkV2b3hTTmdLdVgv?=
 =?utf-8?B?ck5EeGVoeFhWUG43MlNNMnlyanNVMXAyOWZCUVkvWjM3eXBPZEE0OUU4Mk5a?=
 =?utf-8?B?YWlSNWYvaDY3RitSUXhKV1k2VzdwV2h2WGVZeEYxcVplbVlpdjNDUE9YYkFX?=
 =?utf-8?B?YjBzSlJ2VTIrWlh0UEw0a01XbnB4U0N5eGJwa2NHb040TW1Nd3RMZVd6eG1B?=
 =?utf-8?B?K2tENHdHMFNib1VuZWNCN2VtanJHVGIrMy9RNEFZYVVXQUhQQ2U5MkJGMmda?=
 =?utf-8?B?UGk0NnRKMFBxakhqOWJjZVBpWlJnQ3pQd1V4VFJGdUMxS0dVcE90OG5FOE1i?=
 =?utf-8?B?MTlEczMwck1SOUxxR05INHo1SXVzZ0E2MWhGVXlqS3BvWFNkWUZQMlljb3Jt?=
 =?utf-8?B?NXd5UXhSL3p2MmxDL0h5VFltR091UVVJc2dyUWlPMWJSQi9FWlMyMW1Tdk80?=
 =?utf-8?B?b2ZRZVVGc0gyc3pnUUxxVGxQdUYrMzJhOGxPT2tSRWJZb2k4YjZ4OW5ncWNT?=
 =?utf-8?B?blRiVW5vUHBXQ3pGY0J4UU41NnJUQzVLSFYwVVJLSms0a29nL3h4bTVRUlVH?=
 =?utf-8?B?MU93akR2WXN1YXVIeDJzVUxvYzhkeG9iZEl4Vkd3UjYrRXlmKzFBcTFuV2lW?=
 =?utf-8?B?djBBYmdoRnV6Y2pCN2ZocVVja3l0ZFNKZ1F3ZlpQNmt5VjlQdWxOa2xoWUdp?=
 =?utf-8?B?MzZ1N1B4cGZjK0lZakFrQ3VpQUJKUnBLWWFucVhjK0QwVVJ6d3FSUTZCMjM2?=
 =?utf-8?B?RG5TWVk5NGFzVkhEVGJtZGpJYkxmZCtxZEM0cUNCUTB5N01WeW9rOTNWNnhF?=
 =?utf-8?B?MnY0TUFNUE03bkkrTDlQaVhybU16L2NTSGtCY0hLeFMzUWZSVnZZNVNPVFpH?=
 =?utf-8?B?czhRR3NmdnpMbittU2tKSXhPazlISDJmdEl6cFNlcnp0eDZ1alZCZHB5TDlp?=
 =?utf-8?B?TTNuNWsveU5tQWxXU09WcXMwY3hTQzEwa3hZWlE5REhYVjl2aFZ1THgrOXRC?=
 =?utf-8?B?Q1cvajljQWFhdHZiaXRLYnJ5TUJQekwwVXExNXVSbWlVNHcwQmtWSWlETGxF?=
 =?utf-8?B?azNVWExxMHcrMXpKNGhiODdtSU5TamZJS3N0UlFZbUQwMXVXaFdHMXlFdTZL?=
 =?utf-8?B?ODVTbklvUFd4aHNoUzVUS0lnWHgrWDQycUtCY2NnQmp1WWxKQU9Tdy90UUcw?=
 =?utf-8?B?T2JyMnNsNWlOWi9GVGFJcVNzb1FVcm5WazN2aVVyd3NMNWdycGJTVnpQOXVl?=
 =?utf-8?B?QThJUDRNbE9tbTJxVUo5ek1PRlU3T1B4N1REa2xGY2FaVnhubEtDaFZRczI5?=
 =?utf-8?B?WU40WG8rVGhiN085d1hKYnpka2RmaEJkUzFsQS9EZDZLdDJ4UGUrTGgzV081?=
 =?utf-8?B?ZlNod2gzRkcrV1RNVXh3UzE2YkpVVmJ5MlVWNENXaFd0QUNPQ3M3b1libkJE?=
 =?utf-8?Q?ELCPyG6hC5n7sMokiRjGRBVAB/zDACj2wxNGD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7752087c-713c-4bed-9beb-08da11875e4d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:23:53.0485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PWzjN0AdMBs+egPHUerMd5VQKajdcD0wEb/5vfpfCRo6wJy0JjmumVWR6rOntT0Avm07FkJViBNP4HJxbRuTXph/rDCcS5zPMYCWQcbSyPSZZoV2ViIV0OhDwkYqQwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1349
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.03.2022 00:37, Ramalingam C wrote:
> Move the static calculations out of the loops for copy and clear.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 17dd372a47d1..ec9a9e7cb388 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -526,6 +526,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>  			   struct i915_request **out)
>  {
>  	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
> +	u32 src_offset, dst_offset;
>  	struct i915_request *rq;
>  	int err;
>  
> @@ -534,8 +535,20 @@ intel_context_migrate_copy(struct intel_context *ce,
>  
>  	GEM_BUG_ON(ce->ring->size < SZ_64K);
>  
> +	src_offset = 0;
> +	dst_offset = CHUNK_SZ;
> +	if (HAS_64K_PAGES(ce->engine->i915)) {
> +		GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> +
> +		src_offset = 0;
> +		dst_offset = 0;
> +		if (src_is_lmem)
> +			src_offset = CHUNK_SZ;
> +		if (dst_is_lmem)
> +			dst_offset = 2 * CHUNK_SZ;
> +	}
> +
>  	do {
> -		u32 src_offset, dst_offset;
>  		int len;
>  
>  		rq = i915_request_create(ce);
> @@ -563,19 +576,6 @@ intel_context_migrate_copy(struct intel_context *ce,
>  		if (err)
>  			goto out_rq;
>  
> -		src_offset = 0;
> -		dst_offset = CHUNK_SZ;
> -		if (HAS_64K_PAGES(ce->engine->i915)) {
> -			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> -
> -			src_offset = 0;
> -			dst_offset = 0;
> -			if (src_is_lmem)
> -				src_offset = CHUNK_SZ;
> -			if (dst_is_lmem)
> -				dst_offset = 2 * CHUNK_SZ;
> -		}
> -
>  		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
>  			       src_offset, CHUNK_SZ);
>  		if (len <= 0) {
> @@ -585,12 +585,10 @@ intel_context_migrate_copy(struct intel_context *ce,
>  
>  		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
>  			       dst_offset, len);
> -		if (err < 0)
> -			goto out_rq;
> -		if (err < len) {
> +		if (err < len)
>  			err = -EINVAL;
> +		if (err < 0)
>  			goto out_rq;
> -		}
With this change, for the case 0 < err < len, now the code does not
reach `goto out_rq`.
Is it the expected behavior? If yes, can you please add some details
regarding this change in the commit description.

Regards,
Bala
>  
>  		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>  		if (err)
> @@ -691,6 +689,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>  {
>  	struct sgt_dma it = sg_sgt(sg);
>  	struct i915_request *rq;
> +	u32 offset;
>  	int err;
>  
>  	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
> @@ -698,8 +697,11 @@ intel_context_migrate_clear(struct intel_context *ce,
>  
>  	GEM_BUG_ON(ce->ring->size < SZ_64K);
>  
> +	offset = 0;
> +	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> +		offset = CHUNK_SZ;
> +
>  	do {
> -		u32 offset;
>  		int len;
>  
>  		rq = i915_request_create(ce);
> @@ -727,10 +729,6 @@ intel_context_migrate_clear(struct intel_context *ce,
>  		if (err)
>  			goto out_rq;
>  
> -		offset = 0;
> -		if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> -			offset = CHUNK_SZ;
> -
>  		len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
>  		if (len <= 0) {
>  			err = len;
> -- 
> 2.20.1
> 
