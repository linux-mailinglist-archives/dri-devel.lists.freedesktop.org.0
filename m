Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5887EA11
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 14:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502A010F72E;
	Mon, 18 Mar 2024 13:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TW418WpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BC010E3CD;
 Mon, 18 Mar 2024 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710768495; x=1742304495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mYzRc/PAjGXlRZmabQoR+RuBUyZTqWQckp8LeWhqcYg=;
 b=TW418WpW2IsgZfQe2yqgiXdhQnKi3xob98Ymln5Wf+Ex6O1vJ7hKbfM6
 xsF0C8N0ip5eXdX9LEMH6uX1PhfrckuQnSd64qwJzBhBI1GC+HM/DKJMv
 5Ngxx6bqrwm1FB4jckSAYpx4nRMpj84hjXIIK+J8xBhIO+eiANWMxasgj
 BKf9A23PzDl8Ff7GtnFMoIU18QprPjinNNXd9ycg27WwizXfwF2NGR7xx
 88/sloCUODWrHA/Vywv/mU2h3Q6+xECxRk3UQ8WhkXdVo1Lsh0U6lRa8g
 w+QhhVo7iebIuT3zuhd2nhLgjawRHmxVb3Agso99hhyxeuVt2Y+VOa10/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5440817"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5440817"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18182668"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 06:28:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 06:28:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 06:28:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 06:28:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 06:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9MDh20HiQEVi1z7MtByZHGXexgmtPfIe06ViujQvdB5D244RjcqoKDrpPatO5T4IozeBM3kLbB/jOcuIaLtvfOLf23p3mIM0dlpEHf9lgg+68MIxS3ORGNYfuCCnGx0o0tl4ZJBThcUIF0PLjIyh5udIi77JQ70B5NVmyCd4ZOcWfvwlBuMaPUAO5OIZWen/vufgVufaHcpiiakICHq2YHN2thWHMBtUUBTNgufB7tkSeJzkDqmUE19I1RRuMhilMPkeINVwM+ujGkp4G3WvALcv0hwNL6f/CznMFHyvqWRUV0uPzVJBdop652LX7S/PQVdZJTzxTufSytYNyKoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdQV5H3oGwU4RUrzfKuLC2c6Nuu1JjdKfqDim3eK6Kk=;
 b=SIoJ8aZgpVTJpwRgeyt9u40siB0JDCTJ+R4D5o9NY6ircPPk9cdrIohXcEmNmGkXh4I00hohg4QrXe27zajaoi+noHWn8h7jLeo4vlP09FsvoDLtFR2GE17MNAAmXcX0OlnXI4k6GbT6NltmpHIcDS6qkyM4qIF7yHR08arwvzZkZYqH6gvbKhUwnqQUlfYhc4VA6qfdwdTAQViNhLBPLbi5mOkLvpoCcHmy95BrJwfdfTIX7qg/49egHdvhbEjLVF7K7aZhVKdcWVhfqxNlNr7G4CgC4tJHjutpE478mWhe41x1I2sjC4T7TWNq9NseqzjSPmBrHlr1qkQCzQUZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6680.namprd11.prod.outlook.com (2603:10b6:806:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 13:28:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 13:28:09 +0000
Date: Mon, 18 Mar 2024 08:28:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>, <airlied@gmail.com>
Subject: Re: [v3,5/5] drm/xe: Enable 32bits build
Message-ID: <qm5q44hs7vmq6erio7ome323xemwrg5mrxhaozkwblf6qjjvow@dqwy2oz2rrrj>
References: <20240119001612.2991381-6-lucas.demarchi@intel.com>
 <d53d2da5-22de-4f81-9fbc-2f54e5da9ac6@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d53d2da5-22de-4f81-9fbc-2f54e5da9ac6@roeck-us.net>
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ca1b30-c832-44af-551e-08dc474f40d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UpJnmeyp3gJsbgvomP3vJ2xawqdsBqtUrL3NwFeu8s9L1WLUAr26xV1uoGnMlpJzAuJ9e9bS5ZZIbCGnmWNMyAAEroXwDqRR+TTcnktOw61IeGTW56SYzZtNypp4J+ZSsKnhYNcl11D2RRxg4f4LpxqzyDfdF5ClA7EluD6knnm53DWxgXlnhCwEvtJFn1xU3zX7AFEKwDaOUzSkgsNkH72gompjkEhSZzCplKChmoAGoEkRXx63fTLGjUdaKfIvx30ZnGnJJXh36amg+VLoA/6pbGSKDSdL6AXuoth715okLyFHypgMCcLBQeHExjcQu3/SgeLtH0nWhgj00WfT0/r4ylqKUpFs6H0hnYxA4FSMsNu90VqlEw3DlmARrskZvLyHh2aLQyzRttncYMaLxi4YVHP2dLRE7sbphmzoI+emXKSjpRhkzSe1D+PYa2h2djSEjcz2iydc3os3oPYbTi3YfJkPU8FXqhagTNtiqY09QaERpkd0KywyoomsLwbnf+IgaV7xb7qfNfnEBiTyHhyxvdXQgidjdPy8bZgxEPE7+S+Qku6gqGenSckdC0uMaKNDlx2L+Eo82xPQP32p9qa65ziEyqvgNp+eLFE+q8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3h+y9WQEOcGBH/JybCPCWiVreLw3/vMGxwTG9Aqken41ltH/tf9Vi32Cbgzd?=
 =?us-ascii?Q?VIhVVT14UzWdqQhSwspcmaHysnWqcMZxU/v5+S5c16+OFnuxdHdpSTQiPXOJ?=
 =?us-ascii?Q?TDV9mNM1zB6NPahGeEiUMi2KYihHNMdKmvA+NCzuuIUVPjN97BCQpVbv5xf4?=
 =?us-ascii?Q?UvRQmIdjRjdUKIm7WBoT+gHjzehXNGnGxWrlhtQ1h2SZ0HSiJNiMM0CmgOHd?=
 =?us-ascii?Q?zWlmVlVFJ8EMNDu3syw0D57BlOiZ8WhvU0ZWAdRbWOUUHuF4R+YccsMTYEEn?=
 =?us-ascii?Q?ut2ajDrGjfWMLrUS4M3mYFn2KvnOUFScLWqocELxmVJKsIx164k+BoNBghS9?=
 =?us-ascii?Q?+TAfcO7TcqMy++4JDKWXwhCHKA2vUQStFYEiXdADvvAdDNY7eWHTLlQsT9ju?=
 =?us-ascii?Q?dE53NmCn3mhgzVd65i7a834uSVa9v/MNvZrphKgAhURJYJkizviIzt9CBbeg?=
 =?us-ascii?Q?ncLvHkLRcN+6Dca9qjohRvIDHATb745Z/rEE9Y8ervObe1HbQbQqu45tKZ4S?=
 =?us-ascii?Q?3wSYPUJqaoKfnWum1tktL1XVjtg8LEDBq8IKeDutLtOgpm9gL4TXdr3K+gTb?=
 =?us-ascii?Q?6i3fO2H6IAvD3jZbeft6L6uxNwShCGipjcm+CDnrh0vaY285vyZykqcWWqDZ?=
 =?us-ascii?Q?dwxLaNVkL5l6xTyg/kh8P86tyBpW2qxHWg2AVHhrq3aXGcs9WErsvSWPZbkp?=
 =?us-ascii?Q?gg6oZY1ax7bZlxbx/6drzHpBQL+r/DHNjjzQONhhU5nLqbuUPlX3OwFM0JVT?=
 =?us-ascii?Q?3lyMqLbYV5I6Fb9QodZpkOaU9PDuk5Gm3JUCGCFMXzZg7rEzY1fFyLPOiTsv?=
 =?us-ascii?Q?JmfKiGVtWpK7STZHNcfXiMcEWpbdG6n++Zm6EwX8FQ9on78dJuCqRGAamgMY?=
 =?us-ascii?Q?9o7s10NcMDwyYAIymVplxai6K3veTS/6j+q3i9r9re4UkBNV+cPXKf3bOebc?=
 =?us-ascii?Q?ZinGzQMIECuu/WqPHFCl4+1Qa3j0DJHALDhqfuNr3sjLs3dB5wy7YbjKAhnO?=
 =?us-ascii?Q?qW2LSFQ4TktCuewYK4y8w+9AOISHiDB+GTwByDk64Di1U/ElUSpjk3edohGu?=
 =?us-ascii?Q?/gN0CSpKp8chd8IBVCYK1IfyvOHeqCAIq2M6Oh5OF9vqYKiNEspQX+Ow5of5?=
 =?us-ascii?Q?2o0wdBnA8wSgw8UH5xzLMiArFv9YCi4MjcDZy6NKzvBJQd1bvP+3k5Jh86Cd?=
 =?us-ascii?Q?2Z0KfeVNOySwwHR6ADl0gOLFR3JANtqfSpNXL6EfIKqY7Kq8OMDvFIzhG0uM?=
 =?us-ascii?Q?/qdTCHeNYgaAjs4ZYUDDDz00uqgp6g1vnoCLongYNiOyvSiw6rfSMLceLmHE?=
 =?us-ascii?Q?KNntvAjilAjToUujnHnI3jaiBK3wYO0FsUcUR482APWvSfD4vQ98IznTeGgZ?=
 =?us-ascii?Q?IVvlnJS3NEr0sO34TzEoDBbLnGWGzgLVNsPLigveF2rWZNXvAzILye7UxlLJ?=
 =?us-ascii?Q?omQ1mGTYrXSDrXJ5Oo8Z1qWA8jz2/8GCkJYWztL3gkLQT6joNtB0MoWYD1tT?=
 =?us-ascii?Q?aA/48D1MIQgBUBtZT2kVYj8PRp8Y0BotEjFHw0yXA0e1V2uBq25Gih/O2vt4?=
 =?us-ascii?Q?BsdsTMAsTo4JoIpL/fCETMNELkoxhg0vvE6WJ6vexyXNj7ev27e+QEtjnnIZ?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ca1b30-c832-44af-551e-08dc474f40d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 13:28:09.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KT2CnVOR5asbhF2+fQdYWfhxXoIbJDGTHoQyW/gel8RwktWvsAQG96unGpx893JDbLOyYvdmG0Pp/rnALWmlbCeXu33L0pz3tY5r3Yb0o44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6680
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

On Sun, Mar 17, 2024 at 09:14:14AM -0700, Guenter Roeck wrote:
>Hi,
>
>On Thu, Jan 18, 2024 at 04:16:12PM -0800, Lucas De Marchi wrote:
>> Now that all the issues with 32bits are fixed, enable it again.
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 1b57ae38210d..1b0ef91a5d2c 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -1,7 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_XE
>>  	tristate "Intel Xe Graphics"
>> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
>> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>
>I am curious about changes like this. Enabling 32-bit builds results in
>build failures for mips_allmodconfig because the driver redefines END.
>END is also used as macro in assembler code, the define happens to be
>included for mips builds, and it would be difficult to change it there.
>
>Unlike the i915 code, DRM_XE is not marked as depending on x86. This means
>it will be built for pretty much all "allmodconfig" builds for all
>architectures. Yet, there have been recent complaints about "allmodconfig"
>builds of drm code causing build failures on "oddball" architectures.
>Is there an assumption that DRM_XE (or DRM in general) is manually
>excluded from all architectures where it fails to build ? If so, would

for all the reports we've been receiving we fixed the build and improved
CI to try to avoid the regressions. DRM_XE doesn't really depend on x86,
but I see your point of filtering out the "oddball architectures" or just
expose the ones we know it builds against. Yet, I don't see that
approach done in the wild in other drivers. At least on the build side, we
constantly check the reports from lkp like

https://lore.kernel.org/all/202403152008.KlwyYggO-lkp@intel.com/

which also includes mips:

	mips                              allnoconfig   gcc
	mips                             allyesconfig   gcc

is that not sufficient? allyesconfig should be covering it afaics

>it be possible to mark DRM_XE (and/or DRM in general) as depending on

+dri-devel and maintainers for the "DRM in general" part

Lucas De Marchi

>architectures where it is supported ? Maintaining a set of exclusions
>in test builds does not really scale, after all.
>
>Thanks,
>Guenter
