Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0EE6F2192
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4287710EE15;
	Sat, 29 Apr 2023 00:19:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBC110E126;
 Sat, 29 Apr 2023 00:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682727557; x=1714263557;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eijGkJ45++WtipOWoVwjurgasXt9I70CHcTcy32VcJU=;
 b=fT1ItvtwbvnnRagI+T4/ot9E6I5dfJVPr8QrCZ+V4YfUsQQxSVkD3B8n
 FH/uiMFJ8vCUAzi6Ai6J5fW9YQ+jm/90c8GygsOJiE+Zhjs6Fe+4Ogb0O
 iyb6lJIIlImYb/7NPlkO6t0I/qumBG4o157yCNva/Odr9FJ0mmfvKhqw9
 Iz3SNof8J7pAUKPbVB5M6dItm52Dd0uQY6aDHQOGA+PdEeOgQhQHytKU2
 kraNYJbj6KZW9zHFAoXwWeuEBiMzeVVZ9TfVRCYzN26y8WT5GEiE1IeYj
 AJdTKK2Y5iJLhBVQed5Hqux3quSFOHPm/UGFy0s5UAVfbpp2T0Yy8Na2D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349918520"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="349918520"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="689043242"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="689043242"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 28 Apr 2023 17:19:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:19:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:19:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:19:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmnWaEffdjPwIl5EzzbhZFSHcK5IRIFEdMmLLXF5dKM5l6bFIbPUnpjthllNCh6hZzcqbvo2v7BWT6u/0LrnWzfQte5s1Xd+YXMUweF9bYaWtibX6fDr6wWS2ucfiliLrgFYn9Y5C8hebAmJYov/ZYXco/mulFkV7pltAXdX1aNQ+Av9lNSqXPHHh7irzcZCcXVPlYLHJL6fRKZ7btZqObF0/90UgASFXqbFBJvwE2umxabIHAz21VVI/HF2uDnAZ3RexVQzxnnFur9+NcSB8fqCKf/Joy5sbr9epgcR5JRtZhspEZ7O5jfU/f/XnjL1cTa+/y6/wD7MgL+zLJxB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYeV/v88vN1j8lM8v0btiPg/Zu5S2/dTuamtvHp6SEM=;
 b=XU6ACkCQtlbtrVIEO+wrcSt3xsbr66yiHsH+ADF/m3oyonU9uFbefbt9AF/s0Fk1ILmHWcxkMtHX2D55dc5nPoWwukDA3bl6Uj/aR+i1EJEWkX4JwSNCIhj98FBw2unzIKwj5mIyRIjKb+REPMl7wFllXLKJcG9k0pLmkaR3fT0G7XqgiRRebW1rych5cRcG/lquXeMm3wzSjxt7gVMcuQ3oG2RE3mpXA6HrAM34zOlHoEzKf6yWROoaL9tBLEjkfO0eMhgsg9BWsvVrnrUgtESuPMUHrig6gilrnoWOhN/CNQqyPh/nwEek0Y573IU1/fgRYin6WnVYjPtylsN1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Sat, 29 Apr
 2023 00:19:05 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Sat, 29 Apr 2023
 00:19:05 +0000
Message-ID: <028db79a-cb8e-ef27-8ad0-0c1b3c15ef17@intel.com>
Date: Fri, 28 Apr 2023 17:19:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/uc: Make unexpected firmware
 versions an error in debug builds
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-7-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230421011525.3282664-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be2ea2e-1457-4ed0-7f44-08db4847572e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZVP73YfnYyr8sYlCGAFglWvPjSZPcmIGiZkmo4veMOArH2Jttug1ejciqd/H747tinx3bd6FHPIZVBFJb3EEpwpVMQfQMP89leoDWW4VrXwhA3cnnfRqFGNoLcFcwhVLKObVLRE7dV7L9f5ft6EZg6uoCWPMpQIl75OE1+79xJqjsHi6eSPm3hmQPpuGEv9NddATvgJlmU/VvPo1QNgSi4Ma75Ib+dLE8FLJaUoodW1cjr0wew1c+WkuX+Q8dkHuv4k3vXDXY4vrczL0apJVMGUKF4JZ+HqOre8y3hIPQDa0/AEXYCC1A/RzoGrRkVuWMCHO89ZFAOVA0J8fMNYs0lb2pkPKsWeFNKfjsYAhx4YobZvwOSkaRm+5z0/0MAgpOwBH+MKuYdf1xIbQbYX4bEcp44RKqvAv8fFDn1irYKC+vft/UjHt+xzd3Ui5IwlTCW7QKRDE8oObqgJAWUWvIJDtznwKs2X9Qfr7zdYn72IBnS4xWMUS8YGV6EIs2YNgq4LIOpadnJbIhelBMjKpYDBDlHFaOYamvnpdQtM3qJVhGfm63BruE7JbdLfOge1NW+rhhavq2F2SEXx7dA9fbQ39NRaHwtMblLsizkmQXGnvnvOUHyx5q1fgjegrzWFjPVRBsvWVPjzld4LoCrqFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(86362001)(53546011)(41300700001)(26005)(66899021)(6506007)(6512007)(2906002)(5660300002)(8676002)(8936002)(36756003)(31696002)(83380400001)(478600001)(38100700002)(6486002)(186003)(4326008)(6666004)(31686004)(82960400001)(66556008)(66476007)(316002)(2616005)(66946007)(450100002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpIY2ZGV1c1blJVWXY5NnluR2VsODFseFRMZVlsY1BPOFJpR3VxN1hFN0w3?=
 =?utf-8?B?dDZIZmtHQTFLcjl4bWFSWFU4SzdHUUkxODJ3R3czV3hxNWFQVkFNaktzQWZ4?=
 =?utf-8?B?T1plS1VKWGNzS2I3RFdla3k4dGhnUExKNEZGK2JKMGZpYlpocDdjaWMzREVX?=
 =?utf-8?B?UHJOWWh3RU1VSHJUR055U0M5eFBXV1RWSlp5aUFNN0FsM25ycmxWUjJSMDVI?=
 =?utf-8?B?WXovczVrOVpyb3l4THc4MkFKR2FSVTJraEozcmZEcU51S3ozUjBnVnkwNjZD?=
 =?utf-8?B?MnN0ZW5oTnNUL2orVVQ4N2lSaytnSDlxUzM2dUxrRjdsNy8yQVdOTGJjcVdq?=
 =?utf-8?B?WWdJb2ZPSFkrVE0xOXFrUC9xYTBHK3VXNXcyVVlCeXBEZTBJQmUwQkkyay9K?=
 =?utf-8?B?d05PYnFid0QvQWRTS2dGVkF5Z0NvZmlVcSt3WERxcmNuVWxpaDZOQUkraU4y?=
 =?utf-8?B?UGNDdjMxS3dwbmNnL3ppZzA5NHkvWFk2RzJDdWVPN2VuTzVETDgvN3lQRWtk?=
 =?utf-8?B?MUlOODNlNWU0MDVNaEEvN2RPOEZFenVvRkpIbm0xZWdpM2pzbkR3emxHRFpF?=
 =?utf-8?B?eSs4WmNTSUUzRXBrN0dCU2MrT1NraWZCYzZGNE1ldEhZRWVPK0ZxQ2VpekE3?=
 =?utf-8?B?eFFCM3JxYnVxYXJjbm1jZkZ6QXdnV28xR0cxc1dFODV2Y2xkK0ZDRklraWdK?=
 =?utf-8?B?NnM5cTZJYlFCZjVoZHZWMlJjVHZRSEhXaHY1R203dGl0QTV6eVg4ZTRKaUpi?=
 =?utf-8?B?MmZOMitXcHhoRDdhd2JjZm5CNTRkM1M2MjBlNjVPYlQ4aUNlbkxxTnY5aTR5?=
 =?utf-8?B?SEl3bnJFL0theVNQN2VyOFVDekJ2cHUrS2FsNVd5c2NsblZnZzc3SFhrcnlI?=
 =?utf-8?B?UlRGMTlXQVpwdHlQRDl5RmY3bCszYUY4UEhldGQvS1RDWHdTamdhb1pRdkNN?=
 =?utf-8?B?cFFpcWtrVnp2WDNMd2hQb1EzNWpMRHBLR1ZITDZJcVBqMVRWY0NWaWpjQVBT?=
 =?utf-8?B?a2ZvSXdWL1dWcFE3Q3o2eFFMYlFTL0xwdG5NWGU0NjV4WU5leU1XWkk2bzVn?=
 =?utf-8?B?RmFUTytDK0pSZjR0U3QwbWN5bHNYbXFzekF1T2t0QTU3NUNjbEx2R2NWL004?=
 =?utf-8?B?MXNqV2dQaUtxeUtjMWY4YnZ2K2pVVDhnY0l5cVM3ZVlYeW92UTAraklSQldN?=
 =?utf-8?B?N2FOV21iZjRHMG5ZcFJENDBDalY3T0NWVXczcy95TlpxZnRDSEdtZ0tBZGlE?=
 =?utf-8?B?TmZIdHNYYnNRTGhGMU8yNERkS1B5ZS9Pd0ViV2lWdEhCdmp1R1J0b1dHWXY0?=
 =?utf-8?B?c29YQlBIUmRBeXlNSVlxcVZsRUdCYkVCakJqejVmT1l3dHZvbnM5MDZTVEFZ?=
 =?utf-8?B?MmxzY3krSHhaQnByMmhMYWdXZ2Y4V3RpQ0lucllVOHlndzlLTkQ4TVdjR1Br?=
 =?utf-8?B?YU9UYi83VzRkZDg4cHNBRkdJaitWZ2cyYUR2SFcreTlQQ1BMK0QxMVcxZVlY?=
 =?utf-8?B?NGhNSDl0Unk5SGVuT3duMDExMUQxWmlJamhnTU5VaFYwUmtSV2JtcTJQTVpT?=
 =?utf-8?B?N3hyZVh3MWNrdGpwdksrd1UrY3JzakZWdGpFQjhVWHNFRWxNdE9IaVhEcDJl?=
 =?utf-8?B?S05CVW50Rkx4MUdNaVVaV0I2UktOZTFwYUxuY2VvY0FPMFVOam91Qk9Ta0VE?=
 =?utf-8?B?cFIxT3pXYXRvV2NsT0Z1dW1OUENiTTNueFlUWkdPU25udHpuSFdEQlFlUm9u?=
 =?utf-8?B?a1FaYUV4L2x3dDdFbldRMnNhN0dBSEtNSVpzMW92dmh2NmE2cG04RXVvT2Yv?=
 =?utf-8?B?V3pxT1psUSszUlB4eVZrOUlPM1VBeElzZWo1YlJUKzVUcTg1UC9IVEZkcmQr?=
 =?utf-8?B?dlRwcEJ3TEZTanNXTmw4SXJzeHBsNk9rZlBHNDFJclZvdVpsZzY2aXdMeFRU?=
 =?utf-8?B?cW4ycTNhQk1yemZVQ1pWNE8rekYxd3BIckQyM0gxS2pWclBRdERSbHBpSjJo?=
 =?utf-8?B?WWRsVlRadmhvK2FqK1d6OWFKKzhPSEN3TjFTZE90UWxlOGdscVhabzQrNjZG?=
 =?utf-8?B?UFB1QUo4RFVmUTUvb1RORzVWbVBucVpjNFBVeUwrWkEvMGdDckVORkxuR3JE?=
 =?utf-8?B?aHh4VEU4SGxmaUxsRm9zZ0p4aE8yRjloc0c5b2dSVU5CbEFibTNnQ3VMU3RC?=
 =?utf-8?Q?4rn5oX2UdNIZV7GbJovzaVw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be2ea2e-1457-4ed0-7f44-08db4847572e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:19:04.7677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxaiZngaBaac7UE678CDnb7k1Jj1lpiC2mMOI9lXBwY8DiDY8p4G3uvfiFiqHqDg8bYmQNVu5Pa/K17ceBFWUkHDf+UYghnlNs6TR43Jakg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
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



On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If the DEBUG_GEM config option is set then escalate the 'unexpected
> firmware version' message from a notice to an error. This will ensure
> that the CI system treats such occurences as a failure and logs a bug
> about it (or fails the pre-merge testing).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 34 ++++++++++++++----------
>   1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index bc4011d55667c..c5b21d17ca437 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -17,6 +17,12 @@
>   #include "i915_drv.h"
>   #include "i915_reg.h"
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +#define UNEXPECTED	gt_err
> +#else
> +#define UNEXPECTED	gt_notice

I tried to find an alternative word that had the same number of 
characters as "gt_notice" so that we could avoid the indent in the diff, 
but nothing came to mind, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +#endif
> +
>   static inline struct intel_gt *
>   ____uc_fw_to_gt(struct intel_uc_fw *uc_fw, enum intel_uc_fw_type type)
>   {
> @@ -828,10 +834,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
>   		/* Check the file's major version was as it claimed */
>   		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
> -			gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
> -				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -				  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
> -				  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
> +			UNEXPECTED(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
> +				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> +				   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
> +				   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
>   			if (!intel_uc_fw_is_overridden(uc_fw)) {
>   				err = -ENOEXEC;
>   				goto fail;
> @@ -849,16 +855,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   		/* Preserve the version that was really wanted */
>   		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
>   
> -		gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
> -			  intel_uc_fw_type_repr(uc_fw->type),
> -			  uc_fw->file_wanted.path,
> -			  uc_fw->file_wanted.ver.major,
> -			  uc_fw->file_wanted.ver.minor,
> -			  uc_fw->file_wanted.ver.patch,
> -			  uc_fw->file_selected.path,
> -			  uc_fw->file_selected.ver.major,
> -			  uc_fw->file_selected.ver.minor,
> -			  uc_fw->file_selected.ver.patch);
> +		UNEXPECTED(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
> +			   intel_uc_fw_type_repr(uc_fw->type),
> +			   uc_fw->file_wanted.path,
> +			   uc_fw->file_wanted.ver.major,
> +			   uc_fw->file_wanted.ver.minor,
> +			   uc_fw->file_wanted.ver.patch,
> +			   uc_fw->file_selected.path,
> +			   uc_fw->file_selected.ver.major,
> +			   uc_fw->file_selected.ver.minor,
> +			   uc_fw->file_selected.ver.patch);
>   		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			INTEL_UC_FIRMWARE_URL);
>   	}

