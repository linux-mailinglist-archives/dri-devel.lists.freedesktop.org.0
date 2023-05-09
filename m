Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385436FD17B
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 23:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A3710E3D2;
	Tue,  9 May 2023 21:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66F010E002;
 Tue,  9 May 2023 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683668100; x=1715204100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0VhGDMX7szgI/jXvFlp7pUy7TnixG0/xz50rzEiEqHc=;
 b=JLpRtxy0VDx6GcLuZxmeJdJPrTf74LxOZpOG84YSmgZu8LOCFexl+gpC
 rajheWZJrYjWLvtixoCDNnZwOhd3vYDeUozwk2XDFw4DPupowbkrbFlga
 nuFRtgCvhBnhnXn+VMUYt9OZr1qiMi8B6XxQyMccyKJ1dM9c3JuJZN276
 xeZF5kpWfnF9oQagvIUyIqdguCnaYTsrT1LZb/0QUrOPf9XoOde13udPk
 Xtgahv/hSqFjjXpEHiYSlo6Eq1ql49HnBVkVF1IY4eLRG4oLNzVs+EjSi
 bMF3okzcfGqRnj0duhkxqU8hxdbdoJ4vWlw/djapHgzUEkSlJX67/gMyA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436380279"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="436380279"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 14:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649498658"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="649498658"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 09 May 2023 14:34:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 14:34:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 14:34:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 14:34:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 14:34:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcS634zHVldLPSMYUnnJeC9i4BNG15aZ08dUQ+3jalOVDTQSIEqqrhuqMsSVQImw79WHIq59BkAP8hTAt6FAUuHayyejNTSBQhOeGkUDt0JzAj0njoFWrejrTvwAXYDJZxPLlcYRain13qP43DHpKkQYzCjMt5LoFV91ALUqf32SOowZsCQyAYLezMyk/C3ZPLu26sqlYSC8YqsWBKZSPBqsszj6nkQq50s3hSANKa6+ywSz9mwAMkIWvry5GR3Iq3rdIzHmFgxDgSMsnVosoZDiDA2RFaZhol4awxnCIgYFKZAD2wu8osY9KObGAH1Zd9hgbJIl8sdC4JqUDz5qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVjOLe3XhT/YgQrYKIpt6UL4D6gRJxws3vrUOriytB0=;
 b=fQQajFNo+DRHDeiyULivV4S7jkHjBWqpHV0wbm1CvXklAXp+7QAHbnExfhpernnjB/0JzB1JZQ1jrlPrQ3GNNJU0QSQ5ZCmCcWCCtUukxqHc+UmTN+os796cPvKOblyiJm1M0RA4E2g+e3h/zCFjERDGRYD70mlViZimbBVuELfOjppjNgVK3nwnWjzfAxs00Bg8ZWqI2dymE9AovIirS9koNZS2YqrcqO0P3vF6Lx5xjUIzAOJFp41nclx/i+Mc0VDcSIFx9yvbiYLwio833BadYyObeWXWsr+RKPIYMub69fhEWNuc6RR5SXq3zoCGblqRa2fE1nEfSoYCFC/YEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 21:34:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 21:34:55 +0000
Date: Tue, 9 May 2023 14:34:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and
 BIT macros
Message-ID: <iakuowef3ysobpcpa6f74kolw44zyjepb5byjxljp4mxuwunkn@rdegvnuzbnmi>
X-Patchwork-Hint: comment
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <168364083689.27719.2337781022536351304@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168364083689.27719.2337781022536351304@gjsousa-mobl2>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 44dceb25-e1e5-46b8-d8a4-08db50d53ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/Cj2wvh5Mk3Bo0YIGuaxHqAA8532LinbBIm/gNfalntw7K1A6IDVzp3MdwGBJIyhYlIXF8aruUB2KAmhlgZVKC3qd+bSAnCGGA0YqgAVBilSJn98YHZtQzf82bKU448sZdbpkioj+4lVd4XuiikFVpMioJ7F9FnI1dCSl97ftftUIcJEQzA9/luROwJeVcgcydKbR/9nM/pVzkE9tLFYGMgSqSgwR/5ynG1+V2ShCX0tiE20PZcSALeR7fhREai5GH7V7VSWZAg2WrHwldAuVw2UVQHhOo8jHEsraCDKA0EjDl5nVN7M5fYLZLDCk2cf8uQaEjN+vDkJ2xSjwPA0MNCyDfLWaOvcuxUgP/i97e2/A1LWnMKOLN33snepKsFLEHzpvWtjoAM6bGl89r3ek2BcJKrZjWnlFjTNpyKcyxUnAu/y4XSZo5q5xo51ucC4EGsdBB/dVEqR5PJUrNX7rM3E+R6jjm+SIfjICtgR8c1xSiiiiatCxoo3KIROZ4Yh9pCL3SL2DGZTNg5zfZzmEu+qDWJEr0C0l+IvP758BRNVdlX04vyHqDJFFbLusBIaiJiIvJMSOaHW/u8W1lnwYSAtFHfpvhQy6NWu1BnSd19i30vO/oY0oxVaScAapPR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(6512007)(6506007)(186003)(9686003)(2906002)(26005)(6666004)(6486002)(66946007)(86362001)(66556008)(82960400001)(4326008)(41300700001)(6636002)(316002)(66476007)(54906003)(478600001)(33716001)(7416002)(6862004)(8676002)(8936002)(5660300002)(38100700002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBtOR1IE3aHL/6t1J3IX65PhlLBR8j/FEdwvZDAxz4kOYJgNytdInKU4e6qW?=
 =?us-ascii?Q?ZLvpPC6TueITr32BJ9lcekVWcyHxGoxqtl7EFvzFH/zk+mSEqw6TxOCRMOPN?=
 =?us-ascii?Q?SBQ/Rs27ouuFDBBxQhy2kcg9yD+/yAHu3Evw5kKBWi3RmWMK/iuysN2zDA9m?=
 =?us-ascii?Q?zHrklPSVWsN8CV524C6+tlxgdfKktXk0hHpSYYYwXHJJT8wjdpLqrYI9JeoB?=
 =?us-ascii?Q?tt3vDtzfd2yxkUeA0W5VqiQB5AtRR5hjSC0Rw1UOdN1650WNzTGte8pQuNTa?=
 =?us-ascii?Q?QBl1stOY/WDAeDHj34gl3v83m6lU8T0/Ih3EgZbrPYUg2HcpQviDBhgMiHye?=
 =?us-ascii?Q?WHNI05Cl0I26E/vMfZRWTgJuLX5KygOfd2ILOc4o+X5vCG0KNv5AXNENy/lK?=
 =?us-ascii?Q?RSRxTHBYuGZo3uAorE3Ih+hCtH6ms/cLPaggtfUag74Bt/Li0VdfPyiB2BFF?=
 =?us-ascii?Q?P276jYlfZhITIDkGnmQeUQXSOQU7/OecEj2JwteADV1+0SYjc32chvzYFwGS?=
 =?us-ascii?Q?JPtMLRqPGZmGAjGRnVbwWh4JQ5fmqfOU1ZywsqeLGZLL2jybDD9ivW5ikLG/?=
 =?us-ascii?Q?IBZftMnRwfY0QAlcSBTV+uKXUq7DsopDT5qDigpMZe5LzeGQye/wslaL3WYm?=
 =?us-ascii?Q?uUp2ZFdU69BdyRH6SheM8IF4X8xdLlGUeELPBUYogs8THTrQlEyMECYEwb6S?=
 =?us-ascii?Q?7eZmur9fkPMEenDti/jpbfyfLmkVmd5rsBYoZZeUzgrIgrCHlS27S5b9lgxi?=
 =?us-ascii?Q?CiED3xVqwepbUN/Ug9CQ27+sA6P8+TBp4O5eLSn0PDFXGjTXsZMjsUOeZGu0?=
 =?us-ascii?Q?iP0z0lCNsipPRhVNkOrWOhfwK8nE6jJ0H+uOyvv91Ms2jWmIBIEp1u1cBMBV?=
 =?us-ascii?Q?M/yj5+4r/rRSC5Eab90gMCLeS2EF7H7CBTWIVrkbpSdnIUuzMo9USMzBe8HK?=
 =?us-ascii?Q?b9Y74UCcz+vTDkKtmi7B0peBpAqqetrtyC31JI8aLavY5QPGpcseE/j3hC2p?=
 =?us-ascii?Q?zLXlwpW+qpV9xzUQjnaxWlTxVd6OAXHxLxXfxAqkli1dkGDTNp7k2zyQyIPK?=
 =?us-ascii?Q?VI1B7WRDbU0ExICGRpj5nZMvpjUKC4729nVhWZCL2iS4kiOTb+QNkt0oj0my?=
 =?us-ascii?Q?2TWNIt6xVqAoDwNIUzZTch7z7J/PF4wxg8zmL1OXwnaz5klmaTTcHHzPsQ5O?=
 =?us-ascii?Q?1csVTLkuNBpV8T/8cVLXCtGhsNFfebl1pWN9AKHz38JAoM87NGKLPJ121l99?=
 =?us-ascii?Q?pSQor83dJj3Zm1PXVajGVxnN+UwcQh/tJCOfB8SMMOImWboC0AySWVM+HQ6a?=
 =?us-ascii?Q?QrAnJTzmIE4J0IuTA5mBi5p45at7PRZY6pAvKGZsNZpYX1DxLLcFYetYchPP?=
 =?us-ascii?Q?L8hK72tWjOqtJtmCkOlUILaWwuudemJXzw0Doakr/B/VNWX1f39Hlq+5CsJZ?=
 =?us-ascii?Q?COisX5XhBCfRZZE5BnaeX6luZD2tZWBwxtD1LpRBVClsS+St3kh7hAnssNku?=
 =?us-ascii?Q?N+X2jIKAOv14BQ1Pj2+toeQH7qHju629/biWXU1nho7U0g775APk99CGgBXv?=
 =?us-ascii?Q?w9RbHmzBWmVj3XMiOIOZ108LFUS5+jShvbylZ7sEHgjlO2rxXGTr7WurXylO?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dceb25-e1e5-46b8-d8a4-08db50d53ae2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 21:34:55.1486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB4StLGrZxO9sKD97I1n1KWIIJ2vRsKG4s8naueaSanr7fhsOmS4Q8HFAB6MrWyE1BdNtKJuI23Si7UWkuo/bkGMQ3gqj/zzDDgM1OtYrHI=
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
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 11:00:36AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-05-09 02:14:02)
>>Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>>masks for fixed-width types and also the corresponding BIT_U32(),
>>BIT_U16() and BIT_U8().
>>
>>All of those depend on a new "U" suffix added to the integer constant.
>>Due to naming clashes it's better to call the macro U32. Since C doesn't
>>have a proper suffix for short and char types, the U16 and U18 variants
>>just use U32 with one additional check in the BIT_* macros to make
>>sure the compiler gives an error when the those types overflow.
>>The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>>as otherwise they would allow an invalid bit to be passed. Hence
>>implement them in include/linux/bits.h rather than together with
>>the other BIT* variants.
>>
>>The following test file is is used to test this:
>>
>>        $ cat mask.c
>>        #include <linux/types.h>
>>        #include <linux/bits.h>
>>
>>        static const u32 a = GENMASK_U32(31, 0);
>>        static const u16 b = GENMASK_U16(15, 0);
>>        static const u8 c = GENMASK_U8(7, 0);
>>        static const u32 x = BIT_U32(31);
>>        static const u16 y = BIT_U16(15);
>>        static const u8 z = BIT_U8(7);
>>
>>        #if FAIL
>>        static const u32 a2 = GENMASK_U32(32, 0);
>>        static const u16 b2 = GENMASK_U16(16, 0);
>>        static const u8 c2 = GENMASK_U8(8, 0);
>>        static const u32 x2 = BIT_U32(32);
>>        static const u16 y2 = BIT_U16(16);
>>        static const u8 z2 = BIT_U8(8);
>>        #endif
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> include/linux/bits.h       | 22 ++++++++++++++++++++++
>> include/uapi/linux/const.h |  2 ++
>> include/vdso/const.h       |  1 +
>> 3 files changed, 25 insertions(+)
>>
>>diff --git a/include/linux/bits.h b/include/linux/bits.h
>>index 7c0cf5031abe..ff4786c99b8c 100644
>>--- a/include/linux/bits.h
>>+++ b/include/linux/bits.h
>>@@ -42,4 +42,26 @@
>> #define GENMASK_ULL(h, l) \
>>        (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>>
>>+#define __GENMASK_U32(h, l) \
>>+  (((~U32(0)) - (U32(1) << (l)) + 1) & \
>>+   (~U32(0) >> (32 - 1 - (h))))
>>+#define GENMASK_U32(h, l) \
>>+  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(h, l))
>>+
>>+#define __GENMASK_U16(h, l) \
>>+  ((U32(0xffff) - (U32(1) << (l)) + 1) & \
>>+   (U32(0xffff) >> (16 - 1 - (h))))
>>+#define GENMASK_U16(h, l) \
>>+  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U16(h, l))
>>+
>>+#define __GENMASK_U8(h, l) \
>>+  (((U32(0xff)) - (U32(1) << (l)) + 1) & \
>>+   (U32(0xff) >> (8 - 1 - (h))))
>>+#define GENMASK_U8(h, l) \
>>+  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U8(h, l))
>
>I wonder if we should use BIT_U* variants in the above to ensure the values are
>valid. If so, we get a nice boundary check and we also can use a single
>definition for the mask generation:
>
>  #define __GENMASK_U32(h, l) \
>          (((~U32(0)) - (U32(1) << (l)) + 1) & \
>           (~U32(0) >> (32 - 1 - (h))))

the boundary for h and l are already covered here because (32 - 1 - (h))
would lead to a negative value if h >= 32. Similar reason for l

Doing ~U32(0) didn't work for me as it wouldn't catch the invalid values
due to expanding to U32_MAX


>  #define GENMASK_U32(h, l) \
>          (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(BIT_U32(h), BIT_U32(l)))

							^^^^
that doesn't really work as BIT_U32(h) would expand here,
creating the equivalent of

	~U32(0) >> (32 - 1 - (BIT_U32(h))),

which is not what we want

>  #define GENMASK_U16(h, l) \
>          (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(BIT_U16(h), BIT_U16(l)))
>  #define GENMASK_U8(h, l) \
>          (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(BIT_U8(h), BIT_U8(l)))
>
>>+
>>+#define BIT_U32(nr)       _BITU32(nr)
>>+#define BIT_U16(nr)       (GENMASK_INPUT_CHECK(16 - 1, nr) + (U32(1) << (nr)))
>>+#define BIT_U8(nr)        (GENMASK_INPUT_CHECK(32 - 1, nr) + (U32(1) << (nr)))
>
>Shouldn't this be GENMASK_INPUT_CHECK(8 - 1, nr)?

ugh, good catch. Thanks

I will think if I can come up with something that reuses a single
__GENMASK_U(). Meanwhile I improved my negative tests to cover more
cases.

Lucas De Marchi



>
>--
>Gustavo Sousa
>
>>+
>> #endif /* __LINUX_BITS_H */
>>diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
>>index a429381e7ca5..3a4e152520f4 100644
>>--- a/include/uapi/linux/const.h
>>+++ b/include/uapi/linux/const.h
>>@@ -22,9 +22,11 @@
>> #define _AT(T,X)       ((T)(X))
>> #endif
>>
>>+#define _U32(x)           (_AC(x, U))
>> #define _UL(x)         (_AC(x, UL))
>> #define _ULL(x)                (_AC(x, ULL))
>>
>>+#define _BITU32(x)        (_U32(1) << (x))
>> #define _BITUL(x)      (_UL(1) << (x))
>> #define _BITULL(x)     (_ULL(1) << (x))
>>
>>diff --git a/include/vdso/const.h b/include/vdso/const.h
>>index 94b385ad438d..417384a9795b 100644
>>--- a/include/vdso/const.h
>>+++ b/include/vdso/const.h
>>@@ -4,6 +4,7 @@
>>
>> #include <uapi/linux/const.h>
>>
>>+#define U32(x)            (_U32(x))
>> #define UL(x)          (_UL(x))
>> #define ULL(x)         (_ULL(x))
>>
>>--
>>2.40.1
>>
