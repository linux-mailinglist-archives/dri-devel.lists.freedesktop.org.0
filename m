Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3DE94230A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D1210E5A0;
	Tue, 30 Jul 2024 22:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0qNGrek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDBB10E59E;
 Tue, 30 Jul 2024 22:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722379199; x=1753915199;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=uGpO7ZJ3mJ+2pvfNi0AkGuy0nOeAs5Qaud6u013SItA=;
 b=h0qNGrekBKXOgMeNp1+KxR70gAeyq+vs1IJP/6nC5ZyVAd1O1jIB8L24
 Q9pMfedKWNw6H+vwrB1R6iLV0KvtEkRgDH8v+Lh1MDnlFssCqGrPI3sJL
 Dacosi/nxJbZFHtqLxt0tqAsh96iCtFqCle0wVJdDjWbR+TjIwMeuGIVX
 5rGcbuV81UpSlMpSvEN3uEVGD11iprbOY/WHM2aR6n7m5mIIdo0AyhdaO
 34n/121PwcpwWzV8Ecs7AW9vzgH76HzaTiZp1+iL3uMOwFa9+drck+hHa
 /LHNMwvGL7JKBeztBkKwq7rcjShAbNRSuA8jN/hlxDAfjiZvxzeCnaxIK A==;
X-CSE-ConnectionGUID: 8MACqGrxSvmW1vqlekh9eg==
X-CSE-MsgGUID: gHwV1k/dTuux7Ziqd+LVJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19925817"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="19925817"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:39:56 -0700
X-CSE-ConnectionGUID: 3BBBELy1SsWBMMEMe5kfCg==
X-CSE-MsgGUID: 8JJDlY+qQIuvPlJmBBliKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54474767"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 15:39:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:39:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 15:39:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 15:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t86ZFwCvuVXadioxzl3SHbr+zOh0IQGMea6g8CkL3lfrlkeWp7/Gtcu0kNGzyBNjv+iugvywRxYYp3ll1Iv8WE5H3Dlq4fZ2qyj20uwgEYWYPdeNO6xEz+z9G3oC0wo4sUh9RCDCV/oS7XtQ9iXrp+g/zfuHErJ3zD9jYdshYmcgOZecBCyHiDch/1tLboAiuJ7H9n/Mr0Ir1LoKmN64fOkO47shy2OEfA8VlVM4frIplhBbPzrH+CZqCCaidztAi2cEm7j3BP/tybFtso2YDo58oeWeZdvEOqKmjWVDxJwVRLwYjFTAZIbBqXB4NCpcYPtygy/M68QsAJkXoOfQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s4DebdfaxHe2dLb+ntArYSTci6caI9SHvXltCrQS+U=;
 b=JAFUjsjicBxYZcrB6TJo2ft6p62RdEXs/34XtdEATs3BSUnt+DzVxdReUryKXuWjynLeoBAzW+lzm18eSNi+7Fur4liS1vR3PHpXzo/uLcZf7JGu5VbtdroGLFnOpVbOKeXC/7KG2hvLrUVKDXGXJmfsL9dNvWMdIvzqTqLF4NUVVhnNwqS+Av2knC7Da70jFyF7Bmj4jZ2s4ODf8bf/rAKgHfTUA4PPWdUG2wkW6ldwiWRYA3BsoZ5KSr8FGHEas5TolXVnESNzPiyZmgKaqGkF7JOVwLxQadigpwFAiAWOfNJqcGdCYoIYtaBqhmQ9hDK1UgCEI4cQ7zC8pQKr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 22:39:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 22:39:51 +0000
Date: Tue, 30 Jul 2024 17:39:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <k7xuktfav4zmtxxjr77glu2hszypvzgmzghoumh757nqfnk7kn@ccfi4ts3ytbk>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: a024bab4-744f-4a11-2403-08dcb0e88685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ha7fyDXkktKMboCBLd9/JavjfnueqbZc38r7XbnBXrEiz33eYJQ83Q9/q4?=
 =?iso-8859-1?Q?d7rmCqqlmON+V2r/vswkDntRFJP8Ou7tTNMXyPrCe8nUXA5uqvGR65BRTT?=
 =?iso-8859-1?Q?PRz254ZMcQTopXRChIxA640eo3vuPR9fxyoPO7OZii9Qt7AXUe1jZ8zUcA?=
 =?iso-8859-1?Q?NDmH6yNlvFpS2/KS32vSWT2EWLdtw2WKkIw7v+IONc2IcOtH0oJpr0smPI?=
 =?iso-8859-1?Q?DC5HPLB1xCRjzYsT5HnmPDRFYwcgYGLcXU1XnseB0Hn369l060xu9h3rGG?=
 =?iso-8859-1?Q?okDNa//KD6zE360ShiQ1X3V5xghxDcV/DkIW4NVqQatcuGEDXZXJUWOr3j?=
 =?iso-8859-1?Q?ivWUmO15Rbgw8bFNWJoCNQ2qVfAiplOh96RUFC3wwlZwdswsPi4CRu/8Gw?=
 =?iso-8859-1?Q?TVkYW0bwh8acROjq2JNFaUmyI79jOxP8iJeOG3P3kM6QK/LtwDlzQQY5Gq?=
 =?iso-8859-1?Q?FsCQB6D//m8V1PFJW0Mdt2NF07uYwYxBJTjlP5T2WrXxx75tU69ic9A5B8?=
 =?iso-8859-1?Q?JnTcfycMxKf/2g7baIVGj/R4RpXggWTko+A4KjVJTxn9kwSwc2lac4MCw+?=
 =?iso-8859-1?Q?ajGypRtU8eov8QcxfXYDsQZYkWD7takXhIp2p+o5GzOPZyGRthcy1pOi6k?=
 =?iso-8859-1?Q?x6gHD+SOzRmvBf3qRsoajkzlrcEyr2dUpvw3FVH1/wAwPwXm/l2Kd41Pq+?=
 =?iso-8859-1?Q?XXmIXDj67J0cVFOsrRE4iwKNFPIRYJ9qvfihRtGbZVAfBlvwpwLQ3g4QeD?=
 =?iso-8859-1?Q?Hwqd/oioRBGjMcCGkZGsRXmv34xNZqGBw1sGHFIqIBaKxD34Zoqj87c6w7?=
 =?iso-8859-1?Q?npy3BW0/k08l2XXDYpuZdYCjfH2dVZZzeK80bCyYVqgLYd1uyA1NdmdFfP?=
 =?iso-8859-1?Q?8BaEBqvU1V6QjkzqiDpiAz0CQxkanr9Zuf0Y9DcJ2HYHopM9W+eaFHomBT?=
 =?iso-8859-1?Q?259XF5SVZkpjv1GYsEbDzYa0Ae/FJtrFGLtraVFvbIJ1oJZa7hIu2eAQCB?=
 =?iso-8859-1?Q?yFBoHAFUED/iwWkzBEQvoncEUFSsfwcLAcxbbWM9uzhoR4eG3WPBVBtd6Y?=
 =?iso-8859-1?Q?kPUL1a2wcwWkEZvbD1vdBrWiahko5AWJez7iZ8YkiJ4Z6dTJAwNi5i4Iop?=
 =?iso-8859-1?Q?2ZYS8KQhMIVzowAqJjP1GYTpZ7j3dV+B1sqiz9lTgbVwZC5RQgSQayTvaL?=
 =?iso-8859-1?Q?Kws/TOsMJzPJ0PK49ealgyJcNPiFo+LkJK04fzOs4akQSrxeNLemIHTNg8?=
 =?iso-8859-1?Q?prS2O0/n/Zv6NHIbjf7MFtWwGJIqbV5f+eQvyJp591osj+qrSK7gmjTlj9?=
 =?iso-8859-1?Q?xFy/3OJT/YoR/XQVzv++PqsMEi2ULTh8mbA/20PYzSbpTMQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sZajCbfXkv4/dPI4+utdifD3fEXmm7vvVrBdWUTPaMUD1hmONYvuQ/x/At?=
 =?iso-8859-1?Q?A4bPk2Www80f0iXBTOOXbix7Jkoq2aRLG1riDBBjAy38uvSlIsVqEwxOhO?=
 =?iso-8859-1?Q?OVd5+KUfBzGafXbbEpWoOaxo6yUdtljFU6TxH9A7nUqf6l23TvFCjAcj7B?=
 =?iso-8859-1?Q?Dqt3uTcp1MeBeKzjqsZdoKQqAUPYX+S3yeva5ljlFeOmCX8licYSx2OW8j?=
 =?iso-8859-1?Q?8MR2aaukVHvCAAYOWpWPK89wnlVhng8e0PLzL8c2K0nTR0y6wcarO2FgNG?=
 =?iso-8859-1?Q?9rA/lLlw1KH2cPb6k8WW5NkZu2fX5fFb/DeoKAO84zQYU9ABccBrtzoDxm?=
 =?iso-8859-1?Q?+5LRwirlL7UJ9dRbejv5Y29AKmZWeKzl6oDOgDaBOVGOwaOg8HqDgnbuIk?=
 =?iso-8859-1?Q?abat8VWG5nTQcW9EbdMPoa+bp+/3Oi7ewrO1vqQtyddyqjqQUQzdga22C9?=
 =?iso-8859-1?Q?S4n+0IolVR9mggVJd15gKHhDvY/Q8C+HKHx3XxUhOzqpXrKqOZO57VibP2?=
 =?iso-8859-1?Q?eNYO6v9QYO80b8j3QL2e7N8T4Vn1NcsT1AYk5ZpwstOEWcGttFItAKiuAS?=
 =?iso-8859-1?Q?tQbCVIL6sbeR7JuaKWs0bZCcVgB4HIKJq6OEZ8SFnCp5NE/qC1zDtcERfG?=
 =?iso-8859-1?Q?tAwz3/IqYs6pN+DTj4ZW7KmRepGg9dQlmvhW2SazoCOb8iX0zGfOCHI/o7?=
 =?iso-8859-1?Q?h0kGDKCTAIulanfAJAf7qA8TrnHSn6R1gKePzgr9pexGUClZl0qT2aOQuS?=
 =?iso-8859-1?Q?s1bAKfFy0jRSBBoN5PMIwZ95Bnde3k4ezQ6+c+ZZNxaLeEKdg/1WInOg4O?=
 =?iso-8859-1?Q?qeZLE5im9UIhNUPrx7XOWpRmScW2QhzNUWgD7t6CxFqGrGAtLvf4+PXcSH?=
 =?iso-8859-1?Q?nV6pMYhkavzXY/dMaLP6swD0p8G9DGYgVgRzHasU0eFJx90U6BygCM7Nny?=
 =?iso-8859-1?Q?8HONMoDlodnV77Cr/1p10hdXuOH3gnzJcEp4Mx42bArd1nzw8FYXqXijNS?=
 =?iso-8859-1?Q?RgsasJ/80P1s1h9SnA3dUyRUskvLwn8V93rSCj5idnTU6D3fv9jFaCQNX7?=
 =?iso-8859-1?Q?Att7Hs1OMk1I5kLhsI2G8+sFbH4jpv9WinnmIgeFAXoIADOOrPrs9hskYn?=
 =?iso-8859-1?Q?1sTKq5jBIpnacO/LhyZUdlm0xHWxMpeMwpHwOe22YYMAx6Va1QyfyncWi4?=
 =?iso-8859-1?Q?LKX7wrQQ5PuawoSvtJesMexpTEAXnZL3NJfOEHCUBym1Oil1K+LZJpIVor?=
 =?iso-8859-1?Q?recgZeFIPXiZ+raCS9kwxl9OvKZNbv61+nxbnbAqDQZ1cIAiKxqDf2uBHi?=
 =?iso-8859-1?Q?yUxJgOHsPVRpu4UT6BFIXAL1AZYufH0UpLQC6cPahHhv6AweZkymfoXNvj?=
 =?iso-8859-1?Q?kOQVs7K9DQDEsIGpgOC46wAARUOfdS6bwnERQhVzVXF6wyxoienRj9gJQk?=
 =?iso-8859-1?Q?sot7i4+cK7ERG05XL+z+qr2ryj07d9kI9jhy2wQj5VzwPWHoeXsxAYLmEP?=
 =?iso-8859-1?Q?HQT+NDze8mz4ty2PG9n899vpj9ZGfoy06a9fl0huqF8ox3jEtsJPaIjNUA?=
 =?iso-8859-1?Q?IqS2la7WgUmTAiJdimPLuzjY6rAINCtqe/DwWm+03wfgMhMM6wL5UQcgaY?=
 =?iso-8859-1?Q?x1/qKjDpoJ1ELn6n2jPWWCjO6L9FAg7wc2Y7sFAhGmLo6FYuG5yBJe4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a024bab4-744f-4a11-2403-08dcb0e88685
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 22:39:51.7173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpTE2QGt7/7R65rvRc3FhNjSnSCRFXyLYDRCjdVuO4pVG/Uv1lo/bXOxLgSHrsJo8FGrY0yyJcbA9aR/iJ/foqw6EQnN13cG/iT+lkBaQVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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

Hi Dave and Sima,

Early drm-xe-next pull request for 6.12. Main reason for being much
earlier than usual is to have the additional SIMD16 EU reported as it's
a needed UAPI for Lunar Lake and Battlemage. It's sitting in drm-xe-next
for a few weeks and userspace already testing with it.

There's also a minor uapi change with change of error return code. The
other 2 already propagated via -fixes.

Other changes bring general improvements and cleanups to the driver,
further support for SR-IOV as well as head Lunar Lake and Battlemage to
the finish line of being officially exposed by the driver. Some bits
still influx, so not yet there though.

thanks
Lucas De Marchi

drm-xe-next-2024-07-30:
drm-xe-next for 6.12

UAPI Changes:
- Rename xe perf layer as xe observation layer, but was
   also made available via fixes to previous verison (Ashutosh)
- Use write-back caching mode for system memory on DGFX,
   but was also mad available via fixes to previous version (Thomas)
- Expose SIMD16 EU mask in topology query for userspace to know
   the type of EU, as available in PVC, Lunar Lake and Battlemage
   (Lucas)
- Return ENOBUFS instead of ENOMEM in vm_bind if failure is tied
   to an array of binds (Matthew Brost)

Driver Changes:
- Log cleanup moving messages to debug priority (Michal Wajdeczko)
- Add timeout to fences to adhere to dma_buf rules (Matthew Brost)
- Rename old engine nomenclature to exec_queue (Matthew Brost)
- Convert multiple bind ops to 1 job (Matthew Brost)
- Add error injection for vm bind to help testing error path
   (Matthew Brost)
- Fix error handling in page table to propagate correctly
   to userspace (Matthew Brost)
- Re-organize and cleanup SR-IOV related registers (Michal Wajdeczko)
- Make the device write barrier compatible with VF (Michal Wajdeczko)
- New display workarounds for Battlemage (Matthew  Auld)
- New media workarounds for Lunar Lake and Battlemage (Ngai-Mint Kwan)
- New graphics workarounds for Lunar Lake (Bommu Krishnaiah)
- Tracepoint updates (Matthew Brost, Nirmoy Das)
- Cleanup the header generation for OOB workarounds (Lucas De Marchi)
- Fix leaking HDCP-related object (Nirmoy Das)
- Serialize L2 flushes to avoid races (Tejas Upadhyay)
- Log pid and comm on job timeout (José Roberto de Souza)
- Simplify boilerplate code for live kunit (Michal Wajdeczko)
- Improve kunit skips for live kunit (Michal Wajdeczko)
- Fix xe_sync cleanup when handling xe_exec ioctl (Ashutosh Dixit)
- Limit fair VF LMEM provisioning (Michal Wajdeczko)
- New workaround to fence mmio writes in Lunar Lake (Tejas Upadhyay)
- Warn on writes inaccessible register in VF (Michal Wajdeczko)
- Fix register lookup in VF (Michal Wajdeczko)
- Add GSC support for Battlemage (Alexander Usyskin)
- Fix wedging only the GT in which timeout occurred (Matthew Brost)
- Block device suspend when wedging (Matthew Brost)
- Handle compression and migration changes for Battlemage
   (Akshata Jahagirdar)
- Limit access of stolen memory for Lunar Lake (Uma Shankar)
- Fail invalid addresses during user fence creation (Matthew Brost)
- Refcount xe_file to safely and accurately store fdinfo stats
   (Umesh Nerlige Ramappa)
- Cleanup and fix PM reference for TLB invalidation code
   (Matthew Brost)
- Fix PM reference handling when communicating with GuC (Matthew Brost)
- Add new BO flag for 2 MiB alignement and use in VF (Michal Wajdeczko)
- Simplify MMIO setup for multi-tile platforms (Lucas De Marchi)
- Add check for uninitialized access to OOB workarounds
   (Lucas De Marchi)
- New GSC and HuC firmware blobs for Lunar Lake and Battlemage
   (Daniele Ceraolo Spurio)
- Unify mmio wait logic (Gustavo Sousa)
- Fix off-by-one when processing RTP rules (Lucas De Marchi)
- Future-proof migrate logic with compressed PAT flag (Matt Roper)
- Add WA kunit tests for Battlemage (Lucas De Marchi)
- Test active tracking for workaorunds with kunit (Lucas De Marchi)
- Add kunit tests for RTP with no actions (Lucas De Marchi)
- Unify parse of OR rules in RTP (Lucas De Marchi)
- Add performance tuning for Battlemage (Sai Teja Pottumuttu)
- Make bit masks unsigned (Geert Uytterhoeven)
The following changes since commit aaa08078e7251131f045ba248a68671db7f7bdf7:

   drm/xe/bmg: Apply Wa_22019338487 (2024-07-02 12:14:00 -0400)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-07-30

for you to fetch changes up to f2881dfdaaa9ec873dbd383ef5512fc31e576cbb:

   drm/xe/oa/uapi: Make bit masks unsigned (2024-07-30 13:45:38 -0700)

----------------------------------------------------------------
drm-xe-next for 6.12

UAPI Changes:
- Rename xe perf layer as xe observation layer, but was
   also made available via fixes to previous verison (Ashutosh)
- Use write-back caching mode for system memory on DGFX,
   but was also mad available via fixes to previous version (Thomas)
- Expose SIMD16 EU mask in topology query for userspace to know
   the type of EU, as available in PVC, Lunar Lake and Battlemage
   (Lucas)
- Return ENOBUFS instead of ENOMEM in vm_bind if failure is tied
   to an array of binds (Matthew Brost)

Driver Changes:
- Log cleanup moving messages to debug priority (Michal Wajdeczko)
- Add timeout to fences to adhere to dma_buf rules (Matthew Brost)
- Rename old engine nomenclature to exec_queue (Matthew Brost)
- Convert multiple bind ops to 1 job (Matthew Brost)
- Add error injection for vm bind to help testing error path
   (Matthew Brost)
- Fix error handling in page table to propagate correctly
   to userspace (Matthew Brost)
- Re-organize and cleanup SR-IOV related registers (Michal Wajdeczko)
- Make the device write barrier compatible with VF (Michal Wajdeczko)
- New display workarounds for Battlemage (Matthew  Auld)
- New media workarounds for Lunar Lake and Battlemage (Ngai-Mint Kwan)
- New graphics workarounds for Lunar Lake (Bommu Krishnaiah)
- Tracepoint updates (Matthew Brost, Nirmoy Das)
- Cleanup the header generation for OOB workarounds (Lucas De Marchi)
- Fix leaking HDCP-related object (Nirmoy Das)
- Serialize L2 flushes to avoid races (Tejas Upadhyay)
- Log pid and comm on job timeout (José Roberto de Souza)
- Simplify boilerplate code for live kunit (Michal Wajdeczko)
- Improve kunit skips for live kunit (Michal Wajdeczko)
- Fix xe_sync cleanup when handling xe_exec ioctl (Ashutosh Dixit)
- Limit fair VF LMEM provisioning (Michal Wajdeczko)
- New workaround to fence mmio writes in Lunar Lake (Tejas Upadhyay)
- Warn on writes inaccessible register in VF (Michal Wajdeczko)
- Fix register lookup in VF (Michal Wajdeczko)
- Add GSC support for Battlemage (Alexander Usyskin)
- Fix wedging only the GT in which timeout occurred (Matthew Brost)
- Block device suspend when wedging (Matthew Brost)
- Handle compression and migration changes for Battlemage
   (Akshata Jahagirdar)
- Limit access of stolen memory for Lunar Lake (Uma Shankar)
- Fail invalid addresses during user fence creation (Matthew Brost)
- Refcount xe_file to safely and accurately store fdinfo stats
   (Umesh Nerlige Ramappa)
- Cleanup and fix PM reference for TLB invalidation code
   (Matthew Brost)
- Fix PM reference handling when communicating with GuC (Matthew Brost)
- Add new BO flag for 2 MiB alignement and use in VF (Michal Wajdeczko)
- Simplify MMIO setup for multi-tile platforms (Lucas De Marchi)
- Add check for uninitialized access to OOB workarounds
   (Lucas De Marchi)
- New GSC and HuC firmware blobs for Lunar Lake and Battlemage
   (Daniele Ceraolo Spurio)
- Unify mmio wait logic (Gustavo Sousa)
- Fix off-by-one when processing RTP rules (Lucas De Marchi)
- Future-proof migrate logic with compressed PAT flag (Matt Roper)
- Add WA kunit tests for Battlemage (Lucas De Marchi)
- Test active tracking for workaorunds with kunit (Lucas De Marchi)
- Add kunit tests for RTP with no actions (Lucas De Marchi)
- Unify parse of OR rules in RTP (Lucas De Marchi)
- Add performance tuning for Battlemage (Sai Teja Pottumuttu)
- Make bit masks unsigned (Geert Uytterhoeven)

----------------------------------------------------------------
Akshata Jahagirdar (7):
       drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
       drm/xe/migrate: Add kunit to test clear functionality
       drm/xe/migrate: Add helper function to program identity map
       drm/xe/xe2: Introduce identity map for compressed pat for vram
       drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
       drm/xe/migrate: Add kunit to test migration functionality for BMG
       drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

Alexander Usyskin (1):
       drm/xe/gsc: add Battlemage support

Ashutosh Dixit (2):
       drm/xe/uapi: Rename xe perf layer as xe observation layer
       drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup

Bommu Krishnaiah (1):
       drm/xe/xe2lpg: Extend workaround 14021402888

Daniele Ceraolo Spurio (3):
       drm/xe/huc: Define HuC binary for LNL
       drm/xe/gsc: Define GSC binary for LNL
       drm/xe/huc: Define HuC binary for BMG

Geert Uytterhoeven (1):
       drm/xe/oa/uapi: Make bit masks unsigned

Gustavo Sousa (2):
       drm/xe: Remove stale declaration of xe_mmio_probe_vram()
       drm/xe/mmio: Use single logic for waiting functions

Himal Prasad Ghimiray (1):
       drm/xe: Delete unused register from xe_regs.h

José Roberto de Souza (1):
       drm/xe: Add process name and PID to job timedout message

Lucas De Marchi (15):
       drm/xe/gt: Remove double include
       drm/xe: Generate oob before compiling anything
       drm/xe/uapi: Expose SIMD16 EU mask in topology query
       drm/xe: Fix warning on unreachable statement
       drm/xe: Refactor mmio setup for multi-tile
       drm/xe: Add assert for XE_WA() usage
       drm/xe/rtp: Fix off-by-one when processing rules
       drm/xe/kunit: Test WAs for BMG
       drm/xe/kunit: Rename count to count_sr_entries
       drm/xe/kunit: Test active rtp entries
       drm/xe/kunit: Rename rtp test cases
       drm/xe/kunit: Test rtp with no actions
       drm/xe/rtp: Simplify marking active workarounds
       drm/xe/rtp: Expand max rules/actions per entry again
       drm/xe: Migrate OOB WAs to OR rules

Matt Roper (1):
       drm/xe/migrate: Future-proof compressed PAT check

Matthew Auld (2):
       drm/xe/bmg: implement Wa_16023588340
       drm/i915: disable fbc due to Wa_16023588340

Matthew Brost (23):
       drm/xe: Add timeout to preempt fences
       drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
       drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
       drm/xe: Add xe_exec_queue_last_fence_test_dep
       drm/xe: Convert multiple bind ops into single job
       drm/xe: Update VM trace events
       drm/xe: Update PT layer with better error handling
       drm/xe: Add VM bind IOCTL error injection
       drm/xe: Drop trace_xe_hw_fence_free
       drm/xe: Wedge the entire device
       drm/xe: Don't suspend device upon wedge
       drm/xe: Validate user fence during creation
       drm/xe: Remove unused xe_sync_entry_wait
       drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
       drm/xe: Drop xe_gt_tlb_invalidation_wait
       drm/xe: Hold a PM ref when GT TLB invalidations are inflight
       drm/xe: Build PM into GuC CT layer
       drm/xe: Fix xe_pt_abort_unbind
       drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to an array of binds
       drm/xe: Store process name and pid in xe file
       drm/xe: Remove fence check from send_tlb_invalidation
       drm/xe: Fix possible UAF in guc_exec_queue_process_msg
       drm/xe: Assert G2H outstanding when releasing G2H

Michal Wajdeczko (22):
       drm/xe/guc: Demote GuC IDs usage message to debug
       drm/xe: Fix register definition order in xe_regs.h
       drm/xe: Kill regs/xe_sriov_regs.h
       drm/xe: Use VF_CAP_REG for device wmb
       drm/xe/kunit: Kill xe_cur_kunit()
       drm/xe/kunit: Drop XE_TEST_EXPORT
       drm/xe/kunit: Simplify xe_bo live tests code layout
       drm/xe/kunit: Simplify xe_dma_buf live tests code layout
       drm/xe/kunit: Simplify xe_migrate live tests code layout
       drm/xe/kunit: Simplify xe_mocs live tests code layout
       drm/xe/pf: Limit fair VF LMEM provisioning
       drm/xe/vf: Track writes to inaccessible registers from VF
       drm/xe/vf: Fix register value lookup
       drm/xe: Introduce const cast helper
       drm/xe/tests: Add helpers for use in live tests
       drm/xe/tests: Convert xe_bo live tests
       drm/xe/tests: Convert xe_dma_buf live tests
       drm/xe/tests: Convert xe_migrate live tests
       drm/xe/tests: Convert xe_mocs live tests
       drm/xe/tests: Skip xe_mocs live tests on VF device
       drm/xe: Normalize NEEDS_64K BO flag
       drm/xe: Add NEEDS_2M BO flag

Ngai-Mint Kwan (1):
       drm/xe/xe2lpm: Extend Wa_16021639441

Nirmoy Das (2):
       drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
       drm/xe/pm: Add trace for pm functions

Ohad Sharabi (1):
       drm/xe/oa: Don't use hardcoded values

Sai Teja Pottumuttu (1):
       drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG

Tejas Upadhyay (2):
       drm/xe/xe2: Make subsequent L2 flush sequential
       drm/xe/xe2: Add Wa_15015404425

Thomas Hellström (1):
       drm/xe: Use write-back caching mode for system memory on DGFX

Uma Shankar (1):
       drm/xe/fbdev: Limit the usage of stolen for LNL+

Umesh Nerlige Ramappa (4):
       drm/xe: Move part of xe_file cleanup to a helper
       drm/xe: Add ref counting for xe_file
       drm/xe: Take a ref to xe file when user creates a VM
       drm/xe: Fix use after free when client stats are captured

  drivers/gpu/drm/i915/display/intel_display_wa.h   |    8 +
  drivers/gpu/drm/i915/display/intel_fbc.c          |    6 +
  drivers/gpu/drm/xe/Makefile                       |   25 +-
  drivers/gpu/drm/xe/display/intel_fbdev_fb.c       |    6 +-
  drivers/gpu/drm/xe/display/xe_display_wa.c        |   16 +
  drivers/gpu/drm/xe/display/xe_dsb_buffer.c        |    8 +
  drivers/gpu/drm/xe/display/xe_fb_pin.c            |    3 +
  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c          |   12 +-
  drivers/gpu/drm/xe/display/xe_plane_initial.c     |    6 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h              |   15 +
  drivers/gpu/drm/xe/regs/xe_regs.h                 |   12 +-
  drivers/gpu/drm/xe/regs/xe_sriov_regs.h           |   23 -
  drivers/gpu/drm/xe/tests/Makefile                 |    6 +-
  drivers/gpu/drm/xe/tests/xe_bo.c                  |   45 +-
  drivers/gpu/drm/xe/tests/xe_bo_test.c             |   21 -
  drivers/gpu/drm/xe/tests/xe_bo_test.h             |   14 -
  drivers/gpu/drm/xe/tests/xe_dma_buf.c             |   26 +-
  drivers/gpu/drm/xe/tests/xe_dma_buf_test.c        |   20 -
  drivers/gpu/drm/xe/tests/xe_dma_buf_test.h        |   13 -
  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c       |   39 +
  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h       |    2 +
  drivers/gpu/drm/xe/tests/xe_live_test_mod.c       |   11 +
  drivers/gpu/drm/xe/tests/xe_migrate.c             |  424 ++++++-
  drivers/gpu/drm/xe/tests/xe_migrate_test.c        |   20 -
  drivers/gpu/drm/xe/tests/xe_migrate_test.h        |   13 -
  drivers/gpu/drm/xe/tests/xe_mocs.c                |   44 +-
  drivers/gpu/drm/xe/tests/xe_mocs_test.c           |   21 -
  drivers/gpu/drm/xe/tests/xe_mocs_test.h           |   14 -
  drivers/gpu/drm/xe/tests/xe_pci.c                 |   30 +
  drivers/gpu/drm/xe/tests/xe_pci_test.c            |    4 +-
  drivers/gpu/drm/xe/tests/xe_pci_test.h            |    2 +
  drivers/gpu/drm/xe/tests/xe_rtp_test.c            |  219 +++-
  drivers/gpu/drm/xe/tests/xe_test.h                |   10 +-
  drivers/gpu/drm/xe/tests/xe_wa_test.c             |    1 +
  drivers/gpu/drm/xe/xe_bo.c                        |   58 +-
  drivers/gpu/drm/xe/xe_bo.h                        |    5 +-
  drivers/gpu/drm/xe/xe_bo_types.h                  |    5 +-
  drivers/gpu/drm/xe/xe_devcoredump.c               |   10 +-
  drivers/gpu/drm/xe/xe_device.c                    |  135 ++-
  drivers/gpu/drm/xe/xe_device.h                    |    9 +
  drivers/gpu/drm/xe/xe_device_types.h              |   32 +-
  drivers/gpu/drm/xe/xe_drm_client.c                |    5 +-
  drivers/gpu/drm/xe/xe_exec.c                      |   14 +-
  drivers/gpu/drm/xe/xe_exec_queue.c                |   33 +-
  drivers/gpu/drm/xe/xe_exec_queue.h                |    2 +
  drivers/gpu/drm/xe/xe_exec_queue_types.h          |   13 +-
  drivers/gpu/drm/xe/xe_execlist.c                  |    3 +-
  drivers/gpu/drm/xe/xe_gen_wa_oob.c                |   16 +-
  drivers/gpu/drm/xe/xe_gt.c                        |   69 ++
  drivers/gpu/drm/xe/xe_gt.h                        |    1 +
  drivers/gpu/drm/xe/xe_gt_sriov_pf.c               |    2 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c        |    2 +
  drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |   28 +-
  drivers/gpu/drm/xe/xe_gt_sriov_vf.h               |    1 +
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       |  205 ++--
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h       |   12 +-
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h |    4 +
  drivers/gpu/drm/xe/xe_gt_topology.c               |   27 +-
  drivers/gpu/drm/xe/xe_gt_types.h                  |   27 +-
  drivers/gpu/drm/xe/xe_guc.c                       |   16 +
  drivers/gpu/drm/xe/xe_guc.h                       |    1 +
  drivers/gpu/drm/xe/xe_guc_ct.c                    |   11 +-
  drivers/gpu/drm/xe/xe_guc_id_mgr.c                |    4 +-
  drivers/gpu/drm/xe/xe_guc_submit.c                |   94 +-
  drivers/gpu/drm/xe/xe_guc_submit.h                |    1 +
  drivers/gpu/drm/xe/xe_heci_gsc.c                  |   28 +-
  drivers/gpu/drm/xe/xe_heci_gsc.h                  |   10 +-
  drivers/gpu/drm/xe/xe_hw_fence.c                  |    1 -
  drivers/gpu/drm/xe/xe_irq.c                       |    2 +
  drivers/gpu/drm/xe/xe_lmtt.c                      |    4 +-
  drivers/gpu/drm/xe/xe_migrate.c                   |  528 +++++----
  drivers/gpu/drm/xe/xe_migrate.h                   |   34 +-
  drivers/gpu/drm/xe/xe_mmio.c                      |  231 ++--
  drivers/gpu/drm/xe/xe_mmio.h                      |    1 -
  drivers/gpu/drm/xe/xe_module.c                    |    6 +-
  drivers/gpu/drm/xe/xe_oa.c                        |   36 +-
  drivers/gpu/drm/xe/xe_observation.c               |   93 ++
  drivers/gpu/drm/xe/xe_observation.h               |   20 +
  drivers/gpu/drm/xe/xe_pat.c                       |   11 +-
  drivers/gpu/drm/xe/xe_pci.c                       |    7 +-
  drivers/gpu/drm/xe/xe_perf.c                      |   92 --
  drivers/gpu/drm/xe/xe_perf.h                      |   20 -
  drivers/gpu/drm/xe/xe_pm.c                        |    8 +
  drivers/gpu/drm/xe/xe_preempt_fence.c             |   12 +-
  drivers/gpu/drm/xe/xe_pt.c                        | 1310 +++++++++++++--------
  drivers/gpu/drm/xe/xe_pt.h                        |   14 +-
  drivers/gpu/drm/xe/xe_pt_types.h                  |   48 +
  drivers/gpu/drm/xe/xe_query.c                     |    4 +-
  drivers/gpu/drm/xe/xe_rtp.c                       |   42 +-
  drivers/gpu/drm/xe/xe_rtp.h                       |    4 +-
  drivers/gpu/drm/xe/xe_rtp_helpers.h               |    6 +
  drivers/gpu/drm/xe/xe_sa.c                        |    7 +
  drivers/gpu/drm/xe/xe_sriov.c                     |    2 +-
  drivers/gpu/drm/xe/xe_sync.c                      |   20 +-
  drivers/gpu/drm/xe/xe_sync.h                      |    1 -
  drivers/gpu/drm/xe/xe_trace.h                     |   57 +-
  drivers/gpu/drm/xe/xe_trace_bo.h                  |   10 +-
  drivers/gpu/drm/xe/xe_tuning.c                    |    8 +
  drivers/gpu/drm/xe/xe_uc.c                        |   14 +
  drivers/gpu/drm/xe/xe_uc.h                        |    1 +
  drivers/gpu/drm/xe/xe_uc_fw.c                     |    3 +
  drivers/gpu/drm/xe/xe_vm.c                        |  699 +++++------
  drivers/gpu/drm/xe/xe_vm.h                        |    2 +
  drivers/gpu/drm/xe/xe_vm_types.h                  |   55 +-
  drivers/gpu/drm/xe/xe_wa.c                        |   15 +
  drivers/gpu/drm/xe/xe_wa.h                        |    7 +-
  drivers/gpu/drm/xe/xe_wa_oob.rules                |    2 +
  include/uapi/drm/xe_drm.h                         |  128 +-
  108 files changed, 3610 insertions(+), 1977 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/display/xe_display_wa.c
  delete mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.c
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.c
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.h
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
  delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
  create mode 100644 drivers/gpu/drm/xe/xe_observation.c
  create mode 100644 drivers/gpu/drm/xe/xe_observation.h
  delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
  delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
