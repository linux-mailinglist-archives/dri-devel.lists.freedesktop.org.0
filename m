Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6EF5EC4F6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C56D10E947;
	Tue, 27 Sep 2022 13:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D0E10E943;
 Tue, 27 Sep 2022 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664286726; x=1695822726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DrzNNse2SO1XH8oUEQOrVfNepeXefSHrI7BFccuUp4c=;
 b=IdGPHXde10/SQsFH/VtJMicijuAaQ4qAQmYiiApZqPsFAjKsaiSr85Y8
 UdjjULmAJ+z0CetnSgXAOw5nNH86uHoUNAQagYhO1mBPiilXLJgjRKOd0
 xbEVDfMubXFDK7wCDZtnd/I95/1Fb6CUakJuVKxpWhGLsbHlYRtAharOq
 k0HsEvA9pQcd2Zi/XlgxAmJzX+5ZQcGSwOXDBq5yconafsvNMhTzq2tph
 3di6FYjxAwDInnUvODj8KOvtSyxUPPW2YMfL4MIwZPPdBMyjEG8kUl5kF
 lsSEX4Ue9QH7jnyCzitKxi7XDxTrzCmSn9mEx5VYWJ98S7hqrbYMoBqkJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="284445856"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="284445856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 06:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="572654426"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="572654426"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 27 Sep 2022 06:52:05 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 06:52:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 06:52:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 06:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C56bFAkvhTMJj+3sawEoR7ta8kSrkmRYlGBcC0FxEeX8LWiXYQLM9x8fxbZmFDYJ5WErQIS54dVTb8rdXRxh8/tTZNryKdwLI9WpPAVcNbFmWaYDomhTF8ryX2fZ3IpN++wMx6stoak4JKdMyD45i2MmXWJvrCRvp8qNoqD6eGhnFyAH59dyREtqsOPgQj8wTRC+GfvyTxqTFgz/bVPpEKOo/eeCOykLpvSjBlYr4i68q402xzoQcEn6Wm9xHoHxbhPf3ZII2QQjK1eH2opLcMyIud1UrHqNWR2vASTMdLF3WxdK8mmAg+AHi5l+THo6hxQhMx3w0i2syvQW7MU/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmg1AGH+xdwYjnf3RvN3pqyqisK50YRF0APLmBlyG60=;
 b=lLMm/bZXcYIj6IZJ3bfRm77i1WDO8E4YxVigieYajQ+/8XPBPRty70Rcw5TK88sK2gyOTT+5SzAeI1MEOcBTK4MDC6VeNDN/Cpwq9zkoORQr2g3yDiYI3vGAGV48aTERV3JJAGSBQoRc41GaGwh9A1k1B6zEfMdFFZSGE4/FQNtv9CVr/2viqiQSlrbQY8Ts54SLid249p+PAAkqrS87nOGiEezGWALhV+43Tgy/S447By6eHaRC2gckyTgWvUz2MOXlz383VBXKaGOEOoyIv1J9C5P9Ye+3jpf5OSIYJrhAB+9ipfsfknEPN4U6QKeu0syj9e2rTE2L56UgQ7lw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 13:51:57 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::3a13:6e49:f5c9:acfe]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::3a13:6e49:f5c9:acfe%5]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 13:51:57 +0000
Message-ID: <e14f2ea4-afb3-060e-98cd-1d5e469ef676@intel.com>
Date: Tue, 27 Sep 2022 19:21:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220926175211.3473371-1-badal.nilawar@intel.com>
 <20220926175211.3473371-4-badal.nilawar@intel.com>
Content-Language: en-US
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220926175211.3473371-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: d12a5262-f8ad-4528-5544-08daa08f71a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5QhM89bkO5IpnaNK/oj9X7o0Yn/w9qDbxuA8GUCIybb7ta3WkeO+H/bisLW1ItBzkFVHcSOgubtWrKviQJLHK0UTWrbsMpOFxMyzUvNOUvvoQzaG2gds/1yWP20bJeEZ5rFAdbncWWoZiRcTP4gU1y+gIe9Pj4Z5QU578lTs/SVy8JJ9ZxlE6eR4o2RDRFaCgtCJfGZjrSrS5/7dGkCknS6QZKTPM4lOgWmWqK3cfg2uneM3eaJizhaMU19JTMa0BB/gjC2BH4j1v+Eo3J4Lhy7sVTl1GNlhGAfk07mQTBIk+3N+0P8wXpVK13AbRdlG2qcBHaZP7khYCIa+o0dogOM+br+/jeFpVcp/t+zdHm9ZHhg8yJwLk0GX6/udwDMvOiRCn9h8Zl3ajdCtnPfj4tm2tZ/9eGGcnCbpFSDmFLPh4W70e08gMiMjA+hkg792qk4r99g1EqbfskZbBCwMaF9N6BVZk5VDOXbgErJHFuarNt2nDGYJsUFK4+pHEwn3UT7NpV4ViwEg8TsTHBwzDM2dWt+6MMxabuytcvW5Sv7AN5hoysIMWn0Zs7FX2nnjMahmFuExdkhb4kceJrDHnujw2Rc6ZBuGY0ei1WZfMu9al894+dCQuHLczYchcSrEwoacsr3+YrxnK00ZbBkP0rH1b2vtuiPWoxIdyWf0Fy1Q6x13l2PXfTsw5iliDrIxT6bGMAYfva/jC8gicufvXfJLmhMU1PQ5zjYZkRCWNfZvSRsGe3FVfBl/iVaSfCBPgQVMZNu/XaR3RzClNHoDNSkm047Wk++llzsUqx9ROE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199015)(82960400001)(38100700002)(66946007)(66476007)(4326008)(66556008)(316002)(5660300002)(30864003)(8936002)(2906002)(186003)(2616005)(6666004)(26005)(83380400001)(478600001)(6486002)(6512007)(53546011)(55236004)(6506007)(8676002)(41300700001)(107886003)(31686004)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b293TjBiM2JmSGw2YlV5KzRtM1VFMTVSemV4VHVOVmVaTnB0eFV0RkowNlpz?=
 =?utf-8?B?SG5oUHBZOHo4eXVvUFdobDh5MVBtQm5mSURSQVRzcmNKVHBMM3NneDVDZ0c4?=
 =?utf-8?B?cVNtY2hQanU4RzJZQWhNeGZORGE4a091anRpREpQQVlrRENTYlFCZkFKSk5M?=
 =?utf-8?B?L014R3Fvemp5L2ZlejE1Vjh2NlZMNjlSd3BScHRKdlR5SGlqWFg0K3B3U21T?=
 =?utf-8?B?eE9nS2grVHhFcFBPM0Z0K0h2b3VhMnJxRmkySER6eWpQcy84alNiTUpTMWZI?=
 =?utf-8?B?Y2xRSjlEVnE5aThJZWtmL3ZmSDJjRnhheDJQK0FIVSs4NHZubWs3eW5XWklU?=
 =?utf-8?B?bzRxcE9QMVZiRlAwQ1VWdForaXVEWVcyb054aXpoL1lFY2dtaHRnUVhEYTZJ?=
 =?utf-8?B?UENUR09acTY3TTVpYkZpQWxDR3BpMytWdEYwWFlKcGlCT01JdSs4YTdzSjNG?=
 =?utf-8?B?dmJpRlM0U0FuT0JjM1Z2SFRlSkFsbWlJUzA0OXhKcHBsNUZxcTIrakEyMGFa?=
 =?utf-8?B?blVqQVBta2FuZDRtR3hiQ05TaWR6WnlkTzZSSVpXbHo0R0l4UUMzUk15ZGJT?=
 =?utf-8?B?N0VZN1hody9tRjZiL2FhZk1naDlLS2pSR3ZHVG52c0JoVjRvZVFibXllUWhl?=
 =?utf-8?B?T2gyZmVBSGtyNWlyQmMyM2VTaUMvVDUveHY0VXEveHZFZHU5bnVLVk1xRnJL?=
 =?utf-8?B?Y0lxMFRBRW55WnMvWkp6c3dHRjcvNEVSb1d1WEV4M1l5Uytwa0plUS92YnNP?=
 =?utf-8?B?L09BK0JKbHBMa0pucW95ak5POHg3b09HM0VBYjgrUktxQmMxWjJycmdJVlVZ?=
 =?utf-8?B?QlpyeHZFajRwdTVLWHd5TlMwci9mTnNJL0dTSHFpbGJNNk5ub2U1N25VQkxG?=
 =?utf-8?B?aCtCZE1Zc3VzK1dvRHdBNFJFRWRqV2VUaSswcXRsNTdFaWpYSXl0NFJhN2Nn?=
 =?utf-8?B?bXRPUnorTkhUY0N4Q3hSLytpWlcrVWZwdm9tWXJlZjJsNFBCckVmQ1VYS1ho?=
 =?utf-8?B?eHRDTEV1S2hHQ09zQm5oSEhIVUxjZXhYSHQ0eGZ0NkRCODIvc3RGNXhaa2pl?=
 =?utf-8?B?TkI3OUFidVJwUjErYXN5RUtYcXNETkhpcW9HNWZjaWhLMS9pSGF2aUQ2Z2JE?=
 =?utf-8?B?USthZmtkUlg5NmttZmpEUnNhUkMxdUZaUDRvVE5mWGh6WWwrTVRqNnVhN0cx?=
 =?utf-8?B?elltdGw1UTN1dlFkQXlMeXV0d1pHa2RQQTMvYmhBSDFKY0IyYU5leGoreWNY?=
 =?utf-8?B?Snc5MnphOGVISWdGQzR5KzJnUVJnMXlMK3pWRWs5Z1ZmaGtEREhscUxPc3dh?=
 =?utf-8?B?Q3pDVDN6Q2hvUzc1cTN5bzJNdFlFbXd4MlduQ3lJNGlyd3ZJOGFFVm9FYXhC?=
 =?utf-8?B?TXNvUjJRUDB4YnFIUFJFdGI4ZTFxTTdxSUM5WU9lRXVabVdEaTNDVlVRMUJY?=
 =?utf-8?B?b0IwQlQvLzlDWHY4S3JJZXRMd1dKdW94OEJWazlnYTcyWVlxQUJyL00yM2hl?=
 =?utf-8?B?TEFwL2hJUEZDUkJ4YzA4RnM2RXFDWkJQTk8vZjBJOU51cG1qMVl0bnc2Q1Yw?=
 =?utf-8?B?Vjh4MWNXVDZTOEdGTWdlZHR1aHdIWC83SXZjVURSUzE4UzB6cTdham9vV3Ev?=
 =?utf-8?B?NjM1WWxpOXJZRSsyUmxKbzFpcTJIREtaRkJraHJ5Yk5RYWZYckZXR2ZUMXRF?=
 =?utf-8?B?UkFLN2oyVGxtdXF2b3czSmZyaW0vdlQ0d00rMFdOeHpKNXhNUyttay9Objl1?=
 =?utf-8?B?QjhOQ1A4RndDczNMN0JvZDYyV1JCNzQ0b0xRM2k1OHAvUXhVMFNQbkM3czVQ?=
 =?utf-8?B?R1J6OUFLSXlpWk9tcFZ1R3lRbTVRVWNHTVJDOExvN0hiMkhFakE3UGZncmlK?=
 =?utf-8?B?NDFRWE9zbkxXdmZmZU9MeldJdXhnSDZocVd2blRkQ3hpWXI3RmFDYTJ3TldC?=
 =?utf-8?B?VGluVlFZMy9tLzNQak5UMFJQOUFQRmtiZkUwSllnd0lDWU16cDIrcGp0T0ta?=
 =?utf-8?B?dDhFSFBGTytUWSt3ZmR3a1YxVG1TTkRzNGtFZlk3RkZBS0Z3QmV0bHY1WXVV?=
 =?utf-8?B?anpQY0lRSTRTajZMU0Z3UStZR1MxdXNoWktNdnkvSmtWRE56RzQvVU50dlRx?=
 =?utf-8?B?cU90TFhWY3BGSWxZRDdEYXR4dmZtNnlSRlF4Wlh6U0gvaFlyTERYN0ZXVnF3?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a5262-f8ad-4528-5544-08daa08f71a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 13:51:57.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYThixPZQsun6SxhCwRoiufJpT2IbBlZFbanGfXuhtjN8osoDGgQh3ZjQXR4tmvfBFNOeIVyKIuyJyR0FuuUBvWvCHBJipozq80LJKfULPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4920
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/26/2022 11:22 PM, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Use i915 HWMON to display/modify dGfx power PL1 limit and TDP setting.
> 
> v2:
>    - Fix review comments (Ashutosh)
>    - Do not restore power1_max upon module unload/load sequence
>      because on production systems modules are always loaded
>      and not unloaded/reloaded (Ashutosh)
>    - Fix review comments (Jani)
>    - Remove endianness conversion (Ashutosh)
> v3: Add power1_rated_max (Ashutosh)
> v4:
>    - Use macro HWMON_CHANNEL_INFO to define power channel (Guenter)
>    - Update the date and kernel version in Documentation (Badal)
> v5: Use hwm_ prefix for static functions (Ashutosh)
> v6: Fix review comments (Ashutosh)
> v7:
>    - Define PCU_PACKAGE_POWER_SKU for DG1,DG2 and move
>      PKG_PKG_TDP to intel_mchbar_regs.h (Anshuman)
>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
LGTM
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 +++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 158 +++++++++++++++++-
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 ++
>   3 files changed, 188 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index cd9554c1a4f8..16e697b1db3d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:	RO. Current Voltage in millivolt.
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 9fcff6a884ee..53d34a7a86f7 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -16,11 +16,16 @@
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - voltage  - millivolts
> + * - power  - microwatts
>    */
>   #define SF_VOLTAGE	1000
> +#define SF_POWER	1000000
>   
>   struct hwm_reg {
>   	i915_reg_t gt_perf_status;
> +	i915_reg_t pkg_power_sku_unit;
> +	i915_reg_t pkg_power_sku;
> +	i915_reg_t pkg_rapl_limit;
>   };
>   
>   struct hwm_drvdata {
> @@ -34,10 +39,68 @@ struct i915_hwmon {
>   	struct hwm_drvdata ddat;
>   	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>   	struct hwm_reg rg;
> +	int scl_shift_power;
>   };
>   
> +static void
> +hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
> +				    i915_reg_t reg, u32 clear, u32 set)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct intel_uncore *uncore = ddat->uncore;
> +	intel_wakeref_t wakeref;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		intel_uncore_rmw(uncore, reg, clear, set);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +/*
> + * This function's return type of u64 allows for the case where the scaling
> + * of the field taken from the 32-bit register value might cause a result to
> + * exceed 32 bits.
> + */
> +static u64
> +hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
> +			 u32 field_msk, int nshift, u32 scale_factor)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 reg_value;
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_value = intel_uncore_read(uncore, rgadr);
> +
> +	reg_value = REG_FIELD_GET(field_msk, reg_value);
> +
> +	return mul_u64_u32_shr(reg_value, scale_factor, nshift);
> +}
> +
> +static void
> +hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
> +			  u32 field_msk, int nshift,
> +			  unsigned int scale_factor, long lval)
> +{
> +	u32 nval;
> +	u32 bits_to_clear;
> +	u32 bits_to_set;
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
> +
> +	bits_to_clear = field_msk;
> +	bits_to_set = FIELD_PREP(field_msk, nval);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
> +					    bits_to_clear, bits_to_set);
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>   	NULL
>   };
>   
> @@ -71,6 +134,64 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   	}
>   }
>   
> +static umode_t
> +hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
> +	case hwmon_power_rated_max:
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		*val = hwm_field_read_and_scale(ddat,
> +						hwmon->rg.pkg_rapl_limit,
> +						PKG_PWR_LIM_1,
> +						hwmon->scl_shift_power,
> +						SF_POWER);
> +		return 0;
> +	case hwmon_power_rated_max:
> +		*val = hwm_field_read_and_scale(ddat,
> +						hwmon->rg.pkg_power_sku,
> +						PKG_PKG_TDP,
> +						hwmon->scl_shift_power,
> +						SF_POWER);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		hwm_field_scale_and_write(ddat,
> +					  hwmon->rg.pkg_rapl_limit,
> +					  PKG_PWR_LIM_1,
> +					  hwmon->scl_shift_power,
> +					  SF_POWER, val);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -80,6 +201,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	switch (type) {
>   	case hwmon_in:
>   		return hwm_in_is_visible(ddat, attr);
> +	case hwmon_power:
> +		return hwm_power_is_visible(ddat, attr, channel);
>   	default:
>   		return 0;
>   	}
> @@ -94,6 +217,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_in:
>   		return hwm_in_read(ddat, attr, val);
> +	case hwmon_power:
> +		return hwm_power_read(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -103,7 +228,11 @@ static int
>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	  int channel, long val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_write(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -124,11 +253,36 @@ static void
>   hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct intel_uncore *uncore = &i915->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 val_sku_unit;
>   
> -	if (IS_DG1(i915) || IS_DG2(i915))
> +	if (IS_DG1(i915) || IS_DG2(i915)) {
>   		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> -	else
> +		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
> +		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
> +		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +	}
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref) {
> +		/*
> +		 * The contents of register hwmon->rg.pkg_power_sku_unit do not change,
> +		 * so read it once and store the shift values.
> +		 */
> +		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit)) {
> +			val_sku_unit = intel_uncore_read(uncore,
> +							 hwmon->rg.pkg_power_sku_unit);
> +		} else {
> +			val_sku_unit = 0;
> +		}
> +
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	}
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index ffc702b79579..d7e2e4711792 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -189,6 +189,16 @@
>   #define  DG1_QCLK_RATIO_MASK			REG_GENMASK(9, 2)
>   #define  DG1_QCLK_REFERENCE			REG_BIT(10)
>   
> +/*
> + * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
> + */
> +#define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +
> +#define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +
>   #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
>   #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>   #define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> @@ -198,6 +208,8 @@
>   
>   #define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>   #define   RPE_MASK				REG_GENMASK(15, 8)
> +#define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
