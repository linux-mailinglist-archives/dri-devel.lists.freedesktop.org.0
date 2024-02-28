Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167DE86BC43
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 00:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588C910E117;
	Wed, 28 Feb 2024 23:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/PrZj4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A4210E0B9;
 Wed, 28 Feb 2024 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709163569; x=1740699569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FdpSF3mA33YrKVZ0sIHZoDi2dMkptRNqMXoWmRpa1fE=;
 b=a/PrZj4q4Kze9MSbpeFOuBsxsJYUq0Em/oPzBAL1LlFEiQTCirAxqEl2
 GA7JbsJnnOgA5wOkkhaDeujPxbVZhOojL9VBECiham+bCg4B7pKJbnn4s
 rSEZfzJpcNybwdSei5u9BWvD11uCbl9BUn8sR91HwIdu9W0+0PwCTtl+B
 VjxvEjD5Q+qP5ccx3E7H5+1H2c4+y8iYrH9fNmEuGVxRcvOnI/D8L9Oys
 l+v4PswxWAYQaT8pC3NFhfooXrnhH1H42bzGYfay6rj3Mz+cwz3QtDbev
 TgeeASAQTY4Xc06y+gFMHa/XNBs1qqYlSq+Wxp+kd/qrRm8EGr2QFSzgA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7420538"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7420538"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 15:39:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="12173853"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 15:39:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 15:39:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 15:39:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 15:39:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 15:39:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itoNmKvBsFbdKVz4q5xmYijPd583QPn631Wd/z8zi+lHpitUHwKAB5YD7crNwxgclvUgSZWvRgN15ShErGUXcgFSKGKwk2ZwRWlWVM3ojGDdukoxk03V6pL24zgY7Kq5RasZkJdB8i5cCCoVnFebzpANjaM+AsTte1OXPSqG4l8hH9UFkjnxCYCtkqjj+hRLnki1g5RqPSSTO2YtIgrIzukMME2WfP9fRzhXi1reCf65Se5koEpeYpRZm9nCmRDF/9x/4pdU9E9J7jtzK+OrguZHM51UOPONwEqNhGvy5T4asdkp0mglMoAvfFrnVOr3tP3/qC8vWJ/UNAlLWkNxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MIx0LmLU1ai9jv9CNlEDqa5zy7YM1Fdcu3yosxIwWk=;
 b=aNuMPfx8Huimc1tVZwBS5/9Qn4w8k2hiWtYtjayy/hDG0F4nQPRT1HcPqXJGLw4b9rO8NvrAdGxEytSm0gZANlL9IEp3Ckvo+YZQlLGvd/y6s1v1Ue3cFh6UjDOuzN3Y8rP5qYMvJjLCdoeHCxirEC2BcbIYdmZ3FruQ6ecuJguk49ufffomwxBB0HKI7DJ005gXt/wzX/3HZkXz98HqVWVqbjMpy3FLhtaklUtJP9Fgxc0WezPMy/CS1rUb8NJ3ojxBbeJh3y8/wu9sp5UjCm3AcIvg1TYHSDT12bp7gl+3/EORq1ogFEu9gJGEHwjreGZCoC/BZWoMVrd3TUTDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 23:39:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 23:39:24 +0000
Date: Wed, 28 Feb 2024 17:39:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZddfF7kb54o2c/QR@yury-ThinkPad>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df533cd-d098-4dc8-9013-08dc38b67ec5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/B1BOzQXnKdNIlwq0egx0qWfs1f0fRVyIIc6jKIyx+nIMpNc1ucqC/JdtBOmQEylBsG15S4txQWljGGrmpyNO60Zn+zccVdaL35fb0Cf7MrKJtRC9bJy3EPlJhhpOPjXckJquslXsniJXfELFFO8tHJWevDeW1BI3+nfY+cGpsQRL9xE9O0duwT97PFKALuZr5xeZ4EahnIoI3cWA5xW9U/Vd7RQXA/EgHOmJCbzFqc4jwDOeS7x7dfqAvRhLOEF7bU70/R8Ugz+kI5ab3M6Ek33zCBGB4INGoeAWYQ7TXEuDWWOHRc6L+rgFHeDUAHAYq4cOJOdlH3j57d0yywPY0ShEg5bNT5sSdqCu9qOMv3+iC+rJGHCgswVORNxkYhzJENn5n2Hryu+8QLMlG99EJ/yq0XJi7MMD5R9Nc+CDJ6NOgHb3cNCvkIfqjrWHnVi/QjVCY75BxRgaoO3jo8uWsicRxFLtL6HSKTT2/GU7pDpH0z4XdoF3IlVGhqSXMXr5ZK7AlHGnRD5Kf30AEd4S7h7zLYR1z7rND1ZzcS4NXNgHgUqZ2/mNY4qy86MRXoC+KFm58dzlqUjscraqeyYY17m+7L1S6VpmXTemWEwrb4811R+1U3EtWMsZoebDWRQp8/mPTG6Rttt1zKqf6JfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dbt+y6tqBG3Q0wGaIQLNHRFd0d8T5rQGNXuBvIG0whgB+F+POKKYKtGLyPlZ?=
 =?us-ascii?Q?wGkPKXfwVZk+i++waMcD4lXRdahQvtXSoPqkf5ZKr0/0b5KpXHfY7lH3RnP8?=
 =?us-ascii?Q?lPvgonNrdUcYP7+9YwhQFyn0DgJNSiMWVwcUSk6VNMCvX7eqKzyVw6NS5TG6?=
 =?us-ascii?Q?5rXJ4udoJsblgKpbgupnFh1q0OOjB7Vra984wx1rQHUubk1Rrg3Tdtr95sxd?=
 =?us-ascii?Q?ispS2+nR+ST9sZhbQNHLUYU94eXTvfif9wdd0DuQh6SVN6UKR/fgCy8ZKHPJ?=
 =?us-ascii?Q?Xv6vHvK4h1MLrSV77lqyuF8YTV/iSwxkFRX0TX//rWPeMZ9CTNGO1s2UAkD+?=
 =?us-ascii?Q?3LIXaX2JZVgJRj7nUs0iRzGue9KZnSVY7duFwbgEq9VMzY5Tiy1DaKyzwv7w?=
 =?us-ascii?Q?vJSdurqKqNodBaxGvB7X8wPXLGnXl/rlaLp+iJccPH1WyYpkoyEyprMwViNj?=
 =?us-ascii?Q?QOduYIYS5YNDatT1PgCtBhK+dvViefMjr9TG9K3PqY3DLdR0pejWv75kND1d?=
 =?us-ascii?Q?oblncmFGnLWvrsDftitDbNDPIs5orOvA15y/dW/gEdxh6Cx8L+GTcneN1sLu?=
 =?us-ascii?Q?qSnnKrmqHcAA1P9etgttd+GNQ/JyeZeYQ6hL5bkFwEdgfCjMACWrpPINiwUQ?=
 =?us-ascii?Q?a/n427+VPs40FesqHcTu5h3nK7lteeUoV4nGCkY5tSKIDkn2sPmgGDrgZqt8?=
 =?us-ascii?Q?CncNtZcCSEF/DsWwb6YW2dYn3OyheXG9WqpnrqVKyDi3rJl8x+M5+byKnfij?=
 =?us-ascii?Q?bdviPvKhaMb0Lg8DrZRniwDBZ9XyqkBGLnSdeMEqXSpL+oClTcFIcz0dpHKl?=
 =?us-ascii?Q?R5LcMBS+BY35Frz7ztivVnG3dgKM6DrdehwJ5a2wpl/Juv8E1CFPLD2CfKCv?=
 =?us-ascii?Q?k91QikCILxb+2sqIWyS7wm7YLMJCF/tv/fZl523KAQmpc7VW2aTsfaYy8x3E?=
 =?us-ascii?Q?kbsywoyfTbs9nsSv1dc0K14jD0iqUbKFy1GLzK//fDDm5EORwM7TWxMVFIyb?=
 =?us-ascii?Q?U2Oh78vkRCY+SSe4Egl2TWUaWOpxJeqEjNMWPMwEtB/lzVoglKGQL8JLK8nk?=
 =?us-ascii?Q?+jPL1pq5Y3Nr58ojyF+n/wFGAF01eJtYhhcpsMwnzXW52QGo0VN1J//KqyLu?=
 =?us-ascii?Q?gQ4oxaDW0/e0MP1yjOBPwrl16RWnna/AqMkPdRl4GUhJ430SrxtmUXNv7zzs?=
 =?us-ascii?Q?PlPCye+dLVeoJeTaPcuHH7C82WTuC/E7nx0SuEu10kLBJusoUJkuv75X97qf?=
 =?us-ascii?Q?uaUkd7ncfqRNAfnVn7W0ULxilv6g618s3GT4GA/T2XAB7q+kr7eJfEglXckv?=
 =?us-ascii?Q?/JI1pTWQ8yNVQWcWo/2oPgQZbMYkd8GRyuB5canW7AY1DDYyj/CJDxiBQC4c?=
 =?us-ascii?Q?Wc9NtkS30GwY1DjvqXU41x9guNjS0t0L1Ysn/OVGeo1m5vxeaEIldCGD4hPJ?=
 =?us-ascii?Q?W0LnB2wtqxeIOr1EdnJ/kHrwguXGSXDje9zjS3JfPvBTWNbdFtj1AxYEvTGm?=
 =?us-ascii?Q?4+T7bSy4vLLkI6BH7WnyiRetemN6Q9NPNvRVUf92m6zgmFevLQmH+JuXb9k/?=
 =?us-ascii?Q?5K/xJaq24jWwT8h0Xlv64IbhvKd+Gqy4SJTBHXE89VeYg2X8WG4XrpTIZtYB?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df533cd-d098-4dc8-9013-08dc38b67ec5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 23:39:24.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvHKny9rKTXSyuL8LLBw4TEGA4X5/WslLfo4W71ReyrBCzdvq4txcTcrm44EPBeTEhUvbM3exPrvHL0t2tyIBnlCGJFd+LXaGjYBDNJwtKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
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

On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
>On Wed, Feb 21, 2024 at 03:59:06PM -0600, Lucas De Marchi wrote:
>> On Wed, Feb 21, 2024 at 11:04:22PM +0200, Andy Shevchenko wrote:
>> > On Wed, Feb 21, 2024 at 10:30:02PM +0200, Dmitry Baryshkov wrote:
>> > > On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> >
>> > ...
>> >
>> > > > +#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
>> >
>> > Can sizeof() be used in assembly?
>> >
>> > ...
>> >
>> > > > -#define __GENMASK(h, l) \
>> > > > -       (((~UL(0)) - (UL(1) << (l)) + 1) & \
>> > > > -        (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
>> > > > -#define GENMASK(h, l) \
>> > > > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>> >
>> > > > +#define __GENMASK(t, h, l) \
>> > > > +       (GENMASK_INPUT_CHECK(h, l) + \
>> > > > +        (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>> > > > +        ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
>> >
>> > Nevertheless, the use ~0ULL is not proper assembly, this broke initial
>> > implementation using UL() / ULL().
>>
>> indeed.
>>
>> >
>> >
>> > > > -#define __GENMASK_ULL(h, l) \
>> > > > -       (((~ULL(0)) - (ULL(1) << (l)) + 1) & \
>> > > > -        (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>> > > > -#define GENMASK_ULL(h, l) \
>> > > > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>> >
>> > Ditto.
>>
>> problem here seems actually because of the cast to the final type. My
>> previous impl was avoiding that, but was too verbose compared to this.
>>
>> I will look at reverting this.
>>
>> Lucas De Marchi
>
>The fix is quite straightforward. Can you consider the following
>patch? I tested it for C and x86_64 asm parts, and it compiles well.
>
>Thanks,
>Yury
>
>From 78b2887eea26f208aac50ae283ba9a4d062bb997 Mon Sep 17 00:00:00 2001
>From: Yury Norov <yury.norov@gmail.com>
>Date: Wed, 7 Feb 2024 23:45:19 -0800
>Subject: [PATCH v2] bits: introduce fixed-type GENMASKs
>
>Generalize __GENMASK() to support different types, and implement
>fixed-types versions of GENMASK() based on it. The fixed-type version
>allows more strict checks to the min/max values accepted, which is
>useful for defining registers like implemented by i915 and xe drivers
>with their REG_GENMASK*() macros.
>
>The strict checks rely on shift-count-overflow compiler check to
>fail the build if a number outside of the range allowed is passed.
>Example:
>
>	#define FOO_MASK GENMASK_U32(33, 4)
>
>will generate a warning like:
>
>	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
>	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>	      |                               ^~
>
>CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>	
>Signed-off-by: Yury Norov <yury.norov@gmail.com>
>Acked-by: Jani Nikula <jani.nikula@intel.com>
>Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I build-tested this in x86-64, x86-32 and arm64. I didn't like much the
need to fork the __GENMASK() implementation on the 2 sides of the ifdef
since I think the GENMASK_INPUT_CHECK() should be the one covering the
input checks. However to make it common we'd need to solve 2 problems:
the casts and the sizeof. The sizeof can be passed as arg to
__GENMASK(), however the casts I think would need a __CAST_U8(x)
or the like and sprinkle it everywhere, which would hurt readability.
Not pretty. Or go back to the original submission and make it less
horrible :-/

>
>---
> include/linux/bitops.h |  1 -
> include/linux/bits.h   | 41 ++++++++++++++++++++++++++++-------------
> 2 files changed, 28 insertions(+), 14 deletions(-)
>
>diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>index 2ba557e067fe..1db50c69cfdb 100644
>--- a/include/linux/bitops.h
>+++ b/include/linux/bitops.h
>@@ -15,7 +15,6 @@
> #  define aligned_byte_mask(n) (~0xffUL << (BITS_PER_LONG - 8 - 8*(n)))
> #endif
>
>-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
> #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
> #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
> #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
>diff --git a/include/linux/bits.h b/include/linux/bits.h
>index 7c0cf5031abe..f3cf8d5f2b55 100644
>--- a/include/linux/bits.h
>+++ b/include/linux/bits.h
>@@ -6,6 +6,8 @@
> #include <vdso/bits.h>
> #include <asm/bitsperlong.h>
>
>+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>+
> #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
> #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
> #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
>@@ -22,24 +24,37 @@
> #define GENMASK_INPUT_CHECK(h, l) \
> 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> 		__is_constexpr((l) > (h)), (l) > (h), 0)))
>+#define __GENMASK(t, h, l) \
>+	(GENMASK_INPUT_CHECK(h, l) + \
>+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
> #else
> /*
>- * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>- * disable the input check if that is the case.
>+ * BUILD_BUG_ON_ZERO is not available in h files included from asm files.
>+ * Similarly, assembler lacks for C types. So no parameters check in asm.
>+ * It's users' responsibility to provide bitranges within a machine word
>+ * boundaries.
>  */
> #define GENMASK_INPUT_CHECK(h, l) 0
>+#define __GENMASK(t, h, l) \
>+	((~0 - (1 << (l)) + 1) & (~0 >> (BITS_PER_LONG - 1 - (h))))

humn... this builds, but does it work if GENMASK_ULL() is used in
assembly? That BITS_PER_LONG does not match the type width.

Lucas De Marchi

> #endif
>
>-#define __GENMASK(h, l) \
>-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
>-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
>-#define GENMASK(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>-
>-#define __GENMASK_ULL(h, l) \
>-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
>-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>-#define GENMASK_ULL(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>+/*
>+ * Generate a mask for the specified type @t. Additional checks are made to
>+ * guarantee the value returned fits in that type, relying on
>+ * shift-count-overflow compiler check to detect incompatible arguments.
>+ * For example, all these create build errors or warnings:
>+ *
>+ * - GENMASK(15, 20): wrong argument order
>+ * - GENMASK(72, 15): doesn't fit unsigned long
>+ * - GENMASK_U32(33, 15): doesn't fit in a u32
>+ */
>+#define GENMASK(h, l)		__GENMASK(unsigned long,  h, l)
>+#define GENMASK_ULL(h, l)	__GENMASK(unsigned long long, h, l)
>+#define GENMASK_U8(h, l)	__GENMASK(u8,  h, l)
>+#define GENMASK_U16(h, l)	__GENMASK(u16, h, l)
>+#define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>+#define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>
> #endif	/* __LINUX_BITS_H */
>-- 
>2.40.1
>
