Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FC86D1F8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 19:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1526110E3C1;
	Thu, 29 Feb 2024 18:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TG33J4p8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B3210E3C1;
 Thu, 29 Feb 2024 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709230901; x=1740766901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WMmYmUQEzg0IF20lL2Gpc75dX+zjQMkh9mM5vqY5yFk=;
 b=TG33J4p8ZtdphSL4V2jinLs2vKVlhe52knWoc3LOwdldPA1nrCEKEsLP
 1z+KxxXF0lX6LoQcyNI4wow66K7dgGqhyVB2tDiN8PtFzDK96IbNuOnvf
 gqhbl9obT6vLkRkp0b/bVCnM2UT1cw5j8ZWSc8mBX6xQyaYlp24clGcl7
 oT+Uz+vmSlAtHvLmCuuxPOX819shdeasiJ5icLqC41W1UpTJFu12qbz1k
 9T3hfyZhAp1T4idIs9qe5m5ebJvR27P1gCyllsDUcO6IaejCoytAITZLu
 e+ELyhGL6vi3Evsx3cclIOtI2E3WdVbAnGE+gSzBAz8tyj/LhPvNf8mOi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29155494"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29155494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 10:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12467040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 10:21:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 10:21:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 10:21:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 10:21:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 10:21:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDI+khmablbaefTEIM7T4wOyOy6uv7/zu/+MVpYUL0Ls1cqoD50zQTZ0SGY7QiVAz/GMKTQqasDYbg3nB+9+raOlYCzWlwyJaU7X8R58d3Bpuly8KoLJ2lpQQgTjU5AD1wHq4VttDgiID/zyf1MYOlk2smuJ5Cpyeda6Z50T9cjboCbyt5lYcvEh+igQEnQfh3POrv+REVx1zv2K8MQslkhz27NCrnZbf8/XGN3mhyt0PztOjc7XopPDaEDUBcjJQJ0tVMe/dyCGhmeGRpeE/QsDZRp5dlPSVySJXIGmAqVoyH7UH8YOUyzinETYi0JNuDIcMnKn2MaNlEEZZV57Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSAwAu3QioTUOxs+FsuAe61M0nWzC0r5Chfjnx4erDg=;
 b=aDAjj53StrilfoweBL7a4/rf6j8n+2+s5JR552yLXYMnkTAU1NU3aWJZAsD4y2Pse0chNiMxcBk67OYV85jKtzBJ9KUU/KyuXzF0NEBeEbOGEkQdkcvxTsg/6zR92b/OJn58r7n/1xoIKN1Fkq83dLTWs6haW/FUbbvkrAM48eRch4Q6oc4l0BVF2WmfjC33LcxShh6yvEn15HqjpGyUeuueayPslKNmyRTE4kdiPOd4mNLrYCVlTgvM1Nd/74MWu0dT3wSpXwTo0mI7DGcfEu4OmntVnebFTh9Yr0rCvFssOONH6QqdOF1TZbJmB8dlUEBy6gYneE0gNmFKXgM1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Thu, 29 Feb
 2024 18:21:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 18:21:37 +0000
Date: Thu, 29 Feb 2024 12:21:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Yury Norov <yury.norov@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <xrqqqiizufjx75k7z32ajchgepjkdww22hddddwxwsxljq5uhf@4etg6et52grj>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
 <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
 <ZeBhVb__VNQCgTQk@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZeBhVb__VNQCgTQk@smile.fi.intel.com>
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abe1c42-4ea5-45c9-d6a5-08dc39534447
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xr4ZBYXnqONLd6mt78wi1B3yRk0eewJ+Fumf0SbiIw+6SWlKCq67yOUritFJQ2Ih51ujuCFcHYK7WATmlyMBx4c0AZ9SQBT+GTqX7eWYS24CV80kA2LjofNwZdHs5L40onDEeiYoS99CxELGgI1k62zGQ31DvY9j+c4jXkQ8rGDKKr8ZpfsGJrO6Ovw/SjTa2Adg/PVEKL1A8m0jTnl1A/sWGPDtO3F2oNTldqmr9ddK+BpAarVWbQKwnmWDnOCTdWJPYdCsbrbjZRMv50iWjiDJyjqUpQU+m5TtV67p9Hb8B/XuORdDKrFQITSMgpdU+KPk0PpkJPvBv2ELMg+InFVjLBerNBP1blClcumOIes5BrgFv8f/0X6fY5NJYZzgzkQRVK3KtciQcyM0uSIu4D+o5FkZJgxwDVa+SBHtziyUqwIKdHpTYpIQE3tjR7Ei6U0K6F8UlxKzgYYv3aV3xgK6Q8cPFhHYLUPrzCsN+x+0uWUCuPBx8G7kI5FwFgYu30e+/XqR/7uRVzT9zSm8Iz0jZmaL/U8qugEDcqyEa9dj4czEgsXLWc0jmf+715xMLEB3E0nfYX3G2TFn1y+VE+dGudx3DMrxj+dtxlXKiIJDaaNrtEvCgx3m+EXqsRbfOy0nf1KPRNd0nzp0G5Rtzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gkg04ObwN1Jn6GnQKbHHyZAeiPFVuy3XL+iKmwZp/irKgAIPfAVTuNJovU4v?=
 =?us-ascii?Q?TslScLpSlwqbzbYKe3PL7xRKAgWQZmCjRxqqc64kec4VIqY+h7b80MxU5SW4?=
 =?us-ascii?Q?w3qNU6UcIiF3dTvRb8wrQ4xCgIeRNTtRzhy+Dewg5DD/QNce7AVvz85jspIE?=
 =?us-ascii?Q?Xj0hokC4XhqwwEFYc4WafX2f3qwj89wkhaMlK8ERV2eAS1oU/Jrb03rYnTjH?=
 =?us-ascii?Q?hcND5zLJn3oyEqPOU+2OEM8SzIBBGSvlsmzSYrm8xhghvnczGtjybRp2+fOY?=
 =?us-ascii?Q?aq/vLE0JF9BOpl8MLuSLxmRr2cQNVlEW9xmgANG1jfBBQrfZsc6mf4mO3Liy?=
 =?us-ascii?Q?6aqC0mfDbqqA+tu6TQbyd5JC7wZ3JnCHzPxWpO4aVOCsf6LWAXKKKQ9YetLR?=
 =?us-ascii?Q?u/CUbn+EIzX112HjV3jg2D7vR86z5wFdp3spZVKSUZLlk60yibXvx5XnerR2?=
 =?us-ascii?Q?RlOBlGVPjHF8i5mSqEahnhj6VBxsA3Ax+CEvHZbriesfGizpjyx2G9Wu0Mkz?=
 =?us-ascii?Q?lqhwHAtWwoqiA7vevF9owoDAzXu4ZD6kx0v2M8fTrjetSUrmEgXkx2tPAl7+?=
 =?us-ascii?Q?cUGRhjO0isTz1l4mP3lT6dyxo1n7POZXBcztvdPUEiktQaoosSEnb7Qlq7FL?=
 =?us-ascii?Q?VcTqgn5AxEjGGvZ/sWMPWDPZzh8TF7grsO3bKn9HJeBV0TGsgGSV6YFrHVNE?=
 =?us-ascii?Q?zx57/ktY4c9IMglAVnVYTQ+sQUT/Ei22fyH/Ow9Li3XmR0nmbxdcqTCNlFGv?=
 =?us-ascii?Q?2kEonss4RIN7mFgN99yVJRs0n/XLigPTQbXVALHtNLaj9sYM7QEPiq7KOA8u?=
 =?us-ascii?Q?WBv/M+f1IWaUA/bzOKv20pP5KT772jS0noxOwwaU/GFho/XahNLLuBFj3bjC?=
 =?us-ascii?Q?H2036AE6H04DsHmRDl5oT6oO92Tf6y9XjTlDe/3IkdZVgPr0v1Y0nCLjNv6E?=
 =?us-ascii?Q?mE4RUMbGgGXhPLt8zqzTcNo9xKxrZ+0Sz47ZaNmB4TOveo1diOEJfV/WQmnO?=
 =?us-ascii?Q?vVoyy4s17bd8ENyq6TKJqJ7gjSTAf2rw6wIdnAQhyvVT3rwIhsR6Fr2sAX3n?=
 =?us-ascii?Q?pQEThPbwdIup1qHblWewBlEEcuEGunALzQXvdPntGyt7rpo5IJY+GzAZKoTR?=
 =?us-ascii?Q?P3xwX7sYpJc2fet1sByrHVHnvxzfe8P+6dLPIYKdjo6+p4JtZJlV4qPsYhsn?=
 =?us-ascii?Q?gVYZxREV81wY/KzFzOYOus45SNvl5H6jg20VWq2Qr+RPyubXNnWATsaNxDv5?=
 =?us-ascii?Q?gFSwTu2X2AuabF+KrFUqMwOUJabof5AEbfRbRnj3sM4oC5/KVTgY0z5N8jnx?=
 =?us-ascii?Q?oqTpvSUqmydfvO0QIy2MPRnviYNivTXEdiAqCJDXzRWRORvG1KVdF+gBLiii?=
 =?us-ascii?Q?OY+1VDhZK1KaNT/eVHkt9UDZuQ7GrHPD7nHz6aGidDSzpwlTxkCDs9VC74iL?=
 =?us-ascii?Q?IH1B682yhPBNmG19gd48W/oS4VoWdQDSMDg1ee3kZUBxTOezucdh0xFxMwkC?=
 =?us-ascii?Q?qIrweJpK+oUx76kf5z26q0St03TzAZrzIfScqJaqUbaAmaavRzczErjBNNfe?=
 =?us-ascii?Q?E+MGYoakdXtjkAufhoyDCvXHpm5xTP4lbYmxLQtMZILZLlc0GwwVqF8sgx1H?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abe1c42-4ea5-45c9-d6a5-08dc39534447
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 18:21:37.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RosUVLRyICWc7NG8fuQi1m585h4jg9pCb7rdiRVmDI7FwFmxNw6SsnA6RwxGjkw3JYbKJuWwdTJQX6KwRYZMiURW+0C6R0CfqaUPh4mfcg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Thu, Feb 29, 2024 at 12:49:57PM +0200, Andy Shevchenko wrote:
>On Wed, Feb 28, 2024 at 05:39:21PM -0600, Lucas De Marchi wrote:
>> On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
>> > On Wed, Feb 21, 2024 at 03:59:06PM -0600, Lucas De Marchi wrote:
>> > > On Wed, Feb 21, 2024 at 11:04:22PM +0200, Andy Shevchenko wrote:
>> > > > On Wed, Feb 21, 2024 at 10:30:02PM +0200, Dmitry Baryshkov wrote:
>> > > > > On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
>...
>
>> I build-tested this in x86-64, x86-32 and arm64. I didn't like much the
>> need to fork the __GENMASK() implementation on the 2 sides of the ifdef
>> since I think the GENMASK_INPUT_CHECK() should be the one covering the
>> input checks. However to make it common we'd need to solve 2 problems:
>> the casts and the sizeof. The sizeof can be passed as arg to
>> __GENMASK(), however the casts I think would need a __CAST_U8(x)
>> or the like and sprinkle it everywhere, which would hurt readability.
>> Not pretty. Or go back to the original submission and make it less
>> horrible :-/
>
>I'm wondering if we can use _Generic() approach here.

in assembly?

>
>...
>
>> > #define GENMASK_INPUT_CHECK(h, l) 0
>> > +#define __GENMASK(t, h, l) \
>> > +	((~0 - (1 << (l)) + 1) & (~0 >> (BITS_PER_LONG - 1 - (h))))
>>
>> humn... this builds, but does it work if GENMASK_ULL() is used in
>> assembly? That BITS_PER_LONG does not match the type width.
>
>UL()/ULL() macros are not just for fun.

they are not for fun, but they expand to a nop in assembly. And it's up
to the instruction used to be the right one. Since this branch is for
assembly only, having them wouldn't really change the current behavior.
I'm talking about BITS_PER_LONG vs BITS_PER_LONG_LONG. That introduces
a bug here.

Lucas De Marchi

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
