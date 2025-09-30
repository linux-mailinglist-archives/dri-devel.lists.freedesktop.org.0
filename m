Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDAABABA48
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 08:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA1310E4F5;
	Tue, 30 Sep 2025 06:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqU9VZLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C7A10E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759213006; x=1790749006;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=+89i7T/DVn3hzUJiXiAEd9GQalLlqJImca50S3XByW4=;
 b=UqU9VZLGMMyoXzqD5ygm4KzU92bRHSN4FseY5zgDq/QuLD6wvom86jf5
 b7uFRZjExTMjNW63B4RgJfrUMUYsx1deekq4ksTjKAG2bEfrNkYVSCtX5
 pSjVU6GSPn5D7Qph+UvwGS6UalebgBjM7XbycuT5peEXuMb9gqSx6X4JY
 MGu6LRWLzSzjVnqZzpoVrXGXYqxPE0QRn762XHpyLx1tl3e72EINc8FAJ
 1Qs4/EZbWia5qwd21FTJuOU/w8a1gzrZkQQLdQk4HkCfH8ySTglGku4+b
 dsZk5mGM6RsfJbKxyOYShWSlne1JRko369NC4MFzGt4+J92uvgiNKfHCV Q==;
X-CSE-ConnectionGUID: 7S9euv5UTimvDT0A59Qndw==
X-CSE-MsgGUID: Msmw32WeS4OPeowi1tNhiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60673816"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="60673816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:16:44 -0700
X-CSE-ConnectionGUID: IhI82x8vSaeotehVzv0I0w==
X-CSE-MsgGUID: i11L2ncSRWCiJDlICRZ3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="215585118"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:16:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:16:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 23:16:42 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWT4HOgqG420+CLux2imscC/67uEsRNWuz6mbAIs2vySVo7zZw5xIuI40CWF0Sa0tT8GJALQLHsM2UYqT2M+ZNRnbNgBXiBw1EERIU2TutXfFokCAaovJjwErBbWDKxwjUPoIiQCfv0Z74dO2v3TaYH/TtaYHc2pdWH4LZx6hiSO5BNiHQZQ0AtsdrGK53fCytQkY4N+Gc/wQiC7GKcLYLadcSSYLQqKpPXci952o+4WJTAPoSlwSVQjdJX18OzFAqIXbWRSrVY/m48wr1bAUzsPUxtGYstLc3Ert0tv7CnFwcYVF59zLq9gILpErMT/X9TLss9odkzZclM2sy73Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfeNY5VSrAI0lzr/nLoEcd3VpJh1HqYMwPAhwjyNwOU=;
 b=OpKYJlgnjM98XzNOb1iIOjqm/QCkyAhdHBgBGGbQnxd+0/0auGHyE6eQpq6SfKa7Qu1m32/MwhoEJ4L4KTjdyOI9esQaYQicJWVuqGLobltPfGvqUrbNV4ECVTiGMP2YbGrPgNJcyfULS6/AwVUMH3WI7nrgPNcDJmNK/DPpgw8OHELl0CFdSn39G0MjFLJpiUsK5vxAJQz4Zg9NwUXR034+rH2i6RhLay0gV2qNP5CTsO9zRRq3LIM3lCH7hm14ErOrqvHsFOJT12CpziMDYL72Z9mA+YM2NnXTzShg08r/6uAxMAWYPPtnP+kyS153afuVTFkKT3gZ/JXAE5Iirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6322.namprd11.prod.outlook.com (2603:10b6:208:38a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 30 Sep
 2025 06:16:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 06:16:38 +0000
Date: Tue, 30 Sep 2025 14:16:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-kernel@vger.kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 <oliver.sang@intel.com>
Subject: Re: [PATCH 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
Message-ID: <202509301358.38036b85-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-4-23b62c47356a@bootlin.com>
X-ClientProxiedBy: KL1PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:820::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a0be55-76f1-4802-939b-08ddffe8ea20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q5ahrNehHhNjurR5EV9+FVfqo9xcXAQpSLm9vD1Rn3d6E+jHQRsTlk43ZnIY?=
 =?us-ascii?Q?4gAh562eqxeFasXqsHFhhIyyWtKS5nJvMC0v+T1ch4cUjBncyQYIvsiGUeS2?=
 =?us-ascii?Q?jPKGHhNU0q8RMIbGBBqcXlXccJuMnEjKqXLHCp785Fm+P9DKbz/LevLbKcvo?=
 =?us-ascii?Q?0jvHs4Vt+SEVk+gPiALDZt98zVk0FWzU+xrbcIFhlRdX166dXJlQ7bd90ry3?=
 =?us-ascii?Q?C6luwjeSTj1o3UEo+GYKYPzDo8JDkHlO9ohtRCHOBnqCh6Z+GAfNiBYVQTPV?=
 =?us-ascii?Q?e3LANdtC9EQ7LG7Bdi9d28N8ncAQnPeEZPxfV+z5ntUNHI5cZtiI2TXqcOLY?=
 =?us-ascii?Q?/0PbWvjNfIBR3zwYSlxiGf/Nem874jbWi7aT+E/NvDNnZoe6anx74VzSrFvA?=
 =?us-ascii?Q?DA1hY1dC3uRy72yFbFyElI1OVuZHrVe3qC7XC5JicNZKF+u78i4An7a4gCsc?=
 =?us-ascii?Q?c+FbHORUl2bm33Y99Tg7PXZi2zApT6hxFI88YtbDpH9W0XQz7uX3HV7W8Yfw?=
 =?us-ascii?Q?RC7suIxuCThC7bfBhX9XxLtuNV91O2TSgK8uKkmtD2RlI+PBYV2/H+9l8gug?=
 =?us-ascii?Q?CGVGl4dEm2bmMTzFwPJ2k2L4N/AmjOa0S+p/EVQ0EnwtztuPQAORWtltZBl3?=
 =?us-ascii?Q?7YiVrivaxmAvTSBG7BzcVBhwgpFHfqEP53glj02OFqTpXwtN4YTwuNF7xmCb?=
 =?us-ascii?Q?VSDytIVwWkv0kK3xgxfZg8zgtJmhLDpiydW9Nix1V3pFG1LC8ZkncDUVO16o?=
 =?us-ascii?Q?JKxmZ67DtgT6yij6Y9IHJcBScCXo7dUzR/iQR1vJpt//Te+APSKWek3ERzrZ?=
 =?us-ascii?Q?bCQtXwuGhHYtimzVNXpCq1InZgKzo1Hd2c7DY8ufIqxt+6J7cv81V0czgSIN?=
 =?us-ascii?Q?jyydaTX0BmDnk9FEOtSvYBzMkq6wa+IXL1khbiSVC1raf+burg80f6L3y62c?=
 =?us-ascii?Q?0xX2K9wKrzLNWZktQqqcQE9LRu52lqPFB0dXijB1BD5lMFQObQr6YlmDld/O?=
 =?us-ascii?Q?GW5dU32lPYNf6op9ociB23in6ZzifVD4q3qYYQy5IPjxys0Zmk9zvUzEO3Xh?=
 =?us-ascii?Q?1O85XI/03q2ncZonNbCUg8CtSrr5p0zCHvI01Bw8hBdbeHuIIIbhJUuz9KPo?=
 =?us-ascii?Q?I1/NVqENwqlWNSnZwFFzTKUxPTAhvWD7HX+qI4DGHKah/SjzO/HWTuiJId6U?=
 =?us-ascii?Q?0yGnymfsFj1wGoOSVUTEhSDEUemMuroGFA6iWbBGEYe2vY9woH8kfuShV7kh?=
 =?us-ascii?Q?Rrvf2eWzW5CjOS5calaWvlF1et7toS/23AIM0boIXjVgATDW3O6P7socC2wx?=
 =?us-ascii?Q?DpJ/TlY7ga4xjcsVXkBPzu5Kr6iKW98fWFED6tQuQHRELvUOJlAEvmhVsEro?=
 =?us-ascii?Q?v7GFKzuFreDcDh0HUvTPl16eqCMitPX5e9TdL8TTIJ98SPeEGI0u2mnZHl7y?=
 =?us-ascii?Q?6oCcyLvSVwc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Irp4WeLc6v1YuV3pUrV6Zp9o4FKhM6tN9wCiNkRx526BbfvJKZ+cM94M8xHl?=
 =?us-ascii?Q?Zpps4biZiQrNxwS2sPhduW+ynNqiMhkp2EIvwIbXj9jCY8/GmDRQi+VVwseO?=
 =?us-ascii?Q?brDcuNyB2fc9y4or73rLkZPiN/jg9QZ9o97e4he1awsYTiCUA2+TESJbnAlw?=
 =?us-ascii?Q?4eVqIpChw5gj4KIpMrOXEOdEyEufbSc34XDkuNnq2ZDFBd4ZgNaIVbUsVnbN?=
 =?us-ascii?Q?Os0olpRF9uQkVhtqWEUDlgQDAGrmSX7Gt+gY5IPSP4ce6yU/ijLgBAqonjQS?=
 =?us-ascii?Q?JM3Fe6CZWP9ZndP5N0IopGP0WR99YDhD/pMifokon30rCJ6QCSlfBKSVnxe+?=
 =?us-ascii?Q?07vj1pnbkRzD+05QKnAla3vv7PfAYzQM0j3ac+uuTsXuEc097hCK9jDntGrF?=
 =?us-ascii?Q?Arz/kZkXXkHZfI4P9uVUPWGiGoGJCUenH1a+1Ned/3CpV9ILV5ZwAY/cefNv?=
 =?us-ascii?Q?Dsk0BHaqQnpJcpGv7F3gMMFO/30+9oxYXIeQb0KRmNuUHwhfN8saMKFvW1Jg?=
 =?us-ascii?Q?n0l/5yWaQSlpBnVYxxEwLKJQ7e5YKCCO+9JSmHgQb7GL8iMn2X5RU4nlBeuA?=
 =?us-ascii?Q?nTdQ6L2ozqaP64CcpFpyZViSFxI/W0ZqyJUewBS06GfT58m0XO7L/aD0ie2t?=
 =?us-ascii?Q?d5iZSNraabOamY1tUZnB9tyqXEFFumEZ8E3+N8c5kDCHp5+42rdcv0TqPzS7?=
 =?us-ascii?Q?AvxCw+R9QkZ8aNF9YPBWfWq1DvyKS5cCvQMw2DX4cEhkS4Eoxd7hY3XGaEht?=
 =?us-ascii?Q?YoJrRaY81aLU2+kPeWsi+woZVj0oi53RJ6N918WVKg03Pm6zPNMrqQYPV8V5?=
 =?us-ascii?Q?Pzs2pPow/YGYLpZPc5XpfDqFlwA2/cFo6mrKXvUL7o+faDneWKVpsPk0pCQG?=
 =?us-ascii?Q?Z9/d13rByh8HaQPfdnKb0aR2j86/8HPzardEhx3RSP8JvFcFio07DmE3ib+h?=
 =?us-ascii?Q?qG5XftLFnsatVqiAhrpzOQ6BRr1dnQJjsygwkgGh5dIyyOUfLN0KQCQRbP3V?=
 =?us-ascii?Q?7BCFXvwu0+Z4DZ6N86w7lylwCqiLylssyytD7rnlGQKfjtKYQIoP3CcHbYWi?=
 =?us-ascii?Q?SWnRJzh5VqNT2YJurl9Ib8zYEzY8gnSPTqzWi1m5F7nSymIYDSj1BDWcNFeQ?=
 =?us-ascii?Q?2bY1lBF+LCitxLUE94MTvnYhkFxwViHd+EGjmviG4wQMPOXtXQWoQ9nk2igr?=
 =?us-ascii?Q?OTMOITmvmIfvGrhL+ONT3uhVpCl/gUjRWpSt97sQLiHUGfuawFXoFP5oOAE0?=
 =?us-ascii?Q?qfe4T73n2mLwn9mhyxzwe4YKBwyGff0nhjoy5vNO00BcmGEjFj0FrwQuI66N?=
 =?us-ascii?Q?VvNHkqA6VqAUCiKporzO433/Xn2RsPvZ1TL5V280/v+T/7Qpbp2HXLQvmHFZ?=
 =?us-ascii?Q?LyQyEmWm3Rv1qC0rqZ5zUlavM3hs/OG+SXham5M1Bq8DFwh7G/YCEGq8e33p?=
 =?us-ascii?Q?E09ANbKoLc4SfH1R3UKIY8ZapY7FbUMcBQxO4pYFdZ9T3o2sbSgaO4CR/YGs?=
 =?us-ascii?Q?24WtSXhtXR6NXWQ2nigUJRVRzw44Sy+TkCVj4x2Yjo4Ha/XNPiz6qyNi16ko?=
 =?us-ascii?Q?jQOYfAR1Pnx1pGPvVkuhZ6PyjcqSTxs2Xi98n8KZ/Tr7IEF4gFol4npx6TEj?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a0be55-76f1-4802-939b-08ddffe8ea20
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:16:38.5118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExDcTIAo5qpi8tR/beyGPlHioVaXWQfnerE6OnvK7C6mF5GLYx20Bii7o1sB6OTJmERQ/1H5zesmQZQj7O+zxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6322
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



Hello,

kernel test robot noticed "BUG:workqueue_lockup-pool" on:

commit: a3ae9f413a9785cbf472a3168131747f79722d31 ("[PATCH 4/7] drm/bridge: lock the encoder chain in scoped for_each loops")
url: https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-encoder-add-mutex-to-protect-the-bridge-chain/20250927-000253
patch link: https://lore.kernel.org/all/20250926-drm-bridge-alloc-encoder-chain-mutex-v1-4-23b62c47356a@bootlin.com/
patch subject: [PATCH 4/7] drm/bridge: lock the encoder chain in scoped for_each loops

in testcase: boot

config: x86_64-randconfig-071-20250929
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509301358.38036b85-lkp@intel.com


[   63.465088][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 45s!
[   63.465385][    C0] Showing busy workqueues and worker pools:
[   63.465405][    C0] workqueue mm_percpu_wq: flags=0x8
[   63.465454][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[   63.465500][    C0]     pending: vmstat_update
[   63.465696][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[   94.185049][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 76s!
[   94.185123][    C0] Showing busy workqueues and worker pools:
[   94.185136][    C0] workqueue mm_percpu_wq: flags=0x8
[   94.185146][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[   94.185169][    C0]     pending: vmstat_update
[   94.185278][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  124.905021][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 107s!
[  124.905073][    C0] Showing busy workqueues and worker pools:
[  124.905080][    C0] workqueue mm_percpu_wq: flags=0x8
[  124.905087][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  124.905100][    C0]     pending: vmstat_update
[  124.905172][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  155.624991][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 137s!
[  155.625049][    C0] Showing busy workqueues and worker pools:
[  155.625057][    C0] workqueue mm_percpu_wq: flags=0x8
[  155.625065][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  155.625081][    C0]     pending: vmstat_update
[  155.625161][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  186.345006][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 168s!
[  186.345099][    C0] Showing busy workqueues and worker pools:
[  186.345111][    C0] workqueue mm_percpu_wq: flags=0x8
[  186.345123][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  186.345151][    C0]     pending: vmstat_update
[  186.345277][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  217.065070][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 199s!
[  217.065206][    C0] Showing busy workqueues and worker pools:
[  217.065227][    C0] workqueue mm_percpu_wq: flags=0x8
[  217.065247][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  217.065290][    C0]     pending: vmstat_update
[  217.065477][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  247.785028][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 230s!
[  247.785093][    C0] Showing busy workqueues and worker pools:
[  247.785104][    C0] workqueue mm_percpu_wq: flags=0x8
[  247.785112][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  247.785130][    C0]     pending: vmstat_update
[  247.785223][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  278.504990][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 260s!
[  278.505051][    C0] Showing busy workqueues and worker pools:
[  278.505062][    C0] workqueue mm_percpu_wq: flags=0x8
[  278.505069][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  278.505086][    C0]     pending: vmstat_update
[  278.505169][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  309.224985][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 291s!
[  309.225073][    C0] Showing busy workqueues and worker pools:
[  309.225085][    C0] workqueue mm_percpu_wq: flags=0x8
[  309.225097][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  309.225122][    C0]     pending: vmstat_update
[  309.225238][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  339.944986][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 322s!
[  339.945076][    C0] Showing busy workqueues and worker pools:
[  339.945089][    C0] workqueue mm_percpu_wq: flags=0x8
[  339.945102][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  339.945130][    C0]     pending: vmstat_update
[  339.945258][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  370.665059][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 352s!
[  370.665192][    C0] Showing busy workqueues and worker pools:
[  370.665212][    C0] workqueue mm_percpu_wq: flags=0x8
[  370.665233][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  370.665276][    C0]     pending: vmstat_update
[  370.665467][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  401.385016][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 383s!
[  401.385074][    C0] Showing busy workqueues and worker pools:
[  401.385085][    C0] workqueue mm_percpu_wq: flags=0x8
[  401.385092][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  401.385108][    C0]     pending: vmstat_update
[  401.385195][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  432.104963][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 414s!
[  432.105013][    C0] Showing busy workqueues and worker pools:
[  432.105021][    C0] workqueue mm_percpu_wq: flags=0x8
[  432.105027][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  432.105041][    C0]     pending: vmstat_update
[  432.105111][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  462.824979][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 445s!
[  462.825065][    C0] Showing busy workqueues and worker pools:
[  462.825076][    C0] workqueue mm_percpu_wq: flags=0x8
[  462.825087][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  462.825112][    C0]     pending: vmstat_update
[  462.825229][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  493.544976][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 475s!
[  493.545072][    C0] Showing busy workqueues and worker pools:
[  493.545084][    C0] workqueue mm_percpu_wq: flags=0x8
[  493.545096][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  493.545124][    C0]     pending: vmstat_update
[  493.545252][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  524.265024][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 506s!
[  524.265136][    C0] Showing busy workqueues and worker pools:
[  524.265153][    C0] workqueue mm_percpu_wq: flags=0x8
[  524.265170][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  524.265206][    C0]     pending: vmstat_update
[  524.265371][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  554.985000][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 537s!
[  554.985069][    C0] Showing busy workqueues and worker pools:
[  554.985080][    C0] workqueue mm_percpu_wq: flags=0x8
[  554.985089][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  554.985107][    C0]     pending: vmstat_update
[  554.985213][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  585.704946][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 567s!
[  585.704998][    C0] Showing busy workqueues and worker pools:
[  585.705006][    C0] workqueue mm_percpu_wq: flags=0x8
[  585.705013][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  585.705026][    C0]     pending: vmstat_update
[  585.705098][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  616.424942][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 598s!
[  616.424990][    C0] Showing busy workqueues and worker pools:
[  616.424997][    C0] workqueue mm_percpu_wq: flags=0x8
[  616.425003][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  616.425015][    C0]     pending: vmstat_update
[  616.425082][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  647.144950][    C0] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 629s!
[  647.145035][    C0] Showing busy workqueues and worker pools:
[  647.145047][    C0] workqueue mm_percpu_wq: flags=0x8
[  647.145059][    C0]   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
[  647.145084][    C0]     pending: vmstat_update
[  647.145202][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[  674.477504][    C1] watchdog: BUG: soft lockup - CPU#1 stuck for 626s! [swapper/0:1]
[  674.477539][    C1] CPU#1 Utilization every 96s during lockup:
[  674.477543][    C1] 	#1: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
[  674.477549][    C1] 	#2: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
[  674.477553][    C1] 	#3: 100% system,	  0% softirq,	  1% hardirq,	  0% idle
[  674.477557][    C1] 	#4: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
[  674.477561][    C1] 	#5: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
[  674.477566][    C1] Modules linked in:
[  674.477571][    C1] irq event stamp: 852298
[ 674.477574][ C1] hardirqs last enabled at (852297): asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 674.477592][ C1] hardirqs last disabled at (852298): sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1050) 
[ 674.477603][ C1] softirqs last enabled at (852280): handle_softirqs (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:426 kernel/softirq.c:607) 
[ 674.477612][ C1] softirqs last disabled at (852275): __irq_exit_rcu (arch/x86/include/asm/jump_label.h:36 kernel/softirq.c:682) 
[  674.477622][    C1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc6-01063-ga3ae9f413a97 #1 VOLUNTARY
[  674.477629][    C1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[ 674.477634][ C1] RIP: 0010:__sanitizer_cov_trace_pc (arch/x86/include/asm/preempt.h:27 kernel/kcov.c:183 kernel/kcov.c:217) 
[ 674.477644][ C1] Code: 48 c7 c7 00 a1 59 8a 48 89 de e8 be 1e 42 01 eb 85 cc cc cc cc cc cc cc cc cc cc cc cc 48 8b 04 24 65 48 8b 0c 25 08 30 0a 8d <65> 8b 15 dc c0 97 0b 81 e2 00 01 ff 00 74 11 81 fa 00 01 00 00 75
All code
========
   0:	48 c7 c7 00 a1 59 8a 	mov    $0xffffffff8a59a100,%rdi
   7:	48 89 de             	mov    %rbx,%rsi
   a:	e8 be 1e 42 01       	call   0x1421ecd
   f:	eb 85                	jmp    0xffffffffffffff96
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3
  16:	cc                   	int3
  17:	cc                   	int3
  18:	cc                   	int3
  19:	cc                   	int3
  1a:	cc                   	int3
  1b:	cc                   	int3
  1c:	cc                   	int3
  1d:	48 8b 04 24          	mov    (%rsp),%rax
  21:	65 48 8b 0c 25 08 30 	mov    %gs:0xffffffff8d0a3008,%rcx
  28:	0a 8d 
  2a:*	65 8b 15 dc c0 97 0b 	mov    %gs:0xb97c0dc(%rip),%edx        # 0xb97c10d		<-- trapping instruction
  31:	81 e2 00 01 ff 00    	and    $0xff0100,%edx
  37:	74 11                	je     0x4a
  39:	81 fa 00 01 00 00    	cmp    $0x100,%edx
  3f:	75                   	.byte 0x75

Code starting with the faulting instruction
===========================================
   0:	65 8b 15 dc c0 97 0b 	mov    %gs:0xb97c0dc(%rip),%edx        # 0xb97c0e3
   7:	81 e2 00 01 ff 00    	and    $0xff0100,%edx
   d:	74 11                	je     0x20
   f:	81 fa 00 01 00 00    	cmp    $0x100,%edx
  15:	75                   	.byte 0x75
[  674.477650][    C1] RSP: 0018:ffffc9000001f138 EFLAGS: 00200287
[  674.477656][    C1] RAX: ffffffff831e1d39 RBX: ffff888160a713c0 RCX: ffff888100871b00
[  674.477660][    C1] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffff8bc06cf0
[  674.477664][    C1] RBP: 0000000000000032 R08: ffffffff8bc06cf7 R09: 1ffffffff1780d9e
[  674.477669][    C1] R10: dffffc0000000000 R11: fffffbfff1780d9f R12: dffffc0000000000
[  674.477674][    C1] R13: 1ffff1102c14e27e R14: 0000000000000000 R15: ffff88817b2bd5a0
[  674.477678][    C1] FS:  0000000000000000(0000) GS:ffff88842127d000(0000) knlGS:0000000000000000
[  674.477683][    C1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  674.477687][    C1] CR2: 00000000f7f5ecd4 CR3: 000000000a0c3000 CR4: 00000000000406f0
[  674.477695][    C1] Call Trace:
[  674.477710][    C1]  <TASK>
[ 674.477713][ C1] drm_atomic_add_encoder_bridges (drivers/gpu/drm/drm_atomic.c:1319 (discriminator 1025)) 
[ 674.477734][ C1] drm_atomic_helper_check_modeset (drivers/gpu/drm/drm_atomic_helper.c:818) 
[ 674.477767][ C1] drm_atomic_helper_check (drivers/gpu/drm/drm_atomic_helper.c:1112) 
[ 674.477775][ C1] ? vgem_fence_release (drivers/gpu/drm/vkms/vkms_drv.c:95) 
[ 674.477786][ C1] drm_atomic_check_only (drivers/gpu/drm/drm_atomic.c:1503) 
[ 674.477808][ C1] drm_atomic_commit (drivers/gpu/drm/drm_atomic.c:1571) 
[ 674.477816][ C1] ? dump_dte_entry (drivers/gpu/drm/drm_print.c:210) 
[ 674.477829][ C1] drm_client_modeset_commit_atomic (drivers/gpu/drm/drm_client_modeset.c:?) 
[ 674.477862][ C1] drm_client_modeset_commit_locked (drivers/gpu/drm/drm_client_modeset.c:1206) 
[ 674.477874][ C1] drm_client_modeset_commit (drivers/gpu/drm/drm_client_modeset.c:1232) 
[ 674.477882][ C1] __drm_fb_helper_restore_fbdev_mode_unlocked (drivers/gpu/drm/drm_fb_helper.c:?) 
[ 674.477895][ C1] drm_fb_helper_set_par (drivers/gpu/drm/drm_fb_helper.c:?) 
[ 674.477904][ C1] ? drm_fb_pixel_format_equal (drivers/gpu/drm/drm_fb_helper.c:1316) 
[ 674.477913][ C1] fbcon_init (drivers/video/fbdev/core/fbcon.c:1153) 
[ 674.477935][ C1] visual_init (drivers/tty/vt/vt.c:?) 
[ 674.477949][ C1] do_bind_con_driver (drivers/tty/vt/vt.c:3916) 
[ 674.477964][ C1] do_take_over_console (drivers/tty/vt/vt.c:?) 
[ 674.477983][ C1] do_fbcon_takeover (drivers/video/fbdev/core/fbcon.c:589) 
[ 674.477993][ C1] fbcon_fb_registered (drivers/video/fbdev/core/fbcon.c:3022) 
[ 674.478005][ C1] register_framebuffer (drivers/video/fbdev/core/fbmem.c:512) 
[ 674.478022][ C1] __drm_fb_helper_initial_config_and_unlock (drivers/gpu/drm/drm_fb_helper.c:1835) 
[ 674.478050][ C1] drm_fbdev_client_hotplug (drivers/gpu/drm/clients/drm_fbdev_client.c:53) 
[ 674.478065][ C1] drm_client_register (drivers/gpu/drm/drm_client.c:142) 
[ 674.478077][ C1] drm_fbdev_client_setup (drivers/gpu/drm/clients/drm_fbdev_client.c:?) 
[ 674.478090][ C1] drm_client_setup (drivers/gpu/drm/clients/drm_client_setup.c:47) 
[ 674.478102][ C1] vkms_init (drivers/gpu/drm/vkms/vkms_drv.c:227) 
[ 674.478116][ C1] ? vgem_init (drivers/gpu/drm/vkms/vkms_drv.c:213) 
[ 674.478121][ C1] do_one_initcall (init/main.c:1269) 
[ 674.478137][ C1] ? stack_depot_save_flags (lib/stackdepot.c:722) 
[ 674.478153][ C1] ? kasan_save_track (arch/x86/include/asm/current.h:25 (discriminator 3) mm/kasan/common.c:60 (discriminator 3) mm/kasan/common.c:69 (discriminator 3)) 
[ 674.478161][ C1] ? kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68) 
[ 674.478168][ C1] ? __kasan_kmalloc (mm/kasan/common.c:409) 
[ 674.478176][ C1] ? __kmalloc_noprof (include/linux/kasan.h:260 mm/slub.c:4376 mm/slub.c:4388) 
[ 674.478181][ C1] ? do_initcalls (init/main.c:1341) 
[ 674.478188][ C1] ? kernel_init_freeable (init/main.c:1581) 
[ 674.478193][ C1] ? kernel_init (init/main.c:1471) 
[ 674.478200][ C1] ? ret_from_fork (arch/x86/kernel/process.c:154) 
[ 674.478207][ C1] ? ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
[ 674.478225][ C1] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 674.478241][ C1] ? strlen (lib/string.c:420 (discriminator 769)) 
[ 674.478250][ C1] ? next_arg (lib/cmdline.c:273) 
[ 674.478261][ C1] ? parameq (kernel/params.c:91 (discriminator 2048) kernel/params.c:99 (discriminator 2048)) 
[ 674.478263][ C1] ? parse_args (kernel/params.c:?) 
[ 674.478263][ C1] do_initcall_level (init/main.c:1330 (discriminator 6)) 
[ 674.478263][ C1] do_initcalls (init/main.c:1344 (discriminator 2)) 
[ 674.478263][ C1] kernel_init_freeable (init/main.c:1581) 
[ 674.478263][ C1] ? rest_init (init/main.c:1461) 
[ 674.478263][ C1] kernel_init (init/main.c:1471) 
[ 674.478263][ C1] ? rest_init (init/main.c:1461) 
[ 674.478263][ C1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 674.478341][ C1] ? rest_init (init/main.c:1461) 
[ 674.478341][ C1] ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
[  674.478341][    C1]  </TASK>
[  674.478341][    C1] Kernel panic - not syncing: softlockup: hung tasks
[  674.478341][    C1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G             L      6.17.0-rc6-01063-ga3ae9f413a97 #1 VOLUNTARY
[  674.478341][    C1] Tainted: [L]=SOFTLOCKUP
[  674.478341][    C1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  674.478341][    C1] Call Trace:
[  674.478341][    C1]  <IRQ>
[ 674.478341][ C1] vpanic (kernel/panic.c:?) 
[ 674.478341][ C1] panic (??:?) 
[ 674.478341][ C1] watchdog_timer_fn (kernel/watchdog.c:832) 
[ 674.478341][ C1] ? softlockup_count_show (kernel/watchdog.c:733) 
[ 674.478341][ C1] __hrtimer_run_queues (kernel/time/hrtimer.c:1761) 
[ 674.478341][ C1] hrtimer_interrupt (kernel/time/hrtimer.c:1890) 
[ 674.478341][ C1] __sysvec_apic_timer_interrupt (arch/x86/include/asm/jump_label.h:36 arch/x86/include/asm/trace/irq_vectors.h:40 arch/x86/kernel/apic/apic.c:1057) 
[ 674.478341][ C1] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1050 (discriminator 24)) 
[  674.478341][    C1]  </IRQ>
[  674.478341][    C1]  <TASK>
[ 674.478341][ C1] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 674.478341][ C1] RIP: 0010:__sanitizer_cov_trace_pc (arch/x86/include/asm/preempt.h:27 kernel/kcov.c:183 kernel/kcov.c:217) 
[ 674.478341][ C1] Code: 48 c7 c7 00 a1 59 8a 48 89 de e8 be 1e 42 01 eb 85 cc cc cc cc cc cc cc cc cc cc cc cc 48 8b 04 24 65 48 8b 0c 25 08 30 0a 8d <65> 8b 15 dc c0 97 0b 81 e2 00 01 ff 00 74 11 81 fa 00 01 00 00 75
All code
========
   0:	48 c7 c7 00 a1 59 8a 	mov    $0xffffffff8a59a100,%rdi
   7:	48 89 de             	mov    %rbx,%rsi
   a:	e8 be 1e 42 01       	call   0x1421ecd
   f:	eb 85                	jmp    0xffffffffffffff96
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3
  16:	cc                   	int3
  17:	cc                   	int3
  18:	cc                   	int3
  19:	cc                   	int3
  1a:	cc                   	int3
  1b:	cc                   	int3


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250930/202509301358.38036b85-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

