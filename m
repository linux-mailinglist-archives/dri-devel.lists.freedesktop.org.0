Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE06F2195
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59BE10E23A;
	Sat, 29 Apr 2023 00:26:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C729D10E23A;
 Sat, 29 Apr 2023 00:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682727971; x=1714263971;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QX4md/UiUdqmr+Y4Zy839lCAmaMdVMSx8cD2r1w8Rho=;
 b=em7La9TJq5nY8Sq5W6ZsDNnVP3CODmo+H2/5pTVWmZ+z8ukdDP+nelHq
 im7aeuyoT/CMBDfC0JBMTTCem2SWWxuSPASPEfyORZNYFNOx5SKawSzIp
 fr9m9z4kX9Zi8tmej2r/SFosu3kAJfguzF5OLK4o2svR29vg3vZQMZ50G
 JIRGAcRBQVm9F8EnE4oUSuLNRqe/zuJeceVuuu7N0FXVhbA14KcWPk1VV
 TvJqtjeyUTSUabwYHyRlsZVmBdJsIWXvh8LDmVl9bXBe0NM5TSV2O7Vbn
 68+Ut0+e1gR6wVzHbPPOyPCgvU+GVLEnj3VgRDFr6pz3oGBvhqx2mKVuo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347913416"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="347913416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="725536747"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="725536747"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 17:26:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:26:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:26:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwIqJGnCsd+VMxFZ3qLZ7DK+Cl8mIbdIWNu0RQPY46D8+cnISV2nPSz2iaiUhZh6y58FoyCouSzbyouTNbNNEMpEcH1AU6t9wf7eyvPDI9FdSd05Dw1uPheitU6zTTWQIWZnZUoMl9cZoj2CaMrKJgkO5NNT06qvsu4Wc3dGXhdFJW++j5QSTGhprbioezKCdu1JWp8SuVza4eHWW8/gnnEhj0gSdhulgBiL4U4Mbw7/cPLmD/bBnB+ldmmMWQwNhbz4Z3VU3lA35/e26R3w2K3NlN7WxtCdGj3SfJe2I43JR+rWMSvu7UME9oZ3s2iLEyVkUz9hK/TmKJYcUcsTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFuT5SflAJbc4P+7VlsYKtREIUhBRRYJEYpC6jKw6C8=;
 b=EsUn41DgQBY1f33CM/ZXvdRUI9g0end5lCb0m41xLYAuLCYp1Ey0046XAYa/Sp7lCee5EsAUUtEKYpAMRGcJFJZ1Fr1XZvnivEgv9PIpMViNg+18YMSETQiK/lDM2wuNsvUGhN6YI+T3zSL9212mwSM2PMrCEqAAmHRdKmeLk2J7cNqF9LL9D5iV++4wiaFQw7TbSfoNqJ8YUOs+Rze74XeD0yjlZ66/UDHHsXKpKwBUEKel0KxrL+aHG+pcMJ6THUT1LBxwv4E+fOtCsQXoH6lQXmka9iCuvg0A2u14nX+UT9TLAAo7xHsAiMoHgzngXjFpmbMR39k3hlmRPbQ/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.24; Sat, 29 Apr 2023 00:26:05 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Sat, 29 Apr 2023
 00:26:04 +0000
Message-ID: <579dc07f-70d5-c444-17eb-89a5d4a38261@intel.com>
Date: Fri, 28 Apr 2023 17:26:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/6] drm/i915/uc: Enhancements to firmware table validation
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-5-John.C.Harrison@Intel.com>
 <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
 <8540acf3-82bc-629c-1bb2-24ee377e851d@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <8540acf3-82bc-629c-1bb2-24ee377e851d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: b3025f26-e8db-4465-63e4-08db48485131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hs3odEa2BCwQPkGgPdCbZInEtXkcq/coaJtUlfnQgKkMLA/pvYAunqu+X2Ja2tnsLTLYwet7FiUkil3z2lVXf+GguJ6Doo5DVIoe28Sss0UsNYM99PHwEOF/Cbe0mOt61IhmwCHBvD+eCwFNbvNe+0tMw5AIHr0ZvWUAts2lzHbF3FDuDsauVn1sAH+XTyUUARkwS3QDJvJv5+TZtGCDnhhD3KLwdpI2lEFjym0eR6ozIMb8yrinpo6EOirwcXH1MtIjnaWwi15GTtu56WW5doMgPbqUOZfGrWzIjZ6Fqo++U7BNeU0zeZjhAjmWboxL5L+KZMdktV7xwulZTfy91m7YNeFZ+R8bJniTNSdrxLsLQ6pobdV7kpPKYLpJ4yWcCV0Rre9RPzee/qo7M1u12l1hUyZFq45Oi27kWuWy5FHA0NV546tzjRRShaJueeGtPS3PhnFGpCGtOCifQOiSvNQ5HmdbZHG3JIwC50c2pvum/C6FQ5/5mD1eOtQR+N9cRp/nXMVeHl1xO2a8q20eHFyoXGM65uBaAb4r06bg7wqNa0OfE+sp/4cY5VQa6O5adOu+470PaALPpgcZNnpW38WPC0pZ427mHmpGnmhjqSNSFVfiO1Ryrrv56BE+SZuR8SpCiwBkey7AWSDCGp1yaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(8676002)(86362001)(38100700002)(31696002)(31686004)(478600001)(83380400001)(2616005)(36756003)(8936002)(5660300002)(316002)(6486002)(6666004)(66946007)(66476007)(82960400001)(450100002)(66556008)(41300700001)(4326008)(186003)(6506007)(26005)(53546011)(2906002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZCZVhSZCtDdnpjTUNJU1ZKdE56U01Vc0hoK050OE9nWjlIOFBub2dFMlI2?=
 =?utf-8?B?ZVNDK1E2RERtMDZ4MG1LQ0V5WXZ3NDJjT1ZMRWhXZkw1eVh0bjNReTJXcXFO?=
 =?utf-8?B?aUJldzZEdWJFZ0MwcUxkQTB5cWprbDlmbzk1c0MwRTRtZ0hOa0lQSmhzR1Ur?=
 =?utf-8?B?WVV5ZjVBZkhtOHd3bVdmZklrUXJqbWUyYUR4NEFCUENNMkJ5Rk1EOENyUzk3?=
 =?utf-8?B?cGFLZVlPY1B3dzM3d0F4eVlHd3R3SXRidmNaa1NQamRoNmlmaHlGamNnZjFS?=
 =?utf-8?B?eDZGTU0xRlpZNnRXOXFOalJhR0ZGSDJYVS9WNXR2UGJRYU8vVWIzdzlIRlEx?=
 =?utf-8?B?aVFJQjk1cnpzbGJLV2d3SC90OUxDUWZmTHNNNEJXVFJGLzRNbWhweUxyOWdR?=
 =?utf-8?B?OWlBOUxLek1jZDhNRWFFbllnTDAwVVBEbVN0QzBreWF5MjhKNUdhR0I3UmtQ?=
 =?utf-8?B?dEQ2OE1oaW02d2JrbUF0MGNWZWlPTDlwMDhoQ3U0dHBMNm9mSGx5cURzcGU1?=
 =?utf-8?B?Mll3M0JFTDhBM2F0Nnlham1wR1d5TGwvWmJCM1ZXa1kwVHgvdVNkVVVRR3ZP?=
 =?utf-8?B?cUFZbFptSXFtME11Y2x0RFd3OCtSdmlxMi8yVEtkQnYza2lYVlc2NEhzMWUx?=
 =?utf-8?B?ZlZpNFlFcmlZT0ZxNkp3QVNWYVQ5aWZFUlYrWlRZVFUzNm5HSUlHdnFsQ3NU?=
 =?utf-8?B?K25GWVNxd3JxcUtzSzN5L1hkYUVKaERkTDNnemhBZlNxRndXc1Jud3ZEV1ds?=
 =?utf-8?B?a0hwbzN6aFNCcVNpK2grS2tmdXJraExOZEg0aDVjSEJ5cW94dFgxTk43RmpM?=
 =?utf-8?B?VGNiZ2oyOHY2eE5iZi9Xbi94MFQrZ0FxcmQ1cFhIVnY4ME1ST0lHY0Q3bUNN?=
 =?utf-8?B?L0FXazZZanpRcVAwbkYvRENveXFSb050MTdSSGZXVGpCQnd2NHN5MmdzOHhD?=
 =?utf-8?B?TGU3ZDlLaC81YTZ2ajByYlJWNXpJV0dXSnhJT0tlWUp3TDltc0t4MnVmUXVn?=
 =?utf-8?B?b1BSYVFEN2ZYdHZQOVNDaElZRmZ0eUxyWDM3QjkwQ2ZmdjJiMFFNWGZkcmts?=
 =?utf-8?B?NU1sWmR4ZWgyaUlGSndudTNMSFNaekcvWnF1K0s4Zm1FVkJwWkdiWEFod3lZ?=
 =?utf-8?B?Q3dSQ2o5QWdtZmhrVzVUNDM4dTJxb3NicC83K210SzZhd3Y1cXBFYVNxVFh5?=
 =?utf-8?B?bUFITGlDdDh4ZDM5YWZmdlhFMXU3aWZPd2E4d1FvQ0VvMnZvWFhQbllCTE5z?=
 =?utf-8?B?ZWlqeFBLODZ2UE82eHdsdjZJalhlY2dibCs3SUNuMzdkVkFvUWQwUXNGNzRX?=
 =?utf-8?B?bGxOWWtUc3ZpVndvdnJGSHRsRkJyRitKTnBrK2V6TGtEYXQ1c3pSR0pBZFpL?=
 =?utf-8?B?Y0RnTjhuRHBTWCt3TzllRE5CbjdEZ2dLNGdnRVNZWnh5dDZrNlFyZnk2SWtz?=
 =?utf-8?B?bzFuVTduaVlnVmt6NHl3OGRCM3FUSEZsVFBqU3hSWEJ3eXE1dFpNcThZbW1n?=
 =?utf-8?B?ek9PR0ZyT3lGS0JvYXprV3BXSnpQRzVJQWE2d1I5dGlYSUIyMHBFYTVyWHNP?=
 =?utf-8?B?TnRUOFByM1RTU2ZidjFmZGQyd1RNaEU4U2RiVGNwRDZLbmRRcDJFNGh2NDQy?=
 =?utf-8?B?VDFwSXR0Q1hwZktJa0N2MHhXemxXTEg4SENQMG53bjFzajlKeEIzbHFpTmdC?=
 =?utf-8?B?NEh1NlptOUVlTWtlaVRGQmZXd2VpU1dkWTAzUXU5a3ZOdHRyUnRvZTVpNzBa?=
 =?utf-8?B?RVdUOVcwakV0RVFrb0FHbkFPTTBJclltb3ZQQWxYVGNvdThPTTExV1g4Qmtw?=
 =?utf-8?B?OFlmU2NMaWtzK0JXeGVJSEtrWEJoVkV4a2hRT2NLaWZtS3U4Ry8wcWVyMzRN?=
 =?utf-8?B?SnZDYldrVTdIS3ZDczMwTlhNd1R3ZUs2aGpjcXA0Z3pSWlFaTlo5NGNVQlpI?=
 =?utf-8?B?amJVWDl2UThndjRTTzFjSXM2eGs4SkFma3J1NmFyV2dnZWJiYUxEMmdxWUp3?=
 =?utf-8?B?YU1VWnlQbDRDR0pLL1Q1ZUdpTUVPRnVvRThVdjlPV1RtSENlNlVWcVY3NEhr?=
 =?utf-8?B?dFF3UWgydjYwaCsrMk1HSkFSZFUyYWNMRlFrQXVwbXNiYmwyeDRsdU4vNlBi?=
 =?utf-8?B?ZGIwb0JXMVJnUkptK1BucjhoZVAwamNNZFdRTEE2QWRLRlFUazJyL3RNQ2w1?=
 =?utf-8?Q?ZpnrKCoLzh1fh8H0W7yRfpY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3025f26-e8db-4465-63e4-08db48485131
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:26:04.2984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/K0EsD1cNlLUa648o6o2jhVbTds7tLc46Bkl8tIyAHDBjd8sSqdgvNUy59qoXCn9ByVMjj3zSwj96WjS9wOiVqh7pWOucNjHHZYl7kZpgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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



On 4/28/2023 5:16 PM, John Harrison wrote:
> On 4/28/2023 17:04, Ceraolo Spurio, Daniele wrote:
>> On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The validation of the firmware table was being done inside the code
>>> for scanning the table for the next available firmware blob. Which is
>>> unnecessary. So pull it out into a separate function that is only
>>> called once per blob type at init time.
>>>
>>> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
>>> It was mentioned that potential issues with backports would not be
>>> caught by regular pre-merge CI as that only occurs on tip not stable
>>> branches. Making the validation unconditional and failing driver load
>>> on detecting of a problem ensures that such backports will also be
>>> validated correctly.
>>>
>>> v2: Change to unconditionally fail module load on a validation error
>>> (review feedback/discussion with Daniele).
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 157 
>>> +++++++++++++----------
>>>   1 file changed, 92 insertions(+), 65 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index c9cd9bb47577f..eb52e8db9ae0b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>>>       u32 count;
>>>   };
>>>   +static const struct uc_fw_platform_requirement blobs_guc[] = {
>>> +    INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>> GUC_FW_BLOB_MMP)
>>> +};
>>> +
>>> +static const struct uc_fw_platform_requirement blobs_huc[] = {
>>> +    INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>> +};
>>> +
>>> +static const struct fw_blobs_by_type 
>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>> +    [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>>> +    [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>>> +};
>>> +
>>>   static void
>>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>>> intel_uc_fw *uc_fw)
>>>   {
>>> -    static const struct uc_fw_platform_requirement blobs_guc[] = {
>>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>> GUC_FW_BLOB_MMP)
>>> -    };
>>> -    static const struct uc_fw_platform_requirement blobs_huc[] = {
>>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>> -    };
>>> -    static const struct fw_blobs_by_type 
>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>> -        [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>>> -        [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>>> -    };
>>> -    static bool verified[INTEL_UC_FW_NUM_TYPES];
>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>>       u32 fw_count;
>>> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private 
>>> *i915, struct intel_uc_fw *uc_fw)
>>>               continue;
>>>             if (uc_fw->file_selected.path) {
>>> +            /*
>>> +             * Continuing an earlier search after a found blob 
>>> failed to load.
>>> +             * Once the previously chosen path has been found, 
>>> clear it out
>>> +             * and let the search continue from there.
>>> +             */
>>>               if (uc_fw->file_selected.path == blob->path)
>>>                   uc_fw->file_selected.path = NULL;
>>>   @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct drm_i915_private 
>>> *i915, struct intel_uc_fw *uc_fw)
>>>           /* Failed to find a match for the last attempt?! */
>>>           uc_fw->file_selected.path = NULL;
>>>       }
>>> +}
>>>   -    /* make sure the list is ordered as expected */
>>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && 
>>> !verified[uc_fw->type]) {
>>> -        verified[uc_fw->type] = true;
>>> +static bool validate_fw_table_type(struct drm_i915_private *i915, 
>>> enum intel_uc_fw_type type)
>>> +{
>>> +    const struct uc_fw_platform_requirement *fw_blobs;
>>> +    u32 fw_count;
>>> +    int i;
>>>   -        for (i = 1; i < fw_count; i++) {
>>> -            /* Next platform is good: */
>>> -            if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>> -                continue;
>>> +    if (type >= ARRAY_SIZE(blobs_all)) {
>>> +        drm_err(&i915->drm, "No blob array for %s\n", 
>>> intel_uc_fw_type_repr(type));
>>> +        return false;
>>> +    }
>>>   -            /* Next platform revision is good: */
>>> -            if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>> -                fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>> -                continue;
>>> +    fw_blobs = blobs_all[type].blobs;
>>> +    fw_count = blobs_all[type].count;
>>>   -            /* Platform/revision must be in order: */
>>> -            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>> -                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>> -                goto bad;
>>> +    if (!fw_count)
>>> +        return true;
>>>   -            /* Next major version is good: */
>>> -            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>> -                continue;
>>> +    /* make sure the list is ordered as expected */
>>> +    for (i = 1; i < fw_count; i++) {
>>> +        /* Next platform is good: */
>>> +        if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>> +            continue;
>>>   -            /* New must be before legacy: */
>>> -            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>>> 1].blob.legacy)
>>> -                goto bad;
>>> +        /* Next platform revision is good: */
>>> +        if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>> +            fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>> +            continue;
>>>   -            /* New to legacy also means 0.0 to X.Y (HuC), or X.0 
>>> to X.Y (GuC) */
>>> -            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>> 1].blob.legacy) {
>>> -                if (!fw_blobs[i - 1].blob.major)
>>> -                    continue;
>>> +        /* Platform/revision must be in order: */
>>> +        if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>> +            fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>> +            goto bad;
>>>   -                if (fw_blobs[i].blob.major == fw_blobs[i - 
>>> 1].blob.major)
>>> -                    continue;
>>> -            }
>>> +        /* Next major version is good: */
>>> +        if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>> +            continue;
>>>   -            /* Major versions must be in order: */
>>> -            if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>> -                goto bad;
>>> +        /* New must be before legacy: */
>>> +        if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
>>> +            goto bad;
>>>   -            /* Next minor version is good: */
>>> -            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>> +        /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y 
>>> (GuC) */
>>> +        if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
>>> +            if (!fw_blobs[i - 1].blob.major)
>>>                   continue;
>>>   -            /* Minor versions must be in order: */
>>> -            if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>> -                goto bad;
>>> -
>>> -            /* Patch versions must be in order: */
>>> -            if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>> +            if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>>>                   continue;
>>> +        }
>>> +
>>> +        /* Major versions must be in order: */
>>> +        if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>> +            goto bad;
>>> +
>>> +        /* Next minor version is good: */
>>> +        if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>> +            continue;
>>> +
>>> +        /* Minor versions must be in order: */
>>> +        if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>> +            goto bad;
>>> +
>>> +        /* Patch versions must be in order: */
>>> +        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>> +            continue;
>>>     bad:
>>> -            drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>> -                intel_uc_fw_type_repr(uc_fw->type),
>>> -                intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i 
>>> - 1].rev,
>>> -                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>> -                fw_blobs[i - 1].blob.major,
>>> -                fw_blobs[i - 1].blob.minor,
>>> -                fw_blobs[i - 1].blob.patch,
>>> -                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>> -                fw_blobs[i].blob.legacy ? "L" : "v",
>>> -                fw_blobs[i].blob.major,
>>> -                fw_blobs[i].blob.minor,
>>> -                fw_blobs[i].blob.patch);
>>> -
>>> -            uc_fw->file_selected.path = NULL;
>>> -        }
>>> +        drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>> +            intel_uc_fw_type_repr(type),
>>> +            intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>>> 1].rev,
>>> +            fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>> +            fw_blobs[i - 1].blob.major,
>>> +            fw_blobs[i - 1].blob.minor,
>>> +            fw_blobs[i - 1].blob.patch,
>>> +            intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>> +            fw_blobs[i].blob.legacy ? "L" : "v",
>>> +            fw_blobs[i].blob.major,
>>> +            fw_blobs[i].blob.minor,
>>> +            fw_blobs[i].blob.patch);
>>> +        return false;
>>>       }
>>> +
>>> +    return true;
>>>   }
>>>     static const char *__override_guc_firmware_path(struct 
>>> drm_i915_private *i915)
>>> @@ -443,6 +465,11 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>>> *uc_fw,
>>>       uc_fw->type = type;
>>>         if (HAS_GT_UC(i915)) {
>>> +        if (!validate_fw_table_type(i915, type)) {
>>> +            intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_ERROR);
>>
>> In our hierarchy of firmware statuses, INTEL_UC_FIRMWARE_ERROR 
>> includes the fact that the fw has been selected, which in turns 
>> implies that file_selected.path is valid. this means that even with 
>> enable_guc=0 the wants/uses_guc macro might end up returning true, 
>> which is not something we want.
>>
>> Daniele
> Suggestions for a better plan? Add an another status enum? Nothing 
> earlier in the sequence seems appropriate. And the init_early stack 
> does not support returning error codes.

I think the question here is: what are you expecting to happen in case 
of error and on what platforms? let's say we have an invalid table entry 
for ADLP, would the expectation be that all GuC platforms won't boot, or 
just ADLP? And is that only if we have enable_guc set to a positive 
value, or even if enable_guc=0?

Daniele

>
> John.
>
>
>>
>>> +            return;
>>> +        }
>>> +
>>>           __uc_fw_auto_select(i915, uc_fw);
>>>           __uc_fw_user_override(i915, uc_fw);
>>>       }
>>
>

