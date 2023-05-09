Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E816FC85F
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD9110E246;
	Tue,  9 May 2023 14:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E58010E23E;
 Tue,  9 May 2023 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683640878; x=1715176878;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Aza8sSmlIceDGlfKceVY3NrwPlUnuZ1nXgt+gaZ/6q0=;
 b=BjqloMumfTM7mtJ6VwOah3sIWcxcv/WWqiFLRma7md5gfC/P5WFKz1em
 bxjp/3Lr22My4OPE8SncKFgF9ykyqyGC8rxf/ZbZt18S2B9X3aEWwsrNp
 UYcJ+jsB4NDKHveBXazjP0D89PyioF0udA05KkzeGnvolA3UyOaYZulTW
 1tF0xuZBm0cSoFQmFTtkIEqB112hCcb/S+CFAaWL80e++adsLl4wUTIjV
 9OJQ1dol5NharxVG0WFiLQ4/p6ykqrRcMKl0xT98gldpBJf900PRrHnhR
 PraeroezOkVt6EQhYdwmSVkr2lc24lnFg3LeuxCOS3AptMmRJOaPGcwJ+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348765104"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="348765104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729522121"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="729522121"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2023 07:01:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:01:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:01:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:01:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdM9MHHjQr28n/QCGiCyq3DpWw4BZjomliVXIea4VQPS/drOR2DEjStRW86eBdcCGTw3RsK5mQT7bU8dQ/v3+AnLjYPB5AnDRuk4J0vOAzPte+MDTnnSSA/zzGxckGQR/Il+XBtJFRpXU8VQW8jBx8lGajz9GylGnU7C2xCWQZHlkiydCAK0RAiPtWzkuClNwR4yL917j/JXEgpgERiFEUpE5XkrqF9mpW8xheqZlTzzeauSY4uiLm87F5NAC2j/cu/uM0iY12Ofr6hH+539SzgUhztYTRbAHpTN1adoT/j2u+UnN5VTDNnL0LzpezBs5tDqNs9nExvFciMwmYk5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lur/k1f1r1YCVNo+FfwD2SkQGXa4XhsRjZWrIyXoNYg=;
 b=h+iIgLh8yhTUNQ7kOmRUHR8GUWExbZRWpEgZGlZf36ylyjuhwopj5EvsDv7aKYCksevmjsqsT9B1dxjEE58vH1G5ExkAfifjpDryAGdsZ2LuGnn2hhc45UMu1MYa83YZDXAY6wm9L3iw2YuDKWr/r29C4PlGDo7nYC0Lc87swKUZ7wwzWG6afbDHwZok3mIaBiveN9rjXuDecCBf1pLTRZblaY6ySbrZamFlNKCsBH/VHfAdpSuJ67JlJIPmCZp250VHOkifUECMCA/TXhu1iObc/bkeZz5AsTjvwEVPY3z5Hbzb6FMVMdQXQe/HVArSsEI7eLQE9fo7SnW72XnQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by BL3PR11MB5698.namprd11.prod.outlook.com (2603:10b6:208:33d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:00:53 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:00:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230509051403.2748545-3-lucas.demarchi@intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and
 BIT macros
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 9 May 2023 11:00:36 -0300
Message-ID: <168364083689.27719.2337781022536351304@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|BL3PR11MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0bd7e5-6ba8-436d-a01e-08db5095cd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0CvTP4RfeXrDLW0Mxrn005exJ/SnZ1QH+5sdSJjartMFo3rA3r5Z7bHiXNdy6EhalTbwyE0LuPriwevJGY9n+KACSLF+Sm2A4XKqvlH7HlwhDSsZ4QW+aJ9T3HuOISKskqL0b3tBc+Tl0zR2r36UMUGnbzGjndAm9rw7A4kVgf4OVP8DDSJh6FA7Jonh3oqvpemvYZ3Czhi3+dYd5cTXrlOTXThpYvHEwli9WG8EdeBOcMNj6mIeoTvH84qyNCL298Qt0SVQ9h1k7omR/Ab02MUxH50wFSaSSnJQX5LQrsb2nSfVF5U9Y/tzxr0H02x/qjhbinMRfGkGlvf5jJob4A9RYYvlHP5ymMrXF6QqDxz7hUqjHAKAtBRuJvqdq4MddxPlaKTWgvXfdgyMDeMwtJon2pK86IXnFCnp0gX2+8eYHwnjA6ISa1Gd3R56Qz5J8ZilckVYV6r80w0K34kLOOLKqiXDyB7+PnrtS/Yf6d+8u94oZf/XGoQmTpQjgS0kxu1naAB0oZa591kAqAc8LbNTqy1A1I2KijNSjNThf0MPYWYfA9tmVJzEV//tYcr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199021)(82960400001)(6506007)(6512007)(9686003)(38100700002)(26005)(6666004)(6486002)(186003)(33716001)(44832011)(7416002)(2906002)(86362001)(66556008)(66946007)(66476007)(54906003)(5660300002)(478600001)(41300700001)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjBEeW5wbWpFL1lxZDB5WTFYS1ZteE9oVi81NjV2TzBiUVZidlhvVTllT3dx?=
 =?utf-8?B?OUh5NEZiRnBVaXUvOGtqUnZOT0srTUtjMW9CVkk2aDkwbHczSWI0MmUxd0Uv?=
 =?utf-8?B?b3RYOVljNXNHeDRuTU5JWkJQRWZXVGlLV2dTbTFSZmt2VGhCY2hOandMd1RU?=
 =?utf-8?B?cmNsT3YzU1FmWU1wRjY5ZHNQTkZhQ0lCSHJ6RTBTSHhVYW1aL1M3emhCQjNr?=
 =?utf-8?B?N1puZENHSmlrSkhjU1BqbFFwcnFES1l6TkNCNC9renduQWNsZkdnTFZ1UUVo?=
 =?utf-8?B?NmJKT0RyZlVDNjZGSVJ5eEVSWnIwTTJsNmZKbU9Rd2dNOGdzTmsvWHhYRG1V?=
 =?utf-8?B?dlRkYnVwS3hRRlNiVjBGY3hoaGNyR0pMa2YrYXVlMFFhb2YrbUsrSENncUdz?=
 =?utf-8?B?T2htcHNGQXpqRmVlZTJZcnNVczRZYTdkOEhNVFBYQ0MvTktxRG50UFkxMHF6?=
 =?utf-8?B?eWN2dlBObVNSek53clg2U2czbFFweE1qQUlsMzVtOU5KQ25Nc285M0tpdjNY?=
 =?utf-8?B?aDF0djZDVEVWS25DV1lueUV5LzZpUGJ0TlZJalNocm4yaW91Ym9FczAxRnNl?=
 =?utf-8?B?Tm5oVExDZC91ay8wWkVGcFBRVUluMjBjTmljL1J5dWpkUGZkQXluVGdvUlRi?=
 =?utf-8?B?UlV0NGIxOHRobzhsMlY1MXR0MjhFN0ZlcFJtTCt5RmJVYXZHOENZV1c4dnVn?=
 =?utf-8?B?bXZmRjltUGsyRngyUFFjTDNpbVVZY1MzaVFZQXRneldOa2VBSXdicFZIVWJ6?=
 =?utf-8?B?NU9TUVcvQjVlVCszQzJxSk01QmNpbSsrZWpNNGt3WE83dkVXYWlMcm9OMEl3?=
 =?utf-8?B?WTdGMEtrTkptSWlHbFlvdnNKZ09GRm9Pckd3Ukpvejh0YUdNZ2x3VzVsektD?=
 =?utf-8?B?YlRZRTRRTzZpTkxjckY2c0tlYzNuWThTNzF4WDNRc255TC9nelFlQXlnUFNj?=
 =?utf-8?B?c2NkVWJmVGE1QUwweFN5QTI3T1hkOWt5M2syZHpJL2NweXlKa0lLN2lkbmdo?=
 =?utf-8?B?RnNNZG1QazV5ZFdiQjVaMnF4OElFUXNycjlKRTFMek1zVEtIU2R6d1R4eG5N?=
 =?utf-8?B?QlJISkVkSlFWOW9xNXdSZGlFYnhxazE4cDhUemRRNFFRZ3UwSFBIblUzTFJK?=
 =?utf-8?B?ZFcrZ3VLVURmQzVlWUd5MWJmNnBvbEhMQ3JmbjlzaklpQ3FFNFZob29TU253?=
 =?utf-8?B?SGZGSEk4eU4xWEhLaDhsanMxS05TZWo4R2s3aHpoYkxRNzJhYzJqVkFiQ1cr?=
 =?utf-8?B?TjVCRTBaYVNzVVJ6SmphRWd4eHM2NEo0UHhJVkNCSjlVNk9HMjlsU00wdno4?=
 =?utf-8?B?QlZ4bXp5U2R0UW01Y0pFQlptczY3U1VxNkFneVMyOFFabXBFcnVYQUtEM2tT?=
 =?utf-8?B?a0czcEJVQnFtOG91R3h2N1hJSzZ3SXpnSzR2TE9uYWwvSGZPNUxyVWZIcDdF?=
 =?utf-8?B?bWNyUnI1c1dzYWNFTVN3VDhZc2IzU2JWeGlQeTQ4ZndqV1NDWjBOem8yd2FB?=
 =?utf-8?B?ODB5Ym5ucndmZFVSTGZUa29vVHcwOFBDUEZzeVkrUUJLSGFid1RGblhTS01s?=
 =?utf-8?B?enBkR3FEbzBRRWhnaThFL2J0SXZrVkxJQTBCcDdoSklGMWZqYzRmZHJEWG9o?=
 =?utf-8?B?U2hreWhTMkpWR0JiaG5Sc1huWksrRWlCZXRmem1yYW5mbzM1NEQxMlVocTVR?=
 =?utf-8?B?akt6SWg4ZUswUVlRdDhFcGl6Q0tNdjBXNEQxYTVZNGlkL3ByakJzZVZFOFM3?=
 =?utf-8?B?dis3TW44YWxrclpQclNtbVlZTW9aVnZ3MTltYkhIUXZMbmFxV0hZM05KdG43?=
 =?utf-8?B?Syt2TS8xbUpvakVPZDhzYytWUE9Tb2FsTmVOYk02YzYxbGo1dWZxVXBMWHdt?=
 =?utf-8?B?QlppQkcrQ1I2bWQrNW9HZ1EvS1RpN21adVpHd0tocUgzQ1dVZEttMENmZmUv?=
 =?utf-8?B?MisvaGVQMUlzZnhGcmRBcGJYRHQyRUVXTGhmYzRWL0ZrSzZuQVMvaG4xY1Vu?=
 =?utf-8?B?bkVZcm55STZGU2dBSEhhWGc2RGlmQ0VTUUhld0Z1UUhOZnNzUXU5TVpzaHJK?=
 =?utf-8?B?WlRLTlBwOWRUbmF3cE1KdFJGNXZYUm52T1N3VUpuYVl5V2pObjRRcUNaRE1a?=
 =?utf-8?B?SnAxMjFSVmIzdy9aT3NQU2dPV2c3OTNscnMyZnJYUXZPMDMweE9Oc0JTcVpN?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0bd7e5-6ba8-436d-a01e-08db5095cd3e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:00:53.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2ZTDXqJa4cC5S2aMcW1tkxZazUKk1nCmv4k71NnnHtnKihHoViFUX/Yw70F0uNvitg01lFxGyXg9dOzuiHCzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5698
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas
 Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-05-09 02:14:02)
>Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>masks for fixed-width types and also the corresponding BIT_U32(),
>BIT_U16() and BIT_U8().
>
>All of those depend on a new "U" suffix added to the integer constant.
>Due to naming clashes it's better to call the macro U32. Since C doesn't
>have a proper suffix for short and char types, the U16 and U18 variants
>just use U32 with one additional check in the BIT_* macros to make
>sure the compiler gives an error when the those types overflow.
>The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>as otherwise they would allow an invalid bit to be passed. Hence
>implement them in include/linux/bits.h rather than together with
>the other BIT* variants.
>
>The following test file is is used to test this:
>
>        $ cat mask.c
>        #include <linux/types.h>
>        #include <linux/bits.h>
>
>        static const u32 a =3D GENMASK_U32(31, 0);
>        static const u16 b =3D GENMASK_U16(15, 0);
>        static const u8 c =3D GENMASK_U8(7, 0);
>        static const u32 x =3D BIT_U32(31);
>        static const u16 y =3D BIT_U16(15);
>        static const u8 z =3D BIT_U8(7);
>
>        #if FAIL
>        static const u32 a2 =3D GENMASK_U32(32, 0);
>        static const u16 b2 =3D GENMASK_U16(16, 0);
>        static const u8 c2 =3D GENMASK_U8(8, 0);
>        static const u32 x2 =3D BIT_U32(32);
>        static const u16 y2 =3D BIT_U16(16);
>        static const u8 z2 =3D BIT_U8(8);
>        #endif
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> include/linux/bits.h       | 22 ++++++++++++++++++++++
> include/uapi/linux/const.h |  2 ++
> include/vdso/const.h       |  1 +
> 3 files changed, 25 insertions(+)
>
>diff --git a/include/linux/bits.h b/include/linux/bits.h
>index 7c0cf5031abe..ff4786c99b8c 100644
>--- a/include/linux/bits.h
>+++ b/include/linux/bits.h
>@@ -42,4 +42,26 @@
> #define GENMASK_ULL(h, l) \
>        (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>=20
>+#define __GENMASK_U32(h, l) \
>+  (((~U32(0)) - (U32(1) << (l)) + 1) & \
>+   (~U32(0) >> (32 - 1 - (h))))
>+#define GENMASK_U32(h, l) \
>+  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(h, l))
>+
>+#define __GENMASK_U16(h, l) \
>+  ((U32(0xffff) - (U32(1) << (l)) + 1) & \
>+   (U32(0xffff) >> (16 - 1 - (h))))
>+#define GENMASK_U16(h, l) \
>+  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U16(h, l))
>+
>+#define __GENMASK_U8(h, l) \
>+  (((U32(0xff)) - (U32(1) << (l)) + 1) & \
>+   (U32(0xff) >> (8 - 1 - (h))))
>+#define GENMASK_U8(h, l) \
>+  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U8(h, l))

I wonder if we should use BIT_U* variants in the above to ensure the values=
 are
valid. If so, we get a nice boundary check and we also can use a single
definition for the mask generation:

  #define __GENMASK_U32(h, l) \
          (((~U32(0)) - (U32(1) << (l)) + 1) & \
           (~U32(0) >> (32 - 1 - (h))))
  #define GENMASK_U32(h, l) \
          (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(BIT_U32(h), BIT_U32(l)=
))
  #define GENMASK_U16(h, l) \
          (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(BIT_U16(h), BIT_U16(l)=
))
  #define GENMASK_U8(h, l) \
          (GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(BIT_U8(h), BIT_U8(l)))

>+
>+#define BIT_U32(nr)       _BITU32(nr)
>+#define BIT_U16(nr)       (GENMASK_INPUT_CHECK(16 - 1, nr) + (U32(1) << (=
nr)))
>+#define BIT_U8(nr)        (GENMASK_INPUT_CHECK(32 - 1, nr) + (U32(1) << (=
nr)))

Shouldn't this be GENMASK_INPUT_CHECK(8 - 1, nr)?

--
Gustavo Sousa

>+
> #endif /* __LINUX_BITS_H */
>diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
>index a429381e7ca5..3a4e152520f4 100644
>--- a/include/uapi/linux/const.h
>+++ b/include/uapi/linux/const.h
>@@ -22,9 +22,11 @@
> #define _AT(T,X)       ((T)(X))
> #endif
>=20
>+#define _U32(x)           (_AC(x, U))
> #define _UL(x)         (_AC(x, UL))
> #define _ULL(x)                (_AC(x, ULL))
>=20
>+#define _BITU32(x)        (_U32(1) << (x))
> #define _BITUL(x)      (_UL(1) << (x))
> #define _BITULL(x)     (_ULL(1) << (x))
>=20
>diff --git a/include/vdso/const.h b/include/vdso/const.h
>index 94b385ad438d..417384a9795b 100644
>--- a/include/vdso/const.h
>+++ b/include/vdso/const.h
>@@ -4,6 +4,7 @@
>=20
> #include <uapi/linux/const.h>
>=20
>+#define U32(x)            (_U32(x))
> #define UL(x)          (_UL(x))
> #define ULL(x)         (_ULL(x))
>=20
>--=20
>2.40.1
>
