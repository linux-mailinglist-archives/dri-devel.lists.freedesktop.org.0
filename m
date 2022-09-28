Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E125EE669
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 22:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728FF10E403;
	Wed, 28 Sep 2022 20:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD5510E403;
 Wed, 28 Sep 2022 20:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664395585; x=1695931585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lwAljTUCbj2EPWh3Dbo16Qb+vxIgA45e1lC48aZwQRQ=;
 b=E1lPO3Tblt2UgEZrwd8tDnYMOV+9eB8Y8Qs3hAnAiSURVvMzvJWh2jBo
 cARe5RwCrOzWPzXaznQ1TcxRWdUvx4mAUfsZh15xGUM5lBZ19sV44PbKY
 i2ydtHzSW1bKWjn7MrSSDnEojrE/kRc/sBAxOUO+1TvKCzo3UMN8M+2/b
 PrddWFpv2P+i8lyH2ikVMCmQ5MCVwnUjvYQL5gaW2yukh79zgGVOaNuh1
 QFMJY38CSQvaZyG2D6A4+i9VfWq9TDzsC5xuoNPg4+xCjLoD6v352tWy3
 VZsvNBPmFzHmjDYeYzPMDJ4VgA1pdIXwW0Kk+YS8eSZSzWx4BCqx/ZDpx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="299303981"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="299303981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 13:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="797279279"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="797279279"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 28 Sep 2022 13:06:24 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 13:06:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 13:06:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 13:06:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 13:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMxqXOOro0ddZLn8nVkCA34oYD+CyuposAAv4ZTfxMmGn7Aw1tfuTHw8cFYe7SrLVZvfr9DoplQHllKaEzzWh1k9qqnuU9Am7RXHbGppVIu4J7f7NRqO6+Zrm4asnYLO/YbMVKQwbOrQrgR//rTKYHEF99wZQTf3ZnmE2kcM6SuJNMTDlM4k81HElZlnm8trWVzM+0lHSg18F8E6E7660yEnGyCZjRJPFWp5rM2pZBNDEAkM4l1xRZRjyD+DI/HYsgKYw7B9SAhluSktr5Tn2uLHx/KFQzIRbuaWzgPpu5KXvGQPTpoNLYB2lQf1HKT9URZBd+2vGTwmslQIEsI8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TZm1Bix3+FkZe5r97RNiKQCBT1J+V73L0oVXSnW1Sc=;
 b=GbECEaSIeD4xncU0JZI2ZbE+ajMG8xHJqA9vOOszbjEVUHypCsj6/IH6yPnXxmalsY0xjRFh80NEn0OU/WoNTRbdq+NZBI5ofphLU0fMZ5WQyqjzskScQ5yJ6JeB0csFWEZ5zdin9NoXXOpQ8bwB6vtMvrSPXrLMO7xA796+GeFi23urOOolwDR32gDkMa9ltBV6k6EfJNkAACynyEOcML6InfpKqnXlIzQV2+Q/chK45h5KrXJV8EL18Cj0BMJcpqEmzh8kVmrI7BvfCBGMTTQyBUnFnjj+4NWOdvwnsmrH73ToKUa1SE3YadYU7YisbgVjq08oRnIhocT8Vw8WSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1424.namprd11.prod.outlook.com (2603:10b6:300:26::16)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Wed, 28 Sep
 2022 20:06:20 +0000
Received: from MWHPR11MB1424.namprd11.prod.outlook.com
 ([fe80::ac6f:e513:ff1f:bcc1]) by MWHPR11MB1424.namprd11.prod.outlook.com
 ([fe80::ac6f:e513:ff1f:bcc1%12]) with mapi id 15.20.5676.017; Wed, 28 Sep
 2022 20:06:20 +0000
Message-ID: <51c77cde-e57e-9feb-9901-2d639a962834@intel.com>
Date: Wed, 28 Sep 2022 13:06:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [Intel-gfx] [PATCH 05/16] drm/i915/vm_bind: Implement bind and
 unbind of object
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-6-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20220928061918.6340-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MWHPR11MB1424.namprd11.prod.outlook.com
 (2603:10b6:300:26::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1424:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: e622ad2f-5afe-4d05-b405-08daa18ce8e7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZRiFNgmOYyGkgSteW1hemeW/IdGsVG5YlYTZg4/fVFDVUb3HMVr7ieky2FgSLKcKmVbE9Hwn3t3QIY+6aaL6ePi+tqyAda852Hav451JVQC9Ph04A9Kf830lvtI79C8NSyByoqOdwVRxjGyBe1jnhPz16eiYzaj6/OmGk1WZV5ieuqMdrKPwZHPHYdNp23SF/0+E78drtRv4SThJgvFhuMUyxisE0iSnUtp7tO5s6ifAEy63PK/0UxeLaNsNUT6r05lmx3nMuxSY9yPHNVEe5/8vntFdi40bd+VEevkM5S76q7Ir0zYGGdPR3XrZzyyt4zGdPsAmYyIjqwbcN2DsGKuRrGi9gt86lk0brAbItOfZfr8yo5vnv/cZ8U/EeZxUF9HA0gcrWGVthXgj4Zoo5bdoDI8pvnjwBpU+DGz3yCVM7JG5WG5pSyjHa48J+a5fQTlgHW1vjIVFtP3J1Iwj5WvR/bOslfbTbXWNN9QVopI+wOn8YVCW4TxWj8y3nW6Dxk7UNR43YKXwXo80dSfk+blFYv5ZATDMD+MTPdavVNJktyRhdydQ+2qfAJDn9E98CFU9SQrD9mhPOPP83ti5yMC49KCyqswTc8HIp6WODuRazCXVPjCQ75+ssRhEwSuyRkbjXJGcaFeEfrZSb7nBu2zMlRWXxnRVR0g+Xp/pVB67E7DKcL00IqsckRsfU0MudKgCRf4EtprGPnVvOE6JfkyQnaAaxu8R90oCbw5WMipEQ+S7CVSuIwFgLlIUcx6zaiM8L6xQkQPYzoz3uV9sUbjiA79r4NhbuZCkggcXCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(31686004)(66476007)(26005)(6512007)(186003)(2616005)(478600001)(36756003)(6506007)(82960400001)(316002)(38100700002)(2906002)(83380400001)(6486002)(53546011)(41300700001)(5660300002)(8936002)(66946007)(4326008)(8676002)(66556008)(31696002)(30864003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWpOR3VrdUxybThKSFBDaUo4enFDSXY2T25tdlN2VDVCZVVhaWhxaFovanQ3?=
 =?utf-8?B?TmF2SmlsT3NDNGRzZVlhZmVoa21Db1BSOGNZaXVkQmxuVER4Zy9EMDhXYXR6?=
 =?utf-8?B?WG5wMldIZ0VYWlhEWWZCcnBTem1GbDZ3U1IycEU1ZGNjRmcxRlI5MVZRSEE2?=
 =?utf-8?B?WVZiZ2lrTk93QnZJUjB4R3BVbEVsVHltL0V4MS9FaXB6Y3g5UGErRXgvcFRy?=
 =?utf-8?B?aWNNWitHOEFBdXBTVk0xNHg1Nlo0YUd0QTg2QkZXeTdwdG1WaXY5ZDRyS08v?=
 =?utf-8?B?b2dDVGU1UkxLYlNDaEpuSlE2dTZtaEQ5Si9RWkJEUENYWGRaL25lZWZ2ZENV?=
 =?utf-8?B?Q3pFUk1OeWtpdzdWWkJpZGhCcE1tRWZlR1pHMHBuTzIxbDhSNFlwNmFXcjJh?=
 =?utf-8?B?NmR3THpLbk1kQ2hFUVhHTE9lY0dKdVNZOEpTUTd2QUJvTlVIaDdFb0N5YzEx?=
 =?utf-8?B?R2IwUi9idGhlU3VKZGxRdmxYSk02MVhOMzRZdjdzU05ISFZ4Zy8zU0pLUUZt?=
 =?utf-8?B?ZU1Hd0xhRUhNcTgwMDIxeEdHUnl1RDArYWtBclp1MURrcTY0SHJVRTVRZU93?=
 =?utf-8?B?YUhpbWpiUEhxejJac0ZCL3dsVUc2YW9HTWRoNTNUTmZLVnNWV3J4dlI2aitJ?=
 =?utf-8?B?QVpMSTM4VHFtTnRIeDhRbmFLT1MwanRhUmx3MEZzcmw4YmxsanlxQllpR1ZY?=
 =?utf-8?B?RDhkWEdBN1R4Nk56dEdWdGlUazJPaUxLdUplMWx0ZjB4VEFzY3o4L3lJSjdI?=
 =?utf-8?B?RGFpNGp6NU0zOVdoRlFiT3JVUVU0MENiS0xVZzJvaGl5dnFqMEg2NkFPVVNh?=
 =?utf-8?B?WjNnMTlKbGt1cURLWDNVZlFFR3ZXU0F5d2JKZUJnditqSlVFMzZzY1BYWE55?=
 =?utf-8?B?ZkJQczhuUUJ1MG9IQVhOaitFdXQvdHhNcnFKTDBxWkx5SzYvdzVvTDRST2ZW?=
 =?utf-8?B?WkgwOS84NVB6ZXQzMWFCYlV2QmJoazY5eFVNeTlTVXV0Z1N3SURTVytZNTB4?=
 =?utf-8?B?Q3dBM1Y1aDdwTzFkd2dHNmNuM0JmUWNGdW5VdzBCSS94SkpoMzBTV1A2eFFL?=
 =?utf-8?B?UHFoODRNQkVHc3ZEeUYxdmFBTy9hRmkxN09SWlZoTlZkQmpya3hOeURzYis0?=
 =?utf-8?B?cDR1U0NnZGpCT0lyVExLa1Y3WUtJTXJkUkJOVE04Vmp6NHVZSFpNY2NacGhC?=
 =?utf-8?B?MEYzKzNXekc5SXIvK0YxTEt5dklFNjQwMnc4TnVQSzJhWFArOHM2QzJZNW5Q?=
 =?utf-8?B?enV6UDE3R2J3Y1VTL015N0t2YTAxbmZzOHczRTVyYWtBKzloSW5WdVRaalF5?=
 =?utf-8?B?R2JkbCtDN2xmTE9WUzdBcGltUERBRXFHWU5tcEJyaUNpSStIRkRzK1RXSG9v?=
 =?utf-8?B?S1hzUGJhTGVONFEvNEJQdGF6MkRoL1FTdXJyWHZ2T2Urb1lYZjEzY2lOTmQ0?=
 =?utf-8?B?eDZ4R1lBZDdXZEV2NTE4aHJ1WFUrcFhIdGZDMnVaWUpFV0hjMy9kT3dCclJr?=
 =?utf-8?B?aXlvTUd1cFg5czk1WUdjRCtPVEpRUWJ4ZEY0K1UvVmhRUTFoOWRhY1pkZlcw?=
 =?utf-8?B?YlFSNThWSU1IRmtkNnRPVTNUOWpnNzBQVndxblF5RVdxRVpXQ3E3MklLTTAv?=
 =?utf-8?B?cUZ2TVJOeUlXMTNyMzNockRYanV4cUU1cVR6RkVrZU56S1BrSkM3YWk1UkMy?=
 =?utf-8?B?MjJIVVZjd3RnQW1kaXZvZVhOYjFlRjlPcUVXT2JleUY0SWJoM29aellDZEdJ?=
 =?utf-8?B?QlgvVEh1TkpRalNnK21jdXRKVkdQR0RFQThpMERuSXhkT1hBMXo3MnIxcmx3?=
 =?utf-8?B?VkFsMW02aGpiaWM3enREMjMvdnNkK0h6SFR2NExWeDdEMThqVm5Bay9nemdk?=
 =?utf-8?B?REh4SjF4SkI3RmtjWXFLYjVneklvY0I0ODNOb1VDWlpnTzkxaitMSzMwOTZo?=
 =?utf-8?B?cnJPSjhaNUNDUmFhZlpJYmI5c0oyQ29nQlNBSzVDR0ZNL2ltVG5ON3RYS1B3?=
 =?utf-8?B?QUI1Y1VZTEFkSUFUOFgwNWFiR3NrV081bWVRQzdCZkNEdFJsNnBvSVEwQXIz?=
 =?utf-8?B?bHhUaU5OVVIxQkNVM2JlK3FkMmNPZXdBV1NrRXlOQ24xT2RQeFZWejVJRHJH?=
 =?utf-8?Q?lfo/Mq4X6NEziUYmE/m5NsigL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e622ad2f-5afe-4d05-b405-08daa18ce8e7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 20:06:20.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMDeWs2s9tuMgjVPS+l9sFpv3rSluMSxPvz2l0pmeMVXzZcaU5rhS++aNYVF1bhoUhdYk7FYBD6CMdrkNYiRLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/27/2022 11:19 PM, Niranjana Vishwanathapura wrote:
> Add uapi and implement support for bind and unbind of an
> object at the specified GPU virtual addresses.
> 
> The vm_bind mode is not supported in legacy execbuf2 ioctl.
> It will be supported only in the newer execbuf3 ioctl.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   5 +
>   drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  26 ++
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    | 306 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  17 +
>   drivers/gpu/drm/i915/i915_driver.c            |   3 +
>   drivers/gpu/drm/i915/i915_vma.c               |   1 +
>   drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
>   include/uapi/drm/i915_drm.h                   | 112 +++++++
>   10 files changed, 495 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a26edcdadc21..9bf939ef18ea 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -166,6 +166,7 @@ gem-y += \
>   	gem/i915_gem_ttm_move.o \
>   	gem/i915_gem_ttm_pm.o \
>   	gem/i915_gem_userptr.o \
> +	gem/i915_gem_vm_bind_object.o \
>   	gem/i915_gem_wait.o \
>   	gem/i915_gemfs.o
>   i915-y += \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index cd75b0ca2555..f85f10cf9c34 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -781,6 +781,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
>   	if (unlikely(IS_ERR(ctx)))
>   		return PTR_ERR(ctx);
>   
> +	if (ctx->vm->vm_bind_mode) {
> +		i915_gem_context_put(ctx);
> +		return -EOPNOTSUPP;
> +	}
> +
>   	eb->gem_context = ctx;
>   	if (i915_gem_context_has_full_ppgtt(ctx))
>   		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> new file mode 100644
> index 000000000000..36262a6357b5
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_VM_BIND_H
> +#define __I915_GEM_VM_BIND_H
> +
> +#include <linux/types.h>
> +
> +struct drm_device;
> +struct drm_file;
> +struct i915_address_space;
> +struct i915_vma;
> +
> +struct i915_vma *
> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
> +
> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file);
> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
> +
> +void i915_gem_vm_unbind_all(struct i915_address_space *vm);
> +
> +#endif /* __I915_GEM_VM_BIND_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> new file mode 100644
> index 000000000000..e529162abd2c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <uapi/drm/i915_drm.h>
> +
> +#include <linux/interval_tree_generic.h>
> +
> +#include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_vm_bind.h"
> +
> +#include "gt/intel_gpu_commands.h"
> +
> +#define START(node) ((node)->start)
> +#define LAST(node) ((node)->last)
> +
> +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
> +		     START, LAST, static inline, i915_vm_bind_it)
> +
> +#undef START
> +#undef LAST
> +
> +/**
> + * DOC: VM_BIND/UNBIND ioctls
> + *
> + * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
> + * objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
> + * specified address space (VM). Multiple mappings can map to the same physical
> + * pages of an object (aliasing). These mappings (also referred to as persistent
> + * mappings) will be persistent across multiple GPU submissions (execbuf calls)
> + * issued by the UMD, without user having to provide a list of all required
> + * mappings during each submission (as required by older execbuf mode).
> + *
> + * The VM_BIND/UNBIND calls allow UMDs to request a timeline out fence for
> + * signaling the completion of bind/unbind operation.
> + *
> + * VM_BIND feature is advertised to user via I915_PARAM_VM_BIND_VERSION.
> + * User has to opt-in for VM_BIND mode of binding for an address space (VM)
> + * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
> + * are not ordered. Furthermore, parts of the VM_BIND/UNBIND operations can be
> + * done asynchronously, when valid out fence is specified.
> + *
> + * VM_BIND locking order is as below.
> + *
> + * 1) vm_bind_lock mutex will protect vm_bind lists. This lock is taken in
> + *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
> + *    mapping.
> + *
> + *    In future, when GPU page faults are supported, we can potentially use a
> + *    rwsem instead, so that multiple page fault handlers can take the read
> + *    side lock to lookup the mapping and hence can run in parallel.
> + *    The older execbuf mode of binding do not need this lock.
> + *
> + * 2) The object's dma-resv lock will protect i915_vma state and needs
> + *    to be held while binding/unbinding a vma in the async worker and while
> + *    updating dma-resv fence list of an object. Note that private BOs of a VM
> + *    will all share a dma-resv object.
> + *
> + * 3) Spinlock/s to protect some of the VM's lists like the list of
> + *    invalidated vmas (due to eviction and userptr invalidation) etc.
> + */
> +
> +/**
> + * i915_gem_vm_bind_lookup_vma() - lookup for persistent vma mapped at a
> + * specified address
> + * @vm: virtual address space to look for persistent vma
> + * @va: starting address where vma is mapped
> + *
> + * Retrieves the persistent vma mapped address @va from the @vm's vma tree.
> + *
> + * Returns vma pointer on success, NULL on failure.
> + */
> +struct i915_vma *
> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
> +{
> +	lockdep_assert_held(&vm->vm_bind_lock);
> +
> +	return i915_vm_bind_it_iter_first(&vm->va, va, va);
> +}
> +
> +static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
> +{
> +	lockdep_assert_held(&vma->vm->vm_bind_lock);
> +
> +	list_del_init(&vma->vm_bind_link);
> +	i915_vm_bind_it_remove(vma, &vma->vm->va);
> +
> +	/* Release object */
> +	if (release_obj)
> +		i915_gem_object_put(vma->obj);
> +}
> +
> +static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
> +				  struct drm_i915_gem_vm_unbind *va)
> +{
> +	struct drm_i915_gem_object *obj;
> +	struct i915_vma *vma;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
> +	if (ret)
> +		return ret;
> +
> +	va->start = gen8_noncanonical_addr(va->start);
> +	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
> +
> +	if (!vma)
> +		ret = -ENOENT;
> +	else if (vma->size != va->length)
> +		ret = -EINVAL;
> +
> +	if (ret) {
> +		mutex_unlock(&vm->vm_bind_lock);
> +		return ret;
> +	}
> +
> +	i915_gem_vm_bind_remove(vma, false);
> +
> +	mutex_unlock(&vm->vm_bind_lock);
> +
> +	/* Destroy vma and then release object */
> +	obj = vma->obj;
> +	ret = i915_gem_object_lock(obj, NULL);
> +	if (ret)
> +		return ret;
> +
> +	i915_vma_destroy(vma);
> +	i915_gem_object_unlock(obj);
> +
> +	i915_gem_object_put(obj);
> +
> +	return 0;
> +}
> +
> +/**
> + * i915_gem_vm_unbind_all() - unbind all persistent mappings from an
> + * address space
> + * @vm: Address spece to remove persistent mappings from
> + *
> + * Unbind all userspace requested vm_bind mappings from @vm.
> + */
> +void i915_gem_vm_unbind_all(struct i915_address_space *vm)
> +{
> +	struct i915_vma *vma, *t;
> +
> +	mutex_lock(&vm->vm_bind_lock);
> +	list_for_each_entry_safe(vma, t, &vm->vm_bind_list, vm_bind_link)
> +		i915_gem_vm_bind_remove(vma, true);
> +	list_for_each_entry_safe(vma, t, &vm->vm_bound_list, vm_bind_link)
> +		i915_gem_vm_bind_remove(vma, true);
> +	mutex_unlock(&vm->vm_bind_lock);
> +}
> +
> +static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
> +					struct drm_i915_gem_object *obj,
> +					struct drm_i915_gem_vm_bind *va)
> +{
> +	struct i915_gtt_view view;
> +	struct i915_vma *vma;
> +
> +	va->start = gen8_noncanonical_addr(va->start);
> +	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
> +	if (vma)
> +		return ERR_PTR(-EEXIST);
> +
> +	view.type = I915_GTT_VIEW_PARTIAL;
> +	view.partial.offset = va->offset >> PAGE_SHIFT;
> +	view.partial.size = va->length >> PAGE_SHIFT;
> +	vma = i915_vma_create_persistent(obj, vm, &view);
> +	if (IS_ERR(vma))
> +		return vma;
> +
> +	vma->start = va->start;
> +	vma->last = va->start + va->length - 1;
> +
> +	return vma;
> +}
> +
> +static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> +				struct drm_i915_gem_vm_bind *va,
> +				struct drm_file *file)
> +{
> +	struct drm_i915_gem_object *obj;
> +	struct i915_vma *vma = NULL;
> +	struct i915_gem_ww_ctx ww;
> +	u64 pin_flags;
> +	int ret = 0;
> +
> +	if (!vm->vm_bind_mode)
> +		return -EOPNOTSUPP;
> +
> +	obj = i915_gem_object_lookup(file, va->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (!va->length ||
> +	    !IS_ALIGNED(va->offset | va->length,
> +			i915_gem_object_max_page_size(obj->mm.placements,
> +						      obj->mm.n_placements)) ||
> +	    range_overflows_t(u64, va->offset, va->length, obj->base.size)) {
> +		ret = -EINVAL;
> +		goto put_obj;
> +	}
> +
> +	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
> +	if (ret)
> +		goto put_obj;
> +
> +	vma = vm_bind_get_vma(vm, obj, va);
> +	if (IS_ERR(vma)) {
> +		ret = PTR_ERR(vma);
> +		goto unlock_vm;
> +	}
> +
> +	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER;
> +
> +	for_i915_gem_ww(&ww, ret, true) {
> +		ret = i915_gem_object_lock(vma->obj, &ww);
> +		if (ret)
> +			continue;
> +
> +		ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
> +		if (ret)
> +			continue;
> +
> +		/* Make it evictable */
> +		__i915_vma_unpin(vma);
> +
> +		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
> +		i915_vm_bind_it_insert(vma, &vm->va);
> +
> +		/* Hold object reference until vm_unbind */
> +		i915_gem_object_get(vma->obj);
> +	}
> +
> +	if (ret)
> +		i915_vma_destroy(vma);
> +unlock_vm:
> +	mutex_unlock(&vm->vm_bind_lock);
> +put_obj:
> +	i915_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
> +/**
> + * i915_gem_vm_bind_ioctl() - ioctl function for binding a section of object
> + * at a specified virtual address
> + * @dev: drm_device pointer
> + * @data: ioctl data structure
> + * @file: drm_file pointer
> + *
> + * Adds the specified persistent mapping (virtual address to a section of an
> + * object) and binds it in the device page table.
> + *
> + * Returns 0 on success, error code on failure.
> + */
> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct drm_i915_gem_vm_bind *args = data;
> +	struct i915_address_space *vm;
> +	int ret;
> +
> +	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
> +	if (unlikely(!vm))
> +		return -ENOENT;
> +
> +	ret = i915_gem_vm_bind_obj(vm, args, file);
> +
> +	i915_vm_put(vm);
> +	return ret;
> +}
> +
> +/**
> + * i915_gem_vm_unbind_ioctl() - ioctl function for unbinding a mapping at a
> + * specified virtual address
> + * @dev: drm_device pointer
> + * @data: ioctl data structure
> + * @file: drm_file pointer
> + *
> + * Removes the persistent mapping at the specified address and unbinds it
> + * from the device page table.
> + *
> + * Returns 0 on success, error code on failure. -ENOENT is returned if the
> + * specified mapping is not found.
> + */
> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file)
> +{
> +	struct drm_i915_gem_vm_unbind *args = data;
> +	struct i915_address_space *vm;
> +	int ret;
> +
> +	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
> +	if (unlikely(!vm))
> +		return -ENOENT;
> +
> +	ret = i915_gem_vm_unbind_vma(vm, args);
> +
> +	i915_vm_put(vm);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index b67831833c9a..0daa70c6ed0d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -12,6 +12,7 @@
>   
>   #include "gem/i915_gem_internal.h"
>   #include "gem/i915_gem_lmem.h"
> +#include "gem/i915_gem_vm_bind.h"
>   #include "i915_trace.h"
>   #include "i915_utils.h"
>   #include "intel_gt.h"
> @@ -176,6 +177,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>   void i915_address_space_fini(struct i915_address_space *vm)
>   {
>   	drm_mm_takedown(&vm->mm);
> +	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
> +	mutex_destroy(&vm->vm_bind_lock);
>   }
>   
>   /**
> @@ -202,6 +205,8 @@ static void __i915_vm_release(struct work_struct *work)
>   	struct i915_address_space *vm =
>   		container_of(work, struct i915_address_space, release_work);
>   
> +	i915_gem_vm_unbind_all(vm);
> +
>   	__i915_vm_close(vm);
>   
>   	/* Synchronize async unbinds. */
> @@ -282,6 +287,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   
>   	INIT_LIST_HEAD(&vm->bound_list);
>   	INIT_LIST_HEAD(&vm->unbound_list);
> +
> +	vm->va = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&vm->vm_bind_list);
> +	INIT_LIST_HEAD(&vm->vm_bound_list);
> +	mutex_init(&vm->vm_bind_lock);
>   }
>   
>   void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index c0ca53cba9f0..b52061858161 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -259,6 +259,23 @@ struct i915_address_space {
>   	 */
>   	struct list_head unbound_list;
>   
> +	/**
> +	 * @vm_bind_mode: flag to indicate vm_bind method of binding
> +	 *
> +	 * True: allow only vm_bind method of binding.
> +	 * False: allow only legacy execbuff method of binding.
> +	 */
> +	bool vm_bind_mode:1;

Place bool next to the other ones below?


> +
> +	/** @vm_bind_lock: Mutex to protect @vm_bind_list and @vm_bound_list */
> +	struct mutex vm_bind_lock;
> +	/** @vm_bind_list: List of vm_binding in process */
> +	struct list_head vm_bind_list;
> +	/** @vm_bound_list: List of vm_binding completed */
> +	struct list_head vm_bound_list;
> +	/* @va: tree of persistent vmas */
> +	struct rb_root_cached va;
> +
>   	/* Global GTT */
>   	bool is_ggtt:1;
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index fb3826dabe8b..c3a9a5031cdb 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -69,6 +69,7 @@
>   #include "gem/i915_gem_ioctls.h"
>   #include "gem/i915_gem_mman.h"
>   #include "gem/i915_gem_pm.h"
> +#include "gem/i915_gem_vm_bind.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_pm.h"
>   #include "gt/intel_rc6.h"
> @@ -1893,6 +1894,8 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_vm_create_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm_bind_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(I915_GEM_VM_UNBIND, i915_gem_vm_unbind_ioctl, DRM_RENDER_ALLOW),
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 5839e1f55f00..33f910473263 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -239,6 +239,7 @@ vma_create(struct drm_i915_gem_object *obj,
>   	spin_unlock(&obj->vma.lock);
>   	mutex_unlock(&vm->mutex);
>   
> +	INIT_LIST_HEAD(&vma->vm_bind_link);
>   	return vma;
>   
>   err_unlock:
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index 2200f1f103ba..f56ac07c6cfa 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -296,6 +296,20 @@ struct i915_vma {
>   	/** This object's place on the active/inactive lists */
>   	struct list_head vm_link;
>   
> +	/** @vm_bind_link: node for the vm_bind related lists of vm */
> +	struct list_head vm_bind_link;
> +
> +	/** Interval tree structures for persistent vma */
> +
> +	/** @rb: node for the interval tree of vm for persistent vmas */
> +	struct rb_node rb;
> +	/** @start: start endpoint of the rb node */
> +	u64 start;
> +	/** @last: Last endpoint of the rb node */
> +	u64 last;
> +	/** @__subtree_last: last in subtree */
> +	u64 __subtree_last;
> +
>   	struct list_head obj_link; /* Link in the object's VMA list */
>   	struct rb_node obj_node;
>   	struct hlist_node obj_hash;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 520ad2691a99..9760564b4693 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -470,6 +470,8 @@ typedef struct _drm_i915_sarea {
>   #define DRM_I915_GEM_VM_CREATE		0x3a
>   #define DRM_I915_GEM_VM_DESTROY		0x3b
>   #define DRM_I915_GEM_CREATE_EXT		0x3c
> +#define DRM_I915_GEM_VM_BIND		0x3d
> +#define DRM_I915_GEM_VM_UNBIND		0x3e
>   /* Must be kept compact -- no holes */
>   
>   #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
> @@ -534,6 +536,8 @@ typedef struct _drm_i915_sarea {
>   #define DRM_IOCTL_I915_QUERY			DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
>   #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
>   #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
> +#define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
>   
>   /* Allow drivers to submit batchbuffers directly to hardware, relying
>    * on the security mechanisms provided by hardware.
> @@ -3717,6 +3721,114 @@ struct drm_i915_gem_create_ext_protected_content {
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
> +/**
> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
> + *
> + * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
> + * virtual address (VA) range to the section of an object that should be bound
> + * in the device page table of the specified address space (VM).
> + * The VA range specified must be unique (ie., not currently bound) and can
> + * be mapped to whole object or a section of the object (partial binding).
> + * Multiple VA mappings can be created to the same section of the object
> + * (aliasing).
> + *
> + * The @start, @offset and @length must be 4K page aligned. However the DG2
> + * and XEHPSDV has 64K page size for device local memory and has compact page
> + * table. On those platforms, for binding device local-memory objects, the
> + * @start, @offset and @length must be 64K aligned. Also, UMDs should not mix
> + * the local memory 64K page and the system memory 4K page bindings in the same
> + * 2M range.
> + *
> + * Error code -EINVAL will be returned if @start, @offset and @length are not
> + * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
> + * -ENOSPC will be returned if the VA range specified can't be reserved.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
> + * are not ordered. Furthermore, parts of the VM_BIND operation can be done
> + * asynchronously, if valid @fence is specified.
> + */
> +struct drm_i915_gem_vm_bind {
> +	/** @vm_id: VM (address space) id to bind */
> +	__u32 vm_id;
> +
> +	/** @handle: Object handle */
> +	__u32 handle;
> +
> +	/** @start: Virtual Address start to bind */
> +	__u64 start;
> +
> +	/** @offset: Offset in object to bind */
> +	__u64 offset;
> +
> +	/** @length: Length of mapping to bind */
> +	__u64 length;
> +
> +	/**
> +	 * @flags: Currently reserved, MBZ.
> +	 *
> +	 * Note that @fence carries its own flags.
> +	 */
> +	__u64 flags;
> +
> +	/** @rsvd: Reserved, MBZ */
> +	__u64 rsvd[2];
> +
> +	/**
> +	 * @extensions: Zero-terminated chain of extensions.
> +	 *
> +	 * For future extensions. See struct i915_user_extension.
> +	 */
> +	__u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
> + *
> + * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
> + * address (VA) range that should be unbound from the device page table of the
> + * specified address space (VM). VM_UNBIND will force unbind the specified
> + * range from device page table without waiting for any GPU job to complete.
> + * It is UMDs responsibility to ensure the mapping is no longer in use before
> + * calling VM_UNBIND.
> + *
> + * If the specified mapping is not found, the ioctl will simply return without
> + * any error.
> + *
> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
> + * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
> + * asynchronously, if valid @fence is specified.
> + */
> +struct drm_i915_gem_vm_unbind {
> +	/** @vm_id: VM (address space) id to bind */
> +	__u32 vm_id;
> +
> +	/** @rsvd: Reserved, MBZ */
> +	__u32 rsvd;
> +
> +	/** @start: Virtual Address start to unbind */
> +	__u64 start;
> +
> +	/** @length: Length of mapping to unbind */
> +	__u64 length;
> +
> +	/**
> +	 * @flags: Currently reserved, MBZ.
> +	 *
> +	 * Note that @fence carries its own flags.
> +	 */
> +	__u64 flags;
> +
> +	/** @rsvd2: Reserved, MBZ */
> +	__u64 rsvd2[2];
> +
> +	/**
> +	 * @extensions: Zero-terminated chain of extensions.
> +	 *
> +	 * For future extensions. See struct i915_user_extension.
> +	 */
> +	__u64 extensions;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
