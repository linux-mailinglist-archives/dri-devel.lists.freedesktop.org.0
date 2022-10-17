Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2B60142D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485910EDB9;
	Mon, 17 Oct 2022 17:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7710010EDB9;
 Mon, 17 Oct 2022 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666026157; x=1697562157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OcQsDZX7cd/26s+QUQatgkFvhZZb1E8jgir9sGRQtZU=;
 b=OyPflZLMTf30WeKNPIQs4rQE0jMRg+17EsmIspJUXy0NJbJPIFSqJjjV
 Bv10xO6DOm7/+ySaWVd2wYCZ6ABsCPbkaPivmNBlGqhhuirH0aBwvmHtE
 GCldD9mXjaHq6YPmDzu/mcCS4+mSNHll2dywBynset7svZDi7rWWJxseB
 eK8/2Rp5fIa6wrPckCB3Xl05Yi2mCoIFfeaM1i9Z1dRnADQjjRz5srKCy
 oQScQQCsgKzRyFMF9ReSv3ivkdfz4EisqqDSe/urQyLFHKaCk+uZDAu9H
 IM5KkfBXKkj3vUuTD0CGdGN12jWZQdnoO5GjEddy7Inf31RUroItUl/v3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="289153070"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="289153070"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 10:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="770833504"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="770833504"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2022 10:02:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:02:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 10:02:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 10:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMaGY5DN49Ok6Dk641wT93gasuNZmCjYvngw8oYNI129j8s7hUOPNEAqMCNZcneB1VgdDV5cOPdYUlx2b4whwLGBPCCILev+xCUdAopPUiQ+3F+EjOxIrdGmg8eOAYP+e6FepuMaECbI+NwgC3YXa3nFptTn790j6K8/P2ZinDIUmB4jcqtvcMpK8V8L0zlEYqTskVhkt6S4rWso20fc6bEc0D17yzAaPbdCXMkg0g3V8MFuouTxTa13wa3Mg/CNMwm6UyDogZjxQmQ9OI8DlXJFiz1CikY7revfHwTMt+xRdRjxmygBifrCBVBTYurszRi96u+kxfOGsCM7yDztcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDN4KhVUtQQQnPJgU9Az4D+HTf1qJ0dwNX0aOhuhAsA=;
 b=XcTv34ulnrMtYKbkmF+gTx1oUE4H6TbgF/AVnWIDge9ltmWCeZtz0fd63P4QyQSz/tvne9d2TK3bdCc03Pq0kRm4SSyl2wg//EAd90U+CxC4VFxEyxkhjxzaC2dm+DVI3Y4Pqz0i0ll1T+OEQelrMcrXvTeZHPSGBIe3CcWJNwE7sYfSivRZ7Di67D9c90GSfF/V54ez0ESUjvqM0VeasVzt7LwnH6EmtHAjFlPg0j/thAQwF7tFJd1ZZGDxSuwwOjjy8gEfI0Bg4fxf6A+vRW1FqPcJGOiAN07vhk+u/N10MYANgBoJ986nmejsPXIBbYSiat7kYHbvR3AhGm8t7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 17 Oct
 2022 17:02:02 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 17:02:02 +0000
Date: Mon, 17 Oct 2022 22:31:52 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 13/14] drm/i915/xelpg: Add multicast steering
Message-ID: <Y02KgD8lL3/xSrHs@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-14-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-14-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: c94cee4b-2d1e-47dd-b9ec-08dab0614fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WC+pvOdwxnNDUdzTLn0nismbYvbmJ3ZTXI9xedgnhnK9Bq2DNISs4KowyMqHqeiOd46DhhdV9owhUyVY2jUqqdrVw3LFYQ7NBWxvKiy/av6ozy14zTut/9jAZNOEl5AT6qTWZNpu1i0qyF8aaTDw9gYG02HjuK3xBpCht2sE4Og923lsNTZmtwHAttle5X7F6PBSODpwv4yCjFnTO5aOb/npGxdVdg+iHI3oAwRWhAgdcUfkK5EcUJujzufPTqRInQZusYeR/qyci08aXRtRSGgSvYmMV0diFLykWj6hyRROzP5xDutulGgqRnxOhNXl5aFlWdwQyDtD7CV0ut0PVcIJvstZI5pVQbBb3+yYNCf77PTBrcCszdi6uncKSFfVKVWFxFWJs+OcnMmKpzPGioQcuvu9CGtQ+D+P8+toq+C2oWDGnl6uDTnfHNHwmw30k9GbXD28RFJJY/6Uhe9dK9N1ZB5va4c+HThiU9MVh4Mzu62kG6llixshvBfZw2zT2I54L261lUxNu71oOS/9ix13QSdyAqMKzxQ6bAAL6BZE7bVFj0Kg26b29ohiyy1cmjnrfx8C3lTDVfzGHWuZON5F+59AAjG92Rs+TP5vuFUXCI5PDFVbtWpAe1rCYkPn8pPdN3LKYDUmieu4MXJlWfwpUyWWwva4InZmwUWbC2pck294E5L8LqkHG2vEJKQyChC6e9arqvmmUoWI94K8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(44832011)(41300700001)(30864003)(5660300002)(450100002)(107886003)(26005)(478600001)(4326008)(6506007)(6666004)(66946007)(33716001)(38100700002)(82960400001)(86362001)(8936002)(316002)(2906002)(9686003)(53546011)(8676002)(83380400001)(6486002)(66556008)(6512007)(66476007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkgwWjNlZEFaRURaQUl0c0VRSEZCWlIyeDFBejRMVXdGem9YdmRHczVUZDFQ?=
 =?utf-8?B?cjVXZnVvSE5uaUxkdGxNekt3ejZ2bEp0aFVabmlOMDExeVZJZnpEa1JtVG9x?=
 =?utf-8?B?RTNPUG4xa0N1am15MHpPTjFrc1F3RmUzOVArcUZoL0JGNE1iS0JON3gvL3Zj?=
 =?utf-8?B?SmpwbWx6ZzZhMlBtaHM2cWxMYXdEaC9sOW9ZbzlMN0Vwb2F3TDlTUnFGMkZG?=
 =?utf-8?B?Y1p5WWNBMUxqUTRhd1hQcUYzUU9zN2czV1dndVdTWG0yNXhkSTQvU05MZW4x?=
 =?utf-8?B?bm5iU1ozc3FRZ2QydE4rSU10dzZ4dU80WXpsamhwc0U1RkppM3V6USt1ZU94?=
 =?utf-8?B?dUdpWTloU0paZXBhVWdvemY3bWxjempOOFRneEJtbG03S0Iyek1SalFoMlNG?=
 =?utf-8?B?Q0o2MWVLUTgwbXduejBoTU0zQnFVclQ4azZ3eXFUTDZkczlSNDA4clY1NFBG?=
 =?utf-8?B?c0N1OWE5K0gvZ2REbWhxSlpSdWF2dGx3NHZnZmFLS2Z1YmluYUlnK1hkb1hl?=
 =?utf-8?B?TnlSTUgvN0JpbVNuYm15TmduR3crQkRQTmZqbDNQNHZVVU9wM0J0dzl6OU1q?=
 =?utf-8?B?eHNFd1lIN0JoWm5PV1FBY21PTndVcFQwUjA3UUEvK2hmTlJlTUdzYUNMelND?=
 =?utf-8?B?ZGdnRXFGd2ptT1JSQURaNnB3bTZDbktrSHZEY2FvRXBPQjVJbjQxLzNVcmlD?=
 =?utf-8?B?ZU1tcS9wd1RtTmE4MnRqWit2NnFUM05Yb1NGRE9vSUNjOGR2TVh1QWllejFo?=
 =?utf-8?B?MHBkalIydXhQc3I2VHYxY0VhT0dISjdtcndnckVWbTNDcDV1bzdXdFEzSzIv?=
 =?utf-8?B?bzVBc3NuREZiZUJ1eUt3RWR3djEwYS9PVTlrMUtYR2tYc1ptY2xCRzVtbjJQ?=
 =?utf-8?B?UXRkdXFiK0QyOUVsRVROb0RYWVlFdWtUamRJbjBMeVhpaHZNVTliU0FkaFY4?=
 =?utf-8?B?cEZSZkFPemxYYkxWaDlxT2p3dm5wNGFsUFprSzBGZ1cycWpJdEpueHRiYWRu?=
 =?utf-8?B?UXpCZjl6K3NHUC9JajMzRDEvQWRpS0Jzc0ZpRkhmaGRRNmM3MzBTZFZWMDNH?=
 =?utf-8?B?eWsxMjV6NGlCc0wwRlhWS2xtSG40QnhtclZOcUFNbnl1Z0l4U24wcmUrZEJz?=
 =?utf-8?B?R3l6YlR5cGJNS3YyOTZoNXAxTzdQWlR4L3FKQWFoakg0T0hWUFFVbmhObEJ4?=
 =?utf-8?B?dVREVlVDMjlZSzVWQmI5WVliUVVTWW5iZnIwcFI5S09QMjBwSlVmRkNjcm8y?=
 =?utf-8?B?QjRSdUIrc0dJcGpsZjBPaFNLUTliMnBpbkxVc3RUZjJjTjRnbGZydUI2THRN?=
 =?utf-8?B?bDRtV2ZyV21jUU5iWjU4STFRVFhPRnhXb0UxaXRaT1YwNE5lZC8zTzNCWWhp?=
 =?utf-8?B?cU9mQVVBaHV5NWVtMXg1bytmMEZiZFBwelNudUk1SVFIU2VqZU1MZ3lEenU1?=
 =?utf-8?B?YVhsb2RKcGFva2VYUXZwdGV6M0oxNTI1RVNvYlJuWktIUFd3eW9VaGI2R3hs?=
 =?utf-8?B?eGJYdERlS29zQzIrNzk1a2ZjOXA4T3BVdEhhWlU5eVpmOEd4NW5Pbzl1K0NP?=
 =?utf-8?B?MVQySWM4NFJWRVBqTVE0OXNUbjlCRVZtMTB0d1RhY3c4K3JYdWl6ZTQyY1J1?=
 =?utf-8?B?NjlJZUY2bjY4TmRrN1NibHJmdEkvcWNIZ0VzY3lIaVB0WStOWHoyRHI4eHZp?=
 =?utf-8?B?YnI5Wi8yMlNiU0hVSXRwaUU3anVRc1FMQ1NFb3J1b2p1U0VtcHZsMXpMMks5?=
 =?utf-8?B?LzRIUkhRRUFzSE1rWWZ0aExSamwxQ21JNHBVWVF1L3RzSGp2bFBUMjUzT1gw?=
 =?utf-8?B?OFQ3SmFnbmlTaFIyZHhKRXdKaURhSjE4QmhYa2xCMVJaY2EwK3NGbkhZUDBt?=
 =?utf-8?B?Z1pWaktTcVlpdjNvNk5ZdFBmLzZDcGFSK1NobjZVZDliTWE3Ym1yWXhLTytu?=
 =?utf-8?B?ZDRhMjN1SVRGempmN2F3SThLdnBmNkFReXJhS0hzMU1DbjYvTW9qM2ZmM0E2?=
 =?utf-8?B?WlhoRW5Yd3d6a3puRmNJaU81azR3c0cvc0M5ZDJaRXFGdTNPQ2pGTFVzdlIx?=
 =?utf-8?B?YmFZdWJ0Vk5UOGxHODZneThoMlU3cmhRelhnTnVrbmNqc0l0L2MvdUF5c1Bj?=
 =?utf-8?B?S3ZZQzZmUTVaZmVBK1o5ejVhZzc0eFpKQ3ExeDRvTEZWTlNobFkxZlR6empp?=
 =?utf-8?Q?0/Osn4vlapRfJ8ZRJJOguTMwFuCAn2VwAvjUJtPuGy/f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c94cee4b-2d1e-47dd-b9ec-08dab0614fb1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 17:02:02.2803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+Ia+bGtoRgdQvy5+8eOTNexR6FEJbnaVPc2njrumWIc0KA5KEIzoOWUwGJ3SlolhAUHBuodqK04jXadwc66L2nSvVodeP4axSv9W5tNJSRtUi5/mu4PrlmLsn41ZpaE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.10.2022 16:02, Matt Roper wrote:
> MTL's graphics IP (Xe_LPG) once again changes the multicast register
> types and steering details.  Key changes from past platforms:
>  * The number of instances of some MCR types (NODE, OAAL2, and GAM) vary
>    according to the MTL subplatform and cannot be read from fuse
>    registers.  However steering to instance #0 will always provided a
>    non-terminated value, so we can lump these all into a single
>    "instance0" table.
>  * The MCR steering register (and its bitfields) has changed.
> 
> Unlike past platforms, we will be explicitly steering all types of MCR
> accesses, including those for "SLICE" and "DSS" ranges; we no longer
> rely on implicit steering.  On previous platforms, various
> hardware/firmware agents that needed to access registers typically had
> their own steering control registers, allowing them to perform multicast
> steering without clobbering the CPU/kernel steering.  Starting with MTL,
> more of these agents now share a single steering register (0xFD4) and it
> is no longer safe for us to assume that the value will remain unchanged
> from how we initialized it during startup.  There is also a slight
> chance of race conditions between the driver and a hardware/firmware
> agent, so the hardware provides a semaphore register that can be used to
> coordinate access to the steering register.  Support for the semaphore
> register will be introduced in a future patch.
> 
> v2:
>  - Use Xe_LPG terminology instead of "MTL 3D" since it's the IP version
>    we're matching on now rather than the platform.
>  - Don't combine l3bank and mslice masks into a union.  It's not related
>    to the other changes here and we might still need both of them on
>    some future platform.
>  - Separate debug dumping of steering settings to a separate helper
>    function.  (Tvrtko)
>  - Update debug dumping to include DSS ranges (and future-proof it so
>    that any new ranges added on future platforms will also be dumped).
>  - Restore MULTICAST bit at the end of rw_with_mcr_steering_fw() if we
>    cleared it.  Also force the MULTICAST bit to true at the beginning of
>    multicast writes just to be safe.  (Bala)
> 
> Bspec: 67788, 67112
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 135 +++++++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |   5 +
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |   1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  33 ++++-
>  drivers/gpu/drm/i915/i915_pci.c             |   1 +
>  5 files changed, 154 insertions(+), 21 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 349074bf365f..23a1ef9659bf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -41,6 +41,7 @@ static const char * const intel_steering_types[] = {
>  	"MSLICE",
>  	"LNCF",
>  	"GAM",
> +	"DSS",
>  	"INSTANCE 0",
>  };
>  
> @@ -99,9 +100,40 @@ static const struct intel_mmio_range pvc_instance0_steering_table[] = {
>  	{},
>  };
>  
> +static const struct intel_mmio_range xelpg_instance0_steering_table[] = {
> +	{ 0x000B00, 0x000BFF },         /* SQIDI */
> +	{ 0x001000, 0x001FFF },         /* SQIDI */
> +	{ 0x004000, 0x0048FF },         /* GAM */
> +	{ 0x008700, 0x0087FF },         /* SQIDI */
> +	{ 0x00B000, 0x00B0FF },         /* NODE */
> +	{ 0x00C800, 0x00CFFF },         /* GAM */
> +	{ 0x00D880, 0x00D8FF },         /* NODE */
> +	{ 0x00DD00, 0x00DDFF },         /* OAAL2 */
> +	{},
> +};
> +
> +static const struct intel_mmio_range xelpg_l3bank_steering_table[] = {
> +	{ 0x00B100, 0x00B3FF },
> +	{},
> +};
> +
> +/* DSS steering is used for SLICE ranges as well */
> +static const struct intel_mmio_range xelpg_dss_steering_table[] = {
> +	{ 0x005200, 0x0052FF },		/* SLICE */
> +	{ 0x005500, 0x007FFF },		/* SLICE */
> +	{ 0x008140, 0x00815F },		/* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> +	{ 0x0094D0, 0x00955F },		/* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> +	{ 0x009680, 0x0096FF },		/* DSS */
> +	{ 0x00D800, 0x00D87F },		/* SLICE */
> +	{ 0x00DC00, 0x00DCFF },		/* SLICE */
> +	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
> +};
> +
>  void intel_gt_mcr_init(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> +	unsigned long fuse;
> +	int i;
>  
>  	/*
>  	 * An mslice is unavailable only if both the meml3 for the slice is
> @@ -119,7 +151,22 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>  			drm_warn(&i915->drm, "mslice mask all zero!\n");
>  	}
>  
> -	if (IS_PONTEVECCHIO(i915)) {
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
> +	    gt->type == GT_PRIMARY) {
> +		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
> +				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
> +
> +		/*
> +		 * Despite the register field being named "exclude mask" the
> +		 * bits actually represent enabled banks (two banks per bit).
> +		 */
> +		for_each_set_bit(i, &fuse, 3)
> +			gt->info.l3bank_mask |= 0x3 << 2 * i;
> +
> +		gt->steering_table[INSTANCE0] = xelpg_instance0_steering_table;
> +		gt->steering_table[L3BANK] = xelpg_l3bank_steering_table;
> +		gt->steering_table[DSS] = xelpg_dss_steering_table;
> +	} else if (IS_PONTEVECCHIO(i915)) {
>  		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
>  	} else if (IS_DG2(i915)) {
>  		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> @@ -184,7 +231,19 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  
>  	lockdep_assert_held(&uncore->lock);
>  
> -	if (GRAPHICS_VER(uncore->i915) >= 11) {
> +	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
> +		/*
> +		 * Always leave the hardware in multicast mode when doing reads
> +		 * (see comment about Wa_22013088509 below) and only change it
> +		 * to unicast mode when doing writes of a specific instance.
> +		 *
> +		 * No need to save old steering reg value.
> +		 */
> +		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
> +				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
> +				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
> +				      (rw_flag == FW_REG_READ) ? GEN11_MCR_MULTICAST : 0);
> +	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
>  		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
>  		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
>  
> @@ -202,26 +261,40 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  		 */
>  		if (rw_flag == FW_REG_WRITE)
>  			mcr_mask |= GEN11_MCR_MULTICAST;
> +
> +		mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> +		old_mcr = mcr;
> +
> +		mcr &= ~mcr_mask;
> +		mcr |= mcr_ss;
> +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
>  	} else {
>  		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
>  		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
> -	}
>  
> -	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> +		mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> +		old_mcr = mcr;
>  
> -	mcr &= ~mcr_mask;
> -	mcr |= mcr_ss;
> -	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> +		mcr &= ~mcr_mask;
> +		mcr |= mcr_ss;
> +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> +	}
>  
>  	if (rw_flag == FW_REG_READ)
>  		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
>  	else
>  		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
>  
> -	mcr &= ~mcr_mask;
> -	mcr |= old_mcr & mcr_mask;
> -
> -	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> +	/*
> +	 * For pre-MTL platforms, we need to restore the old value of the
> +	 * steering control register to ensure that implicit steering continues
> +	 * to behave as expected.  For MTL and beyond, we need only reinstate
> +	 * the 'multicast' bit (and only if we did a write that cleared it).
> +	 */
> +	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70) && rw_flag == FW_REG_WRITE)
> +		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
> +	else if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 70))
> +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, old_mcr);
>  
>  	return val;
>  }
> @@ -296,6 +369,13 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 val
>  void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>  				  i915_mcr_reg_t reg, u32 value)
>  {
> +	/*
> +	 * Ensure we have multicast behavior, just in case some non-i915 agent
> +	 * left the hardware in unicast mode.
> +	 */
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
> +
>  	intel_uncore_write(gt->uncore, mcr_reg_cast(reg), value);
>  }
>  
> @@ -312,6 +392,13 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>   */
>  void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value)
>  {
> +	/*
> +	 * Ensure we have multicast behavior, just in case some non-i915 agent
> +	 * left the hardware in unicast mode.
> +	 */
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
> +
>  	intel_uncore_write_fw(gt->uncore, mcr_reg_cast(reg), value);
>  }
>  
> @@ -389,6 +476,8 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>  				       enum intel_steering_type type,
>  				       u8 *group, u8 *instance)
>  {
> +	u32 dss;
> +
>  	switch (type) {
>  	case L3BANK:
>  		*group = 0;		/* unused */
> @@ -412,6 +501,11 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>  		*group = IS_DG2(gt->i915) ? 1 : 0;
>  		*instance = 0;
>  		break;
> +	case DSS:
> +		dss = intel_sseu_find_first_xehp_dss(&gt->info.sseu, 0, 0);
> +		*group = dss / GEN_DSS_PER_GSLICE;
> +		*instance = dss % GEN_DSS_PER_GSLICE;
> +		break;
>  	case INSTANCE0:
>  		/*
>  		 * There are a lot of MCR types for which instance (0, 0)
> @@ -544,11 +638,20 @@ static void report_steering_type(struct drm_printer *p,
>  void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
>  				  bool dump_table)
>  {
> -	drm_printf(p, "Default steering: group=0x%x, instance=0x%x\n",
> -		   gt->default_steering.groupid,
> -		   gt->default_steering.instanceid);
> -
> -	if (IS_PONTEVECCHIO(gt->i915)) {
> +	/*
> +	 * Starting with MTL we no longer have default steering;
> +	 * all ranges are explicitly steered.
> +	 */
> +	if (GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70))
> +		drm_printf(p, "Default steering: group=0x%x, instance=0x%x\n",
> +			   gt->default_steering.groupid,
> +			   gt->default_steering.instanceid);
> +
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70)) {
> +		for (int i = 0; i < NUM_STEERING_TYPES; i++)
> +			if (gt->steering_table[i])
> +				report_steering_type(p, gt, i, dump_table);
> +	} else if (IS_PONTEVECCHIO(gt->i915)) {
>  		report_steering_type(p, gt, INSTANCE0, dump_table);
>  	} else if (HAS_MSLICE_STEERING(gt->i915)) {
>  		report_steering_type(p, gt, MSLICE, dump_table);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 754c27dd1e82..810283131f0a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -59,6 +59,7 @@
>  #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
>  
>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> +#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
>  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
>  #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> @@ -71,6 +72,8 @@
>  #define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
>  #define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
>  #define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
> +#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> +#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
>  #define IPEIR_I965				_MMIO(0x2064)
>  #define IPEHR_I965				_MMIO(0x2068)
> @@ -531,6 +534,8 @@
>  #define   GEN6_MBCTL_BOOT_FETCH_MECH		(1 << 0)
>  
>  /* Fuse readout registers for GT */
> +#define XEHP_FUSE4				_MMIO(0x9114)
> +#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  #define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
>  #define   GEN10_L3BANK_PAIR_COUNT		4
>  #define   GEN10_L3BANK_MASK			0x0F
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 30003d68fd51..0bb73d110a84 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -60,6 +60,7 @@ enum intel_steering_type {
>  	MSLICE,
>  	LNCF,
>  	GAM,
> +	DSS,
>  
>  	/*
>  	 * On some platforms there are multiple types of MCR registers that
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index dadb60e6a58f..711a31935857 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1128,18 +1128,23 @@ static void __set_mcr_steering(struct i915_wa_list *wal,
>  	wa_write_clr_set(wal, steering_reg, mcr_mask, mcr);
>  }
>  
> -static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
> -			 unsigned int slice, unsigned int subslice)
> +static void debug_dump_steering(struct intel_gt *gt)
>  {
>  	struct drm_printer p = drm_debug_printer("MCR Steering:");
>  
> +	if (drm_debug_enabled(DRM_UT_DRIVER))
> +		intel_gt_mcr_report_steering(&p, gt, false);
> +}
> +
> +static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
> +			 unsigned int slice, unsigned int subslice)
> +{
>  	__set_mcr_steering(wal, GEN8_MCR_SELECTOR, slice, subslice);
>  
>  	gt->default_steering.groupid = slice;
>  	gt->default_steering.instanceid = subslice;
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> -		intel_gt_mcr_report_steering(&p, gt, false);
> +	debug_dump_steering(gt);
>  }
>  
>  static void
> @@ -1581,12 +1586,30 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  }
>  
> +static void
> +xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	/* FIXME: Actual workarounds will be added in future patch(es) */
> +
> +	/*
> +	 * Unlike older platforms, we no longer setup implicit steering here;
> +	 * all MCR accesses are explicitly steered.
> +	 */
> +	debug_dump_steering(gt);
> +}
> +
>  static void
>  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  
> -	if (IS_PONTEVECCHIO(i915))
> +	/* FIXME: Media GT handling will be added in an upcoming patch */
> +	if (gt->type == GT_MEDIA)
> +		return;
> +
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		xelpg_gt_workarounds_init(gt, wal);
> +	else if (IS_PONTEVECCHIO(i915))
>  		pvc_gt_workarounds_init(gt, wal);
>  	else if (IS_DG2(i915))
>  		dg2_gt_workarounds_init(gt, wal);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 40bb06c5cdc0..496df0f547f4 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
>  	.extra_gt_list = xelpmp_extra_gt,
>  	.has_flat_ccs = 0,
>  	.has_gmd_id = 1,
> +	.has_mslice_steering = 0,
>  	.has_snoop = 1,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>  	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> -- 
> 2.37.3
> 
