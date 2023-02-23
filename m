Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05C6A13DA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 00:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7676410E0C4;
	Thu, 23 Feb 2023 23:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB4810E03F;
 Thu, 23 Feb 2023 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677195408; x=1708731408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SklkLPBy3cHpgjczQLZqI9HdMIXq++wqhRCocNSDdP0=;
 b=F5n/DAk8OvpbPmgg5q4Evg49mrzD6kPCvkMAN3TFtj6bllcJc0PYcYXt
 TLsKz1alcRfOtT8l8abrDvEWERM/3qMA4qZLyYfHN54x4AGa3ewc9deEm
 mE040zQvQnGBM6NKCV/csl1CHzuPZTxxB9iGUb8A+Uxc3LGt9CPKgYu7l
 oaPQG+s+aLsI92SIUhSTHDiDyAzq9NilhvD6mtU+a8g+T3KLP3knQFc2r
 ICOIOJSVTu7+jvHVgqVGE9ZuR6LV7ebtiqgWffK0UXS5jKzfx3q42zSBU
 TK35/KyqniymjRazufHGiiG66I4jfsW+U8UId2qLeUs6OLO32ze/xp/9f g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="321546487"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="321546487"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 15:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674714868"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="674714868"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2023 15:35:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 15:35:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 15:35:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 15:35:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 15:35:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYp4mBz50wNk8h8qVeJiF4XsP1WGwfpBjA9RqUCanY79nqCR7ljNPfdXBIStXviPRak/w9bo0DFCahYob96V12VWUwcfF6RyZBfFbL3pAOPMVwKW+1y2NjXptkuxqQQJFWy8djotC46fEnY79gl0iZF93uW4nLGASUA/OemkGWTjW1i75z14ET5W3sM13T+QBlXlaBlgWsR67StIkOlcme9uh2FgDXrrSlhorwiolYB1SQCh/kLkaoynwNIdlr7j1qh08PBJWIf5JmgqFz3LEjchlv1ttW2VOv6Y5J/SHEuWQJZepC+lFhouq0ZKn+M2lDvfE2pZMooIyccOWqfE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70CquSKDkfjeYSuuRunAnm5ODjjLBnNQNlsdVzt7YuA=;
 b=jtmLxsaFw7zaeMYFUZEZFvqrav6rgz/pF9DwxHnnBFUtu9axB6OZeibEvsMpQ9RIj13B0uzejwiDsXQFW/XvKEgcTcYzT2LCYndahgBeAfu3Cqy8cXc3V/PYB+4mXY8BgoT9eOxAkG37cHL/vHwHSH6JJRFEc9j1WOuDL2IG69P7wBdzUSCYEheCB8vNnJBwzMd/9shIzuyeev9ONrTn8g6CXzs6PML4QePCaDXyPPNFWO6C39ZESImoJMzg79OTgPuZRPQYcj8X7AcSGTzLNHZ31a9BEJPqGBv4/CXUVF5n082qsdPTWj2uLIAShdP3AdNun5qWrRHz92+XamgaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 23:35:44 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%5]) with mapi id 15.20.6134.023; Thu, 23 Feb 2023
 23:35:43 +0000
Message-ID: <d3f8a48e-86fe-4dea-a280-91f016707e92@intel.com>
Date: Thu, 23 Feb 2023 15:35:41 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230223220458.520815-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230223220458.520815-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 24185446-b30c-46d5-5377-08db15f6ae39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byL/63xnEmWc5poLA+yw4Jghh0hAyB6JjzJU//HG0L0LfaFQu+oXKdH/t5lWnWj52exKUkMoR4TNbg3L6BKUQ0PA0lyFimUvadVF085rde40X8myQrylANjtsLuQSO2X5IDMCUKOKRdI8i6BKtNfPNHJR96z0ryW6+UDDwzo+DlWuNjHkkomRrZarOv4RpEajKx7li7B6BVFSLkg+Pcse7eRPUjD3a6nTSFTp3HoN3ERtqjce0NqCK54sXcUIVpZNLgYi3p4c5mqs5a30GXoO8UwJTojcOlJKrcuPIb+4injC+IVKPYogasqDyVs26F+BB4AuP7d4GrEg7JhoxhIxcaV8TG1TESPkPKj2PTtTEmVJuwKQrY2lWrXgve0H+p1641IyIAR2WTijqqp70MKNRQKkYW2BA+x/5OJ0ViJnGvW88Oltb4TQsTcYvpKGH71VxD3ywG+dOJs/ghSLNfPke5UtLdOvbs5IDh4oLtvI/19eMHjqRwjjZxEWComdZ5/2nGBEdAP04+ZJe7JOnEoJ6imEwb6W1b3migPelP0CO4UPC4hcpC4gyY5YTyCDObZ7Dmpz0+fZ+4AHYIxp32xY1eS8tmc0oEU5g6QeoffiKKTj9YQlsQEC3s8fsC1HwWLfaQRuu5G7HcKlJpy25J1HeoCcpH35CM9ArZeegSqlExrPhZFn49X4ByXDaIN0CHWRpuKLeDZ/Wsyj/3sXtFn5uQtnZSz70e8XInVNZYNqPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(36756003)(54906003)(316002)(83380400001)(5660300002)(6486002)(478600001)(41300700001)(53546011)(6512007)(26005)(186003)(6506007)(86362001)(2906002)(8936002)(31696002)(2616005)(66556008)(8676002)(66476007)(66946007)(38100700002)(82960400001)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmZHTWxRY3hyRmxoVDE0c1lKV2U4dmp2WmtrNTFuN0Q1U01xSExuSTJSNzBI?=
 =?utf-8?B?T3dsLzl5ZkR3aEJQYklFWExoaVYyL09WbGk2ZE9nWS9DNFZrODJaazJWS29L?=
 =?utf-8?B?OXJpN1hReHVOTlRNTG00cEl2TmZSTTBGNEEyZnZvRElhb3lIVlFZQzBkRERj?=
 =?utf-8?B?eXpTTGpyeHRLUmE1ZUdVWDhna1dqOGtiVWVnWk1jaUg4dWRXRldvV2hSajFP?=
 =?utf-8?B?ckJUYVZqVnVWVnJTQ3FMTk45YldKYnRjTkliNHpidjloakRlT2c1d0tOZ2Ix?=
 =?utf-8?B?RGFVb1hyQjJYWjZ5c1pHekZVWTJMQXZLRWdMVExwWDJRUW83OEFiazFoVFJD?=
 =?utf-8?B?b1VQeDJsT0RIM3FjME5OUDJkNktmVlVXemJPWmw3LzRWTnZwZlBLQVFFVnow?=
 =?utf-8?B?b1E0eGFTQ2dHUGdsWWZwSDErNjFLRHVvUXJRVUwrNU81aVFoMVk2Y3hTbmU0?=
 =?utf-8?B?amp1a0pqUExOMHpqTmpCYXd4THVjUGRqVHByZEFTMkx1Unp4a0ZOaFVKbVBD?=
 =?utf-8?B?YlByOXBSRUs4ZGI1MUs4WkZ6d2F1QStSTFIySWtQVWpmVXV0N0xPTklreW9H?=
 =?utf-8?B?U25ObnhJUjJ4aGNFSXowMWs5WjVZcU5sMEx2b0NCNE80dFZLWExGRHRHdk9R?=
 =?utf-8?B?dHNza0M0K05EUWJpbWY0aUpxOXBIdUNnaG5POXlrcHdpNWwwdVhNUEJIS1Qw?=
 =?utf-8?B?Y2ViazN3cFU5eFFuVDhMVFo3SFhLUzBtODRXZndiNEJwc2R0dG1yenp0alAw?=
 =?utf-8?B?ODUwUmg1T1NrQ2pqT3VLY2x3K2tGNHdKNzA3aUhTeDFBUjRmaDNPSWJHTWhS?=
 =?utf-8?B?aEtTOHFtQ29GOUdqKzE4M3Rta3pLVWd0ektSeXh3SUwvVzNTSEl2NFBOWmVL?=
 =?utf-8?B?UnNzaXVVR3FLbWI4cTFvSUtjcm5NVXAxVnhPQjFWWWxaYkFjaEJhcE93NjFO?=
 =?utf-8?B?M0lCZUtxc2xSSTNPaXlDbUNkdHpIa1lGUXBDNEI0SEtuOUF6UDBrbnNWWWRt?=
 =?utf-8?B?d1RPTE11ZllHWlRIbC9YZHk2M0FIdUVnOENtWXFJaGZTR3hJUGVSWlZzcExo?=
 =?utf-8?B?SlA1dWYzUFJUaU5HNHhvNEx3bC8rZHBGalpmQk9kaU1ocTUyM3lVZmR5dTcr?=
 =?utf-8?B?SG0waTFNZTQ4WlppeitaTzhQWEVlQ01GazJUNWlNd2RMREQrODR2VjNQN3RE?=
 =?utf-8?B?S0dEYnNkdlU0V29nMU9uWE5xbGcrTTVxejh2SW51UXRleFJlLy9HSkY1M0xF?=
 =?utf-8?B?QWgrOWRtMmxsSWlER2FBMWpQOTZNcTF1cnVtcFcyUnc0aVgwb0MxZDdsYXRj?=
 =?utf-8?B?OFF2c2xRTTEwLzVFNjAvUkRXbzlzeXR5bmlIUlhrT01BVzdtaStLNVVheHl4?=
 =?utf-8?B?RnlCZmZBNzFzeDdDaVhpM1Y3QmR5UndOTlk1dGx6bTRPMGVndlRDWTQyQUp2?=
 =?utf-8?B?aGh5U3JPN0NEc0ppU21DTXlhbUdFeTYxdm1UY1owRjFucGFBM1c5YzlhaE1h?=
 =?utf-8?B?YUJaeGNESFhiTW9EZW55a3lmVzdCTlI5MHUwM3R2VWFmZ0lHRTFBTmF0L3I0?=
 =?utf-8?B?ZC9YVURmOXEzaEZrQk8vdnFoUmhNclZuSEVFRzlIbUV1c3FMTkQybTNNTTBO?=
 =?utf-8?B?US9kc1RUNlIrOCtJbTZVWktqbkREVGNWSURIS3lmQXBYcWwwQnRyTzB6UWRa?=
 =?utf-8?B?UDBFbkhQTEk3dnEwajZ1YitUdWsyRFlrUW52SlJiakVDdGpQQS9KWkhrMkt2?=
 =?utf-8?B?enV5b0pETW9qRk5ValcrejNiSGVvWjdsQ1Q2ZDlSbExCTjFLcEh1VUN3V3FU?=
 =?utf-8?B?VGkxNmQySG1DQkRCV2k5NEJpSXV1N1dKTnhoeFVVM2w3azlJNTNrTm5LZFVP?=
 =?utf-8?B?UmcrMmg0ZkphUWtUZzZ4U3BBcFBoTU5ZaXl5Y2FNZ2dUdWw3OXFsZWl3WEZv?=
 =?utf-8?B?K0FQbURWQ203V3JoU09KSHZHWjNrY0lRenVRdUlqQzl0V2M4S3YyMEl1dHlI?=
 =?utf-8?B?Z05YZVk2Z0Q4QjRNU1h0VVJobHo4Y1hpNWhlU0xmVGxHUDRadC9mWjNUVjVB?=
 =?utf-8?B?bmU4M0w5Z0xYWmkzMldndjJEK1dIcXJ1TWhIZFFyTDNyNXloaHpKRVBzakN5?=
 =?utf-8?B?ZVFJWURiWFp2dk1lKzMxeklzL0I4SVNMMEowWmhRZ1gzMjNJbE82dUR4V1hV?=
 =?utf-8?Q?wjVJxD82mIYh+J/9wqMF9Og=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24185446-b30c-46d5-5377-08db15f6ae39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 23:35:43.4531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2PoiZFmaMpAAFcr9H/Qmp9hmKlPQZ8YZo/dTOenvKpkBMvs91PJov2YIdfRkeL2oRxXJX3FPa0+k3VtrxHUqEUMdcJnVFjyN1jvCdbrlt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
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
Cc: Anshuman <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/23/2023 2:04 PM, Alan Previn wrote:
> The Driver-FLR flow may inadvertently exit early before the full
> completion of the re-init of the internal HW state if we only poll
> GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
> we need a two-step completion wait-for-completion flow that also
> involves GU_CNTL. See the patch and new code comments for detail.
> This is new direction from HW architecture folks.
>
>     v2: - Add error message for the teardown timeout (Anshuman)
>         - Don't duplicate code in comments (Jani)
>     v3: - Add get/put runtime-pm for this function. Though
>           not functionally required during unload, its so the uncore
> 	 doesn't complain.

I think my comment applied to an older version of this code. The FLR is 
done after we've already disabled rpm (from driver_unregister), so we 
shouldn't need to take a ref here. If this ever changes, then the rpm 
get/put should be added to the caller (uncore_fini_mmio) because there 
are other register accesses performed by that function and we should 
cover them all.
Given this, IMO we should revert back to the v2 version of this patch, 
so I'm going to review that one.

Daniele

>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index f018da7ebaac..9832b8ac8b1a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2724,10 +2724,13 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   {
>   	struct drm_i915_private *i915 = uncore->i915;
>   	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> +	intel_wakeref_t wakeref;
>   	int ret;
>   
>   	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
>   
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
>   	/*
>   	 * Make sure any pending FLR requests have cleared by waiting for the
>   	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> @@ -2742,22 +2745,36 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   		drm_err(&i915->drm,
>   			"Failed to wait for Driver-FLR bit to clear! %d\n",
>   			ret);
> -		return;
> +		goto out;
>   	}
>   	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>   
>   	/* Trigger the actual Driver-FLR */
>   	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>   
> +	/* Wait for hardware teardown to complete */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
> +					 DRIVERFLR_STATUS, 0,
> +					 flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		goto out;
> +	}
> +
> +	/* Wait for hardware/firmware re-init to complete */
>   	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
>   					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>   					 flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> -		return;
> +		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		goto out;
>   	}
>   
> +	/* Clear sticky completion status */
>   	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +out:
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>   }
>   
>   /* Called via drm-managed action */

