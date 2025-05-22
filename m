Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD643AC0D72
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F0F10EA83;
	Thu, 22 May 2025 14:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPCNEBHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553E210E8E0;
 Thu, 22 May 2025 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747922418; x=1779458418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JraymcDQYLb6XbE11rRY2UzpLBfIP2T0XkFdKsb3osA=;
 b=IPCNEBHzUplSWb3yQhRk73CCmtR0+4+cCQi3ENnBUW/zuriC74dh2B6b
 A/iL7IiIuQw48z73rF6pHurr8ZiNjHRjV/g6y6bdVtFkXPyK35dqvh2GX
 gw6UQD+flCM2hV9DmArdU+osafwQx7vlMsiI345OU7Rk07M5aYpBAbWGV
 VOStqxtb3G/FnsNfhU6HUn8ZWDIpw6SVHRNOlYSjB2UozVJJ0azObiN29
 dYU6Zr+MjDuZAQBF3fvlfn9ZF5jZ9Ech/W13W7hMZpCBHUjtEInHXv448
 JkcypGvv72gYBm9EqicRwvHVm17e+f2xqLhYXusMudodfMZt9vCUPZ7qa Q==;
X-CSE-ConnectionGUID: XPJ3OfwKQcitiu+C1QB24Q==
X-CSE-MsgGUID: X9pVBsH5Qi6WHh2kaMTRzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61297769"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="61297769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:00:17 -0700
X-CSE-ConnectionGUID: rMEn7biZQqyvCL6qk+as+w==
X-CSE-MsgGUID: 1m+ez7FkR1iYNOBAHnc42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="171605892"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:00:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 07:00:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 07:00:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 07:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/9nWOKKX8TckzWPyuI7uKT7veapn4aMr3W4JGduYJKLY0EPL/1UzSVKhK4O/nS6Pv623rZSK3UZtt06onJflRf4adI5z6xOYFBr7sN+IBBvfJvkrZY/50xJd13I2NnjU9UMVq+faN+bCSWlcKQpDC2X0JabT3uIS0coAbe3mjAk0L+MhQYYNXuy8MPI+14GlpGvXw2CwEmKXSlMUbW+AMBacYSdkW0E/k1Jfq+SrDlaffEUvhjYT83L89uRqDlu23Q+Pm4ssOFXofmBmNx3UWWqNn7yCJkDMLvi3j2/4rUjwRgd2sbbL6bbWt6+YvJyCFy1QSXV63SlIAps63BuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JraymcDQYLb6XbE11rRY2UzpLBfIP2T0XkFdKsb3osA=;
 b=WL0CE9ClO6ilvTWxjxz1f89WKIreljrB6i3QWESzfn8zMH4IaqT9HR/EkXDao8H6AS9gFTNHEiLroWLilDljRgOmdlPGzzapMzWbG8i+urEkzwSVBCt76GNLe0EQh+V0xMhQxRWs1au2Hh/00FBCQhR/eqsAZyVDFS09MKfhcYQ/WBAD+TyKI016W23Yh0cjeyeuJyskphq3I7W0gB4EroFVq2GffPHToG2tqAEB5rfYCRFXb2CJ1kKqCCzPNRiGqVlVfIfEPRgUVd24KnfbsKnOQvNAmVCLIFs21KVP1TDcOjIAz30MClpl4JtcZIx64oHSqKdHuUZLI4DIuCDGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 13:59:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 13:59:33 +0000
Date: Thu, 22 May 2025 08:59:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: iosys-map: refactor to reduce struct size
Message-ID: <utcfptbrsudglyoeckuh7rjgg7tjpmw4naketvwjmgnytbex6w@tymx4ogozgyn>
References: <20250522065519.318013-1-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 8515bed9-fbf2-40d2-0094-08dd9938e11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XSUMZV8+b3n5HjqK9LQBPYM8kxfVs+0NEv/SifmqdsrNIvHLxxqODeGJ21zm?=
 =?us-ascii?Q?Ig3IHO6JJRtSW0q8h0GVoR6EcJWoLJv3Lgb2d4gpvrRQb4X7Rs0djhrYAPfd?=
 =?us-ascii?Q?B3kzr+xS5atoaBSS2nZ2pTqrmLeKBs9ctTdbDCUJOyhW6jETFXsqQTXlJTzl?=
 =?us-ascii?Q?q2Ysa0xSXBjyGiyDyN1zdDg1MqvAM9wS1VRfOczcnIrGir4U9IKdWHH11bJs?=
 =?us-ascii?Q?GryomPI2X7EDk0xAu+y2dDHYtiiREvU0vlp/wJ7K63+5/3aC0WsDRgIBeuJO?=
 =?us-ascii?Q?ENCZeIGouMNdLUcOGMnhKmsdfoZZAqQHE29A30BMSI/+CRRudwA7qQfCE2pG?=
 =?us-ascii?Q?1SK6hNQTCEg8sncahARATB+QOuwqB5Nqi9ZvRcu83Pb2Qy7TR/cJp95SF6bV?=
 =?us-ascii?Q?mcsBATg2NoK0xgXS50dnWfiAedxfM7qr96TfOlCMsdlxxzLBK2kt8kKgzfSd?=
 =?us-ascii?Q?tzhBaeUvRC85np5yCzHx5vmSC/KlXWP+VlNSI9E6rDUHICeS+OjGpmudyzM8?=
 =?us-ascii?Q?GilMC/6mTJ8EtmkvyjRt8UQhUIzGxoJqmN0AeR+HlA/bzOIIgYP9z42sddZo?=
 =?us-ascii?Q?IqPtQanvTBKHF2vA7QqA2rFkMnLLTNtLzfTlAzcMjYACqYzVcbUQNGh1TLt6?=
 =?us-ascii?Q?o23DfAryy2qiTJu6ldgEsfTHT29nir0VcViE5oO8ur+VLQPJpZv7VnZS6QR8?=
 =?us-ascii?Q?SSHfEXg4+/ndoR5CAm3lhr3mMPcdLBjiZjThBJJ3hby5VX/KhC6M4HAsTizo?=
 =?us-ascii?Q?LCJh55xIr3t7dtOjHbD2c23IVfRs1JeEfMGuZMC+kvoHVWZFWV/MYhSfrLoT?=
 =?us-ascii?Q?xAUvxmSpvQq8bQSx/7cm8H3SFCwHBgybOH73yErQ8tQjWp1of8R7C1UkMT3Q?=
 =?us-ascii?Q?cAUqs6OU0rzeZ2w8wp2Z6I8CpAU+pJu7r/MuzWP0Q0KOnOODmIXvShDA9t7c?=
 =?us-ascii?Q?rl2rgzaywLPSHmisFsb97aZ9lB0c7BF1sY/sMxM7ui3eq1SC00LNvtmhK+Bs?=
 =?us-ascii?Q?fdnQA4fgl9OtSvDXhqCdG12WDaKmZQRtVUwYJ6fnu8VUMsvc4Q9hNNURbSYH?=
 =?us-ascii?Q?MjKywv5w5phzVu8atMgpLvj8SZqdeztI5jHByMRNKG4xp1yvTtkUB1fiDAJc?=
 =?us-ascii?Q?fVkfYDCQJEbcj3D1HmL2vsJ4G8DfixtXlLjupoXBmCMJqQPWb7UKHFivwk3w?=
 =?us-ascii?Q?IbLifdb/Hy2bZBQRKN1npyvttG5O8W2HMY3zmh/VFZ26WUD9LVv83YlwcuZm?=
 =?us-ascii?Q?oOCQ15S4OFy0xDiOj6FABneGIBA39iE7ZCjpp1dp1k9RKGHqnJAQLB9NiKmW?=
 =?us-ascii?Q?PfXZKFR2nkWN/1ToGZg7aECWqBhMVq9lRl5/lo9HakyeOVqoSU7uC4zMJ0A/?=
 =?us-ascii?Q?w3nPSfk4PNMWyOVHJ8tph3pBW3z35m5iNRcj1qfuf0U2XNy7k01zwbSL7VDK?=
 =?us-ascii?Q?n+2K/FaY12g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJM1qnDW9YwdlkYHSF1vyuaH/a1MXdOAW1aR9ML2JzCHGIdxSH8zLzQdy40W?=
 =?us-ascii?Q?3A+9OVQkY8Ym4KR0PLUal935lTrLpFw/DotcP5Fv4HSXB4WKBjDxUJRxxx+C?=
 =?us-ascii?Q?dNdfaq0jEoEi1RGvaK9f11ngjc60frVuV7ZZXvvUe3Pu4JFmZx5biWwQMv2P?=
 =?us-ascii?Q?NI0qqAyD+qgIrQ1sP51pFVBQSWRM69KO+UVZnsgG1TOHRnbOl5BbvLgMie7Z?=
 =?us-ascii?Q?4+XKmag40LwyEJNo/esmZ4cQBDP3sXfvc/aXZXmB1Zn4W42qclbXB/Sy6rc9?=
 =?us-ascii?Q?5zjXBw762UI2lX4cwAXBynJa1tW/Y73OIU/DrH5s0DwxbfPwmqbQqCDTfe0u?=
 =?us-ascii?Q?ScuLRSjxenOO9DoQHeUZ8cl4JY6GbmfOwzZwfVQtBPXCGYmyHu8ViYI+vvi5?=
 =?us-ascii?Q?xguxSWuq3ZFhYX8+3os0ZhX5QWi99ZDNEnzc/CswQM3WFlePQ611WvypT2oE?=
 =?us-ascii?Q?8jN2uAOnh3oANMrVj4qPFvdXWCrYZ9ZdjvOEO/2klk0R3XQqtdsGGeXOSHuz?=
 =?us-ascii?Q?BvKcJpvLGkSBhUr2Mc68nJdX8asa4iIDNsppCWLwJ0AyDKYFvOzCYd22d5YP?=
 =?us-ascii?Q?cuG1pnEf9pV7JcfCzYvsKLz4nvOVwNufIBo7b+OpayiD/iCLFoABdTLO1AYv?=
 =?us-ascii?Q?m1ItHVSu2hwU913lfBfFQeNh+sAZrFmDdr7LqOKdnuNFzwP7MPjTbhR3N64M?=
 =?us-ascii?Q?TgoWWQSTbNVyjUdK/Wuw3KiDciye1TKLTclIJKpytSPrCsSeD+QdTg2L5z4p?=
 =?us-ascii?Q?1ZpSB8k6Y5Iz3YOHOq2XDg9ztjiBRQ+uWpH2eNJx4mkO5yQc8Ccp729TL8zI?=
 =?us-ascii?Q?oSgDYNGP72+fXjo3hKCEh3r6lR0mZW6RpmOQITAtMMDe+WC6MvMmA6ziGSuk?=
 =?us-ascii?Q?DdgrKfUlnl6EI4xo64uFgjs2Di53dgG8ZyOH6EA4c/4cCJcj+PSS45a8oMAH?=
 =?us-ascii?Q?QKj6SBReUmGp4dvNcy41YVs9rjbJWyMf+r+jm0liQiAN/hVIlqHyMJZqIVbs?=
 =?us-ascii?Q?UR/N7VmfFqGNEaO89nGFMUUa5KhXQh8+VXl6QPpyzu2azNtKoCfmNpG/4heO?=
 =?us-ascii?Q?5WfJvWKRKPS3WBy84i/ZxtjLQLiTMREAUSiiVlsR0qaeQrMbH8a+IyBNa2vU?=
 =?us-ascii?Q?X+WhFgkp5gf1RKZnRCoA3JTxwc+ctKU7h7n7S5WYuuLBMyxjk1L9fsIMk+2O?=
 =?us-ascii?Q?nxpa1xSCErzQSk7JQHcKh4Y55lllTbCTfw4tcusV0rXJn2xoGTZOmArx6hUH?=
 =?us-ascii?Q?AvN9cJHnHkJgPvuHEIzyhAvikTVy34s66M4DqTLXpbpcQopBpSUbiEVfeY/e?=
 =?us-ascii?Q?YVQ2guFAVsI8Ot17j8OPn23xISxlhJhIffxYchs4G8oBDJcqpLHlyLBaQNU8?=
 =?us-ascii?Q?zdDuAZk/HQjgyXRAlCkomMW/+dt6Yq7SKGGreMVeM8fO+Y0KITg4AAlGZkOu?=
 =?us-ascii?Q?w+DZKS/lp2DP4zUfEiDOknpS0YreJmtEEQ+OojwbDM9I0nOJ7pHBXHx3Iib+?=
 =?us-ascii?Q?5aySDXLAT5F2focM2dcc3Cqj9L98D58SnU8rCesyjGUwdFGVk0CZn596JVB1?=
 =?us-ascii?Q?qOkeSvYmbdA5hklHO7k0yry8LF93PTgpipz5V0B3kpnokVrvyAirQOe3UfK8?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8515bed9-fbf2-40d2-0094-08dd9938e11b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:59:33.2347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bboSY9C7M71AkwBJSUPoUnAqdrF6m3KltiuM5m95UsiQeY+CYaeMmTLfBOIw0ipQBHMcU4/pBzW9DwUfDTTiABpqZRTF+RcYtxlbhh6TpjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
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

On Thu, May 22, 2025 at 04:52:09PM +1000, Dave Airlie wrote:
>Hey iosys_map users :)
>
>I fell down a bit of a refactor hole today, it was just random and
>sometimes you just have to let these things run their course.
>
>I noticed iosys_map has a 7-byte hole in a 16-byte structure, and
>it gets embedded into a bunch of other structs and it offended my
>sensibilities.
>
>This series makes iosys_map be 8-bytes, using the bottom bit of
>the void * to store the is_iomem.
>
>Patch 1: adds new accessors to start hiding internals
>Patches 2-7: refactor all users in-tree to use new internals
>(hopefully got them all)
>Patch8: moves the internals around to catch anything not in-tree.
>Patch9: reimplements iosys_map as 8-bytes by hiding the is_iomem
>inside the pointer.

I went through the series and left a few nit comments and things we may
need to fix on top that I only found because of reviewing this.

For the series:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

We will probably have quite a few conflicts in drm-xe-next as there are
some changes touching those vmaps, but we can handle those.

Lucas De Marchi

>
>Dave.
>
