Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF76C5523
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE87610E06E;
	Wed, 22 Mar 2023 19:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6065410E16C;
 Wed, 22 Mar 2023 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679514304; x=1711050304;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U2TrMfXDtsKXz5eMM1ecg1wg9pe8Yk3aNgUlVzi2WCM=;
 b=QxdoUzt4OrXKv97GS+y6GPi5bqxR+vIFCkraiH0kFk+a+uU3AoY6oce1
 DyaF0+3ybnD3XaReAlxwssq8kjpieXqnQO7BxrZDsMJgXhEb3jBn5ld2Z
 t7ASaJQKcE/f5Qdsrvx2CTyyP0O+1TRdarFj35XKiiILU4DX0k5WDIxBg
 xBmLvftovb10jMlBCaUHrhbUDSeTYMqQKm/9OjfGyi1BT2WogP4tqY5dY
 4jpDmFw4wb6jcGf/TBs81SM5PrvzZysNLevSpIGrHzZrAvKNGjyKxVMbc
 ywzc8H3obU/HkZERmsdNlgQposYoWVViAwqgxlBgydpVHmOrN0ip4bV2B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341676211"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="341676211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 12:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714521035"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="714521035"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 12:45:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 12:45:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 12:45:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 12:45:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 12:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiZjoWGzZRQ28y77KTpWuMvWIGifMsHIPvCG9ibHTLnDPPsaBh7joeTWASPEywbu5n09cTwmpQYfZTxbUjxfReVOSAttdMQlMLAz1zRkoDh/PIutJOEqox8nBTewGIJHlrrbZZGP8hXkByyqKjh2udj/TpN5IEILZfN2B+OaEcdf0rgoKUOFXV4Ukf5TFJ0TcZ2pHHu83w7tV2gA8iRM7GpvrKi3DOpafUUq31uPOejX+RioCJqtHs4tWjbLJ5OVLujOZME9Kk2Tzgp4R0O8iHmiIpgGczK48WyyAlLyFbrOiI4daVe6la0jJXWXAIhYQ2UGp6Ir4j/e1PjeSYqRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMyL54MeRnD9Lxmw7NorelPHIy/VRQmKW88QcRP7law=;
 b=oDoGyLMj2GEXAFfrFjpRXdmbh9TYC+G+dM+KAyqZAdSHY0mOdlAmh0cjDV9itPZN2n6JIhood0tCFe06qTudyK21TGfY5hLAffJdyEBTuPT4OBknOBHzxqnhE+FvKqxDkpHo2XPYb8PpmlD9Zk1RypMEjmBe9FvPxwyFQU04s/HIn8GfPI8vevpieWlHoH69J/0dZ5aHq/pFDIeW7evrlRM2z8gnQwl5JkA9qs+qs6l4XLDclYRkdI9gnz+ZhkH04HA+N/vHuTAvgmQiqi5+Be7ecFVfU1IEAzrrTh/eNyMt9+Lw5YwQQ4DFtiuv/1od2QgHXaw8pubLgF9SHI2A/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 19:45:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 19:45:01 +0000
Message-ID: <382f0058-2b4f-4ef2-8031-27a2f75715df@intel.com>
Date: Wed, 22 Mar 2023 12:44:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/i915: limit double GT reset to pre-MTL
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO6PR11MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: b20a2683-91fa-477a-9929-08db2b0dec89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZOTOe63zHdB6Pjg5bKjbxNNWS5r5p845driUNkZCcHohhfSL6DyjFouqiBwpMAEQ0uR5PzyXuOCOVedSLTc0lzCGJgSxSiw0ByD0O1kmu3ZWiUUTQJOn95wsXWcoMGgsiXYslpthiMu1En7ppltfgNwP8ZRZ3jkDe5XSV1rrBYAQgMnCr/+BfGO2KTcJbuz7mMOT9C/4DMOQ5S4Xc8/no85KDYyeeSsc465QCjY6AS1IYLZHv2mpSK147UXrn3DPZpT+/zBpZv6ewLY6Rp/RSiCsmszcYQvSjZBy3mBXfvnz6iU0O4KdiKxh7R1rBSu/96Dfn8jjUnI7JXz/JWX+XHoFcNx35OPfwL+VJTvjhnBeUK64yEziG+z/XG1+BE3ZNH/wZLGnMK37H9y8W/lkeo3oOxRBWoRP6v2Fm726vQjOwBxUgfMiKXW44RTCTCwRLeFIl5GewxxtW0SZ3SuaQuOSkJjmavp47glBC7wKfyqSeD12oQjfdTpdOhk8qoEirDD8t4yVkw90l+nT99YPzXvr3U5WAIRtLJQCbtB8pH6YeQTbxO7hLkzJB2SkJMvVzEAT9YKs+HhHZVFe7gKlO3/g25Py0ZpDisQex0bO6LaIEAzYTIUzS5fV2rwc8uqwyzlsrtU94mXHnmO/XKqsQ/rkchtI5WuIFCMhJjRmdfA4MjLdnnKrxYUNBh4ALIjpe9Hh/eOx26yyGH9SKGEDzEm/J+iRlbBJHQ5IGPEnsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199018)(2616005)(6666004)(186003)(4326008)(6486002)(83380400001)(38100700002)(478600001)(316002)(66946007)(66476007)(8676002)(66556008)(54906003)(53546011)(26005)(6506007)(6512007)(31686004)(41300700001)(8936002)(5660300002)(2906002)(82960400001)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T01tZFlaWnY5aytqODlBUkxOeERZSDllK3ZCYTIvZW9ucVk3aHBON1VsdkQ3?=
 =?utf-8?B?emFzOXRtSDJOVU1KYTYwY24rVzNaQzJpdXFISFR3em04bi9xdnlRbEN2SVlS?=
 =?utf-8?B?cWh2VmRPQVRhZEJsWk5YK0hwSUtPNGtndWkyVjQ1eTI2TUNZYllZYnBaeEN0?=
 =?utf-8?B?Yk1oTUtJR1ZUcjFHaVMrSC8ycHJnTjFJRm9aZTBLdmozQVdpc29LamNpSWs3?=
 =?utf-8?B?NTl2S0hWK01MaGdyZFVpUlFHQmlYZWYxZTZ0Y214WXpFQmV4TzY0Z2pFSEtE?=
 =?utf-8?B?T2VCQzNXMHU1ekkxQmJJTG8yMkZwb1dlRk92ckxjY3RXalQ0dUI4NnJIcm9k?=
 =?utf-8?B?YkdtdXBjOTlLczlYcjRUb3RYSXZraHFtZkpNREVvT2pqQ3NIdFg1QVJZU2tR?=
 =?utf-8?B?RVRMZUtFbEZkZnJoNWkzeVN2ZXMxem9JdDFhSHN0L2s2SEYrMzVMSEJoQzJu?=
 =?utf-8?B?UHdWSmhzVVpXdElyM2ZsdXNiYnkwemkxZlo2eFZ5L3gzazRhWVdXVHVnWHVC?=
 =?utf-8?B?NERjWGV6WWViMEo5SUZpMUk0MEtMSjBBbHdVMDlhRDl0RzlQb1ZkVVVFbXBV?=
 =?utf-8?B?R0cvYmIzbGNBTGFGVzdpczJxNFZOcURIclhRVTZ6T0NlMUNranZ0U2lxVFF5?=
 =?utf-8?B?MmtBV1JBMVZla1VqcmFiTEZlYmZBOGxPQzNTUWFNeDFQSlppcnRrY2dPRnJ6?=
 =?utf-8?B?RmpJRU1TQ1VmMnRBbFpsZkZMSmxWcVQrKzlPK1JIM3Nwb0c0dnJhNmpGRzhB?=
 =?utf-8?B?YXl4c2ViOHdkZkxzWm5SK1pWWW02aFJUWWx3a3JUcHRkbFVkMVkrU3dmZTB1?=
 =?utf-8?B?M3VjRFVERUVVSjFNNHExbk1aMG9BM3FucnV6RnUrVmF4QU4rbkJRblZHRVRl?=
 =?utf-8?B?ZmVEamJrcEdMNzlzc1MwUnVINVo4THdmSldVay9UeWZIYlNwbE9CbGFaaTFV?=
 =?utf-8?B?YjR2M2dRZ2pmL3Bhb2VpcDFERzNyOHAwMW94eTg1a2w0czAxZm9XeVkvUWNX?=
 =?utf-8?B?eGt4cjJCTTZxenV0NXVjeXhBK2h3U0M5RGNuYUpqY0xPckR4NytVRldjdFBx?=
 =?utf-8?B?a1pyU0lzM0lqaUpXN3ZKdEFnRVFoNzNzN3RMMXFSSHZ0NGRYelhFekhSSUI2?=
 =?utf-8?B?cFpEZlRKUTZLZWRaOWxmT0RleUZ6VHRlUG0yVkZlaFFUSTlvR1ZaYXhackNK?=
 =?utf-8?B?aEpwdThRRWYzZDY0MHBjRnlxZjFyYzgzcitKNDkxNXh4QmVhcGROYmhtbkxp?=
 =?utf-8?B?eHBaeEx1NzhKTU8rN2ZYT1FKdEJGczdvVWlwNGxlTUROL3hHd21OK21oSFdt?=
 =?utf-8?B?MEI2R2sxaFRoYlk0bWs1amxOQTdWajNPWVVzS3VkYys2WjYwYXA3Q0hORTZY?=
 =?utf-8?B?L2hHb2tYSytwK2RPVEFOQnRaL1Nsbng3UkhYUnJIQTMvQ21TeStGMHA0a21y?=
 =?utf-8?B?OER0MDl3ZEY4VytFT0J6b2hkNkpObTNWRW5IWXNqTnlZbFdYR25FMEx3VEtI?=
 =?utf-8?B?N3FablgveHFHVG5YT0pndHdYd3BPd0dVczJlQWg3K0p2LzJycEtSYy9LeGJj?=
 =?utf-8?B?T1JnTUZVRjF2ek5HelB0VWtFb2pUQ0RUTkg0aUlwbXVhRmFKVHptSWlkdVRz?=
 =?utf-8?B?bzZCbjB6TFo0eldJdG5sZ0tvdXNjZGgybXJHSFEwbzhKSkU4RExSZFpBOVBX?=
 =?utf-8?B?UjUvZTcwblJUTjR0M3NTdEQwc1BRbHh0QS9aczdKcVBFNXRITlZFNjBhVGNt?=
 =?utf-8?B?c0JnQWtrTTJOeFdQSENaeFR1ZVdhVFpNZHQwcmMveGpOSklwcTJZRlliN3lt?=
 =?utf-8?B?dHN3TE9SMCtrL2ZHQWxSTlJLYmFRTW9SUW5XSU1yL1NMakdtYjg5SXZQa3h1?=
 =?utf-8?B?YjNPaGF0c2IwVThiRDRaL21OTjhNUFB3LytmUW1HenlZb0hVUWpFMmEwNFor?=
 =?utf-8?B?bmZ0eTNveG5xWThCUCs5aXd4SS8xUkFSRm9DUFpNQi9DeDM1Y2tKMEtBNGpG?=
 =?utf-8?B?U2NHRmhVa0pKOURBVXVmelJ4VzdFVjRZTWxQMnFzR1pTdlQxZXRTcjdBdUNI?=
 =?utf-8?B?QTJUNnpkYjlHSnNuc3Uxa3pkWDNKMVRjZXh1aTJKK3RUdXd5R0dMZmpQMUh3?=
 =?utf-8?B?MFhMWDBINXQyMm44aFZkNWcyRGllcitlb1QzbnI5c0QxaXFseVhnMjlsYzlM?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b20a2683-91fa-477a-9929-08db2b0dec89
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 19:45:00.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WTy8WpzIjMvMRKjeuuhSqNdNgY7Iri44fOgsS/LCd0SAJFBt4UcnPtsneW0+ioTw5C7lfibOjcQ9RvJXc4pXt3BNa0iclaNwfI6Q5U9KJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/20/2023 14:10, Daniele Ceraolo Spurio wrote:
> Commit 3db9d590557d ("drm/i915/gt: Reset twice") modified the code to
> always hit the GDRST register twice when doing a reset, with the
> reported aim to fix invalid post-reset engine state on some platforms
> (Jasperlake being the only one actually mentioned).
It still concerns me that there are no actual details about this issue 
from a hardware perspective as to what/why it goes wrong, the comment is 
fully of non-definitive language - 'appears to', 'should', 'is still a 
concern that'. And there is no w/a number associated with it. It all 
feels extremely suspect and warrants a great big FIXME tag as a minimum.

John.


>
> This is a problem on MTL, due to the fact that we have to apply a time
> consuming WA (coming in the next patch) every time we hit the GDRST
> register in a way that can include the GSC engine. Even post MTL, the
> expectation is that we'll have some work to do before and after hitting
> the GDRST if the GSC is involved.
>
> Since the issue requiring the double reset seems to be limited to older
> platforms, instead of trying to handle the double-reset on MTL and
> future platforms it is just easier to turn it off. The default on MTL is
> also for GuC to own engine reset, with i915 only covering full-GT reset.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c | 35 +++++++++++++++------------
>   1 file changed, 20 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 0bb9094fdacd..2c3463f77e5c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -268,9 +268,27 @@ static int ilk_do_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask,
>   static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
>   {
>   	struct intel_uncore *uncore = gt->uncore;
> -	int loops = 2;
> +	int loops;
>   	int err;
>   
> +	/*
> +	 * On some platforms, e.g. Jasperlake, we see that the engine register
> +	 * state is not cleared until shortly after GDRST reports completion,
> +	 * causing a failure as we try to immediately resume while the internal
> +	 * state is still in flux. If we immediately repeat the reset, the
> +	 * second reset appears to serialise with the first, and since it is a
> +	 * no-op, the registers should retain their reset value. However, there
> +	 * is still a concern that upon leaving the second reset, the internal
> +	 * engine state is still in flux and not ready for resuming.
> +	 *
> +	 * Starting on MTL, there are some prep steps that we need to do when
> +	 * resetting some engines that need to be applied every time we write to
> +	 * GEN6_GDRST. As those are time consuming (tens of ms), we don't want
> +	 * to perform that twice, so, since the Jasperlake issue hasn't been
> +	 * observed on MTL, we avoid repeating the reset on newer platforms.
> +	 */
> +	loops = GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70) ? 2 : 1;
> +
>   	/*
>   	 * GEN6_GDRST is not in the gt power well, no need to check
>   	 * for fifo space for the write or forcewake the chip for
> @@ -279,20 +297,7 @@ static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
>   	do {
>   		intel_uncore_write_fw(uncore, GEN6_GDRST, hw_domain_mask);
>   
> -		/*
> -		 * Wait for the device to ack the reset requests.
> -		 *
> -		 * On some platforms, e.g. Jasperlake, we see that the
> -		 * engine register state is not cleared until shortly after
> -		 * GDRST reports completion, causing a failure as we try
> -		 * to immediately resume while the internal state is still
> -		 * in flux. If we immediately repeat the reset, the second
> -		 * reset appears to serialise with the first, and since
> -		 * it is a no-op, the registers should retain their reset
> -		 * value. However, there is still a concern that upon
> -		 * leaving the second reset, the internal engine state
> -		 * is still in flux and not ready for resuming.
> -		 */
> +		/* Wait for the device to ack the reset requests. */
>   		err = __intel_wait_for_register_fw(uncore, GEN6_GDRST,
>   						   hw_domain_mask, 0,
>   						   2000, 0,

