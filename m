Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0446C589D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678AD10E3ED;
	Wed, 22 Mar 2023 21:15:14 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0352610E0FF;
 Wed, 22 Mar 2023 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679519711; x=1711055711;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U4LogsWJ7hMIcIO2LnKsJVatq6YyKWt7Kyk6koFz7sk=;
 b=jPUk5VSY4fhH5Sf34yx3T2UPmM1SslAv6gzGgcttcMUgejeNCKAHg7Sc
 ev2qi6uoTELBoHjcB3ieXZA6bV7DxcVTr7WNMw/UGKjfsIaQYbCwiZlvW
 INq3pabcuTzAdJeVERfVhM2eFXjAzhBT6PHkGZ5kvBiuLREkDfJEI4pBt
 Nw25K1iDCNrNBzbEz1GrHGGAcWmgsGbdY+gGoQ5kyYX9F2Tmf8SzlMjxb
 U7phZcAJg9wjyTygD4uffAN/2NMFKX39ovWe49cR3qnfacUCMMLxt9GAy
 P0mI67pqkdNLOqGX6dY6mhPN9EymquvRVlpiFJvNH07pM525+BTJd4zmE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="425622149"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="425622149"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 14:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684465244"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="684465244"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 14:15:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 14:15:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 14:15:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 14:15:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 14:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7Yt2/nSzKhIAZJqG8hZp0q+STXm6Bl6BT733nEoTg6XyDUWij/abo9eL/vq+AMvUmVCgtn79ViJwODAZ3Dx+rGyz9654fsHAXtToxy5RtiC0+MPXtOaelIcLY+iG8FEWacYpuyd/8/WZ2bAI24NT+Al2s34J4C3oc5FuqKPw3XNh1lfxUcGV9XGq5Of0Zy7WeDxyy5XMzKY4/tSpsDrkpGT6VYkF0vEl2jS3q9sqSjqmfOTp6nr/E7HK12mofbTMzeEpv5Vm1BkIXr0RwUcLLjDrPRNrh49eNp27qPLoYaIXohi+zUU7OtNQUTwFtZV4FzEI20t4c3GJjpQ85xd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfAwsHj0wFpYtHPnm67sR4+0fF7ygEZoDAC7t/dbAqc=;
 b=CLjFv86FpEZz2BTt4oSaHZWf6kovljpgiDjaLywE/otKIlCBvMmvMIaUxjHBqfxT41VUKyZ40BXMPH2Bo9i3ftMflvi4pbMS7aUnU6uF0/af5xsgvAI68KS/Jjvuclv93TTNBaGZ8Fq3MjKhkNy6cRwEaGoT4I0PF7gp9wciHs+0MBdpnBwISK+8iJLpfW2v6jBgeFZgtl0H294brzpkjgLcbw5HeOzqEjFNtHgRkNe5VaIwZStC3n+OtFf1ouAOzmZPXBOajz6CNW/Kxt6MTtkHbX5RkHyP9UdqMA3EaMfa6eOxJSr/ViMbSee8pV+2VA5h+THPB0hou15r71Jbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 21:14:58 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:14:58 +0000
Message-ID: <afeac62f-7c52-f605-d3e7-4b80a5011706@intel.com>
Date: Wed, 22 Mar 2023 14:14:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/guc: Allow for very slow GuC
 loading
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230316220632.3312218-1-John.C.Harrison@Intel.com>
 <20230316220632.3312218-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230316220632.3312218-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 42913e3d-c524-438d-8d83-08db2b1a7dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5mBPdQ1hFawhzg+LlqxeF8aSZJQF45kyTV4AYB6YvgGllOznveXERPrvnA/1MBuPNKsgNcn14IYFP9QEQ5YFyBuCXikd13KJlHICCybhTlVnHUonTmC2NOp8wC+kno1U/JkoEIylCAdrZKO4vZGaVIKIgfFfrpXfUE/t1RRElV5N8xFOYUwF2pf92JVOpYCbyBYMulZQDpFPq1mQpCSzUKRuWIwFyJHuYgg0aVA2OdEqRV2ku0U2RarbzUrDZvQ90UwBSCWQX0tZtkytsZAfXl0XedeZEjQ9+Yl4R0D42t1gHoR0hr/J6Z/c7GiBnZuvZTCh4/Cr73MIjCkRGmDRN15XW0+iCKDcY+37WVZ9Bgij74zBANXi7fis7fFaX0mPdW6NvT6MLqaAVGviaz8m5Z2VaZ23ttkGXEmseCjJYzueN9UctEFgZ1tBxMkBqZYx7op28aFG4EdUJec+Kovpp69I4S7ydaww4WsqGYhtjIn62JarNNZuaj3vJyYeUgSvUgqgELY600+EQUawUSRfjYrxCbfVWWEkGgp6kn0uvciQ5HhpdxK9CvK/GKsyOiuVjSycaHUxpXxp5ty5V9yPh1GyMVGHsR+10fKV4If+1s4RnDFM5cgCA5+ct/xdpUXDsp/Dl7wPqdw7pWHH7mdy4H+Lcej390b70t6XT8YaC+sdJk62GkA9eST23Bx/cbO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199018)(66476007)(316002)(478600001)(8676002)(31686004)(83380400001)(41300700001)(66556008)(6486002)(6666004)(966005)(2906002)(66946007)(450100002)(4326008)(53546011)(6512007)(6506007)(2616005)(186003)(26005)(86362001)(31696002)(82960400001)(38100700002)(5660300002)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxNaXpzZmhJRDFkc0VKb0FJMW1zRDZuS3VadEZFVi9mL3p5OGhHcER0UTND?=
 =?utf-8?B?T3d3VmdrYzN6Q3pua0pyRWRJVk5uN1lUVURQZXRiNXJWK0JTWXRzMEx5Y0tM?=
 =?utf-8?B?QzVxeUZoZXRDd0RRMDNxUG9sRS9JNEdUa25HV3I4K2EzUnB1bmM2dXBWM0Y5?=
 =?utf-8?B?Q1NWaXRNd2N6YzlmYkdqUEtlMmdsZUFhR3orYmNYUCtmRlNObmN0MnQ2d3RW?=
 =?utf-8?B?Vkh2MVphZHowVzl2MForQW5UQnhLSUVOMnpYWktITnprM2p1SFV0UVRvSkpI?=
 =?utf-8?B?MGlFZ25JSXdYT1VFK3NvOXhBMDl4WmRxMmttd3FRYlBuanJRYnpWL2h0RjFs?=
 =?utf-8?B?ZnNXdTBUaWJuTGNlb3ArM3dZWWp4M2ozSnlhNEpnemlPQldZZzF5bldHcXVT?=
 =?utf-8?B?dHpWR3dOM3l2ZldnL2pFOC9xc3VmTU8zOUFMdTM5eW5neGoxUEFEd2tKQ0pl?=
 =?utf-8?B?bzBWVm5Jbms5ZHFwVHh4a3RmSW0xaVY3U0o4WHdXU1gzT1JBQTA5SlRiVHJM?=
 =?utf-8?B?RkZKK3NmVTkxQUtjKzFjYk9kVXR4OUFBQVA4YXp3YytlMm9RVHVPRDl5bTQ4?=
 =?utf-8?B?NmJRbTZwRXV4dUdRbTFsUGl0OEF2TVBCUFJmeGJRWjRMOE9UalRVOERSMlZR?=
 =?utf-8?B?S3lMdWVWUCt2elc3cmZadTFKbU9nK0hYbEpyS1VaU1ZIMW04SmhPTkFaMW5l?=
 =?utf-8?B?RnhaS012YkhvZTJhdXN2VU1PUFhpNDJnODNmVmt6aEppU2FsOW0wejdkcGRG?=
 =?utf-8?B?djRwYVN6djZQQzg0VDFqSkt6MGt5MitzUVhPUVMvNlZ0VFJmVWpsTFdDZ2ZX?=
 =?utf-8?B?Qmh3aEsyWllaa0crc1FUOFhKb00weUc1MW9qdWNFZmRqMjNKckt0MzFUUXg0?=
 =?utf-8?B?Y0lQdDAxWmttYlZtTFNjSVJCK0E2N0Qwa1lTZmEvcE9ZZ1d2NVBEQkVzWGZQ?=
 =?utf-8?B?cDN2SnpzKzB1emFLTUx5RHpZaERzMTcraWdDKzRNdU12TFVMTHVvNWdlZHRu?=
 =?utf-8?B?OWI3UjZLVEtIRHhtZUR4NW5nVWZVak9HUERrcmp5Nit6Q0p6c1F2V2RwMEt2?=
 =?utf-8?B?YkE0eEFxaUdEbDNKbDQ0MktQbFc4T1dNblNqazVkdW9zUDNoaGNvSFNWWm1s?=
 =?utf-8?B?NEtFN1RqMTJDWlJwUjhsU2MxQnpFSEFBcDh5ejJrOThORnhmVEQwczdpU2JU?=
 =?utf-8?B?emhTYkJDemFXV25mT2c0cDdvU1Yrb3psOURzLzQ5U0xxNmJFLzlHM2pEaVVR?=
 =?utf-8?B?UFpUcksyemlHa3dxYXUwZU1keWFzZnk2aEYrQXVia1NrK3FwdkVrVStqblEw?=
 =?utf-8?B?MnNXQU9pZ3hxckpaTVFuKzl3eHZVN1NmdE5TTmoranovZlJqS1E1VjZ1a2NZ?=
 =?utf-8?B?TVZ2RVpLNDVDekNJMm96U0xMU1pGcVFLKzhFeXF3b1VHNEtVOTQ4Wmo2ODZQ?=
 =?utf-8?B?c2FQbktyOSs3R1k1SVlLTTVBYkFuQjg0SjZ2dUhMNW40QWlHbHplQ1VtNjlJ?=
 =?utf-8?B?Z0FwRWdUdjYvRjlXWXZORnJlNVV4YmNxM2ZvbmdEYk4vbUxwaTZCRU14WUta?=
 =?utf-8?B?RFZCZ1dMZCs0dlp1TmN5SHZmODdteFNRSVYwUTFLWkRRRjBGQmxVQW1YL3Vy?=
 =?utf-8?B?R3ZRenR2OHBreHNmQU9pNzQ1cXNXZHlBTUtYUWp0dDk3cnYyTXlYWlFsQ1du?=
 =?utf-8?B?OFVKemJaZTBGN1VMRkl3cVZ1SU1GRVZDSGgwMWxkanNFNTZNc0pnSTk5QTVu?=
 =?utf-8?B?enFjK0RNUXRCMGNWWTJIeXM3bElSYVJZS0xLUFhlUHpmcm9xREdCQVIxa2Vp?=
 =?utf-8?B?QzlkeHRLbStaUFhmb2t0ZlRIMFpDZWltZTJiREREUVgzZ3hKZG1CNTVuTE9K?=
 =?utf-8?B?RDdSUS9lU3h2dk1xbFVkdVltMDlJN0owdU1LckswYk1PdWlIOGtzWmVJV2kw?=
 =?utf-8?B?cU1OR2lleTRmeCtYK3F3UGJxWHNib3hteHZDbWtBNVZVZUZkK1hnMjVDR0xu?=
 =?utf-8?B?b29YblZJWjc4SWJ4VzJDZldtUnZLUXpEdXhkV0VrTDRhLzNrN1REVXI4RTEw?=
 =?utf-8?B?VGVYZHEwV2NyMERwZitqdnl6NUxtV3pQOHAyMnJOWEIzSGdENmlXS0Q3cmFD?=
 =?utf-8?B?TW03L21TN3dmWDVQeENReHlyamlQWThpVmZ2Z2htRUhnSUlVeHppb3BTM3Vi?=
 =?utf-8?Q?jVLN5/VbeHdbcPmKJoj78vU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42913e3d-c524-438d-8d83-08db2b1a7dd3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:14:58.5404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkuCCcwwFjhzLxfyICRVS1KiNFjqsKyWma92cheNgWylqKlOlwuvMBJa0tMnzhG+hNMlz4w6TViqV4s5Dehy0OaQLfsKjcVW/jqCv5I9kJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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



On 3/16/2023 3:06 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A failure to load the GuC is occasionally observed where the GuC log
> actually showed that the GuC had loaded just fine. The implication
> being that the load just took ever so slightly longer than the 200ms
> timeout. Given that the actual time should be tens of milliseconds at
> the slowest, this should never happen. So far the issue has generally
> been caused by a bad IFWI resulting in low frequencies during boot
> (depsite the KMD requesting max frequency). However, the issue seems
> to happen more often than one would like.
>
> So a) increase the timeout so that the user still gets a working
> system even in the case of slow load. And b) report the frequency
> during the load to see if that is the case of the slow down.
>
> v2: Reduce timeout in non-debug builds, add references (Daniele)
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7931
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8060
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8083
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8136
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8137
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 50 +++++++++++++++++++++--
>   1 file changed, 47 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 0b49d84a8a9c2..6fda3aec5c66a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -12,6 +12,7 @@
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_mcr.h"
>   #include "gt/intel_gt_regs.h"
> +#include "gt/intel_rps.h"
>   #include "intel_guc_fw.h"
>   #include "intel_guc_print.h"
>   #include "i915_drv.h"
> @@ -135,13 +136,29 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
>   	return false;
>   }
>   
> +/*
> + * Use a longer timeout for debug builds so that problems can be detected
> + * and analysed. But a shorter timeout for releases so that user's don't
> + * wait forever to find out there is a problem. Note that the only reason
> + * an end user should hit the timeout is in case of extreme thermal throttling.
> + * And a system that is that hot during boot is probably dead anyway!
> + */
> +#if defined(CONFIG_DRM_I915_DEBUG_GEM)
> +#define GUC_LOAD_RETRY_LIMIT	20
> +#else
> +#define GUC_LOAD_RETRY_LIMIT	3
> +#endif
> +
>   static int guc_wait_ucode(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_uncore *uncore = gt->uncore;
> +	ktime_t before, after, delta;
>   	bool success;
>   	u32 status;
> -	int ret;
> +	int ret, count;
> +	u64 delta_ms;
> +	u32 before_freq;
>   
>   	/*
>   	 * Wait for the GuC to start up.
> @@ -159,13 +176,32 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   	 * issues to be resolved. In the meantime bump the timeout to
>   	 * 200ms. Even at slowest clock, this should be sufficient. And
>   	 * in the working case, a larger timeout makes no difference.
> +	 *
> +	 * IFWI updates have also been seen to cause sporadic failures due to
> +	 * the requested frequency not being granted and thus the firmware
> +	 * load is attempted at minimum frequency. That can lead to load times
> +	 * in the seconds range. However, there is a limit on how long an
> +	 * individual wait_for() can wait. So wrap it in a loop.
>   	 */
> -	ret = wait_for(guc_load_done(uncore, &status, &success), 200);
> +	before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
> +	before = ktime_get();
> +	for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
> +		ret = wait_for(guc_load_done(uncore, &status, &success), 1000);
> +		if (!ret || !success)
> +			break;
> +
> +		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz\n",
> +			count, intel_rps_read_actual_frequency(&uncore->gt->rps));
> +	}
> +	after = ktime_get();
> +	delta = ktime_sub(after, before);
> +	delta_ms = ktime_to_ms(delta);
>   	if (ret || !success) {
>   		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>   		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>   
> -		guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", status, ret);
> +		guc_info(guc, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz, ret = %d\n",
> +			 status, delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
>   		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>   			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
>   			 bootrom, ukernel,
> @@ -206,6 +242,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   		/* Uncommon/unexpected error, see earlier status code print for details */
>   		if (ret == 0)
>   			ret = -ENXIO;
> +	} else if (delta_ms > 200) {
> +		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
> +			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
> +			 before_freq, status, count, ret);
> +	} else {
> +		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
> +			before_freq, status, count, ret);
>   	}
>   
>   	return ret;

