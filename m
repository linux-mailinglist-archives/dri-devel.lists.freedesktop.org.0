Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6483208B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 21:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE0F10E92F;
	Thu, 18 Jan 2024 20:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51A810E8FD;
 Thu, 18 Jan 2024 20:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705610538; x=1737146538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aFBnduirpltcw5DP+wUw92+EaR5az9SPmErGJy5crDg=;
 b=HvL8zan9yR0AbuxRauNfrXTfGEvsM1423C4iSxz4/cuMmjdJD39YKKPB
 Q9At7hBrUr+09DbkhZlERtnO30cqQBvQWJhpb3x21EVkW61LQ19Q5DnN7
 4lj4yzO5Jxnx4JgFD0FAe5EtERQ47xn7hYpoVP8W4OHfusvK6VKmlx65z
 vhrRHcsnNzmF5vhGeUjY9n9wIrh2yo9tIz1H4vZzbacvbkMFLoZQtEFwv
 NFSt39DZCEX47453oVHlGu+KZhbtx/kYuB+eF2xjd1g2Rkk7eJTfdbw6q
 TUhUdAg+Xef5FhaaxtldWKRqDUEQVBf1v9ytI96zma6h2FIgWjlInn/Tr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="466946582"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="466946582"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 12:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="875193211"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="875193211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 12:42:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 12:42:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 12:42:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 12:42:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctlaPICg9Yx53Tr9iUZ1mPDNowGZ+4D+OVbJtIYq1TzYfhBboLn9JrK1jhI+7LfS9rJrOHP+VZOJYzv+Zpcj+YrXzQmMgxhvXWU06Psj+fyVHLzU40NvgAf2mH+JfPy1mjNd3lK65uIJ+XeLghuZEsoWCqhhZRnMmOTnBbM5DVJjEjnv437G+PT/GGvm5BWxdkmSUuQxTsjq7vCzI7TOfKaNkgHw+LiMHzfqxsSIY0C1looh9uJS2EP0LC9Lab/v17hwCSqtARXvWcMJM8tGgMjSlDjSYodJ+GUgTZnMt+nW+GTajrP9M16CGfHQ0IOYGfPyZ4WBoysZKv3H2LhRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTBQZ1zFyJ+t8YQ96TeeMdl7rCnMeOBFZMbenAubg7c=;
 b=alIqngF8mun1ctwgOiSl4W9D2zjhW/W+hkh0ZIcJ/luXFPm18tV0vp2fiupZpxC3rLRu8KyXuQ4AUftHNAywVfoB1sMG6QK/W3yk0G9mGk7rueklj2mFS5aSp1//98cw88VO89hWQLSGcuVApC8lm7eEU43xOQigVa07SZ3tZ/kvWwSHFXUNOjo9O52juT+kq/ph9laQxCXyr0zZp39zHLu3uHcwIkPm937MDlcrZAucCwZLxMF76QDzgpOwv8BU1b1ioqPn/Wz8P4UePCj2COh0jChaTl8XP/ywBo6vy9P+tjV5CSh0jS225a4vslvaJTjpirDwCubk/Onapv1+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8138.namprd11.prod.outlook.com (2603:10b6:610:158::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 20:42:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 20:42:15 +0000
Date: Thu, 18 Jan 2024 14:42:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK
 and BIT macros
Message-ID: <4ezps56sdj7fmr27ivkaqjakv4ex46f5cvmy6oqr3z6gkhiorl@us4qd53jzq34>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZJOwC5LIEySpduQJ@yury-ThinkPad>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3279d8-f6f5-4923-6589-08dc1865f441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gKxVznPACJFEyKqmPQtGkKxE9MesfPf9+Kdgg9dUDIXdVFxsU1Pl7lgX1cV3XZ+/JWDFHb0+h9s+YPrcBqNw7iB1I+Uzx2LpGJ4XE9PR63wZTfsDkSDXCCCQa763TMINpp9hf/g/ANVfxRG4fcRGK1xM3mF2TroabfvOHzDpFzYYzbJuC6ENVF70Rpc2DhZU3m+gBngeWyVaI+uOM8wp3jVhflP92N2YdePEH3PYHvJC0PYlNPxPRU8hPbkj4BwzvK7vgqNppo/KVbqTe+mUREjXbVdfK2YHUK1bxWkHAbzlSwr1qXT8olj4AKRl47ZrPnfwucCHLCVx8kFyAosQ4lLsjnPtyGLEtYctz23T54HMUQfQDb5ZI6MAhqOqN6oeBDx1syXeYSOCvBO+qoigKN/IDf6x+DJVH+Kr7sGZzjM5TR5ppw2Zyq7kRtDMYAiyWY3ySfEvZ8nmktD7QHeDStirNw0ayn/2kiD/caHlKeHMU9FfyWKYUdudRWcuDArOyV0e6R9lE1Io/QB91B8plEoz8xqs5EDUy5R/06vFo2UpV5hwvK0Ed5rvv7mJywD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(478600001)(6486002)(6506007)(6512007)(9686003)(6666004)(82960400001)(316002)(66476007)(66946007)(66556008)(54906003)(83380400001)(6916009)(5660300002)(41300700001)(38100700002)(7416002)(4326008)(8936002)(8676002)(86362001)(2906002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2qaJjsUxA6Ra6osnF/4CcDhEbr99sU76ByUPAkzgZK8RnKUv4OHmzdFnOuus?=
 =?us-ascii?Q?n4jrA2gezEvxZsGe2TyhPoyvHP6WwzjhbMjOxPHwp20xbHIKjTPmIkG5Fz/i?=
 =?us-ascii?Q?MFoKte4ijRqDorl5B4vIg8O6E+RlPibmBLzzjav7+lvAUfvu2Wfe/Go6+wPJ?=
 =?us-ascii?Q?w002Trz4BDDyAHHq3RADZKhjqSBqCe0O25cH4CcxUJ86sDEzhIbSr4YF/EDD?=
 =?us-ascii?Q?ZaItPFaR0ww26jNutIsm3NOQf1LILnWNvzBA8tgciSMbIDpH8fEwz/jGaBmz?=
 =?us-ascii?Q?5B2of2nGBEKwMm/t5VHh5EOIYnAwOBSacSthc1KQzePlnxnystweNh3CSkSo?=
 =?us-ascii?Q?EOw1Y229Fn9iVvzK83OEuCeeU7bF1jJQeTPKIF/IpSLKTDpcpCUYFUmP3QkL?=
 =?us-ascii?Q?ckZF/hrZLlkkJjaHQtkhbAG2lU3hHlONFTNeYRjHH1rCSOxpapR7tHA4cEyw?=
 =?us-ascii?Q?wJPiFtRll5J/DOlzmMaQJgovmaZ5BY7IvXzqFgNO9Diul7f+KXdu6geHMhBu?=
 =?us-ascii?Q?SzQLFNEIbXARAlVkGuy2scQhF80qG55BWAe9uTypbeSkVRkYo0JhE+hXlUva?=
 =?us-ascii?Q?ksoN3VgupUZNZ4Qaw8Y2nqo/WvKQ50SMcKRvECHXeC7wnltJ0iHz9bXi2Gdu?=
 =?us-ascii?Q?3FG6JQ7FFW+C0Ai/5L7UrVEbIUV6nrmv1aMqt7ZSt1i21NfkDnBaiRPYjrOT?=
 =?us-ascii?Q?MgMCJb+Pf7B+AwQCxW2HUkovCO9dolj8j8dvNJcFDHhTHGqMcy5C2WMw8bTC?=
 =?us-ascii?Q?IYIrkTPbHxzo0TcdBdyMPs9MsoMxo7d+TUDYDb1kZjvsbKTEb1SBctGpp62u?=
 =?us-ascii?Q?YaGI8rk656+AUmlUyj0KOZmjoSSo7vPCX9BFAkV4PnPlz3tv6+SV78sLZ15k?=
 =?us-ascii?Q?Q0fqvWUwBUeABk2O7cL29OuPG7I2/2FpmdunYpDLQAp8ZCiY9qfhw9qoNruh?=
 =?us-ascii?Q?9MkGhMY84JwSIHKA7h0SEh02PlSJXgcFS+tG+o2c41bZkW6XR7xc1uGkPtmL?=
 =?us-ascii?Q?YxS7wEth4NeR3ZadVSOgG5o8beGAUP81NpdmrxhYCA8Cfy/HgqYI+CnGeyTl?=
 =?us-ascii?Q?zaVGAFrKobHQ/LphC5tmaihHESWx9v0+lfnScN4GOs+carkOU8hfyvTnQMmr?=
 =?us-ascii?Q?1tJWCuCjJau6rroc7DtD5VrLrSU6ujWvyT8DHJ4K9x69bp6kne955ZOqPBsX?=
 =?us-ascii?Q?Pb/Kc1MpWvrxDxgUCgxJSbGCkAgN8DUxYxQvC5LphEspM3KEkKuT/jjGUtkw?=
 =?us-ascii?Q?QQCgG2wuB3tk+jsR6IgaV7U0ExxWGPiNntSTX3uyYnNW8LevY2Jl4cxMoiJQ?=
 =?us-ascii?Q?t3zO/HpoSWBGvg3J90631b96rJq7DCAeFfyHFk6+lVgpsYS5nvcFn46KRgYl?=
 =?us-ascii?Q?rrXEiBU6tHVsWI1CjAQqHbT5bBKYaQ4dc4OEzxLvgwYUNKtgZKq88KTPgcKI?=
 =?us-ascii?Q?tfYGfkWz2BSjJTxRuVy+viJmryDC/jYQsIAKb7A8p4uk8ls/tZpkml1l983A?=
 =?us-ascii?Q?W6KMI/3LZmynJ52xC6E8WlxMV8On/tUGa5BPvyQ86Y3EKado//cnjuEBsyQq?=
 =?us-ascii?Q?pIopNGgh5OA7/eYbECDFNJYT/TClfU3qdJmqKcgN8S5DSB/PL09mmIIpXZEx?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3279d8-f6f5-4923-6589-08dc1865f441
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 20:42:15.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /slAQ2Nza63XG1A4G1DFP8HoqTxDq26517ISN4KxKMJwoMJR//DkhjRMvPua9k+9DJOLbW8vkT7uf4c26eQuurMzd+FyOeHqXFQV/bzdTco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8138
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas
 Gleixner <tglx@linutronix.de>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Reviving this thread as now with xe driver merged we have 2 users for
a fixed-width BIT/GENMASK.

On Wed, Jun 21, 2023 at 07:20:59PM -0700, Yury Norov wrote:
>Hi Lucas, all!
>
>(Thanks, Andy, for pointing to this thread.)
>
>On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> masks for fixed-width types and also the corresponding BIT_U32(),
>> BIT_U16() and BIT_U8().
>
>Can you split BIT() and GENMASK() material to separate patches?
>
>> All of those depend on a new "U" suffix added to the integer constant.
>> Due to naming clashes it's better to call the macro U32. Since C doesn't
>> have a proper suffix for short and char types, the U16 and U18 variants
>> just use U32 with one additional check in the BIT_* macros to make
>> sure the compiler gives an error when the those types overflow.
>
>I feel like I don't understand the sentence...
>
>> The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>> as otherwise they would allow an invalid bit to be passed. Hence
>> implement them in include/linux/bits.h rather than together with
>> the other BIT* variants.
>
>I don't think it's a good way to go because BIT() belongs to a more basic
>level than GENMASK(). Not mentioning possible header dependency issues.
>If you need to test against tighter numeric region, I'd suggest to
>do the same trick as  GENMASK_INPUT_CHECK() does, but in uapi/linux/const.h
>directly. Something like:
>        #define _U8(x)		(CONST_GT(U8_MAX, x) + _AC(x, U))

but then make uapi/linux/const.h include linux/build_bug.h?
I was thinking about leaving BIT() define where it is, and add the
fixed-width versions in this header. I was thinking uapi/linux/const.h
was more about allowing the U/ULL suffixes for things shared with asm.

Lucas De Marchi

>
>> The following test file is is used to test this:
>>
>> 	$ cat mask.c
>> 	#include <linux/types.h>
>> 	#include <linux/bits.h>
>>
>> 	static const u32 a = GENMASK_U32(31, 0);
>> 	static const u16 b = GENMASK_U16(15, 0);
>> 	static const u8 c = GENMASK_U8(7, 0);
>> 	static const u32 x = BIT_U32(31);
>> 	static const u16 y = BIT_U16(15);
>> 	static const u8 z = BIT_U8(7);
>>
>> 	#if FAIL
>> 	static const u32 a2 = GENMASK_U32(32, 0);
>> 	static const u16 b2 = GENMASK_U16(16, 0);
>> 	static const u8 c2 = GENMASK_U8(8, 0);
>> 	static const u32 x2 = BIT_U32(32);
>> 	static const u16 y2 = BIT_U16(16);
>> 	static const u8 z2 = BIT_U8(8);
>> 	#endif
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  include/linux/bits.h       | 22 ++++++++++++++++++++++
>>  include/uapi/linux/const.h |  2 ++
>>  include/vdso/const.h       |  1 +
>>  3 files changed, 25 insertions(+)
>>
>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>> index 7c0cf5031abe..ff4786c99b8c 100644
>> --- a/include/linux/bits.h
>> +++ b/include/linux/bits.h
>> @@ -42,4 +42,26 @@
>>  #define GENMASK_ULL(h, l) \
>>  	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>>
>> +#define __GENMASK_U32(h, l) \
>> +	(((~U32(0)) - (U32(1) << (l)) + 1) & \
>> +	 (~U32(0) >> (32 - 1 - (h))))
>> +#define GENMASK_U32(h, l) \
>> +	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(h, l))
>> +
>> +#define __GENMASK_U16(h, l) \
>> +	((U32(0xffff) - (U32(1) << (l)) + 1) & \
>> +	 (U32(0xffff) >> (16 - 1 - (h))))
>> +#define GENMASK_U16(h, l) \
>> +	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U16(h, l))
>> +
>> +#define __GENMASK_U8(h, l) \
>> +	(((U32(0xff)) - (U32(1) << (l)) + 1) & \
>> +	 (U32(0xff) >> (8 - 1 - (h))))
>> +#define GENMASK_U8(h, l) \
>> +	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U8(h, l))
>
>[...]
>
>I see nothing wrong with fixed-wight versions of GENMASK if it helps
>people to write safer code. Can you please in commit message mention
>the exact patch(es) that added a bug related to GENMASK() misuse? It
>would be easier to advocate the purpose of new API with that in mind.
>
>Regarding implementation - we should avoid copy-pasting in cases
>like this. Below is the patch that I boot-tested for x86_64 and
>compile-tested for arm64.
>
>It looks less opencoded, and maybe Andy will be less skeptical about
>this approach because of less maintenance burden. Please take it if
>you like for v2.
>
>Thanks,
>Yury
>
>From 39c5b35075df67e7d88644470ca78a3486367c02 Mon Sep 17 00:00:00 2001
>From: Yury Norov <yury.norov@gmail.com>
>Date: Wed, 21 Jun 2023 15:27:29 -0700
>Subject: [PATCH] bits: introduce fixed-type genmasks
>
>Generalize __GENMASK() to support different types, and implement
>fixed-types versions of GENMASK() based on it.
>
>Signed-off-by: Yury Norov <yury.norov@gmail.com>
>---
> include/linux/bitops.h |  1 -
> include/linux/bits.h   | 22 ++++++++++++----------
> 2 files changed, 12 insertions(+), 11 deletions(-)
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
>index 7c0cf5031abe..cb94128171b2 100644
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
>@@ -30,16 +32,16 @@
> #define GENMASK_INPUT_CHECK(h, l) 0
> #endif
>
>-#define __GENMASK(h, l) \
>-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
>-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
>-#define GENMASK(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>+#define __GENMASK(t, h, l) \
>+	(GENMASK_INPUT_CHECK(h, l) + \
>+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
>
>-#define __GENMASK_ULL(h, l) \
>-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
>-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>-#define GENMASK_ULL(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>+#define GENMASK(h, l)		__GENMASK(unsigned long,  h, l)
>+#define GENMASK_ULL(h, l)	__GENMASK(unsigned long long, h, l)
>+#define GENMASK_U8(h, l)	__GENMASK(u8,  h, l)
>+#define GENMASK_U16(h, l)	__GENMASK(u16, h, l)
>+#define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>+#define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>
> #endif	/* __LINUX_BITS_H */
>-- 
>2.39.2
>
