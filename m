Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483925B7EE0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 04:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C0310E7D8;
	Wed, 14 Sep 2022 02:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32D10E7D7;
 Wed, 14 Sep 2022 02:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663121951; x=1694657951;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SEFwCZKBC2gYDwr2ZRbcNjrZFRS2MbXhCqB6mKd1O9s=;
 b=XnqIeeCZk18lTlUsMkj/OvrjsBAy7L6LiM/FNl+5FaEIPNrqM64TyCH9
 yNAXUk+5lmxWCMwFvBFvrj/zOJowsMCNGcIRMReTGkIAXhNMkEV7Z4Bhx
 kmenUVlToxsnIAS6mZqcW5wpJbfHC8GFRrhuj6b5ffYD5SrNyZGkf0pdq
 nqKTFfl86MopNzkKeLoVEPSu5fVkEI51USjoVbesZS0YkE0nu2ZWK2vQ4
 r4gHn6HRIjty/c3sfURkZ+F8gekzxyi4sKbER3cekwviYTEmcuBTpqYPi
 IHsksR270phz91MvjCmIrTEF+QD01rah/0slxICJdVgox6DCWDlB/bgFA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="324559389"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="324559389"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 19:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="678842291"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2022 19:19:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 19:19:10 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 19:19:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 19:19:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 19:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYIMLxInHcSvIGIdmnzJsoMbpl+8jhiKDEi9FOsehut/6T9B1liIH50gvUmUOMgfxUgp7zi9XQcwjVPXY/wBnL07U/Yvwc6MSLNYfd1eEKyxwD6EQQV3LEAvDMwFKmLBDbP7FRzC43K6fm1at8r933xZFBR7pZKM/Bqc/8GTCTcm70C1Dke1QHsP0H8RmEQ/UJQzYY2XlFtw1eNzpSnAb9uvaudAHQJW9DZmcQehX288bPxyXJTvouCz6HXS7oduM6AvxKaO0sfWBNniFWVGX15UZ5TpVt4xjwE6L9cKVyOtLsucQhJqvtEtpz4VJJFQE1oC9yYlIAfykQdjbovmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASjs6uWkOCtckX09x/27/G/CDPQsVRUtpyXSpTk9oPA=;
 b=gd+qS2GRS7Iqjca/muB9Xj/MAKA6LF6BveaCay4J7E3A+Mz7Q5EHO5gXPF4tkNnP6U6GNQO5iwcup2gtGiCIL32f+O8iMTgdqeUw5LOnz6RjcqPskio0eK8ygsWcsBqo7BY9E9MfcaKo/mp1qUXExyEBhCvVaAk0PmqPeF+Sj66uWo/4KPDykuax2D49pSz5vFaQ0ZVBpmZ32pYNuctG/YOPO2u97HE4VyFdceoYwsVNAz8p3kjRybQzki7YVjUelu0e5rWHKjQ68bl0CjjqBV4Z5kYnnOW9oy0MSIhHwQFYa0WyLAqeysiqaOHPxMe84tNjlYan//gVxieZ9wK+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 02:19:07 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::151c:5cbe:6974:a94d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::151c:5cbe:6974:a94d%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 02:19:07 +0000
Date: Tue, 13 Sep 2022 23:19:55 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/i915/gt: Extract per-platform function for
 frequency read
Message-ID: <20220914021955.kvud4yml7m77tf2g@gjsousa-mobl2>
References: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
 <20220908-if-ladder-v2-2-7a7b15545c93@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220908-if-ladder-v2-2-7a7b15545c93@intel.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM6PR11MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 53be1bfd-8164-48dc-7501-08da95f78076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uw9f4Mo4HSWgWxBfEM3frUhCyOjEcchziUGzrInP0AuHgsvOnGcz40iHr4529gOfYTcMbwBr8DVAGyqJR0bY65uVjSJV6ssgoK6CVBxbf9BYquFNs/fBvclHSnOsg52e+zMOVrc9XHj9xDmc1TDtRXfm4HOe8En6WqW3v6TI33jcFzbx4z2O7kBPrw/zvqVvBiTDGS1xMMy1wZQOaJl4yL069BXhnjBtRIixjrbR7VvzDGRcxgXeXBAuC1GDUTEVfOcbxwEWbY+ucjwE6dn4ksmHtt5Imvwf2DwYopshfA7KUfUVp9HeTIgiNxcRS1VwXFVI/Nt5v1SntrXvbN4mr50e6Mpj8KPIZJKHGuzXuNXrhF+6EmfY0a2FviseHRpb7U4pltghaVeDIwXzsRlRtMKHqo+vGXvpvLhdOcRgXmWAE5EiDZuYKBfa40gY4upMiNQAmbhHuJTt2Dd9exuWJs7THxcY2AFJlQSxHR1HshtKjEw3BMC3Bg1aqkloymLU15R6LeRr60FU+Zd7nMsPdcwjJweru/GCev1dh9rk2t3uXF2QoDnkwbh00jj+xQnG64OzX+aU+cPQgSAsWvXdli7lqxeSi5arRlLbS4RLWmVX2FLmxDT55gZtyy0IGB8XApA1dO3ZsMNRH8uhs4pVloabVcq+61VWmj6zxF7Dmt87QmdaTz3tRg761+f+q+E2whmwrUVzWUp2DSsHhtv1Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199015)(1076003)(44832011)(66476007)(4326008)(6486002)(66556008)(38100700002)(54906003)(186003)(33716001)(6506007)(9686003)(83380400001)(316002)(82960400001)(6666004)(66946007)(2906002)(41300700001)(478600001)(26005)(8676002)(6512007)(8936002)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtyNnNwSDBRcHlPSzdQOXQxMllra0JWdEM4Vm1WcXpDeVNZSEQ1bm5UQjRH?=
 =?utf-8?B?cjA1K05oOEc3NWZPNElIdDkrN0hVS1JyK3JCYkFXa3JlM2lYZVdNd0tPMGg5?=
 =?utf-8?B?aDZWTENNTG8wOHozUVJOaDlONGZLV1A0K0oyaTVoY0xXc0RHSkY5RmZIbWlT?=
 =?utf-8?B?T2x6V3NhZUVLeGtOYzI1TUMvNThCMzRRWkdzRnJRbm1xb3hxVTBrejV6R2Yr?=
 =?utf-8?B?T2xiemFRTUZ4WnVoK3dBbHVTRFZLYldvMXRZdCt6MWR5ZU5sQ04rNXlrNEdy?=
 =?utf-8?B?a2VLTGVjWlA5SUkrblZuSG10OXpjcXVpZXRWeVJkeC9WSEJOcXY0Z2JhLzdz?=
 =?utf-8?B?Q25hejBWTXJ6UFMwYXVQSncvVmRkeGlnRERNblltcWJhZTlmZWEwWnptZ3p6?=
 =?utf-8?B?a1NXM0JacDVSbHl6Vk1iWGFlZ3c1NHhrOVJwQjk4WjMwZlpsKzZWMEpiVVFh?=
 =?utf-8?B?L3QzbjRvdzJIN3ZlOUZUS2FpNDE0UEVnSW02MUsyR1QxVkFpV3RoSkJ1cUtS?=
 =?utf-8?B?NkhzNDExcmpRa2VLeGVVWkFmZWVTVFE0MlFHNkhKNzF2ZWlJdlBkSm1veDlk?=
 =?utf-8?B?MUliUTloZ2k5dkY4cElKaVNIS3FCTDhtTkRYdWlEaks5TUczZ3E4RFR6SEZQ?=
 =?utf-8?B?Y0lLS1lCZnJEckNuUGFndXNNTjY3cHFibys5WlBndGY4czJLNlhJSmRtT1l3?=
 =?utf-8?B?UDUvdTh4Vm92eFFxVGlKUFAzQ21XVlNocWZSeWMrM3l1YUFCYVBmQjZiWWFC?=
 =?utf-8?B?Kzc1L29UenFBRzIwRVlsWmF5cXl3bTB2Sm9oWnQ1QWZOS1N1ajBadnVMOUNz?=
 =?utf-8?B?VjZIQUhYMElyaFQ0OU8xSlFEeTRpQThFY1U3UU9rNi9zY0c2VmVOSXJVYXdR?=
 =?utf-8?B?MU95bWc2aVZhdGdudGo3eVZpK0ZqTGREZEkvakJvazVUT3gzWUcwNVBhQUF6?=
 =?utf-8?B?cUpJSXlFRWFNZUZWWS95VGpvTTlsb3hsYVorSmpqa3o0MXNDQ2ZQcm9ISUt5?=
 =?utf-8?B?ZzhpV2JRN1RuOVc1SGlPS1VQbXp1OW9sUFNlNm5GaHFyTWhYVmpweWpGVDFN?=
 =?utf-8?B?Mjg1emQ4NTVHZ0VudHVmeWdwejZ6bkE4ZGsrNGkzYUlMdTlBdW1CRUdJdTh0?=
 =?utf-8?B?Nlo3elpNeVNtMC9Dd3VmTTFFVUIrZWU4YnBqSG1rTGFxTHFzaW5hd1JpMjQ0?=
 =?utf-8?B?blZxK0FBd29VR21CS29leElhei9qWWNObDhaNW1hT2lMV1NIWTduL0kyd1pH?=
 =?utf-8?B?eEsybCtCcW1EQUFTQ0VkRm5UODdXVVgzNC8vNUFaaDVobHBJRVozMkNjaHRw?=
 =?utf-8?B?RDNhNktwaHFyZUpiYVRYaWJTeDBTSXhISVUxOFVwOUM3ajNYT3UycE4rVVB6?=
 =?utf-8?B?WDdpcnVCcURTL0dtUjFUSTcxSEpMcU9sMjl0RTdZUDhlWkR4aFNEejFEdzlp?=
 =?utf-8?B?cU9YSUZwcDJYbEVaZVhHd0xvTm4rS0dDSk81emROVDM0ZjF5QkM2eG9sVDBB?=
 =?utf-8?B?SUtWYWNOR3pHdnBReXU2cHZ2RCszRUVscmZmbHFZMlp3alV3ZUpiRUJnLzNX?=
 =?utf-8?B?bnJsOUNxYXNuMDk4Sy9qeGJMYWo3NFlDV05hUmx0d2wvK0R1RStaSVRmWUhk?=
 =?utf-8?B?TkRXWXlNRHFyNmRTb3R6RWVaZWdSWEJJY0pueVRSSGVRNkVWR2NlU2JDZmFE?=
 =?utf-8?B?Tk13YkZXZDR6cWNjMWRmNEVYeitUbGF6UTlMQTlid1FTNk1DbDZsQjdLUjQr?=
 =?utf-8?B?WWpjaVZuOVF3VHZ1VVZQY3JZVGFtWCtJQnRNeFdoWExNcGF4QlhEa2c3WWxV?=
 =?utf-8?B?Y3pkaUpUcUhTdXlmMFFJYkl5VVRkTXBDR09XcGVYNUd0ZERiS1g3Tm1YOUpp?=
 =?utf-8?B?akVCQ1J4VXlSTDYvdmcyWk90TjN2c3UwRHVTQTFLR25OVWdDZm1UNVRLY3Vy?=
 =?utf-8?B?eDdITVU0NlJsUzBlVkVVY29vLzFtUXhrSHZsZ2t4dzlBQmxlRDNJNU9iL3F3?=
 =?utf-8?B?TTkvVVZUajE5U0R2WnRqS3BnSXlSeW91Y2tYdEZxMGE5NU5ncDFFQm9USjV3?=
 =?utf-8?B?VEY0T1cwa2FIbEM5VXg4UnZIUWdVUmJmVkZMWjBNWmNoMkw4bEZZVzU0RXov?=
 =?utf-8?B?Tzl0RDVnUlJ5cWFRZFNwdFdtU3BzSi9GSkF2Y015WngvdXY1c0VyM3h3L3B4?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53be1bfd-8164-48dc-7501-08da95f78076
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 02:19:07.4960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckANdgVoLwpDZM4t7EOyAr9sNkvI6pLkOV0pKqiqnCcHNL3PGqQBcj2lJebqic06GARMASD3YueVpUx4WgHM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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

On Tue, Sep 13, 2022 at 02:09:57PM -0700, Lucas De Marchi wrote:
> Instead of calling read_clock_frequency() to walk the if/else ladder
> per platform, move the ladder to intel_gt_init_clock_frequency() and
> use one function per branch.
> 
> With the new logic, it's now clear the call to
> gen9_get_crystal_clock_freq() was just dead code, as gen9 is handled by
> another function and there is no version 10. Remove that function and
> the caller.
> 
> v2: Correctly handle intel_gt_check_clock_frequency() that also calls
> the function to read clock frequency (Gustavo)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> index 93608c9349fd..3f656d3dba9a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> @@ -26,26 +26,6 @@ static u32 read_reference_ts_freq(struct intel_uncore *uncore)
>  	return base_freq + frac_freq;
>  }
>  
> -static u32 gen9_get_crystal_clock_freq(struct intel_uncore *uncore,
> -				       u32 rpm_config_reg)
> -{
> -	u32 f19_2_mhz = 19200000;
> -	u32 f24_mhz = 24000000;
> -	u32 crystal_clock =
> -		(rpm_config_reg & GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
> -		GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
> -
> -	switch (crystal_clock) {
> -	case GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
> -		return f19_2_mhz;
> -	case GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
> -		return f24_mhz;
> -	default:
> -		MISSING_CASE(crystal_clock);
> -		return 0;
> -	}
> -}
> -
>  static u32 gen11_get_crystal_clock_freq(struct intel_uncore *uncore,
>  					u32 rpm_config_reg)
>  {
> @@ -72,95 +52,106 @@ static u32 gen11_get_crystal_clock_freq(struct intel_uncore *uncore,
>  	}
>  }
>  
> -static u32 read_clock_frequency(struct intel_uncore *uncore)
> +static u32 gen11_read_clock_frequency(struct intel_uncore *uncore)
>  {
> -	u32 f12_5_mhz = 12500000;
> -	u32 f19_2_mhz = 19200000;
> -	u32 f24_mhz = 24000000;
> +	u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
> +	u32 freq = 0;
>  
> -	if (GRAPHICS_VER(uncore->i915) >= 11) {
> -		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
> -		u32 freq = 0;
> +	/*
> +	 * Note that on gen11+, the clock frequency may be reconfigured.
> +	 * We do not, and we assume nobody else does.
> +	 *
> +	 * First figure out the reference frequency. There are 2 ways
> +	 * we can compute the frequency, either through the
> +	 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
> +	 * tells us which one we should use.
> +	 */
> +	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
> +		freq = read_reference_ts_freq(uncore);
> +	} else {
> +		u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
> +
> +		freq = gen11_get_crystal_clock_freq(uncore, c0);
>  
>  		/*
> -		 * First figure out the reference frequency. There are 2 ways
> -		 * we can compute the frequency, either through the
> -		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
> -		 * tells us which one we should use.
> -		 */
> -		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
> -			freq = read_reference_ts_freq(uncore);
> -		} else {
> -			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
> -
> -			if (GRAPHICS_VER(uncore->i915) >= 11)
> -				freq = gen11_get_crystal_clock_freq(uncore, c0);
> -			else
> -				freq = gen9_get_crystal_clock_freq(uncore, c0);
> -
> -			/*
> -			 * Now figure out how the command stream's timestamp
> -			 * register increments from this frequency (it might
> -			 * increment only every few clock cycle).
> -			 */
> -			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> -				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> -		}
> -
> -		return freq;
> -	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
> -		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
> -		u32 freq = 0;
> -
> -		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
> -			freq = read_reference_ts_freq(uncore);
> -		} else {
> -			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
> -
> -			/*
> -			 * Now figure out how the command stream's timestamp
> -			 * register increments from this frequency (it might
> -			 * increment only every few clock cycle).
> -			 */
> -			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
> -				      CTC_SHIFT_PARAMETER_SHIFT);
> -		}
> -
> -		return freq;
> -	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
> -		/*
> -		 * PRMs say:
> -		 *
> -		 *     "The PCU TSC counts 10ns increments; this timestamp
> -		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
> -		 *      rolling over every 1.5 hours).
> +		 * Now figure out how the command stream's timestamp
> +		 * register increments from this frequency (it might
> +		 * increment only every few clock cycle).
>  		 */
> -		return f12_5_mhz;
> +		freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> +			      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> +	}
> +
> +	return freq;
> +}
> +
> +static u32 gen9_read_clock_frequency(struct intel_uncore *uncore)
> +{
> +	u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
> +	u32 freq = 0;
> +
> +	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
> +		freq = read_reference_ts_freq(uncore);
>  	} else {
> +		freq = IS_GEN9_LP(uncore->i915) ? 19200000 : 24000000;
> +
>  		/*
> -		 * PRMs say:
> -		 *
> -		 *     "The value in this register increments once every 16
> -		 *      hclks." (through the “Clocking Configuration”
> -		 *      (“CLKCFG”) MCHBAR register)
> +		 * Now figure out how the command stream's timestamp
> +		 * register increments from this frequency (it might
> +		 * increment only every few clock cycle).
>  		 */
> -		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
> +		freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
> +			      CTC_SHIFT_PARAMETER_SHIFT);
>  	}
> +
> +	return freq;
>  }
>  
> -void intel_gt_init_clock_frequency(struct intel_gt *gt)
> +static u32 gen5_read_clock_frequency(struct intel_uncore *uncore)
>  {
>  	/*
> -	 * Note that on gen11+, the clock frequency may be reconfigured.
> -	 * We do not, and we assume nobody else does.
> +	 * PRMs say:
> +	 *
> +	 *     "The PCU TSC counts 10ns increments; this timestamp
> +	 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
> +	 *      rolling over every 1.5 hours).
>  	 */
> +	return 12500000;
> +}
> +
> +static u32 gen2_read_clock_frequency(struct intel_uncore *uncore)
> +{
> +	/*
> +	 * PRMs say:
> +	 *
> +	 *     "The value in this register increments once every 16
> +	 *      hclks." (through the “Clocking Configuration”
> +	 *      (“CLKCFG”) MCHBAR register)
> +	 */
> +	return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
> +}
> +
> +static u32 read_clock_frequency(struct intel_uncore *uncore)
> +{
> +	if (GRAPHICS_VER(uncore->i915) >= 11)
> +		return gen11_read_clock_frequency(uncore);
> +	else if (GRAPHICS_VER(uncore->i915) >= 9)
> +		return gen9_read_clock_frequency(uncore);
> +	else if (GRAPHICS_VER(uncore->i915) >= 5)
> +		return gen5_read_clock_frequency(uncore);
> +	else
> +		return gen2_read_clock_frequency(uncore);
> +}
> +
> +void intel_gt_init_clock_frequency(struct intel_gt *gt)
> +{
>  	gt->clock_frequency = read_clock_frequency(gt->uncore);
> -	if (gt->clock_frequency)
> -		gt->clock_period_ns = intel_gt_clock_interval_to_ns(gt, 1);
>  
>  	/* Icelake appears to use another fixed frequency for CTX_TIMESTAMP */
>  	if (GRAPHICS_VER(gt->i915) == 11)
>  		gt->clock_period_ns = NSEC_PER_SEC / 13750000;
> +	else if (gt->clock_frequency)
> +		gt->clock_period_ns = intel_gt_clock_interval_to_ns(gt, 1);
>  
>  	GT_TRACE(gt,
>  		 "Using clock frequency: %dkHz, period: %dns, wrap: %lldms\n",
> 
> -- 
> b4 0.10.0-dev-bbe61
