Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A3C6AA618
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 01:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3910E78A;
	Sat,  4 Mar 2023 00:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6723110E78A;
 Sat,  4 Mar 2023 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677888627; x=1709424627;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5ZQBu9IKKs8WORfuEqcy+c+sIKJLwBqop80WdQtB+aQ=;
 b=QEKtsbnnGg1ooEGxqsipCZLpw/aYXSkV7bon6+Ct8uFdTB/B42/A9LoD
 dyq24+6vjosg8pvHFsUTfBKup7kndV2oQtMYMTmX8gq81MO0DYwrwsH6O
 jTiJUQ4lg803z9+gMfYeFhJ549Pa8KZ/U6FSnitX9lWHiKqIrfLbeczgZ
 vr+oLcofb3cN/jFAgGIPe/Q7fDWV2CvTaHYtNzNiKE38GA1S7M5u4bEu+
 DYe/nllu64aBZ8dEJlMVL58g5k9kPhAAnR1xykF5QxRUN1YV6MR4Fl7Qi
 HpegurfvbRJkYIyczQAE9XUMdrrCIapkRWboSCfCPzYSB2Ui5faIarOfX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="319016118"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="319016118"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739689590"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="739689590"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2023 16:10:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 16:10:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 16:10:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 16:10:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPFAcnVRnf7yJB1Ny4UlZvDSNdZb8UrCQL/+gbljwnYOiLf/4P00uro8RrgziqA67/7f1EHr4AyF5EGA8rt4rox4GhM4jkYjwy+Kdv7JT64a/UGWvxHoE9bdf8IUfX23MJzpsC6QxRXG0AxedP2u0IqDh9dK3X6HfW4hpHuWJeRT/gW+QxeAlnfocwLHXvjKKQdT1so0bEyo9XHysXTSSJD5vvk2e9shos/2lqa2pVGgeDob922eSP4Ox6XhqqZr6g3stsiFqsHBunFPpIqBCSWzUm7bA0BbPoh/8h/di4rpBmntgdbYbT1lr/02Zyj58yVYOqYaCwgpyWEzST7o4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNhJfZHi6KC6Dnyu1EmqjprgmdDfeFH717xf4HtZdxY=;
 b=QNueoy5XDBdzRIffITy3Hxy/UOiwxfJl4a9RwYf7uj9CeB5bDvK7Oj1ibGTxkng8eakNCb/edS0veoE6T+izZ6KMyTD09G+vA5gnKbWFCkcNruKvUdjziN45NYzq8pQDKaGL3vOGatqaG26jl5k4QSVomGtdOVQdDP3DJQnLuFcB6xEN1GzuOjxXKRDcuTmC/03Tf8W1xzI4uCWLRG7Ztc06U4ZgEFuZTSZYDCbg0+HeZJNed4v4Bg+Hhdj5R7rwNKmaOF23aNs3h7mQDYfYt5OwwpZpF2QV/bZs1b6vAc6C9kACmzyToO33MNi0pDaMPG+VNcUQskErN2JK0axO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19; Sat, 4 Mar 2023 00:10:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 00:10:23 +0000
Message-ID: <32862f01-e7e8-150c-d1bb-4bd77c3410af@intel.com>
Date: Fri, 3 Mar 2023 16:10:21 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/i915: Set wedged if enable guc communication failed
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20230302215020.1307608-1-zhanjun.dong@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230302215020.1307608-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 22876508-d519-4309-21f2-08db1c44d959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zq9xT/1uS7P3jpHQdg8sEF/fqLhhdpFK3q6FbZDaHYqiDQXZvyTTiu0YEMCDOfeiNdME17X9fM9wwHB+XwtirOZOKSjWdJDjq0thXW/XbEZFRGH2w0DeDgcLt0rfDlemqeS5zsehqQUN7z+/n/nL0QeE1HaudqxvPmJ7mEMfVgj47s6Y4WAWhAb3G//SembGwTc9OwakP+yp/o+a5owCHg13kk5k6TAZSr4mubrAGXVb2Dmd/7cXCgJshVTIY7W3srsG8QuLR8pm2HOmCQqc6WtG6D7/XRZcRTQzb9HkZ9URrzmiFKrvHwIsjaLOHX4up2GovQ2Fidsm7G2xMUQlD8B2EuwSp5DOESL+Bi3+GLdnj33iuFg5mqCQlZjag3VFL8D7wv4ahpjBlnGBQHcbUcIw19SDBzc+fzl4EkVTBAVZbIxMUPV0xj49w8mPZrn6U/gv6CUfwPggKz9xxc/JsSd43TVvyBPrvSrjuMpGdkkP6H3Pb+sMP2gXG+KkeREMd9KKwJFJ8+KKYgxEcsQKBIB4q3418ys4sfFJXpDzkHWt/ew8InH8nS1qVJ5GM74Y7MlmEolQqYH1e2ulHZZmylSCzU23XIBsWWM1KVhvrQCP5hwfYYAK940tP19itJzoKWJjF2BvLweKT5eKHs5ziG4KpsZFULVnAIyD5HHljc+wwz51QqXDVTPhDAuapTEAZXLYEhNbqfBkqNWVVks2+sSUmfrxKIJrzFowDytdaTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(8936002)(5660300002)(8676002)(66476007)(66556008)(66946007)(450100002)(86362001)(36756003)(83380400001)(478600001)(316002)(41300700001)(6486002)(31696002)(31686004)(186003)(2906002)(82960400001)(2616005)(6512007)(6506007)(26005)(53546011)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THQ5bTRZNEtXaXU4NDY4OTdTaE41c2hUcEd6aGdwWUtwRG5FWGVYS3llZEFz?=
 =?utf-8?B?cHVpY052TnlrZ2NkK3JnaDJ4VDAvWDNqdEhPSUhEVGRPOFUrZ0NKOHpCaGFV?=
 =?utf-8?B?RXQ1L050UDI3NTZ3VXJZNlY4ZStnbCtGUWp6ckJwSStmREU3MjVXWTVsSDRi?=
 =?utf-8?B?NkxTUWIvS04zb1M3Qjc4UVNTcDBXdGgrMjhFV3dIZ3N2QXlPd0lYRDNva0do?=
 =?utf-8?B?dVlQVm5obWc3ajVLUmt0VlppdWZKSlFhZGxNamlRSUo5dGIyQjJLSmxDRTBX?=
 =?utf-8?B?MFcwZ1lwK0JmWWo4ZG9LUThjNlVZMjJLSCtOVjVXSWlnZGlUNEdmS0hTRUpH?=
 =?utf-8?B?eUxybUo2dldreDVlK1Z4SUR2cDM1VHV4cURKUHNQdDhzejNVNjNxd3NPeGRy?=
 =?utf-8?B?alFDWE5ldkxrTXMwTWZVb1hwWlo0SVdJYlBuRXlUeGhaVlA5aW5rTE1hWmMv?=
 =?utf-8?B?c21yRU45dCs0UlhaM2x2RU5mcjJXN0xsNFlBNmlackVZSXdOaW1EdGphOU1I?=
 =?utf-8?B?TW13cnlQdTduVFpMUUJDMmxMRFNjVVY4R2hTZkovYlYzSVJXOHhFNjB3U3NY?=
 =?utf-8?B?RjR6NUFHRWEyQlRVb21rWEgyeFVFK1VWK1JTYjRtNXU0VnkrTTRvU09Tb3Jv?=
 =?utf-8?B?VG9lQ2hNbjkyL0wwT2w3eEVmYkZuWmIvaTRQdVdEaUlSbmhWdmhMajRVTjcv?=
 =?utf-8?B?dWZPckFWRUNhVXQ2SzgzWklodEhPUUJnOGErbktuRCtjWVB1eUFLSldNcFM1?=
 =?utf-8?B?b0hoS3ZOalU2M2hiU0Rldk55MlVnU0hZQk5ZUTYrR2daTnNNZkxWNVc4OVFD?=
 =?utf-8?B?RG8yMEZVTVN0ZDAxR1hHbnIyVjJycFUvQllSbUx0Zm1XV3RyTDdvSkxUdW9S?=
 =?utf-8?B?K2VQVWtVTUw4S1pxQVcrQS9jR1lVNmxhS0JHTmpvMTN6dXpWclpqMEd2RGVi?=
 =?utf-8?B?dUZIc1JWSUpIek5HNUFvT0FuQm85c3htaVZNNFpzMURYSnJhZXJ5OWhmVVVD?=
 =?utf-8?B?OXlqRENjbjBFMUVORFJ6WC9kVG50V2hzSVVCODMrZlRtNGhRQ2RCVmVEVWdj?=
 =?utf-8?B?dzUzcytmaHJSNktySllucUJsbFF1eVV6aEtmOGVxeFM3MVFNVlNIdnJIYUho?=
 =?utf-8?B?ZFJPVFFvYjNvY0thU1VNVWVrcEpBOG1oR0NrR2ZpTldBWDBnYXd3UlZncFFX?=
 =?utf-8?B?ejBXTjdRd01kdjdBd1JSNHBDK2dvWlpQSWJIZ2pwL0l2czFrZDJBSDJNNnpi?=
 =?utf-8?B?K1BhTGNCZjhDQWtUUVlqSnVOaG5meTc2Tk9QakZnSXQ1NnZDK2hGV0g5MUpB?=
 =?utf-8?B?eVZEdnJXalU3dkdMYk5hckZzeGVXVExTcVVBb2NyWVMzM2I0UWs2Wmo1aFNi?=
 =?utf-8?B?Wno5eEl1cFBUQTNFYWJRRGVKMHRtaERoYmhxVW4rNk5URCs5WDRCMTBaeEwz?=
 =?utf-8?B?MlFaSkMrbUNpbnRxaThlWjVDY204eFdsS0hRQXZsZCtlN29McHlZbk1rWUh2?=
 =?utf-8?B?dzhFbW1IcEgzQmw3YzZBVjlBOVdPUWRmVndJS1lWRFZ0bnJQWTJkdjM5Q1Vo?=
 =?utf-8?B?RWRPdUlKNXdPSVJPSVdwWW1vc0pTVlA0MjFreG9mRm1mZERnZ1R2SE1wVDIr?=
 =?utf-8?B?cEJtbXdGMi9QL3NNUGE1YmM0ck9xYjd0NnhsZjhwbkdWU2gzUk41UFFKL3dE?=
 =?utf-8?B?U2tvL0J5WHVTNWltSnFwS3pnWFpYTGw2OHNhdzRPTDNvUm53bUg2L0FndWZo?=
 =?utf-8?B?L2djR1JGMHp5T1RuR0k3UTk1TWdndU05bU53QlYvR2h2MEkwdzVYTFd3NllW?=
 =?utf-8?B?QnRadS83clNjbVBCejZ5NmNqT3RCaU9ocUNBM1lJcllMZk81bE5Ja2l6Qy8y?=
 =?utf-8?B?SGUyRHZkZ3VYcXVnTi91Q0d6T0pyZFR0amdPc3JIbzVVaGg4TytxcFl0WXJn?=
 =?utf-8?B?VE4rRnNjY3VKOHNCT28wb1hRSVlvUDBFUTBiMm1hVE8vdVVqSDdYUUZWOE96?=
 =?utf-8?B?azlQMG5WT0JZQ1NtOFVXRFZjL3FnUmZyWWttMHVCWnpxZ0xuK1VzZjJReENI?=
 =?utf-8?B?dHFVQU93dXd3Vmh3aXNNVWk1UGU3R2Vzbm9rZVNGZllQOFlpcy9UZ2MrU3RY?=
 =?utf-8?B?WFE0QmpBa0dibDV2L3Y4NnNVc3U1bTlGSHlRamY1bVBkRmxxa1JzTXRqSElk?=
 =?utf-8?Q?qO4Vdy025IJYyCaFxdP8Ues=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22876508-d519-4309-21f2-08db1c44d959
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 00:10:23.4782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HwBDhIrLFrpDwu6UoPmXP+eZV1L/Xd3eRb9ZP6M0/MrmMULWCsVPcoogFVVvZLHpaM1LNkPnM0b0IuTUyMgrs3DPZp4R0ffX0QtRYeshW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4920
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



On 3/2/2023 1:50 PM, Zhanjun Dong wrote:
> Add err code check for enable_communication on resume path. When resume failed, we can no longer use the GPU, marking the GPU as wedged.

This is slightly incorrect. If we fail to enable communication, the 
consequence is that we can't use the GuC. That translates to a failure 
to use the GT only if GuC submission is enabled; in execlists submission 
mode we can keep going, although we might end up losing HuC 
functionality (which is not considered a fatal error). Therefore, the 
code below should be updated to reflect this.

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 7 ++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 9 +++++++--
>   2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..42a7d75ce39e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -401,8 +401,13 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
>   	intel_ggtt_restore_fences(gt->ggtt);
>   
>   	ret = intel_uc_runtime_resume(&gt->uc);
> -	if (ret)
> +	if (ret) {
> +		/* Resume failed, we can no longer use the GPU, marking the GPU
> +		 * as wedged.
> +		 */
> +		intel_gt_set_wedged(gt);

intel_gt_set_wedged calls intel_runtime_pm_get, so it will deadlock if 
you call if from within the runtime_resume flow.

>   		return ret;
> +	}
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 6648691bd645..d4f428acf20a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -698,8 +698,13 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>   	/* Make sure we enable communication if and only if it's disabled */
>   	GEM_BUG_ON(enable_communication == intel_guc_ct_enabled(&guc->ct));
>   
> -	if (enable_communication)
> -		guc_enable_communication(guc);
> +	if (enable_communication) {
> +		err = guc_enable_communication(guc);
> +		if (err) {
> +			guc_dbg(guc, "Failed to resume, %pe", ERR_PTR(err));

nit: this isn't exactly a failure to resume because the GuC is running. 
It's more a failure to re-establish communication with the GuC.

Daniele

> +			return err;
> +		}
> +	}
>   
>   	/* If we are only resuming GuC communication but not reloading
>   	 * GuC, we need to ensure the ARAT timer interrupt is enabled

