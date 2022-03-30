Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91C4EC8DC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 17:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B594310E604;
	Wed, 30 Mar 2022 15:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656D110E5A4;
 Wed, 30 Mar 2022 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648655602; x=1680191602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I2ZYk9vTFcbYk569ioYcENAZyKfVkZMefeAZBWZXRqQ=;
 b=MGqp2TPQBj2mBWBcmRTur6k9D1iYlVl8ptvvflfISgtkqySkO92FiudO
 E3cxZwhmKImZYtwW1cULyCiHFkrdSrMAoyizPCZl316d9gFzAupgg2HNn
 mjhrhA8XcRVNmPoeHkPKbB8xwHWrVTV+MXu5OS1GCR5Yye5HDbI6NKvhc
 w8g9pQYjQGWtLZTdVxKUISA2ub7BNaxaoZ1vUg0oCVaOiiEsNjSkdY8O+
 8Ly0jJzSgwWQ+Q8gx7of0u80wtH+PzhqbR14ig2+59Son2ZH9rk3mVKHp
 pIoVznKo7gqAWGL/qXhYf3vFObL8HePoJiyGjCv9sA+M/GH5p12y42STq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240171623"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="240171623"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:53:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="649915343"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2022 08:53:19 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 08:53:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 08:53:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 30 Mar 2022 08:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T75zHTTg62QWT67Z5Aj0Qtdt6aqUDWxbQxU814v4UczwYUktD64T53Ur9kEhgmW15GgNW8gTqzZ8NgIwTXVkDGKcW/7SPSV1wnOz6HTGI1KCH02a36iQBSjYVXZnXxHjtNGI1/g2N0EhhJ7CuB7A5p51Iu+DxI+o8zYVABwBBPLadJfYiSjopaJ68/wMza9qJ8LpEgLmr7Lc0brXX9feCRI6aviD83tf6HzCkbgbIE0GkHOKCcWJYjocQyIvN9buOl5V5h5+YsZqxcrDR+n3me04Dm/fIxHIjTNqK+E+Tk3G5x1UZo8vv2lCo7Ph+l5NuD0kUw6Nm0ypEBWNcXzx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaHGyfMFdKDnoKf8JiPAf0noXKXn2CsLmcjaUdwBKpk=;
 b=b0SFQJ4wjVzlRKrC/3LMg3wiXya78pJaP0hxBIPzEZsi7gsgST7sazT0DcoVTODrcz9JCzEf7ceewj19g9Orr8e6yvXFf9rWQsD/+kAmWYH3VUI7QBVUnJNeAuqyuhqtndfoSCH2245IDov76xqNI0Bh0A4Nfkw3eWXd+1qIIR19gkNDYr2jIQFTgBhCFDCuIKDxkkJ6PglvPTc/VoEE8UQlGWKURRyO5PhkbS0URKKxpwUjoANWGdrdXFf20h+akgLw6o1d5i0CzbnVOvBFTwiMVoX3rhG6xkL6U8Y+KkQe5PMOwq5MH7NTU7Zy+lA/VC+cBbdipOAOzbgHrKPBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 15:53:15 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::21e6:3fe8:e859:75b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::21e6:3fe8:e859:75b5%7]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 15:53:15 +0000
Message-ID: <8115ca91-6fb7-d495-e50e-024a18f3b7f8@intel.com>
Date: Wed, 30 Mar 2022 08:53:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/i915/guc: Use iosys_map interface to update lrc_desc
Content-Language: en-GB
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0260.namprd04.prod.outlook.com
 (2603:10b6:303:88::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc560c4c-b1f4-4512-69f6-08da126566a3
X-MS-TrafficTypeDiagnostic: LV2PR11MB5998:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <LV2PR11MB59982C1828D17989FD9A729EBD1F9@LV2PR11MB5998.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yw2lMk9cKUxT7oMkbm+USahWKuzWA4GRei1abvXrlK5ddJvPfA33O4oStJ73HwziT5AxX6IIaqmq3iJ61kSe/eFdszO0Uc1/yt2c7Um7+qyFI/4wRfMP0nKmGnx778Q1w65GPxeokXY3UaD1YknyE/N/OE6gdpQ9w5jb5o7wBSV34EFe0laCigcJQJMu5Zpe5E9wZXdg7ukkN4mVRkCwgjm3WlQVLYG7T3rkqnNWYtoy2RBj8Ak2dMgVEkWJxFRNhoPP1VUdgtVY33hwe5tovl19ttBj0yPded8BYoYYgoPxwM8Tb192ECfD3abwN2IwdQkOp4d6K2TNc9R1M1RZCiae1CHv17liiwDGpBMvOL2zMTSeJTOmOClZOYJJcXfLZXC24KAi+st7880m29ATYOys3jshDGK7LR5JhGM+OFr8iPBdAmtUdANOKV6kCvo3ljiceMRTNRO//y/ALP4UpYrXWaI5U4L4KWyIWAlxWWRbzrQcKjjf35kpqCQovfl6+CobtZBMqDmtTqte/vobk3vIEwteyRM4I6PRKbwKpCYIIW37KuKfwB6yDij4D2xHZhatna/To2zGA3PPwMwOIMLJwiPi8p5gN9YqLOCeHo0tCEEBk4weFrAVI1OliFz7+BST2ZHK5BO1w6qbM2tMoku1dZcqBgXqFRnB8F4ZXn2xt6V0WXmTDTL0g3ck6Kanb9BsM181zauAL/fyqlejTPJxOnnVE0czOGhx39Nn8wh3ply6g9JkbwmZu7yRn381
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(83380400001)(2616005)(26005)(2906002)(15650500001)(6666004)(6506007)(6512007)(508600001)(53546011)(31686004)(36756003)(82960400001)(966005)(5660300002)(31696002)(316002)(8676002)(4326008)(66476007)(54906003)(8936002)(450100002)(38100700002)(86362001)(66556008)(6486002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEl3blcyOVljZ1B4UGRUYTFleFg4VVU2b0RRdmhrdUE0Z3l6M2dLQVRobE9E?=
 =?utf-8?B?VnFuZldnOFB2UGZwTk5ZblQwWjlWS2M0anhMWkY0cE1oOFJOU2pUSzdyOThJ?=
 =?utf-8?B?RFVLOGFjaStMYXVLc0tySEVkc1NYS2ZpYnpwOFFUY0dJbXVMT3JTOUdhZTBM?=
 =?utf-8?B?THp1Rk9ydE4yS2FZWDhROEtiMlJxZklWUE52RzJ6dzYvUkRFL0RhQTd4cnc1?=
 =?utf-8?B?d04vRXJPTU9SUk8rRTV1cmtsOUlTYmZPdHpReXBvZmZMUVViQThPOHpiZTdI?=
 =?utf-8?B?YUptS2xpSW5zWFVsbTRJcDk2M2QxbXlUMkF3OWVYTFptYjlzbjZidU1xcmNy?=
 =?utf-8?B?RVNTaXNZZjhUV2pDQ042K1N0QWNrUHloMU1Lb2lvTGpXQmZJbzFRTFYwbXlk?=
 =?utf-8?B?VUZ5eUpnck9iZUt6UXUyM0dLS2J1ZVNMZzNTamw5cjFJZU1IM1JPMi9ZK3N1?=
 =?utf-8?B?VVJWUUJ4RzQ5VXZtaG43MjVUNDR5UEEyOEdMVHo2YWoxT3NlYlVWV3FvUmIx?=
 =?utf-8?B?VzFRWDArOFU2M3JhcjFIaWlPUmJEeGRpZU9ZZHFvaVNzSWM3Nm9raWsrRDZM?=
 =?utf-8?B?My9xOWJXV2JQay9MNDI4bXQ5aWJVYVVxeThiV1podnJ6cm5TVGdHcDBwU3dW?=
 =?utf-8?B?S0Z6cnJQMjhVOWs5UHZmbVZLRG5LZGVMTnhpdVpIWFVPMm12dWY1YU5hZ2x6?=
 =?utf-8?B?RE5LV2RpMHN0TVd1TVFlYzRDamRyaGlULzMvVWw4cThZSWkxTjJzUWRhZGw4?=
 =?utf-8?B?cDgxQTg4RCtPTzVER0sxZTlTa1krVnVFbEZPZWU3M0wxbmhFVHYzTHhHUVhI?=
 =?utf-8?B?ZG5Kc2hNRU8zSzlkNFpMLzZBWHJ0dElkNWticnZ5V0cvN01IZ0l5cURnK2p0?=
 =?utf-8?B?bVNhdjM4OXdFQzFYRm1wT1JXOEdObklpb2hZOXhlUWpnT0dwZ1VsK1lld0tS?=
 =?utf-8?B?TGxTYWNCZ2E3S0RvSVkzZEdaR2FNK2ZhQmMwbXlrTGVabXBDN09JY2xUK0Rr?=
 =?utf-8?B?YU8zRHlYQ1dKRTRmRy9xOCs1NjBPeXZBWnRMNDFnQzVxVVpFaGorVklmUGJH?=
 =?utf-8?B?aXErakRwdzMrRXFVbGltOU1iODA3WmhxL2FJNW9teklmTE5UVU5OaUFiQmtt?=
 =?utf-8?B?WG5DdzRMcjdadklIaW5HUEVLQjFpTWxzdDRXOGlrNDN2VFlqVTlSMGVqZU5D?=
 =?utf-8?B?NWlpa0NZNDhFSW50ZW5FYTFnanVZVkNZNFlyMjJ6K3M1QTJvYnhuNzhnbktJ?=
 =?utf-8?B?a1hCZTY2UkpkNXprTWRmMTdmWXcxdElrVmx2d1RYY1AyMWg5cDZzaEJWZlV5?=
 =?utf-8?B?UStORFlJV0tJYmhBc0VYcXBIVmFFRG5nandJRnphbzdhU1JZWXg5bWtTQm14?=
 =?utf-8?B?YUE0ODUzRnZKek44aFg5VWtaQmxGWTR1c0xPank1c3hIVnBDRk9KT3hUeS9N?=
 =?utf-8?B?OFBSdXFBZk1oV3llNGIzb0wwQVZWdldON3FkSEdaTHBqM01aV2QvSHhvUmdY?=
 =?utf-8?B?VUJPRjFPT3k2YjdKVUR4bUp1bmVBY2VJQlhuVG9rbUdCL1Z3VG9qM21LdTRK?=
 =?utf-8?B?T0t0WUVWMmxQYnpFT20wdjY0enF1NXNvTUVYRzdNZXFlSzdVdHNDZ2c5eHhQ?=
 =?utf-8?B?ZzNjYWFNWFIxV01TaE9icDdYYXAwOTBsc0c1eURrVGE1Ykw1Si81OHg5QTRx?=
 =?utf-8?B?STNhdzh3UGFCSG1nVmhOemJHbldjMkdTYzV1czVsWVpyNXN1RnhLa2V4Zjdo?=
 =?utf-8?B?QzZSaXpVd2t6Y0JHTzFoYjhwYm5jYVpFdDRuRnlBdkVOR25Ka25BRmF0L050?=
 =?utf-8?B?cStwbHl3cVEvNDFlUDc2NFVkTXZ0QkNyZmRNUFRWekU3TGpqVkdtOG81MDgv?=
 =?utf-8?B?VFp0QnlwV1I5SCt3a3FZVTNJRUFOQnpSVU5pMFNHOHZsZDF0bUpibk5iTjQy?=
 =?utf-8?B?aUhkVmhrV29WdHRaYlFrSmZRcERpRU9WUGczOTB4QTZESnRTbDZ0Y0MvcEFR?=
 =?utf-8?B?TjFaTjdsclh6QktycFR1ZHdhMlNnb2JvUzFHdDE0UHB2dDRFMGRYZytiaUlv?=
 =?utf-8?B?dUVFL0RmUGtIRDJHRHpRa2lRcFdSK2RNbXUrNGVwVCtoNkpGSk9POXRHSFFp?=
 =?utf-8?B?TVdvNGtweklJTjhVU3BOUkMra1FGbG4wanlRd0hEdEVYeHhnVGpOMnF2UEt4?=
 =?utf-8?B?d1BVQUk3ci9rbUg3V3d0czNxMGVYZzF4V0hPVTBmUmwwMEt4cUwwbGRrTkg5?=
 =?utf-8?B?L2ZocDNuOHptaUNRRnJrVFJwanhYdlNYdThIVnpEbExtVm1QRytGWHR0KzZy?=
 =?utf-8?B?UWk5OFpiNWFqNlNzWk5rcURlSEJDZ1B5N3VzMDk3N1AyWjJVQTVtWG9sRFVa?=
 =?utf-8?Q?JbBcQcVq0Sm+0GJY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc560c4c-b1f4-4512-69f6-08da126566a3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 15:53:15.2453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHey6Ss/zhc7DNhO28GoPlDyeCjzvvYRpTSe4sLeepOvVAc2wSwZEK68M7Yq0EI3fX+h/pkfxikjeQxH+QRFLkZl5EyCN7gOJDbCp1TeLBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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
Cc: Matthew Brost <matthew.brost@intel.com>, michael.cheng@intel.com,
 wayne.boyer@intel.com, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, only just seen this patch.

Please do not do this!

The entire lrc_desc_pool entity is being dropped as part of the update 
to GuC v70. That's why there was a recent patch set to significantly 
re-organise how/where it is used. That patch set explicitly said - this 
is all in preparation for removing the desc pool entirely.

Merging this change would just cause unnecessary churn and rebase 
conflicts with the v70 update patches that I am working on. Please wait 
until that lands and then see if there is anything left that you think 
still needs to be updated.

John.


On 3/8/2022 08:47, Balasubramani Vivekanandan wrote:
> This patch is continuation of the effort to move all pointers in i915,
> which at any point may be pointing to device memory or system memory, to
> iosys_map interface.
> More details about the need of this change is explained in the patch
> series which initiated this task
> https://patchwork.freedesktop.org/series/99711/
>
> This patch converts all access to the lrc_desc through iosys_map
> interfaces.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 68 ++++++++++++-------
>   2 files changed, 43 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index e439e6c1ac8b..cbbc24dbaf0f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -168,7 +168,7 @@ struct intel_guc {
>   	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
>   	struct i915_vma *lrc_desc_pool;
>   	/** @lrc_desc_pool_vaddr: contents of the GuC LRC descriptor pool */
> -	void *lrc_desc_pool_vaddr;
> +	struct iosys_map lrc_desc_pool_vaddr;
>   
>   	/**
>   	 * @context_lookup: used to resolve intel_context from guc_id, if a
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9ec03234d2c2..84b17ded886a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -467,13 +467,14 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
>   }
>   
> -static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> +static void __write_lrc_desc(struct intel_guc *guc, u32 index,
> +			     struct guc_lrc_desc *desc)
>   {
> -	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> +	unsigned int size = sizeof(struct guc_lrc_desc);
>   
>   	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
>   
> -	return &base[index];
> +	iosys_map_memcpy_to(&guc->lrc_desc_pool_vaddr, index * size, desc, size);
>   }
>   
>   static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> @@ -489,20 +490,28 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
>   {
>   	u32 size;
>   	int ret;
> +	void *addr;
>   
>   	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
>   			  GUC_MAX_CONTEXT_ID);
>   	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
> -					     (void **)&guc->lrc_desc_pool_vaddr);
> +					     &addr);
> +
>   	if (ret)
>   		return ret;
>   
> +	if (i915_gem_object_is_lmem(guc->lrc_desc_pool->obj))
> +		iosys_map_set_vaddr_iomem(&guc->lrc_desc_pool_vaddr,
> +					  (void __iomem *)addr);
> +	else
> +		iosys_map_set_vaddr(&guc->lrc_desc_pool_vaddr, addr);
> +
>   	return 0;
>   }
>   
>   static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
>   {
> -	guc->lrc_desc_pool_vaddr = NULL;
> +	iosys_map_clear(&guc->lrc_desc_pool_vaddr);
>   	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
>   }
>   
> @@ -513,9 +522,11 @@ static inline bool guc_submission_initialized(struct intel_guc *guc)
>   
>   static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
>   {
> -	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> +	unsigned int size = sizeof(struct guc_lrc_desc);
>   
> -	memset(desc, 0, sizeof(*desc));
> +	GEM_BUG_ON(id >= GUC_MAX_CONTEXT_ID);
> +
> +	iosys_map_memset(&guc->lrc_desc_pool_vaddr, id * size, 0, size);
>   }
>   
>   static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
> @@ -2233,7 +2244,7 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 ctx_id = ce->guc_id.id;
> -	struct guc_lrc_desc *desc;
> +	struct guc_lrc_desc desc;
>   	struct intel_context *child;
>   
>   	GEM_BUG_ON(!engine->mask);
> @@ -2245,13 +2256,13 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
> -	desc = __get_lrc_desc(guc, ctx_id);
> -	desc->engine_class = engine_class_to_guc_class(engine->class);
> -	desc->engine_submit_mask = engine->logical_mask;
> -	desc->hw_context_desc = ce->lrc.lrca;
> -	desc->priority = ce->guc_state.prio;
> -	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -	guc_context_policy_init(engine, desc);
> +	memset(&desc, 0, sizeof(desc));
> +	desc.engine_class = engine_class_to_guc_class(engine->class);
> +	desc.engine_submit_mask = engine->logical_mask;
> +	desc.hw_context_desc = ce->lrc.lrca;
> +	desc.priority = ce->guc_state.prio;
> +	desc.context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +	guc_context_policy_init(engine, &desc);
>   
>   	/*
>   	 * If context is a parent, we need to register a process descriptor
> @@ -2259,36 +2270,41 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   	 */
>   	if (intel_context_is_parent(ce)) {
>   		struct guc_process_desc *pdesc;
> +		struct guc_lrc_desc child_desc;
>   
>   		ce->parallel.guc.wqi_tail = 0;
>   		ce->parallel.guc.wqi_head = 0;
>   
> -		desc->process_desc = i915_ggtt_offset(ce->state) +
> +		desc.process_desc = i915_ggtt_offset(ce->state) +
>   			__get_parent_scratch_offset(ce);
> -		desc->wq_addr = i915_ggtt_offset(ce->state) +
> +		desc.wq_addr = i915_ggtt_offset(ce->state) +
>   			__get_wq_offset(ce);
> -		desc->wq_size = WQ_SIZE;
> +		desc.wq_size = WQ_SIZE;
>   
>   		pdesc = __get_process_desc(ce);
>   		memset(pdesc, 0, sizeof(*(pdesc)));
>   		pdesc->stage_id = ce->guc_id.id;
> -		pdesc->wq_base_addr = desc->wq_addr;
> -		pdesc->wq_size_bytes = desc->wq_size;
> +		pdesc->wq_base_addr = desc.wq_addr;
> +		pdesc->wq_size_bytes = desc.wq_size;
>   		pdesc->wq_status = WQ_STATUS_ACTIVE;
>   
>   		for_each_child(ce, child) {
> -			desc = __get_lrc_desc(guc, child->guc_id.id);
> +			memset(&child_desc, 0, sizeof(child_desc));
>   
> -			desc->engine_class =
> +			child_desc.engine_class =
>   				engine_class_to_guc_class(engine->class);
> -			desc->hw_context_desc = child->lrc.lrca;
> -			desc->priority = ce->guc_state.prio;
> -			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -			guc_context_policy_init(engine, desc);
> +			child_desc.hw_context_desc = child->lrc.lrca;
> +			child_desc.priority = ce->guc_state.prio;
> +			child_desc.context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +			guc_context_policy_init(engine, &child_desc);
> +
> +			__write_lrc_desc(guc, child->guc_id.id, &child_desc);
>   		}
>   
>   		clear_children_join_go_memory(ce);
>   	}
> +
> +	__write_lrc_desc(guc, ctx_id, &desc);
>   }
>   
>   static int try_context_registration(struct intel_context *ce, bool loop)

