Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564A83223D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 00:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B379E10E911;
	Thu, 18 Jan 2024 23:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3010E1C4;
 Thu, 18 Jan 2024 23:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705620306; x=1737156306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HusR3d3PjVtSrBUqXHO9PPduynIUlrONvXQp4ztWb3U=;
 b=MtveftFjpxJ0xddsFtJcML+ShIElAGeTM2bTWZDmuf5k3CSe+s9pqrIh
 qW1lOREQEHSgRqw5eeaYrOgOMC9urlFvsXSxtrs0igwiOVfxFYJoCLNn4
 3sF96wiQYWYtL7H1AS3onD9FCimypnb0aJPMzueR4dI5/G6GW7rk23B/o
 YY6ZdL6zSYfSPGsHk0yUy534QduatmQtb8D2dOgLmsDFrQq8XnOMctbt2
 I9u/fcuS1hWD8LDXmEhtwu2Fa6BVdnhRYJbgsFMaCvoOpiPfmsBGimB3V
 0L8DDrghk/cjbB75QwvRefriIftXZWoh+rlAINaEDqtAucB8PG6gaRvc0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13962958"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="13962958"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 15:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928254052"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="928254052"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 15:25:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 15:25:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 15:25:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 15:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYEuRmMKL6OR/nhlOtjFmmIpE9v380H0kV5WiZPbn/RTDv/Gua/vQahuBVxjnUiaCYnBkCsgML9GkVzpcc85ongChPFvhdHKrpncUxoOJubXce/QVkiLZr59D4jCv5fUxivPE0S51yxNd8KUedFrcXXsFjL31zwtddZZTGGjzH+eEqArcuIie24b5bhccBRWMgfzpvKc5+TJ+8Uq62EKL3lmh/l7I5JayUaBiHxNSVu7OMHA6C+UzMIE+Jp0ne8rGJw1WLBeEOt216OACgSXamHC5X38NOPskTupxisf2IHu87QWufXZ746VD11k3Sbc1AIclQQRj/Qx2OEjXwCHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9PQVk/2ehuy/HSOfcK9VJDrb0FFd2xSbFgNNMT87pk=;
 b=ORjqfa5Dv3+O6/EnfTo/2ebvHUIqaIY2nU0w4D7yQWm+0y9xSR0Xr8BMGJfWk0IEw4FAkZMMGmGK9kHvqPhDGkcsm9sxHlbr4Rgi/bw9ywrwlVkPpYwqCHso/ZKfNwpKO9WfShIhFszdl8qb2o18sEVgpi9btwE3jmcdIn5Sko6JitQh70G5hGbSlueJitjhZGskMV0kU/YmcN/p8Axh9CEOLMb89hQxc1E/3VQw0aNyGnRHBWJlrRDwyRJe7y3zTGSGif3s87HU41tNmRLIGTPSRPBSP1DI+Q5x1lePeZbSmbT3sD1HePg3u8ZGFP4ThQX5TR9QenHVOmeHm5MExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 23:25:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 23:25:03 +0000
Date: Thu, 18 Jan 2024 17:25:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: Re: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width
 GENMASK and BIT macros
Message-ID: <clamvpymzwiehjqd6jhuigymyg5ikxewxyeee2eae4tgzmaz7u@6rposizee3t6>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
 <4ezps56sdj7fmr27ivkaqjakv4ex46f5cvmy6oqr3z6gkhiorl@us4qd53jzq34>
 <Zamcu7tts8mqX0b4@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zamcu7tts8mqX0b4@yury-ThinkPad>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a23386-6489-45e1-80dd-08dc187cb28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3y+9RYYxFjYG6tb6QfLTIGLdvvJuRITXIMblDCCehqZYrHbgkmiX0Duh5oUokEEa7EgAGiZ+fiz70a/diyIttHZNWsDJz5xW0UmabAmEeVLaVJh0FhstMWJCuVbjypuD+lkiDCKwBZyqY+pnILusNotzvomCAFF89tMFIn5AqRp/Zkn/az8c1bcMbpWPFdal2d8KOPj5HXiFHvsK6t/IqfEl4WFBG7xd+W9IajMwcea1+4GWQgwErqCNBVDV5nXv0zkO7F9OIK1AUPksNAOnDInJ+jW4smNevggZOUCFqX3z/DDs2rhk2tMOuGQpyf4boyT0cT1+nDqEHpu8ypt38CKBVRzzGrtDZz2dfsdVzGFsIjSt9wDQwIl8wnf4+WK1hPC1izCpwO6PPePAXNoeCxsnKvUSTlRxOirgeQAGTpF4l9vJ7koRtWn70dDd/hfWHN7K/0Pg59YsrSTCbwfvyNAXiAbk+eNO3Y8RMeUFJKIt1PhihOKnKBsjPLaHYLGdOPUqhW0QseQOZzU4jQrND4CgBQXzaA8cmS6At7NIJiO//aYQak8uT9a09q3pguPv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(26005)(6512007)(9686003)(83380400001)(86362001)(82960400001)(7416002)(4326008)(8676002)(8936002)(5660300002)(6506007)(38100700002)(54906003)(66556008)(66946007)(316002)(6916009)(66476007)(33716001)(2906002)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NwGG/xDlszN1Xx6SdT7aWrfadshhOAxvU8kDvjWIoj/LD9n2vqUmLxpNRr5g?=
 =?us-ascii?Q?5cdV/KW0tKz/ndELKcu3V5g90LItp607ynGgwphmApDZqRTZGyog0jdtkcbf?=
 =?us-ascii?Q?Kn3j4qN0W8ttBJC9kdo81SUO8bqjT5EfHWg8vKdTGQmc40iOlO6ifOcJcdh4?=
 =?us-ascii?Q?ryeUTcf3dEz88dtFe8mEAaCOcbDXQ39QnHbertlMTZ3ac63JwuEa5y7voojr?=
 =?us-ascii?Q?QjbtROg8KEasYfqyqa0EbjxcG/BHMoEZWyHkoR0lNnPYakh11+ZYKfdIeI0X?=
 =?us-ascii?Q?udlYwde+qIaE+nmoyP3YN/t9uzWCeYDWZHu1HjNvNxMKdvmIjZmE8TeiGog7?=
 =?us-ascii?Q?rBlThclItN+rOAXQJQR8emMQGSHiNNSvxLPXNsZPjKLRj1moexafLsOezaMw?=
 =?us-ascii?Q?0klclETMCee9cKwGdNyobxroLxUwtJh3vVMhXZ8p8N8XQLnQsgNh6XKVn4bu?=
 =?us-ascii?Q?hXT+kJD9lNz0xyQF4ASRqQByHW4dgDWMXp3zlBLk5hwOm+HO3mUjnrYs6A69?=
 =?us-ascii?Q?+htI1SAl2MTpdSiyrjaF3QE9Bp0x/obtpBRo2LT6ZeBdkUh9Tg7RIANh454c?=
 =?us-ascii?Q?DkVDOC62gmbTF51Wed5czCmFFe0jI6Ws0liX4D12b8Rb3y42xojaRLfTeSKG?=
 =?us-ascii?Q?uUcShaKaUR2+lqsGWKGVP2WwOfGqAgE2TdFXhoyx70oMNoVKYRsOo2h5kaUk?=
 =?us-ascii?Q?z1aQo7jD8pQO7zVRYaTTwT51j1dHkXlxNDaJyuNYIgIpaf0tBywHm3FzuRqE?=
 =?us-ascii?Q?i4Xa3S8/pOE8edd3BmymPgIrFWji5F0+MJLcEcG3QMzBWlutu96e4dM5jfbU?=
 =?us-ascii?Q?XXSNdZ6xIgLybFWH5/VimMLvyyirpZpKpb33GAsiED+8Co8X027c0sPUubqa?=
 =?us-ascii?Q?ZqYpeXD5NkJjTngjdRGhm41Ayl2+YuxB4I/K9OHMCI+aq8mWeUyiM1NctIOi?=
 =?us-ascii?Q?fRRFVaul9ItLcTXvw3HuOROiunnAWw5Q/I4WoRZT+4dMydwzqq9O1mVOW4fr?=
 =?us-ascii?Q?jMf/XK0AdBnVGtrFvfx4YHJyjQurs3eyvBT66i8R8M16WWfGzUdrEDdWY+jZ?=
 =?us-ascii?Q?EJxaEU5I5dCU8QJ0tSifKaWya8EHcl6Bqaib7N3byJj4ymx8pXUbU9WgU1sB?=
 =?us-ascii?Q?vL7ce882umgIYoj4v8HYUnNR6TTNwzqKTCuqMCZAVhvbB2jmh5g6rcJ16u40?=
 =?us-ascii?Q?jkuuQh1iLOXd+FBi1bzKjzPjvah6WK3UTknwJy4x6FK7+1LQQb/A3rYYclfY?=
 =?us-ascii?Q?K3rDXJI7SfXva4rRRrK2tDKLQSxWg0xqn3xtFHPkPVi+WZcGPt1k3hq9nMLV?=
 =?us-ascii?Q?k4Kahwt7wSxgBV+a/0wOws/Sz0zfrXeSe32A+yHJkpOjKqaJ2PFaJ9GwGX1G?=
 =?us-ascii?Q?71AILPGVlIZDjmKE1elFvdI0qZgqXFaqlTj4Lrnj8h94dXuu/QjjznmGsdi4?=
 =?us-ascii?Q?/i/gAz/dPLOUKYDSNB9YD8don3AtYoe9D3oS8Bh2hw9/yvw9hmb0eQC8HEK9?=
 =?us-ascii?Q?Ysm9+ZkDAYxzklTNcPcfNURztR65VDRZyUKWsG3iAlSoB18RuLr+/pyGjyzK?=
 =?us-ascii?Q?gIaxhgHPiHqSQF6fn7InnCDOU2XwPs6DCTUmFRf/qmr1+5JxbNnyw5dLSH2p?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a23386-6489-45e1-80dd-08dc187cb28a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 23:25:03.1986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4r13IIjrVR5nS8osaC2d7GuNh7TrZ8I55XAVFlSaj+EZ/5CFOzZ9cK2LKd67vfr/enAknRUGBoieAIV1kQmzZEPa+OwDgTwzg2mAAjLuzJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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

On Thu, Jan 18, 2024 at 01:48:43PM -0800, Yury Norov wrote:
>On Thu, Jan 18, 2024 at 02:42:12PM -0600, Lucas De Marchi wrote:
>> Hi,
>>
>> Reviving this thread as now with xe driver merged we have 2 users for
>> a fixed-width BIT/GENMASK.
>
>Can you point where and why?

See users of REG_GENMASK and REG_BIT in drivers/gpu/drm/i915 and
drivers/gpu/drm/xe. I  think the register definition in the xe shows it
in a good way:

	drivers/gpu/drm/xe/regs/xe_gt_regs.h

The GPU registers are mostly 32-bit wide. We don't want to accidently do
something like below (s/30/33/ added for illustration purposes):

#define LSC_CHICKEN_BIT_0                       XE_REG_MCR(0xe7c8)
#define   DISABLE_D8_D16_COASLESCE              REG_BIT(33)

Same thing for GENMASK family of macros and for registers that are 16 or
8 bits. See e.g. drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h


>
>> On Wed, Jun 21, 2023 at 07:20:59PM -0700, Yury Norov wrote:
>> > Hi Lucas, all!
>> >
>> > (Thanks, Andy, for pointing to this thread.)
>> >
>> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> > > Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> > > masks for fixed-width types and also the corresponding BIT_U32(),
>> > > BIT_U16() and BIT_U8().
>> >
>> > Can you split BIT() and GENMASK() material to separate patches?
>> >
>> > > All of those depend on a new "U" suffix added to the integer constant.
>> > > Due to naming clashes it's better to call the macro U32. Since C doesn't
>> > > have a proper suffix for short and char types, the U16 and U18 variants
>> > > just use U32 with one additional check in the BIT_* macros to make
>> > > sure the compiler gives an error when the those types overflow.
>> >
>> > I feel like I don't understand the sentence...
>> >
>> > > The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>> > > as otherwise they would allow an invalid bit to be passed. Hence
>> > > implement them in include/linux/bits.h rather than together with
>> > > the other BIT* variants.
>> >
>> > I don't think it's a good way to go because BIT() belongs to a more basic
>> > level than GENMASK(). Not mentioning possible header dependency issues.
>> > If you need to test against tighter numeric region, I'd suggest to
>> > do the same trick as  GENMASK_INPUT_CHECK() does, but in uapi/linux/const.h
>> > directly. Something like:
>> >        #define _U8(x)		(CONST_GT(U8_MAX, x) + _AC(x, U))
>>
>> but then make uapi/linux/const.h include linux/build_bug.h?
>> I was thinking about leaving BIT() define where it is, and add the
>> fixed-width versions in this header. I was thinking uapi/linux/const.h
>> was more about allowing the U/ULL suffixes for things shared with asm.
>
>You can't include kernel headers in uapi code. But you can try doing
>vice-versa: implement or move the pieces you need to share to the
>uapi/linux/const.h, and use them in the kernel code.

but in this CONST_GE() should trigger a BUG/static_assert
on U8_MAX < x. AFAICS that check can't be on the uapi/ side,
so there's nothing much left to change in uapi/linux/const.h.

I'd expect drivers to be the primary user of these fixed-width BIT
variants, hence the proposal to do  in include/linux/bits.h.
Ssomething like this WIP/untested diff (on top of your previous patch):


diff --git a/include/linux/bits.h b/include/linux/bits.h
index cb94128171b2..409cd10f7597 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -24,12 +24,16 @@
  #define GENMASK_INPUT_CHECK(h, l) \
  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
  		__is_constexpr((l) > (h)), (l) > (h), 0)))
+#define BIT_INPUT_CHECK(type, b) \
+	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
+		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
  #else
  /*
   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
   * disable the input check if that is the case.
   */
  #define GENMASK_INPUT_CHECK(h, l) 0
+#define BIT_INPUT_CHECK(type, b) 0
  #endif
  
  #define __GENMASK(t, h, l) \
@@ -44,4 +48,9 @@
  #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
  #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
  
+#define BIT_U8(b)		(u8)(BIT_INPUT_CHECK(u8, b) + BIT(b))
+#define BIT_U16(b)		(u16)(BIT_INPUT_CHECK(u16, b) + BIT(b))
+#define BIT_U32(b)		(u32)(BIT_INPUT_CHECK(u32, b) + BIT(b))
+#define BIT_U64(b)		(u64)(BIT_INPUT_CHECK(u64, b) + BIT(b))
+
  #endif	/* __LINUX_BITS_H */

>
>In the worst case, you can just implement the macro you need in the
>uapi header, and make it working that way.
>
>Can you confirm that my proposal increases the kernel size? If so, is
>there any way to fix it? If it doesn't, I'd prefer to use the
>__GENMASK() approach.

I agree on continuing with your approach. The bloat-o-meter indeed
showed almost no difference. `size ....i915.o`  on the other hand
increased, but then decreased when I replaced our current REG_GENMASK()
implementation to reuse the new GENMASK_U*()

	$ # test-genmask.00: before any change
	$ # test-genmask.01: after your patch to GENMASK
	$ # test-genmask.01: after converting drivers/gpu/drm/i915/i915_reg_defs.h
	    to use the new macros
	$ size build64/drivers/gpu/drm/i915/i915.o-test-genmask.*
	   text    data     bss     dec     hex filename
	4506628  215083    7168 4728879  48282f build64/drivers/gpu/drm/i915/i915.o-test-genmask.00
	4511084  215083    7168 4733335  483997 build64/drivers/gpu/drm/i915/i915.o-test-genmask.01
	4493292  215083    7168 4715543  47f417 build64/drivers/gpu/drm/i915/i915.o-test-genmask.02

	$ ./scripts/bloat-o-meter  build64/drivers/gpu/drm/i915/i915.o-test-genmask.0[01]
	add/remove: 0/0 grow/shrink: 2/1 up/down: 4/-5 (-1)
	Function                                     old     new   delta
	intel_drrs_activate                          399     402      +3
	intel_psr_invalidate                         546     547      +1
	intel_psr_flush                              880     875      -5
	Total: Before=2980530, After=2980529, chg -0.00%

	$ ./scripts/bloat-o-meter  build64/drivers/gpu/drm/i915/i915.o-test-genmask.0[12]
	add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
	Function                                     old     new   delta
	Total: Before=2980529, After=2980529, chg +0.00%

thanks
Lucas De Marchi

>
>Thanks,
>Yury
