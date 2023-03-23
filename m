Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE56C7438
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 00:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7AF10E488;
	Thu, 23 Mar 2023 23:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5510E121;
 Thu, 23 Mar 2023 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679614997; x=1711150997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cxts/zsA+xHWUsBvBr2VKxmREsnMcrwSXi9GQ2IV/XI=;
 b=Bdz876wyyVKO7VIQPhexera/O/XhFPbOG/HGCUku0dOSU/5dx0Ets84r
 X3k5Objp3caSsK8XKfxgPH8+iRyb+IbFGEHlnmvgCxAnJvXJMNTT7lNY9
 U8gU6tGXk3PCkYNYZ7iwXOcfYp7wxic8umcjTAeUmhu7ey4SpjXGX4s61
 6VaH808XkUxqm8FGqLe8CN76jVr4uABS6VSTH4zPUoesqjgFBPCsALTNZ
 ObgRHLSpwl4Px6epYe515WyatD3v+aLiBIl9jp1SMxSaxp+Ll6+D8OrFG
 U7vSdlT8rYjzXBesvS9dl2FtyesOchMt6j3fP55N1xVrc8tjFdv++wOee A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="425927108"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="425927108"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 16:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1012038315"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="1012038315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 16:43:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 16:43:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 16:43:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 16:43:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 16:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmH5ucGpnYQzXYtEL1axmC47fqD+kzz2GdJX+qF6Nt2PUCKnaHs8IqxMZ3B4XzZ50ePJgUuGbznoW2It2cbobSXmPiD2AGY3Jv4Hnd117/DOPRF74DJU6l7rhv0WYz12ZtR3GwElJ3WPz8sZNTa/3ftcbFfJwGAuYS06h4oZl/aQ5yZ5Qdj6rWbBWjxCVKBeY+MuoFm4jkh7NP7CJq2fOt0UkJapQF+/Zx+XNIEYfwszpgDDBQqOdTJaVIvda6+FU0wyCuhlj667R2BddTXMmbl6cw49Bh3A6qrMRb98Nqz4ep8W5QttQsW796H2IR5tmYCNLcsl/SXLR0PE1wKokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C58iSjJTacfgUD5SBZxMTviaXTQquRFjMTOylQTOuEg=;
 b=njI0nXeYbWeF0Gz7lUysV/k7J/yKikQYKWbrDyBIFZiiUU2TAEcSsECKk0QjJaBPOKcytKzBiCuL5t7FDH5qvLzJKO1eGUtdC7dw1x4+EVZnsFFQt+byKzxmcV+G6A62JpzFYHyntkemcasANefLixcSH/TDtFfgUPgijLLsEZvXfyeiJRAAAmKc54k8FeLYaHSRNjUnO1wMZ92wLFZoHPa5fF0BbwHo3mKvUBAHyw/9fMWM92Fwl2/Rqvn5XarvJ0t6OMXwFNYoFP+R5UDvyqkmedKo8axvBLiDULax8y3Hs87PMrXRHdrJa1xD/HSovG5zJ714W547xnF2v3QDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Thu, 23 Mar 2023 23:43:05 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da%8]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 23:43:05 +0000
Message-ID: <3a0bf008-da85-8334-33d6-784c2ece54af@intel.com>
Date: Thu, 23 Mar 2023 16:43:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5] drm/i915/pxp: limit drm-errors or warning on firmware
 API failures
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230323184156.4140659-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230323184156.4140659-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fcdbd3-533b-4dd7-7406-08db2bf85960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7LRkRlwUcLCC+ijZYzyHBbRVxaqHoVyIssUtAh+TI6xa3813UOWTh6x/2p1Nx59GzHUAVPjlOB3NJPBAh9O2D3ovaf7bFSWLdSYKeiNA16NDzSfrVj0XNaWyURL8zZPm3GAz7sl5AjR7l5pB0o2S7qm3LVl52/ar81rBBa7iPQX6lOErfxGhmY2tSiSM73IM3YqUHJ2XHEYwU8SL7FDzhyKnVFIqCAErWj4M9YlRpjoRv7noJZZqAjg9UM5BeqhpiBjWqRZAvXKPgjN7BK5BLhizUR/V+2dBKFxKHB7kt+Mzq/hGoTm/MP5PwJe6LpoU3o+B9oVW/6DU9syCiQ3rBpTioISdxKmbR2j0N9jsY/M9L46Ps03pEnnct2nGDSOikz9YhNSGvBG1tBJGtnTJhf9DTsk4ic6Ap+4MzW7mKzPu8rxySWKHK3HxsLo7CDM+Um9UWJuLSD2EnKHDIx55ALwlSG+OZMgvZvdo3IjSpwVwYhmmlmNLRSr9GL+DrqiUcLBaUiD/4rEObjeCH05TvI+V3XHt7GllXzMhcUQJRaSTaO77Wq9MD8JtGNqZno8j3IDy/ErMtzhVa7HfnPqk0mlQ7CwUGJIdmlEX9tqQncYnoZY4lBvq05Essh7jqr1tHSUN5zU2XIoZAdwHUBZdEw/NnCukFCW+atTWrZKrj6QrUtdVZCHqGTRo/+O+szhp88OQ4FAUBjV9TwdzbV82VOO+IXF5076geDPY0aY/JWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199018)(36756003)(66556008)(8676002)(66476007)(54906003)(66946007)(4326008)(450100002)(41300700001)(5660300002)(82960400001)(8936002)(316002)(26005)(53546011)(6512007)(6506007)(6666004)(107886003)(186003)(478600001)(83380400001)(2616005)(6486002)(86362001)(31696002)(38100700002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkRQK09sMzEyUXVjc0xHVFdabkRQTzZva0pxVjhVM0RTdERqMFhhUEJrWW5s?=
 =?utf-8?B?KzJVYUoxMXBHU0c4TW9DZ1NXQm5Wa1hWUWZDYldNenZvRXBOSFg2S1hIR0Zq?=
 =?utf-8?B?VHBZdVpseDBmN2VwMGNxMEliNnRCSjczeE5zL3MyTGlXNWFKZ2JRVXlzZy9n?=
 =?utf-8?B?aHh1N0J1Mk9yYjQyNHRQWUsvZ055c1J4amVicFBZZEk5TmsxaCttMnVNL0J4?=
 =?utf-8?B?ZkRZMUZJeHY5NVc3aDN6bXNDQXdEOXkxT05leWp0bXM0QUVyUmdEOHpPZ3gx?=
 =?utf-8?B?RFY5bVk2dVhGaVJqNFc3MTYxYlVHR2ViZFl4WW41eHhKMVdaalJMNHd0L2lz?=
 =?utf-8?B?ZEdKUmNtdjFTNE9WTENJcWhWRUdPODhOOG5DSDZvZ0dNc3Z2T1FLTjY2R1BH?=
 =?utf-8?B?Y09YRjlKMTlkSnR4VWZEYVJHY1VkMjkzRGxkZ3RkckFaSVlWYmFYVkR1SmRM?=
 =?utf-8?B?NzBqL1puelh1TzRKVmdqM1owaTQ3V04wMDNMeXVRS2RRK2JsNHNTZlh2dVpH?=
 =?utf-8?B?WWlpWWpHVndLM3NiYUU2OXYybGZhcDlkU2xTNVFjWkRpamM0UEd6L1Jib0pN?=
 =?utf-8?B?Z1VkVFFySHhmYjdNVzVOR1oyOGhHZVlvaENkWmVMUjdzZjdXd1JnejE4VE8w?=
 =?utf-8?B?SmdRNWgyRlQyUnBnWnAzY1RQMXJCZ29mVTQ1Skc5czY1S1NvdU1BeDVrZ1RB?=
 =?utf-8?B?V1ZXaVF2VnJTMS9oNTFlWER6cms3Wjlyc3k1NENIWVVuMkJ4bkxjOEFCQzl5?=
 =?utf-8?B?akdUNGwwSURBSjBLUHMyK294V2xzditQdGlIRFkwRXlSMVR0V2dpUTM4b1RE?=
 =?utf-8?B?V29MbEpFUkpvU0N0dk9EN1BxbXp3Nm5iOXI1NTk1ZFNxYmRIZTBTM2RyRGZo?=
 =?utf-8?B?NXRjZDVvNzdOcjgxck1ia2lTUit1cGtTU1ZIbHZ0RXEyb1EvSi84OXMxd3Ex?=
 =?utf-8?B?OUE4aDFJdEJTSFRWQUw4alpFb0NCQzhXdldoTnBCdmJDbXBCdjIydkxKS0k3?=
 =?utf-8?B?ZzJGT2pkMGEzUVFlV3hlbjc1dit5b1EyeEpnWHg5TWg3L2Y2NjNrMUFSVk4w?=
 =?utf-8?B?MWZEOW5VWnFCSFdCcjJWc1JySThwQUNMOG0xLzdFeE1YQVVOUE9PVDltQUZB?=
 =?utf-8?B?OHVaM3JwVVp1NnRIM2xITzEyZkRCSDRaV1gzWFlaYVUyRjJvT3Q3SkNVd3Mw?=
 =?utf-8?B?REJCcVdGT05hbzloMWJ3MUlNVmhJbXllbS9IeWtodUN3czhRZHVvTWdJK2Fl?=
 =?utf-8?B?VVBPRks4SytNd25yWDJyM1F0RFRjZlhIOWtSSzNLdUtHcjFlWkltVCtGMDRN?=
 =?utf-8?B?Vm91T3lVU1lZSDMrc1UyVTlBaUt2ekF4OC83WWJPSHNBejRReDNDRkdGYXRL?=
 =?utf-8?B?WUFpSENDcDlqMzVPSEVWNmxVTHlwRWFmTjFPNGozT2RVbHcrdUVQOGFXV0xH?=
 =?utf-8?B?RzFUM1IxTm5EZ3pQeGNJc0l0clQvSUtyYmE2Yll1TWhpNy9ON1NMdWZleGo5?=
 =?utf-8?B?SitDZ0JwMW96ZTdWT3RrOG9VaXM0QTZvSVZDb1I5TklkWmZpUU1hd21IbWVW?=
 =?utf-8?B?UmxKaVZweXM2U1pMQnVVRVgwekhnZVcxRlIyMkxEM0ROM2RIVmNPSFBrKzBu?=
 =?utf-8?B?WUowSXRBcmFnc2RacytzZWhTZUpqa3djSkhRTnZtSG5xdEZtOTBURGpRMFFS?=
 =?utf-8?B?amY5UWRMVlV2RjA3eHBWMWExWk54VnhEbXNIRXJnYmh2UnkrUFB3M0k0aHY5?=
 =?utf-8?B?ZXhIS0dieXFtUkpWckkvQlprTW90S2dJUXZ4RDFwWVBSSERHQWVHQXR1ZkxH?=
 =?utf-8?B?Z0JUMFQ1U1RJb3VwMzlCMm9zOE45aExGRTNBdk9pcDhGOGdRc1owc2ZGY2ZH?=
 =?utf-8?B?d2cvMDh1M2tRSitoaEM5WVBidUptN3NpZ2NrclRrQzgyUUh6Q3V5U1JoWmxG?=
 =?utf-8?B?SnpzeXJjOWxUMlA0dHBPOFdRTmJoQjljRFJoZXhrbUJmaW9haHZoR2JOZVdS?=
 =?utf-8?B?WStLaHZUN2lPN1ZSUGJ0SFVKZVE4VVlqZlBaMFhJaGFreHVFNFhReGlJNnZF?=
 =?utf-8?B?M2QrK290enN1OTUvdWZmcEpvbFdLdDNqWStXbGNyWDk3N1VKbW0vQVo1OW1M?=
 =?utf-8?B?MjdIY1lwenJ6MWg0TDkvQWpOSzBlWDRkSlRjdTNFM2VWSFE2K1JkZUk4WkRI?=
 =?utf-8?Q?GE8Epa1tVGZG4biwH5cCECU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fcdbd3-533b-4dd7-7406-08db2bf85960
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 23:43:05.6308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXpQRlUgtqj9OLjCOjJLiVlp+NOEs2+afhPSkfz6aJE2iTiHYQAKHbc6XaQVd9ugWyLmm8NRoc+n/50JAwVRKBT0npynNekl9J1mWHAFEbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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
Cc: Eero T Tamminen <eero.t.tamminen@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/23/2023 11:41 AM, Alan Previn wrote:
> MESA driver is creating protected context on every driver handle
> creation to query caps bits for app. So when running CI tests,
> they are observing hundreds of drm_errors when enabling PXP
> in .config but using SOC fusing or BIOS configuration that cannot
> support PXP sessions.
>
> The fixes tag referenced below was to resolve a related issue
> where we wanted to silence error messages, but that case was due
> to outdated IFWI (firmware) that definitely needed an upgrade and
> was, at that point, considered a one-off case as opposed to today's
> realization that default CI was enabling PXP in kernel config for
> all testing.
>
> So with this patch, let's strike a balance between issues that is
> critical but are root-caused from HW/platform gaps (louder drm-warn
> but just ONCE) vs other cases where it could also come from session
> state machine (which cannot be a WARN_ONCE since it can be triggered
> due to runtime operation events).
>
> Let's use helpers for these so as more functions are added in future
> features / HW (or as FW designers continue to bless upstreaming of
> the error codes and meanings), we only need to update the helpers.
>
> NOTE: Don't completely remove FW errors (via drm_debug) or else cusomer
> apps that really needs to know that content protection failed won't
> be aware of it.
>
> v2: - Add fixes tag (Trvtko)
> v3: - Break multi-line drm_dbg strings into separate drm_dbg (Daniele)
>      - Fix couple of typecasting nits (Daniele)
> v4: - Unsuccessful PXP FW cmd due to platform configuration shouldn't
>        use drm_WARN_once (Tvrtko), Switched to use drm_info_once.
> v5: - Added "reported-and-tested" by Eero.
>
> Reported-and-tested-by: Eero Tamminen <eero.t.tamminen@intel.com>

checkpatch seems to not like this tag. Maybe have 2 lines?

Reported-by: ...
Tested-by: ...

Can be fixed while merging.

> Fixes: b762787bf767 ("drm/i915/pxp: Use drm_dbg if arb session failed due to fw version")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 77 +++++++++++++++----
>   3 files changed, 67 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> index ae9b151b7cb7..6f6541d5e49a 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> @@ -18,6 +18,9 @@
>   enum pxp_status {
>   	PXP_STATUS_SUCCESS = 0x0,
>   	PXP_STATUS_ERROR_API_VERSION = 0x1002,
> +	PXP_STATUS_NOT_READY = 0x100e,
> +	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
> +	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
>   	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>   };
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 448cacb0465d..7de849cb6c47 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -74,7 +74,7 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>   
>   	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
>   	if (ret) {
> -		drm_err(&gt->i915->drm, "arb session failed to go in play\n");
> +		drm_dbg(&gt->i915->drm, "arb session failed to go in play\n");
>   		return ret;
>   	}
>   	drm_dbg(&gt->i915->drm, "PXP ARB session is alive\n");
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index d9d248b48093..a2846b1dbbee 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -19,6 +19,37 @@
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
>   
> +static bool
> +is_fw_err_platform_config(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return true;
> +	default:
> +		break;
> +	}
> +	return false;
> +}
> +
> +static const char *
> +fw_err_to_string(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +		return "ERR_API_VERSION";
> +	case PXP_STATUS_NOT_READY:
> +		return "ERR_NOT_READY";
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		return "ERR_PLATFORM_CONFIG";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
>   static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
>   				    void *msg_in, u32 msg_in_size,
>   				    void *msg_out, u32 msg_out_max_size,
> @@ -307,15 +338,22 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>   				       &msg_out, sizeof(msg_out),
>   				       NULL);
>   
> -	if (ret)
> -		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
> -	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
> -		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
> -			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
> -			msg_in.header.command_id, msg_in.header.api_version);
> -	else if (msg_out.header.status != 0x0)
> -		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
> -			 msg_out.header.status);
> +	if (ret) {
> +		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status)) {
> +			drm_info_once(&i915->drm,
> +				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
> +				      arb_session_id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		} else {
> +			drm_dbg(&i915->drm, "PXP init-arb-session--%d failed 0x%08x:%st:\n",
> +				arb_session_id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status));
> +			drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
> +				msg_in.header.command_id, msg_in.header.api_version);
> +		}
> +	}
>   
>   	return ret;
>   }
> @@ -347,10 +385,21 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   	if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
>   		goto try_again;
>   
> -	if (ret)
> -		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
> +	if (ret) {
> +		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
> -	else if (msg_out.header.status != 0x0)
> -		drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
> -			 session_id, msg_out.header.status);
> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status)) {
> +			drm_info_once(&i915->drm,
> +				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
> +				      session_id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		} else {
> +			drm_dbg(&i915->drm, "PXP inv-stream-key-%u failed 0x%08x:%s:\n",
> +				session_id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status));
> +			drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
> +				msg_in.header.command_id, msg_in.header.api_version);
> +		}
> +	}
>   }
>
> base-commit: 3a266f994a6b752953eb974ab7bf1dc382a2d1b8

