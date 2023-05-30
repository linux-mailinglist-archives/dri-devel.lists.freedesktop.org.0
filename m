Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1F7171FD
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEEF10E448;
	Tue, 30 May 2023 23:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FCA10E008;
 Tue, 30 May 2023 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685490669; x=1717026669;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/9CEd048FuVOFMyvfWlOMO1jXU/fvz8l8A+r9FNCpC0=;
 b=dAXdj/tKcgvgskq/nM9VY9R9DPHvrDX/0ndZ9OkypVuCGUcyb38EZIDy
 Oo540A4Kh1eOs17z6fVUCppSmOxh93wo1xtv65i+t99OnZ/BZkspqBioZ
 jV85dMEoKe+Vtl3UiAaJpCZL+2ND7cBFISbpxqhstuul6wlO9vJiSbu1D
 gqddTu3pMeCfUeT8c3m5YSdQjT3wErdcdphLcEziJp3BtYVEQ1Lw9t0gs
 yPRsx4hZIoGxtFE3oVhiiVQ8/KojvK8eADibaXFhkmfro6UqGe8a0NYc8
 NV1RYOGJjM9ImPUDFJbv/5oS2wVUPUOvkkb9zFfQEPqWt8LCeWuYcrxly A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="334701158"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="334701158"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 16:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709823488"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="709823488"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 30 May 2023 16:51:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 16:51:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 16:51:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 16:51:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxx61zv/q/iCEO2HmZ7depR+pnDJb7Km1QCxX3cbaXfM9UjcPOeZb0WIvaKoJE3IHNXk1T/7/tjPO2KB51yxJhA6oqwP+vMb1NIV15p20iUQQw6u/Q/9+LahlCkbV3k9No/MXOGLSaAnWh6uNOK2pWW+QATq+9nd/bqbSXrj3YXTFyZMpbrBd1lMC/tgIcBvrcJV5kFKhpMdgs9gufFmlx4cswz5+BAl6mDmGsFYvn75FM4+u/Ve+Epawg+pbHIkFrgePhg8yLF4QgWTJH07J4qBf2EO1Jqw2iRJ5KKA7v4tskyrzszFFrdA0UecDQp1wZF7Ov1XXA5EAhkaa27dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rSO5mkTpYP0ktc0SYl5ONmGnA0ey3gwhpmAZv8giio=;
 b=gK2BEXg+BzYXUQ+J9rNob23mxbtGajNPxiuo4bj2LjkGA3VJs+b0IfusQJzUDL4wcya6bEH/p2dqNwuN6dog7PbizVBd/PXBkEaROhNengv2t2GAsTbWUXatxp0ffB+YNQjn8nD2iDWXl4w//UMf6ASLFlb9CXGZbCg2J4RBuC+LP9AMa0HOZuBeMzxYojlyFvqYqDGkWzZn47AcyuXAlrlPHpr2BQN/nYThmY5/xK0i1fW3J92fufzrDF2NLHGzCdsQNJ3D5Qyet9nJB96csq4QA4wYjX8keRLqPphe0736Iz+95OysDeG7sN9+zvR7UAWX0zNfc53uBLcZ4B6jKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Tue, 30 May
 2023 23:51:06 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 23:51:06 +0000
Message-ID: <2dffc6ef-5981-8b6d-c580-44671d396c98@intel.com>
Date: Tue, 30 May 2023 16:51:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if
 the fuse says so
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230527005242.1346093-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: a90486c5-59ec-4422-6d16-08db6168bb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m4A5Tk770z2L+diq8wpRXpDet9hSBXWISQERBJfuy3wBybl0CuY25uT9o8t8LHNNlNvs6BbIPTiD+J04/alZWzeCduds+aAlFIgAnsPil+XDk1koxyYEr6k9ho7H7t7fePvKVXtbt8RPAWCgZ41YU3oE5x9itPvpaixH0oTK+m3FFMAVlgJAVK2jvg2iCG+W/VlVdwhLPrOWdn27/nZGnrZCcvksK4+QUHzYFDqAZ9a0qIIdznjgxBPCR1QZ3N0rapNgYJxD2gUFlZcwu7tXTaFzcPB7RAgKqFmkvUcuRcXoti5QdMx7yOREnouyPdOrW3aIh/8V7NNvG+xA9gcg6HSPSAlwoEbVqoOpJRbfigvZrmG/WUQj4YNum+K/Zp7EIcIZnMKkxP/Qld3mb4m0dbI8O1iI77IL3QdLUamKC7wx+gZSE0wcrCCA+vHIfL4koqOuSq4tvGylhKgtqFUgM03mW2cN35ebf2db9Ye4JC54Zfieb/Y/FADkeFZGq58JN12P05AZMtZ9LGi3I7AFtRc7YKmrEnCcbuUHmrsVdRX01cdtSod5Bem2xwkayKVQuOeUWY+4y+tLYbPID3aGuDdeXDWBeQu7xI1JRel3qgI2F9j+ueDfAL/R2T2GRtzZ4aDyYnbf2wvo22GJFwEdeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(6512007)(6506007)(316002)(53546011)(186003)(6486002)(8676002)(8936002)(41300700001)(107886003)(6666004)(82960400001)(26005)(5660300002)(83380400001)(36756003)(38100700002)(31686004)(4326008)(66556008)(66946007)(66476007)(31696002)(2616005)(2906002)(86362001)(450100002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlmYUdzR2xERnU1NldsOEFpOXRnejBNQURBVzNKWUR1dDFrOE8xcWowdUpZ?=
 =?utf-8?B?SFRWVDJRTFE0ODVGdkIxdXNiNjZ5dXpUMHBZY0NUQmdSNFBSZ2t1ZEhDQjVJ?=
 =?utf-8?B?cjBFU3pRdGFleXhCN2l2eTBkeFowblY2MmxaUnhOT1ZydHBnQTE1OTRWc1Rm?=
 =?utf-8?B?Y2RucGc1NUM0S2pUaEpuaTVTUmtMcWlxdU1Jb21sUDBnKzR3bVcxbVdzamR4?=
 =?utf-8?B?eUF0TWJhSGsyK0VmUjZmSEdnTnJraGs0ZTk3UGZNT3dhZURod2NIVG81SmJL?=
 =?utf-8?B?Z2VTY1NFT2tyRWpYQ3Jid3NlSnhEYnZ4STF3R2VOYVR6dVQyUmdiVUNZSmxJ?=
 =?utf-8?B?VkdZUVp4clhCdjRlZFl4eUZrQWNlOUt5RHJhM1czZXRZSUtNdFovb29FSWZC?=
 =?utf-8?B?TE9DQ25oVjE0OExBS1VDWUl0MFlCM0xsaG1RdjNjbjcrM01VbHd2dTg2Qi9G?=
 =?utf-8?B?QnQvb2Z1RWoxYytOZGxneThETEJrZjBpSWxhSXQwYTZ3NzAxVndtaE03bnJx?=
 =?utf-8?B?UW92SXRreFR2QkF0WlU2R0pDT2dJS3JFRHlGRTNMVDFJM21RalNjZUtKR3Z1?=
 =?utf-8?B?MnVVdWF3ajN6QVZGNk9GdTdNS3RYb0VxanVHM1dEY2xTZWYybDREZ3N5UUtn?=
 =?utf-8?B?ZStwSytTNllBU00wRGxmSmJ0TnlPRFo2dFlPWlYwZ2NEVFhzOXAvaWxXdytw?=
 =?utf-8?B?cTRweHRha2NFUlQxaHVsRENMdlNwdkVHVjI5Z1I5dGhYRG1PaVdzdXY3QVlG?=
 =?utf-8?B?a0FmbUZKRXE2VHJHQ3Z4bnJxSTZnVDNQUThnVUVONkJueHZkK1pnU3JrZlpS?=
 =?utf-8?B?OVc5UkxVTllVWGZEM09EYmRYWUJRdUlKbEk3S1NJcFk1RnBhS1R6bWVrdVNY?=
 =?utf-8?B?Q0lVTDFOUnpoYW0rNEg4cXlnQTdkcUtpVEFIVnE0UjQzeW9EU2l3TDJlYnZG?=
 =?utf-8?B?NURUUjVMZ1c5QkxGOXZwKzVUMnY2RzdlcXFOTXg1dnJBTkZEdUJaWkdhQW8r?=
 =?utf-8?B?eW84bnpGaU5MY2pzaytGL2hYUHZSTXo2UkgvcC92RVMrcG56QTFZNVhUS1dK?=
 =?utf-8?B?Y04rOFlxczZ6YkZPM0luQ3J4eHQ2NUNDTmdIaUFzQklwMUNtQTJRbzdFNFlS?=
 =?utf-8?B?bEc0TTYwUzh5d0MzSW5ZMlVvTk55Rk9wMW40WnkxbHIyUHVuZ3FTK1hROVdX?=
 =?utf-8?B?cXZnVkczWFpPbG1RVkVvZzZkM3BIL25tSk0yN0VxWDMzdEN3M2VBb1JCdUlT?=
 =?utf-8?B?cDdPS1VIVERKT3B5VHNaQXA4TjEzZWYvUGdNMDRzV3RCdWY3QUNrLzFxQ0Vw?=
 =?utf-8?B?S3pXU0hIbTdIWTRnbUV1b0wzSUU5alFqNkZmMzVaZWVzYi91VWFEY2ZYNDg4?=
 =?utf-8?B?S211WldGbThxRFptQkJDa0pyci9tTEQ2aGE0K0lXdlpvaStYRTN6U3VBa0tS?=
 =?utf-8?B?Q2dESUFENkVENmVQTFJjTzJCaFJRZytqd2pVMFZSaUU3eFlkMW1nYXgxdXFE?=
 =?utf-8?B?TXU0YzZ3aUxmMlRiWExBUDFNQi9tZi90S0ZmbkVGZWdpK1hTcFB3cS9HNjdJ?=
 =?utf-8?B?aHVLRGNSNDhsZnIvTVpmNkdXWVI4ODhia2tLSjRneVhtZDhHTVRmR3ZLQWl3?=
 =?utf-8?B?QlVSSk1lNlRIVnUwY3hrQ05OWWxaQ0JPdkFlOGd3c2RNdWxLNytNRlp1NE1v?=
 =?utf-8?B?Q3BJRVNLWFdaUVZrSGxBeGJ3V3hvV3hpRUtJek94aFhoSlNib1gxNWQrMTJy?=
 =?utf-8?B?dC9pQkRBYUtDbWdESkQ1L3NQQzJBbUVSeG0vV0VJZGc0dTNlaWxsa3Z2dkRz?=
 =?utf-8?B?UFVhVllSUXBIblZJSEl2VVZXWkphVFh0R0wxVzN0Z3hPd0xiT1ljWDg1c2Yz?=
 =?utf-8?B?UVYzcWE4Vkt3Nk1RcjBXdVFRMGJuU0lrbHc5VU1MTDVsbVZuMW1qSWllSlhr?=
 =?utf-8?B?Q1dFbmNta2RLcDJKalgzMDIyVU56Ynk2TGRTdFVnN1kwaVpNNUZYNUQ1N2sy?=
 =?utf-8?B?Q1E2WW9iT1RySWF6ekE5d2t1aE9KVitmU3ZiWXp4ak9SMHh6YmJIazQ5bkNV?=
 =?utf-8?B?UmNOR2xOMEFGbDJFMEZaOUExT3RmOVNESWxxYzJUblFtU083S0RxZnkrN0Y3?=
 =?utf-8?B?dy8xWi9oanJ5VDNQRitURFdiaHl0Nit5MCtILzc1VG5VME9MMTVteDZIejZp?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a90486c5-59ec-4422-6d16-08db6168bb81
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 23:51:05.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifThutA2hT6W5v3gHuxN3rlXdBodvZlSOPMoHcInur7jwVkJJgKpnHIB/TkRo4lJRrdGOWWi43sjSt9hbbbxxAJYe6x1eIpGrEFx6PSM90w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
> In the previous patch we extracted the offset of the legacy-style HuC
> binary located within the GSC-enabled blob, so now we can use that to
> load the HuC via DMA if the fuse is set that way.
> Note that we now need to differentiate between "GSC-enabled binary" and
> "loaded by GSC", so the former case has been renamed to "has GSC headers"
> for clarity, while the latter is now based on the fuse instead of the
> binary format. This way, all the legacy load paths are automatically
> taken (including the auth by GuC) without having to implement further
> code changes.
>
> v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 29 ++++++++++++++---------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>   5 files changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 6d795438b3e4..37c6a8ca5c71 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
>   static int check_huc_loading_mode(struct intel_huc *huc)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
> -	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
> -	bool hw_uses_gsc = false;
> +	bool gsc_enabled = huc->fw.has_gsc_headers;
>   
>   	/*
>   	 * The fuse for HuC load via GSC is only valid on platforms that have
>   	 * GuC deprivilege.
>   	 */
>   	if (HAS_GUC_DEPRIVILEGE(gt->i915))
> -		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> -			      GSC_LOADS_HUC;
> +		huc->loaded_via_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> +				      GSC_LOADS_HUC;
>   
> -	if (fw_needs_gsc != hw_uses_gsc) {
> -		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
> -			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
> +	if (huc->loaded_via_gsc && !gsc_enabled) {
> +		huc_err(huc, "HW requires a GSC-enabled blob, but we found a legacy one\n");
>   		return -ENOEXEC;
>   	}
>   
> -	/* make sure we can access the GSC via the mei driver if we need it */
> +	/*
> +	 * Newer GSC_enabled blobs contain the old FW structure inside. If we
> +	 * found that, we can use it to load the legacy way.
> +	 */
> +	if (!huc->loaded_via_gsc && gsc_enabled && !huc->fw.dma_start_offset) {
> +		huc_err(huc,"HW in DMA mode, but we have an incompatible GSC-enabled blob\n");
> +		return -ENOEXEC;
> +	}
The comment above doesn't seem to match the check. The comment says 'we 
can load the old way if possible' whereas the check is more 'can we load 
the old way if we need to'.

> +
> +	/* make sure we can access the GSC if we need it */
>   	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
> -	    fw_needs_gsc) {
> -		huc_info(huc, "can't load due to missing MEI modules\n");
> +	    !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
This test still looks wrong when you read it. I think it needs a more 
detailed comment. Some kind of explanation that the modules only apply 
to one platform and the engine to a different platform. Or even breaking 
into two separate tests with an 'if(DG2)' between them? It certainly 
confuses me every time I look at it.

John.

> +		huc_info(huc, "can't load due to missing mei modules or GSCCS\n");
>   		return -EIO;
>   	}
>   
> -	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
> +	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(huc->loaded_via_gsc));
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 0789184d81a2..112f0dce4702 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -39,6 +39,8 @@ struct intel_huc {
>   		struct notifier_block nb;
>   		enum intel_huc_delayed_load_status status;
>   	} delayed_load;
> +
> +	bool loaded_via_gsc;
>   };
>   
>   int intel_huc_sanitize(struct intel_huc *huc);
> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
>   
>   static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   {
> -	return huc->fw.loaded_via_gsc;
> +	return huc->loaded_via_gsc;
>   }
>   
>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 037d2ad4879d..3355dc1e2bc6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
>   	size_t min_size = sizeof(*header);
>   	int i;
>   
> -	if (!huc_fw->loaded_via_gsc) {
> +	if (!huc_fw->has_gsc_headers) {
>   		huc_err(huc, "Invalid FW type GSC header parsing!\n");
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 9ced8dbf1253..b752a7f1ed99 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -186,7 +186,7 @@ struct __packed uc_fw_blob {
>   	u8 major;
>   	u8 minor;
>   	u8 patch;
> -	bool loaded_via_gsc;
> +	bool has_gsc_headers;
>   };
>   
>   #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -197,7 +197,7 @@ struct __packed uc_fw_blob {
>   
>   #define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> -	  .legacy = false, .loaded_via_gsc = gsc_ }
> +	  .legacy = false, .has_gsc_headers = gsc_ }
>   
>   #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -310,7 +310,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.ver.major = blob->major;
>   		uc_fw->file_wanted.ver.minor = blob->minor;
>   		uc_fw->file_wanted.ver.patch = blob->patch;
> -		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
> +		uc_fw->has_gsc_headers = blob->has_gsc_headers;
>   		found = true;
>   		break;
>   	}
> @@ -736,7 +736,7 @@ static int check_fw_header(struct intel_gt *gt,
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>   		return 0;
>   
> -	if (uc_fw->loaded_via_gsc)
> +	if (uc_fw->has_gsc_headers)
>   		err = check_gsc_manifest(gt, fw, uc_fw);
>   	else
>   		err = check_ccs_header(gt, fw, uc_fw);
> @@ -998,7 +998,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>   
>   	/* Set the source address for the uCode */
> -	offset = uc_fw->vma_res.start;
> +	offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
>   	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
> @@ -1237,7 +1237,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>   {
>   	struct intel_memory_region *mr = uc_fw->obj->mm.region;
>   	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
> -	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
> +	u32 offset = uc_fw->dma_start_offset + sizeof(struct uc_css_header) + uc_fw->ucode_size;
>   	struct sgt_iter iter;
>   	size_t count = 0;
>   	int idx;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index b3daba9526eb..054f02811971 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -120,7 +120,7 @@ struct intel_uc_fw {
>   
>   	u32 dma_start_offset;
>   
> -	bool loaded_via_gsc;
> +	bool has_gsc_headers;
>   };
>   
>   /*

