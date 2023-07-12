Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B260A750F3A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 19:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6755410E595;
	Wed, 12 Jul 2023 17:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B57910E595;
 Wed, 12 Jul 2023 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689181505; x=1720717505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eV0DIttmhehjmF3pSu9Nr/HScdODUH32rUt5Sa625ps=;
 b=DBiVJsez5Rxx1iX5PlBVQdj87fmskJiJAcqclDfsBMib20Yrxtawg2RY
 G79mGFxlerx3VPtBung94t7/P9wbFxpwvdi7xgRDQhPw/3rFuVTTv0xl5
 +DMgLxq2ebSuiNvgJ8Qv3oBO58o2G0GG8Vz5Vf4r4zh5TPOrrAOP1VTuC
 Nl19Uz2sK6mE+ThfxDh/g3TGSbrpsbm4eZErJL1686LHw2k5oS7Y1UAoy
 ApSNatB+E8SU+9tk5z3fYufsMTtbjEbwtgfAvchffhbrfUulzPmXF8W6U
 UXbyv4xNwyLVVBETMWXjyvwv74nxpX0btnH/FwoP6yeLG/cQ++CGRd0xI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="363813945"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="363813945"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 10:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="698930145"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="698930145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 12 Jul 2023 10:03:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 10:03:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 10:03:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 10:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NS8rWRInWTCrxLGhQVxhGJYbkdCZYDLqs63NCCmjjj2L5jiL1qQgsJhI4GfOTTqwHXGd2gGFEUaZNSlE8GdKm7XXZOKVpdeylmrj8ojIRm3kIWqzZuFVLs5r2DEi1vbWzW4jGT8MjE9aMAmZz/hrCO36gk1iqzikFnWZkhqykKArPVQ1B2DICY+4ZiYRmb7bO+z8Cn6698CUlE5FCGSZ0qZXTw04IYvd7eCg6MBI89N5J4jvVmAl5aGFlsC9EWVOtRyCebeGaaE0HHxp1axExwsQo9vtQL/pHtMs3PAlCAB3KlM14QM6BcHXcglSPRP9jLRW9uS82elwmJO82/E7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rvsOHATM3zV5EIfEVexwO8hRP/WwtOLe+qy/rdNy+8=;
 b=ocE9RRHiFgC35v0wAs2YUoVSbONrhWFtyE7zSr9SgtStljnHDLRSoMQXrDlFtd2rFdKYE67W2ncy+k1gO5ffkPt+aGKuKgn88+SXp7WxX6YdNg6rgN6n+hbe6Zh6WkfRHx7JRoQ6grgY9Zhcjrq5EB6aJVVqG703z8dZWZ6SCtUVDZzlK16enO7Mf2HGWhpuIXpQ+Y5mMOLyURsggHjKX1aCrbJc2YJdpH6IDEvyKcZw2f2iy6iTeq2kJK5IXssC3jAsCVd6nppEPrm4m5baMif/zu9fESVr2yuQ73mCoHLDamKUbpfjdRiAJJJqkBK+8XzepqlZPRQhHUQ6cNhmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 17:03:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da%5]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 17:03:28 +0000
Message-ID: <069965c2-75da-3462-3559-4c2bf00c044a@intel.com>
Date: Wed, 12 Jul 2023 10:03:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: check HuC and GuC version
 compatibility on MTL
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230711203150.4140313-1-daniele.ceraolospurio@intel.com>
 <39c15fad-92fa-4414-11f5-b7a8e60ac5d2@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <39c15fad-92fa-4414-11f5-b7a8e60ac5d2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::45) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN9PR11MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: 4094dbc7-4d2d-4ba9-c9cd-08db82f9e987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkAzJoEjUmv478daKQ1A57Afy5tFlFy/aTaU+Xa3ADltubZwEHOHxqaK1s+tK9JNQ7B94fYyLDTdb4g+cPqJU48NpFQt8Vc4Mn36s50jui08VGiMYiTSLI+H6GbpG7UeYsTZ99YgDbkaGskwt9yYwBvcD/ToMKHIMUWFJbrR/rKCu8CS7xRgvrywBV2YfHozDGY9CvR8jIwmpAzJMWramaYi7b9+SwViy2qhttozDGxdO12IpWWQsK0c8t3sQaZFrIsnoOPw44mg+mjbFGgDpIg6WYsR9pVR3dhEX9IrO0KBy1AShlyxarTKr+iyNGvflK8OMSExeqIQp3dG6ngkTCyyoUNJJt3Ubb2/EWRbRuRPiiw0roO+1WuzatoeheG2/ed8aAi59mTnLysFhUqVc1vYgAXD9HtSSk39KskwNPZA0+TVmfnf2hhbpMzwY3VgiFoEDSXwgYoFyY4TWa48SKfi2ttnjvSgmq69RqUhOjrR/daq5ke1BBa+m4oz2r9cwLo19sI3Qhhl5zmUJHApE4jbxkSWjHSrYhWyotD9mN5b8RirOH7w6R43mhUQoANM+In7Td3qaiC06cCuJPeAdtnVBewRJXMcROwYaGXCbst/n5mBYzLPBVun9sKdMrOlKJ9uh7ychYG9xct3F7zjsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(6486002)(2906002)(478600001)(82960400001)(36756003)(41300700001)(8936002)(8676002)(5660300002)(38100700002)(316002)(66556008)(66946007)(66476007)(450100002)(4326008)(31696002)(83380400001)(31686004)(53546011)(86362001)(2616005)(186003)(26005)(6506007)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdseXdFV0dNSW5HZ3oxUG91cTBWdWdxSytocjF3VVBEbWF5cFo2bXJHNHJZ?=
 =?utf-8?B?ejM2TTJzdC9JTFJwb1pCM3o2alF2NzJaMjk5Um1FY3NpMHZUcFB6SjlsdHdi?=
 =?utf-8?B?YXZQQkhPTHhPaEcyYjRtRlJ2LzNQb0dJVmpEU00zd1BWRUhIMEVZVW14YzBa?=
 =?utf-8?B?d0xtcng5L3BEeXZyMzVjKy91cTVsQ05Vc2lLM3lyZ3ZCYmtjVVhmVVF1VDFn?=
 =?utf-8?B?ZFVQS1ZSZmtmdloyYjVOVGJJRmpMSFptUnA3UWxra3h2T21Ic3Jub2tmWVN0?=
 =?utf-8?B?Ukk0TnpxVkJDb3UvcXNYUUJBOU9GMXJjbnhHdWM5ZXd0L015anplbjdERElm?=
 =?utf-8?B?WVVyWUxtUmkwOEY4dmg4RHlmcnlTZ04ybUVLaVJwdytEVUtXRnhEV09KSmVS?=
 =?utf-8?B?TEVGRFc4d1JJRElUMWE1d0ZBM0tzcFVjTWdTQXArQ3JKMm9CUWJaUU1TdC91?=
 =?utf-8?B?ZHd3eTNBRmFIYURaSVZpSjR5U3p0K3RKbGZIZmhnRVR2VkZmNWVtdCsvSlZq?=
 =?utf-8?B?dThpaXltSWM3NmV4WkkxdUpZMm5icHNSL0cwWmdDY0pyUzV0a1oxUFpyVnh4?=
 =?utf-8?B?YzNLUk5kemV0clN4TmJ4VDJScVJzcG5SZlBXdjZxYzBjeEZMZ3FwWWVhNWZ4?=
 =?utf-8?B?b0tsV0tKdmRDaTlvK3ZQWEhwQ2xnU3dlbXdiSWVtZ0ZzWjFzSFordHBoUHFN?=
 =?utf-8?B?RHdGenNHY1h1QUtoYUVQZC9ZZ01kRHZ4c0ZHQmxtQlUraUhmdllreEhoVU1B?=
 =?utf-8?B?bCtsQTdBZHo1c1hkVFIrcWxzWHNpWThXYUh3dXdzOGhEQVRZSm1xZ09NYjNF?=
 =?utf-8?B?WmZlMWswNWFJd2xDYzNySUpoNUt1TEhOUDRqb1JwS0JOZTZQUWVTRHdubTBM?=
 =?utf-8?B?eDM2alZYaUtXdFJYQURSNittMEhSTmhSQlllSDBtT2JwVVUzN1RGdlNydjlw?=
 =?utf-8?B?aU8zaEloaFZGN2FocDhRblJ0UVNRWHRBaVpHRkdOKzA2aVlkdmhSN0VYK2c5?=
 =?utf-8?B?ZlVJUmFrYjZybWVpNEVUWmpreERnUVdYc2FhQm4xZk1NRDFnMW52WEFIRnY2?=
 =?utf-8?B?ZCt5ZzhMSFY3dTFsS3hVZTBsaHprMENZOVdGbytoS0dBd0NEaTJFR3lISGZ1?=
 =?utf-8?B?VHhhc0RVNXVpVG03d3FQck9jNHRjcG9UK3h1bTFQZTBEdndGYy9hRVhQQlBX?=
 =?utf-8?B?cXhXK0pFRlJMR0JqRkxvdlk5NDIxV1puNWdMMFRtbEVkQ0VOVmhFV1F1K1NV?=
 =?utf-8?B?WHRnSjQwYWY1SXN0WW1HVlJmOXAxVnpHb3J5R0I3NFgyMGN1bU4xdEV4RU01?=
 =?utf-8?B?OXlpNDFOSHU4a0lTSWQxS01kRVdBWlVrR0sramRlUGVsRHZoUHdONS9GVWsz?=
 =?utf-8?B?MFErbjF2WWFBODZoSGlFK2p0Q3ZHWnNUWTBKWm5NNVh0TG51NE03eTdnSVdM?=
 =?utf-8?B?ek41V0ZycDh3eUQySzZxS25oWk9DbWttSWx4N29pcmorMXYyZ1RHS3RhQTI1?=
 =?utf-8?B?Qmp5Zk43WTJJbHA5QnVOM0UvcGFVRVJkN0d5emowMHNEdklWcUw0Y1NyMC83?=
 =?utf-8?B?N0FDN096M1FaN211V2s5ZEI1eWZXQThZMG05OVR2dzdZaTF1Q3lnc1ZndXRR?=
 =?utf-8?B?UlBLdTdxcTBkeVpiRVNwUUFDQmJZKy9pMHUweXRoc2lXaWNnREd5TmlvNWhu?=
 =?utf-8?B?SVQ3em1xSDdtUFJYWHdGZmorYU56NmttQmJsM08ycVdSMlZ0MUpqaTJJRGNJ?=
 =?utf-8?B?Ymd1SmlwOUpSemp4VXJmYW1XeDNmTEJWYlFDbjhYUmE1MjdiSTdRek1maTlZ?=
 =?utf-8?B?UEpuRldnNFBNZEtqaUpnQlZVMHYvTkNENmY1NUFwWGlEVFZHZWtFbkd2VFg1?=
 =?utf-8?B?b2FoQlhPbERDZFpWeEJpWG1JZW9rWDFGdFRkQzF0WnRnNXRBZGg0am01N3Vm?=
 =?utf-8?B?UW1UMmVLUk1IZGtocWdpNDlOZ0RJOUpuTFBFdHBFMkpVY1M5VTBBbHJSYzhH?=
 =?utf-8?B?Q3hiT2RLRXk1S3RrZ1NBbHRySzNHak1EakFvb3llb1VzM0kyWlM3WU1La0lz?=
 =?utf-8?B?ZXZJYnFpQ1IwcEVBUHkvUkYvVWo3QXdYc0YycGx1Zzh6dW9HdmRkeHBtZnMv?=
 =?utf-8?B?UjRuTkp4QXVQbUl1RDJrZlg2VmJMamkwdVREbzV1dXNrbE54M2FXcVEyMktY?=
 =?utf-8?Q?e6qPMpmuvHTy40qzTCCV6w8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4094dbc7-4d2d-4ba9-c9cd-08db82f9e987
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 17:03:28.0864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppEHGe4U2OHdyasFAhVMA3SuaIeBerT8v/N+QqpkcKD26XzfZbsCvNLpfVydFgiJdno0EqmT89J1NYtmHu7pF4j4I+uJ1pN2aV314cAWDN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 3:03 AM, Andrzej Hajda wrote:
> On 11.07.2023 22:31, Daniele Ceraolo Spurio wrote:
>> Due to a change in the auth flow on MTL, GuC 70.7.0 and newer will only
>> be able to authenticate HuC 8.5.1 and newer. The plan is to update the 2
>> binaries sinchronously in linux-firmware so that the fw repo always has
>> a matching pair that works; still, it's better to check in the kernel so
>> we can print an error message and abort HuC loading if the binaries are
>> out of sync instead of failing the authentication.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 42 ++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 08e16017584b..f0cc5bb47fa0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -803,11 +803,53 @@ static int try_firmware_load(struct intel_uc_fw 
>> *uc_fw, const struct firmware **
>>       return 0;
>>   }
>>   +static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
>> +                       struct intel_uc_fw_file *huc_selected)
>> +{
>> +    struct intel_uc_fw_file *guc_selected = 
>> &gt->uc.guc.fw.file_selected;
>> +    struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
>> +    struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
>> +    bool new_huc;
>> +    bool new_guc;
>> +
>> +    /* we can only do this check after having fetched both GuC and 
>> HuC */
>> +    GEM_BUG_ON(!huc_selected->path || !guc_selected->path);
>> +
>> +    /*
>> +     * Due to changes in the authentication flow for MTL, HuC 8.5.1 
>> or newer
>> +     * requires GuC 70.7.0 or newer. Older HuC binaries will instead 
>> require
>> +     * GuC < 70.7.0.
>> +     */
>> +    new_huc = huc_ver->major > 8 ||
>> +          (huc_ver->major == 8 && huc_ver->minor > 5) ||
>> +          (huc_ver->major == 8 && huc_ver->minor == 5 && 
>> huc_ver->patch >= 1);
>> +
>> +    new_guc = guc_ver->major > 70 ||
>> +          (guc_ver->major == 70 && guc_ver->minor >= 7);
>
> Wouldn't be more readable to define sth like UC_VER_FULL(v)
> then use UC_VER_FULL(huc_ver) >= IP_VER_FULL(8, 5, 1).
> I am not sure if it is worth for two checks.

We've been trying to avoid those kind of macros because the version 
would need to be a u64 under the hood (each version number is a u16) and 
therefore type casting would be required to make all the shifting work, 
which makes the macro nasty to look at and as you said IMO not worth it 
for just 2 checks. Note that the GuC is the exception because it 
guarantees its version fits in a u32, so there is some macro use in the 
GuC-specific code.

>
>
>> +
>> +    if (new_huc != new_guc) {
>> +        UNEXPECTED(gt, "HuC %u.%u.%u is incompatible with GuC 
>> %u.%u.%u\n",
>> +               huc_ver->major, huc_ver->minor, huc_ver->patch,
>> +               guc_ver->major, guc_ver->minor, guc_ver->patch);
>> +        gt_info(gt, "MTL GuC 70.7.0+ and HuC 8.5.1+ don't work with 
>> older releases\n");
>> +        return -ENOEXEC;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   int intel_uc_check_file_version(struct intel_uc_fw *uc_fw, bool 
>> *old_ver)
>>   {
>>       struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>>       struct intel_uc_fw_file *wanted = &uc_fw->file_wanted;
>>       struct intel_uc_fw_file *selected = &uc_fw->file_selected;
>> +    int ret;
>> +
>> +    if (IS_METEORLAKE(gt->i915) && uc_fw->type == 
>> INTEL_UC_FW_TYPE_HUC) {
>
> Moving this check inside check function would make it more generic, up 
> to you.

This will hopefully never apply to any other platform. This is a light 
breach of the HuC compatibility contract, so I really don't want to have 
a generic function to handle it. I want it to be clear from a higher 
level that this is an exception for a specific platform. Maybe worth 
adding a comment? Would something like the following make things clearer?

/*
  * MTL has some compatibility issues with early GuC/HuC binaries
  * not working with newer ones. This is specific to MTL and we
  * don't expect it to extend to other platforms.
  */

Daniele

>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Regards
> Andrzej
>
>
>> +        ret = check_mtl_huc_guc_compatibility(gt, selected);
>> +        if (ret)
>> +            return ret;
>> +    }
>>         if (!wanted->ver.major || !selected->ver.major)
>>           return 0;
>

