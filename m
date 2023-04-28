Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31886F10B2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 05:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0F10E280;
	Fri, 28 Apr 2023 03:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461BF10E00B;
 Fri, 28 Apr 2023 03:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682651508; x=1714187508;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X1CUBJU1UhLIwWTifb2THxOyoBKMYp2dHMZ1sUM/uWY=;
 b=HE9IfNNYZPXRlmdaB5GViaIzlCho4eoZFmk926Ak2VQLqbI/LpeCUrtC
 0vCCwZ4kGKcr5/LPcDUGFc1SJdfB/IdbDiJbwijinmta+JdOkJ8DBnoOs
 94aW8bJb4EoiRjCg147Tvbyu94+QlIUWqOkgUYVXVJg/WDrUjv+DuvWJP
 q42Nys8XVrdbjrJbH3lt+1KpVzlHfbSSMSUToPnKS/V4wXPoTPaFVEvE3
 gN0KzZwJpf6jvIg+570LTCIGTzQW1BjkUR9K6loe3VelR3EiDefCsCYXr
 vxDFwxe9c4IUHJLCt+GOIY8LlDp3dQ2eN+PXKNy/7CigFA9NzV/69QLMM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346392177"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346392177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 20:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="784016208"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="784016208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2023 20:11:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 20:11:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 20:11:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 20:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdRCMJC4aGtfxoismGL8fBB56XakFz8WyhzWIpDBh0TTlVFSAKl2vgocoK5NJ3sgyI+0k0wD7BwaH8WxKtyrw6s6Z2kNlwbAp49KZhFLws8BOzqfKyZxwdk3C1gz+R3DeNDpVZtFzbF+Bn/o6dAG1gG7hfeb6j3dA1lFe8PRpEypGlXYtgw6YWRhuW1TR75YJk6dMLNdN1yNnKUp+hvJ2qTrbmPQl7Woe4h6qRX8E8z6YSUtPyaPqovTYAy52XkPXvJTf0LzsBumFHHQ4e1hxWOdVuitaJQToC86lPZi+VV5mcu02yhvo0ISgjhkJ0BWgqNOwMHQobw3liFzNQtHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDO2Hz6JragPJLV5Kp59A61Nsnt2LkBd2AMMo8WCLCk=;
 b=Vslk3492TlpxkH9XISCHsxAWz1YGKwzwmssn2j1wbDBd9FsKEMee+beqIl62TrRBCTvXg6GfdgskMiVm35g+15wC2jKai170Ltye6YblIW82KSKOemAWsdQnVMm800z2hD1/dfKpK6WhsHtnep2vusjQ1jUv8WWMcC6zKYX3yddjIdRfdXrOJ4Tmu49qN2WksuLkRfML1Qc7rjjmGwUuko3GlMtheTyeU1UDXyVME9q0pFc0wbxY+FeZcyToiPx30gff2FUkII+SVLubqAf19B7/cQLLIkCtZLFsTV+RgzIJ+UEP1niyDRv3YRDSWywP3ttux9pTW2izXWmYTO2vLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 03:11:24 +0000
Received: from SN7PR11MB6727.namprd11.prod.outlook.com
 ([fe80::1cce:ecb2:612f:67e9]) by SN7PR11MB6727.namprd11.prod.outlook.com
 ([fe80::1cce:ecb2:612f:67e9%5]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 03:11:23 +0000
Message-ID: <9215760a-dbc4-16e1-6856-e9966992a231@intel.com>
Date: Thu, 27 Apr 2023 20:11:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: "Ye, Tony" <tony.ye@intel.com>
Subject: Re: [PATCH 0/8] drm/i915: HuC loading and authentication for MTL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
In-Reply-To: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To SN7PR11MB6727.namprd11.prod.outlook.com
 (2603:10b6:806:265::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6727:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d50fcdd-0fdc-4763-9073-08db47963f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3MpusrJaODl6H0iPQjq5xEs2/wTWLz7R7rpMpdSLm/3GB0raMHNG0KSgunFkuI1/hNb0YSPUuVpjtk1TWaYjBQTIkr43L/OZpEkl8YqndylFH64IiMjjIkNPx7rpvBrdpJLIwnyRKHu/jKXZuw794ckxOiqgSBPu/KtFZztuv5p+nvNWwJA2fOQh0jHFIpzHWfmcNfkDFa+Mx6NJHHveU7gUvAoDw4Uuln0f5MyXlXbP5AXulwX89jgL9UcbFjhLAzkNxJ6HXJgWV42KbDO82c1IynSuJ3vfBywfpWUPc0sDpSZD8oFVv9QAt3gi9YuIC2smaBvPY4G+foncNG7p+SdLPBR3Wb3VZg0kneM5FJbq5R7jiDAKue30aC+KSq5pc7DIoWlHBi7jz6XqhlgDwV75nSsKwKRo9nPm4U7llHHigXTWzG85Jba4juMh+eT4sCWSrRLpvFLm7TBAERze+n/j2oz1CSLSBEcLJxsIwEp2oKp1LPgeokrXT1YHyEjXKxJTzXyuGjig00zY5k+DN86THH/58QfwboUOAmZo0x6wVmb20C5aH36UOenDAt0X/Gyb9U+eDfnCmeykX3FRLAk/D/fYtaepjh8WUchPpQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6727.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(83380400001)(31686004)(2616005)(186003)(26005)(6512007)(6506007)(53546011)(82960400001)(86362001)(316002)(31696002)(66556008)(66946007)(4326008)(2906002)(38100700002)(107886003)(450100002)(66476007)(41300700001)(478600001)(54906003)(8936002)(5660300002)(6486002)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJiMEo1V3VQN21IcVRQSml2TWl0UmRILzJhdzRLSVBoYytJVDVvYUZSTmVZ?=
 =?utf-8?B?SjM4ZjJhdGdtT0piSkRBNnBEbzNZK2xSenVBTm00QU9vMTV0UjFMWHFUVTlq?=
 =?utf-8?B?TVpDQXdWNW9YZTVPRjhEb0R0YXpJdXlXeXd0emNBT1YxZDJKVmEraTl3bTFh?=
 =?utf-8?B?b0hRTVFjOGJKRHVmYzZHTmloMzMzMVZXYWx3VlYwMFlRdVdDeUJqTWwrZnlr?=
 =?utf-8?B?ZytSdGY0SHBEazRXWVNReVVPWU44VSs4dWFHUUovcGl3VmRiS1ZQMCtoZ2ZW?=
 =?utf-8?B?aFplSG4yZFJxOWtrRFYzVnpZazlPQjl2ekphTzNwRkxpR2VCT2MvRFkwRmhE?=
 =?utf-8?B?NTlSU3BSclQ0Rk9lR1JYOFgwZ2YwNmx0WWVqaDlYUFpiZjhmWDdYajl3TGNH?=
 =?utf-8?B?VVNCVE96MGRjVW1lRjV2UUZUcGtGUnFsQnNET2hGa1dQaTJrem5ENS9rbUxW?=
 =?utf-8?B?NGRlNGM5RWxvQnRZUDBwZjZvV1VZMnV2di8yWmJmSFdiNFFwRjFiQy93TS9U?=
 =?utf-8?B?RVR6QStQVGJDL2lxL2Z2MlU0T1k5Um95V0RBenVuVVo5ZDZRdkNjSzBramVL?=
 =?utf-8?B?cVNLdml1M0EzS3o0OG1ZMHVzaVdrMVhSQ01DM3paeWk3RzVteWJPeGx0WG5y?=
 =?utf-8?B?ZVk1MWEyeGhQNjRnb0RCRDZ0YkYrY0JidFlpTDlaZzBQNXJEQytzSTVJN3Ja?=
 =?utf-8?B?dnhNM2JVWmRNRHBUZGdsdWVqRi9VUDNLWEh6eVBKWXJaeitxQW9PVE85eVdE?=
 =?utf-8?B?cCtLczdBMlVzTHpHTmYzeVB1bHlRS1FXTW5PVE9zazZySkdKdllzVnBnaUEz?=
 =?utf-8?B?WUpYSkk3WWdkcWpIZTBIaDNNSFFPaVloMmd4VUxLVDNzWlhpdHNOc0U3WEtj?=
 =?utf-8?B?M2duM0w1N3U1RFBnSDl0eVpvVTJvVjZCaXNFN3JGeWdDK0Yva1dsNE0vUzAx?=
 =?utf-8?B?VUwwb3dBNDQxeDJsZmJKNm1PSExvZHBFWGlkdDU2eVdQWXB6ZkFkdXpmZjdJ?=
 =?utf-8?B?QnpzQ2Rtc3AxbWs5V0xpTmlNc0RQMjVrVU1JM1llbkExQkFmRmo0Q3NuVW0v?=
 =?utf-8?B?czJpY2drclkxUk8rUUNkVm11eXM4aFBmK0xsV0xYVGxTZG1OemZLTDZRcGli?=
 =?utf-8?B?SGlZV2hFaEpNdE56VHN0a1BpRnJvZ1NMTndzdmpxYVE0T2FYeitXalVDd1dR?=
 =?utf-8?B?Z2tqTWVYZVBWQkdPdlZXV0x4b3ZDMC84cmlURWQ4ejh0VFgvajZJaW5MRjFj?=
 =?utf-8?B?SHJ0Wkw3RWkrVjNidWxUZlh4eWllMm5ndVdkZmkrUzRySFZlVlFpYmpyenJv?=
 =?utf-8?B?YUNGYUhodkYrQTJna0d5UEptRnB2dWN5UFlyVXRqU3pzUDJ0THEweWJPdWxU?=
 =?utf-8?B?bUd4aDQwT3U5UTFVN25tcTdrZS9Kamk2V1F6QmtoOXB5ZlpCQTVkeEQ3cEF4?=
 =?utf-8?B?Qkh2bW1CeTV4VHdVMU9hTVVMSEJkYk9CcFVENjdUUDFwckVVbHk3eDFSWFNy?=
 =?utf-8?B?R3dpR3VaMGpob3pwQk81NFpCR1IyWkZDcDB6MHZzRG5lZ1VzMGdaQlJLYkVP?=
 =?utf-8?B?UFlDTElTQTkxc1R1R1pYNTUvTnhYcVYyUk9TUk0xTEtoMm9XZ2pTK3dZMDJM?=
 =?utf-8?B?VGo0YWp3ZVI0d0xQekpBWnNKRjdsNlRib01Jd3pnQWpERG9MNWZCNU02WHNP?=
 =?utf-8?B?TXFZUXhPa3d0ejg1QlFReVFVbnpvZ1RnQTJDWFJ3ZW9yc2xTcDBlRjNjRzBo?=
 =?utf-8?B?MlNUak5YMCtlTlViTStHTlV5Sk1UN09XMUFYT1d1bEhPNkhNL1Rxd3diNFhV?=
 =?utf-8?B?R0JhTjRiRlB2bWgwRk9XQVpMVFhzc1E2VEtYSWkwMDk3bkhwQ3J0V0dIYU80?=
 =?utf-8?B?bEVOT0pRRUJIZWNFelVqVS9HZEV3Mk4raHRyK0JQN0dBOGdReXZKcUc1d3Rz?=
 =?utf-8?B?R0JxUVhwblhMZmZpaDRISE04T3dRYTRqQ2ZVRHpES3VpamhBSnJSVWhWanpO?=
 =?utf-8?B?azhUOGh6WjV1NkZaOGhrTHlRQUZRbS9rQ0VBa2N1VjExb0hZd1NHUDU2Mjl3?=
 =?utf-8?B?YkZoWjRta1FHeHBUMWkzRE56Yjc3NC9lR3p1bGlmb2dobVlGVnNTYzV1dDJK?=
 =?utf-8?Q?sRVMZ7VbDEBmcxenjLGQt9lRA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d50fcdd-0fdc-4763-9073-08db47963f12
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6727.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 03:11:23.4237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYE9myCRHo4Q/XD5S2Rmhj6e5FiGESku8PL96gnFc0KWYAuBxpVZKE9FGLIxM5wrLsUuE5+Dk6mC3d6bNv1FMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, "Zhang, Carl" <carl.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Tony Ye <tony.ye@intel.com>

Thanks,

Tony

On 4/27/2023 7:34 PM, Daniele Ceraolo Spurio wrote:
> The HuC loading and authentication flow is once again changing and a new
> "clear-media only" authentication step is introduced. The flow is as
> follows:
>
> 1) The HuC is loaded via DMA - same as all non-GSC HuC binaries.
>
> 2) The HuC is authenticated by the GuC - this is the same step as
> performed for all non-GSC HuC binaries and re-uses the same code, but
> it is now resulting in a partial authentication that only allows
> clear-media workloads.
>
> 3) The HuC is fully authenticated for all workloads by the GSC - this
> is done via a new PXP command, submitted via the GSCCS.
>
> The advantage of this new flow is that we can start processing
> clear-media workloads without having to wait for the GSC to be ready,
> which can take several seconds.
>
> As part of this change, the HuC status getparam has been updated with a
> new value to indicate a partial authentication. Note tha the media
> driver is checking for value > 0 for clear media workloads, so no
> changes are required in userspace for that to work.
>
> The SW proxy series [1] has been included, squashed in a single patch,
> as some of some of the patches in this series depend on it. This is not
> a functional dependencies, the patches just touch the same code; the
> proxy patches are planned to be merged first, so it is easier to base
> the new patches on top of it to avoid having to rebase them later.
>
> [1]https://patchwork.freedesktop.org/series/115806/
> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
> Cc: Tony Ye<tony.ye@intel.com>
>
> Daniele Ceraolo Spurio (8):
>    DO NOT REVIEW: drm/i915: Add support for MTL GSC SW Proxy
>    drm/i915/uc: perma-pin firmwares
>    drm/i915/huc: Parse the GSC-enabled HuC binary
>    drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the fuse says so
>    drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
>    drm/i915/mtl/huc: auth HuC via GSC
>    drm/i915/mtl/huc: Use the media gt for the HuC getparam
>    drm/i915/huc: define HuC FW version for MTL
>
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  22 +-
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
>   .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 +++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  | 424 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h  |  18 +
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  89 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  17 +-
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |   2 +-
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 182 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  26 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 214 ++++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   6 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   2 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 120 ++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   9 +-
>   drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
>   drivers/gpu/drm/i915/i915_reg.h               |   3 +
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  14 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |   2 +-
>   drivers/misc/mei/Kconfig                      |   2 +-
>   drivers/misc/mei/Makefile                     |   1 +
>   drivers/misc/mei/gsc_proxy/Kconfig            |  14 +
>   drivers/misc/mei/gsc_proxy/Makefile           |   7 +
>   drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c    | 208 +++++++++
>   include/drm/i915_component.h                  |   3 +-
>   include/drm/i915_gsc_proxy_mei_interface.h    |  53 +++
>   include/uapi/drm/i915_drm.h                   |   3 +-
>   33 files changed, 1428 insertions(+), 134 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>   create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
>   create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
>   create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
>   create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h
>
