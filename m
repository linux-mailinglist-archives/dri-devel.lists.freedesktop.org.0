Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7805C85EB77
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F2510E2AF;
	Wed, 21 Feb 2024 21:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZpwq1Bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3C10E2AF;
 Wed, 21 Feb 2024 21:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708552753; x=1740088753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+lKyxplhkfn2ludHMlsltaV7SU+tYIWQAS4xHplhPC8=;
 b=fZpwq1Bft5EEYk8kqaIEC//YDMjreJzw1xAfb1dUXuMD7XES57KjG++n
 uwZYX5mE6J3wQsRqo3V1ed7CK9tHIsC3YivSe+gpqby/VCch8OQMwr1b0
 p9zxiOXdYG+r+5jqAbyJBsHwedmAxo/qZ6AVa6HpvYVIsuMBYJRQs1Piv
 GOor3H1sIzQOuv8rRiu5ywFD7UZl3RZwW8SDXvceAl/sOLVeo2tSEZVPP
 dvQk0SL+Tro4Y7Gr7vfS7RwEb2iy1dIuRiMppXZ3nHwHmnD96rXVgNPmA
 4kuDepFJF/s9Ui8/TldcJoPTn/qh2dar8sVt49uCiSvWxC1g0HN8D7/cV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2614186"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2614186"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:59:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="36062088"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 13:59:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 13:59:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 13:59:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 13:59:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 13:59:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqAQXAgwEV4oAMtwS3FQh2S4Mnk/QKmai7imf2ScGWrGcV+xId4em16hTRA/+EeQJrU1IPxv7SswtkIqirTDXszr4PmQD3PhI5xt8/RlwQum5QqhuOtREM6QeUL3ftD81ehb2hCHi3ZmHTaPLMcM6My8949ZTNuFxuY5uqKCTf6yuUb++JOcPJcH1sjBjPuoDoNNd2Nga3rkmoro5LktOk39FJmgSA4+4t9gL0YFJRSDOoOX7Iei/DLspUiSG/oC3k3yFT4FeEKPWm2krDVA4WG0MziSRfjGclKYhx3Ac0dhBlHY0qW7HfABMBDkN6uBREvRcXvtz1e8k1IzTvJuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1whcz++vsgADkqWJHDuQFbC0PC/jVC270cQDadCjjBs=;
 b=TAaXfPqWnlhj9LjQQf2ugZMEW62aKLOuvwluwqhApxf6vLUY5kKasyS/FgHNAI7sdoRZXW58vk3GjK7oo4UiArr3Ghvm24988DXdOwSpDpZcogqpLXULPwBcFPe/Hl2/IlvQs9VY2bv6gMsDD5piKJxqiZB6GHyKfUzaDz6fxmk0v+bQkEKg5piUyQWkmpBe2ODqwSyKMb4F4gxhsdGeRNsUQY7QVb86TUlGg04zODP7Lz+PTDdzTyMUPqyRZ12nB/rllZcyhUVGJ4XY8k2PLXhPeEy7Q89IsimlcZe0BZMKN2bBYvt/Ni5U0bP7G8gf4L7w2M/cLOPiZT/EOzDesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8419.namprd11.prod.outlook.com (2603:10b6:208:48b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 21:59:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 21:59:08 +0000
Date: Wed, 21 Feb 2024 15:59:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Yury Norov
 <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fb31bf-1282-44d2-23f9-08dc33285441
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCLwKQEc6nGTi1ja6H+G0t+OAD3D5R17fJeDlldyCMmNxQnhbp7wRv8u+4DJaN+7/cL+x9xEa/dqvfpTOWlGkFIImsc0Sg5M25RUsZGY6Gk9JddNDKpifut0D9SA+bw9cpQQ00GU7YE8y31/Vs7XwNeg1I+Rgt/8whQWRK099XRF4WdKDWLMhsUfnThTczg/ppz5LaQEtM45t6DjKqDrjpOhQ/uY0vjXKSShEZVt9tUjzJOF7aU1/629klkh59QWYUohrO5wDwCx+zIz9OYp7b9jDO0z3UQ5vvgkKPGdcDwSQmNv4tRvmzHMRNleP5CVUbdItVSAAX7i8I8u+WljtzpWJ2ZqfEJPp+C679UxXgZSGbnAV4Gz3O6DXQ4svPxXHQN17Z1ZbcPNj72daalNDfLHcVVRWWGMkhsDBOqJuNubMVSGGwOEgGo0kdAhmT8Y/cI01Q9xePtfys4wWnoqpmx8AJWLUsvpCaX0PqmBY0Dj4wu0j7Qo7nDewhBD/2vABNh+aY+qfhatKI3DBzCBVP2cSU05sV5L4ZSYAvqsf/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t0+hVZM9O7bpkrVjANFHZn/+6adcSG8sGsxw/Wy/siSoMlXYJViHB3E7hd/G?=
 =?us-ascii?Q?CkHYFZUHzWZeFDADan63nICD06B7VmnmQegMHU355wmjNAJTWaJK4qySZaJI?=
 =?us-ascii?Q?E2x/Uo19XJpf8ldG7F494ZTcwtqlw60vSOJWSjR6xhF88NOV5WTA5/MTx1nD?=
 =?us-ascii?Q?61daJ8w6vFCCU0ZmQ4kBWTkA5x3NBcmgVSkwuttyytbSOr86n82GeTBKTaNO?=
 =?us-ascii?Q?uR5z3cP8LirIXLcPiKcqI/78pkFjMcTDeiuT8wQ9txUNYtI1484qxpCRyX1e?=
 =?us-ascii?Q?4iH9jiwccoh2yy2a7ZI5pB/nNw2Y4NgMljYa0zwnM10YytHc4Ol00zql3RZk?=
 =?us-ascii?Q?7Ep8ipZI+uz9KdYzETm0lhMOqJgzIDK7xagHDPAiOCHcNd0YvmC1sjlILzhR?=
 =?us-ascii?Q?h0uYQobXZ4Bx6TlnYke6IxshHf13KKDoLoH9tGfm0GYG2lI0ffavV7pnxJrW?=
 =?us-ascii?Q?07Gn1Cb+FE59V9LlWvv+4NCd9YuEMIkdHrdceKG1YIE8Q20pyHzkfsx4XtNb?=
 =?us-ascii?Q?G3S20QEBj/k/SD7FzIsqwdhki2OnN7j3WYcaIKJBxOQ8WCPHp/LZuwhLMyUe?=
 =?us-ascii?Q?KxlAAaqP80SIycC0LVUDZn4Fiej6WCNjBR5wEZveNcwcM779q1FNyWbEZ2sC?=
 =?us-ascii?Q?nOaT9SjULfSF1RV68AaQSO3P++h1M/YKx1MHksAPeAfvQqEzx7DS9zyPeOUv?=
 =?us-ascii?Q?gTTWp/UShx0A4ANBMLtEj2HBqUJFjvKmzjBwzgFh5gLwGC/XV7bBC8Ky6TRg?=
 =?us-ascii?Q?m74S0zVuQ+SPLQdh8hIKmi0DZhfaZt2KiWdjCZXyzfKIym/KvXzMntacVX1Z?=
 =?us-ascii?Q?AXVoUR7kRMHUVfQxtplDBRY9RmVAW4seZrohYa5DLTpyNe1v2k43i/goI6qV?=
 =?us-ascii?Q?z5zaCCfXiSrq0xAM926c7o7UxbpdBXOoK4pQyImvKIlo/OSh/ylRNXqwNNTg?=
 =?us-ascii?Q?83OFMim50TwVPUjp//VGB/jMyi4oocKT8WF1pZWA/FmsLxQdpwpUmnjWKHTU?=
 =?us-ascii?Q?pdkI72nfSt/Uck8SintMeSZmTwma2jJvL4IvRdiJL+NzvFT6ZpeeQ9js599l?=
 =?us-ascii?Q?DtF15V5RCSyGxGBg47mIzOCk+v9x8H19guFBaFvB5VeeASnX1LQxP/7fDukF?=
 =?us-ascii?Q?zK9cFqNeFv7nTz/k7g6l+84fgsMNIOGdHfeRblMD1GruPYNC/mKLY75vrOdU?=
 =?us-ascii?Q?eEEFMqRHYgB9dIMbTj1u29rvK5lh7+vFmW/n1qrb9gK0TqpjXjGPbb7ojUAk?=
 =?us-ascii?Q?YRxQ+OHS/fK99j2Dqttaq4qr2X3AZIGIxEojj+Y45+UzM1CuTmXH75AlTbeH?=
 =?us-ascii?Q?vkJEtNuJAELEuTgyuzsxa42Bziip9e5JFMURZ6gri/IPLuW/NE7AwpL0OTq0?=
 =?us-ascii?Q?1Jpdy96lk3WwsCbM99Me1uoQVfxy4QDYHAxQbYWzw7j0pIuuG30+wGGyLEta?=
 =?us-ascii?Q?tm7qF1YR36TeuaZvTDa9EyGSPMt0HkyGgWEutA50JMnS0jzNmlZfVAFDkx3g?=
 =?us-ascii?Q?86GyLgAo6YBUA+LzhoI3RyLMWF+JiJo0k4WB7UrLBN0/FvXpRobdcc34RIht?=
 =?us-ascii?Q?S9dETvTqjjwRJQH20neOsOtJUHqhE4ps2LogpGA6PcAIa/Wzj8UeBY/tVL2s?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fb31bf-1282-44d2-23f9-08dc33285441
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 21:59:08.6558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y5PGFW1l7rzE8x6TEP0NvHisQvIXTwMs0G3jeGnx4Itm0qMykNVA0IfiJ42TqOkXPJd0lZvxIGQs34zmfroY2Soe/0f3ydLhnr1qW1CyFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8419
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

On Wed, Feb 21, 2024 at 11:04:22PM +0200, Andy Shevchenko wrote:
>On Wed, Feb 21, 2024 at 10:30:02PM +0200, Dmitry Baryshkov wrote:
>> On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
>...
>
>> > +#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
>
>Can sizeof() be used in assembly?
>
>...
>
>> > -#define __GENMASK(h, l) \
>> > -       (((~UL(0)) - (UL(1) << (l)) + 1) & \
>> > -        (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
>> > -#define GENMASK(h, l) \
>> > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>
>> > +#define __GENMASK(t, h, l) \
>> > +       (GENMASK_INPUT_CHECK(h, l) + \
>> > +        (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>> > +        ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
>
>Nevertheless, the use ~0ULL is not proper assembly, this broke initial
>implementation using UL() / ULL().

indeed.

>
>
>> > -#define __GENMASK_ULL(h, l) \
>> > -       (((~ULL(0)) - (ULL(1) << (l)) + 1) & \
>> > -        (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>> > -#define GENMASK_ULL(h, l) \
>> > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>
>Ditto.

problem here seems actually because of the cast to the final type. My
previous impl was avoiding that, but was too verbose compared to this.

I will look at reverting this.

Lucas De Marchi

>
>> > +#define GENMASK(h, l)          __GENMASK(unsigned long,  h, l)
>> > +#define GENMASK_ULL(h, l)      __GENMASK(unsigned long long, h, l)
>> > +#define GENMASK_U8(h, l)       __GENMASK(u8,  h, l)
>> > +#define GENMASK_U16(h, l)      __GENMASK(u16, h, l)
>> > +#define GENMASK_U32(h, l)      __GENMASK(u32, h, l)
>> > +#define GENMASK_U64(h, l)      __GENMASK(u64, h, l)
>>
>> This breaks drm-tip on arm64 architecture:
>>
>> arch/arm64/kernel/entry-fpsimd.S: Assembler messages:
>> 465arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
>> 466arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
>> 467arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
>> 468arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
>> 469arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
>> 470arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
>> 471arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
>> 472arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
>> 473arch/arm64/kernel/entry-fpsimd.S:271: Error: unexpected characters
>> following instruction at operand 3 -- `bic x2,x1,(0+(((unsigned
>> long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned
>> long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
>> 474arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
>> 475arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
>> 476arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
>> 477arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
>> 478arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
>> 479arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
>> 480arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
>> 481arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
>> 482arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
>> 483arch/arm64/kernel/entry-fpsimd.S:282: Error: unexpected characters
>> following instruction at operand 3 -- `bic x2,x1,(0+(((unsigned
>> long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned
>> long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
>> 484arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
