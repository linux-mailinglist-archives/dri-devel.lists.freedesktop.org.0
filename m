Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA275AE7B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2967610E13E;
	Thu, 20 Jul 2023 12:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D638610E139;
 Thu, 20 Jul 2023 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689856428; x=1721392428;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AOLtPgPMjZumTO3DX4nTo8h49Pl/oGcm/25XxvFhIt0=;
 b=Qg7O9vAS9PRu1ULG34hiksEMpIDLGANH4zjsIns/XQwdfWDHfTnoYriw
 oxtJAOWy7jhxlBuFI8U67Xf29NNndXUQxol7bR4RVQDjZAoQA4hpbTwqq
 FRqGf5CNzdR9l03VQVCyv7r9xF+AOt8dNjJgKk3etd8Y4c6VOVGXP5FWi
 Bf9oEBRMt3R8vHzTNAmxYERkvSO56s1CuQVjTXoWSXP0EnlvI1yRjk6XP
 oeUOYVZcytBTk2KHWvM2KUCY/NDoYrpbPCUs5Q3EMbsO3gD3nE+MkyJpr
 F2xE/GCTFOeVGP6yrDVyay54BbYwIOs3lfb+gYFX38jPbWyvVp8xNPx4E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="369368550"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
 d="scan'208,217";a="369368550"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="1055143134"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
 d="scan'208,217";a="1055143134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2023 05:33:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 05:33:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 05:33:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 05:33:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 05:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZhO+sF32VjwSf5SosxICgXDaJqFz4oIEiZ+k8f2BLo8aMS9lTFudAulW9wtJMlYjZZs6tn8l81qXs3Fi6lzeHeOFzdXv4ruh5ZorNsVgz2bkqSkdherSBzQFR/ir2nlFpm0KL6bHkwXVFKvr0zBLWzcbdOaR+FpbBnLzJKmGnEnxDoKSf32sPiUPhLEpnrHigMiswVQ8DyxirjTYqtNQUmk+/j4dNg96eD0tDlJsKxSP7S+pVo3oEkYOBhhXsEvQQT5vxouttPrH1lSQRiN++kti9dfoMxKehezc920iN5lj6CJxOKPFyKHgCz9VaroDa5S7jf9AK+bYkIGq9Cj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FntFGNP3q9c8JWYdaBLmYRrXGQgkfDt0dw3mdZ1cNkM=;
 b=hcF/ZvUKc4q5wwYjEUzBTwch0JrFM9LEautZYVra6tPz/buBtbT57bofskj8SkXAGyymEyOfY1p2wsfjcb+siuqZHbmzXV5bIL/Gpk4x2YstydXJ3Y4fy0Br/2bhMEfJfT4Oa56VFgjGTjlXGg2kwoetCotXcvUYx4MUmXWgDp82plHyPp8lDNo3DX3Yx3ay3DOENsZ+yuL8zE6DgCZpBosGOM38x+8NDREKBbAcEedIa+KMRcXpiFHvSuoteEc2ZDmEf3/VIAP/kVbFl6zA1cwn0o0dwsxx6Dfoi8AvHuxvEA41v0a1g5R7NrNhPx9iUdQ7YID0tu6r73uDlcejjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.36; Thu, 20 Jul
 2023 12:33:43 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 12:33:43 +0000
Content-Type: multipart/alternative;
 boundary="------------x35P74QvY8CjIJA0XGd5umVp"
Message-ID: <2d2841c6-af08-ac8d-2c90-e4282c6def99@intel.com>
Date: Thu, 20 Jul 2023 14:33:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 6/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Chris
 Wilson" <chris@chris-wilson.co.uk>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
 <20230719110729.618733-7-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230719110729.618733-7-andi.shyti@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MW5PR11MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: a63ad178-976e-4231-c9c9-08db891d8e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94FawH6O8VrBqQp4ax45CsIkLRFbdSANtL8FRuFFchqACoRWJXdoOwR5aZ6b9E2tjCBiH9IG4AsNjYiTjuhwOnVg84ivTp8dgAdNYWlt990xZ9a9CY4e/fGfHnDYGztbV2BLxBFcoPrYNQyb+svIvKcGlbPJ29EjT+H+mXhF/GZgjxkXkr+PQ0VeksgyoAYp0mP508wkzGzXUNjJ1LsLd12mXeLOZ9r4V3zcgrRPNIWMiuqFBEFykoqk6cmQ2KQsdY/tO+29St08y/3uZif6gyG7FelDety54/Jh9sDeGdttUD/TvoDg94zegHvuBR+OBffOd7opm2IcEmX1gOEy4QlTn78Ilq85spQ3z0OYpP+8qDnGrw/GdooVi5iMByxCMs/VqJecj151rMR/554+LuMFIv29lZdL+0LX5XKMJd+3EpYOJWpmzRqtLJzsoi0hZ2XabhBWs+PXYg0k1glJH1QmfR17wRbVPlwAIgYnR07j4C13YwkMXJ1oFoCKZleUkxQhZ8hS/EnuPnlFoidATMaZfqnOaLWy7KDmGqbKQmEo9u5Zw2YD21Rs965/Uw2stm/7gUSJFjdKUAPkEKcbd1fX8HQb2++Po76nxh/fPVetLd3RQEa8eABvxKEVNtesSsZq7KTSTAi3hb5Mc9C+jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(31686004)(6512007)(6486002)(33964004)(478600001)(82960400001)(38100700002)(186003)(53546011)(5660300002)(44832011)(6506007)(2616005)(6666004)(83380400001)(26005)(316002)(8936002)(41300700001)(8676002)(2906002)(86362001)(31696002)(36756003)(54906003)(110136005)(66556008)(66476007)(6636002)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWp6K1Njek9VNFBXemN2aXd3dEZ5Y1FRY3NQd0lEUFhzOTBMKzRRRG9iSjNh?=
 =?utf-8?B?ZlY2dVowek45M1hoRSticzlNcHl5cXFFVGdNSGQycXIyRWhSa3k0SEpOTmE2?=
 =?utf-8?B?eE1McnFYbTRodm9RWnJ3VS80N1V6ZWVlbFN1YzducHRBbnZjLzNjbEh3YWNJ?=
 =?utf-8?B?djJnbWhIeG5UazlWZ0JITEsrQjNjT0JzTTZVMVNzWkZkVzd6Snh4T05EZDNQ?=
 =?utf-8?B?aEtWVmp4T21ENzFrZFJIZytkVVZ1RU5LTDJSelBxSUdVVGUvNU51OXZxN2th?=
 =?utf-8?B?dVNVSVBVNFR1ZFpzUGhJTHcrVXdiMk1PRDFCa1FiYnpTc3ZIYTY0UUlSQ1Bk?=
 =?utf-8?B?S2lpaE5ZNU5DZVZ1U0xoKzg2ODNaUFBxSUgybUp3WkM2TWFkR1dIVFgyU0hD?=
 =?utf-8?B?QWxGdHBiMXoxV3JkNmJBZExMUEVhSXFyUVRpbnVtaXVXMkZ4eGh2Y3JwUWI2?=
 =?utf-8?B?OEpqbG1XWUpVZkw5enhVZGI4SEMxcVc0VnFpMG1SSVNDRlM2WDJtYk9YbXY5?=
 =?utf-8?B?V2xRaE5aTHdkazZ4VW95ZEdpQzcrV3ErVzV0T1RDU2pqaFBadFpmV2gwRlFn?=
 =?utf-8?B?NTQ0amxlSEs0VzFtVGVsc3hjbFBHODcxdkRXUWhwb2ZHQVRwVjdVOWhldW9F?=
 =?utf-8?B?ek5sZ1cxbVJCUDB2WXJnbXVHWmRhRTYyZi9jQldaa1NPbW10MWdlakIrcWx0?=
 =?utf-8?B?WVhIRlloYkxKZWhzWmdBLzkrQnlLSmw1a3dNdVN6dGRkb1VwbFIvazlMZ3N2?=
 =?utf-8?B?U3NsY0xwdUw5M0RtdVMrVmxBUmNxQ2hRNkFlRms1T3lEamJGb1dzdlN5UlpO?=
 =?utf-8?B?RnRLRE9iM1BlL1JydW8ydElUT0psU2lTeDZ3U1NOWTZGTUJUODlGaWdpZnRY?=
 =?utf-8?B?NEQyWEpYSVBISzdGd3JCU3RXblNuaFFZYWh2dEFPYnB5MEE2Y1VPK3lYOFpO?=
 =?utf-8?B?aUp6Rkg2cEhmcmYrcHpLWVczRzczL1k3UUVVcE4rVVRQdVdvejZVOGxzUXpu?=
 =?utf-8?B?VHJvWXJrbUVtNFdvWG9lcFZEeUVLekt3UmRienlaVG1zS29yVDlVMEhFdnVF?=
 =?utf-8?B?a21selVCSTdrVjduVjFCd2xMUk1rVmUvQkNXRVhnMDZ4S29DRlBJVnlERGVp?=
 =?utf-8?B?cUxQV3NlY0U4M0Y0MUg3V1lKOVdBTU5UUWdsZ1VjUU1NMWNtK3pZZmhWdjVN?=
 =?utf-8?B?L2h1UldRclFtTkoyeURhYTMzblZYMXRaVTRwS1pKR2lOTEZReUEyZG5EczVX?=
 =?utf-8?B?ZGZJREtyV1hnSGVvbGNzR043V2d3VElhSEt6RzBpTUl5T0VQRmwrRjBCZWJw?=
 =?utf-8?B?UTJmbWI5UmIzZ2lXY1NCYXBzZFg0SFNKMXJxVVNpNE5KNmFXWVdKRUs1TUNp?=
 =?utf-8?B?ZlA2QWprcy9aRzl4bnJEdHJ4TlI4eGs4cURmRktlWGw0M0pEdnhodURJZzh3?=
 =?utf-8?B?T2M2eEs5T0hKejJodzlNR0w2VW1DbVFCSGIvSUd5Qk5DMmFQRTZubU1UdFM5?=
 =?utf-8?B?czFJb0srbWZML01QSlVkTkdacVpjSU95WjZ2YTByQVJrQ3o0SEZCTnl1N3N3?=
 =?utf-8?B?clRqYVMyT1dFN3cySk5ZVGlCeVloT05UNGo2TmF4ZE9Td2NoM21DZnh2cFpR?=
 =?utf-8?B?YU5vSkRsVXQzY2ZZcFZBSlVhdjFaSG9wMldiL3FKM2Y1dlBuRzhySVgzNVcr?=
 =?utf-8?B?c1VMVFY4V0hGU2s1SGhlNUhwc2E4RGI2U1JsdUJRQWlxcjlwNCttb2RNVWlh?=
 =?utf-8?B?azVrQ2IyaEVmN3FHL0RHd1ExZi9sdlBIQUpZM1FCZ080OENxMjlwZDFMMm91?=
 =?utf-8?B?YlRpVVZtOG9DYStpdXI5aSsyQ1d4MkRUK0JqZmpKUTVtQ2Y2bzNTaVZXRng4?=
 =?utf-8?B?NTV3anVxcmlxSWxQbDFHUDh2NXdGaDFjbFJwRmVIV2VEUmlDM1NMRGJuUDh6?=
 =?utf-8?B?azVvTS92SW5PRWJhNGpJa0wzS2FkV3V1Nzdjelo1eFJLRnllWlphQjVmUUpw?=
 =?utf-8?B?S0xlY295blJ2VnZVY3NHeHRaaXVpYTUvazhyVkw2Uk52dmZ3eXdWSWNocnpK?=
 =?utf-8?B?V3ZCUlRPQnJkQS9XM0IwdE5lNjVTUG5ESGpGVWJSS2J2cHMwdXRRb1ZQVDRu?=
 =?utf-8?Q?E2OW4Bmcx9yyR26SUQkx8/rQM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a63ad178-976e-4231-c9c9-08db891d8e10
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:33:43.5271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meV4kz7NJjCoS7UNij2a4oC/ZQJmnkgI71AxqELeIpcM+BTZhPkwZRVGd8vYauLVX6sTi5T+L+vL/Ev64DJzRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------x35P74QvY8CjIJA0XGd5umVp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andi,

On 7/19/2023 1:07 PM, Andi Shyti wrote:
> Commit af9e423a8aae ("drm/i915/gt: Ensure memory quiesced before
> invalidation") has made sure that the memory is quiesced before
> invalidating the AUX CCS table. Do it for all the other engines
> and not just RCS.
>
> Signed-off-by: Andi Shyti<andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt<jonathan.cavitt@intel.com>
> Cc: Matt Roper<matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 46 ++++++++++++++++++------
>   1 file changed, 36 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 1b1dadacfbf42..3bedab8d61db1 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -309,19 +309,45 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   {
>   	intel_engine_mask_t aux_inv = 0;
> -	u32 cmd, *cs;
> +	u32 cmd = 4;
> +	u32 *cs;
>   
> -	cmd = 4;
> -	if (mode & EMIT_INVALIDATE) {
> +	if (mode & EMIT_INVALIDATE)
>   		cmd += 2;
>   
> -		if (HAS_AUX_CCS(rq->engine->i915) &&
> -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv = rq->engine->mask &
> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -			if (aux_inv)
> -				cmd += 4;
> +	if (HAS_AUX_CCS(rq->engine->i915))
> +		aux_inv = rq->engine->mask &
> +			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> +
> +	/*
> +	 * On Aux CCS platforms the invalidation of the Aux
> +	 * table requires quiescing memory traffic beforehand
> +	 */
> +	if (aux_inv) {
> +		u32 bit_group_0 = 0;
> +		u32 bit_group_1 = 0;
> +
> +		cmd += 4;
> +
> +		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +
> +		switch (rq->engine->class) {
> +		case VIDEO_DECODE_CLASS:
> +			bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> +			bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
> +			bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
> +			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +			bit_group_1 |= PIPE_CONTROL_CS_STALL;
> +
> +			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
> +						   LRC_PPHWSP_SCRATCH_ADDR);


I think pipe control is only for compute and render engines.

> +
> +			break;
> +
> +		case VIDEO_ENHANCEMENT_CLASS:
> +		case COMPUTE_CLASS:

Don't think gen12_emit_flush_xcs() will get called for compute engine.

intel_guc_submission_setup() --> rcs_submission_override() replaces 
gen12_emit_flush_xcs() with |gen12_emit_flush_rcs()|

|for compute and render.|

|
|

|Regards,|

|Nirmoy
|


> +		case COPY_ENGINE_CLASS:
> +			break;
>   		}
>   	}
>   
--------------x35P74QvY8CjIJA0XGd5umVp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Andi,<br>
    </p>
    <div class="moz-cite-prefix">On 7/19/2023 1:07 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230719110729.618733-7-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Commit af9e423a8aae (&quot;drm/i915/gt: Ensure memory quiesced before
invalidation&quot;) has made sure that the memory is quiesced before
invalidating the AUX CCS table. Do it for all the other engines
and not just RCS.

Signed-off-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 46 ++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 1b1dadacfbf42..3bedab8d61db1 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -309,19 +309,45 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 {
 	intel_engine_mask_t aux_inv = 0;
-	u32 cmd, *cs;
+	u32 cmd = 4;
+	u32 *cs;
 
-	cmd = 4;
-	if (mode &amp; EMIT_INVALIDATE) {
+	if (mode &amp; EMIT_INVALIDATE)
 		cmd += 2;
 
-		if (HAS_AUX_CCS(rq-&gt;engine-&gt;i915) &amp;&amp;
-		    (rq-&gt;engine-&gt;class == VIDEO_DECODE_CLASS ||
-		     rq-&gt;engine-&gt;class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq-&gt;engine-&gt;mask &amp;
-				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
-			if (aux_inv)
-				cmd += 4;
+	if (HAS_AUX_CCS(rq-&gt;engine-&gt;i915))
+		aux_inv = rq-&gt;engine-&gt;mask &amp;
+			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
+
+	/*
+	 * On Aux CCS platforms the invalidation of the Aux
+	 * table requires quiescing memory traffic beforehand
+	 */
+	if (aux_inv) {
+		u32 bit_group_0 = 0;
+		u32 bit_group_1 = 0;
+
+		cmd += 4;
+
+		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+
+		switch (rq-&gt;engine-&gt;class) {
+		case VIDEO_DECODE_CLASS:
+			bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
+			bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
+			bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
+			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
+			bit_group_1 |= PIPE_CONTROL_CS_STALL;
+
+			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
+						   LRC_PPHWSP_SCRATCH_ADDR);</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I think pipe control is only for compute and render engines. </p>
    <blockquote type="cite" cite="mid:20230719110729.618733-7-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+			break;
+
+		case VIDEO_ENHANCEMENT_CLASS:
+		case COMPUTE_CLASS:</pre>
    </blockquote>
    <p>Don't think gen12_emit_flush_xcs() will get called for compute
      engine. <br>
    </p>
    <p>intel_guc_submission_setup() --&gt; rcs_submission_override()
      replaces gen12_emit_flush_xcs() with <code style="padding: 0px;
        tab-size: 8;" class="hljs diff language-diff">gen12_emit_flush_rcs()</code></p>
    <p><code style="padding: 0px; tab-size: 8;" class="hljs diff
        language-diff">for compute and render.</code></p>
    <p><code style="padding: 0px; tab-size: 8;" class="hljs diff
        language-diff"><br>
      </code></p>
    <p><code style="padding: 0px; tab-size: 8;" class="hljs diff
        language-diff">Regards,</code></p>
    <p><code style="padding: 0px; tab-size: 8;" class="hljs diff
        language-diff">Nirmoy<br>
      </code></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230719110729.618733-7-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
+		case COPY_ENGINE_CLASS:
+			break;
 		}
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------x35P74QvY8CjIJA0XGd5umVp--
