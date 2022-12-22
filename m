Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C8654166
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 13:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D12B10E15C;
	Thu, 22 Dec 2022 12:56:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACA310E11C;
 Thu, 22 Dec 2022 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671713810; x=1703249810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cDRTwAaOiL390VQqHzbqmWCq4iPY31mK4dnG3H8ph+s=;
 b=L8deywYE8Mt9BV5PN35XQUMonEAv/twq39A+U6YrXpx50iUhmfM4K0qB
 HmJWhnUlIKt1mtVn35zwUlCYt8rdGlOY6UpSJCg3hd+M/MUUDd0cyOzly
 kuHUGxOWssB3yO2G8ylcV2Fjm/xfL2KhgM/NUHi9Ldn/dNCYLy0WO3akW
 ZBIBFYVr0M/VewmozsS7vsEpo64LVX7GyEYgMQB2fC9snkUZFAlBvc64p
 EN8DSfrhQNuJFXdFyWptH9q56SkvdmHLBQq5Jk5nVWC5+qG7IRVUDboLR
 U4JlysN6D3MzvXk89irXk2YkdpVlQeQXhOEvet6Dais4kRgcLWxwAJacm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="320175615"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="320175615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 04:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="684180618"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="684180618"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 22 Dec 2022 04:56:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 04:56:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 22 Dec 2022 04:56:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 22 Dec 2022 04:56:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLkKbkPflHLkPV5Cdeh5Lk69a2asSOom6RA3jt4Mu6RoKAAFA8iIW7dnMOQmldWe18zBpiO5jzxwhzQjR0WbiwQioDIjhr4Qpf8/PWUCP1l9sVfHQxEn/Zh2CYtNj1S560HZ3inZtTfm5FP4lgrgfX9IOnaO9KEIZ1K+z6aLcK7BAvxrrbfanSPg+2ry1OdKXmSan3tR6w0sgaSHhzb6EKM9uhXgYox3+kThbv2VjBsgh+jTyYTRkhtOZ6WA27aw7iWWCnqwvpDWRyLPZi2zYxqSvMD5ukm+soZVaqF548CWQINWFnyyV67/E7g/E8jfqiD+8k3rYBsND80I4xwlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQKIZFY5MljoKJ3h/Oln+E6H2I2f85s2gbhGxu8yzeE=;
 b=OPhN8T1sswMS/tzqLVPhy2GacMD5d4IxMpguiVHQa6vwlrR+FOFAp0z2B3OfrcjLIJnAW54MfQZ8AEm821JSOsUD4HOFrNzxQeswSYxCEa41K39Q+VcaebJWdhy907EeqvJRvIwM4vPsH3zKwJS6l6w8BDmqHfgl3P2kOpb8IVhsERdstIgjnWBvL1egGFGtUrg4Yw6+GJUBYuP4BeLCNe61VmYFIgvGRlyuzs7mis+BcKJTb/dtkLuIDUkifZNRPxyIv4WE6tU+SObjG4UxgWnGcmnRFhdMp/sW5Df7Dc6Ru+yWKrigajzQmSV9X0eW/BMOHASbhr79dBqxQBXI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Thu, 22 Dec 2022 12:56:32 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509%8]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 12:56:32 +0000
Message-ID: <6caf5172-f636-191d-2808-cc97b43b4f38@intel.com>
Date: Thu, 22 Dec 2022 13:56:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Fix missing return code
 checks in submission init
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221221193031.687266-1-John.C.Harrison@Intel.com>
 <20221221193031.687266-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221221193031.687266-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 840e7899-2636-4393-ba5b-08dae41bf332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/NMx5Z5TUkg4U+/mcjQ0xM6cEjzIuePEuPweTfxrVWEwgt2lWZTL0j2IBN0fLx4idR4c/tpJbESHj5zurQ41TRTyrUe7cY4UvzOnbLYS95hlqV5KuBeziLv80guSpdI1KxyBReUgMBGxFTEchi4HOvDgKju7fDCoiTGvqjCzWAvoUwfk7JpMOR4UrC1o6avdoYa4qeUp4iJApPQb8I8vLu9PeAvF/gftWCJvHWETkWdmhM9mmy4OPUZG9wwmCazvzY3DjxGi5yBmyAq0/3BBzaTCYbeRGK+BMWKkRl9ydgXu3vmhmpBkcR8ruXeV5Um02jTD/iierfhscFx6vPWnRTjF7jdNw57s+np3fdP3ai9pi3ADQby1PX3rANrnoKx+Y/+xvtcxs45BiYJKg/c35i9/1akNaq5nQEiNnoPoePZZNfU6mgqU8Fn/VJWoN/Xwi4W09b+QGe+zgNNLOtwhxD31l+XrUfY6S2DYFg0h2TKkKyad9SYfM4QOGuKTZjARe+VoRCGISoJtJyuLvfXclAJixgw0BetPEVF5ZfXYA1JtI211xUB00AViOVTLOJIHptILr803xCYZKW+acWBkMoys6o54yELaYHPGce8XiA7qiyOUi0oKmsgqhPdKXtYVIdNW0oT0Txqn7vvPtc7vWqKdkPzpFKfoAN8pIzcQ7Ytq8DlCMZ9Ih7I+7/xc1mtuUL+8ANnWk6n1Bm6YBDndGmEoWBGfi5kzD8lx5sf+0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(8676002)(41300700001)(38100700002)(82960400001)(5660300002)(8936002)(53546011)(2906002)(4326008)(83380400001)(36756003)(316002)(31686004)(478600001)(6666004)(6486002)(86362001)(31696002)(6506007)(66476007)(186003)(66946007)(66556008)(450100002)(26005)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjU4U2NNQjBPcEhtalJtWExFTTAzWGJGWnRlRytGN01VSXZqemVuNE9MMmEv?=
 =?utf-8?B?Tm1YZzZoTkJRcGhxVjFpQ0g3b21FRHhkRExSaUY0SU1kRHN3VFhmdTRpMlB2?=
 =?utf-8?B?UkVxL0VEVnQrWGhoRVE4TUtsb29BaUhYb00rR2JVZXZXRHpQSk13MEJuUnZm?=
 =?utf-8?B?WGhCRys4a3BsWWtiLzdHT3F4a0FyYnN6R0FuaXp1cUFZdk9RS0pUbWdUYXda?=
 =?utf-8?B?bGtWY21HeTRtQVdsS3FVVzhHRE1OdGlMY2YwYkZqNG40cG40V21zQnhRT3hv?=
 =?utf-8?B?WmlXSUtLODhPeHd3UWkydS9LVHlyQ1ZqN2szZE8xOCtBaUplb1gzeVljMW14?=
 =?utf-8?B?NnlSdTk5Ny92RDJmbUJSREp4aGNRbWRoWlgwVHplWmdEWjFweWpCd1UrWVBs?=
 =?utf-8?B?QittbDF6bHVPVjJBZE84TGVlalQ0N24rdkdaVVptcHo5T0dvNUpDMXQrRmxu?=
 =?utf-8?B?Z2lUeXprb21SK0JwZ1g5aDZnZ0NlNFN4NFRIUXVvWVQvWjJVck5lQUowSDV6?=
 =?utf-8?B?MVNxajBaSW1hcGE3dkpJV1ZYMndHcVFpd2lTeWNQUXJKd3QzME0vWnNTdjJy?=
 =?utf-8?B?NjlvRUtqb1V5NzdsRGhDK1pZbXZ1aTB5RnZoOHFSeU50R1JITE1RZThDQ2Z6?=
 =?utf-8?B?cUtGcmR3b05jRGFSYkJUOFVKd0RObnNrMGxnOXp3V1FQQWROYTM4YmFIeDJQ?=
 =?utf-8?B?eHNqMlUvN0JXYmNUOGNZRU00Tkdvc0dTcy9sY1BHdHN6eVAra3dLUFV6S1B0?=
 =?utf-8?B?UkZLUkN6a2tKSENpcTJKcm9ZQm1sektmeXZRZ3lXb3ppcTdtQmhyRGN1bGwx?=
 =?utf-8?B?MmF1RWlacGx6UFJJSkgzWUNDUzNTNkZ5YVdpcWdIdHV3dXRtZGdVN1F6SlNB?=
 =?utf-8?B?R1pDZHQvU2NpemNRd1pJNnkvRnl2NmxLeFZUc0tXamo0RGNhVVJ4azZONXFu?=
 =?utf-8?B?MWlPWmdUWEY1OXQ5MEN2eWM1RHNKQTFGU2lVMFpNeS9qcldsR01USU5QUFNP?=
 =?utf-8?B?TlVzdEppUlVwWGU0RC9wTHJWS2RPVE1aeTBCajY4L1VkN0QzRmE2b1hZN0ZO?=
 =?utf-8?B?cm5pSVNtWjdRL0lyMFMvd256UjdtaWNEeDNjblQ2N1F4KzcrZlhIalJVaXlD?=
 =?utf-8?B?cWN0eTJwamplckEwMmpoSThBVlcrYVMzMGhCSXg1R1FTUUZsNXBlVUZrTkJz?=
 =?utf-8?B?R3JCa0FpOUtWbXRSR3MzV1M2K1pnTVZJTFJ6WVgxdC9MbDAvL3hYRnRUWUtr?=
 =?utf-8?B?VXB0L0FMSFY3cjRZU0I4T0c0MXFhNEwvakQ3b1lkbFluYmZLQWhudTZPMGF4?=
 =?utf-8?B?Um5xSDNDSGxTejdGY01FaVZ2ZlNydWlzd1FNWU5VZHdtOVNRajIvcDRPNjdQ?=
 =?utf-8?B?LzEyV1Z4ZEJDNGhqSjE3bGUzMjBTT0VyZm9RNVRSMHp5OTdsOUl1bzdET3Jq?=
 =?utf-8?B?ZzBqbVVETG9qYURlQ1hXdXBxWndJRG1LeUtvNmRwK1ZlK3BHVTVhYjB2MzRE?=
 =?utf-8?B?SEEvRVN0Mk9iNjBKVVpCdy92TUREbjJBTmJTL2NtR2VuODdVa1hIUHVQaUVh?=
 =?utf-8?B?bXFWTEFLSWVCWVlZMDdDU0UrMjhic2hjZTJjMkRMSklabklYMm9TdzBkSDA0?=
 =?utf-8?B?dytiYm9XaHpMR0FpZmVJUTAzTmVKbHV3UjFvY0RFVDJCRlM0T3dTdEhQTk55?=
 =?utf-8?B?akFDQnNRN0ErcUdpVGIvSXFmeE9seUdURHVqNHU2Q0o5SCsvY2h5QkFra3g5?=
 =?utf-8?B?UDhtRUxXK2E0b2doaGZIQzlVTUpmNjBUNzhyTThPNXhUMWkwZ2NiTWdJNkpy?=
 =?utf-8?B?c2hmOEZYNHNqU0xCQkNuNnpHQmhEN2NtSHByMzBXWUJ0TjlkcVo0Z1E2YmdB?=
 =?utf-8?B?U1E5Q2V3MW0rRlhwMnJjbXhxTUxvSWZQM25TUlBSRmIzTXo2bFMzQ0czUU4y?=
 =?utf-8?B?M3RNWXNYcjNGNkg2K3h2NUN4alJLcm9IdHRVQ1pSbnRXZE1yRjhHSWVxRzV1?=
 =?utf-8?B?bkJzT2szUDVJNjd5QkNpU1VRZzVONmlKU04zSTBOYkxpdi9mVkJBT1pkcklu?=
 =?utf-8?B?eUFZdnR1QlM0M3B3S1dYbm9QcmNVVHNYWmxnYVpqaVZVb3M0Z2JtRzhIQytz?=
 =?utf-8?B?Q3BKeGhkV21CRnY5Ymhlbloza014T0VlUzNwZW1ncmJhaVJXSGVCZTdHR3F5?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 840e7899-2636-4393-ba5b-08dae41bf332
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 12:56:32.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gl+lCujLQ5vsK0YxbSo5Xq0xGraOtJABXu0c+g2ndOxHZcg7m0fY35Hf2JtOewcHzQN8xxIFLy12tm9M+/6/vT9xxsHh2nxIprXdqcydKdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
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



On 12/21/2022 8:30 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The CI results for the 'fast request' patch set (enables error return
> codes for fire-and-forget H2G messages) hit an issue with the KMD
> sending context submission requests on an invalid context. That was
> caused by a fault injection probe failing the context creation of a
> kernel context. However, there was no return code checking on any of
> the kernel context registration paths. So the driver kept going and
> tried to use the kernel context for the record defaults process.
>
> Fix that by checking for errors and aborting as appropriate when
> creating kernel contexts. While at it, clean up some other submission
> init related failure cleanup paths. Also, rename guc_init_lrc_mapping
> to guc_init_submission as the former name hasn't been valid in a long
> time.

IMO we should specify that this isn't a bug in the current code. The 
only way this can fail if we don't inject the failure is if the GuC is 
dead and/or is not seeing our messages, in which case we'll eventually 
correctly wedge. We only need this to get ready to switch to fast 
request messages.

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 74 ++++++++++++++-----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
>   3 files changed, 62 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 53f7f599cde3a..4682ec1dbd9c0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1431,21 +1431,25 @@ static int guc_action_enable_usage_stats(struct intel_guc *guc)
>   	return intel_guc_send(guc, action, ARRAY_SIZE(action));
>   }
>   
> -static void guc_init_engine_stats(struct intel_guc *guc)
> +static int guc_init_engine_stats(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> +	int ret;
>   
>   	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
>   			 guc->timestamp.ping_delay);
>   
>   	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
> -		int ret = guc_action_enable_usage_stats(guc);
> +		ret = guc_action_enable_usage_stats(guc);
>   
> -		if (ret)
> -			drm_err(&gt->i915->drm,
> -				"Failed to enable usage stats: %d!\n", ret);
> +		if (ret) {
> +			cancel_delayed_work_sync(&guc->timestamp.work);
> +			drm_err(&gt->i915->drm, "Failed to enable usage stats: %d!\n", ret);
> +		}
>   	}
> +
> +	return ret;
>   }
>   
>   void intel_guc_busyness_park(struct intel_gt *gt)
> @@ -4101,9 +4105,11 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
>   	engine->submit_request = guc_submit_request;
>   }
>   
> -static inline void guc_kernel_context_pin(struct intel_guc *guc,
> -					  struct intel_context *ce)
> +static inline int guc_kernel_context_pin(struct intel_guc *guc,
> +					 struct intel_context *ce)
>   {
> +	int ret;
> +
>   	/*
>   	 * Note: we purposefully do not check the returns below because
>   	 * the registration can only fail if a reset is just starting.
> @@ -4111,16 +4117,24 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
>   	 * isn't happening and even it did this code would be run again.
>   	 */
>   
> -	if (context_guc_id_invalid(ce))
> -		pin_guc_id(guc, ce);
> +	if (context_guc_id_invalid(ce)) {
> +		int ret = pin_guc_id(guc, ce);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
>   		guc_context_init(ce);
>   
> -	try_context_registration(ce, true);
> +	ret = try_context_registration(ce, true);
> +	if (ret)
> +		unpin_guc_id(guc, ce);
> +
> +	return ret;
>   }
>   
> -static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> +static inline int guc_init_submission(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_engine_cs *engine;
> @@ -4147,9 +4161,17 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>   		struct intel_context *ce;
>   
>   		list_for_each_entry(ce, &engine->pinned_contexts_list,
> -				    pinned_contexts_link)
> -			guc_kernel_context_pin(guc, ce);
> +				    pinned_contexts_link) {
> +			int ret = guc_kernel_context_pin(guc, ce);
> +
> +			if (ret) {
> +				/* No point in trying to clean up as i915 will wedge on failure */
> +				return ret;
> +			}

nit: no need for {} here

> +		}
>   	}
> +
> +	return 0;
>   }
>   
>   static void guc_release(struct intel_engine_cs *engine)
> @@ -4391,9 +4413,10 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	return ret;
>   }
>   
> -void intel_guc_submission_enable(struct intel_guc *guc)
> +int intel_guc_submission_enable(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> +	int ret;
>   
>   	/* Enable and route to GuC */
>   	if (GRAPHICS_VER(gt->i915) >= 12)
> @@ -4401,16 +4424,31 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>   				   GUC_SEM_INTR_ROUTE_TO_GUC |
>   				   GUC_SEM_INTR_ENABLE_ALL);
>   
> -	guc_init_lrc_mapping(guc);
> -	guc_init_engine_stats(guc);
> -	guc_init_global_schedule_policy(guc);
> +	ret = guc_init_submission(guc);
> +	if (ret)
> +		goto fail;
> +
> +	ret = guc_init_engine_stats(guc);
> +	if (ret)
> +		goto fail;
> +
> +	ret = guc_init_global_schedule_policy(guc);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	intel_guc_submission_disable(guc);

We usually avoid calling the _disable() function in the error path of 
the _enable() and instead do onion unwind. AFAICS the only thing you 
need to disable is the semaphore routing, so might be worth moving that 
to an helper. Something like:

void guc_route_semaphores(struct intel_guc *guc, bool to_guc)
{
         struct intel_gt *gt = guc_to_gt(guc);
         u32 val;

         if (GRAPHICS_VER(gt->i915) < 12)
                 return;

         if (to_guc)
                 val = GUC_SEM_INTR_ROUTE_TO_GUC |
                          GUC_SEM_INTR_ENABLE_ALL;
         else
                 val = 0;

         intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, val); );
}

And then call this from the enable/disable functions.

> +	return ret;
>   }
>   
> +/* Note: By the time we're here, GuC may have already been reset */
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	/* Note: By the time we're here, GuC may have already been reset */
> +	cancel_delayed_work_sync(&guc->timestamp.work);

is this only added here because you now call it from the enable? if so, 
better to cancel the work directly as onion unwind. If we do need it for 
other use-cases (error path from slpc init failure?) it might be worth 
mentioning it as an extra fix in the commit message.

Daniele

>   
>   	/* Disable and route to host */
>   	if (GRAPHICS_VER(gt->i915) >= 12)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 5a95a9f0a8e31..c57b29cdb1a64 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -15,7 +15,7 @@ struct intel_engine_cs;
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc);
>   int intel_guc_submission_init(struct intel_guc *guc);
> -void intel_guc_submission_enable(struct intel_guc *guc);
> +int intel_guc_submission_enable(struct intel_guc *guc);
>   void intel_guc_submission_disable(struct intel_guc *guc);
>   void intel_guc_submission_fini(struct intel_guc *guc);
>   int intel_guc_preempt_work_create(struct intel_guc *guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 9a8a1abf71d7f..8e338b3321a93 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -537,8 +537,11 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	else
>   		intel_huc_auth(huc);
>   
> -	if (intel_uc_uses_guc_submission(uc))
> -		intel_guc_submission_enable(guc);
> +	if (intel_uc_uses_guc_submission(uc)) {
> +		ret = intel_guc_submission_enable(guc);
> +		if (ret)
> +			goto err_log_capture;
> +	}
>   
>   	if (intel_uc_uses_guc_slpc(uc)) {
>   		ret = intel_guc_slpc_enable(&guc->slpc);

