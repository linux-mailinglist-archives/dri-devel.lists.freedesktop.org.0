Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D664F7BEA21
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C996B10E2D5;
	Mon,  9 Oct 2023 18:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A398210E2D0;
 Mon,  9 Oct 2023 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696877573; x=1728413573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JoAp9Eai419ihzr4yaGdvpdM3/YpxYV/5nRNsw8W7QA=;
 b=l6FhWOL+Ns6QIu7D4U2xl2JblV6wsFCARETxtrCk9GD5G1vOmVtHaKSy
 M0X/RKKUdSd/8V86loS+M2VlGMNWZcDPLj4cEYdWDvZc3DndkVoGeCbfq
 5Lxv6MV9aRgpG6QmPjOKf9Qj2lMuiFq/q/1ehoZVnP4PClL296Xe5BUoE
 kBvU0Bzh5Kfge6Pbt17PykXc1ur4B1EH9avE4p0VgyIiIjc3PbRUEoWeV
 XxKGYtM7UKrUbT36swhQQySOiupY4i0UWbQVvyynokvSuHJ/Iq1a9re+W
 ahIKEZUpUD8cEbRkt9pgmWq8D0nrKkYRkH25AnuloXPsxMvFOcrq72EDA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388088896"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="388088896"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 11:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="729787660"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="729787660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 11:52:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 11:52:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 11:52:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 11:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyqO4KagLRC9kKgUag/IPXKlmlJgyIJc2MJj/WNtnyNSDciyhS1iWl2pKfvlILAxwOnW5ZNzi0dD34jiChGVtp6wfvLz4QeAwoqnQJzV4n/oMJ3GMw3dXA7foLWy5hEYwVlbihuCdIRmgUvxGdtpEM3DdO/Z9tPE4XF09TgWxoqH15Sq3Yc9oMtId2rWNBeu3+PZFdmzdF5wESfHoHiyRXcn0al4fCv5zIwwr5dpeiXhCETXYIrE6N3lZFcsLeScvCxMj654nG7mY9y7ebMN0zpGADtCNOl5AL9P+C/0UkT908wG5fiD4rmhDqW/nXrk7Adr41Clm/WftWRStzskXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecHzbthfYKTYkjsH/6ysxa7QdzoJB00tzLByNZEVyos=;
 b=ihJv3NlYPOBLzijNYD0J5Ah8gIPyEVxCI7xlblpoy/dQdx7wZ2JO1sJcn3Mf/yOtfB7wVqYInktnJs5+8/TsJqNo/P8XXD3ydv5Yl4QzMYkUY/AxuTTpWC8lbHpq53n4VsIZudIfwLP8v1JPBoJ7QQrgqv9p6NP7AvSuy0AKhUKfxLH6nEpW5HSc/OYDQqcXTgq1gWm6vHJSr1MC5T+1tlTYBqlJ7SoR1J2G6qgnMjKGwlzWL486wBiCpJ6Ch0rsRDI6UU+Y0evFqsFP/IjzAdSOG95xzXRt4gMtWvzB052fsKz0ygZhKTfuYdEHxoBv3GOThOUmGrLjnTE9FfjIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 18:52:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 18:52:39 +0000
Message-ID: <2e44254d-5243-477a-8b2b-35623967ec1f@intel.com>
Date: Mon, 9 Oct 2023 11:52:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/print: Add drm_dbg_ratelimited
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231006132606.810110-1-andi.shyti@linux.intel.com>
 <ZSQv69bLHoOglE+T@ashyti-mobl2.lan>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZSQv69bLHoOglE+T@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfbfbc7-6855-4122-b5a6-08dbc8f8e92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/gABw7XEx/P3Kb8wDzpVg2LW6zgB07KDiTIah3EGjpXkXkYHb8rYTRSDviL24HYWAAiS3r3LYRuLDfd7jtGBDmzJNWWZAGZG+Z+4duuefzuFALsmdVpfIkp9iQyTtKND9mwr8ISK6G1zYOeXLCpXcZGeRbUVqRfpApoTjL4Y9zs31j1ZRQ667AG/0DXIuK3pNUSKMF2wWTCW/JtgFDZ7XjY42rDV3o3SYzoSg+RSgoK9uLrylyKIYqLTB5Dz8166ujIgpPIvKMTyizuxofGA6lPzhiVL3MTm+FL58scRm7mrYCKEoHYMQv998B0A3VgmRFeSBRu+egV43xsnDPa00xRVDoY0kvnlTT56b81jqEeM9V4dhRRdq7qWuD4RcOBei00w19v+x/5R24LRH28hxf6w/BVZ0Gbfrhghb/2PbRyWCklcZxJwtpJCMV7J436NrDIxwOzdWBLYMVvP8ZN6ze3KnY542P6gkQV38HCIJnA00ArIGGmTEyZnQB15u+NYlG+OrCL+R3l8MDcTrOdkgFH6iFhv+ZWNMptNMHEHn+jYxESSWeQRhrPmNfg+eDZO79RoyMgvp+BnH9LSItUnv16Gtz4+bjxDxDsow+ZNECCGw3bLHO/ZwANfMQiNvFdXTmH9dEJCY6xFihEgUddsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(396003)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31696002)(38100700002)(86362001)(82960400001)(36756003)(31686004)(2906002)(6512007)(478600001)(6486002)(4744005)(41300700001)(53546011)(4326008)(6506007)(5660300002)(8936002)(83380400001)(2616005)(66476007)(66556008)(316002)(66946007)(8676002)(6916009)(6666004)(54906003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2JZbjNrYk4vSFFYQlJnZ1pUVXBROWtMUytUdkoybnZtdS90ekpGdk9YS0wz?=
 =?utf-8?B?MGJxM1lrWGhub011RWxxU05lZDkxdjUyL2k4bDVVSXMyOElyRVhxQ3lRT0dP?=
 =?utf-8?B?V25vZWFYZ3dQSk11ODd5enp5TUFZREx1RzBjcFBVUWI0cXFiUDM4M1VDN08r?=
 =?utf-8?B?emxlWWZJN01RdDRBTFpreS91bFFMSDJFVmpuL3lEcmxmNHNucy81anlnYlZm?=
 =?utf-8?B?N1NnTHFGY3lIblBjcTVFcHpjcElmK3FvMTF4bkhUVTI4NE5NaXpBaU9QNXhr?=
 =?utf-8?B?R215YTNMT0ozVFNta3VUbGlZMVc4WU5hSmJlR2ExRFpIVGRrTUIrWVNhNlk3?=
 =?utf-8?B?OXZPRlFveU9IZWZUZHVwUjhNV3dpM0ZMTTZBUXlkcnhuN2IrNlRJa3F4bVM0?=
 =?utf-8?B?MXJRNDdPV0dDUkR3a0R2d0lIbzA4dXZQZDRBRW1KVWpiakhVMTNWaHQ2VHg0?=
 =?utf-8?B?Rm1ETndXVTZ1Y2JVZkIzTEV5SlVEUDRqdGNEM0Iza0M5djRmZDA3OFVJZHFw?=
 =?utf-8?B?TFpsdm45dEZZQXpKWVREMTVHVVl2SVVLME9DRjVwaHdSK2lYTC93ekZFcHBR?=
 =?utf-8?B?SlJsY1dlcnhldFZSWk9JMnQvaTExbHo2MmZudGdCUFlBTTl3QzBoUUY0b2Zk?=
 =?utf-8?B?a25lbFVOSmpkMjgvaTFNbTdzYUgzV2J4TUxnWGJTbjRNOXNRdXR1dGczeVMr?=
 =?utf-8?B?V3lTajZKVGNJT1RxUGswL1RYQXFzUU5Yc1NSaVhML1hWY0g1aVcwQzVLSmNU?=
 =?utf-8?B?d21PaGZKOG9ET3RQa05sbjhqVk9UbFByenFwN09VSGxOTm40TmgwODl3SDRF?=
 =?utf-8?B?MHFhSjJrZzl6ZlY3V1N2T0QwYnROTzBkU1YwVzVlS0NGSWRjRk1xM2pNOHNi?=
 =?utf-8?B?QVU5OW1ZSTFLWmNHMTF2aUtKYUhHaFpINnN1VS9WaDZiSHpWMkJkZjNlT1RW?=
 =?utf-8?B?dnltTXIxa2dpNDBPeFJzZTJlekVvMFRKdk1neFFaV2EzL24rQlBzdDFZRm1I?=
 =?utf-8?B?UWhWMFpUT2s3VkxmTmNCUlkzclhpUE5zL3R3TTkyWDM1ajNic29xb1Z2OE9I?=
 =?utf-8?B?RTNrYzhzV3BRUVdLT0JBOXlxTm5VWXpqUWxaaDBMbXJXRlNPNWorci9sS1cy?=
 =?utf-8?B?Z21aVUlZWm8wMzhPemFFSXlaVnRPelgvVGs2a24ycWJ4Zmc5OHN3bVJWTFRi?=
 =?utf-8?B?NU9kQUt1MVhIemdjV0t2cmcvWlp5a1JxcTFHc2F1RFJRUElsNjFWTXNFVEF2?=
 =?utf-8?B?bVlpa0FpUEJwTFdLWnZONlFVckNPUjFxYXR4anNrNkRPTDZ1TGQ2SEpWeWNU?=
 =?utf-8?B?RW5wN1ZuUzlKRGs1V1M0VThnS3ZKeFJFNFNjVmRIQzcwYm1RQjlqalFLSVd2?=
 =?utf-8?B?c1JzUHJZOTBNWTFySG9oTnpERHhqSG5zNHAwbmE0TUx6ZExTeDFMeEExNmdI?=
 =?utf-8?B?TjV0dFhHT1gzVWV2SkZXRkpZbmhvSUtCNUw1YVZpNFBYQ0UxRjNnWkN0Y3d0?=
 =?utf-8?B?eHVvTGQvSmFFbjBUN2RmY0JxTFU4TnZWcC9VZHI1RXJldHlNVDNPK1c0c2Rh?=
 =?utf-8?B?REFnN0JwcklLWXNoUHpJdFovakdyajFCZWQ1Ykl2c2hZV21zQUp1bEpLYlJz?=
 =?utf-8?B?c0JHQ3BaYU5IYXU5Y2I5UjNGbGx1Z2ZXYzNyQlBJUFFRa3VSQmttK3BIdTJv?=
 =?utf-8?B?dWdrSERPSVlQZWxOVDB1ZGNZc2VLR2p6NlZOU1RQaXB2WFFRcDl1bW0yNHky?=
 =?utf-8?B?OTlXYkRCbTJnbUNIWHVFTE0wTlp3eThSc3N4WUZhVVovSDZLU0hTWmcxcHdH?=
 =?utf-8?B?bGlxM0FuNlphU0JFOGNEdFozdGFIREJOSlJsTUExKzhTK2FqcmlYbWxiR0Fk?=
 =?utf-8?B?emdGQ0ozVE91TDR0bzA2eWl5WTVXOTIzY0ZXSXptSEcvNzVPMmM2VjVHc0g1?=
 =?utf-8?B?RjdUSmJJZHYzclo2Z1JreW9FTEcrUlkwd1pnZ2d1eUttUWVHekhhblRERWtL?=
 =?utf-8?B?NFp3bmlOOGQ4Y1I1ekxPWWtOckpJeXFDb3Nya2dKNlk5WDZMV1BwNDNFSWw4?=
 =?utf-8?B?Rzg0TXlqc1dacVZpekNweHpqWjFlUG15eU5FQXp5clN2dlJzSGdKd1VJbVRG?=
 =?utf-8?B?dzAzc1hZV2Q3NnJCalpGZjRCUnJYUmNQZ2tzUjgyUWV1RncwRHNVSVZaY0M1?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfbfbc7-6855-4122-b5a6-08dbc8f8e92b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 18:52:39.4172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g92vbz50ybSgwBe2swqJJb0Ao9YYKTnMhBTs2TJgVN3n4k3dtTj/S+mNJ5EhV5QCalRGX2LN0fa4GsHR3/DNEomV5D+SAExsggGvB/lWww0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/2023 09:52, Andi Shyti wrote:
> Hi,
>
>> From: Nirmoy Das <nirmoy.das@intel.com>
>>
>> Add a function for ratelimitted debug print.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Just a kind reminder!
>
> This is the second time this patch has been sent and we have seen
> some potential use of the drm_dbg_ratelimited().
But this patch does not actually add a user. So it is dead code at this 
point, which is not allowed.

If you have code that wants to use such a helper then the helper should 
be part of the patch that adds that code.

John.

>
> Any feedback?
>
> Thanks,
> Andi

