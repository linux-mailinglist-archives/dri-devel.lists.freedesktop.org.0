Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA835924304
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16210E32F;
	Tue,  2 Jul 2024 15:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X85o72j6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5182210E0F7;
 Tue,  2 Jul 2024 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719935954; x=1751471954;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bVoqbwUrvOBJ8/mu44p7DPG2NmjQQ/ejiGbrTc/qhQ0=;
 b=X85o72j6agMwfjjPzR8CcOHLe3c6kUWepOCJaTVfzfqXqT3KK2CcA6p3
 ezY1qQVyHNMjlD7OzBwbnhk6toMwygAfd1R6bQqZrZwOgr6KqJZ5gqU9s
 0n0TFOrxpBMwjSB8gG9ka1ScRUNm10OooISHvni66W8At5EC5v5tYqya6
 kvzepM+MXgquHP1xUl8JhMoTPwCm+ZFVY4aIXFxDWMzFri4Ep/VqJipzY
 hi1GRBoen9Sq5gk5SBJvB7Z7kuHmmrx+qhqMoE5a8U+5ZCblrxr1lE1cf
 qt8nw85/fCrnkW4BnX6CCBwdSscf+MDKP0r9uVTPS5Y22koZkaMzzhtm8 Q==;
X-CSE-ConnectionGUID: se9PpbQ6QYquBrqn19/hlQ==
X-CSE-MsgGUID: 4krb3OWqRtSxSaBPuapuDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17243876"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="17243876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 08:59:13 -0700
X-CSE-ConnectionGUID: WbpFrA5lR/6TJI3pDZTUEg==
X-CSE-MsgGUID: PNmJOF1AS9G2U/XMF7lQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50290775"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 08:59:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 08:59:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 08:59:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 08:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6KM0khBd4DbHt5fyLXLjQqh54G+t4ugg+Fb0+d0p9dFSz0Em25u6NYa7X8MpppbD8ia2xFDnY/wFN2FSTh61qo2WaE1PPQXAGfY/B/cx0ueV1U5w3igtoFhmUjJgDD3M8Ddxv+dotUkJ5//aXfwt8Kpw7K7kQ/rbsC91/d2+PfJ0xYandPhl8LPPoa3fQBWrZ/o+RNar936te2ldG4YpeQEKk+/s3B2rpwpOpw22CoaF9lf5UWoR+e41SSS3PbL98DIQ77UhvbulYpQtFS4W3O4n7dxBFTbaJvwkLbVAMISfz2d3SkqVcN+gJlN7XQgwc3l6I1dytuVKPOsCg3/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ycb3NSmzWGtcCPI2ZIWrfiuSXTfLSt2lj+9Hnr7R/Jc=;
 b=hF9nd4fOiTxeFwhfn6cwuRHUrChkJzCTnwio3SRjmq+AhUdvhUSSpi/fpzG0vlsjQBIPpdxWJv9s9WqMZl8v9ulqcpaJQkjgripIXrtnrAtS0VQoEBiUy+6XH8QYZeG45ZQ+24MziE1z+wn0XptfrKaKot8jUpxIqVti/SuIV2Ib1fP1PbNlncUIQivTwz2bNbRwn2fuLmcO5NHZe049S4b7qd6L8vqMBPKxT4y4++j+5aBzElkMzcup+KyTmM7vRLT7bLtV5C8sbmj1K7kKrd0kFaQCZQT6DxCf75/A/zy0xdinm8+WTGr3Oi4RGrRKCx4sW2G8FLxfxwK3ybTh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 15:59:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 15:59:08 +0000
Date: Tue, 2 Jul 2024 11:59:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Pallavi Mishra
 <pallavi.mishra@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Effie Yu <effie.yu@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jose Souza <jose.souza@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Use write-back caching mode for system memory on
 DGFX
Message-ID: <ZoQjxVu4kAnSQdyq@intel.com>
References: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f54b241-07ab-4899-3c5e-08dc9aafe818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8vjJozC27qAHdl1fL4wuO6qpuWQizXeF7Gkt2jMtxXQbK2JMBMhpU7HlAN?=
 =?iso-8859-1?Q?Y4TyaLzYmS0dgUehU/HCoQWeSYIU8MZ3P0s24UJVNabiDUYLn/4MK43WMR?=
 =?iso-8859-1?Q?i3Kk4LgMelk2c+FIRFY/1aBok8iTZJCRL1E1nlMCVu2fgByKbTftKXiNtu?=
 =?iso-8859-1?Q?lTX48McffEXfPQFIraXBhfqLMA6UwWB2FUhgy3eeykVqgUU/qcBAKFvYQ9?=
 =?iso-8859-1?Q?ydxNF1pD/KXhltyBvDg+6QkdLZFMFwW2LxA09JY9ZYJ9ArLwMz5vCe9fQ7?=
 =?iso-8859-1?Q?Q121Tl4dRkJ8AiZ6Un9RE21KTlwBsUZwvoV+SuBCeiv9VS3iLmcvK2NHRF?=
 =?iso-8859-1?Q?+1bb/9MqfPSATNt56/zPWJK1Mizjtk8oG9H4LhrIzdSagsBuN8qvxNpFUp?=
 =?iso-8859-1?Q?dfvmGN6G3aegP/dxA5LJfR96Ph6JHDgaXFim0yZrKS9JG3t//J3uGYLxED?=
 =?iso-8859-1?Q?mDvw8DBKhGq/In1CQfYUrKCC+uqNdjHMHpDJBCvIX9hvqioi4grH1GQ9q8?=
 =?iso-8859-1?Q?ybCFOKrMzjWK/DU44prnfasdfuF3kNteiu1oqHIqw/B0EL9sWHXmryCQ13?=
 =?iso-8859-1?Q?ia36pFWJSNhDZ5QdTPQu76lOLN91EcMoBD90cw2KZQ/7NiFiSwOBXB+Izm?=
 =?iso-8859-1?Q?KNZ46cnogy3Gn+eAe0r4IFn/AZTeXQxRP+P8Sy+acbsvTc9yRrHwT5sOCJ?=
 =?iso-8859-1?Q?5dEVdBf9gqiyxPJBU+Vo3zjD4I5VziH9v0TJsh8u+nibTMUUCP5za0JUdu?=
 =?iso-8859-1?Q?I113Ak65cj6FusoygviUCezu4UCW4mbePzazJaSQYsMQ1XMev8Y+AqaLLm?=
 =?iso-8859-1?Q?OvPpkYhN7oRTzN856+XF3BS6AoMrsNeorjdDn1bFBsGvI+hjySbyEu2rSG?=
 =?iso-8859-1?Q?6i+vfvycCW31iL8BC7ICOpfTnb/aOA+1Jdz9Pb8IKYiu5Xtwj48Vu1ECws?=
 =?iso-8859-1?Q?XcI9ZQCMnNDoEnOLxq4JPWqjgGhomb8SE+gDm8whey970eN1vJ1MYyq9xa?=
 =?iso-8859-1?Q?uFf0WM4AN2demhj0AS3rQgxY4+/cIvdIbvvPXu+Ot2PZk8AySgGqWtY6ho?=
 =?iso-8859-1?Q?4eLWLZc9jWs/v/AS4+b88HsmgXQVMe0yz3C6vWGiLX7AV0y+HRvlHCnq6K?=
 =?iso-8859-1?Q?c+sQRv/E+92EjOFXWfZnyd6Do89rcj1GVACbEhtcJ1uGIsQpHF2W9JY0W4?=
 =?iso-8859-1?Q?5zdQfPA41Cx/k5Iadf7Kqg89EDKBG0MRb3Ge+ECNt9aBTE9yhPbTEHDCbo?=
 =?iso-8859-1?Q?H9ATNAQB24HY1QR9BLjYjaPF2EhWcQtdb88yW2zlT/qzT+HXfFfckCHmji?=
 =?iso-8859-1?Q?pj2AGNQFKwk1+B0yCJGfRY19/bcQ8yLy1logHSOTpzBIxTKtkI/0tt/NL1?=
 =?iso-8859-1?Q?3gZQdXZOyOVBqz2hVhHLp4V4mUWKHRdA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XT9tWb/cfvVQwDR0Sy6Anri+Zly/XcbTvtSvY3bqOoftKeDPr/G9OM7e9M?=
 =?iso-8859-1?Q?Wfizcbn3kYQ00qG6i54tl5oxt42uUFp5vuGCHDLPLCI3vqyv9N5amTeWLS?=
 =?iso-8859-1?Q?LYvjUVzQPIv7wGbZz/7v4GDJCjOFnZr2642/XbD+CI7db+X/B4EVnlfhuK?=
 =?iso-8859-1?Q?uBaN8yWiP5Rr35FFymxImDesmMvEAt6d99lw6wGhggBRxoXIMq0Adapr01?=
 =?iso-8859-1?Q?6uK68xCv5yUVEJ5bq/Xe2Uc8vEfUBS93X0GIMRh4/8qOdWsGHw9lMvzgr4?=
 =?iso-8859-1?Q?yW2nqH6tq3Cz28XCsvsV49nq+7xM4Jy/iA/J7nddU+/hOWNHNdr/Xyh0U5?=
 =?iso-8859-1?Q?bqjf+LCEjYYiVAvQewzFoZpgMLVa9oFFMYkBN4lo3NDohk6PoiGoceiwcI?=
 =?iso-8859-1?Q?GObmej9nIbCNBUMVjSveDU6uemFMW+5BUn1RCH57U1deI0Op3ePjJpf/lO?=
 =?iso-8859-1?Q?Zq+0qQERq/0nf73w4HxKfZgjILK7C/8zWV8upWG/+ertD/sf39/lSdTsmJ?=
 =?iso-8859-1?Q?cRuTW7hL4VV4WUWP0YXS0NN3Zhr3zu0bEkpz0mAhQeFN2A5RaJU0CBeprR?=
 =?iso-8859-1?Q?Kz5cl4eVRQYqdJMOePuLN9TKF3GwSM+tdG8QEXfcInltJV/Jh82JWDipOS?=
 =?iso-8859-1?Q?E+BaJlR1AKXGMAD0RX0gIgRDy8/UN5vLXty7PH/9qO8TIffzYHPq4PSybI?=
 =?iso-8859-1?Q?+4/mit1RUDQwH9Z2nNvX9MDZsJZfbkRvCI89sRN7kgh2h5/vFOuHJHKf5P?=
 =?iso-8859-1?Q?N0iXXj5exbBRIYq6T41k1x/kMWGy+LAGDm/vc8oHmAvYBUCGLurJPmLt9Q?=
 =?iso-8859-1?Q?M4byUNyJNtO0OoEQEiZ7sAqOTygGS+7Juo/3Tw0A3aopgpJF0O6+JZoCZq?=
 =?iso-8859-1?Q?ufJdvf8CtNRrjl0ZyBYkhsUxpZNPN9/KJbs9dzD6JG9Gx+XxPxe+Ddeoug?=
 =?iso-8859-1?Q?x8iFmkOs3OZJo33VhkgtagMiPEWzRMtMmAlHX7ti6a5gUBwy6QxUgzKZbE?=
 =?iso-8859-1?Q?nkklUPP0trhb4PD7FdkekYTaj6F9medDFUmQi/0tMYEmECBtBIJvN/W7mt?=
 =?iso-8859-1?Q?bax2eswTLHlKE/GopIBT/I5C5CnbAPsw9Sy51cXtG7TvHN0XgodPxwLzy8?=
 =?iso-8859-1?Q?wRXFq4pq6aX5TuVeRN2cU0x1beIGttFgTGjuVWhtffA9cBdgu453khQ2nq?=
 =?iso-8859-1?Q?twrvdrCDqECXdBTDGnjvBrs2bJg3PlaPaagd5ifQrJxFVYne05EWEcnDhz?=
 =?iso-8859-1?Q?7oob6Y2gWvBulfyr/hdeSUqDDwqnVdWb0q3Ute8LJQBiukgBaX7MDtVJ/W?=
 =?iso-8859-1?Q?oZlYnWbhru4rfJVepmzPEZtwoaqL9BS6sddQ0p1mhON8gZ6UthVwNUATgc?=
 =?iso-8859-1?Q?w1ezzz7sBGMSz4kOsrjqMWGeYjHL6nG3KftGsFytxbGbytvVIhPUaM/ccC?=
 =?iso-8859-1?Q?VqszDJ4/6jsivc/MZpz+iYzxwDKt6d7+QCp2KXI1TNtc7A6Yqf7WCTkhdH?=
 =?iso-8859-1?Q?J+STLMh/KTmXOwhun/MrDD4a1eCVm4FG3Tc/gMjR+E2Q3PtqSuniNeZFtR?=
 =?iso-8859-1?Q?QrDV6gosEYKACoP+AtRFzxPffCFVx+AktOWnSpqmuMJhUT7OpPmHOBqMQA?=
 =?iso-8859-1?Q?3pG6PeTTCHTpZ38AMV6QuC1uM/L1QcD8JW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f54b241-07ab-4899-3c5e-08dc9aafe818
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 15:59:08.6378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtCc1uWClXd+eaiEsmguXW3sV7DMyydQYvYN4Td5h3dDWKDwD4oQmEfi+DyEPxQOqztcvferfKHm+gYvMPtSEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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

On Wed, Jun 19, 2024 at 06:39:04PM +0200, Thomas Hellström wrote:
> The caching mode for buffer objects with VRAM as a possible
> placement was forced to write-combined, regardless of placement.
> 
> However, write-combined system memory is expensive to allocate and
> even though it is pooled, the pool is expensive to shrink, since
> it involves global CPU TLB flushes.
> 
> Moreover write-combined system memory from TTM is only reliably
> available on x86 and DGFX doesn't have an x86 restriction.
> 
> So regardless of the cpu caching mode selected for a bo,
> internally use write-back caching mode for system memory on DGFX.
> 
> Coherency is maintained, but user-space clients may perceive a
> difference in cpu access speeds.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 47 +++++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 +-
>  include/uapi/drm/xe_drm.h        |  8 +++++-
>  3 files changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 65c696966e96..31192d983d9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -343,7 +343,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_ttm_tt *tt;
>  	unsigned long extra_pages;
> -	enum ttm_caching caching;
> +	enum ttm_caching caching = ttm_cached;
>  	int err;
>  
>  	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> @@ -357,26 +357,35 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>  					   PAGE_SIZE);
>  
> -	switch (bo->cpu_caching) {
> -	case DRM_XE_GEM_CPU_CACHING_WC:
> -		caching = ttm_write_combined;
> -		break;
> -	default:
> -		caching = ttm_cached;
> -		break;
> -	}
> -
> -	WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
> -
>  	/*
> -	 * Display scanout is always non-coherent with the CPU cache.
> -	 *
> -	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
> -	 * require a CPU:WC mapping.
> +	 * DGFX system memory is always WB / ttm_cached, since
> +	 * other caching modes are only supported on x86. DGFX
> +	 * GPU system memory accesses are always coherent with the
> +	 * CPU.
>  	 */
> -	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> -	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
> -		caching = ttm_write_combined;
> +	if (!IS_DGFX(xe)) {
> +		switch (bo->cpu_caching) {
> +		case DRM_XE_GEM_CPU_CACHING_WC:
> +			caching = ttm_write_combined;
> +			break;
> +		default:
> +			caching = ttm_cached;
> +			break;
> +		}
> +
> +		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
> +
> +		/*
> +		 * Display scanout is always non-coherent with the CPU cache.
> +		 *
> +		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
> +		 * non-coherent and require a CPU:WC mapping.
> +		 */
> +		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> +		    (xe->info.graphics_verx100 >= 1270 &&
> +		     bo->flags & XE_BO_FLAG_PAGETABLE))
> +			caching = ttm_write_combined;
> +	}
>  
>  	if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 86422e113d39..10450f1fbbde 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -66,7 +66,8 @@ struct xe_bo {
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> -	 * objects.
> +	 * objects. Exceptions are system memory on DGFX, which is always
> +	 * WB.
>  	 */
>  	u16 cpu_caching;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 93e00be44b2d..1189b3044723 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -783,7 +783,13 @@ struct drm_xe_gem_create {
>  #define DRM_XE_GEM_CPU_CACHING_WC                      2
>  	/**
>  	 * @cpu_caching: The CPU caching mode to select for this object. If
> -	 * mmaping the object the mode selected here will also be used.
> +	 * mmaping the object the mode selected here will also be used. The
> +	 * exception is when mapping system memory (including evicted
> +	 * system memory) on discrete GPUs. The caching mode selected will
> +	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
> +	 * between GPU- and CPU is guaranteed. The caching mode of
> +	 * existing CPU-mappings will be updated transparently to
> +	 * user-space clients.
>  	 */
>  	__u16 cpu_caching;
>  	/** @pad: MBZ */
> -- 
> 2.44.0
> 
