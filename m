Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D16AD16F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 23:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640210E256;
	Mon,  6 Mar 2023 22:22:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33210E256;
 Mon,  6 Mar 2023 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678141331; x=1709677331;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rg6737ibACzPgwqKihQiMoIkkS6X01WRu0xrm23/pOQ=;
 b=jo9Yeb6r9dKQSl5vU052MMSCSJwWqR4mJoyHAaHzAQTpCDu04J2u44nh
 I4DsB6WiQJ/JebF0qjPEn+y8PdD9wd/OW77H7nwebNuS9uG/NVI5yPUbv
 mSikTWat7f44Krx6t2VibJCzbEqSRhbVaWOleij98pzPBiNFJEyK8fcGo
 wA9nX3yq8upq7nhFWfKEQSEGpRXuc1cK7kwtTcBXzWbrkZlDxccm7LLqD
 icC5tM/FLbAedtygYIIPn/I3SjdsZdMwjhC83dvenyNpb4H4RXWzuOocY
 GDyzorpppVPiPvEbuyVLswT1EapAaJQ6PMt+uhhXYDkuDeb2E0C5DUWAc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316092296"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316092296"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 14:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786439291"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="786439291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 14:22:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 14:22:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 14:22:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 14:22:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 14:22:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4JV8+5kEbLorN1ktvdh8W10YnNTzG9moU3CutyzonZhn0EQmDS1NocuimLE8KBI7GmZSzqdLjCRsvLPuHTOsiIZIpOWZLEiBIlo/d1qwlZNRQ5B7J0dLi2xxfby+KzCTL2tZRAPHE9k9hQCCmSSUZkHDYFk8XPgdl1VXU0IxTj0V+YtlSLIFhMQQQYHize2yEcP+eSkTghDUHqZr/uojOTc4rkIowgwQvULJVsCOEfzjfOR2ObaG0bG2qvsyb55vmJYhI2iouIA/nH2MxlwP36UKxyMvWoZYRidokhghOHMjREHfNMo5AkvHMTgq33c3Fyosja7+QdmQogZ7b12Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpgUz9zc6ZxZ0wQNIY7al4226vDF4mI1KPkbLfgbeWo=;
 b=ocnAsgEiMXe+3XVAb+UFWd9z0gamfdYga1H+Nnf/UxxSGMVM4Ee7ucftVPJPyuY/UMElEMhuN65xURV0Nk+xk9HXtcDID85lcyj3wGnnPh71Ibhe0FLaaAM/F3Ew1KSHAd7JuGL7ecNIsJJGgKSSsfIVzZ1ubgVTtWk2GyFOiodD2uB1g0h/AbqDI37/4xrenskGTsUjnvs347gwZfUm+bo2jV1yIIt1IrtIkFLgq3YADih0mxu0fD9cgw5F3Tiu+Yc9+CpziB62uuSUlaPW+Huv0//3ALxLjJz2wOEfcXR4M1c9eeOVs9p2jmwtdy1paUJbHI4yLktfjtPFbgwOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Mon, 6 Mar 2023 22:22:07 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 22:22:07 +0000
Message-ID: <66f2e0a6-27d5-1f10-de26-8c5bef471377@intel.com>
Date: Mon, 6 Mar 2023 14:22:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/guc: Fix missing return code
 checks in submission init
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230217223308.3449737-1-John.C.Harrison@Intel.com>
 <20230217223308.3449737-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230217223308.3449737-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a72c14-0e63-4b11-61cb-08db1e91384c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvIYNnC4RHjWZ1FybxKwe3sb3o1nfXtmyk3wKJyTwcyCwsn/wy/PrJdiYM8446aMciNTIxqs0X8GqquAh6fBxjPCy9MvGu+EfzhRiEy4qb6DX92onfbNnYHo4GbJq6S4IMHaNl9u4wKS6HAI5kEFlWj17D2Dd1xXxTsz0iC2OLn9sAXgdzq6l2uk6gHOPupVUiQqLqRH93ZJVv7HEmmL/w7FFzhmJHaFJVeps2tsOHJfyBzVTVAF0w/eC2G27uwy37trJm42GlPnC5djlkm5CMZTf9jerH/AJY9Gf8LPBOwF+bDgnDuGrZE0pD1cnnVj0dbOfMVVkdhYeRwgyACH6iqmaXQ5Nea5yjPBvyP97hy1KTA4I/nlzFvFvWjOfbfFPq81BDljbLoytghmXn6U5vF4WrZj28Qb/b9a6wU9U4pQ9pUAxVcvTzaBete+AP46WaqSIXoTYKc9SpaTPX510M7ZroO0jdUy8jO60rDKhV00osogQJ8KRX2pR9tXK1k70yI+yXGOlV2c6iJnLxMFB338P717j02S54kVv9BqYLc6NbhnKbys7kFTunfRcdcDFe1TSRy9dN19FzY4prXQfDiICftLDm5bkyvyPAv455ANIeUcFrn3KbIAgBbmifq6PDDfAGfEX4VW9oS7SLSw7u+r9CgCYIiyvaSciboxjRj9SuzpPTcwzYlgngQAtPQs8V6EITHCJeAj4e1HX0nGpd0iodhGnQsnR6QKkpC+fnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199018)(186003)(38100700002)(6666004)(8936002)(66946007)(8676002)(41300700001)(2906002)(5660300002)(4326008)(66476007)(450100002)(82960400001)(66556008)(478600001)(53546011)(2616005)(26005)(6512007)(6486002)(36756003)(316002)(86362001)(31696002)(83380400001)(31686004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDVrTXVOWHBkRjVGUndYK1Q2b1BKU1hKRXo2MnlBQ2xwMFNBOUJKcHFFNlZY?=
 =?utf-8?B?NlRpdDczZzQ4aFNqRFBnSHFHM3VBbkxSR3EvTlh1SUxPSjBKRXlhL3Z2by9H?=
 =?utf-8?B?aXkyUVo0L0FTeHRLSW13VjZzZFpNVEVSVktOcHVYbVYzTVEzNVJ1SWdrOWl2?=
 =?utf-8?B?RDlQY0IxWkVMTUFIUjNldzFIa3V5NlIvV1NDd1diYjRPeXgvTmw2YXNtTlZV?=
 =?utf-8?B?b1p6a2lxUTdSVDlFdnY0cjlORUlhOWdtWkgrMmk2UGtoaU4zb3lMYVNKZ2o1?=
 =?utf-8?B?Nko1SGF3dHJQbUJ6RHhBTWdSd3VhSDZqY21rUDdPTU1SQ3RXSXg0akg2Lzcy?=
 =?utf-8?B?N2RSN2FZaXN1UUhlWmx5RmxtRitQa3UzTDUzZ2pPZy9DdFNTYW5tR0NmQjNE?=
 =?utf-8?B?dktUMXZsMGdBQ1dUU2tFZzhkWFBuQmhERkJZVWVmYWRQSUtscUhOaklEZXBK?=
 =?utf-8?B?Nk9PVkxRdWlkaWFNV0NUSEltQmdnWWZlV0NVY0dNSU0rbVh4VTFHU1B1MHpx?=
 =?utf-8?B?Z0JvbTNuV2g1dWlPMVFkZ2RuWEIwSlVHQ1p3Slc4a2V0UStuVVlkN08xeGJh?=
 =?utf-8?B?SE80SXNsNzg2QkRRV3Izb3BnaEd6djl6KzBRTjh6amFXelZ5cTlnZy9UNC9G?=
 =?utf-8?B?TE0vTzVicSs3SXJYTVpQMXVlSU42WVkvVzhPRlA2b3lUVGEvMDRhKzFaRmxu?=
 =?utf-8?B?ZCtlMGxMTjNzRjY0L3BtcllNMUlBL1U0NlFXc28wcGQ0N0VkN05NSS85K3dS?=
 =?utf-8?B?Ry9lc0N2Z0daVWtxVEMvZ3RZYUJnMGdMTnFNekFTdnIrUzdRb0IvT0VWbWVj?=
 =?utf-8?B?NnlqWURGcnNlaUhWZGRCOVdrMlNhdnFOUCtna2tzcFBsSmVRYk1DelQzc0xj?=
 =?utf-8?B?d2NFWHlUM1ZLdlBXN093ZUlHdXJKbURSd210enY3Wi9sRUx5SkQxUkFMWEFo?=
 =?utf-8?B?UUlRWE94eEJqakd4T29GaW9DeHdYYkhma3FOZVJNS08yZnp0MzkrVkQvUkZJ?=
 =?utf-8?B?d2tGQmFrSy9ESlR6K3FsUUpvb3kwNUJLS2RhQk1Ha0g0SjFHaHVhYjF5a2xm?=
 =?utf-8?B?dTBmMHRHeWpoTW5tZHZFUUVhQTR0cm1WMFFDajM0d2JVMjR6VStUbFppSFcx?=
 =?utf-8?B?c3FKVks0aWRIN1IrQXJkTE1RejJUek5aSWx4alYvRGxBQzl5blpYZlhtT2FG?=
 =?utf-8?B?OWxwaGxQdGwvUjdhR1lNRXFLVHNiVG5QS0dHajhWY1FoSGJEbmlhbnlianhV?=
 =?utf-8?B?Zm5MdXQ0Tm1BaDlsRGk0QytaS3NSK3RuNVBQMkdqam1XSmFMSi8xNkFua3ZJ?=
 =?utf-8?B?c2NxdTdWOXVOSmpGVUdGNmVUQmpiL3lEdFNqcW5GUDlHUFlVc2ZLZEFmLzhi?=
 =?utf-8?B?aVJTeGEydytaVHlIOHI0bHRQdVhIWmo2Tll5WGl2Zi9KM1RPM1duSTFvZW5H?=
 =?utf-8?B?aE4vbzRSY0ZpazA5S005S0MzcWNOeGxzM1o5MEc1Wkl4SWx6VGVIUUVxYUtM?=
 =?utf-8?B?Z2NmZDlJalk3K3ZDOXhkUkV5dFZTNFZGY2g4K0VNNFBlSDcwOGdOYTcrTnlm?=
 =?utf-8?B?eFA3NXU5MEJBUHY0MVlULy9DWFZhY1VDczlxQVhFaGhZOVlwT1NtN3ZNUmhQ?=
 =?utf-8?B?LytOdWtYVTRWczh1MEU4TlZVRjdwYlJsWTlIV1JoNmtUVk1uMzhQOE5zOUVa?=
 =?utf-8?B?bFIxMU1qdlpCdGhRUVdFSlpEYzUzdmZIRnV4WlZNQXZFZFZIL1RIS0F5SE9N?=
 =?utf-8?B?WnJuancvaTdORmI1bEIrY1NJcGpBVU9kdjBsT3ZleXFyRDhPc1pUYklpTllu?=
 =?utf-8?B?VFVtemlXQVVvcjhWR21kVkdQSzlaT1RDWmc5WkhlU2NoeThKRnZSMWhsWUNh?=
 =?utf-8?B?T09URmxiQ0VwellrdVl1WDY2b0RNZTdHWWNlbDBYYXAxVnp5aHFtbEVsMjVz?=
 =?utf-8?B?N2IxQTl3VFZQY0dPVGVROFlQZEtGekp3ZlNCZTZ3ZEtFSTVGWUtUc3hZUTdU?=
 =?utf-8?B?LzdOZWZrSmhBUHpmZHZKb2Q0R05QTXZnL1FiNkZXWnVxaHBZR0g5VmZLVHpV?=
 =?utf-8?B?bGNPVU1FT3pwa1lYc2hNOXcvSVloTDhYck13Z2RRdVVnRmxJQU0yVjV4UTU5?=
 =?utf-8?B?a0FZQ3ZRNTNjZzV4Rm9OSzd4RUs1dlZFQWl1TE9CWXlhRmZKaGxUSHlXR2My?=
 =?utf-8?Q?um75B6FVjVBMYzuQX0ox6+E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a72c14-0e63-4b11-61cb-08db1e91384c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 22:22:07.0115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puzn7PM+PHplS8sGCWBG0Po74eAUpV8fN88Nsa/Qn3zAmBrV6wR7gsWehOTv9fbIGalx6wfgsupQHuF46qrsFJCqNW3cGQdHjYvLCK5k7Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
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



On 2/17/2023 2:33 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The CI results for the 'fast request' patch set (enables error return
> codes for fire-and-forget H2G messages) hit an issue with the KMD
> sending context submission requests on an invalid context. That was
> caused by a fault injection probe failing the context creation of a
> kernel context. However, there was no return code checking on any of
> the kernel context registration paths. So the driver kept going and
> tried to use the kernel context for the record defaults process.
>
> This would not cause any actual problems. The invalid requests would
> be rejected by GuC and ultimately the start up sequence would
> correctly wedge due to the context creation failure. But fixing the
> issue correctly rather ignoring it means we won't get CI complaining
> when the fast request patch lands and enables the extra error checking.
>
> So fix it by checking for errors and aborting as appropriate when
> creating kernel contexts. While at it, clean up some other submission
> init related failure cleanup paths. Also, rename guc_init_lrc_mapping
> to guc_init_submission as the former name hasn't been valid in a long
> time.
>
> v2: Add another wrapper to keep the flow balanced (Daniele)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 97 ++++++++++++++-----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
>   3 files changed, 80 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a04d7049a2c2f..88e881b100cf0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1441,7 +1441,7 @@ static int guc_action_enable_usage_stats(struct intel_guc *guc)
>   	return intel_guc_send(guc, action, ARRAY_SIZE(action));
>   }
>   
> -static void guc_init_engine_stats(struct intel_guc *guc)
> +static int guc_init_engine_stats(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> @@ -1454,6 +1454,13 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>   		guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
>   	else
>   		guc_enable_busyness_worker(guc);
> +
> +	return ret;
> +}
> +
> +static void guc_fini_engine_stats(struct intel_guc *guc)
> +{
> +	guc_cancel_busyness_worker(guc);
>   }
>   
>   void intel_guc_busyness_park(struct intel_gt *gt)
> @@ -4109,9 +4116,11 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
>   	engine->submit_request = guc_submit_request;
>   }
>   
> -static inline void guc_kernel_context_pin(struct intel_guc *guc,
> -					  struct intel_context *ce)
> +static inline int guc_kernel_context_pin(struct intel_guc *guc,
> +					 struct intel_context *ce)
>   {
> +	int ret;
> +
>   	/*
>   	 * Note: we purposefully do not check the returns below because
>   	 * the registration can only fail if a reset is just starting.
> @@ -4119,16 +4128,24 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
>   	 * isn't happening and even it did this code would be run again.
>   	 */
>   
> -	if (context_guc_id_invalid(ce))
> -		pin_guc_id(guc, ce);
> +	if (context_guc_id_invalid(ce)) {
> +		ret = pin_guc_id(guc, ce);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
>   		guc_context_init(ce);
>   
> -	try_context_registration(ce, true);
> +	ret = try_context_registration(ce, true);
> +	if (ret)
> +		unpin_guc_id(guc, ce);
> +
> +	return ret;
>   }
>   
> -static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> +static inline int guc_init_submission(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_engine_cs *engine;
> @@ -4155,9 +4172,17 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>   		struct intel_context *ce;
>   
>   		list_for_each_entry(ce, &engine->pinned_contexts_list,
> -				    pinned_contexts_link)
> -			guc_kernel_context_pin(guc, ce);
> +				    pinned_contexts_link) {
> +			int ret = guc_kernel_context_pin(guc, ce);
> +
> +			if (ret) {
> +				/* No point in trying to clean up as i915 will wedge on failure */
> +				return ret;
> +			}
> +		}
>   	}
> +
> +	return 0;
>   }
>   
>   static void guc_release(struct intel_engine_cs *engine)
> @@ -4400,31 +4425,57 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	return ret;
>   }
>   
> -void intel_guc_submission_enable(struct intel_guc *guc)
> +static void guc_route_semaphores(struct intel_guc *guc, bool to_guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> +	u32 val;
>   
> -	/* Enable and route to GuC */
> -	if (GRAPHICS_VER(gt->i915) >= 12)
> -		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
> -				   GUC_SEM_INTR_ROUTE_TO_GUC |
> -				   GUC_SEM_INTR_ENABLE_ALL);
> +	if (GRAPHICS_VER(gt->i915) < 12)
> +		return;
> +
> +	if (to_guc)
> +		val = GUC_SEM_INTR_ROUTE_TO_GUC | GUC_SEM_INTR_ENABLE_ALL;
> +	else
> +		val = 0;
> +
> +	intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, val);
> +}
> +
> +int intel_guc_submission_enable(struct intel_guc *guc)
> +{
> +	int ret;
> +
> +	/* Semaphore interrupt enable and route to GuC */
> +	guc_route_semaphores(guc, true);
> +
> +	ret = guc_init_submission(guc);
> +	if (ret)
> +		goto fail_sem;
> +
> +	ret = guc_init_engine_stats(guc);
> +	if (ret)
> +		goto fail_sem;
> +
> +	ret = guc_init_global_schedule_policy(guc);
> +	if (ret)
> +		goto fail_stats;
>   
> -	guc_init_lrc_mapping(guc);
> -	guc_init_engine_stats(guc);
> -	guc_init_global_schedule_policy(guc);
> +	return 0;
> +
> +fail_stats:
> +	guc_fini_engine_stats(guc);
> +fail_sem:
> +	guc_route_semaphores(guc, false);
> +	return ret;
>   }
>   
>   /* Note: By the time we're here, GuC may have already been reset */
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
> -	struct intel_gt *gt = guc_to_gt(guc);
> -
>   	guc_cancel_busyness_worker(guc);
>   
> -	/* Disable and route to host */
> -	if (GRAPHICS_VER(gt->i915) >= 12)
> -		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 0x0);
> +	/* Semaphore interrupt disable and route to host */
> +	guc_route_semaphores(guc, false);
>   }
>   
>   static bool __guc_submission_supported(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 5a95a9f0a8e31..c57b29cdb1a64 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -15,7 +15,7 @@ struct intel_engine_cs;
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc);
>   int intel_guc_submission_init(struct intel_guc *guc);
> -void intel_guc_submission_enable(struct intel_guc *guc);
> +int intel_guc_submission_enable(struct intel_guc *guc);
>   void intel_guc_submission_disable(struct intel_guc *guc);
>   void intel_guc_submission_fini(struct intel_guc *guc);
>   int intel_guc_preempt_work_create(struct intel_guc *guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 6648691bd6450..d42671dde53b3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -531,8 +531,11 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	else
>   		intel_huc_auth(huc);
>   
> -	if (intel_uc_uses_guc_submission(uc))
> -		intel_guc_submission_enable(guc);
> +	if (intel_uc_uses_guc_submission(uc)) {
> +		ret = intel_guc_submission_enable(guc);
> +		if (ret)
> +			goto err_log_capture;
> +	}
>   
>   	if (intel_uc_uses_guc_slpc(uc)) {
>   		ret = intel_guc_slpc_enable(&guc->slpc);

