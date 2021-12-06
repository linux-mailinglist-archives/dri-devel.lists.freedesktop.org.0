Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFBC46A677
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 21:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508173F92;
	Mon,  6 Dec 2021 20:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5171473F7A;
 Mon,  6 Dec 2021 20:01:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="218079465"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="218079465"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 12:01:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="461969575"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 06 Dec 2021 12:01:30 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 12:01:29 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 12:01:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 6 Dec 2021 12:01:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 6 Dec 2021 12:01:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhIWe9IE3RhHcP2keh8WvFQIKqboSgEljH4zaPOlUJ/sk8qE5B0VQeV/f4SgIzZt+G3lvkzvvNrY5uTaLLiL/AspzP3DXOp/k1BW+FuIlsrlNLMjkLK43XoNg/Zw8gVeElRHXGnMwjZCl2qwcXwIVpM23097OUg0akblEFBlX7M80ueuxaPG/7j3y76yigtPzV6eOnjcBoX7mQHTN5zjS2sDW7MBF2gl7wgZORZrCBg6a1hP/Eq4WRqo8GkwjbU5QeAGxTz2jG9sae1qkaHltNcy8nawr/ScP1O4DdwpgrQmpLSYTqNYbtcsC2Xx11tWhKt/AfqbRO/MSctXqI02Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4oXfNFFT+/Nr/3EuF5AxLhCEzJbqOzXeAsp7zb/bgA=;
 b=mJcRXswNnRYukNLut3qHK9wvRcxd65ZQqvwaAbTW+NVT2U4yCqWQUMf2rJyYGB1wA+z74eFbOi7y61KN5onAI+/2zSQtf01oebl+EwIF3cEvbmPKAgIF7kxkvQ7Uf6AEG5UivG6GXjmPkk+nc7grZP8j0hFZUd+mHti53DRJUSRzNOAVdlBwshjKgWs+ufU15Q5hfhCTEkjrlPQIiz2yFLIjc0B14oYEVFTd7i6d3zA6idGC2d2O+0tL/AviL/r3CUG0IbuN2sIX1lcX0rjBc4p+wt7pNSaxkBKS40JaGx8YEVzPGTF7AqiKDS0eo1sH64slRdWkJZVc8VeIXx3FZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4oXfNFFT+/Nr/3EuF5AxLhCEzJbqOzXeAsp7zb/bgA=;
 b=F8yemkm1I6DWsTYdsXkpPMuhafwA6Nh0rPjiVYZHMVJEnMF5mLQmEnm4PEdwPdMtbpeYwZHAkrX6pgG2vbvpP6Y9y7tQYi/iVFMJWyP1qSrUgrnTalHEE+g+KRI2vEK62+XQKbkjHLxS7P16lQL6W0Aeg1+a8H5SlCMqQWzqpOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 20:01:06 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::d8b9:b1c1:dd29:82e7]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::d8b9:b1c1:dd29:82e7%8]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 20:01:06 +0000
Message-ID: <5169db1b-a97b-27fe-ed03-6fc986c98ea2@intel.com>
Date: Mon, 6 Dec 2021 12:01:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211111212000.2237-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211111212000.2237-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0191.namprd04.prod.outlook.com (2603:10b6:303:86::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 20:01:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b141c3-9061-4a83-66ee-08d9b8f32387
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB558008FCBA79A51B2FE8C1A3BD6D9@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AO8akf1AX8PTAbzAEyHgA6loP3jVEzxpRphhAeVgOfQQOrMDsr0hlhnImIRQCaQz4ZvYu0njnMlaMrMNuUyo1SPbS0ZtXTntwDnk3HD8yqOMRa/CdW6nhHTRFcYtV3EBAsek1Zz8jtsgGPgZ39b7kwUEgW6wiGzoouHeJOQp/iIaSEQpMhU/grqWHd2axp0Ku78FVep2NlyrRT3JX12zOsz7lAgGPKRQ9lpemeLFdx/jsnVV4lF3F+ZaOFh1Jl/Xs0QeAdirKswJGNqFGLvozji8LsokfpYx4o7vRPE1A7Tks6nZXLjnJVbgpspMsqHFJ16yokNFePBVlfn9ldC5VTRZrpL6KXmXR7bgx5DB7x1QNrVlDIikVE2SMWkJ48jrkYXTShaMmCbPGs07kGAIiEGSbhmubqOk5Ccl3FpSp2DTnt2BhX3B5KHyw3L2jOQg3IQzo2KnhVbz9E0aKy45Euobw2ZIx5QndALAxvjDm/n17/MyHuiOWZlRVxGTTaatwm8rvScu6C3i2IAdswsMys2AC8EshX945TmJ5ocFltEBm7fHa8Lw0LsS6S2IHxf3R2qEUmFoM93WfZK+KcQ3fRuHpOOrNWrQiKaiSktd3psK7ONaCWDZ7c+Fqude5JzNLApwLtOZyaCn+qHLKk+WA7DekLBeuaR4ZCY1W0YaRG/mpdKWJg9f+dLlAhKKkXsofADA7ZcHyMO5XlC6EcHBEv3B56cBGbpCnuF03oszLqFMZF3acwSij6B/GNS8CIl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(82960400001)(53546011)(186003)(8936002)(31686004)(2906002)(36756003)(26005)(316002)(956004)(2616005)(83380400001)(86362001)(38100700002)(8676002)(508600001)(16576012)(66476007)(31696002)(450100002)(66556008)(66946007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1pNHlLUHdkRVQ2Z05IblR0N3o3WlZNeHZDbytFcmdHQUw2SFZNcCttRStw?=
 =?utf-8?B?dDN4ZkJIVkNCaktmcGVra0VWd0pFTHpaRXlLRFFRMUsrUFExUGo0dmRQWnp3?=
 =?utf-8?B?UHd6TysvWWVFaE8rK2tiYWhMakErMjUrSjhPMDB2dUFCTEhYbDlBVW1yeUp5?=
 =?utf-8?B?QS9sNlUwc3gzWTFRWmN5NEd4ZjU4UkRXRlhrV1UwZ0hsMGVKMkFVY0dVRWpk?=
 =?utf-8?B?TzFLODZUZ3ZtUlBIL2w4R3FJV2NJY3dZL0tOMjAycmZnUlhkY2JwaS9WYlZT?=
 =?utf-8?B?VnNVNDRFZHJrU1ZVWXVaTDUyVGVGVkpJbmVqWEJ4SytVMHRZVk9MaFNTZVZQ?=
 =?utf-8?B?V0pzdUFsQlU3Q3h2Z3h1eksxc2hjWkFhNUFXK2xkOWVEM0lrUUQrcEdPbTE4?=
 =?utf-8?B?bGdGS1JqM0t5QXdLVzR1bVNmaFo2aFMzYWhXcDZIOUdlVlFwaVU4SlZ4cUVZ?=
 =?utf-8?B?MUVLTXA2SnJGUStiRW5qdE9zOXkzck5pSUhmanZDQkR0WS9VMTVkS0NLd2dw?=
 =?utf-8?B?aE5CZXhFck5aZk1pbGxuS05ZYjJZeEhxcUZCUFM5WXVhbHBWMGFxK2t6TEU2?=
 =?utf-8?B?anA3SDJjbzFtTzJZaU1KT2pRV1FYeDhLcGRoUW93b2VZbjFsVVZyT0JBZGRn?=
 =?utf-8?B?SWFnVFFNellZU1QxRVRjbUNlazArbVl6MDJFNVJTNU5oTHVDaWxmMHhScCtR?=
 =?utf-8?B?RDFOWEcyWmx1cUw0YzZNWXhYSzYxOExLbWlyRnoxZE1jMStvb2Y5UFlQcHBj?=
 =?utf-8?B?OU1ZVXZyRWhGY1VpMEtXZ1Rwc2ZrTlJEQ2FJUlpaak4zTWhHVlpHeUVwWjBt?=
 =?utf-8?B?SUdzamwwRkxJU0pjT2R0NkVzYzU1ZENEUW8zSUxUZW0vV0w3TStLZzU1eXZi?=
 =?utf-8?B?RythNTJsYyswcG9JT3hwdDBmcmRyOEJxY0VkME4zYWtWeWFyZER4YmdqZHJj?=
 =?utf-8?B?bDIzOEttS2cwdElVbEFiNG8wRnVKWU9hSnVCZHNIcFNPV2NYamxoNGVlTnFj?=
 =?utf-8?B?MnZwQ2d6Z3NrOENKTHRZNWlEckJtRHpRekZJYS9CemlpZXI2WXZuM3FoZjJU?=
 =?utf-8?B?NG1Lai9vWE5OeFRRMWxMNE1PbDl4LytDNjZuYTZXWU9JTmNQUDVoK0MyUHU0?=
 =?utf-8?B?N3B4VzFPZ2pIc0N2RDB1ejhsZjFzUXpCSmF2UDJ6UDNnbUpuWDFBS01Mb3lo?=
 =?utf-8?B?NUtZSGdaVWlPazI3L1ZXZjFIOENRS3BGNnM3ZUx1b1Vlcmo2TEJZSit4bHhs?=
 =?utf-8?B?NDdDQ3RFM0twT1lIZXFMN0YyQkEwczMwVSt5dm1VMG5MOUlHR1VYOVR4TWV2?=
 =?utf-8?B?eWtFbmdlMDA0d1JINEh4OFcvZTkrM1MvekI0TVVnYkppRlNTelR3dGd3eFZs?=
 =?utf-8?B?eHdDTngzRm15QzlMUEVCTTdHbjVOR1RzcDFpQm9vcnJPYUJRRlhjM0gxVlRM?=
 =?utf-8?B?L2tXaXVnMXA5cUZKcGlBNDJxb2Z5a2k2dlIwR21FRGFlOW5qaVE1OE0vSjNB?=
 =?utf-8?B?YnZpRDFCNkt4ckExMFNzWVB3L2xGczQ0NFkyZytNOEZpUTAxN3pYZ1Jldkdx?=
 =?utf-8?B?Mnk4QWdSR2dYU0NPTFJ0NWpVTE1wOGZONVBpSWxqS3VhMytJM3NWdXJYWjNh?=
 =?utf-8?B?dWYxeU9sK05yWHNCM2RZVzRpVUg2YnRRNWFPaldUVE5JTGpwS2NTOUV2aVV2?=
 =?utf-8?B?NHJZTjFRQ3AxNGtmSUJjUmJjd0dJelZ0MUZpdXpjcWNReS9GT3pnNWZhYk9a?=
 =?utf-8?B?RTNiYVg2UG9vbXFRRWJiNzhGWGVjaHFTcThXMzdybVZtWjVldUZXV1BDNElF?=
 =?utf-8?B?MG5tNU9sZUFxYXlUbEY2TlFyRnZWcDJhM2NIK1ZsbEUzNGNkTUx0cTdZdEJR?=
 =?utf-8?B?dmx6OHhrTkJkSmdzREpQUWxPeSs2SkNieERUaCsvUTJaQTlKOEpPeS83QitO?=
 =?utf-8?B?NUd4OUplaGhGOWlCenZDa3dlOW90czZ1dHJnL3NzOUdTa3BpRDgycUdoQkJi?=
 =?utf-8?B?dmNscW85SWs1MjBwT3NOMjRZUndYKzgybDI4YUg1Skk4aGdlSHlSV3ZnQnlN?=
 =?utf-8?B?M1NPYU1YcEJoR0crc242elBqcFpLanRsc0YzYjdVUlFJLy94WkJmbmczcklt?=
 =?utf-8?B?d2NOdXdBRXh1YjJwS2pYY1JWWlBMWVdXRk9PdEdsaXhDVk1CMFRpZ09Udm9N?=
 =?utf-8?B?UFF1Q3N2d3YzbGxEU1JzWXFUc21sbmtVYTg0T01reDRsVHNRZ01KQ2xqUGdD?=
 =?utf-8?Q?mq1raNuVJqfwgJBGxh7ZojlvycGrNKMWY7tUeIsPk4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b141c3-9061-4a83-66ee-08d9b8f32387
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 20:01:06.7154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8x1ecSaJpF3gOoKydekk861rGrRL6UqHPubroNNK15w71mVcduntyLMyQAPDUPxnpnXbFSQLbtfuIoM4YYHHmsIzOZCW/qIOFVQnHwuors=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On 11/11/2021 13:20, Matthew Brost wrote:
> A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
> execlists. Doing as little as possible to support this interface for
> execlists - basically just passing submit fences between each request
> generated and virtual engines are not allowed. This is on par with what
> is there for the existing (hopefully soon deprecated) bonding interface.
>
> We perma-pin these execlists contexts to align with GuC implementation.
>
> v2:
>   (John Harrison)
>    - Drop siblings array as num_siblings must be 1
> v3:
>   (John Harrison)
>    - Drop single submission
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++--
>   drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
>   .../drm/i915/gt/intel_execlists_submission.c  | 40 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
>   5 files changed, 50 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ebd775cb1661c..d7bf6c8f70b7b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	struct intel_engine_cs **siblings = NULL;
>   	intel_engine_mask_t prev_mask;
>   
> -	/* FIXME: This is NIY for execlists */
> -	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
> -		return -ENODEV;
> -
>   	if (get_user(slot, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -583,6 +579,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	if (get_user(num_siblings, &ext->num_siblings))
>   		return -EFAULT;
>   
> +	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
> +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
> +			num_siblings);
> +		return -EINVAL;
> +	}
> +
>   	if (slot >= set->num_engines) {
>   		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>   			slot, set->num_engines);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5634d14052bc9..1bec92e1d8e63 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
>   
>   	__i915_active_acquire(&ce->active);
>   
> -	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
> +	    intel_context_is_parallel(ce))
>   		return 0;
>   
>   	/* Preallocate tracking nodes */
> @@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>   	 * Callers responsibility to validate that this function is used
>   	 * correctly but we use GEM_BUG_ON here ensure that they do.
>   	 */
> -	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
>   	GEM_BUG_ON(intel_context_is_pinned(parent));
>   	GEM_BUG_ON(intel_context_is_child(parent));
>   	GEM_BUG_ON(intel_context_is_pinned(child));
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index ca03880fa7e49..5fd49ee47096d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2598,6 +2598,45 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>   				      current->comm);
>   }
>   
> +static struct intel_context *
> +execlists_create_parallel(struct intel_engine_cs **engines,
> +			  unsigned int num_siblings,
> +			  unsigned int width)
> +{
> +	struct intel_context *parent = NULL, *ce, *err;
> +	int i;
> +
> +	GEM_BUG_ON(num_siblings != 1);
> +
> +	for (i = 0; i < width; ++i) {
> +		ce = intel_context_create(engines[i]);
> +		if (!ce) {
> +			err = ERR_PTR(-ENOMEM);
intel_context_create already checks for null and returns -ENOMEM. This 
needs to check for IS_ERR(ce).

> +			goto unwind;
> +		}
> +
> +		if (i == 0)
> +			parent = ce;
> +		else
> +			intel_context_bind_parent_child(parent, ce);
> +	}
> +
> +	parent->parallel.fence_context = dma_fence_context_alloc(1);
> +
> +	intel_context_set_nopreempt(parent);
> +	for_each_child(parent, ce) {
> +		intel_context_set_nopreempt(ce);
> +		intel_context_set_single_submission(ce);
I thought the single submission thing wasn't wanted anymore?

> +	}
> +
> +	return parent;
> +
> +unwind:
> +	if (parent)
> +		intel_context_put(parent);
> +	return err;
> +}
> +
>   static const struct intel_context_ops execlists_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -2616,6 +2655,7 @@ static const struct intel_context_ops execlists_context_ops = {
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
>   
> +	.create_parallel = execlists_create_parallel,
>   	.create_virtual = execlists_create_virtual,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 56156cf18c413..70f4b309522d3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
>   
>   void lrc_unpin(struct intel_context *ce)
>   {
> +	if (unlikely(ce->parallel.last_rq))
> +		i915_request_put(ce->parallel.last_rq);
Should set this to null after to prevent the possibility of a double put?

John.

>   	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
>   		      ce->engine);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 5cc49c0b38897..cd1784953d679 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3235,8 +3235,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(!intel_context_is_parent(ce));
>   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
>   
> -	if (ce->parallel.last_rq)
> -		i915_request_put(ce->parallel.last_rq);
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
>   }

