Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC84C980B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 22:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A9A10E39B;
	Tue,  1 Mar 2022 21:56:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D589E10E38B;
 Tue,  1 Mar 2022 21:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646171812; x=1677707812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i/D3tai0Sd6z0TfEy1u/4/4eV7Fk3DH+K/4rN60mp1I=;
 b=U+nxfc3AH/gTFJBACjQ6QSJk1XeAPEOBB47ZTRbY6BIeH0lwS06wiFP8
 cw26vgQ6Zug23oR3i83B9Ag+ST623vGA6G5bDHhuAdnvJkVoqSj+k908e
 Aeg7G9aR+O7FdLOnXwWFFjdWCf856OxUHsQNYdjuRgewHIyWTeQBJ18gq
 K0qkE0ZkYn4YGZEW/jzHFZc+1AJE+98U3WWPHjqhET93iwjdPucehGLYU
 bq5Ow7ngSxIn7OPrAfXr53povMB0neUv2E4C1bH8VG0qKp5PM6uZrJdLS
 J6XClI1IYCpFoR8sxiS/0C5nDGvia4XiviG4wpxEI6t2AaifAV3nyHDbc Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233221341"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233221341"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="685885883"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2022 13:56:52 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 13:56:52 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 13:56:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 13:56:51 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 13:56:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxOvsvP9CilBOaw+FCA9htVi2wzQerhfF9zY4d+1wJlpmvmw0w7Eup6H/U4P1ZeE5R6+vg1uIdNgZBM+tkAMzKdnqJguNUNFH9h+2lFaQ3NxnW/JnKsX213HB/jZISpzIKwQP9QqwvxAeJjFulcacZAnEWkLAhhcbVXe/d7NdrjXe46XaOQLfY/8kkg/qnMhWNEe69L00t87/ZCCEAjnUzGLURyPgeZd+37CQlnfZA4CGtc0I3Wcv3v7b38/iJiu0GzoWYzAcLmOnhtXmRqawVb/zAYBa7FtSpR10I1JwwFo3o5dYiDLkD6QgMRwjIpvQe1oyRGKUz3ClyvjHGtxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo8PnErV//QjhcrBzUCko44FqDMYhVNVAGqntX7JBm0=;
 b=WbFKWR6ir1tMcotlcEGGtKSzXr9rNObmP8nAV90McfQukikiKppuXAj97pfKuI9Q+wzO5etJ84TS50iTLOhj7GEhVgcPbyxKiU2288i75ezjTK9O3L8eEQ0hjXwMPz9ThtIz9ss+u/gKRFBbeoz38MzG0ANzvoBGLr7aIZJUlF+18V4+7suAPB3LWIn9tVnxzAZsclerVPRbyyjBMvhPrEYY1mGvDDHdf1JfonmPNi+wnQPMAJ37Slk9vC+djXmORKs/8BvsKdD9UQn0VzHzNFY/RgtWEXySLLuOgMaal/LboWpgUihYfYmYDTdyvzS9vDd1w0Jb4ZBf+v2BFIANjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22; Tue, 1 Mar 2022 21:56:50 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 21:56:49 +0000
Message-ID: <71effe00-e13c-1f3c-741a-8fc6e4a73de5@intel.com>
Date: Tue, 1 Mar 2022 13:56:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/guc: Do not complain about stale
 reset notifications
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220225015232.1939497-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220225015232.1939497-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb1c39f-08ae-4b02-f888-08d9fbce633e
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB286409167815D20A9E8091B5F4029@SN6PR11MB2864.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kb02N9UoNSngWQnOziQ3+YGSFvSjnwzB6Qe7gl3Tdx+073EFCEUFmPf94mIauf21R/Pzkx8D5dz4kCkqt0FoxkespK2k0w3XHDj/qCa+dMiEGPS33NqQ6qSZcrD343Y9epUp6fj0MJa/YRxWu8EqPOCCwVc+6sA0P9xgAeD5vufqS8aga/1AQAE+0aq+8AO/eB9eUS49WEq660ClbHjSQEhTIfmawEWDD4/jZ1GNnTvyCHXf7mxNNz2pJ5EniftyHp7MKKZDLVur1G6blhi/yqIvx0/I6MBOIU6Z2G+n3LmJxGBhbF34b1d9ZVAtCDcRLgPoR2m6eWUw+4rBAvEV18ORxBCU7PmgrUE1CWxUJe74Ae3tVSKvUsSU+/LQdULseoojfmV23ZixqwUzAe93VHIpurrQIOfP9vFMl33rL4QyWo8tLgF0xTOanzVwdImn3ELOGMuBUGGG/XPp+4Yqtg1YdcItx93Ctv02K115sv79UyNT1opWmB/7JQHsHG24XRE9UzLqJUAQgzVMjlb59LED2Sx1zu05epNvPdSlkS8hSG+TZdS2QMbvXu8THGRklt2o9a+JURCLAILMLYKg3cxTmq01AVnhA2YObdSZ8FuoQOIqSbIvMDIXYRfL159OeUh6K8uQN9BaAsUpS0MkF4g87k1NF40C3zWc6DoAWYepf5xKVn41LCrIXi2JXARslzGJ5X7Iz2xB3rTYNEYOTr6Hv5epmHBUHP9iDO5bZomO+roeCYG0tiR47PZRLyGf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(6486002)(86362001)(2906002)(31696002)(508600001)(82960400001)(38100700002)(5660300002)(15650500001)(66946007)(186003)(66476007)(66556008)(83380400001)(8676002)(4326008)(450100002)(36756003)(26005)(31686004)(316002)(6512007)(53546011)(6506007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZFTnd5QkVkbjBubnhpc0hmSmt5VUptWHB0WDNNd1ZERjhRL1hHMFBsOGly?=
 =?utf-8?B?d1NRaFpldVRpVFJBYVVYd1h1U0ZtWjV0RzFlRG81UDhYZXI2OVFxNnhtakFM?=
 =?utf-8?B?MkNBY0NpNkRFK0NPb3Zhek5NclBMQ3g1eXJRWUFlV1JPM05QTThwdVRpUitU?=
 =?utf-8?B?MFZaOG0zcjhiRlJXeDBWUVVBMDZ4NHBTcWg3VTNqcWdTVnZzYS9ocTMvUzNZ?=
 =?utf-8?B?UWpVQnQ0WlNMTHAxMU1pMFlMNUlCdGtVWWFrR1FLN3oxRmErWDJleUtBMmJx?=
 =?utf-8?B?R3A0YURhSmNOdXMrOU45bGJYeThIdm9yUmVCSzZQc3BCMjV2elFZcUwrMXBJ?=
 =?utf-8?B?eGtoMmdXRlk2S0kwSS92eXBPUENZdTBYVi9nYXdEaEpnemdCWHBxY0Y2SUJn?=
 =?utf-8?B?OWx4ZVhGQTBGRlNIVUl5QjlPc3daRkdCTnB0bkFmRTV5SEZQRUNyOFpjU0JE?=
 =?utf-8?B?akFHOGZmRHNvNmdjMGltZ3lHSkNCY0ZWM1JobjdseVMxZjNEQzRQdnEwU2Jy?=
 =?utf-8?B?ZDlMT1hPR0JmRXhIOThqRFdSczBieVl1ZnBrTVBjUjVzR29mNzkvdHlieU5r?=
 =?utf-8?B?UEYrUnlmeU1ETnFYU1oyc1JVeml5Z3dsbDR1dWprblNRWFRSUUQxYlBOajV3?=
 =?utf-8?B?cU5ZVU1QenM3WWMzQmlaaFVqQzNFcUFCSVdyb1dkOG9HYlIwZVlZWHMyb1Z6?=
 =?utf-8?B?S2NmSUd0VFkwMHRlRHFHdm5PaVBsT1FvbkdLUnVKZEMyWmdIV2ZTSXpkVCtU?=
 =?utf-8?B?cEVUTFFzRWVPYkxuV1dTaDZkeFp6RXo4Z3ZNQVBlQmoxNGhDeUVRc1ZEeE5C?=
 =?utf-8?B?UjRnb2s4OG5aYUE5YUE4Mit2T25HaXdyY3MwMklxOFVDOWRaaXBwM2Zrb1FY?=
 =?utf-8?B?UkhHWitaR1ZteS9nb0pjNmtsZ3NlYmVSS1dybHpoWXVIaUdwLzR3V3JSdzJ6?=
 =?utf-8?B?RlJlaXhvMUd0SjlIOFBVeDJvSXRVVlZqQnNHQk9TeHNvenVjREVlMHdWclYv?=
 =?utf-8?B?bUF5OXVOZjdLNVdIdURjT2VKT2s3RHVndENUbDdrL3Erb2FHSU5aQThXZjMy?=
 =?utf-8?B?NTkrVHVhd282RVlkK2E0d2R2b2xRTFl4UTAyYUE4N3BnakxJcHRJdGlsQnpv?=
 =?utf-8?B?NTlKazFtWGcxM05ZZWQ3VUZFV2JveElzQ29vWGlJU2FjaXEwZXI0QkRuTVhS?=
 =?utf-8?B?Tk5sSnRYYlBLcy9hWkYzRC8rdy81OUsrWUJEbTBjeEc5QnJYWURQTVJucmZl?=
 =?utf-8?B?WVJ6aUwvNVlpcHoyUHRBZXJUU00vWElaUVlIVGM0dFRQT3NIN3lhM09uMGFa?=
 =?utf-8?B?V3NvbU4zQk91Z0xCVFkxUzV1eTVEelhhRTIvUWQ1U2pFaUtDMkJrbTROTTRl?=
 =?utf-8?B?NmdOdklLMXBZcy9oV1dhMlYrS3lQWnFlQ1NSeUV1RG5UbENqQzFUeFNPN1RW?=
 =?utf-8?B?SndSY3ZVWVc4d0M0cEZ2c0dLbWxlYk8zdDFnbm1IazhDeGJZeCtJVlU0N3hu?=
 =?utf-8?B?Y1lYUDBkdWV1Y0gxZ0hYSmd6QkVqQlpyNWNCSThqSXRjYm9Xc0daUTgzVmJs?=
 =?utf-8?B?aUIxVWF0emdIcVBnNE15bEVYTHg3T0NmYlRGYWFReXFaamN5c3ZPbjJWRW44?=
 =?utf-8?B?N2l0MjZwaEdvRDFlYTFNVG5xUHJmRHFENEVFWlpMTFFNak1idWQ2RmNNS3l3?=
 =?utf-8?B?R1lSZDRwTDJjRmY5VllycXlBemNNQ3RaNVJ0S0RRWU5wVDV1a2o5RVFta0tZ?=
 =?utf-8?B?Z2xMYnpvQW9XM3BQSDFHRkJmVjlxUGNwVHY3SklZTkxiRlE1VkQrTVgwMDVa?=
 =?utf-8?B?TnlJdlpZVmdUYjdrZVREVUVZUUc4OWFuOHI4bE5SZ1Y2Ty9Ob2tKQUp0LzQ1?=
 =?utf-8?B?cjJ2aUM3UkFzOFFRWWl0WHhBOGpKVHlRQ0hhcmluZE1xUGJoMVNtOWRWOXI2?=
 =?utf-8?B?Wkg2NjNJOXA2ODdScmRTSFZlMzZ0RHlFTitCMmdWRnpsQWFIbCtPRTBOZVB4?=
 =?utf-8?B?d2pmWkwwZk9aMUx4WjU1RkJmZENzK3M2RkV4MnpFeUVkaXhZNXY3YWRLMitt?=
 =?utf-8?B?VFkvbFRDT0ZiV0VmRGtveXR4Ry9ienRGK1RxdTFnMFoxd21YeUlBb2p3Vnla?=
 =?utf-8?B?VHkrcXBpMVgwYWNjUWgyaytSQ1pmcXY4M0cvVGF6aHBHeVA3TkhaNEw3RmdY?=
 =?utf-8?B?NjhuSlpzZktCZldLNU9iODFoQmtYeFVPcEVTRlhia3VsQW8xQm9QQS9jSC9S?=
 =?utf-8?B?TjI5bG1takI0RkQrTVp4TVJubkxRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb1c39f-08ae-4b02-f888-08d9fbce633e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 21:56:49.8587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qjr77/TjdGSuUlg5GM4i0nXoq3P3VbOpWEjXNs5dCSihFZ9f1a3SPA2JDUCSviw5T3vxmVpLgTM6ED2Qf1RyXZMdrCP624zpYk/1+qLETw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2864
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



On 2/24/2022 5:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It is possible for reset notifications to arrive for a context that is
> in the process of being banned. So don't flag these as an error, just
> report it as informational (because it is still useful to know that
> resets are happening even if they are being ignored).
>
> v2: Better wording for the message (review feedback from Tvrtko).
> v3: Fix rebase issue (review feedback from Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..d39d74d39794 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4022,10 +4022,9 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	} else {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
> -			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
> -			context_blocked(ce));
> +		drm_info(&guc_to_gt(guc)->i915->drm,
> +			 "Ignoring context reset notification of banned context 0x%04X on %s",
> +			 ce->guc_id.id, ce->engine->name);
>   	}
>   }
>   

