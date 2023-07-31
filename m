Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF276A2E0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 23:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92CE10E2F0;
	Mon, 31 Jul 2023 21:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ED110E2F0;
 Mon, 31 Jul 2023 21:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690839202; x=1722375202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k+AlJmWN0nzfiXL5uLfjsSAc23qe/IuY1nG8GtNNdOE=;
 b=ZsziPjqXLQgnarT4DSIlhINOT5LABM3F0uGjtY6ZqJpr4PzXmmqqgTGZ
 nX0kXd4MtOYGpoedj870DHuUC45TruXVwxxz0KK/uIX+Slac1r42RGBdi
 QE/JjLtLYYlD9Doj77idnFNO+9GokmAxKAXCyB1B+0OoEUhCAD9vYyhoG
 faDKLBy/NQGtcYZxPNowcIVxPfl63pJzk8oseoi8sRPrJyig5GA7UPsdk
 ad6G/t0x9pi/cIhCx3yJ4WhBXYoej10JdHk8wsvAQ72fC1sFtkhgkXZZe
 uly1Avvp7uD7bEffIVvgBwozWK6HDaPxwwU4BlyuN8VNINS+uX9qY6Qgy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359168895"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="359168895"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798401161"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="798401161"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 14:33:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 14:33:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 14:33:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 14:33:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9NGRFxrIBW94arzpc1aIpwbss7vTBVZNmm1RHqFVyYX9kku0QX1Li67/raR8Q/ydXtP5YaHiQlhQPiGQHH4o/MFQ4z+ouXAXSuAhQrOfmaixjgSyh8Q7YjeMe6PTmr79q1wvL6brh6B7MvHe9uZFwaQqkZgag/3fg4QkO2TxwiAGqssyUa55kP7cRGDOosEf6paIlzzgfQFuW06d1vFpu8Ho/0urLsEuT+nejcbRN5Gl2FBH1R0uTXt62lZMTsv8t+xchWoU4mlYPVBsfF4IpD9IJoZrnHKZNWmwJhy6UglmGDYvVS/FbvMEsdExZoQ4uAnTzs3wD3mTL9Rk6dncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYhvxFWbOui6CRhEGQ8bUlPYYTL3K2TCodBNb+fm1fg=;
 b=LiNk3dvn3EJ0AC1p/HtL8dUO2L6xzPY+Phgxq/eJEGDEOqQumMS7MkQF5uq83T0h2hlRWC5uUZzr9L0ijO8zNs+LLxU44XLQHYph2lcwxCubxHVWvGYpP6GLw1QoMYMHp+gTCAUA1IDTb+58rwIQZcjF9FU4TN0ptNPQPP9NB2dqJIaEUqQehZBJ2TCyuE1WTpXXpzWTlEXsNQWn1JHETVoqF8De11hDFAH46/Mx6GACSb3sbHcl8+LVN8QM/xJscPTLZQJeu2Jm6vFR+CoQfZdwBUAAQeo3zpIougoVxx5CCN+7kPQH8iwImxkHjo0rFwN33iifBKY8tQBRsSbMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 21:33:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 21:33:19 +0000
Message-ID: <22850f02-5b5f-ab2d-dda5-47cd6b880708@intel.com>
Date: Mon, 31 Jul 2023 14:33:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915/huc: fix intel_huc.c doc bulleted list format
 error
Content-Language: en-US
To: David Reaver <me@davidreaver.com>, Jonathan Corbet <corbet@lwn.net>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230727025400.372965-1-me@davidreaver.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230727025400.372965-1-me@davidreaver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c9705a-4d88-47eb-6b37-08db920dc1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+dP9pysvmPJ+Tu7VGLaHBWJLwgQmKPMW04nmYEy3QYc6YpiVTMXtGWEHrRoQWnkG7gP0cmdlhA7p/bppVzPgUiA1duc5P9tjYkJdm2wG4MYHEJVnlH73JwB1ocE3EfMl39t5jCePDwDwoIzzjrL0VpvmTjCJ4L345bj4irum1FXuD0/LYoAoSuS5JHonHnXw+gsQRILcesy7EJCJS4Yj0jbpK84Qo27DnuIxHrHJnMKpAjMGnJAe59vy1C4UNxktBdF0qGgP0H2nxyvrjno6K6oFDS9NfYZMRY/mqXz7sjdIptV7u+fgk+CR3oDao2qn8sngIbWEy+3Hp/guTwXKetkgGobT7LMjjcdvNcQUo1bDSMLGu9HhprGKN51CTr83IihR89b2MZjc+liLxq2jV3Y9jLPAmGfuyfK66CimFTdaGOUGakj9XDVGu22tMV0SbRpkT4VaMxfxWmZs8qx7zps5CGpwODBg0LxK9mcNrzkg0flIoYFL6L1rfm9J7a4eOLq86hUwXMAKznPDGagD3LqINjnSGFJZkAHRFOOI/HPHUkOKwJ4CRBhbhAWJpp1f+yIzzxyc+FOkoBu+wWtG/NXH/ilHze9SA91bIwqgvV3ns6hwtaEHyeNBqdWHJLJTo/QAgZPKIcqwqIVdoUN6qbRJheHEQkG0I+9lKMdQcZfBHB7e+ITkYYKrh4rKn92
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(86362001)(36756003)(31696002)(6512007)(6486002)(53546011)(54906003)(478600001)(82960400001)(6506007)(26005)(966005)(186003)(110136005)(31686004)(2616005)(83380400001)(66946007)(38100700002)(4326008)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNNL0xyWnhGR05GbTVXTkNLaG9SU0ZKNDVra0l5ZHgrTTV0QkhKVnlHdEpS?=
 =?utf-8?B?MGVlS3BkUWhuVWFGNElYTFE1Zk5SeFB6MjdpYW9lK0pDU3FVemlDVzdFREdz?=
 =?utf-8?B?RW1ZbHJpdlFyOTRhUGxtSGRnc2krQ0hlbit5cU15L3VpTVdZcFZKNHNLKytY?=
 =?utf-8?B?SzF3STNRYWJScmJHUUFOQ1hPSnp5dDNCWWlDWmFWdXVUanJUN1hQeWM5MDJx?=
 =?utf-8?B?YVVHWHVkRDl0MXpIbzZIT3NSdE9NcjV1TzFoU09tMkVuRVEzUEtvanVvd3Vh?=
 =?utf-8?B?bzYrc1NGU1hVUjlJYWRjSWJxMnpFMWJ4bDExV3J3UG9pdGd1aFNseTBDaXZ4?=
 =?utf-8?B?bkg5ZTFOdFBrekhCWEdoMWxYQjVGelZHdXlMVVZGdFNoTEw5S1Q3SmpPa3Zw?=
 =?utf-8?B?cDlWbklwOVVQQS9paUluZWFBV29BNy9YcEMrdHJpSFJXSnEvWHI2blZxUkVT?=
 =?utf-8?B?MllMMEdiL2tRWHlRSzEvTjNSSTJjRU5JcDJORTBvWmVqU1FXbzE2YUZqZDJN?=
 =?utf-8?B?NVlJNDR0RnV3c2N5cjRIbDliRXJ5emRDbDh2eGJQMTRtRmNadDREQnVwOWpT?=
 =?utf-8?B?QW5TVE5BSW9SckVBYnhoY052ZnN0OFBmcHltb1U1YlJLSTl3WmtDZjE3Q1ZY?=
 =?utf-8?B?S3lsZU9LeTlTMU5ocmU3c1JiRjd0T3JVRVlNZEpadDg0d3I2LzJLU00yYVN1?=
 =?utf-8?B?SWpHUlZENm03eGtUYmNyYldSa3lSOFBURWZDbUgwZ0I5YlQxcFVrTUEyb3lx?=
 =?utf-8?B?V1Y3NzViVTM3MUdZVHlIb29UalZlRUlpcmhWWXNlUXJTM2FJUjdIUWgxbW01?=
 =?utf-8?B?WnUvdlVoVGVkZkFPZlo2Y0s0VHduS0RLQXNyRnNxN1k4cUlaSUhxeElMcXBB?=
 =?utf-8?B?NG4xc08zbVNCaUU1bXU0akNOd1dKNHlaZGh4ZzQrdXVmRGtkbmNuaTBVVTMr?=
 =?utf-8?B?eExnRWxDWDlIajhqL0VHckF3RVphb3J5N1RLYytEUkpvTmV0YmZTcmI0TVZX?=
 =?utf-8?B?T1RhUWc4bVFjMWEwdnErUmtqbjV2MVQxT01WbzhqcjJhOUFtWHJ6YzVSZGcw?=
 =?utf-8?B?amlocDdOVGFiMVFEM3dZU21saWpreEZLd05yZ2ZnSjJVWFp3WWRkZ0RDdFp1?=
 =?utf-8?B?dWs4QTlVOXhad2duakVSS2haWkZJZ1MyUTFqanNtMTdsZjRWRXFGMm0vRUNl?=
 =?utf-8?B?T2pVOWlTdy95Q0tqN0d2eFl2WG1INkpPMjVvVHRKdEZaNG91cUhMR3VaR285?=
 =?utf-8?B?eVNJN0FiMCtNTjNZU01vaUJOc2xaeERlVFBNQ2t0VzNINmZ2dTdkSzQydVBn?=
 =?utf-8?B?ZFllWFRPak1yRVU0Y0xGL0s5S28zMGlHMklDd281L2ZORUJlQnZ1QzBsS3hp?=
 =?utf-8?B?NzVEQjZzVzVRUUN3ZHB3eDN0c241Z3FUZFdhYTZtZXRPSmtwa2gxNFRvWW5W?=
 =?utf-8?B?dncwa0lTbGRWTmkvMkVaek1UNUdtZWU2QURPdW5xMS9YS05VNnd5aHR0K3hr?=
 =?utf-8?B?WFJYWjg2LzJlRGdFM1MrdU16Mi9rOGxaNyt0UTRGZlhscVRCaWJZZEVEUThR?=
 =?utf-8?B?V3JYa2ltTHE4NWNhaVFnbitPaWk2SUxOcUxXNHNoU2d1YWJWWGhrSElET0Jn?=
 =?utf-8?B?T3NybCtuVENhQTVCaENFZWJmdGhOU0NWZ0grUVFBbU95MDRQUldnM3h6dFlF?=
 =?utf-8?B?dDIrRzZqTGVRaUk0NUdvTEtGc2UwTXkvdENsZjJkYnpHd0lKekZYZndMNHg1?=
 =?utf-8?B?UWw3UFFndjFjU3RxODZmSTVuMlE3QUdHeFBUaEhucUg5dklONWlnMWE1S2Fi?=
 =?utf-8?B?YU1VeDY0V1Z4WXNSOUZUMFNEZVd4R2xMVW5SaWpaS001L21TSmcwUk5PdzJp?=
 =?utf-8?B?VEI5NGk0ck5obmg4TjBGMmdRWXdVWjFySUlsbHUyTkI0ZmRpTkxnN2hIWkRN?=
 =?utf-8?B?OXozL2twR0R4ZjhOM0JSMm1lWDZpNngwSXhXOUNIZEIrd3IvNVM2b3FGV05n?=
 =?utf-8?B?V0MzSEozUERkRG50M1FXMmRydUU5Umh3UkNiTWtzUSs2ZlF4Qm1vUU83bWdJ?=
 =?utf-8?B?aXlhcDRqeEtmdUlGb3J0MENZUEt5QVptUGRZL21ybUEwZ1FwWXdReW9BVG56?=
 =?utf-8?B?N2txQTcwcUd1aGZWUUQzUXZMR2tJOUh4djFLZDg3ZTA3UlF6YVI0UmJMcTdn?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c9705a-4d88-47eb-6b37-08db920dc1ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:33:19.0235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/GmbOC1V7x2oYhYz8oNDcswwaufSeVPsbYgNX7vTwAV5NBKq6EHmxNlxUEqTcX723lRNWvZL8m/4bL1F0YWfUMFq6wpaH36ZBILjpH3YNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/26/2023 7:54 PM, David Reaver wrote:
> Fix the following make htmldocs errors/warnings:
>
> ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: ERROR: Unexpected indentation.
> ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:30: WARNING: Block quote ends without a blank line; unexpected unindent.
> ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:35: WARNING: Bullet list ends without a blank line; unexpected unindent.
>
> This output is a bit misleading. The real issue here is we need a blank
> line before and after the bulleted list.
>
> Link: https://www.kernel.org/doc/html/latest/gpu/i915.html#huc
> Link: https://lore.kernel.org/dri-devel/20230530152958.1384061-1-daniele.ceraolospurio@intel.com/
>
> Signed-off-by: David Reaver <me@davidreaver.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

and pushed to drm-intel-gt-next.

thanks for the fix,
Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index ddd146265beb..fa70defcb5b2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -26,6 +26,7 @@
>    * The kernel driver is only responsible for loading the HuC firmware and
>    * triggering its security authentication. This is done differently depending
>    * on the platform:
> + *
>    * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
>    *   and the authentication via GuC
>    * - DG2: load and authentication are both performed via GSC.
> @@ -33,6 +34,7 @@
>    *   not-DG2 older platforms), while the authentication is done in 2-steps,
>    *   a first auth for clear-media workloads via GuC and a second one for all
>    *   workloads via GSC.
> + *
>    * On platforms where the GuC does the authentication, to correctly do so the
>    * HuC binary must be loaded before the GuC one.
>    * Loading the HuC is optional; however, not using the HuC might negatively

