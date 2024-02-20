Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567185B22E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 06:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9E10E13E;
	Tue, 20 Feb 2024 05:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDxDp+ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32D810E130;
 Tue, 20 Feb 2024 05:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708406044; x=1739942044;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I1wJYg+v97OLjw/6JHtLMZblieyCR1A1nBdExpC27ms=;
 b=iDxDp+ff59mAZ9QmBg42/Iv6/iXeOPmL4Tnfarph4eQwKgw9kQk5wJm4
 lVoHmrWjEuSrSNATdL0FLwhTHJGzv+v2MY7XFTlNHKv6qGYgvcdtF4QYr
 CrPUjw/GbosmaButj1jOKD6SMHa0/pO/aKhnlnY9pTcqsmEWbq9XM+OW4
 /clnB/pU1xtT9GWKG+MQnJVKOZdMvssnFdSjpE+3L0zAIedJi8eW6diTS
 y0M6ig7tJ1iR40dJyCOJuozirzBUCi7uKKOQwBUdaeVpbmgLEKCnOopnT
 Xfq9fU2y81DeFCydpQFJfXWDHz8ty7WfVfd0haebaJEYX4M0YkVd/fhr1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="27938349"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="27938349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 21:14:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="5040811"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 21:14:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 21:14:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 21:14:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 21:14:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 21:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArGdxwhhsx4s5AgtyFW1TaI/uo3DmBg6hhFBhZeThvr9QXdzYMZ97U89MgzWrMbXt9CJ80cEo3THh/OwYlnEkuk1uD36XZ0rZQ0CiNMDrjjnBzwTDSiXVZBRTOOwzw8otsRzCxJpuq/C4K77FIYQWeyxwK6uhxI7JJlfLkUcKnRPHusUnbs18Opvyuou2jxKlDwRJ2WejrxUZ9CYdGTwKHH09ibV6Ms6wnrniASG+63qKwBXp7fCWDV4UDBa6dFqpySBSKhxY00Ud/WdsEcHWOE6rQMdyiE6gy0btOwpRAq93dYZFHeEcmhnj27eniAYP+RpLJAi3W3usKzxMotwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1wgHl4+BveQ03dQ8x8mCLNFEAg0GGG+SlSIDOgUZ7A=;
 b=b1WSya0AQyHQ8nhwW58Z03fHtnUNnnCxiGXJbR+p4WufUbxSt6hNi1JqZ4+uyYoJO32FTrV+dSutdf5iG3aPu3FBB3j+gZ+J3CXDngETwk63gYmM5LeWM1QOE7dsG+Uo6CHvHfaSTTphH16zX2YoIinOzXZ86fnqY0eWXlfpp1FKn1DWLc6VNIWDyY6broOZIVXcM8oIU92iSl475ujEXUIeK2EWtfBA30CKHeyB57PCnrSaiixYuOv9Rg3g0GImjNh5Z5AU/8so1Bh9DkmlHJDyLieQI3cI0XOFj5nA1J6rIzkfqeE1AXY4QLWPpitSZUkpgAhFLMmFntmfoZJnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 05:13:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 05:13:59 +0000
Date: Mon, 19 Feb 2024 23:13:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Message-ID: <erg2ymp6raf7ru5ggj4hrrhet4i762msoqa2ronv4znfhlkc6o@nxu6ygtdfmrj>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
 <ZcZYhZbLyzSXX8PU@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZcZYhZbLyzSXX8PU@yury-ThinkPad>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b4661a-9d2f-4ec9-84d4-08dc31d2bef7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAcl3nxncm8RcyOY+sv3AmkLrR2mt1UcBk1IF0zzEzZST4i+CBMtF8vPswKNTgzl9zSMzFI0Jn2+x0VEAQ/uHFB50chIHbPOTVp5o/aD/ME0sxRdaU6GwuEYNoU75Orw6WIqRv4C2rNYm3eRhbBGCMfrJ2e7I6M0vxhwWAOoMnjUAQGgOFeXTxe6zz5JHnbSeViujTOTGeDOV4B5auSX07HjdBu5GCiN6Ygd+qmeCsva33xyli7VJS0X2yGym1ZYywBt76DDX+8elLKj4XypnJN8ZlDKpTQl1CPOu9IK3OPIywp5S1qHAndA4IZU3XrAsswBl6uKyW/XCp3UTjEfULTM1Cas9LrqWvFYOZOUFVox26Nr3jdJVCcYzZVO6mQPw2bJqyGmz7T4RjT/s6eey7qdlh6wAt4TtuAK2C5gFZycfZqRt3JD7C9OsvqOr3K5+T4pr+UxrX5KYyEGb5rZeuCZ0A1EkIAna4ZUmEQooxQxmQk/Tm3BGx4lRSUIklglcRHZyl6+K0lslF6sGZfeHlFrecv88UbmtPE0b5yXRPkoyMognM/HSnj7r7RLhMKS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KW13i16rIvIkgVGPQkR4Lz7I8W1y30GPRRBcqK1fklkxwdLaE8jSI2g4HUj?=
 =?us-ascii?Q?uwf1nAWf4nqEMDV7RHjEChx1qPCGTJ47hOg1NE6+qxv8b9BQtOqoktT7359f?=
 =?us-ascii?Q?QHo4CsWkGFTQYPFQZ0qxs1pM5/LkTm5aUm3yDZXUr8z7yqG/gXozi5LP4ryH?=
 =?us-ascii?Q?eqM8xZ31t8gJZ6TaBvSzJFlCITuku6kcJEXdW/GAYpk/Lyg8v3//izvUVrbX?=
 =?us-ascii?Q?kW8UlBxgZG/gZAcsyMXeXK+YNCB1Y7qfYdMDr48HZpwaf40gEgVhpL3GZ+zX?=
 =?us-ascii?Q?tu92KOMlZNrBME+LuCj1wTbRpJNJM8a/4aXkTbRU6EKnAHFvKCd+xAdQsLML?=
 =?us-ascii?Q?7J04/hlCO61q96+qQl4dmG5MQmzbT1eAiX/8hDqZ5vYDpwFmwTihzFuctckW?=
 =?us-ascii?Q?Roo7XwG2EAQaOweK5IPnrlX6gp0pPGFupS7lbZ6CWmqylmc4VXrncrPNVn7g?=
 =?us-ascii?Q?+HBebw1npfRN/SEhSYIzl3L/3WYBGo3gmvs602OtB4NClKl2BP//sxTvQIbK?=
 =?us-ascii?Q?HrZ7CWcqyBTCWhhBYjCP9zB2fJ9Jz7z+eSqfeq3nEmBqJwtn96FayyZmdzjM?=
 =?us-ascii?Q?OC+nYljZVn/7IckEuH7JORZ88R8dkX8WQc+mo6bsmtUu6iplPHqLb9P3cCeq?=
 =?us-ascii?Q?JB26WrSeNc8cFnmPxJodj+xD3bbC2zaJWuWiccy3x7/0SbD9gixGCeKoDA/y?=
 =?us-ascii?Q?siv2aItEK/Ila/qevxA4neoCEaarCZCIy8mkz9xAiyYTQSTI7vQsGdHx7owF?=
 =?us-ascii?Q?+xml7t8fKEgZwrb0TNIg/I+oUiutndc4/riXB8iCbcX54sVDkZknXYEVuIUW?=
 =?us-ascii?Q?6sDzUCifxNUC3HyzlMmaeZxXqfrOT9PSRTO6IApEFRNBpVgW3B8KrzQk5yBC?=
 =?us-ascii?Q?r4FSJgWxl53x2e31rVoyihdF7yjb7Iwc02I6aMbq6em0FHlcvnAOEr2ivpV9?=
 =?us-ascii?Q?p9kQ0ZW93OWxN39NV6Q7Z+OusNWEhY9WAhpCItcZ0Xj7Ylx/jhylBGHB2pqP?=
 =?us-ascii?Q?9/xYFYoIY7emGXBjXpWx1dV7WPFwZxyt4wHhjH2pUvvAH95pfVBUQuDBJFLP?=
 =?us-ascii?Q?tsCqIYo3GHNp9XI+FMqleVYDqzM3M6BoBfomK/ZX2rMj04AwVFY0zdmt3m/3?=
 =?us-ascii?Q?lT6rRSaMVbFaZZ9bDL0DisEMrWiv2tgjXflLAX0DLkv3w1bZXXQ5WbsLJx0Y?=
 =?us-ascii?Q?kNUl1QVTMfOYtCu4rgaAPASbHrl2cryDxTwPXR8SDIGGUlPmApnLP9wYAh+0?=
 =?us-ascii?Q?Yn5tZ1kRGmVW8iDVqjxr53mTn7KqjSgndSMtDZv3bikNkrdpUQ4PjLXJIzj7?=
 =?us-ascii?Q?1gmYYIXG+xMS6xxbbxNmttDzfLfuCqhYmQduAyJ7OsZ3eTzv/rcb216sn6PI?=
 =?us-ascii?Q?kcvnZT2FaL9rQNi7EFhwKnBaq0dmxiAiUp0hS97mp1KK5ndywSy6gJyHBou1?=
 =?us-ascii?Q?6bbTWLHRd03XlzDY9uO5nMRPkhwpzR36QCKQaeYTwr9if4Pj2f2nZUNPZA/a?=
 =?us-ascii?Q?taK8STmjXPa57b6aFXDKxcZAmTjdGJjROlFj37+VrUISEyoZt2lUkXbo3G9F?=
 =?us-ascii?Q?8Dvz8Dy4MgI7gKUSJId2/qxsQJyExmUBsz8rtCIlBhY75S3YZS7TAyda4UmX?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b4661a-9d2f-4ec9-84d4-08dc31d2bef7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 05:13:59.8098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hybKNB6WpGsLpAbmDTY8dafEeopY1K7jlep9f/lwDSijnfFu29gnHM0LXR0fEQfHW8YeVROET7VjVtRamBGyPgMPeWJSUYDWp80Jkhro2T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 09, 2024 at 08:53:25AM -0800, Yury Norov wrote:
>On Wed, Feb 07, 2024 at 11:45:20PM -0800, Lucas De Marchi wrote:
>> Implement fixed-type BIT() to help drivers add stricter checks, like was
>> done for GENMASK.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>
>So I get v1 from Jan.23 in my mailbox, and this one is v3. Did I miss
>a v2? Anyways, please bear my reviewed-by from v1 for this patch.

Jan 23 was actually the v2 and I missed the subject prefix.

My understanding was that you were going to apply this through some
bitmap tree, but checking MAINTAINERS now it seems there's no git tree
associated.  So I will just add your r-b and merge this through
drm-xe.

thanks
Lucas De Marchi

>
>Thanks,
>Yury
>
>> ---
>>  include/linux/bits.h | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>> index bd56f32de44e..811846ce110e 100644
>> --- a/include/linux/bits.h
>> +++ b/include/linux/bits.h
>> @@ -24,12 +24,16 @@
>>  #define GENMASK_INPUT_CHECK(h, l) \
>>  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>>  		__is_constexpr((l) > (h)), (l) > (h), 0)))
>> +#define BIT_INPUT_CHECK(type, b) \
>> +	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>> +		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
>>  #else
>>  /*
>>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>>   * disable the input check if that is the case.
>>   */
>>  #define GENMASK_INPUT_CHECK(h, l) 0
>> +#define BIT_INPUT_CHECK(type, b) 0
>>  #endif
>>
>>  /*
>> @@ -54,4 +58,17 @@
>>  #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>>  #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>>
>> +/*
>> + * Fixed-type variants of BIT(), with additional checks like __GENMASK().  The
>> + * following examples generate compiler warnings due to shift-count-overflow:
>> + *
>> + * - BIT_U8(8)
>> + * - BIT_U32(-1)
>> + * - BIT_U32(40)
>> + */
>> +#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
>> +#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
>> +#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
>> +#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
>> +
>>  #endif	/* __LINUX_BITS_H */
>> --
>> 2.43.0
