Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623661F50C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E3A10E183;
	Mon,  7 Nov 2022 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A8210E12C;
 Mon,  7 Nov 2022 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667830454; x=1699366454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vnCAR48EsDBEBasQuSgotWIeYqseOPCoz3Uqwqgx5Fk=;
 b=jFsd7ourAYyDYZY9ZRlnR3an+bjUc+g3iDzgni2SNgKD3BH579xN/eay
 2vx5zPXlUHUL+2Rk2HZzDJNosmC2154HYdVlNXMojOVHlV1qImwCLNqQ2
 lYMNjrQRBtWaTt6awqVmTZaxdObE9s2m7m2Qp9v6jIxQAH8rw2acqYMhp
 PecmVMXkLmpqetXrQ5jR4mn84BJLGK3LBaPfj4Emi9gOlXBzXyoEHNCEA
 +sbEMQJN5wEksZP98iIcoZLMnvbaA42KfP2vvri2OybQfgX8yYPBcxVzm
 2gwuHI568zFFzzk0nRHl72PDivxFQK3V+1dLX19vfWzUCK7UM10qSqRdR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396713673"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="396713673"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="761105346"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="761105346"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 07 Nov 2022 06:14:11 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 06:14:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 06:14:10 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 06:14:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5/ODy/6YahO4KyWoDxQ2ufxAUc8FInYHInCB1QOIszW52a4xLb5PprOu2WHdSCnD+4Y+hji8IhBpbtmKFCaRXm3QTkJNptcHZAKX+lMdVuSrNGVl4AI0h3yxcrmtEZmJwAlU0k7C79sctJFF+qMsQiREoKHnrO/MBe/qd0XgEyo8/5M8RQWqUkEXG7opoCBBNYkzKaLGyCcecBtBiVbrUcUl8o2BFExrrMY82mZPFHO4derjqKi9lPDd3NMQheRYqjiREF8oJpa414hyimeaH6A61XIdwlRJhUHkZqGrm5GQiPau9Z4PdoSwprkdislwepWLd8wUXR2zc9QngxGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvSCfWAZsYBvMfq77e3sd2NqZQT0+H5x/yFv2lmdarc=;
 b=YEGq1a17Z0omQ39WPiaFxToSaNm/BU9lTxuU4E9Mmkk4gIAETsskHw1aJ9V+4KlU5LyC+4KT61V5gAWxsCgD+GAvAgMss79D1iiuYiQbQpDJ5DmIFPmVyj9uWmIrl4CCzsispo8t1UYqZ7f77LeJTkmRFuAxQSrbx95MXVllBNjdkb61xEUd/MQeF5M/cvT34haG3K5tjMJxwGhMmRWqSu73bOLFtHaOb8d5HzraUnM3gyOGsoAhxQHXRU6SHzl5mLnf/HeXaCSNH9yI022TPu2s+Ozo29CYuehEHLILpz0HBnIWUB9nksBPn3sGQlBAuc7S3vTJzrm6XdBsVEXFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 14:14:09 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd%8]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 14:14:08 +0000
Message-ID: <e7658756-aee3-5d29-bb8e-6d652cc89c88@intel.com>
Date: Mon, 7 Nov 2022 19:43:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/i915/mtl: Media GT and Render GT share common GGTT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
 <Y2AJ6yybXsknyUcH@mdroper-desk1.amr.corp.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <Y2AJ6yybXsknyUcH@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::33) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 707b00d9-01f7-4389-ebdd-08dac0ca55f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AE0LcxxuHHHIsYoZXZFovhe5c7GARBdzYG2JGFsfKUCq5wCSPL+9vlD1d4NBNv9Xj9jC1EIjQrKN/8eWi5/R54wuWrtcpiYRSIo/BZ/sO+x+2pvqRCa4ahaOxStjkZzClpdNjkfbxVbnztx/3riCV89QHcaIFyhxOrUFeM8WaNn64P1L2OQj2V3nWd9GihZdk6qDvhnji8Mic17Gv2C29zOHTlWoTNd5NXcZIEnBNyempo6wo8CYRk9Pjcrr7kfALrfZ1eqbcuBl5KhFhq7FEYGR4dRM5Uq0buv0jr3K0T3HlDNcxC7zV83nlxbgZecF7xx1oB4PXHWaFG66kDuarH0VvDVMI9JUmhw2E5Y3Q+oVkIl5QGldm8Xu01pyVp5dn2esxNyb5i7YrBwEuyvkf0yyNmQ9+Vr81hgSTixrbtgqQrboxyRnZZID7SKeOIlEo9iRanVre3YCLijPFkNncgz6Zhi4rpoNcD4+5MMMPiq7xJSthocQPrgD8udpmxIN7/nLFPAmEeajG6MhJUga992hwAtWpBW+aUF2bE9lXmfBJWcjT1MGI7UF8Az94xmj/MXhO0zZ1J8dcc7mhgwY/xlGS3MbpXeMf/a1UIEnt+SqXDljIyLBh4iS9dIAKWIl7huR8zxWmRMCgWIGNdou5M92ulRXS3eEHuumQnHA9Zzr3cpMcSIwh3a+y3kx8hbPW9m1yGZF+urg22gF/G9TyzsZyoO27pIMikO/pPRTfXJtw737oNf4Z7te08o0iiL9pFDm72IEJUFPGgSQ5Hjhx5pdT+F32bGidruzLLSi/BM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(6636002)(37006003)(316002)(2906002)(36756003)(6862004)(8936002)(5660300002)(41300700001)(2616005)(186003)(66476007)(66556008)(66946007)(450100002)(6506007)(4326008)(53546011)(6512007)(26005)(8676002)(31686004)(6486002)(478600001)(86362001)(6666004)(31696002)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9TaVpGV2ZHcmZMeWNlWFUwdjZaRlpwM3Vlak1jUW4rRWtlQ0JPM2RzQlhs?=
 =?utf-8?B?M2h0VmJzVFNqWG9WRXMvR1BoOGx5VFZiNitKczFmUVNJNkpEVHlZWERRZXFl?=
 =?utf-8?B?emJsRlFKNGV3OUQvRkRhakFSVEtSc01IZTBxZVk4cDVua3I1ZWZTZGR5MU1p?=
 =?utf-8?B?OUhjV280MDRHSWVONVc4SUN3QUg1dTU0UEM4K2FJejBYSHdhclhWVGRuK212?=
 =?utf-8?B?RHR1WFhWTDdGK0lhRjFRR05jMXp3Rzdpbjh3SlNFSXFNU1p4dHpNOGtNaVdM?=
 =?utf-8?B?OFUzRHR6VjNBVmtHTFg2TExyWmU5NWZnaUV6bnJqY1pRbzhmOVFiOHVBV1Fs?=
 =?utf-8?B?K2hSYnNHaGozc0NFSUI1U1hyOHJkYmJqeGZXOHN6RnV6MlA4cU04TnQ4bG5D?=
 =?utf-8?B?UU1KaldidDEvTjN3bVdnSnVtYy8xMFpiaEdHZndPTm1MTFB5dTdqSUExemFa?=
 =?utf-8?B?aVhPOXd2TnFMWnFxME9ISjlpNHNFTFBTYWVaazdQVEZYLzdZcmp1WmVkTTc0?=
 =?utf-8?B?U01BK0FpYUNzVHZXWW5YM25nZFJ5ZUExNDFEOUJ1ekVOSFNFMGpqeUhsL0Vx?=
 =?utf-8?B?bkY0NUJhMDZsbkhKN0NjcVBGWXFBVmkyYWFLekxHSkFWTk5Sc2xSVjNYRlZx?=
 =?utf-8?B?SXZUd1JYNCthTWlBa2ttWXZIN25MTUd1aitUTUN5NGk3R3puelQwRmoxdDll?=
 =?utf-8?B?R0o2Sm41VERzS1FhWE1HK29qajhtUHBpTm9Zd0VaZXkvZllyTTNxL0h0dWZG?=
 =?utf-8?B?VlhFWlJjUGY0MC9vTSs5VTJVby81cFRZQ08zZUNBZG1zN2ZTRTJLSjFEQUx3?=
 =?utf-8?B?MlRQTzVXdWlmbHduMEpiazZ0Q3ZMMytvNk5seTVFeG9YcmlXck5LZzVLSW5I?=
 =?utf-8?B?NlA1OFJnTnRyMUd0bk05N2x0cWtCVEwrNlR2UGJNb1JCTWxPWlE5N2xCMVhj?=
 =?utf-8?B?WUhkN0tqMjhmKzRpYTJIWjBmN1pUZENCbFhRZFFyeTFIbzI2MFhYTDFQOVB3?=
 =?utf-8?B?NEt2czlDQlFLRkpnQ2FMY3hPMUpNWnNJc2JBakNudTZnM1cya0R0TXMyN0hx?=
 =?utf-8?B?ZjV1eWJMN3pwTTNLc2Z4ZkJjOEM4L1lxOHY5ZUJIamtUSUJqWkVyaHZ5UDdr?=
 =?utf-8?B?dHpXejl5WXZvRDlWS2UzeExmQ1NrQ3dmWmVBOCtEa1UxcHpzZEcwUlp6ZXEv?=
 =?utf-8?B?OTZGdmJHa3B5OVlQS0htSU0zUmFKOE01eFRwRFNKS2ZsYTYwd0s5a2lDWDQ0?=
 =?utf-8?B?cUFUYkJCVHQ3RXFCTjdCcXhlWlhHeDBpMDhuOXMrQTdMVk9aenB3Z00vT1Jm?=
 =?utf-8?B?anVIcGIwMUR1Ky9Hb2FqSCtDVDNwQlRaQVNyZFp4RVpaUTNzdE91RnlQSW1x?=
 =?utf-8?B?Zkc4S282MmJVdUdrWXBQM2wvM01GSE1mT3NoSDJ5Z292b0gyMUp6RGhGUlRk?=
 =?utf-8?B?ck42UGJ0eU9YdWQrLzRuS2Z6OGdETk1WRzBQRmlWUWQ0Z3FQVG9vQ2ZweW1j?=
 =?utf-8?B?MGlSR3plcS8wTkRzc21SWkw5ZTVSMXdZR0c1bmdHdDVRdGxZSFYxSzhIL3FR?=
 =?utf-8?B?anBjR2hUUkg4dnVDTG41eU9ubmxXaHNGV210YTZJMHBwem1Dc0N5blpFL1N0?=
 =?utf-8?B?ZjVHMTVXSzdCbVZkK0JHMExZTFNleTQwQmJETm03M0poUXFmRlp5UWZLQW1s?=
 =?utf-8?B?OWJRU1RRWTlLQzhyamdJTVBRNGM2ZW1TM1ZuaTVKaTcvWDBhcG02aFlZZGxZ?=
 =?utf-8?B?aEhyOHVnSytoTXkydXFlN2FNQmxTYzczbXduaURnbUtDQ0JZQlczNjErMFR1?=
 =?utf-8?B?M2phVFZjMmdKVTJBNmJROHdxdU96TWdiVytXUDBpc3ZpRXV1K2VyQjllOGpH?=
 =?utf-8?B?YVNDb0Zpa0VlV2hwTWV0aDJFVENKRFJBSWsrVXk0MjErOFZDbzhaSVJjODFz?=
 =?utf-8?B?VVUwQjNaRVViVU55YTR3YUZIMnVvYUNtaVh0UWRGc2lGTEZNck9mcHl0aHR5?=
 =?utf-8?B?bW9CaW9sK1d5VnpIVDJtTmtNU1M4U084cFRQdGdxT1FXTndsZWZDUHpKNHRD?=
 =?utf-8?B?cERhUjdFa2dTREZMWjdxQ2l0VDluemVpRTBNMzVNS0lsQW9jTzRZTUhYU3pK?=
 =?utf-8?B?MVJrUUlCeEZrYVVMblFTTHFxNG9GcjlOWXpmeStHclNLN0xIQmxxTldsSEd6?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 707b00d9-01f7-4389-ebdd-08dac0ca55f8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 14:14:08.8086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQ6/n07m/78VIXTWnparTc8uKv0/0to5JD+vFgIYx1auOQzoEMuzTvAbEEkRPWc+W00iNWNmaWrebtq/rRZYN/J1xWMKov5OnGwHzOIEOB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31-10-2022 23:16, Matt Roper wrote:
> On Mon, Oct 31, 2022 at 06:01:11PM +0530, Aravind Iddamsetty wrote:
>> On XE_LPM+ platforms the media engines are carved out into a separate
>> GT but have a common GGTMMADR address range which essentially makes
>> the GGTT address space to be shared between media and render GT.
> 

<snip>
>>  
>>  int intel_gt_init_mmio(struct intel_gt *gt)
>> @@ -965,6 +973,9 @@ int intel_gt_tiles_init(struct drm_i915_private *i915)
>>  	int ret;
>>  
>>  	for_each_gt(gt, i915, id) {
>> +		if (GRAPHICS_VER(i915) >= 8)
>> +			setup_private_pat(gt);
>> +
> 
> Since the term "tile" is used for PVC-style remote tiles (which we have
> some framework for, but haven't enabled yet), it seems confusing to have
> the PAT setup for all GTs (including the standalone media GT) in a
> function called intel_gt_tiles_init().  Maybe we should also have a prep
> patch that renames this function if we're going to start doing non-tile
> things in here too?

But isn't GT and Tile used interchangeably. Also, Could you please
elaborate what do you mean by non tile related things here and as i
understand PAT are per GT registers and in case of SA Media the
gsi_offset get added.
> 
>>  		ret = intel_gt_probe_lmem(gt);
>>  		if (ret)
>>  			return ret;
<snip>

Thanks,
Aravind.
