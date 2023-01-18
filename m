Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23C672583
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 18:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCA910E7CB;
	Wed, 18 Jan 2023 17:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5380410E7CB;
 Wed, 18 Jan 2023 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674064279; x=1705600279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FPVqM8W+GFV80oaQ45zpGxDDd2NVs0Q32xmsIl9wY18=;
 b=Ai/F4GTxZreJBLe8x9sYADFFkmp/Y7gXBDTDU2Uhcqsj8EQIqRKFFoWI
 2skNeSJruDnem4mAFvLz4M34h3YvzddX8kaF3zjtwFulcc4mc4XhMHJzA
 CURStFqtDShCZ+JfOlVaHCtG0SeOdh6RtSxV6mph6ZxTmnYlDOCnchGbD
 1ICtrD87NY9p3K4PW9qtlN7KoxHzu/3QDlP9ZpaWEcdZY6rwJBUIsgOnY
 8gP32MjIRwDaJUBoh1VXTQ8ZWn0xR8Q+O8zASzC/S1OdGPubW1KxpJTH4
 H0jl0jrMc9dGAMwu6DkQKJ+S4DsS8UdTsEu3eB9IdZJ3SoVi2i2QPfwfK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305427261"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="305427261"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 09:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728304889"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="728304889"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 09:51:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 09:51:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 09:51:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 09:51:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG19KQRr3mr+9mNV9JFzeO8i5dwdgJQQP+5Yw+XxBUxKAyfPHdovQmzs8qDo91yrP8zjOSoMEfauyEnfYxdpt9sdSpZVyQ9Ref1hQ0Gk0aIJTE4OrbIfT79BBs1ltX6i14A/dPJuGuJaX29LMmBxaDv+wdVlXlecKibx8WyesZ6dJZa0D1FQpd4wNYHcsKV76mN/5cppYI8aJcPs5b5KJZ6iifHMzChZeNwp5TiHve8wkQwzetAsWbPxTHMXm2xQZvXjeWC7Fo163NuYMiSeJziPDMzJ8Q2j02d/VBT4eToKzeYu5kD9cp2UVisJR5JHSSPVonZ2urdDYjY6eYpUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4mWq9Hh7D6+dXIeOYgZQxkJqjPUVhJQzuZnH7NYVew=;
 b=LJQXlq2m3N/yVYt2I2JQ7LdQp1PYKGtzPqYeNKmFi/mn0BjXHo9iF60pYyoN5yFD1mRt07XFZ9q2nqmfIPU3KkAYjRsWA1YZ/nlSPJt6AKQAEzFC9sN7cjPwXPgWo1d10Du1a1juwoBGXMu2cfuqOyTmx0jMnUX/gofZ0/IKIJfXXCa/nrHYJYQcEf9NBKOHROf6lyn1e32AgZMimuBoPT1lJnTW6w1Oc+a2P6f80/al1TkGrLXM/qWVmzr3dUkD2TiSi4u/3tvTWZ58VrLqGrDXeMmLeeJfw+ORkrdVtBHMmPT8wHd1m6NAiN0MprDWaT1lT6nhZ8/uYCIov+1oEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 17:51:16 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 17:51:16 +0000
Message-ID: <52edffe9-6fe6-ffa6-202a-4126390e6b61@intel.com>
Date: Wed, 18 Jan 2023 09:51:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/9] drm/i915/pxp: Add MTL PXP GSC-CS back-end skeleton
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-2-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA2PR11MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae2da65-1c7e-457c-dfb9-08daf97c987a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjC9y/aFByTVA94wsy0WYg38vTZYocaaW9oZBedhIycWMc1bu2xfTfYOq1X2wpiFYcji8PTDj5R/9zJj6VX0N0zpsycXMv/v2YmVg2sIhnexiG7e7HzTMf28fbAcH6FtJBZU6IiZPrI/jYQ4uBkgmce8lRY1KThsEeeKB/BSmkCjOQlGN5XIckcSdl1T3vTgG6NkkHGvQPWgyqmxU0Q7hPbirMMwvgiosP0nNu8Hk5N9z1zZhMgX2NEc812oCv6n1IB+u8gRAXundGDHTYI3Mxdw0IJ3g47BYgrFAmg8gQLc7bL5Z/gvsHIOCvMmDLB5rTleMlQMmZlyWmWDtnYnczoC8xCKNT/ZRFzkN5Wryv4pHvUrZj9K0FVRbDm/eLlH3VXZgfTpXGxD0T5TClpIRC3+r2b7wJiejXLyJKv55O1cE7/XVE77d2s/2alJ94CZ9CZn2mbyAeOcOXgRRNWYAXVLCgfol6yzGfLQBoe46BZ1yIO39tgZ1BV4oltsKH6W8MNWOGIKt98QQBu+KbbPRv/1gyKIg5IYeWvzEhktbugtcMsLAR2WycIhONaixUt33f3vREi5mpsDbQQdEivQGBBziuMj+9wJ/qUO0BT+jSR4fKsbVN/PybFRwna2GOhgSzlv/Qio6X6KZeIGrAQww94o5bdpjGx3WPfeubD4pXDbm+fj2y8gBrxx0zOWQQ003xBl1aL5lgWJFmn5IZbApSZQzTJk2SJUWC3s+wyy4i4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199015)(66946007)(38100700002)(31696002)(82960400001)(66556008)(2906002)(8936002)(5660300002)(66476007)(8676002)(4326008)(41300700001)(2616005)(83380400001)(186003)(6512007)(26005)(53546011)(316002)(6666004)(6486002)(478600001)(36756003)(6506007)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VCbE5hTGJHcklFbytWT3hOVWdzY2doaVRmUExSVVIvVWNqV0NpeC9IL05v?=
 =?utf-8?B?SVdxdk01WkdZV0ZYMjFXYjF2eWovUGVKZ0lVTk1MeVdvTGNYLzNzUmFRd3hh?=
 =?utf-8?B?UWltMXNySkVUVWtkaE1MZTVIVzFMNXFWWDNsamhheTVVL0V0bWlUSFMyNEtq?=
 =?utf-8?B?dXczRWVQZkhWS29GTkZ1SlpzT0ZObzZqeWdVTk9MeDFhVi80S1hJekFTN0dK?=
 =?utf-8?B?NzYzYjRpWEd6bXBIVzlXRytBRm9HOGxRRVdJb2ZrN1hNUXJNYWtnZ200T2cr?=
 =?utf-8?B?bjZmTFNCU2RHMDVHQ3hCUTgzT0REcXo5cy93eTdFclgrSHRZdTR1c3p3dWJQ?=
 =?utf-8?B?N3BiRXF6OWZuY0FNT2lFbmlDTkZZcnBDYXpZSmhNY0V5b28zMXhsVmUzMXNU?=
 =?utf-8?B?bE9sYlp4N3lKUWhDUWtUVDhjRVVydExIdk9BSXZJMndqeDFQSmRHZWNaV0Jq?=
 =?utf-8?B?M2QyZXFhaFd3MWk2dTRuTE9tbHliQUVJdWJkOWUrdk9hUnhyN2d1STFzdFdz?=
 =?utf-8?B?TWc5UDE4anRaQW0rdmxLNDF1RDhKem05KzBmS3ZEQ1NycEg3NTQxeThQc1Nm?=
 =?utf-8?B?aFRXc01hQXp1S3czWVFNM29kVGFFditoYkRGaHBlaXJUYVZDQXhNd2Z3ejR2?=
 =?utf-8?B?bE5QTmFaOER2RWFuR0RTYlNoSmN6cGQyVTFXbkEzNWF0Wm9EbXZIZ1hscmtz?=
 =?utf-8?B?ZzMvTTF4MktKWnAvdDNJR1pnVXEraTk5VFVPR0pMVlJoQVUyZ0pUcUFWTjZk?=
 =?utf-8?B?SjN6alFaVzh2V2NUaEl6YVdPWXdZRUI2S0VYejNNQ0VZSlFrTkhrWUExYzVw?=
 =?utf-8?B?eGdLdkJKR2g0ZnI5eXNEZ0FNdENiSDhtL21ueTh6RVBWaE9kSGJNTEFuNlZu?=
 =?utf-8?B?c3NJTjV5KzB2MWFPSitKSkU5VEpvNDBqZUVXQVZMZWYrTUFDQUl2L2Z2bEpl?=
 =?utf-8?B?UWVraWVuYWdZOVc5TEV4YVRMeW4rUWUybWtEUDhOTkM5NGxWRnAwZ2I3UUZ2?=
 =?utf-8?B?WnZ1aHJOMU5CbHltOC9uaVFqY2d6UzBpdndGRU4xTXBoSlVvOWhmRjVoRHRi?=
 =?utf-8?B?a2tXUW5qZHhrY2FhVDZUTVNJNFErWEg2am5CaUVQVjdJZmx4QkxYR0x3NGtT?=
 =?utf-8?B?MDVaa0F4TEcxRSszTGFGZlh4QjNJeW9BcGRZc3FZdmtvSVNaYlQrZXdrUG5u?=
 =?utf-8?B?ZmZZZjVjcEdicE9kQ0Ivc0Y4YUQ4KzFaUDVOUDMzalBhbFY2REk3dnZ4SUZ4?=
 =?utf-8?B?UkF5QnREcVVrc1JLQ0NJMXcxdVg1aGpqN1JpSnh2WlBiWURERGtkL0lyK1FU?=
 =?utf-8?B?WmZJWVpnSWNBZU9vVERyd3ozVnAyNTMrTHdWV0U4UFkxTTl0em14RWZXbzR5?=
 =?utf-8?B?ellDYUUwVmlnSm5EdUIwUi9kQ0tZRVJRUzdKZHNOMW9WdE91ZDZZcEdIZ0dS?=
 =?utf-8?B?cWlBZE1mUjJrdW81VXNxL3FHNXluVGJ2VFg3SzBCekZwZUdnbjBzTzRmd0ph?=
 =?utf-8?B?TzJ1cFRwRnhaSTIxQlIxb1didzhYbnZzaEo3SE5HTjlZNVBRVFBjVnBtQUNY?=
 =?utf-8?B?OHhDcllhdk1HQjJYc2thdUR4MmFnYm1BU0U0SG9PLzdqbVZuRnhDd0xIUEUw?=
 =?utf-8?B?ZU1XUnN0dXpHQTdyeGhidE5pZXEzSjNnOXMrcGNsbFBmTitOYUNTd1I3a2hB?=
 =?utf-8?B?TkthSVViR0RPMDE3emQrWlo0MHpYbk1pZktaTXJLUko4N2lNMUhreXExSmtz?=
 =?utf-8?B?ZS9tQysxYjM1dW1YVVVTazZtdkxwY2VoYi9pZkw0UjBiU0hrV2Z3S3d1VExS?=
 =?utf-8?B?Y1RCMndQaWxJK3J2UXV5NGVSdm9FbG1xd0xnai9HMG41dlIxZVBzT2tiN2gr?=
 =?utf-8?B?RnJUUkt2UzcyKzRWTHV6Z3pOZFNWSGM2UHIyUWpsMUY2b09uTEFJRjIvQW02?=
 =?utf-8?B?RVl1Sm1lZkJmb3JvWlk4SzNPMVVPWWZGdytaREJtM1BlbmVmMUlZbUFiSEFS?=
 =?utf-8?B?Sll5cEhRM09nY29BQVpjZklCRVN6TVlLeEdLQVdiVUM0Wi9MVnNRMjRVN3hr?=
 =?utf-8?B?QjhuWnozaGVsWmdOVnVHcVhaLzE1T3dURVpYZmVhY0ZQMk0wVllhOUpCdENh?=
 =?utf-8?B?TkREeEN1bHk1b3hKbENjRURualNBVDk0eEF5aXl4UzNHcXFVWE02WE1aaEtt?=
 =?utf-8?Q?KbpLJhD+wZuOL59KKC3zL/o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae2da65-1c7e-457c-dfb9-08daf97c987a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 17:51:15.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFXXHb0s+URjqNdiSkKJhTsLneEVHPHroPu9ibfsd4U8H0/4VVgNzNtdIUlcj2BcCnrh7QBHEyfWJjNaVTRO0YlWjOnl/FqtaL2bfLi6ecI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> Add MTL PXP GSC-CS back-end stub functions hook them
> up from PXP front-end and PXP session management functions.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                |  1 +
>   drivers/gpu/drm/i915/pxp/intel_pxp.c         | 19 +++++++++++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c   | 23 +++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h   | 30 ++++++++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  6 ++++
>   6 files changed, 81 insertions(+), 4 deletions(-)

This patch is relatively small and it doesn't look like we have any 
benefits by introducing the stubs early (please correct me if I'm 
wrong), so I suggest to just squash it with the first patch that adds 
code to those functions.

>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index f47f00b162a4..eae4325310e8 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -330,6 +330,7 @@ i915-y += \
>   i915-$(CONFIG_DRM_I915_PXP) += \
>   	pxp/intel_pxp_cmd.o \
>   	pxp/intel_pxp_debugfs.o \
> +	pxp/intel_pxp_gsccs.o \
>   	pxp/intel_pxp_irq.o \
>   	pxp/intel_pxp_pm.o \
>   	pxp/intel_pxp_session.o
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index cfc9af8b3d21..be52bf92e847 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -12,6 +12,7 @@
>   #include "i915_drv.h"
>   
>   #include "intel_pxp.h"
> +#include "intel_pxp_gsccs.h"
>   #include "intel_pxp_irq.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
> @@ -132,7 +133,10 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	if (ret)
>   		return;
>   
> -	ret = intel_pxp_tee_component_init(pxp);
> +	if (pxp->uses_gsccs)
> +		ret = intel_pxp_gsccs_init(pxp);
> +	else
> +		ret = intel_pxp_tee_component_init(pxp);
>   	if (ret)
>   		goto out_context;
>   
> @@ -157,6 +161,11 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
>   	return NULL;
>   }
>   
> +static bool pxp_has_gsccs(struct drm_i915_private *i915)
> +{
> +	return (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0));
> +}
> +
>   static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_private *i915)
>   {
>   	if (!IS_ENABLED(CONFIG_DRM_I915_PXP) || !INTEL_INFO(i915)->has_pxp)
> @@ -167,7 +176,7 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
>   	 * on the media GT. NOTE: if we have a media-tile with a GSC-engine,
>   	 * the VDBOX is already present so skip that check
>   	 */
> -	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0))
> +	if (pxp_has_gsccs(i915))
>   		return i915->media_gt;
>   
>   	/*
> @@ -208,6 +217,7 @@ int intel_pxp_init(struct drm_i915_private *i915)
>   		return -ENOMEM;
>   
>   	i915->pxp->ctrl_gt = gt;
> +	i915->pxp->uses_gsccs = pxp_has_gsccs(i915);

At this point, if we're on a platform with the media GT we've already 
selected it, so you can just do HAS_ENGINE(pxp->ctrl_gt, GSC0).
Also, do we really need a local variable to store this info? Can't we 
just do HAS_ENGINE(...) where we need it?

Daniele

>   
>   	/*
>   	 * If full PXP feature is not available but HuC is loaded by GSC on pre-MTL
> @@ -229,7 +239,10 @@ void intel_pxp_fini(struct drm_i915_private *i915)
>   
>   	i915->pxp->arb_is_valid = false;
>   
> -	intel_pxp_tee_component_fini(i915->pxp);
> +	if (i915->pxp->uses_gsccs)
> +		intel_pxp_gsccs_fini(i915->pxp);
> +	else
> +		intel_pxp_tee_component_fini(i915->pxp);
>   
>   	destroy_vcs_context(i915->pxp);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> new file mode 100644
> index 000000000000..21400650fc86
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2023 Intel Corporation.
> + */
> +
> +#include "i915_drv.h"
> +#include "intel_pxp_types.h"
> +#include "intel_pxp_gsccs.h"
> +
> +int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
> +				   int arb_session_id)
> +{
> +	return -ENODEV;
> +}
> +
> +void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> +{
> +}
> +
> +int intel_pxp_gsccs_init(struct intel_pxp *pxp)
> +{
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> new file mode 100644
> index 000000000000..07f8c9b6f636
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2022, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_GSCCS_H__
> +#define __INTEL_PXP_GSCCS_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_pxp;
> +
> +#ifdef CONFIG_DRM_I915_PXP
> +int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
> +				   int arb_session_id);
> +void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
> +int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> +
> +#else
> +static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> +{
> +}
> +
> +static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif /*__INTEL_PXP_GSCCS_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index ae413580b81a..080aa2209c5b 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -7,6 +7,7 @@
>   
>   #include "intel_pxp.h"
>   #include "intel_pxp_cmd.h"
> +#include "intel_pxp_gsccs.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> @@ -66,7 +67,10 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>   		return -EEXIST;
>   	}
>   
> -	ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
> +	if (pxp->uses_gsccs)
> +		ret = intel_pxp_gsccs_create_session(pxp, ARB_SESSION);
> +	else
> +		ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
>   	if (ret) {
>   		drm_err(&gt->i915->drm, "tee cmd for arb session creation failed\n");
>   		return ret;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 7dc5f08d1583..43aa61c26de5 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -26,6 +26,12 @@ struct intel_pxp {
>   	 */
>   	struct intel_gt *ctrl_gt;
>   
> +	/**
> +	 * @uses_gsccs: PXP interface for firmware access and pxp-session controls is
> +	 * via the GSC-CS engine. This is for MTL+ platforms.
> +	 */
> +	bool uses_gsccs;
> +
>   	/**
>   	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
>   	 * module. Only set and cleared inside component bind/unbind functions,

