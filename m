Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48F67A820
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 02:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA6E10E09E;
	Wed, 25 Jan 2023 01:02:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9F10E09E;
 Wed, 25 Jan 2023 01:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674608527; x=1706144527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UIdbqFbo7REuQNRGeakZQcvqAE72vhnPywWPaPKbJpY=;
 b=NaJPxKzu1qJPXWrMzWqgEkrCWS4thtT8vgjTN4f5Jcqo0hi5y8DrOYG0
 MIqT17ZzIh2NGlRPUud7uq0E7SUwos5H5nPeeGAFxh4+TP5tt9XBfdlp9
 Ternh4uOm2G4bzrRUqHy6RiQxwYo1OGt6wTgcoWo6GjzXz0HE+CjB6aAn
 X2KpimRlRwvDNVsr4kWAFTgt4IbJe12OkHnF1gozXvT/RBVFTF4AxhXQf
 sKu19BfjLCSEIQAkNgHBY8NykT5u6l2vug23NZDHAwry47+svcdMKFV70
 sfVK1fc7eqZU9nj1xDa6pxp4AThbnVvwAYZalwraq8+VzkGXj6XGUvDvt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310027350"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="310027350"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 17:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="770544616"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="770544616"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2023 17:02:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 17:02:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 17:02:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 17:02:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 17:02:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDRdbqQNQ+DR8t2c+WldnazpLxKKY2k0tZhFkkerH01QX85Gbs1puT9tJMqEp/K0zpiKADAXdHPNjT5+HXlZ+UE8OJuAZeE/9FEtb2ntsKr4cD288Ruir4CvqqBdwKqAXUFw5vrWcZSRCd8vHjqs8EwwmHo/jjA4QX9kG0RYqW9oEBmxArR2sYQvMBDDgPUT9zzS4smCKZeJyZ8uonq9eG18sHCDQxIS2mPO4/Zeap7xcghn855i3XI8Pkn1VRDEERQTDiq6lV/VQjfx8Ep1Xuk2A5etbpj74eDZUJ9XiDGAywgqB62ycuR8zMR3ipfSuhulYYK4Tb9h57BkOIBt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnCvDmrpowCU0z0GXAJeaO+1vw0Ae6tL3JvjoLUz3vk=;
 b=Ri3Nnt+4f848AiDX3g0KwdSx/8JSFhsX+n4QdZ2Tnz916NdbLqMeO1aPSpd3iwyUmNu8bw22kirAtsUCeZHrqQISSCTj40re8NWHg7q6yJUgALu0ZcPBUggU/GzrMZB2VPunlzL0i+aWMNy9kVNO0/Sch84G8Nr6BmCcKT2qdULS22JX2xTtD+zPV5y4ajAaDN9WS1PMW1wUzcKPlNT+XkCvFR1+5LtDwyHnM6jcbfvaxbJPTy+HJjJ2Tu/zXG0ghglvd2DyWQYeU35ymwvf7k0kq2wCtjXgyuJJllsUwALnmuD33cs1Es0PllL4gtFineMnfPIp/xZ72h6ZHVJAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 01:02:01 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%8]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 01:02:01 +0000
Message-ID: <00d0e2c1-3187-7025-c8eb-821bee0d0f45@intel.com>
Date: Tue, 24 Jan 2023 17:01:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/i915/guc: Fix missing return code checks in
 submission init
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
 <20230112015447.2430224-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230112015447.2430224-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: de403f00-f8d6-40eb-c809-08dafe6fc434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DARSBSmEZ1WgA9IpP5hDhlmMHRJPEhuylmbq6d/nr9Gv0RDSC42b3AMa+H3JtkIYlCn6xcn5NCirBJGb9N6kJUSRSCP8rbagsF7/xcCib/6RKa7asCiLlS6dSKEs3+q17UJ4Epxz4My6XHigJXVVGbsypxZM2ZHcb6YWDqGDjA6HjukNewnu1Q2jpbBmm+WeWiZW+hiT/adXd45YL/w4flESGVgCV2qdf5o2v4MICr5qSby3EH0Iht+YVwndLzvbkrHoumrVP/JvpU/QL3x5Ta/rJ0MzK8OwKqinIoQrtaXnXw6JU499Lthl6lu7iRtfMQkleo111kk6JVFAuGvLF6U+iALLuaTlxyqpW+7fXMSea6D1aveGjiuMKoVyd+qKuQfYfjtjm9rN+wetlB501Nv6st0WFo/YbRAEdavHOVdUDBn66axVxqcVAzN6bbBXZhn69vIKMOxUFUQx7M1qjGG4Rzeh9tLpwAmq2c1AnBhXWTTVF8xtF4MxgQgV8eXrHwiQB9Dkc8A3q90idE6anYX/feL3450UM1CSZLKrobtVhjWT2LqrXNkgjLk1USX5ze1vNQk9CRyDNpalnNTKspKW2MRsVHSRZraVxWvUajiN2RuNPUIPFWyh1I9sIQxisRzWKoOUonw5qWyi3kt0XWg7Gh3wcp58QRKWetrd7wrL/zzheVI7mxTL7xLQcYt2VUKZ1swlDjXyZFjbl49urz7hSacTdTNwqOu/ebcB/wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(41300700001)(2906002)(31696002)(8936002)(86362001)(478600001)(6506007)(5660300002)(186003)(6512007)(26005)(6486002)(4326008)(66476007)(66946007)(36756003)(83380400001)(450100002)(8676002)(66556008)(31686004)(2616005)(82960400001)(38100700002)(53546011)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGMzQjFNSGN1b0x2TnlLQTdTL3VsSkNOSDlpc05weW5kbnhFb3pFOHgxOHJ5?=
 =?utf-8?B?cEpTS2tMWU1VOTJzeVNjTEtoTHRpVnBLZFROSDU0RzZNYjh6dTZROFVYUUVu?=
 =?utf-8?B?RU10UjEzMTVpSlJpUjh3emdYVndNRWtXUFZ4ZHJjRU9wemg3VTlHK3pwMmFU?=
 =?utf-8?B?ays0NTh1YkFxSnZONEFKakZyZzZScHVDalBtdUVqejlSU1FUMUJrY05HUld4?=
 =?utf-8?B?UGlZdGhST2Jia3g5alY4K0EvWWJlb3ZyOTk4UEI1NWRMaURSTWx4aUlMUzB2?=
 =?utf-8?B?N0VBM2JoWm1UdXBNN3E3UkFPdUZyTHFYS01GZ1FDaGpVUlcvWlZxemNCdjZm?=
 =?utf-8?B?Um5hajIxNEs3L29rRzV2clVGWS9HeHArZ3J3SFFOcUN3Q01MOVk0cEtRemV4?=
 =?utf-8?B?aE9sV3dxeDZvUytEbmxIbDQyQVROZE5TY3N4SHlOYnQ2VkpQSklmdmROcHhY?=
 =?utf-8?B?YWRnTWJVdGFtR1JoQmVoN1hUUWMrbkNOdUxidU9ENXJBYUlScVNsYjZQdDJ6?=
 =?utf-8?B?bWgyKzlMQjFyUGZ4ZnhEVXBxRnN3bEc3RVZvU1BEb0Jsb0FjSFpNeVNqRXVD?=
 =?utf-8?B?Z0IzWDZ5QzdOYmU3dnpBa2luT2ZIVkNET2dBcE1OWGY4OHZEcXBEQUZKMCtz?=
 =?utf-8?B?aWsyclhIVUQ5WTY0ZlBFQUxCSUVBTGRTUzFnRDNMc3FQNXJiV2Y1L1R2TXhi?=
 =?utf-8?B?dncva1dLcTllaUp2TnhqVG1kQ2RZU1ZVTzZXcVZrOHVrdmRtTUZvMlpqWWtk?=
 =?utf-8?B?WC94SHZ3SVF3dFA3UnlaUFJWdHBZMlIyS3pxTThzbGNNZXRBcTI3dDlwMmhG?=
 =?utf-8?B?eElMbSs5MC9xZXR5VkFHUE9TZ09saFAza2FGTmFJYi80WDBmTy9kai9HdHFr?=
 =?utf-8?B?SmUzcm1YUDE5QVR5YUppSGZITkE4dTRNVUhWenNNN3BhSlZxOVdiOWFic01Z?=
 =?utf-8?B?ZDFxcFZFTzJNUlhVWHM3OUVwVW91L2MxRjZvRFNOMFN2TXRTNmlyRHJhMHN2?=
 =?utf-8?B?eHpNM1VLSVRoZTJReEN0YkdtOTBMTlZvUkw2UUdpUnloL1NoOTliYkxCRjgz?=
 =?utf-8?B?TWFXWEtKQldWZHJITlZjd0orbWg0RC9RVUlnYkdLR2U3K2x0MVpaU09xMm5W?=
 =?utf-8?B?OWE4ZHV3ekQzbm9kOWQ0cDN6eUZtWmFPS00yWWlVSGRILy9OSHFxT3Z0SDhH?=
 =?utf-8?B?cUVYaUpyRTZGMUN0QVJSUkJyUEl2NnlDNWxPblJ3T1Q3ek82RDNCdzU2U2ZK?=
 =?utf-8?B?M3ZvL2hvcUZSeDZlYk1pL0FJbURKWWlIclB5ZWxUNWVlRGZYTjcyb3cyVUxN?=
 =?utf-8?B?WVgxU29uWldvRUxpNVBpdDhzN3BOeC9FOENzTE9kQitLVjNlekJjMER2V29s?=
 =?utf-8?B?NnduNlhZL01iT3J6SXN0L0tVaGhraVo5d2Z4bkdJQ0p2aktDSC95SjJ5NTlQ?=
 =?utf-8?B?bkNKbW1sTTd0eDM2UUkyMzJNRW4vaDRhM0FjdWNPL2RYV0p1cktNTTNILzd0?=
 =?utf-8?B?VStLcVUxTzZrR1BabEFWbzNpNW5aQjBKOGlPdTBDVktrdkUwWEJjRUpGcjA2?=
 =?utf-8?B?Y01VeTZSRWxHamNoZ0hrUldMYlc2VWszdTI2NHdmRnhDNThJYmNIZTV2TDZ3?=
 =?utf-8?B?QWtrWVptZ0JMK1ptWGVKWWV4cW1OQjJ2aGpXT2ZMNGNKaTAzM2FseWFHZmVV?=
 =?utf-8?B?L2NnNWlPUE0xa3B2ME1BMzloelcvT1F2OGJHTkl4aVZQWmhIRVphYVpZRmVS?=
 =?utf-8?B?Q2g1ZWNFb1plQ0pKV0p0MWZ3Vy8rdzFlWUlEOVBHK0hsRFNtQ3BOc2JPTHdn?=
 =?utf-8?B?anIyYjlJaGh0LzNKbVBNUm5DTk5xenZUM1VycFpUdDV2VldRajdYam9hUmp0?=
 =?utf-8?B?QytROW96blB5NmNwRWhhSVRxcERwMkl0UEprdlZ4ZGZCcVF4SFlCL3N1cUFv?=
 =?utf-8?B?ZlRqYVF3eVBOQzVOdVRIY1NhOUM3bjl5S3lxa3FtYkxRNmlMN1Vzbk9LeUdW?=
 =?utf-8?B?WitydUlaZGJKSUdsSUEyKzdsRCs4VERQNkJwSm5sL2lmRVRwY2xWTmw4dkc3?=
 =?utf-8?B?WXVkdnRlb3hLNlhpNGJQWlBJWkZsblZ2ZXZmOTlZVnFVeWgrckllSE9Ib1lh?=
 =?utf-8?B?YlpsOTNZcHNnSUpRMVZYSVExUy9OeWlkOVdXUTU3bmkwWUg3WU40TUNFaFJI?=
 =?utf-8?Q?9ulo3zJnmXM8cljRzKOjH8E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de403f00-f8d6-40eb-c809-08dafe6fc434
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 01:02:01.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNnDBvBDAxx+yJMfDhLEy1eHQlLd0vRo1fYPYYJj+63OrtixThX4KO1h/TqGZbZoIH1gl6I5Jvqz+L3O71OODGHNvSt8w/86hXmhhNNNa1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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



On 1/11/2023 5:54 PM, John.C.Harrison@Intel.com wrote:
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
> This would not cause any actual problems. The invalid requests would
> be rejected by GuC and ultimately the start up sequence would
> correctly wedge due to the context creation failure. But fixing the
> issue correctly rather ignoring it means we won't get CI complaining
> when the fast request patch lands and enables the extra error checking.
>
> So fix it by checking for errors and aborting as appropriate when
> creating kernel contexts. While at it, clean up some other submission
> init related failure cleanup paths. Also, rename guc_init_lrc_mapping
> to guc_init_submission as the former name hasn't been valid in a long
> time.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 91 ++++++++++++++-----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
>   3 files changed, 75 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 982364777d0c6..dd856fd92945b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1431,7 +1431,7 @@ static int guc_action_enable_usage_stats(struct intel_guc *guc)
>   	return intel_guc_send(guc, action, ARRAY_SIZE(action));
>   }
>   
> -static void guc_init_engine_stats(struct intel_guc *guc)
> +static int guc_init_engine_stats(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> @@ -1447,6 +1447,8 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>   		cancel_delayed_work_sync(&guc->timestamp.work);
>   		drm_err(&gt->i915->drm, "Failed to enable usage stats: %d!\n", ret);
>   	}
> +
> +	return ret;
>   }
>   
>   static void guc_park_engine_stats(struct intel_guc *guc)
> @@ -4108,9 +4110,11 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
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
> @@ -4118,16 +4122,24 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
>   	 * isn't happening and even it did this code would be run again.
>   	 */
>   
> -	if (context_guc_id_invalid(ce))
> -		pin_guc_id(guc, ce);
> +	if (context_guc_id_invalid(ce)) {
> +		int ret = pin_guc_id(guc, ce);

Why do you need a local ret variable inside this if statement, when you 
already have a function-level one? or is it just a cut & paste error?

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
> @@ -4154,9 +4166,17 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
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
> +		}
>   	}
> +
> +	return 0;
>   }
>   
>   static void guc_release(struct intel_engine_cs *engine)
> @@ -4400,30 +4420,57 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	return ret;
>   }
>   
> -void intel_guc_submission_enable(struct intel_guc *guc)
> +static void guc_route_semaphores(struct intel_guc *guc, bool to_guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> +	u32 val;
>   
> -	/* Enable and route to GuC */
> -	if (GRAPHICS_VER(gt->i915) >= 12)
> -		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
> -				   GUC_SEM_INTR_ROUTE_TO_GUC |
> -				   GUC_SEM_INTR_ENABLE_ALL);
> +	if (GRAPHICS_VER(gt->i915) < 12)
> +		return;
>   
> -	guc_init_lrc_mapping(guc);
> -	guc_init_engine_stats(guc);
> -	guc_init_global_schedule_policy(guc);
> +	if (to_guc)
> +		val = GUC_SEM_INTR_ROUTE_TO_GUC | GUC_SEM_INTR_ENABLE_ALL;
> +	else
> +		val = 0;
> +
> +	intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, val);
> +}
> +
> +int intel_guc_submission_enable(struct intel_guc *guc)
> +{
> +	int ret;
> +
> +	/* Semaphore interrupt enable and route to GuC */
> +	guc_route_semaphores(guc, true);
> +
> +	ret = guc_init_submission(guc);
> +	if (ret)
> +		goto fail_sem;
> +
> +	ret = guc_init_engine_stats(guc);
> +	if (ret)
> +		goto fail_sem;
> +
> +	ret = guc_init_global_schedule_policy(guc);
> +	if (ret)
> +		goto fail_stats;
> +
> +	return 0;
> +
> +fail_stats:
> +	guc_park_engine_stats(guc);

personal preference: I'd prefer an extra guc_fini_engine_stats wrapper 
just so that we're balanced with the naming, but not a blocker.

Daniele

> +fail_sem:
> +	guc_route_semaphores(guc, false);
> +	return ret;
>   }
>   
>   /* Note: By the time we're here, GuC may have already been reset */
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
> -	struct intel_gt *gt = guc_to_gt(guc);
>   	guc_park_engine_stats(guc);
>   
> -	/* Disable and route to host */
> -	if (GRAPHICS_VER(gt->i915) >= 12)
> -		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 0x0);
> +	/* Semaphore interrupt disable and route to host */
> +	guc_route_semaphores(guc, false);
>   }
>   
>   static bool __guc_submission_supported(struct intel_guc *guc)
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

