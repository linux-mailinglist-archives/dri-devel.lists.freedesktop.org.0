Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5DB6013DB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16E10E074;
	Mon, 17 Oct 2022 16:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2675710E716;
 Mon, 17 Oct 2022 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025370; x=1697561370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ALkVM7qMirB9+oM4n1Fgs2ZQIAPG+SLjaj1GtuMbJDw=;
 b=jh610NgdbN0la+9ZshL668OPK7EKxWI3x5j66+F1li2/ItK1w5uRg/JE
 O39NHFmZ6l5ykwmdgrXtKS5yPk3B3sdZUpl1CIVCdgApCb15ILFwdwMYF
 PFqmO6/m0I494EC/p60EtKvCdQmo9rw3FLTyjJWTd6kPiUjwLyLAoIs6e
 gWz5Lj+jcvJwTRlfSv8m04C54PFjaP9dZ+WCb6cm39dl8Oc+d96E0Brhf
 cu0ZwmgOJ4W3+F68OfSSiRr7IZmg1JfbHxjdMMUzRpFYxgrR1Gpar95FW
 f5/ehH0hrbgOEjJn8fODnHCKhRN0KLrzfbtJ0QFLhr32/d32SYkVAryd3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286247217"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="286247217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="630758479"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="630758479"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 09:49:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:49:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:49:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM+pNoQ4URkwhf5GB5P8slTWrcTBmL7MLb79N52cQpEZBoAlav7u35zJjFBjeEWuto1y2r/Fexm09HYgOT8kTUzHoG1iph8wbA529eF5zfHePbhNTBJIvSi39AJYnAjGzPosJK5HD/dyGudIopAR3IAb+2lLHBgLj+0pz3uczXOCqNz9ITWsyZ5udr9BF+wHlNDIcggffzcPV2YP2WJNKre8SeGyTYGDEIdMXV3nG7grKheh4sREwZMaTmBHfJW6Stl79okiCYl2P+coEHaTFyaIEFenEAChqACEtCmEpG1C+e6oerZTVwfDqCT+mrx/EeYHUl3IweoelI4slkSWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n40HSM1NxnAWhsX2cSMOZpULxjZ3AcgUGvVAPzb309U=;
 b=Ys0wO6H7iQ+w20zhCLmUUwn/v1CgQV+4p7L0CO1qodiQwaQHqgqFmUFwaiaLxzTi+i5xVZcWt7VM9bl0GoXRVSxQg2DlCXuVDgTRbmtS0GjXVapP0Q24RtWOR8bedOblQVsQBQYNl53P9WL1Vc3Ym2S8Ld/hpIJMXuVlFhyF8hLgKj8ZyVMfYLLfSd5adtVNn1PlFR00pxwBEl6weBbGCZI/lJh3BuonSdAAoT2BOWjSR/MJDjCVXFt/9Tjmp6dLOXJj9lNzjGeGdvnp73tXz697P/WtJZFB5YNLjMM+jXKQ1KtHfwTFzvnwJQ9GEjNfzRX/UbxiCTZC5XW6umzwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Mon, 17 Oct 2022 16:49:22 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:49:22 +0000
Date: Mon, 17 Oct 2022 22:19:13 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 01/14] drm/i915/gen8: Create separate reg definitions
 for new MCR registers
Message-ID: <Y02HiQFlMgzWgnqs@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BM1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::13) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 537b9d8f-1b64-4269-16af-08dab05f8ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PbhrogQB84DNk3MQEyxwMzr3V6Df+lc5IZ76f1oLkKz8Bee9GlX8pGOopJC9pCCxDr6YdjZmthwkLXW/EpEwGOeE0gkWDIqOWT5COlqBvg/YlWOrQIywGU7MbkA7pjfetih1ONN5G5J1bCNc3S6d0d4eaR+D/XOaHVpee8aVOk6kIWTRdn7BFtsIbeTiP4ZOmTJaLYwk/79IDEqW7gVJborGrnTEBsb7ZyUXsal9xQMCjetkRLWz4eolLApdmsWq70lEkm+Kkd1/f50YBROF3m3eHrk81M6bR9y9JGpGPi7D8HAcientaYaWKUCTQUW/L+C2m5l7MpgLQdcUuv/cfZh0UblU0SpyrzewEu6awOEmBZA5R9Fzp6zpyChDBZLnAN8JYsdioEN6ZBocNEoNqrbnOUvXwIdnLL9PKF/xKTjMrQ2kqJS+CJDob4TBW0XeAQy5MC35pkHZ5IXoGgBUGFkewF+UQHdI1XDQF3DsWja/4fR1kjwN3n8Hm6vRewiyfphr/X/XbCKLOB0FRWCeQwufbSUubVR8iI+I4nekteGcHtpYanEmbGDREjy5lQe5U3kxnqJIvhFT7K3XrPNB5TN5PF8YkCV2qUTNWMmnk0vO+SSSBd1ESVn1lue13AzG0B3L52wqP1fjlCOtptSIPvjaqMmZsbrYyKSjVUiL7liE0bjlCsaVQE7LZ50guaKXticJ4Xsk3eW52cnFmeKtUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(9686003)(6666004)(6512007)(26005)(53546011)(6506007)(186003)(83380400001)(5660300002)(44832011)(2906002)(478600001)(41300700001)(66556008)(66476007)(4326008)(450100002)(66946007)(8936002)(33716001)(8676002)(6486002)(316002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJMVXdxRTRwMFlhRWQ4Rkd1TUlKbzVRYzl5cmloUGVsdEc1MWV6YnRscE1v?=
 =?utf-8?B?dWNPaGJKUjNuSTF3eGljc0Rqd24vMzRsa1FVckIrcFdSUXBQNHFkdm85SjV3?=
 =?utf-8?B?RjM5eDBTUC8zcERhajZRYkR3VklPNkhmbnFqWTNtWHBvQUMzWXByV1Budkpa?=
 =?utf-8?B?eWxpQ3lKS3lrM0NMdjQ0eEVvcGl6cmZtN2drYmNvT25vVzVwMXUwcmZRZTkx?=
 =?utf-8?B?ZUJoRGpkSGVBUHpQclpyenlwd3FtOW9tR21rMVcwS0pCRTI5bnhYYjUvQWpI?=
 =?utf-8?B?Wmt3aG5aVlJTT1RKOWtSNURRN05TY0pWSUh1T09xNW5mTUg0UUpUUVc2QjZ3?=
 =?utf-8?B?dGdPeGd6VlNQZUI4UUZneHNmY28yNlRpSXNTMEdQZDlXaC9CSVNSNHlmNmJK?=
 =?utf-8?B?eEFvYzM1R0hycGFUU3dHZjBScE10b2R5THc5WUFLOHpRUjBYNndjSXZlQkov?=
 =?utf-8?B?MmRNeU5NNGw1R1JsVkdOYmtuTVNuSUlYUEdqVGxFb25yM0xTQ1MvSk9lVmZW?=
 =?utf-8?B?bW90Z1VheE8zTWg3VGxMdldlTExwSWlZRHdSTXJhMGk4cUZDTklWZ1FXTVd0?=
 =?utf-8?B?clNaNG1HVytGM2VOaEJVRVhKbWVxdnYrNkZnVnQ4YXRFeXZFT2twYjJTeUlp?=
 =?utf-8?B?YmRnRWZObXppYkYzcjQ0cW90eEVFRHNwMlMrcm1uU1I1Z2hoOVBSU0V4OGdE?=
 =?utf-8?B?VlVSL1NuUWxrajBxTnl0d09ibFN0NW9TSUEzbTlZK3U3eGJNRDcwVzlxQi9Z?=
 =?utf-8?B?TlRieXcrNUZDbnV2R0o5eE9RUG1mQWE4SnhLSDdNM0UvOWRyUU51RldIcVZY?=
 =?utf-8?B?bExLdnF0RWlYclN1M0VTWHI3d0JlV3ZmV3AzbHQrOTdGUFRRODBWWTFUWFpG?=
 =?utf-8?B?anNqdUNHdkVrenptWldpcW01OVdzMWFKeGpCcG5LNVhSWmZxOTlqdXMvQ3FD?=
 =?utf-8?B?NVY2amliZ2JhL1FjWTFRUnFqMmVRZ1hYc1hKNytpZjR5dXlRMmdtZXZpa1l5?=
 =?utf-8?B?QXJoVFBtenRCa0QxWlhCN3d4WE5obTdib2dDcUVpeVVJaXRKdzBWdG5nM2Q3?=
 =?utf-8?B?VTdOekZOdWJJTUorSmJvQm5IczA4cnE5elZDSUx5ekM0UVhTay8vZnJhQUpQ?=
 =?utf-8?B?OFEydFJHamtnTG4yaUxjR25LMjN6Y2xjcVRYbGJiVUdpbjF5NXI1QWt3ampn?=
 =?utf-8?B?bDY4RlRiV1VnazVDOTloSllNZXFvYm1RcE9FcTRRdFdrME0zRHJnc2hJNWU4?=
 =?utf-8?B?alIxUlFQMjQ5VWVZMko4TDNiR0k2dHRkY0gxbFcyUTNRU2pVZXozRUlxbDNz?=
 =?utf-8?B?bU9zVU1wVzBLQ1prM3IzVC9ISHFWa1d1dmpvREo5NXJsK0JZRVl1TFZXS29v?=
 =?utf-8?B?U3FCQ3lRNWtDdzhGOVJ1cXhoNWNvbkE3YlcrUXZXREE0NDNUaklLR3ZRY0ov?=
 =?utf-8?B?K3Z4aHo3Wlh5R0pWVXFsc29maHhFWVBMSC9PQlRJRzR0NSthYWFWenBOQW0z?=
 =?utf-8?B?amZUdjhzbitLejNHbWxzZ2FzVXMwNjVqc1NSR0pUbitVdWxKVXQzMEU4ZU5s?=
 =?utf-8?B?VU8wYkc0Q2NKaFg3aEpGMzIwT0NFQnVacUVmKytsdFFiWmJIZEZSdk1BUEtk?=
 =?utf-8?B?cXBIYU5vY2hyZm1GWDlyUVAyTzVydlMyUHN2dnlQN3FHNmNWVEdya0QrODJW?=
 =?utf-8?B?QTZQaEx1UGZxaGt5ZUFhMS9QTFVKQ3pDNGQxWHVkZXdVQ0RoUUNwTDVVazI0?=
 =?utf-8?B?dTRWajZPc3JOcVN0ckROVFAwOGQ5M3JzTmlxMUQzdkxVdkprZlhMcmJndkl5?=
 =?utf-8?B?TVRSVDJ5cWhPNnVhOHpDSEdldmNmZGRpTTF5YjFZSGtBaHN4ZDRnekxidURv?=
 =?utf-8?B?enZTa0hkL1hEdWtJWElJNm9FSDhHVHN2R1l0Y2cwdStpdlJIUDlLQnFGYTky?=
 =?utf-8?B?S0JhTUcwaGJtUncxYlk5RVViYkpMUXhGbXNrSzA1emRWakVSNXA5ME12ZEFw?=
 =?utf-8?B?WVI2S2tBcGwrQmtGVnhaTEw0S0tvNkRCUXhFbmMvSTFnR2dTcnhUL2hKb2Q5?=
 =?utf-8?B?WURySFhzZkw0MHBEMTI1RW1KSWhCcTlVOHEzZnlzaThuZzNPQWo5UzRUYWVC?=
 =?utf-8?B?dXM5V0t2QW8zbDNHdmVpeUJMOFErcEt5ZjR2M2NDSGJHVVVzamhXTk5FVWNw?=
 =?utf-8?Q?akkS9waPj8efY6BLPA6+sLk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 537b9d8f-1b64-4269-16af-08dab05f8ac9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:49:22.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+qtLrB7+a+MDftON4UE9aVVdpZYPD+tWy03SLqwhfcf8NaqCgSl8VduUReU8lPLEgMCluMSE2tbPMzmjwwoI/RVNIAnI73RDQYNGJpz4lC+YdqFkMNRzUETwn4gIj5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

On 14.10.2022 16:02, Matt Roper wrote:
> Gen8 was the first time our hardware had multicast registers (or at
> least the first time the multicast nature was exposed and MMIO accesses
> could be steered).  There are some registers that transitioned from
> singleton behavior to multicast during the gen7 -> gen8 transition;
> let's duplicate the register definitions for those registers in
> preparation for upcoming patches that will handle MCR registers in a
> special manner.
> 
> The registers adjusted are:
>  * MISCCPCTL
>  * SAMPLER_INSTDONE
>  * ROW_INSTDONE
>  * ROW_CHICKEN2
>  * HALF_SLICE_CHICKEN1
>  * HALF_SLICE_CHICKEN3
> 
> v2:
>  - Use the gen8 version of HALF_SLICE_CHICKEN3 in GVT's gen9 engine MMIO
>    list.  (Bala)
>  - Update to the gen8 version of MISCCPCTL in a couple new workarounds
>    that were recently added for DG2/PVC.  (Bala)
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 11 +++++++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 26 +++++++++----------
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.c       |  2 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
>  drivers/gpu/drm/i915/intel_pm.c               |  9 ++++---
>  9 files changed, 36 insertions(+), 26 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
