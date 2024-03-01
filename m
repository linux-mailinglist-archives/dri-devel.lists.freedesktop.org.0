Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67086DA83
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 05:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512BF10EA8D;
	Fri,  1 Mar 2024 04:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNA8vEQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464210EA8A;
 Fri,  1 Mar 2024 04:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709265969; x=1740801969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RARxjMjorndujOXt7tW8m6LxDP++yid21v5Hk1Y3XOw=;
 b=nNA8vEQP3DEyzS55x2hbQZRZjMzLixakO3XEgoleaaYztfttNSO6HQsk
 9LH5x4ayc9PVlwqLcDuQ6ATwe7K4jugw0K8iiMMMS8Db+MS49r59BWTrK
 lNn0/YvlJkzNbKwitaT2qxeWuiPMiLtaGE/w9vZ059h0jwYzkqnXLNMOJ
 NKUKFDJMpwTtQ1eplSmtNyO0CKxWVjjuUNWk2x+iYBmNwBhFJN5Bn8nSO
 wuQ38QPjY9lDa7lP8vt1mPS2+XjXeV1aAB4BhKaJtItfqDv0+CcTDCZ9M
 YZujI0IJMkDwfyu5ZkzJPju40B0iEZETGLbYUlOiVfYM3xqR0nJJ1RNwP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3903138"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3903138"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 20:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="38904572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 20:06:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 20:06:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 20:06:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 20:06:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 20:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EipbkBiPwutaoazUuUNRwOIW5Q4Fw4rB7ZIsb4hOYuEdRjo5BNipp7lFSzY81MYTwY3SOkd9rU0paU2ZHJH0YImLIoIxMWaawEGVaxGOe5iQ9X/pa95XvYf+yoEot7gaFRrb8mbHfTDIFhtLYctY8AzUKZ9+GgplAp/tb4Gmo3bZESaMKcCypD2v1vGTmQb7iqnE4eBsTIjQcfLhZkOcMNn+r1xYAJOTNZtz//PgEU95swVPVzVKka0uvJk15Mu83N2K4YzvzWyb+Y+flownt0Vk+gj2rjOYZZZJAFb7wL5CtL0F9JM2e5yjhsQNQmO6pillPnEav80qdPZTYLEp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXzXa4ho3O75NRKDxHJxZ5hnMjrnDvRMuvq4Lzrn3LU=;
 b=m5Tb5VED6tneYBUuSVqi62aBogOrEzbNXfhzuHXQwA3IUcBHbvtsWzM+uB+H8rTYPBVFcwKUf4e98Afpz/eAAJGyyGy3P9jc+93p9WeOUiKwQWkTA17eurEvtLVAXuH1PREiOSLk00KqNiP1jh+DihzC6fBd3xK7TAHiGbwBmo51Uf/bAreLSpuik7zaASM069m0ttY80714kiP5bGdPwFx6iroVTJMO3Q8+SjBf1tyjbqh7QKhaHtQFhceaWKCGQSYLWddzpwR/1fAJ19YMPEFgOMb04PEePRquqwr+eQnKzqwNffUlGf4XxE5eY2VxTWduBXbdSFis3T1eHOEdWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6676.namprd11.prod.outlook.com (2603:10b6:510:1ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Fri, 1 Mar
 2024 04:06:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 04:06:05 +0000
Date: Thu, 29 Feb 2024 22:06:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Yury Norov <yury.norov@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <bgixixj5lxkqkje2jqvkfhpvzagqd5fnpw63of4pnxyxky6h3y@wof63znjmczz>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
 <3o3nvkg76sofrhgcuogo3wuhitnz3bgus6qzle7pejng3v4s62@frdbuj46uiu7>
 <ZeBhVb__VNQCgTQk@smile.fi.intel.com>
 <xrqqqiizufjx75k7z32ajchgepjkdww22hddddwxwsxljq5uhf@4etg6et52grj>
 <ZeDMkhJCvCa44lBM@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZeDMkhJCvCa44lBM@smile.fi.intel.com>
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 8938ac96-77cc-44a8-5beb-08dc39a4ea7a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zbd3Uwac2r8NDAflOb6+bAcNdHZ+BIYJ7kdgLlVrGlkPJ4KPq6a2v00PKGy1/u2BaJdcS9nPzZIPZwaf+s8S1mBWflsEdNBr4jqHwXDr76MdpRgaFk1bg5xgNqCGi88ayQBFWx5KMm84FNiPum5iRLNFaiVYBx9b0s8YCiBxbLSpqZbpvuYYYrPfOGLvo/vRvySwCijtdHm4FffDXH284mQ5rhY7y7wj8ch7+JO19yCBCMB0j6IaYIcKEciSUzOjrd98zaMvQFrGoj/wsigA0TCf65YJnbbyDbsOTwzCtNVRmZzXUW9OaCyoxSciI1l6aARRt5/Hw/IovkgKErfbISi4URz5AhU705mNT2d/UfmC9pltAyRmaCapySOsRUC9VNQwaWEgNiDSruaOaFXGWNJymHbTQ1MYj0pcuS5NJWSAigHKk2rJto9uxHJ4P0hR1u9dcAalNK3K/xSBQ0KDLnrLYUFSA7L/NuEaiYjK+a5HCUxI5usTMHquuS+Cc/um5OflFZzPA1YOu2XwhXhvgqyxRxtPi/c2aLsqRnbtzyW2uBRwXFbYAKR5FUtSzsWcL2kfF3UIMOcU0fubGLj4Tx6rlq3G8imiEbyM2vOtJF6Pb/I4KAl27/PTlxcUCncxcE6Vf8EJr+8jwDnbzzYdRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/bexOFo0Q1GfOfMit8oPqTfSIxkjrqX9eGrldxsvr6cEwBOrB0hMqN6LkjS5?=
 =?us-ascii?Q?vndAxYy6O0azHbOQJ5wZ1kL9CapI/viPUDbtAOvCyoA86LaSOwiP2TifPbtc?=
 =?us-ascii?Q?j3X+/SHbICaV2RQPzSu7bQHxtUp3PPN8S4U/sqpwRq2tOCWBXLEU307zNgV2?=
 =?us-ascii?Q?pzziXeidg0Qmsy2C6Y+73Mo6iqJgeHKYhHfC3dJvHRZ5fcFJlN4h6dz9LIxJ?=
 =?us-ascii?Q?SSKcmuma3S9+fztMUJDXHzvx5To6udE6UbzAWntBD7ltE5KqmSSAWfNTiEqj?=
 =?us-ascii?Q?tmuz1qHlwuyKA4UzJxSRWgYFy2LKHG2Q8p4/xQxIetNXvPyxZmeT5Ec6PaYJ?=
 =?us-ascii?Q?/YlfsFAquOvEXE2A0VX+QJZjXnpwEJ8q/hDj6pOj6dx5aX2LGymEBV9HxaAk?=
 =?us-ascii?Q?Tr8UtuKcGijGEe8NNKBUOxAiIQqJgx4AgMa6UT2hHMrDCOyZLioZq36+R1Wa?=
 =?us-ascii?Q?cgEWfZ12q9bMBtOCkaYAm2SxmepPdjorlNkqDJcvKEb99q4LlWIW9Pg0y25e?=
 =?us-ascii?Q?rkOiuwgNxuj25vS//EzFTtDKkOO4yEsy33H/0/qKgzfYT+ZAdz8NeScJf6ci?=
 =?us-ascii?Q?i4EsUatnv3AUIFdOAeyQdBcOWIdeQE1OzuC+05k1eOipcb9czUL20GJDgkRQ?=
 =?us-ascii?Q?D2tYYO8+rL00BQfjD+kn0p3qmELCqrQ5NS7ymuu6rX1TNVH3c43/WXDEMDd9?=
 =?us-ascii?Q?ije/42vL3j37fuqIRjZIKiv/c318iw8gKZbsZ0KAP3MePnBU51HQSzSqNgNr?=
 =?us-ascii?Q?5rC1MuyEWBkNXTDshIUaFvkiRYI/d1iAeUR8OwBylffUPbk18VP1QIPXJDnd?=
 =?us-ascii?Q?3sAnhecL7/WS+Vqlki3y+JZEmkCc9pkjyXDERGwqmxE6m5i1mGqcxk0DeF9A?=
 =?us-ascii?Q?TXwEx6w/YGbmJ+kGxo9NdG4Awel1m6oGmHKT6PIDwG+thEMEVwEUj303pWDa?=
 =?us-ascii?Q?0FwRqAMRLB6JZoLLokxPn8mOu49//lJvZU69nhrIWi2DTBCYFdGN1wB99UM8?=
 =?us-ascii?Q?qiSQ1pxicFWBRTMlwTRtpJ+5BbRORV7lgmsuboENbG9vMks2ooqRaQJmUTNP?=
 =?us-ascii?Q?uCD3qdOTpZ6PrkxVLvWKC795jK2Prx4ZkJZU7E1duoped1lYtjw+7xi9mjyz?=
 =?us-ascii?Q?iRKtRLygJPd39CNtkOrvmJr5vFXrJQQ8+hBA2TSeLq50FNNwoUQO+oWD5619?=
 =?us-ascii?Q?yk5d3x8kndnZHb/oHSgkMQEzqpy38hl/Zb2itTzzeZ78egRPCG5ZVQ8EPnZW?=
 =?us-ascii?Q?pcpOynUwNqTYRDJ+xQDhdo9QSQKTIpGvEz4wgfo3PKLPwwUlzR9PBbKNWoH2?=
 =?us-ascii?Q?Ne4Pm7Lp0GtGvs/yhzaKNSpjcJTOB2ejUZOZrLOAtkXmZe/Yk3Y45L2++uTy?=
 =?us-ascii?Q?PXviQv4BTPfwPp8Od/k5Ogoiq2L5gH59vI/fgMqKDJe/ZVz/1uoxO2dks5mY?=
 =?us-ascii?Q?3fS9uaVuLcTtAYwKZa34n61dJGXwUsny8gACqoW9RmCTpz5mDivK1JSktS/g?=
 =?us-ascii?Q?Xh1qpHRAnS1ktG9MM6e3zLbS/1bgUC69PIamdIPJ0mgtRMrbV6093whNOPU2?=
 =?us-ascii?Q?AdHjIN8RpwnWQ8AhrgR+bkKqcKJpqq3x+VV6jIWkRRtyOedFsdQ/mvdzYDON?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8938ac96-77cc-44a8-5beb-08dc39a4ea7a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 04:06:05.2653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gZt3aoXhHshkaY5uUvyrx0M/4VAR3rwYRh2Cj28QYDkDiYbJLGvR0TzTbN1ISO0B0WYG3Vfwm9LzdLotaf0wCt4rYI78kQ3uI1e2SsSjfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6676
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

On Thu, Feb 29, 2024 at 08:27:30PM +0200, Andy Shevchenko wrote:
>On Thu, Feb 29, 2024 at 12:21:34PM -0600, Lucas De Marchi wrote:
>> On Thu, Feb 29, 2024 at 12:49:57PM +0200, Andy Shevchenko wrote:
>> > On Wed, Feb 28, 2024 at 05:39:21PM -0600, Lucas De Marchi wrote:
>> > > On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
>
>...
>
>> > > I build-tested this in x86-64, x86-32 and arm64. I didn't like much the
>> > > need to fork the __GENMASK() implementation on the 2 sides of the ifdef
>> > > since I think the GENMASK_INPUT_CHECK() should be the one covering the
>> > > input checks. However to make it common we'd need to solve 2 problems:
>> > > the casts and the sizeof. The sizeof can be passed as arg to
>> > > __GENMASK(), however the casts I think would need a __CAST_U8(x)
>> > > or the like and sprinkle it everywhere, which would hurt readability.
>> > > Not pretty. Or go back to the original submission and make it less
>> > > horrible :-/
>> >
>> > I'm wondering if we can use _Generic() approach here.
>>
>> in assembly?
>
>Yes.

I added a _Generic() in a random .S and to my surprise the build didn't
break. Then I went to implement, and couldn't find where the _Generic()
would actually be useful. What I came up with builds for me with gcc on
x86-64, x86-32 and arm64.

I'm also adding some additional tests in lib/test_bits.c to cover the
expected values and types. Thoughts?

--------8<------------
Subject: [PATCH] bits: introduce fixed-type genmasks

Generalize __GENMASK() to support different types, and implement
fixed-types versions of GENMASK() based on it. The fixed-type version
allows more strict checks to the min/max values accepted, which is
useful for defining registers like implemented by i915 and xe drivers
with their REG_GENMASK*() macros.

The strict checks rely on shift-count-overflow compiler check to
fail the build if a number outside of the range allowed is passed.
Example:

	#define FOO_MASK GENMASK_U32(33, 4)

will generate a warning like:

	../include/linux/bits.h:48:23: warning: right shift count is negative [-Wshift-count-negative]
	   48 |          (~literal(0) >> ((w) - 1 - (h)))))
	      |                       ^~

Some additional tests in lib/test_bits.c are added to cover the
expected/non-expected values and also that the result value matches the
expected type. Since those are known at build time, use static_assert()
instead of normal kunit tests.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
  include/linux/bits.h | 33 +++++++++++++++++++++++----------
  lib/test_bits.c      | 21 +++++++++++++++++++--
  2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 7c0cf5031abe8..6f089e71a195c 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -22,24 +22,37 @@
  #define GENMASK_INPUT_CHECK(h, l) \
  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
  		__is_constexpr((l) > (h)), (l) > (h), 0)))
+#define __CAST_T(t, v) ((t)v)
  #else
  /*
   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
   * disable the input check if that is the case.
   */
  #define GENMASK_INPUT_CHECK(h, l) 0
+#define __CAST_T(t, v) v
  #endif
  
-#define __GENMASK(h, l) \
-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
-#define GENMASK(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
+/*
+ * Generate a mask for a specific type. @literal is the suffix to be used for
+ * an integer constant of that type and @width is the bits-per-type. Additional
+ * checks are made to guarantee the value returned fits in that type, relying
+ * on shift-count-overflow compiler check to detect incompatible arguments.
+ * For example, all these create build errors or warnings:
+ *
+ * - GENMASK(15, 20): wrong argument order
+ * - GENMASK(72, 15): doesn't fit unsigned long
+ * - GENMASK_U32(33, 15): doesn't fit in a u32
+ */
+#define __GENMASK(literal, w, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 ((~literal(0) - (literal(1) << (l)) + 1) & \
+	 (~literal(0) >> ((w) - 1 - (h)))))
  
-#define __GENMASK_ULL(h, l) \
-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
-#define GENMASK_ULL(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
+#define GENMASK(h, l)		__GENMASK(UL, BITS_PER_LONG, h, l)
+#define GENMASK_ULL(h, l)	__GENMASK(ULL, BITS_PER_LONG_LONG, h, l)
+#define GENMASK_U8(h, l)	__CAST_T(u8, __GENMASK(UL, 8, h, l))
+#define GENMASK_U16(h, l)	__CAST_T(u16, __GENMASK(UL, 16, h, l))
+#define GENMASK_U32(h, l)	__CAST_T(u32, __GENMASK(UL, 32, h, l))
+#define GENMASK_U64(h, l)	__CAST_T(u64, __GENMASK(ULL, 64, h, l))
  
  #endif	/* __LINUX_BITS_H */
diff --git a/lib/test_bits.c b/lib/test_bits.c
index c9368a2314e7c..e2fc1a1d38702 100644
--- a/lib/test_bits.c
+++ b/lib/test_bits.c
@@ -5,7 +5,16 @@
  
  #include <kunit/test.h>
  #include <linux/bits.h>
+#include <linux/types.h>
  
+#define assert_type(t, x) _Generic(x, t: x, default: 0)
+
+static_assert(assert_type(unsigned long, GENMASK(31, 0)) == U32_MAX);
+static_assert(assert_type(unsigned long long, GENMASK_ULL(63, 0)) == U64_MAX);
+static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
+static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
+static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
+static_assert(assert_type(u8,  GENMASK_U8(7, 0))   == U8_MAX);
  
  static void genmask_test(struct kunit *test)
  {
@@ -14,14 +23,22 @@ static void genmask_test(struct kunit *test)
  	KUNIT_EXPECT_EQ(test, 6ul, GENMASK(2, 1));
  	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, GENMASK(31, 0));
  
+	KUNIT_EXPECT_EQ(test, 1u, GENMASK_U8(0, 0));
+	KUNIT_EXPECT_EQ(test, 3u, GENMASK_U16(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x10000, GENMASK_U32(16, 16));
+
  #ifdef TEST_GENMASK_FAILURES
  	/* these should fail compilation */
  	GENMASK(0, 1);
  	GENMASK(0, 10);
  	GENMASK(9, 10);
-#endif
-
  
+	GENMASK_U32(0, 31);
+	GENMASK_U64(64, 0);
+	GENMASK_U32(32, 0);
+	GENMASK_U16(16, 0);
+	GENMASK_U8(8, 0);
+#endif
  }
  
  static void genmask_ull_test(struct kunit *test)
-- 
2.43.0

