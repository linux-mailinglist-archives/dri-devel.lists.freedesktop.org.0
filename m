Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42E8759B6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 22:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA74010F5B5;
	Thu,  7 Mar 2024 21:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dt8PbyM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BAA10E28C;
 Thu,  7 Mar 2024 21:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709847963; x=1741383963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mpYNyOhcfQ3l/JjKxTixECoVGkpEQfohqxtOszOcCPI=;
 b=dt8PbyM+VOhML/OOiT2+4schCkCjMBaP28jVALABg438bdqIT8pzwQy4
 5ekmtRZS+ybyx8s6u2haIRxYMVP9ByaNgvbHLY6JjHVR5eQkIHBzz2h5i
 MBvkHxdBUjKy2bEoZLocYoi0m6MkiDgmIy89mvr7LP29hByAQUwmwcOcB
 oovFEP47rsjB+NITdZFbDNGgrvgTcKtmmI46qDj9Oqh4SMyYlKNYz526Z
 8juANEedYEDrV9HiK7bOFOhOkjSMthpEslnO9vA+BxXGkpf5Ghs0StT6p
 pQXSPpnBaopGR/cIcEOSWXx3ub2T6YazCjGEDPlaF7kaJZsqAiiklTyfE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5141811"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="5141811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 13:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10661367"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 13:46:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 13:46:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 13:46:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 13:46:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 13:46:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHI/jfyGFrTgc5g07oaLr8RCgiuQPYhF+nqAOL+YSPIeaVcUTKlKC0Rea5YzXLsj9HnM5Ihk5Qj/Ptxzm0GvjaIaMy49blVz7DK4YG1fG84sKCXw+9+bRGvairGEJfBUTkSX7bMCpO8MLjfBD0j/YxY0uiybw0MykYJF3IuRMg0BjfOcfAcNAYqkICPBWaPbQFeg9hpi4qkHgb3BfBVoUdPKsKBjl1oPbesli/pr4Z/q9PBc1p/5acpkOsdjX9OW2C6PENTH+T2K1MbwnGsaLbjTXx8Kmg1mdK0vi9F3mquh8PKuszRpYIzJaRW9UkucROhs3LoEAlIb/WIw4PVuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtLGOBfzwKZG1ofHLo+6OOtJyaS7s43u+kljougLHAs=;
 b=UL9UVezh6edAy2iQxbxs/5znrOCj2131iQnFRZXxv1O5eIZHw+Zg7sPhwiDsUSBNwJJ24pBn1do7IFo3wkrXK4Zm8XrrFHGJntMiNXFQ5v77VoWNHA7NNJyYevlUIsDv+iHoqhQQwAKw/EyLTKLaY/u98dRzq3Xo1iGeZX1xFV90urqFuJjdGN3WH+brQeZdnDs5VQiHo2UvhDaF5NDR/3ZievUQp3NvUdCyDdscA6KyQybYbn0q4aF3VEiC5w2cZNOT5D48hwRm+B8WC0jkqPPYCur8kwoGeGgDoQC7ANP4xv1+ervrV2hszZ/tlVwC5ow/pYBNTzl1A7vc30/RyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 21:45:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 21:45:58 +0000
Date: Thu, 7 Mar 2024 15:45:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Yury Norov <yury.norov@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <cwdq47454ti5al7tqy4felzrys7w2la4djnwxvk3obj6x5pauy@rg535tmczv2c>
References: <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
 <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
 <ZeBhVb__VNQCgTQk@smile.fi.intel.com>
 <xrqqqiizufjx75k7z32ajchgepjkdww22hddddwxwsxljq5uhf@4etg6et52grj>
 <ZeDMkhJCvCa44lBM@smile.fi.intel.com>
 <bgixixj5lxkqkje2jqvkfhpvzagqd5fnpw63of4pnxyxky6h3y@wof63znjmczz>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <bgixixj5lxkqkje2jqvkfhpvzagqd5fnpw63of4pnxyxky6h3y@wof63znjmczz>
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af3c91c-7a90-4ed7-efb3-08dc3eeff993
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHZ3tgSzWpxuiSKoJeeoO/GM1uyhaQf+x4ZKcYKSUDqhmjZ3F7NkuaL0mcIXrtd4hW64Xmk98QwfwUP4yslbhykJ2c+jjRt9QXE+cD5/HrOur7eTHADkxv2dV1M94jCNy08xo+wTndT4nRQjd3qMcP3I5eczmEOhSMV6FveiDyHzzf4X+zLXRMTy8xn8Kn7HL3RQdU8ZKM1alfFUD7Y/GiWETG3PzksgtMdQ75hHeRmXrhPYmvMp4vbbUbnJQjs+rroFB4Mhzb8IaKr0baWVlc1ZcXgut5rq9rs00Ie3qy6Hu4PsR53EG3BaM1eOILB02t3WzITEk8CHqaE7zMzYzfAnolPgxvZWae6HNh/891N8MYy83d8lJdSBE/J8aYFYr9BxqsBWeu40syXvv7kwNhJK1BpF6VF67wJzuxwbk3yDQBJ79zDh83JMy1uYR4WzXK+ewrbtwToDW7UhJE5aK/CCr0f4PVxMNbelOFtA8iCgPedD4Dn0pColu3O0UPMd1CdviAWaqt2mFcmCBMjFjDTHKwNbHE8PloQ1EJnlIS8Qf35x0JsWhlBnjEMs3k6VorDf98wB91XN+M47eJZeP4KGIrNNDuWkhcd197h2fH5JaNM3c+rvUDs5hfblOU/lJKBSblTHIwqeFjdG25vrUQ6lg0rCSXVqK9H7rRTqob0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hd07I2/zP+spIxjeOUR847usJryF05tVRJBOAZKz3uvmjBx/doJdX+JX6ztH?=
 =?us-ascii?Q?sEFNEV3RUpxGfU48QffwPfn632s8w2g8h/BBCF2xZZy0ejDXVloT0N8O8hSV?=
 =?us-ascii?Q?Ab7RGa1i/IdqUIPaFYaEDvD20+y2hvroPaUH38IJMF8rsYfd4NHsOtJWsOqY?=
 =?us-ascii?Q?c75vLvlAIT3IA4hgur2FXoqU02hAm8rBbJ6yRO12RTeDc5cpAbjicwrmuL9v?=
 =?us-ascii?Q?fCmW/SoKSwminSODm95nl+fAOEKTkZmCGMyMEdu+SCkVWxfkQ1KRjiKJ8b+j?=
 =?us-ascii?Q?209xnNOaOuT81SrfAsPe6EuIXzEoSLCIEdx/6zKAwGhJlMGr31CWJXhKIxQ4?=
 =?us-ascii?Q?NBPskSzBHFL33cpxSgzteuE9wqAGjAM+XruRIrDiT8MEwHYurBPNOguYtlUE?=
 =?us-ascii?Q?jc17FTVgSxTaWBh4aGk/+ePHAFIklgseFVCm66bUQw2FjM1yU0mJlBcDj5aI?=
 =?us-ascii?Q?y6MO/7k9DA/o9tz7E32Q/A5Iu4qP0R27WWc/sxFlT2Ia+ckn1PoE335Rycp5?=
 =?us-ascii?Q?wHpcyE8cKP9FEimjYy6zUXIJmjq2dxwm0BfdT+WNzXnX6qdJSDG/WhlJI65c?=
 =?us-ascii?Q?VRuUI2bPOKBfX45qcLdrfd/Gl41TL72U1yejLvXiWpjfZs6G+4/mKvpkJ4bT?=
 =?us-ascii?Q?V1HfdvTIIcmlZJ6z53aOrLKYW9al7C5C22nJQnghHgU4Kya0jDlubAGGRbdQ?=
 =?us-ascii?Q?edkCN3Z0daiEPPQBM2U7je4t5azMlmz++3EZqhLcuoTBVK97sQiPxUl31XdX?=
 =?us-ascii?Q?44GdDbKlClrZa4R72ESA8KGsS469/22enFnZSQuOfg1UBgHTZ3vvhA7JBRZQ?=
 =?us-ascii?Q?6wVLfdNJ8LJrPaTH+G9kPmqF+HFglKRt19YSf0G++MGD05RNLNGFPaP9S387?=
 =?us-ascii?Q?61/pZqCxQ/NM8/IzB2sDES5TDpSAsvIU2ZyC185cAw1MODr6Kgf47yArhGD2?=
 =?us-ascii?Q?DmortBuwfNXG8pRXGxU5/CduKEyujyo146Ee9a92K8HOTUwr5yWSgA5jSIoh?=
 =?us-ascii?Q?KTNEWz0J6JaQTmnOgeDts6dkYWw4yHBTPhn4Rl9I0xYfOHBv4EVEbJtj+k+d?=
 =?us-ascii?Q?g9CuanrM0cogSgtDFh9hoydn8YK8l3OHPs5VNB2fmLae59ABMx+xjQEhG7Jx?=
 =?us-ascii?Q?0jqhtQMOtVlM2K+n/T/5JdwVGf4+X1y9V43Yi5SUcFI14PWOPMpUHIV10JMP?=
 =?us-ascii?Q?GK7qO6MnSGZ6msOIf0yhtQHtx0yajunnqwItPuWftTVVesUV+/J03MVqu+dz?=
 =?us-ascii?Q?xIrdrRf1TNYGsgV5FrEPat5ItpJ/qx1nmF2k54zh4uOTTyncvgf3qUySMIs/?=
 =?us-ascii?Q?MJ/DSq8zeSsajICemlncU/eTHAAOAAU+V/u2ABznCnwMgGfI8kjkDxQk6Py0?=
 =?us-ascii?Q?T/w2Vg1S+wAdpGrNfSCE30Rc/zXeT9P8ewR1y6ovbo+EmixapwqGtsR9c/b9?=
 =?us-ascii?Q?8COOFm8HLHw4mg5touhXY4XBKbtDRXf4IdWKevcFAYPHKmNUXBw5kbBfW1zf?=
 =?us-ascii?Q?rclgn6Bn15xbzQpREBCSbTa3qh0jZQ/xhX3aef9HlvV6ddN5U0jYgOuQYakS?=
 =?us-ascii?Q?0A6a8WIZWpRvvFxcGVu8bmH6WPuK8qWHEjt3zwfwJiN69iFISqoJnnqEQO7x?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af3c91c-7a90-4ed7-efb3-08dc3eeff993
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 21:45:58.6978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPHY8THru7f8nekdt62DSrMZyWKGYzn9QX/f1H8CJ2ueAWfkUAiJSBT3nxSbSxbmAkTvOMFByGBw40yHUMLppY7hUhW68i9Xzpa0ApPFeeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
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

On Thu, Feb 29, 2024 at 10:06:02PM -0600, Lucas De Marchi wrote:
>On Thu, Feb 29, 2024 at 08:27:30PM +0200, Andy Shevchenko wrote:
>>On Thu, Feb 29, 2024 at 12:21:34PM -0600, Lucas De Marchi wrote:
>>>On Thu, Feb 29, 2024 at 12:49:57PM +0200, Andy Shevchenko wrote:
>>>> On Wed, Feb 28, 2024 at 05:39:21PM -0600, Lucas De Marchi wrote:
>>>> > On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
>>
>>...
>>
>>>> > I build-tested this in x86-64, x86-32 and arm64. I didn't like much the
>>>> > need to fork the __GENMASK() implementation on the 2 sides of the ifdef
>>>> > since I think the GENMASK_INPUT_CHECK() should be the one covering the
>>>> > input checks. However to make it common we'd need to solve 2 problems:
>>>> > the casts and the sizeof. The sizeof can be passed as arg to
>>>> > __GENMASK(), however the casts I think would need a __CAST_U8(x)
>>>> > or the like and sprinkle it everywhere, which would hurt readability.
>>>> > Not pretty. Or go back to the original submission and make it less
>>>> > horrible :-/
>>>>
>>>> I'm wondering if we can use _Generic() approach here.
>>>
>>>in assembly?
>>
>>Yes.
>
>I added a _Generic() in a random .S and to my surprise the build didn't
>break. Then I went to implement, and couldn't find where the _Generic()
>would actually be useful. What I came up with builds for me with gcc on
>x86-64, x86-32 and arm64.
>
>I'm also adding some additional tests in lib/test_bits.c to cover the
>expected values and types. Thoughts?
>
>--------8<------------
>Subject: [PATCH] bits: introduce fixed-type genmasks

Yury, is this something you'd take through your tree? Should I prepare
the other patches on top and get some more arch coverage?

thanks
Lucas De Marchi

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
>	../include/linux/bits.h:48:23: warning: right shift count is negative [-Wshift-count-negative]
>	   48 |          (~literal(0) >> ((w) - 1 - (h)))))
>	      |                       ^~
>
>Some additional tests in lib/test_bits.c are added to cover the
>expected/non-expected values and also that the result value matches the
>expected type. Since those are known at build time, use static_assert()
>instead of normal kunit tests.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> include/linux/bits.h | 33 +++++++++++++++++++++++----------
> lib/test_bits.c      | 21 +++++++++++++++++++--
> 2 files changed, 42 insertions(+), 12 deletions(-)
>
>diff --git a/include/linux/bits.h b/include/linux/bits.h
>index 7c0cf5031abe8..6f089e71a195c 100644
>--- a/include/linux/bits.h
>+++ b/include/linux/bits.h
>@@ -22,24 +22,37 @@
> #define GENMASK_INPUT_CHECK(h, l) \
> 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> 		__is_constexpr((l) > (h)), (l) > (h), 0)))
>+#define __CAST_T(t, v) ((t)v)
> #else
> /*
>  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>  * disable the input check if that is the case.
>  */
> #define GENMASK_INPUT_CHECK(h, l) 0
>+#define __CAST_T(t, v) v
> #endif
>-#define __GENMASK(h, l) \
>-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
>-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
>-#define GENMASK(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>+/*
>+ * Generate a mask for a specific type. @literal is the suffix to be used for
>+ * an integer constant of that type and @width is the bits-per-type. Additional
>+ * checks are made to guarantee the value returned fits in that type, relying
>+ * on shift-count-overflow compiler check to detect incompatible arguments.
>+ * For example, all these create build errors or warnings:
>+ *
>+ * - GENMASK(15, 20): wrong argument order
>+ * - GENMASK(72, 15): doesn't fit unsigned long
>+ * - GENMASK_U32(33, 15): doesn't fit in a u32
>+ */
>+#define __GENMASK(literal, w, h, l) \
>+	(GENMASK_INPUT_CHECK(h, l) + \
>+	 ((~literal(0) - (literal(1) << (l)) + 1) & \
>+	 (~literal(0) >> ((w) - 1 - (h)))))
>-#define __GENMASK_ULL(h, l) \
>-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
>-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>-#define GENMASK_ULL(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>+#define GENMASK(h, l)		__GENMASK(UL, BITS_PER_LONG, h, l)
>+#define GENMASK_ULL(h, l)	__GENMASK(ULL, BITS_PER_LONG_LONG, h, l)
>+#define GENMASK_U8(h, l)	__CAST_T(u8, __GENMASK(UL, 8, h, l))
>+#define GENMASK_U16(h, l)	__CAST_T(u16, __GENMASK(UL, 16, h, l))
>+#define GENMASK_U32(h, l)	__CAST_T(u32, __GENMASK(UL, 32, h, l))
>+#define GENMASK_U64(h, l)	__CAST_T(u64, __GENMASK(ULL, 64, h, l))
> #endif	/* __LINUX_BITS_H */
>diff --git a/lib/test_bits.c b/lib/test_bits.c
>index c9368a2314e7c..e2fc1a1d38702 100644
>--- a/lib/test_bits.c
>+++ b/lib/test_bits.c
>@@ -5,7 +5,16 @@
> #include <kunit/test.h>
> #include <linux/bits.h>
>+#include <linux/types.h>
>+#define assert_type(t, x) _Generic(x, t: x, default: 0)
>+
>+static_assert(assert_type(unsigned long, GENMASK(31, 0)) == U32_MAX);
>+static_assert(assert_type(unsigned long long, GENMASK_ULL(63, 0)) == U64_MAX);
>+static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
>+static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
>+static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
>+static_assert(assert_type(u8,  GENMASK_U8(7, 0))   == U8_MAX);
> static void genmask_test(struct kunit *test)
> {
>@@ -14,14 +23,22 @@ static void genmask_test(struct kunit *test)
> 	KUNIT_EXPECT_EQ(test, 6ul, GENMASK(2, 1));
> 	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, GENMASK(31, 0));
>+	KUNIT_EXPECT_EQ(test, 1u, GENMASK_U8(0, 0));
>+	KUNIT_EXPECT_EQ(test, 3u, GENMASK_U16(1, 0));
>+	KUNIT_EXPECT_EQ(test, 0x10000, GENMASK_U32(16, 16));
>+
> #ifdef TEST_GENMASK_FAILURES
> 	/* these should fail compilation */
> 	GENMASK(0, 1);
> 	GENMASK(0, 10);
> 	GENMASK(9, 10);
>-#endif
>-
>+	GENMASK_U32(0, 31);
>+	GENMASK_U64(64, 0);
>+	GENMASK_U32(32, 0);
>+	GENMASK_U16(16, 0);
>+	GENMASK_U8(8, 0);
>+#endif
> }
> static void genmask_ull_test(struct kunit *test)
>-- 
>2.43.0
>
