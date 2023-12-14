Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91285812915
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 08:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ED810E8E4;
	Thu, 14 Dec 2023 07:27:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46B10E8D5;
 Thu, 14 Dec 2023 07:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702538874; x=1734074874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=McGcqosdm+quR+LMFxAcF1Za+3Ka1TpreTreB0kGNOU=;
 b=HCP4J0QAl9VLvwLqRvYY/1xDkRAOBIPVk9jp0J7o3u/dtzU+IrtRbOvE
 z13oibfNsMPLN23OikuO4aschluCtsjIUAXCF4HGRVW5a+OSkPInB9WkU
 rgL86r/YWafunkEecGzA7dR9UGzrij26/PpLke6KKt+Nfz0Xa+foDtnDV
 wzu+f5sGURtQdQ0oImHJkB5FEcquWi+qCB4mA0yt/sUbecswG0BU3M5bs
 khbPOUpuqhQhzDxeh90pv4eb8czkgWZ+dtiLkTOznA6yYB0P0pMpydHUG
 pZ8cKb0qwoLZ87KrToe6xBVeBeoWSghtE3l4LanEgYApsGXg5Ib3m8A4x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2235665"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="2235665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 23:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="15736796"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 23:27:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 23:27:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 23:27:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 23:27:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 23:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/NdnBxQVDrIsphQiZPTBAvnytMKOgv9aPaAZsKYlylCnUN7GTGwzb8XIpll/aez170kHFTwuIYmYPFn/Fx6vPXNHQ9srrE440G2hYhqD7DzTM4XdUmcTmNqTpWSqitXXmTYocCcbjyVfNlueUsZZ3xM4lPCn90W5+tnD1OHJatfa/C8g0RWs/BkA2vN9kJXizZYffo0GxN0Coam2yb7AMo8sS8UoFgQWoCttZR1soHkr3pX5qKoyqVbMABTv1mkZ3f5Mu3PJnA8e5Q/pNKyCuJ6Sd8gqLf7PmsPO/YdNFGa55AJgwmI/IfcCIELpJ/GyTZasZP4jYXiMJMd54cjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeS/yboyj9Z6olxAPGr5sNoKgB9BfUa8HCHQZVBsFqc=;
 b=lP/QrsBQic33/KnjdgLEpFIZprUOi023W0oF7BmR/AyC9JrDYp/S+5D63XvNhkI8uBtrkPlLAswXULte4uIEOmwQPovf1a2WnveHFe1i8IgzsXgKIvdA49xIFihj+kZz4pnXgkX6k6fJGZD9He+Rv0QGme7g15ZDKt1eldraPDT7ScAPk3EUIso+sNXuNLCUtHS0pgqchzdXHnf2ZbQ7SACHbVqTFd3N1Qs44ilxCmPh1yp7Bdl1FnfRnMf4bj/XESraP8DNPuHQOrpQVdvBxZAhZj1V7+XeGyohgvJxTteUqY3Ial0Sk0subYZm7svvVXZ9zVoOLdNr4dtr/bKbqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 07:27:50 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 07:27:50 +0000
Message-ID: <938c222b-843d-4891-9c94-f66d966b0e8f@intel.com>
Date: Wed, 13 Dec 2023 23:27:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v2 2/4] drm/i915/guc: Add support for w/a KLVs
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
 <20231027211814.2696398-3-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20231027211814.2696398-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fbd6e0-c3c3-4e1e-671f-08dbfc762d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXP/MofQ5fUPQW34VNhzHpfH7SflIFaeaDSYXN3za5e+urCY29I4/23nfG/bicX0vHIREG40dUUvTMPhrf1+RiKhK/Vg/5qjkwNiiU0jrw5y4gKXcsFxLnJoc2gdn0TDER96TIPsWOm7AcbIevlwrjCoLFZKwumnRj0CjQP9/cO9rfHO1cv02lyD5W3Jz/RuVGfb4+MsTi30wa7AxvywS39Y2MG/lgEtzTRXeH4Ivez3ZIuFA3SAWdmJpIw5t2hR2fZIJhGQ5L9O+4whVB2pxJeLbX8VhdtYiWO6yp2LDal8kW1Jp/01kjLRVzsA8+sbdu87HjwI9JBP2wj78VzRAiW3LHfdki3tcXhQKdaoQocEAaxsZ+UNTxktYjkNAPlefByWRKEmxdNXNB2cIJGM6GL1Ni9jTkh5aq1Qk/lSnctwWtgVDXEP7DzpbtaHLI5fm3YLWsIKEOQ6rQ6EzKNfiBBagUd6LYGaGy9Xj0W1NLZmOdmlcsSy9UJYzx8rFKLGfT4StVj8Og7iggSfj6BAPYnnFLmk7mTehhMN5xR1cZ1FW0AQUVbHKvULV4ayCO+cGVwrX7YRotrOJIcMr3DJpVUoIy1B54mATu+4AVYgDIQ6kHZV2Rmul2J5TiY0ccDl8dti7DcT3xrwHFAZpirPUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(4326008)(8936002)(8676002)(450100002)(82960400001)(38100700002)(36756003)(5660300002)(2906002)(6486002)(478600001)(2616005)(26005)(6506007)(53546011)(31696002)(6666004)(6512007)(86362001)(31686004)(41300700001)(316002)(66476007)(66556008)(66946007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkppY3MzdENkMzVFRit2elp5VW1LREp2UzJ4bTNCT1JKampSTEVuWFFoSG5V?=
 =?utf-8?B?N3Q1Y0F6cWpvUFBvYkx5aS9yNlNGbDZ4NUgwa2lNR1dCNUs5V2hvdSszM0dL?=
 =?utf-8?B?bjNmMzRSMk01Yk9DSXhRbnN0TnVzbURjOWY1NGVzT3dnQnQwUFBTUXFrSFpG?=
 =?utf-8?B?MldsQ2NrVk1zalJEVkFzckFjUDJLTlV0cjA1c1h5V3pxYW9IUmtCVzRmcjg1?=
 =?utf-8?B?V1FlcmVXeHNHLzNvaU5XQTl1QUxDdEt1TkVtclBPOWFZdDBoYXJBTGZ1cWhi?=
 =?utf-8?B?Mkh4UDBYeUd0YktQU09tQ2xUYVcrbmxQVEM1OC9vTVphbHBGRHBYL3dKbXJ0?=
 =?utf-8?B?eGxZTHlrbHNzcVhCVDUvSlRxUktzbC9QbmNPN1VHWVlFbUNVNUNwRXJ0RmFm?=
 =?utf-8?B?T3E1U3BXMUgyQkMvZWN1bWpnN2l0NnhKZSt0MjI5cVBTTTdaUlJRUDBkSVd6?=
 =?utf-8?B?MFhsdE1zS0tRaUR5WEREbTRpbmtQV3VZQ2grR0FhRXMxUHlKNFpVZDdwTEJL?=
 =?utf-8?B?K0x0TmhrQ0ZWQTBicEMwZWF6T0x4VjFHenJHeGE1emNiVmFyZWZXdWRTeVhD?=
 =?utf-8?B?ZTYrMzk0MkRSQ0tQVzRzOEM1TXdiN0g2YXBjemNndDR3S1V2bTBRSlI3MnM5?=
 =?utf-8?B?SlVWOVJtZnc1R0RyTVZlRXV0VjFybm9oWVBUSm5RaFpTeFMzL0syYzd0dWRE?=
 =?utf-8?B?ZytoVHVyRGtueHR2L05HSGoxaWFpZmRVU2k3NUpLeGhDRXQxeHJESWRkSWxS?=
 =?utf-8?B?ZEpOU0VMaHorNVpkenFOMy83QXA0elRibW50cUt3amliMXdWRGcvZ0c1c1cy?=
 =?utf-8?B?WjFhb0pLTG5yNTAxb2YrQ3RjcUtwTGtudkVMOHpUVnFKTENHclpZdGtGcHJG?=
 =?utf-8?B?RFUzdEk2TzQzYjc0ME5VNW9SaUd5YWtZSWRVTTNFZ0lzMkR6K2F6eXdXT2Nh?=
 =?utf-8?B?V3R3b1FCWCtxV3N5ZU9JK0EweXQ0TmFSZGFKRzV3Vk1rL20wZ2hsREJQOGFH?=
 =?utf-8?B?R0FJTGw2Ykt2SlNoZnJjRHZPZmowOGp3M1dVL25hWXhzUEpkZlNrdiszaXAv?=
 =?utf-8?B?M2FiWjJXN2liUFNkOWF4Wjk2UWNWVndzKzFINjR6TkNhUWtwWm56WldGMlJ4?=
 =?utf-8?B?NlJwZjU1NlJxcDBiK3ljSDBIYUQwdW1XZ1VJMWFkdWZVbHJENTZwd2w5ejdL?=
 =?utf-8?B?Wjk3UWZFdEpOOTlqaGFrbmdLNzNXSUs5QlZNZHRsWWtKTnVoUUwyY2pyTEtu?=
 =?utf-8?B?NmIzeGliQjU5SmF5VEVZd1ZlMkN3TFgzMkhUbmhsM1lSY2dYTk10OW8xTStj?=
 =?utf-8?B?a0pxeSthU0kybXYzTkZ5bS8wZnArL3g3TUFKVGFYekkzMkl1cnZ1TEMzVHls?=
 =?utf-8?B?Sk1sSjg4NVdtTHBuWXU0MC9oTjc0N3UwbVVlNDRUUHlMN3A5K29sWHMrWk5k?=
 =?utf-8?B?RU96ZlduQzRKNUZ2TDk2Nnc3V25BM1FwbVphZmo0bTJVMVRwVGtnQjBtNlBo?=
 =?utf-8?B?RTVUZzFMZmM0LzdMRmtWOWFVcUNMY0VkMUh3aElQaHFPcldFOTVucjhaOS9O?=
 =?utf-8?B?MUNtMUw1elBIajg5M3Fkbisxb0tscXVjU0t3b3FuZzVOV2NsREQwS0VlbnVL?=
 =?utf-8?B?QUVIZDJYaWNqaVVyQS9GT1FsWUY3d3BVdDl0Zk05QWRackUzcXFVMExqR3VI?=
 =?utf-8?B?SE1WT0o1YmVIeEFLNkJZOTZhZC9SYjhRMi9wb0hncG5WUnE2ZG45a1lTbi9X?=
 =?utf-8?B?MmVqUUpORHVKN3ZYZWJYcG4zdGR0ejNzbzNYT2F4eHFIUlV4NVY1NitDM2Vw?=
 =?utf-8?B?azUrdUQ4Q25RSXp6bWhPL2pEYWZENSthdGhBZDF0aU5WRWxtLzJtWllsZkYx?=
 =?utf-8?B?cERzRlNhMTA3SllDRTNzbjBuRHhDRkVhd3BuWW1TSjhYdzdsMlRNeG9sSWk5?=
 =?utf-8?B?OWlhem1WNmpDOW8reXF2TUZlMGZRY3I0OXdaQy9zRk8weGJCckFnUUhYTmZU?=
 =?utf-8?B?MlFCSVdEUUZ6YjZ2R0toaWk3czg4dUNyN2ZFWUE2RHpkVUtuQ0xndnpGT0Mx?=
 =?utf-8?B?cjQ5WkVBT0xRcmZKMlRMVzlkYklyNHFHUmRORHoxSkdWZUd5dHYwS3p2Wmt0?=
 =?utf-8?B?RVpsVUtBdHlNR2tnOXhjNmtGV2N6eUFBS3l3blVHL0hFZjN3OUl1c0xxWGFN?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fbd6e0-c3c3-4e1e-671f-08dbfc762d45
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 07:27:50.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQxmLUryLrOpf8m9RxV+QlQ1CGPSy5S3NrHpa2sxissiOjNeubPDeFKZWs7aWZ2uEIsmg1fiUgWIm/1tU/rEG+E7UFBeowbaSmIRnDaAf7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
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


On 10/27/2023 2:18 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> To prevent running out of bits, new w/a enable flags are being added
> via a KLV system instead of a 32 bit flags word.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 73 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  5 +-
>   5 files changed, 85 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> index dabeaf4f245f3..00d6402333f8e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> @@ -36,6 +36,7 @@ enum intel_guc_load_status {
>   	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
>   	INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
>   	INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
> +	INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        = 0x75,
>   	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
>   
>   	INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 2b6dfe62c8f2a..4113776ff3e19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -198,6 +198,8 @@ struct intel_guc {
>   	struct guc_mmio_reg *ads_regset;
>   	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
>   	u32 ads_golden_ctxt_size;
> +	/** @ads_waklv_size: size of workaround KLVs */
> +	u32 ads_waklv_size;
>   	/** @ads_capture_size: size of register lists in the ADS used for error capture */
>   	u32 ads_capture_size;
>   	/** @ads_engine_usage_size: size of engine usage in the ADS */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 63724e17829a7..251e7a7a05cb8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -46,6 +46,10 @@
>    *      +---------------------------------------+
>    *      | padding                               |
>    *      +---------------------------------------+ <== 4K aligned
> + *      | w/a KLVs                              |
> + *      +---------------------------------------+
> + *      | padding                               |
> + *      +---------------------------------------+ <== 4K aligned
>    *      | capture lists                         |
>    *      +---------------------------------------+
>    *      | padding                               |
> @@ -88,6 +92,11 @@ static u32 guc_ads_golden_ctxt_size(struct intel_guc *guc)
>   	return PAGE_ALIGN(guc->ads_golden_ctxt_size);
>   }
>   
> +static u32 guc_ads_waklv_size(struct intel_guc *guc)
> +{
> +	return PAGE_ALIGN(guc->ads_waklv_size);
> +}
> +
>   static u32 guc_ads_capture_size(struct intel_guc *guc)
>   {
>   	return PAGE_ALIGN(guc->ads_capture_size);
> @@ -113,7 +122,7 @@ static u32 guc_ads_golden_ctxt_offset(struct intel_guc *guc)
>   	return PAGE_ALIGN(offset);
>   }
>   
> -static u32 guc_ads_capture_offset(struct intel_guc *guc)
> +static u32 guc_ads_waklv_offset(struct intel_guc *guc)
>   {
>   	u32 offset;
>   
> @@ -123,6 +132,16 @@ static u32 guc_ads_capture_offset(struct intel_guc *guc)
>   	return PAGE_ALIGN(offset);
>   }
>   
> +static u32 guc_ads_capture_offset(struct intel_guc *guc)
> +{
> +	u32 offset;
> +
> +	offset = guc_ads_waklv_offset(guc) +
> +		 guc_ads_waklv_size(guc);
> +
> +	return PAGE_ALIGN(offset);
> +}
> +
>   static u32 guc_ads_private_data_offset(struct intel_guc *guc)
>   {
>   	u32 offset;
> @@ -791,6 +810,49 @@ guc_capture_prep_lists(struct intel_guc *guc)
>   	return PAGE_ALIGN(total_size);
>   }
>   
> +static void guc_waklv_init(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	u32 offset, addr_ggtt, remain, size;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return;
> +
> +	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 10, 0))
> +		return;
> +
> +	GEM_BUG_ON(iosys_map_is_null(&guc->ads_map));
> +	offset = guc_ads_waklv_offset(guc);
> +	remain = guc_ads_waklv_size(guc);
> +
> +	/*
> +	 * Add workarounds here:
> +	 *
> +	 * if (want_wa_<name>) {
> +	 *	size = guc_waklv_<name>(guc, offset, remain);
> +	 *	offset += size;
> +	 *	remain -= size;
> +	 * }
> +	 */
> +
> +	size = guc_ads_waklv_size(guc) - remain;
> +	if (!size)
> +		return;
> +
> +	offset = guc_ads_waklv_offset(guc);
> +	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
> +
> +	ads_blob_write(guc, ads.wa_klv_addr_lo, addr_ggtt);
> +	ads_blob_write(guc, ads.wa_klv_addr_hi, 0);
> +	ads_blob_write(guc, ads.wa_klv_size, size);
> +}
> +
> +static int guc_prep_waklv(struct intel_guc *guc)
> +{
> +	/* Fudge something chunky for now: */
> +	return PAGE_SIZE;
> +}
> +
>   static void __guc_ads_init(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -838,6 +900,9 @@ static void __guc_ads_init(struct intel_guc *guc)
>   	/* MMIO save/restore list */
>   	guc_mmio_reg_state_init(guc);
>   
> +	/* Workaround KLV list */
> +	guc_waklv_init(guc);
> +
>   	/* Private Data */
>   	ads_blob_write(guc, ads.private_data, base +
>   		       guc_ads_private_data_offset(guc));
> @@ -881,6 +946,12 @@ int intel_guc_ads_create(struct intel_guc *guc)
>   		return ret;
>   	guc->ads_capture_size = ret;
>   
> +	/* And don't forget the workaround KLVs: */
> +	ret = guc_prep_waklv(guc);
> +	if (ret < 0)
> +		return ret;
> +	guc->ads_waklv_size = ret;
> +
>   	/* Now the total size can be determined: */
>   	size = guc_ads_blob_size(guc);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 0f79cb6585182..a54d58b9243b0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -115,6 +115,7 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
>   	case INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>   	case INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>   	case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +	case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>   		*success = false;
>   		return true;
>   	}
> @@ -241,6 +242,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   			ret = -EPERM;
>   			break;
>   
> +		case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +			guc_info(guc, "invalid w/a KLV entry\n");
> +			ret = -EINVAL;
> +			break;
> +
>   		case INTEL_GUC_LOAD_STATUS_HWCONFIG_START:
>   			guc_info(guc, "still extracting hwconfig table.\n");
>   			ret = -ETIMEDOUT;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 48863188a130e..14797e80bc92c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -431,7 +431,10 @@ struct guc_ads {
>   	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
> -	u32 reserved[14];
> +	u32 wa_klv_addr_lo;
> +	u32 wa_klv_addr_hi;
> +	u32 wa_klv_size;
> +	u32 reserved[11];
>   } __packed;

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   /* Engine usage stats */
