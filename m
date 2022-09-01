Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACC5AA3D2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 01:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939A710E3A8;
	Thu,  1 Sep 2022 23:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE6110E39C;
 Thu,  1 Sep 2022 23:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662075559; x=1693611559;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=edvOG0rHvq3yObskg8KBz8MEGvePwi3s+p0rr3KfXOg=;
 b=gm+WBP/aR9WJktuMV1vB/P6XKz72IOwdhDkXoNR4JOPuXoAEEW5oXa54
 WqMnzhkoCRJQCr8n4ft88NziFLlLDxOMI4Ta94cG+9mFcUJbaIMC/hUOq
 KaK9OAcAo/JEx3afxuaid849Fa/GxO4vwDqSlW57OQOouxlEoudS3LFzd
 9eArOk3PJiB3vyfivkdu65A0k9+0LJPzmsf0QW9kGOMRgyFN58iRYVn4m
 kFlXedhBUllwvNxN5Y6fvB8w3VTuPyk6y5uDRZ5C5MbZ470Z8BrTrJTko
 Tm+JkVIWuh5NHgN4Dq+CGGcxW5LLIMGp099cn2Y1wZZy2maCp9mj3RdlU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="294593589"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="294593589"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 16:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642603617"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 16:39:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 16:39:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 16:39:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 16:39:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 16:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPlJeeRrXan2qiv5rL1K/TQEJdcduDpO5e2RU15SrCyZAFX4c9NF6Ra0d6CXVxf8kCLgKP9yOm+qzB/ok67G9wsxSWbJtXa3Bkj1Gt0zR5zMfcwLBIAkhmd53KlE37yG3mp+A2q/5l+jfcLCkf4f6UtFIPRQru8hA5mSWgjZWWbggggRO+SNI14132T0ehHg0jycXYNo2ruhlnzLR4GTGj+2sh+ohxk2qnAwrg2ony5kT/WvXHBDKDtWzG5uA2n8kZjAIFGxrJARbr53LBjYkzMqu43eQjV6xdbzrYwPbzbbBzXYdXmlIuPbcAspZB/AJqqqk6MMPB35mZSWgWrtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hto+tNhXG+Kc+KidJOpxRRdRxi1GNKfX5QpzCgo57lU=;
 b=VLp8hgMbimPbgw+BzeZbIJGzUJ+Zqs8cSSZAA5G5oV1gohbUtz/R83/oXl3J0aFfquRDAH9iz4mFWO34tocZGX+4OMHmZGc9qtJEnDOXjO/BvmRj2jMffnkAcLS8dNt4rYpoP2Wi4q7NI5A6OgP8WFjBiYCqp4OC3MbmIigOfaMWDDfysGznSeVOaXEfl5YAgK1jtomn9jzal9JCiXljCuiESAXOWKA6yZny3NKey+KAMahPWsWdQjpIoC6q8zNKYUBef9q9u8bxKYOU0uGsKitgHjKlAyQYpEBu8N1qS6Ev9nxQCvnKGC6BXLy9z6Vp6Qevbv83PDYeh7EBtaIVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN8PR11MB3779.namprd11.prod.outlook.com (2603:10b6:408:8a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Thu, 1 Sep 2022 23:39:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 23:39:14 +0000
Message-ID: <bc684f38-cab7-240b-4717-a523255efe90@intel.com>
Date: Thu, 1 Sep 2022 16:39:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/8] drm/i915/mtl: Use primary GT's irq lock for media GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-8-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220829170238.969875-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::19) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc67ebd-9274-492d-9da6-08da8c732d90
X-MS-TrafficTypeDiagnostic: BN8PR11MB3779:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SfhZpclQuMUFxatCkc1Fu21ELsXpYzCf3WAQWzfpKx2+QA451r9CHlefcq7xMpBhYOCLv0CC6d92IUnwAPXvWvjMABGbQcGqrLix+NhxrzGz0txlaS+HIH7RXbyKVvII5Ny0AmrOigxfnPri86QFruZLqldHcN9IMSBgdNRpuVP259xpR8T2OZ9hoPQMvJ0JJcgjQjv/ltgtFdKK55RyyJqT/Vjx16iRGgnD5Bgw+VDH32cIQ+DZJJShkz5H6qT8uiX7f5USZ/LFGo6eztG/39Zv4BSNlGQCwK4pqPFf4pERB+6NzjjJ9njhrCKoykSkQEANXpjxX0bP6f9vgFpOUn4eXFd1OZqdStGX/oWThOVlodwVUkoMt1aNgiyzPMCjz/7nCjqnqTOj6EYIx26dSrYLR4GPxc2URxLBiIp2UeiF1S+5KwBS4UnAlZZ5OlLjIxaC2+jl0r9bkpi6fGrBqUtv8C8IoSKoyOg3/lV6C3+KMMHvLqUCFZfi5VgFauf8iTyJO6WyLsa21J77bnrKreqeAyj7/Ty4eJ/WNcsRdK11U5kP5pnX4+UbFZyw4zAVIx1RaO3xw8RMLbRzIzyWyKSBn4F4v8nqrMcfNwwNhCjDFSCypEDeVilnrZexXjXz00ea35mlkgRyRreqxUbzLEdGqsBaCC9/9qXxBbJoISNX1XCVQjv0Ey9oATk7oNlFgvKmSisi2JRdk9Tb0zNOE0t+89V4bI6d/9I18I/JxuDeqTkoFwvxw/3aXjPst6ZbRavS0WmPgwBpR4K20RLpRxTmvZORmqdLlxAnDOsTKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(376002)(396003)(39860400002)(346002)(6486002)(6666004)(6512007)(30864003)(6506007)(53546011)(107886003)(26005)(186003)(41300700001)(478600001)(83380400001)(316002)(8936002)(5660300002)(66476007)(2906002)(2616005)(8676002)(66946007)(82960400001)(4326008)(66556008)(450100002)(36756003)(86362001)(38100700002)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFBeVlIb1RQQVM3aGpPMnRUZFhZcFZwUUlucFJpVkJtcDJqRnNRc3RWV3lZ?=
 =?utf-8?B?UkgyWnhPbUswYXl3ZkUrLy9wbW5VSW5pYlJDbmJHOHFGMFFRSjA1RUI2RjI3?=
 =?utf-8?B?KzlVd2hET0QzY2NaRGpZU0FteDVVSFJlSkQxZzMwblpyMi9zblBqR1RLVHlE?=
 =?utf-8?B?aUdIRDdYblRTNi84bXBxL2Nua3Z0M1BYakNuMUxjTjFJZnV4MitRL25wWldV?=
 =?utf-8?B?SlEvQkh6MDJXK051dk16YnUwa1hwdTIxUWtoQU5nVUVIQzBUVjRaUTE4K1I1?=
 =?utf-8?B?K3BMNmFyUHpuR2J0V3dxLzVoeW1oL2pvZHV6ay9ZR2puQWh6R0lVbytVdi9a?=
 =?utf-8?B?UjVqdm84V0tVQ0x6ejZ5Z2NFS3ByRnNUOHJjOGU4TW5hVThiVi9Md0dFeW43?=
 =?utf-8?B?aXM2K1RNTHViR1hXTkRBRWUyVENQRGdVK1lEUWIrcmljSXE2aGhjWDRoSFpW?=
 =?utf-8?B?Tk1CTkVuZ0ZPNmtFbVBzYjJLeXQ5cHEwSXdoUEtjSThoMndLbkJrU0JNVkR2?=
 =?utf-8?B?eEJ5Y2s0WDE1SmJ3WkM4U2N4Mkw2MkRZTjJIRHE0Ull3eEpBb3NSQ2ZCczJ2?=
 =?utf-8?B?TVIzWHN4RUo5MGJmeUY2UythKzVDV2VRRTJUSE5nempRZVFPaWZPNkhEK2hm?=
 =?utf-8?B?OFZmUUxqMUpmUk05MEFaVFJKY2cvRG9NcmpjQk9ieTZRaU5Bb29GZmNCVFJv?=
 =?utf-8?B?Z2FYRmtmS096YW42aFUya01iTjB6UmZIQ002d2MwYVZnNXlPOXFIcFlBaDc3?=
 =?utf-8?B?N0pQUFREQ3BIQjNkam1xK3dVcmx3UTd2Z1cxRGJHcW9XUm0rM2hTYkt4VklG?=
 =?utf-8?B?LzJzclo1RVZHQmdaVzFkaE5nNG5ONC92VGx4dGpkUzFjVmo2amZROVdXY2ww?=
 =?utf-8?B?YU5mMmdaUDJzQTZ5YVhFdGE3V2d0NDBLSW8wTHI4clN6TUgrd2ZQR2s2bXp6?=
 =?utf-8?B?eDZRMGoyQVR1NEVRN1RodEc5UEl2VFFqTHFkZjVndTRXby82eEhwTC85d2VY?=
 =?utf-8?B?bVRvZXNJd3cxQXBGcWVGRGxmb0pweWV3OC9SMTU3anVldmYzZThnWjdsVnZW?=
 =?utf-8?B?RStxSE4zNDhIdUNEcWFqWEgzVUg4YWtzdnIyUENEdXlGczhaM0MvMEtyM3Nu?=
 =?utf-8?B?aHYrQWNPNEdka2Joc2MweTExYkZkSkdLRWJKNURFTTRYZnhMcWNFY1VlM3o1?=
 =?utf-8?B?YklHamhXakc0ZWpJOFN4YklsKzBWZm5rVEdDaXlYb3h3T09DcEEzdVN1Ylht?=
 =?utf-8?B?OVc2ZjNhTWhqQVN2NHczaDR0ZEFPWnk3N0phTWtzQm1ZS2ZzU2lZNnJCdW5R?=
 =?utf-8?B?TVdXekhnWk9mV0EvVkdZYjRGK1dzbTFZcktreVVPMHRBRnZ5dktsK3czNGhG?=
 =?utf-8?B?YVY1UnE5TUZRK1pGUUh4TytGQ1JLR29yZWYxNzFJdXdERUNKM092S2EvVnU3?=
 =?utf-8?B?a0xlUmwzREdZaDZ4MVhnOEgzZmR4M3RUcWhOUzJGR2NXTkxyUC9HVjhybkZ4?=
 =?utf-8?B?ODByRmpwbFQvdDFmU3MxSlBjS0l1T0JXOTlQWHFIazU0RE1pejdNK3gvcTdt?=
 =?utf-8?B?ZkxHd3RBSHhNZW1jMTdza3F2Yk5mWVBJQi9xY1d5Y3F6ZE1vQVBRaXVmZHhC?=
 =?utf-8?B?YXlOTmpuQ3NscmxlZEpBZnhmSFo2SWRlQTkvOW1TVklERDFCVGdTeHUzOGlE?=
 =?utf-8?B?Rk5EblZZckwzMjk2TW15bTA3a2NicEQ3bENqL01PTVJ0eGYzS0hpTmNKUVZn?=
 =?utf-8?B?Vk1iVmNmcENsREVyYXM4bzdhUnlFZVNCcU9PSFBXeDAweWFnKzByRUJZZUVa?=
 =?utf-8?B?MkZqckNhWElRVTlRK0EvdEo2L2dsb2RCZGdQZHRUQ0FGZjVsZ0o4RzNaTWt2?=
 =?utf-8?B?eS9QUE50TnorU1dOU3g5eGhNZVh1RVlhemlheWRGZHdFK1NwQ3BSUDd3MlFX?=
 =?utf-8?B?Rm1ja09Ta2grelh4UmRUK25neDlJdmNiSFllMzVmUHhabFR1R1pxaE15K0ZS?=
 =?utf-8?B?b2hNMDk3NUJaQVB4dE1RdSsyR1F3UWRieUR0NVZRazcvRzB2cXd0allzNk9m?=
 =?utf-8?B?V3lnN2E2WEZJSmZBbE9kaUJOZ2pOOFZwcXFabkhldVdQam1iTmhib3hLeFpE?=
 =?utf-8?B?ME4wSVQwTjRUa0hrRGxYVmtmTC9lWXQrbzNyL0djRzRSbURHSWw5Yis1cWhs?=
 =?utf-8?Q?Pciq3LdpZPUuXJqUjnOUBYY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc67ebd-9274-492d-9da6-08da8c732d90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 23:39:14.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqjb2wWX6CBFDBK1/vkdaJtOGlVtTxSA5RqdfRWeX7EUSrMm6NWwgEaYbFES/HWzcK/mpkZhT8DLzAcpxi02kiB7AYX58uc7zfedFCtATPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3779
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
Cc: dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/29/2022 10:02 AM, Matt Roper wrote:
> When we hook up interrupts (in the next patch), interrupts for the media
> GT are still processed as part of the primary GT's interrupt flow.  As
> such, we should share the same IRQ lock with the primary GT.  Let's
> convert gt->irq_lock into a pointer and just point the media GT's
> instance at the same lock the primary GT is using.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  8 +++---
>   drivers/gpu/drm/i915/gt/intel_gt.c            | 15 +++++++++--
>   drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 16 ++++++------
>   drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |  8 +++---
>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |  2 +-
>   drivers/gpu/drm/i915/gt/intel_rps.c           | 26 +++++++++----------
>   drivers/gpu/drm/i915/gt/intel_sa_media.c      |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 24 ++++++++---------
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 +--
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  4 +--
>   drivers/gpu/drm/i915/i915_driver.c            |  4 ++-
>   drivers/gpu/drm/i915/i915_irq.c               |  4 +--
>   drivers/gpu/drm/i915/pxp/intel_pxp.c          |  4 +--
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      | 14 +++++-----
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  4 +--
>   16 files changed, 77 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 41acc285e8bf..6e0122b3dca2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1688,9 +1688,9 @@ bool intel_engine_irq_enable(struct intel_engine_cs *engine)
>   		return false;
>   
>   	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> +	spin_lock(engine->gt->irq_lock);
>   	engine->irq_enable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> +	spin_unlock(engine->gt->irq_lock);
>   
>   	return true;
>   }
> @@ -1701,9 +1701,9 @@ void intel_engine_irq_disable(struct intel_engine_cs *engine)
>   		return;
>   
>   	/* Caller disables interrupts */
> -	spin_lock(&engine->gt->irq_lock);
> +	spin_lock(engine->gt->irq_lock);
>   	engine->irq_disable(engine);
> -	spin_unlock(&engine->gt->irq_lock);
> +	spin_unlock(engine->gt->irq_lock);
>   }
>   
>   void intel_engines_reset_default_submission(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 2a29502289cb..b974a6d23281 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -37,7 +37,7 @@
>   
>   void intel_gt_common_init_early(struct intel_gt *gt)
>   {
> -	spin_lock_init(&gt->irq_lock);
> +	spin_lock_init(gt->irq_lock);
>   
>   	INIT_LIST_HEAD(&gt->closed_vma);
>   	spin_lock_init(&gt->closed_lock);
> @@ -58,14 +58,19 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>   }
>   
>   /* Preliminary initialization of Tile 0 */
> -void intel_root_gt_init_early(struct drm_i915_private *i915)
> +int intel_root_gt_init_early(struct drm_i915_private *i915)
>   {
>   	struct intel_gt *gt = to_gt(i915);
>   
>   	gt->i915 = i915;
>   	gt->uncore = &i915->uncore;
> +	gt->irq_lock = drmm_kzalloc(&i915->drm, sizeof(*gt->irq_lock), GFP_KERNEL);
> +	if (!gt->irq_lock)
> +		return -ENOMEM;
>   
>   	intel_gt_common_init_early(gt);
> +
> +	return 0;
>   }
>   
>   static int intel_gt_probe_lmem(struct intel_gt *gt)
> @@ -787,12 +792,18 @@ static int intel_gt_tile_setup(struct intel_gt *gt,
>   
>   	if (!gt_is_root(gt)) {
>   		struct intel_uncore *uncore;
> +		spinlock_t *irq_lock;
>   
>   		uncore = drmm_kzalloc(&gt->i915->drm, sizeof(*uncore), GFP_KERNEL);
>   		if (!uncore)
>   			return -ENOMEM;
>   
> +		irq_lock = drmm_kzalloc(&gt->i915->drm, sizeof(*irq_lock), GFP_KERNEL);
> +		if (!irq_lock)
> +			return -ENOMEM;
> +
>   		gt->uncore = uncore;
> +		gt->irq_lock = irq_lock;
>   
>   		intel_gt_common_init_early(gt);
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index c9a359f35d0f..2ee582e287c8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -45,7 +45,7 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>   }
>   
>   void intel_gt_common_init_early(struct intel_gt *gt);
> -void intel_root_gt_init_early(struct drm_i915_private *i915);
> +int intel_root_gt_init_early(struct drm_i915_private *i915);
>   int intel_gt_assign_ggtt(struct intel_gt *gt);
>   int intel_gt_init_mmio(struct intel_gt *gt);
>   int __must_check intel_gt_init_hw(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 3a72d4fd0214..0dfd0c42d00d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -29,7 +29,7 @@ gen11_gt_engine_identity(struct intel_gt *gt,
>   	u32 timeout_ts;
>   	u32 ident;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	raw_reg_write(regs, GEN11_IIR_REG_SELECTOR(bank), BIT(bit));
>   
> @@ -120,7 +120,7 @@ gen11_gt_bank_handler(struct intel_gt *gt, const unsigned int bank)
>   	unsigned long intr_dw;
>   	unsigned int bit;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	intr_dw = raw_reg_read(regs, GEN11_GT_INTR_DW(bank));
>   
> @@ -138,14 +138,14 @@ void gen11_gt_irq_handler(struct intel_gt *gt, const u32 master_ctl)
>   {
>   	unsigned int bank;
>   
> -	spin_lock(&gt->irq_lock);
> +	spin_lock(gt->irq_lock);
>   
>   	for (bank = 0; bank < 2; bank++) {
>   		if (master_ctl & GEN11_GT_DW_IRQ(bank))
>   			gen11_gt_bank_handler(gt, bank);
>   	}
>   
> -	spin_unlock(&gt->irq_lock);
> +	spin_unlock(gt->irq_lock);
>   }
>   
>   bool gen11_gt_reset_one_iir(struct intel_gt *gt,
> @@ -154,7 +154,7 @@ bool gen11_gt_reset_one_iir(struct intel_gt *gt,
>   	void __iomem * const regs = gt->uncore->regs;
>   	u32 dw;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	dw = raw_reg_read(regs, GEN11_GT_INTR_DW(bank));
>   	if (dw & BIT(bit)) {
> @@ -310,9 +310,9 @@ static void gen7_parity_error_irq_handler(struct intel_gt *gt, u32 iir)
>   	if (!HAS_L3_DPF(gt->i915))
>   		return;
>   
> -	spin_lock(&gt->irq_lock);
> +	spin_lock(gt->irq_lock);
>   	gen5_gt_disable_irq(gt, GT_PARITY_ERROR(gt->i915));
> -	spin_unlock(&gt->irq_lock);
> +	spin_unlock(gt->irq_lock);
>   
>   	if (iir & GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1)
>   		gt->i915->l3_parity.which_slice |= 1 << 1;
> @@ -434,7 +434,7 @@ static void gen5_gt_update_irq(struct intel_gt *gt,
>   			       u32 interrupt_mask,
>   			       u32 enabled_irq_mask)
>   {
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	GEM_BUG_ON(enabled_irq_mask & ~interrupt_mask);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
> index 11060f5a4c89..52f2a28b2058 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
> @@ -37,7 +37,7 @@ static void gen6_gt_pm_update_irq(struct intel_gt *gt,
>   
>   	WARN_ON(enabled_irq_mask & ~interrupt_mask);
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	new_val = gt->pm_imr;
>   	new_val &= ~interrupt_mask;
> @@ -64,7 +64,7 @@ void gen6_gt_pm_reset_iir(struct intel_gt *gt, u32 reset_mask)
>   	struct intel_uncore *uncore = gt->uncore;
>   	i915_reg_t reg = GRAPHICS_VER(gt->i915) >= 8 ? GEN8_GT_IIR(2) : GEN6_PMIIR;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	intel_uncore_write(uncore, reg, reset_mask);
>   	intel_uncore_write(uncore, reg, reset_mask);
> @@ -92,7 +92,7 @@ static void write_pm_ier(struct intel_gt *gt)
>   
>   void gen6_gt_pm_enable_irq(struct intel_gt *gt, u32 enable_mask)
>   {
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	gt->pm_ier |= enable_mask;
>   	write_pm_ier(gt);
> @@ -101,7 +101,7 @@ void gen6_gt_pm_enable_irq(struct intel_gt *gt, u32 enable_mask)
>   
>   void gen6_gt_pm_disable_irq(struct intel_gt *gt, u32 disable_mask)
>   {
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	gt->pm_ier &= ~disable_mask;
>   	gen6_gt_pm_mask_irq(gt, disable_mask);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 3bd36caee321..7c15c67b7913 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -157,7 +157,7 @@ struct intel_gt {
>   	struct intel_rc6 rc6;
>   	struct intel_rps rps;
>   
> -	spinlock_t irq_lock;
> +	spinlock_t *irq_lock;
>   	u32 gt_imr;
>   	u32 pm_ier;
>   	u32 pm_imr;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 8c289a032103..7595aa72af9c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -194,9 +194,9 @@ static void rps_enable_interrupts(struct intel_rps *rps)
>   
>   	rps_reset_ei(rps);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_enable_irq(gt, rps->pm_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	intel_uncore_write(gt->uncore,
>   			   GEN6_PMINTRMSK, rps_pm_mask(rps, rps->last_freq));
> @@ -217,14 +217,14 @@ static void rps_reset_interrupts(struct intel_rps *rps)
>   {
>   	struct intel_gt *gt = rps_to_gt(rps);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	if (GRAPHICS_VER(gt->i915) >= 11)
>   		gen11_rps_reset_interrupts(rps);
>   	else
>   		gen6_rps_reset_interrupts(rps);
>   
>   	rps->pm_iir = 0;
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void rps_disable_interrupts(struct intel_rps *rps)
> @@ -234,9 +234,9 @@ static void rps_disable_interrupts(struct intel_rps *rps)
>   	intel_uncore_write(gt->uncore,
>   			   GEN6_PMINTRMSK, rps_pm_sanitize_mask(rps, ~0u));
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	intel_synchronize_irq(gt->i915);
>   
> @@ -1794,10 +1794,10 @@ static void rps_work(struct work_struct *work)
>   	int new_freq, adj, min, max;
>   	u32 pm_iir = 0;
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	pm_iir = fetch_and_zero(&rps->pm_iir) & rps->pm_events;
>   	client_boost = atomic_read(&rps->num_waiters);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	/* Make sure we didn't queue anything we're not going to process. */
>   	if (!pm_iir && !client_boost)
> @@ -1870,9 +1870,9 @@ static void rps_work(struct work_struct *work)
>   	mutex_unlock(&rps->lock);
>   
>   out:
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_unmask_irq(gt, rps->pm_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
> @@ -1880,7 +1880,7 @@ void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   	struct intel_gt *gt = rps_to_gt(rps);
>   	const u32 events = rps->pm_events & pm_iir;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	if (unlikely(!events))
>   		return;
> @@ -1900,7 +1900,7 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   
>   	events = pm_iir & rps->pm_events;
>   	if (events) {
> -		spin_lock(&gt->irq_lock);
> +		spin_lock(gt->irq_lock);
>   
>   		GT_TRACE(gt, "irq events:%x\n", events);
>   
> @@ -1908,7 +1908,7 @@ void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir)
>   		rps->pm_iir |= events;
>   
>   		schedule_work(&rps->work);
> -		spin_unlock(&gt->irq_lock);
> +		spin_unlock(gt->irq_lock);
>   	}
>   
>   	if (GRAPHICS_VER(gt->i915) >= 8)
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> index 8c5c519457cc..cf3053710bbf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> @@ -21,6 +21,7 @@ int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
>   
>   	uncore->gsi_offset = gsi_offset;
>   
> +	gt->irq_lock = &i915->irq_lock;

shouldn't this be i915->gt0->irq_lock?

>   	intel_gt_common_init_early(gt);
>   	intel_uncore_init_early(uncore, gt);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 24451d000a6a..bac06e3d6f2c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -82,9 +82,9 @@ static void gen9_reset_guc_interrupts(struct intel_guc *guc)
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen6_gt_pm_reset_iir(gt, gt->pm_guc_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen9_enable_guc_interrupts(struct intel_guc *guc)
> @@ -93,11 +93,11 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
>   		     gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -106,11 +106,11 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen9_reset_guc_interrupts(guc);
> @@ -120,9 +120,9 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen11_enable_guc_interrupts(struct intel_guc *guc)
> @@ -130,25 +130,25 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
>   	intel_uncore_write(gt->uncore,
>   			   GEN11_GUC_SG_INTR_ENABLE, events);
>   	intel_uncore_write(gt->uncore,
>   			   GEN11_GUC_SG_INTR_MASK, ~events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
>   	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0d56b615bf78..58679a1049b7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1532,8 +1532,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	__reset_guc_busyness_stats(guc);
>   
>   	/* Flush IRQ handler */
> -	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
> -	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
> +	spin_lock_irq(guc_to_gt(guc)->irq_lock);
> +	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
>   
>   	guc_flush_submissions(guc);
>   	guc_flush_destroyed_contexts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index f2e7c82985ef..ac59dffc35b5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -245,9 +245,9 @@ static int guc_enable_communication(struct intel_guc *guc)
>   	intel_guc_enable_interrupts(guc);
>   
>   	/* check for CT messages received before we enabled interrupts */
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	intel_guc_ct_event_handler(&guc->ct);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	drm_dbg(&i915->drm, "GuC communication enabled\n");
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index de9020771836..d942ec814b47 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -357,7 +357,9 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   
>   	intel_wopcm_init_early(&dev_priv->wopcm);
>   
> -	intel_root_gt_init_early(dev_priv);
> +	ret = intel_root_gt_init_early(dev_priv);
> +	if (ret < 0)
> +		goto err_workqueues;

I think this needs a new goto case because we need to cleanup ttm.

Daniele

>   
>   	i915_drm_clients_init(&dev_priv->clients, dev_priv);
>   
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index c2f2d7b8d964..14efd58e37d7 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1104,9 +1104,9 @@ static void ivb_parity_work(struct work_struct *work)
>   
>   out:
>   	drm_WARN_ON(&dev_priv->drm, dev_priv->l3_parity.which_slice);
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	mutex_unlock(&dev_priv->drm.struct_mutex);
>   }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 17109c513259..69cdaaddc4a9 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -169,11 +169,11 @@ static void pxp_queue_termination(struct intel_pxp *pxp)
>   	 * We want to get the same effect as if we received a termination
>   	 * interrupt, so just pretend that we did.
>   	 */
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	intel_pxp_mark_termination_in_progress(pxp);
>   	pxp->session_events |= PXP_TERMINATION_REQUEST;
>   	queue_work(system_unbound_wq, &pxp->session_work);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   static bool pxp_component_bound(struct intel_pxp *pxp)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index 04745f914407..c28be430718a 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -25,7 +25,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
>   		return;
>   
> -	lockdep_assert_held(&gt->irq_lock);
> +	lockdep_assert_held(gt->irq_lock);
>   
>   	if (unlikely(!iir))
>   		return;
> @@ -55,16 +55,16 @@ static inline void __pxp_set_interrupts(struct intel_gt *gt, u32 interrupts)
>   
>   static inline void pxp_irq_reset(struct intel_gt *gt)
>   {
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	gen11_gt_reset_one_iir(gt, 0, GEN11_KCR);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   {
>   	struct intel_gt *gt = pxp_to_gt(pxp);
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	if (!pxp->irq_enabled)
>   		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_KCR));
> @@ -72,7 +72,7 @@ void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   	__pxp_set_interrupts(gt, GEN12_PXP_INTERRUPTS);
>   	pxp->irq_enabled = true;
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   }
>   
>   void intel_pxp_irq_disable(struct intel_pxp *pxp)
> @@ -88,12 +88,12 @@ void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   	 */
>   	GEM_WARN_ON(intel_pxp_is_active(pxp));
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   
>   	pxp->irq_enabled = false;
>   	__pxp_set_interrupts(gt, 0);
>   
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   	intel_synchronize_irq(gt->i915);
>   
>   	pxp_irq_reset(gt);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 92b00b4de240..1bb5b5249157 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -144,9 +144,9 @@ void intel_pxp_session_work(struct work_struct *work)
>   	intel_wakeref_t wakeref;
>   	u32 events = 0;
>   
> -	spin_lock_irq(&gt->irq_lock);
> +	spin_lock_irq(gt->irq_lock);
>   	events = fetch_and_zero(&pxp->session_events);
> -	spin_unlock_irq(&gt->irq_lock);
> +	spin_unlock_irq(gt->irq_lock);
>   
>   	if (!events)
>   		return;

