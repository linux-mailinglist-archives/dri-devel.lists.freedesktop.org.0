Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0040CD24
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6366E9FD;
	Wed, 15 Sep 2021 19:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBEE6E9FB;
 Wed, 15 Sep 2021 19:24:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="219227590"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="219227590"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="472518565"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 15 Sep 2021 12:24:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:24:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 12:24:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 12:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoW9pCEtmuayEYkTs+2SPgLhq9Q3qTDK35gftT7HAFFTXzZO4glWFmw7m6leJwy4opj9p5caNvpp56vrNa9Tc4brR6d7XVegIIj5Vk5+rtN92zSzxxkp9k/myX9kvgR6ZmeyJA8caPChYp5dXh1t0M0d95a7u1DHQkvRrE1x0/xradBynQY7FaQrzFnQGImInYOJeFK4YkUSyIZAw3mzk9dkXh1jpzSqm6VWqYbG2tBRjgkwwDDqk8soVCWSWtaxcP3hxduPXzOmL9uqvtlLyBdHOUK0A4IbILlUPFvtXbdPXriWgQkiO0o78ffnMWNPWA4rcfnla2vvi0YjG8HWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3OwaaSBGtvDAXM8E5xgSWB67fopKXdFsLIvNRYjJ8jU=;
 b=RlqQKkP22lpPaXx5yDSQeQUktvl7hpr/J3/irDPQgIpskONwC9EjykH0uuBMT3WmP+aOlQNrtEMW2/iEtg2zXAc3cy8tMlCpT08PStLS5Joop2qD2bW58hiECg9er9Pl5FMSuHeTPYz0z1yg+kvi1/0gkPrWCFBbOiGTuna+QmcalfgB/8l+5mEutNIfgqQxOupIqzZLyV+2I7L7ekNhkQkao7+2STF6XBQMO4VdMYDLBf+bAs0muXfVHwVHxGPj24IYzaruknsjkFwMsfvRpOCcYlub20gRnG4d5M5cy0VxNGxdxA7J4ew/YZyNQUMcvqYkDBMk8Z/BWTwHuau3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OwaaSBGtvDAXM8E5xgSWB67fopKXdFsLIvNRYjJ8jU=;
 b=M6RLg2pZNwjsKTbI1MePi4qjfWNZcwRebVVRxFfR0yzC050KPEES1qBbofryszlhwqu4547DSv3XM/890F7Z6VJGC2Pdb2x8n4Yo9d+hLO5qUj/UcobIcDYbHz6RPEDJgAB2aKzGJ07XyNLNt/dkrhMDwL4WrmBNvr7DQvjbnN8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 19:24:21 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::103d:37a7:b9ab:fe2d]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::103d:37a7:b9ab:fe2d%7]) with mapi id 15.20.4523.015; Wed, 15 Sep 2021
 19:24:21 +0000
Subject: Re: [PATCH] drm/i915/guc/slpc: remove unneeded clflush calls
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@Intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
References: <20210914195151.560793-1-lucas.demarchi@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <27c071ae-13b8-d71d-d869-e9cbd7431afd@intel.com>
Date: Wed, 15 Sep 2021 12:24:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210914195151.560793-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
Received: from [192.168.86.49] (98.255.111.182) by
 SJ0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:a03:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 19:24:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f807392e-3d21-4348-6bc8-08d9787e6b7b
X-MS-TrafficTypeDiagnostic: CO6PR11MB5569:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5569D9876450A3A3B0CE9EFD85DB9@CO6PR11MB5569.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LrF8+BO9UtTbsnHOGcfRXKoRAtZHE4ugh7p+kMne4IkgT9iWOWvj48JMWZIe5tXsWz3DWlWKsh2QtMG0Buj8gYmr287+YEimrPUTXQgvh4IPLMi1b6c3C4wpOy7/GmHpSxg5HiXMHqeNPltzlSGGO+k3iLatjhEYbHMBq8H0JZ+CpMcsHSE2khuvNuk4U8kYiuv3d+sGyKRoPguKI51bPvU3osNMhDnIAsJwXZ3GdDoL4C++da03Qz1NNC01E9EyGpY6pdp7W3hY9tdHUCizlNjW6EMgAPrU+UYUlY+QYZ/cd/U7YL31g+dP9AzCMvi8jRN9uvxec7zhXjAKav39GpivO/U6AVcvc1pWDXDb9jOpza1c9dEyD7rKOn2BXl+WH/VPGw9KomPvfAkkxksokuUzg/533BAaYocjeMU/4V8LkIFARCnyZUhB/fiEtvh//XOlPUa2+M7kg6vEWk6eAB3TKmGt+CincQOCNW64nEyftppA8bkvrY8u+QKA0d7HI5Jjn4pnGXFSS++nKUACAtykp9r8W3Jgi1Voamd7vKFNo2tNH3DSpwMiFYkzR9LwPgjkY8OcAjgyWDla6m2RCqBSAGepWnvLWn652Gx4B5P5tstVSrByp/hjdiT+JTRPSOlwIxim6PFwIczVDekwvaeMjInspgH3UJEdhoj7QJsDFbjAHE13sWHVhCMN0i3fj4tSZxHrREJhAvXWe0xCgKyU5TY/ZM5XzMJ7RqcH4D8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(478600001)(83380400001)(36756003)(2906002)(86362001)(31686004)(186003)(31696002)(8936002)(6666004)(8676002)(5660300002)(6486002)(956004)(26005)(107886003)(316002)(450100002)(4326008)(16576012)(54906003)(38100700002)(66476007)(66946007)(66556008)(53546011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFib2l4ZmVLOWRDajlKa1VLT0lPRXQ3Y1JKY0RWMGNHWWpFSGZHbTcvVzJm?=
 =?utf-8?B?VlVIUUFIVi9SNnozN29BNTIrZFhyaTQrTHA4UTZnSjNjeDJ3dCtJaFQ3UGw2?=
 =?utf-8?B?TWpyUDlQcVZWSHNCd2pMclE5SFBYdFkxRVVwS0NuekkwNVQwYnkwS1lRK3hk?=
 =?utf-8?B?UjV0M0tRc2hkRGoyUDFURmFZNEx2SXpUNnlwYmo3UVVNWndSTFdET3ZrSmNz?=
 =?utf-8?B?YmhuVm9UMEdpWmVXdmFMbmxadGVLdXNaU09XWmhLaEdvV0xkcmN3cU1CNjFZ?=
 =?utf-8?B?UEFyQXlPZ2xlVkNWYlZFdVhjaXdRYjNZMytMUWg1bC9DaUF0aUZyYUVBWEQx?=
 =?utf-8?B?VE16V3hTbldBUEtLM2QyQzVvNlA3cEptZEs4M3JXbm93S29uYnJkQlRDZmVr?=
 =?utf-8?B?Vi9tOEVHSDhUaTE0MXYwSHdsdG81WE9aRGxsZEdsQkxLTHhDNmZyZVZSMXRL?=
 =?utf-8?B?MWpJYURwM3NleWdPSzNSUlJyTStyVXdoWUU2dkxLbUlzTnFGUll0MytQWUhF?=
 =?utf-8?B?N3ViSnV3QTZidStieTE5YVBSdm9NR0dPK09hNEdsNTBOZmdPWDFSUHc0bG5F?=
 =?utf-8?B?eXpwUjlLRGl0REhGUllWQkkwRGs1ZWtpZDhKYkZoelVjUE9pOVlKajVwc2NE?=
 =?utf-8?B?QlR5YlpLcjhSZ0JoQ2d0OUt4VW44SmdMOWZUb3hCVFM4TCtRSlM3bVVFWis3?=
 =?utf-8?B?bk5tRFUrczB6ZTR4YXlHcVFoWEVVNFZ4RVFRWGUxUmhTQTV2UUlBcDBBSDJs?=
 =?utf-8?B?bEJQN25GV1R0QUx3NzZCSlUvM1dzSDhhSzgvdndPQmpZSk5xU0taN3REN05W?=
 =?utf-8?B?eU43SzlSeDdwMlZXM2RIbWU5OGE4am8vc2V2M0J3Tjh4L3ArRmpRMVN1c0Mx?=
 =?utf-8?B?SnR1TFVJVVAxaDZUYm9FK1dZZnJhaXhaTGFqZndqbGs1bTB5bGkwQlFJSkNn?=
 =?utf-8?B?V1FmNENPZUIvTFQwSnFxVkhocVdnQXFIYURLaTZwbTR6Z01EeUFVWjhVa1dk?=
 =?utf-8?B?NHZVL1NRWDNWRHNXdEQya2d6bzV0TTdYaFFzUjY4b0szYkVOZ2Z6RUR4L3NG?=
 =?utf-8?B?cERROERJVFh3N3RNUVBKM0tqUmJKUlZQN1R3Nmh5NS9HYVJnY2VFNDluNDA4?=
 =?utf-8?B?dmVyTmswOGoyR3JBdTM5TW00TElXUzN1NTRXWVlkYkpRTjBzekVldkNWMmZO?=
 =?utf-8?B?QXNtUmVZdkRyYmJVRWhGS3VXRmlra3Q5WnVyeThvQUZURkNRb1F3ME42MWRn?=
 =?utf-8?B?TE5ncG94Z3VMS0xwRTNKWW9YMkx1OVdtd1dBMXF0YXRpa2I2SkI0eGRHa082?=
 =?utf-8?B?N1VGODNLQnU2eVlBQ1pDWDhhSXdBSitJZ1N3QnppdUdNMVV3Q0dreFh3dUdY?=
 =?utf-8?B?bUljRlQvWHhtdlh6N3RDaFRETTJKYTZlcFlvMFNDa2RGdHk3U3laYWhBeDVq?=
 =?utf-8?B?anlINmNSK3BLekNDTEZ4UUtSRUNEOE0wNEIxZFRzMGJaVEMvWnFLRjg3ejd3?=
 =?utf-8?B?c2Q3bllPRU1NMGhHT05QdnJTQXpxNlJHNnQwSDl3QUdkR09CM3hHVFpEdGdx?=
 =?utf-8?B?UHNVdzJJMXVBdGxjeWl3MUJFM2lPSFNnWUo4SGR1R3A1N0NDdStmRWU0VTli?=
 =?utf-8?B?ODgzSVFYc210VW5SdkxGeWdMQWxYaEJySVk5TVkrK1JtL09tRzRQNHhYNmxL?=
 =?utf-8?B?V042RC9rSG9VTWdqb0dzUjR4SzZwVDM4WEg2RytwZml5RTlxLzBaREdkUFpR?=
 =?utf-8?Q?zFXI/07Is2fYPhSwN5hxF/sy8rqfp0P81RxFyZZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f807392e-3d21-4348-6bc8-08d9787e6b7b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 19:24:21.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccZfAvod1NIbFdBZd19liuxk+2WU9YU685w6xmXV+bjzLzYm4DlTt0o4fdlgPZ6e65qAbmJBaZq1jF35PWZGpm0mcXhlyLti8SQSZJEiTzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5569
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



On 9/14/2021 12:51 PM, Lucas De Marchi wrote:
> The clflush calls here aren't doing anything since we are not writting
> something and flushing the cache lines to be visible to GuC. Here the
> intention seems to be to make sure whatever GuC has written is visible
> to the CPU before we read them. However a clflush from the CPU side is
> the wrong instruction to use.
> 
>  From code inspection on the other clflush() calls in i915/gt/uc/ these
> are the only ones with this behavrior. The others are apparently making
> sure what we write is visible to GuC.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 65a3e7fdb2b2..2e996b77df80 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -108,7 +108,6 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>   
>   	GEM_BUG_ON(!slpc->vma);
>   
> -	drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
>   	data = slpc->vaddr;
>   
>   	return data->header.global_state;
> @@ -172,8 +171,6 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>   		drm_err(&i915->drm, "Failed to query task state (%pe)\n",
>   			ERR_PTR(ret));
>   
> -	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
> -

LGTM.
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   	return ret;
>   }
>   
> 
