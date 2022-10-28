Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF9611909
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 19:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4502D10E878;
	Fri, 28 Oct 2022 17:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31C310E878;
 Fri, 28 Oct 2022 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666977252; x=1698513252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fszzOAJQpZgjBCaHrR++azcqnARyCqt+suMMgAVb+bg=;
 b=SfvaUFL+L4zrqpkLYF0dotYZDXEjsdE7LC8ra7lmrGghdCVQL2WWi/xd
 lgiAL2gUaSYR7Bcmnol8ABB7OAwlr9QabpsCvsTSnYLWr6Fa4Px5mIzRe
 UTtNUfbS5dt44kqeTmIJpaiH0c0HIPygtlwTANXoLwIAMjHoPZWI1kZ6a
 Bi49l9AiV3xPCvHDrQRvtnEGgdCmQ4yTaZLYiSlza6mZ/BvnngAyPeSWc
 ydyKMFfF9l5i1mcuFf7m9QLeAkSDTbyxnuOYeyWcIzy+flSTmfjW92pBb
 vw/XHSTH6w42jcK3xKjf2nYnxrRlwzhzLVhreBsSbsjJNO4Xs3HdWWzlN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="307269781"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="307269781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 10:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="807886300"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="807886300"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 28 Oct 2022 10:14:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 10:14:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 10:14:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 10:14:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 10:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWLE56BzrWOf65BHkawR/DfkmfLEIDHHrFyOrWaCOCiFQXCXXF++ogIBG0SpOcx/oi3QS+iQhCnpP8p3EbQGJrmpxRGz5cVcXyMMiuRrT7Uf0asxtN1PM2gBPhldxi3Cxz/gqricOzK7Wl1oMTTFm+hM46xIV6pYJgBp6l6jk61Uw0DVGrJI5+zK4b1tkKRfv6Z80/86Yg23Vs8uC9QXtqC5zZs2RbbfGc5axno1G2lbYsOla+h5TjW9FNnLr1CQ/fy5vP0FgT3+SNgoSWQpIZgLrhfjIHkCo47ZD1M7mMGhZs/gXpS+KwUsIfhMkJlWKrzXIdJzywfSQ7qy6K8/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0csHVOv0l/eK5f96MbHlKU9c9I23Ur392pywHPEYWs=;
 b=aH+oTlvoPSQbR8hcDiWFAKl5JGWf6rPT8fJ07VAg82ijerNa62RsyGvFvC+79zQMS7qTICXtjQWoxIlsQXxbFsc+1qvCfhaF/+lAYfa5n/YkONzmRmTFax7wlCHS6/4itwrd8BgXu/zhy3q9Aet399YLkd+Qbri7b1bKNnL8uqY3hEokIsdPmA6tuvubrJflJ1+hc1GM7B/GtSDTRIt6h7SqpMsPsGdNpcfUEcGzfgnNxyFJjUXKrGQyBsL3yJ6mDKioG9W2quwmCRPM5VZn0yGMB9EMu1OZgMsdOoV3PbhVHBMdkFM85yBxCtdyeJ5FZIhB5FDStWAfdYMROobtOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 17:14:08 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%5]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 17:14:08 +0000
Message-ID: <5d66c135-50b8-6faf-4db0-b975a844c194@intel.com>
Date: Fri, 28 Oct 2022 10:14:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 5/5] drm/i915/mtl: don't expose GSC command streamer to
 the user
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-6-daniele.ceraolospurio@intel.com>
 <Y1tPRlMIWsachnkQ@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y1tPRlMIWsachnkQ@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MN0PR11MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: ce87fada-cf60-4d94-a1e6-08dab907d308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTBciCaLjQ3Plo2xz4NkyOKuhdOqxZDBTGjRM5XRxLtQ8E7H/8Ons0Hzz8cjhpvWv/3PzBE9ImSSsJ27nHKxU8I5zvfP7wjeE70sAJ6BfE6qto3lvAnrUYSBOymudyUbqcBZE+EQoOxTaETwzz2F5r1hP9KVqeGfrTus8iqrJZ8ibq1LNA8fe8n+4lO4imCuYMwJKz/y6iCRC7tEoUG6T2enqdYbZFCmRbo1FNva95g8SEb1sOgKwN6cJDFy7at3zEZgUNNfFeaaAgTXkknc5ZttYOrcabcg1pp9JJONbo40wGtwA1iEYlE3viHt8H9tlB5pGxCXb+SsOvo3A3RiTWEZkp06rvwWBoTjbINGMEy4iyInkfS9wsxKKTRU17QdDV18Lg/ag8XAhTgt2r6oac/Xw0OMDD8OSwkBgci5b5k+OcBYGSgTVugh8w5wpuOffgi1halNVCalD8huENPYkJkHmpiKlnqHrem0GqUMBlvScw5AW+bVXw82STwsB0xxnfsWHAdwDcwGOW8xRod7z8v/XPgzAo/96YxRZ2cyI+Dynd72cIhQONstKXhXkwlNVXGIaUHgvCxHcLGRHAnApNILe/+Dz19J4cF/bEF9z2SSZOQBP5xLq1oh9SvNLyomW46veLtVzpE2d66J75UItLKIIpE1HNIWjRWN17iCsgpa+PV6tf0CQ9liXsOKwiTTDNeQvsHS+lv0hqs0XK2hw/WZVauxqNYU0gzvyRkdFTd9b5RP5tWuN1euWzt+X6B83JpBvQx0ZUm9XRDY6rSBBdyf5yDMqtKBADb0ReRh6lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(31696002)(86362001)(38100700002)(82960400001)(2906002)(5660300002)(6506007)(8676002)(4326008)(66556008)(66476007)(66946007)(6862004)(41300700001)(8936002)(53546011)(26005)(2616005)(186003)(6512007)(6666004)(37006003)(450100002)(6636002)(6486002)(316002)(478600001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpNQTM4ZTNFS2RpQU1MTGM3MFUwbm8vQTZrQkp2aUg3Y2NXL0dhNGZXMU0x?=
 =?utf-8?B?NGZCNDJJSWZ5a1Y3SkQ5L2xwQUcrbEp6b3MxTXJmK1h6UXozdFlNTXFMb0t6?=
 =?utf-8?B?dlJXNDFNVi9rQ01DU0NZZUhEaTJ3MFFSN1FKeTdBcUJGcFE3MEt4dWkrOG9W?=
 =?utf-8?B?QkFGaXcwdE13b0JHUGNDeU0raVQ1ajFBOVAyUWs4ZmJvU1k0K0swNEpWMVdx?=
 =?utf-8?B?SDVqRGhGdVZMZW5RV1NEM1JraGhqb09rOTZBaUdzbTJPYkhKSGRXMkkva012?=
 =?utf-8?B?SUxpYjRGMG9BRkJzbS9GaEF1RU1nc2lOY3lRL0pxMkVScXVORWV6VmtCQ2Rh?=
 =?utf-8?B?SjBSai9VL2NKM29aRk9ueHYvd3IvRjhRWE1yd1p5eFV1RGkvem1TUnBGNDhp?=
 =?utf-8?B?RzJTMmVDenVkbVphYzhHcHczTFZXMHlZTVNJTWxGdVZiZmMxTllBYWRjU0ZN?=
 =?utf-8?B?VTNkQmZJVDVPa0VyM0x6NSs5V20vZXdjMFYxR3Jzc0dFY1FkZ3FaSlYwUXpX?=
 =?utf-8?B?UjNKNitmQWZvWFVSd2p5RjRUWWhHKzNvNUdwZlVsQmJFTHVlQUlvUlJWcTZj?=
 =?utf-8?B?UXpNS2JycFErV1RrSWxlKzZIeWl5R0tiVStoMm9iQXozbklTa2xCYVQ4MkVR?=
 =?utf-8?B?b0owOHpJNTZZWXJsdVdqVnBESU8wM2pNWHZUdzM1Q3J1c1pkYjQ5WFd1aXRV?=
 =?utf-8?B?Zk1IQlJsdkxCSGJwMVQzblFKa2k5L2hWUEVBWDJ3S2NXYkcrQWdrRmkzMnQ0?=
 =?utf-8?B?Q0ZxTFpYM0IzYytRZ0VtVDhNbEVaV2svOWhHODdGTnVqWUtZc2hJZW1xS3R5?=
 =?utf-8?B?cU03QVMvVEhONGcxMzNreGZndGxNUWsxR25vZ0hiUFdCME4vR1l1ZGgzTE1y?=
 =?utf-8?B?NHkrampDYnd2S0crOE4vNXJ0elZBbXpyY0ZSbDdQbnJ4Wit5WS9Tc0RhRUp6?=
 =?utf-8?B?NnVPdzJxcWYyZUFXUkV0SFN5MlkwM3poMnNDVDVjSDRsUG4xOENCaVNTWXps?=
 =?utf-8?B?WXpCVUpXenRXTVV5c1pPcUVMZXRKMVV3d0FrREoyb2lFazkveGpyaVVLcnVx?=
 =?utf-8?B?bGxMQ2lrUFdLeVBhbnNjOExpdWEyVnZ3dXAzVXZKejB2aUEydzNvMDJ4Qjhi?=
 =?utf-8?B?dUdseU9ZdnJZTVZyRnRtT3Z2OWNkS092Ri9TZE11UC9ETndyUFpBeEtQcjNT?=
 =?utf-8?B?eTJYVENNMzZSQzU4ZFVKZlN4VWI2d3U1Y1RnUEFTSHFpR0M3c1lBb0lHRW1l?=
 =?utf-8?B?UUtZZ01KOTRLSk9Ya01GTEFMQ1JrbW9XL2ZuS01KMWpieTB0ZDhPT2VpTmZ1?=
 =?utf-8?B?SnR5Mk1aY2ptK2NHcG9FU1g5UDIyNnAvTkw1RkFUOWhpMnZXTHFvVmp4aWF3?=
 =?utf-8?B?eEpQWmdNYVNVV1ZTdHNubjBVZTVLenpFY1N3MCtvajdQRjVRQkxOcVJVTHlF?=
 =?utf-8?B?MkxxdTFwWmxrYTErMFVlYmhEMTQzYnMxb3E1MC9qeE4ydUVHY1o5Z0E2cnlv?=
 =?utf-8?B?RlNHY2ZHUTU0TE40RUg5M0crMWRrbmZWK1I1VjErWFJOZGJzWGhoM3lXSCtx?=
 =?utf-8?B?bWR5RlJIdUlTTFlPeDZPb2lsUkg5aDZLQXFia0J1aERZcXhmK0NZNi96U0g1?=
 =?utf-8?B?U0pnZWF5SEVZTTFyTk8vNVNFeDhFbnZIc3c2SEhoemFsc3p2OGFURnVzMys0?=
 =?utf-8?B?STVNTjRnVG1abCtwM3J1a2dSTThieER1T0hGbE93UUJxTGpVNzI1QVd2TDhu?=
 =?utf-8?B?ekhHbXBHeTFVUTU5anFoVWNiNWVIb1NIRmw2dWxzanNVR3FaekxJbklseU9q?=
 =?utf-8?B?TjNFUmNRRnMxZUlhZVJvS2U1dXZVUlFINjZTcHI4alRaWGpkVUhJeGVyZjd3?=
 =?utf-8?B?UTFpSkxyQnRvWXhKQ0Vzem9qRjVQOUZCSk9UTzVWNjQyR3RWWWZiWFNQWHBS?=
 =?utf-8?B?L0NGQUJDL2VoMzFLbUsxNkVoc212LzQwVm00cTdPWUtZNHYxckMwdzJPQmQ0?=
 =?utf-8?B?dFp3RFNTUk5DSG12U1JwMk83ei9kZHEzTFJWZzZaU2paUW1zNVVEL2xPZkF6?=
 =?utf-8?B?TTJIMTFiUzBUd1hNTmloN2M0OFV5VHBCUE5qcjY0b0xWK283bUhqb01TVk8w?=
 =?utf-8?B?eXBtT3c4LzdTaGNmaFp4Z21FQzlWN3hSTFdnaEdweG1PUDdGbG5GMTkvUUR6?=
 =?utf-8?Q?yJt44UQVUjr0WD53ZGIdjII=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce87fada-cf60-4d94-a1e6-08dab907d308
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 17:14:08.6264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VI6DkvA9TS6ZuAXjoLNuoizh61n1Jt6wJnAo8wR2DTTP/H23t2VdVY2b+z5LAgl/NdLzjCOkEPhAhZ9U/wuTJqQVBLCJ6CBLGrPsv2nt5Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
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



On 10/27/2022 8:40 PM, Matt Roper wrote:
> On Thu, Oct 27, 2022 at 03:15:54PM -0700, Daniele Ceraolo Spurio wrote:
>> There is no userspace user for this CS yet, we only need it for internal
>> kernel ops (e.g. HuC, PXP), so don't expose it.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
> Since we never expose it to userspace, we also never get to the point of
> doing an engine rename and removing the apostrophe.  I assume we're okay
> with this engine continuing to show up as "other'6" in debug logs?

I don't think it matters a lot in debug logs, but anyway it wouldn't be 
hard to rename it to something different. What do you suggest to rename 
it to? Since OTHER_CLASS doesn't have a uabi_class defined we can't use 
a count of engines of that type like we do for the other classes. Just 
rename it straight to hardcoded gsc0 ?

Daniele

>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> index 79312b734690..ca795daca116 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> @@ -211,6 +211,10 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>>   		if (intel_gt_has_unrecoverable_error(engine->gt))
>>   			continue; /* ignore incomplete engines */
>>   
>> +		/* don't expose GSC engine to user */
>> +		if (engine->class == OTHER_CLASS)
>> +			continue;
>> +
>>   		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>>   		engine->uabi_class = uabi_classes[engine->class];
>>   
>> -- 
>> 2.37.3
>>

