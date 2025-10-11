Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23021BCFB84
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A37810E119;
	Sat, 11 Oct 2025 19:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jA5druU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37FF10E119;
 Sat, 11 Oct 2025 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211641; x=1791747641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CtTCqA7zyq0Zu9CZja6/xZLnRc/JQu/rM0529AGTLE8=;
 b=jA5druU5fd+easYMvJ4wE6YueFbCIGDs3Qn91ASfJ5UHTcnykwIkslNy
 Jw+Fa58lSzuEHZrLeKvmNjMjAXtmmPyYpoTMWk6PliHYShPsgxBJI4GxB
 llgJ3vV7iJDt/EPp/Ye5H1VsZEsQ1Vyo9F4A4TLsR7Trk+S+SpbK1qqn5
 bLSHXwYFCxIIMGXUcM1SA79QoH3YxnqylisszuKnimd1i2y1QJ4JqQPMp
 uWWWjdh5D+D6ij3rBDthAJYmq7iM1en7OrBIis9mO666FkmIgHpHRy8Sl
 3v94WS/+KOLeJLPlFARaIj8koebvW3jN3H2tBh0lUhJmhrAX4hOtckxtU g==;
X-CSE-ConnectionGUID: 96T3jEUjQS+mQFnpBfJtjA==
X-CSE-MsgGUID: LXyrzQNpRzO50BhRXMA95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66227459"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66227459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:40 -0700
X-CSE-ConnectionGUID: 0r3QKBoXReys85Wb+a+eTw==
X-CSE-MsgGUID: NSZgcDEfR0K+b2ITZTww2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186524928"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlIXWJ1lFJ/5POLMP9i9PvKhbkmb19bGwCyh7eZssbqvpNLPQ/87eLTTrzpaovFZe0li8dn82D73sBC8r5klC57NKAZA97fehtrecn9Y460rxDZJWYk09NlN5lZZcpjXvGrO0vWSribo35obcAxonuFgY2RTDkiUiMKCcVshJj79i+r3NnkjuFAsH7n2b1o7rVpXLxaqqD+T4YYBpquHnheAPIQbMxuHFoJF1e0ATOZvBh8e8K8XIeQrQCV8Yv80ziGrDVuvDZKm1Szr7alBScGOHD0lI/XZKse8feLCtbx5NDo6qPiV3yqDVbhEGAP+1CiUxDLnzNd326UGbk6i7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZAlJB3kCRTS/7OjyGC0c2VloOQnIGc744PuPLczo4s=;
 b=F2teXHRHxMC/xuLWP7T5sQv1ZKpme1T2qNphqqoHLmKZsHpwJF1I9KJiJy08TACQhdeCMZe8CCMzLUBXhqxIMaxPWwXdIYE87gxNQbd3QIykn1gJFIshmNMMqm1y3+0WhiiPi1vdWWv87zHxatiuwkAWTYhXxMo4MU8cn/uR4DFC6FFoKv2ixgV26g5ynUnN4OOG98wCGXmUFJHjF2icmUD0ymYSu4MJUSH7uXshq/JSom6W54colOCvoXdiu44IoJ4wfguldU97evIs599vIfPoZSr/rL2X0ldC47qWgflibK7y8lyUAS/Tv2+LhsRD+gupnrtxSpUtGcVDidu59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 05/26] drm/xe/pf: Add data structures and handlers for
 migration rings
Date: Sat, 11 Oct 2025 21:38:26 +0200
Message-ID: <20251011193847.1836454-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0420.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 28250de0-cb7c-440d-e517-08de08fe0d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlpNTTJydno3SFpPTVNjN0hkRWF0MU90aHFVRHVRZjhoL0RBNlhxMmxUWXF1?=
 =?utf-8?B?QVVCMzNKcGo5dlYybnBTYm1MTklqeVAzdGoyR3djQnZXTHRZUUNXQ3NSbFRR?=
 =?utf-8?B?TXhjckk5ejZncTZ6VHhJUTdOc0RVNHF2Unh0N2FpMHZnR3pVS0EyVlZNSHg2?=
 =?utf-8?B?cHZPRXRUMCtvc0l5T09jV3ZpUGhyRnBDaU9xMy9JT1RkamhEYWdBWk5qaGdN?=
 =?utf-8?B?ajJGUll2bFBHbEE2V1ZhZjhVSVdUMFVrdm5vSVVWUHBqREJSeEt0R0dYY093?=
 =?utf-8?B?ejZONmJadFd5ZUdXVWFsNmMrNk5ZeWQzRitrRExIMHBuazRHK0FGRVpmVy9T?=
 =?utf-8?B?UmFSNTByNDd2bjliRjJyUm93ajA0MEJRTGd1WFV4ekR1bGY0bG15aWhCLzQ1?=
 =?utf-8?B?bmU0RjJkcHRyV2dOSUNhcHRrZHpOQ1NEMzdNRGp5SWUzUjRTbWpIVEg2Y3Fa?=
 =?utf-8?B?cnBvbkFIZDBTVzBrR2UxWHp2TFRKc253WllXbXF4azNVb2FtajNyZVJhUjg4?=
 =?utf-8?B?dmt3WHVBMHdwcXQwTFY1T2hMSVFuVjA0blNvWkNVNHhQSng2elA4YjRJUzha?=
 =?utf-8?B?NkR0ajg0QXZYS0hRZE5hQTFWUG82ZjlPbGg3QXJNUnNSVi9mWi9Xc3NuZjdW?=
 =?utf-8?B?TENydnI5Vy9oRDlRd2sxdzlPeU4zR1g1aFF2bW01Nnd0UkdRUnZZRGh6YXp4?=
 =?utf-8?B?UXNVQSsrSU9hYjM3cVA3bjNISm5lejlacTg3NWh0OTlXa2h0TVNFTlQ4bFNF?=
 =?utf-8?B?dW55Zmt6QmF2T05kME9sR2FwOE5iMTFVSUJrMlVIWXMwUHlXaVRseTRyZEor?=
 =?utf-8?B?TXJaT2xyNFpFbnQxbGJ1NTI0WTNrRSs3eXhHWm12RGVIQkN3WG9rTzlYRjFE?=
 =?utf-8?B?U215R1pHSWFkUGNqOFhXdFZKU2ZHcG8xa0hGTUNlZzAzcjkwR2RKcDAwV3RI?=
 =?utf-8?B?T0Z0TEFtSVNkSkU0aENVc2g5L1c4SXg4V3MvZW4rclRZRjNySVFQRTc3aExK?=
 =?utf-8?B?V3NvVVhmbmxEd1dYdWwvSlExTEZWNHZ2S0ozWG9YNjFuMi8xOW9IblM3TEpz?=
 =?utf-8?B?VmcxaCtGT1N0d29VTmV5WnZiYkprbEI4S3JzQ1cxZDd0U0RldkkyL205Q2hk?=
 =?utf-8?B?U0J1TUxyVnFUbHRLNFhTaGcwTGhFWHFTbVlGck45OEJxaU9VTkRWeUFCc1Br?=
 =?utf-8?B?dTVtUGRlTitFdzhJYmtacVBjYlhJbkZvVG9UeVVhZEt4dWQ5ZzRIOFlmWGNH?=
 =?utf-8?B?QmxreGxkWEwxRmZjV3U2bmpBOTNBVWhCTFM3OFk5WE85U1NIMDQ2UDVGWEtT?=
 =?utf-8?B?MC9TZXpyZlBoM0g3am9OL1dwREcxa2VidWlOaXF1a1I5cHFhQitBQURBUnp1?=
 =?utf-8?B?QVZCU3Z1ZWlLWjhaa29HV3NkYmdsUzZDaXViSkgwQlVjcndoMnRaWXZKOXVV?=
 =?utf-8?B?T1VPcFpMWGxZWWNKQ3RtbDJpRHBPT0JWMWhIaGNiWU9WWFBmSWo4Y0cxVE1U?=
 =?utf-8?B?WUVpZnJsM0NtWE1CaHR4OWVKRnV2RVVkSVFlaFdHWUpNQVNsZlkzbUZCRHl0?=
 =?utf-8?B?S29WV01abHEvN3hOY3duYmo2eC8yQXA1Qk83OThWSnh5emxiRXRVSFFmRXYy?=
 =?utf-8?B?WjUvMFFEL2toVXlVOHIwNlZtUWFhZFN5Y3FuK1ZmaVpBV0pWTkF6TGJFTDND?=
 =?utf-8?B?T2N2dmhCYUdad0VvQ0VFWVo1TDZxMUpDc0t1SWtudjBnM1RGTkV0U0tENE5C?=
 =?utf-8?B?c1JEUUdITVRyMytNdDNrdExJZitIUjBhUEEwZk1YK1hqY2ViSDFLQUdBY3Nq?=
 =?utf-8?B?SFNRRnpKcUwvQVhBRXNRVU9UOXpBNlJYaVF0OVNEQkdiL0xKTUhMZXpkSHEv?=
 =?utf-8?B?WUE5aytxcUpIK3E5cmpKVjREU3VncExhZ0pDTXJVYlpoZVBZNlpVM3BJenMx?=
 =?utf-8?B?WEpWcndSZnRXUEh5dnZGUHk1cU9wb2JIazVqK1dSL3ZvMEtwbEdUbGlBRGNo?=
 =?utf-8?Q?ru6IRdGqU1PTAcAoGPg5BEn9mzTPgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzkxbndWMFhuYkZkclYyZGJBWDBmR3VGSWtHejN2UjlEQ3R4bHkrS3dFRU1i?=
 =?utf-8?B?LzNHMWlOUlNIVWJ3bFFoUHpUQU40bG9kRFVjS0VhU3ZQVGRwYWxQU3p2K0ky?=
 =?utf-8?B?SWtUbnpTZ1FVaWYyaWJ3dmkrRkNmQlZTNzlWbmtURWVQSmgwWW14THJyQzFF?=
 =?utf-8?B?RzJjSzVoRkk0eWFHTUZYeE9tdmZoamY0bEI3QnYrSWdacFRERXlQVURWb2lX?=
 =?utf-8?B?Uk92UCtqbXp0WEM1RmdzNkZhN0lHcnBsN0drSXVPZHM5eHFxZFRUWjNLRzdq?=
 =?utf-8?B?czVsR2VWeTU5OHR5Vjl1MEVlcjBQTGxRRUI4TUtHeFJiUzZiTExrY3REdDJF?=
 =?utf-8?B?Q3M4b0FuV1NsSzFxTHRWd0pOWUhJcEdrWklaY01YeVJrK2Z2YkpoRjRlWHB0?=
 =?utf-8?B?c2prY0hPR3pSZ3RBS3hUbVM0R3FUS0h0c21uMS9QSHpHNmY5NlFHeVBBMDJt?=
 =?utf-8?B?T1JKWlBwaUF5MUtGYm9Ubm0yN2huMFkvWjdmT0RiUkVLd0w5M3p1cllJNmI1?=
 =?utf-8?B?UkJCaEJzUXhPYmZvYnBSeWlrMWl5RlhlOWdhc0ZuZzJ1U1VzSjRQdEJQblND?=
 =?utf-8?B?cHh6cGFNdmo4MnplN2Yra3h5RHczV255Nmdma09Rdmh4ZjNiVUQ4UEh2RGVR?=
 =?utf-8?B?K2djazQ3ME5tUG42Z1VZU0lvcU1JOVZpcGhKSXByVEU4SDJEa1BuU3QyRGlu?=
 =?utf-8?B?Yk05aFA0bVFtaHppRFVnNzBGZmNLdW41bDJ2TXVIWnZmLzBKQlNlSlRXNy9O?=
 =?utf-8?B?TUI4a3N6U21uZFpDSmtxTFRpVEFSNUFJY2VVWVV1UjdpVlRqdTR3MTRGVFRS?=
 =?utf-8?B?WkdzaU9vSDlvN0tzUVc1cG5BcVJVMXpPMkVlQUQyZ2toTGE3L1JJWHhUeWxX?=
 =?utf-8?B?TkpDUm5YeDl0MFZaNFd3TlhpTmhZUUR3SjVmTU1NNW9NNDl1VXNQMVBlbHVs?=
 =?utf-8?B?S3pDOStROTR6Q3lIQU0xWDc0bVpBaHhneVFjb0g2NWNnSGEzSmdxMDZQb1gr?=
 =?utf-8?B?UjdjeHZCeDBCLzZaTmZrUG0wOGozRWtqa2IzWHdyMU8yYjZoYU80QjhZWFRV?=
 =?utf-8?B?SC9KbHdBZjh6TEZLTksxQmF6WUgrQnVxR0FkTkpSYm0yZ2NLamVaL1lUT2dx?=
 =?utf-8?B?dm9pZUdFNG90SGgzbW5pV1NQN1ljaVJtSkpJc3o5eG0vWjRSOWVia1Q5WHY2?=
 =?utf-8?B?N2F3V1loVGJPcEJiRVdNNzVSZVR1QnVlT3ZXbVJOaEpTSEljckhZSUNBbkt5?=
 =?utf-8?B?VEoxMnV2OTBCSndibHZPYTZyeHpZVHF2Wi91cHBRajV1ZVpiSGg1bGo4M2lk?=
 =?utf-8?B?TnRIZm9lQXVqajl0Mi9saUtKU0tWVzdPTVhKT2JiSEJDeTRxUXIrY2VBeEVq?=
 =?utf-8?B?YWxnVG9NTlB1b1Q2QnpkYXovWm1LNmVHNDR0NUR1ZU45RGNLSlhhOEF1MEwv?=
 =?utf-8?B?ekFOOUxEbWFiaWZvQjI5RzZCK3RLL2xtcFZKQU9wdEM5cC9va3ZMNCtOeU5F?=
 =?utf-8?B?ME5FYVdzY29MZFJjMnh6TG9ORUtITmI1MnkrQlY2TFBNdGVsR2dxNjlFcmhj?=
 =?utf-8?B?OFRsaG4ySFJleExxb2xNckUra05jbGZEZ3VGZVBPejFjZUdPVHQzQ1UvbnhU?=
 =?utf-8?B?NTZDSXdjbTlKaGVxcFJnZHJMVnlPUzNYSzJmaFAya2o4RDJxZ3BUMHkrdk51?=
 =?utf-8?B?Y0xjZlZCVzJPWFhRM0Z1VzIrSTFZenlHT2xLUkZwaDVrTUE0SG9kc2JlVU82?=
 =?utf-8?B?WVFYRW5VQnBuM29Fdjd0b2JuSDMvMUJnMmVtMzdJRXVhOW9USm1iRjVtaTVZ?=
 =?utf-8?B?YXF6M3BlRDFIZGdCWGF2VkNMYlRqTDlXZDhLT3FGYTg2YjVDNTdKM2s3SGRM?=
 =?utf-8?B?OHJWU0UxSEo0aGxueUI0NDlxWElxMmJVQmREMlloUGRFQ1Ntc0FqbmZNMlRR?=
 =?utf-8?B?VUZwTDl5bEZEcXBIbUI4RldrZlM1anVOejUwV0RsVjc1czlhYzVPdGpuY2dv?=
 =?utf-8?B?dXNkV1djSFF5ZU5uNU5qek5nNXZ1ZzBlek11VkM2SURhRWVRL255c1JMU3M2?=
 =?utf-8?B?cjZlM2hXaVd0eHRDN0JMcVpUMEQ2cHkrNmd6K0VQNG85eG1lTDhJR1FlL0pU?=
 =?utf-8?B?ODQzQjRaelVSTFhIYU1EejhKTFMyQTBmanJsY2RzaGtWUitIY0syVTJYclYw?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28250de0-cb7c-440d-e517-08de08fe0d69
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:37.5275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJVaB5aV4g67mZtgyu+jVHhZ4E/M84AyRnGi2IoLjhVVNRK/3E3qb5ymE/0mwbKGld4NRjLIa92djf4Ij3TMFptfupwhcmYiJknVXwZ2G8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

Migration data is queued in a per-GT ptr_ring to decouple the worker
responsible for handling the data transfer from the .read()/.write()
syscalls.
Add the data structures and handlers that will be used in future
commits.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 163 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 147 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  20 +++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  37 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
 9 files changed, 390 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 44df984278548..16a88e7599f6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -19,6 +19,7 @@
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
 
@@ -388,6 +389,8 @@ static bool pf_enter_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
 		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
 
@@ -399,6 +402,7 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_exit_vf_resume_wip(gt, vfid);
 
 		complete_all(&cs->done);
+		wake_up_all(wq);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index f8604b172963e..af5952f42fff1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
@@ -15,6 +16,17 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
 
+#define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
+#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
+
+static struct xe_gt_sriov_pf_migration *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return &gt->sriov.pf.vfs[vfid].migration;
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -382,6 +394,142 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is empty, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_produce() - Add migration data packet to migration ring
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ * @data: &struct xe_sriov_pf_migration_data packet
+ *
+ * If the ring is full, wait until there is space in the ring.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data)
+{
+	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	unsigned long timeout = XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT;
+	int ret;
+
+	xe_gt_assert(gt, data->tile == gt->tile->id);
+	xe_gt_assert(gt, data->gt == gt->info.id);
+
+	while (1) {
+		ret = ptr_ring_produce(&migration->ring, data);
+		if (ret == 0) {
+			wake_up_all(wq);
+			break;
+		}
+
+		if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
+			return -EINVAL;
+
+		ret = wait_event_interruptible_timeout(*wq,
+						       !ptr_ring_full(&migration->ring),
+						       timeout);
+		if (ret == 0)
+			return -ETIMEDOUT;
+
+		timeout = ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_consume() - Get migration data packet from migration ring
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * If the ring is empty, wait until there are new migration data packets to process.
+ *
+ * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
+ *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
+ *	   ERR_PTR value in case of error.
+ */
+struct xe_sriov_pf_migration_data *
+xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	unsigned long timeout = XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT;
+	struct xe_sriov_pf_migration_data *data;
+	int ret;
+
+	while (1) {
+		data = ptr_ring_consume(&migration->ring);
+		if (data) {
+			wake_up_all(wq);
+			break;
+		}
+
+		if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
+			return ERR_PTR(-ENODATA);
+
+		ret = wait_event_interruptible_timeout(*wq,
+					 !ptr_ring_empty(&migration->ring) ||
+					 !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid),
+					 timeout);
+		if (ret == 0)
+			return ERR_PTR(-ETIMEDOUT);
+
+		timeout = ret;
+	}
+
+	return data;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_consume_nowait() - Get migration data packet from migration ring
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * Similar to xe_gt_sriov_pf_migration_consume(), but doesn't wait until more data is available.
+ *
+ * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
+ *	   ERR_PTR(-EAGAIN) if ring is empty but migration data is expected,
+ *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
+ *	   ERR_PTR value in case of error.
+ */
+struct xe_sriov_pf_migration_data *
+xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	struct xe_sriov_pf_migration_data *data;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data) {
+		wake_up_all(wq);
+		return data;
+	}
+
+	if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
+		return ERR_PTR(-ENODATA);
+
+	return ERR_PTR(-EAGAIN);
+}
+
+static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
+{
+	struct xe_gt_sriov_pf_migration *migration = arg;
+
+	ptr_ring_cleanup(&migration->ring, NULL);
+}
+
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -393,6 +541,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, totalvfs;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
@@ -404,5 +553,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 0; n <= totalvfs; n++) {
+		struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, n);
+
+		err = ptr_ring_init(&migration->ring,
+				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
+		if (err)
+			return err;
+
+		err = drmm_add_action_or_reset(&xe->drm, pf_gt_migration_cleanup, migration);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 09faeae00ddbb..1e4dc46413823 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -9,11 +9,20 @@
 #include <linux/types.h>
 
 struct xe_gt;
+struct xe_sriov_pf_migration_data;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data);
+struct xe_sriov_pf_migration_data *
+xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid);
+struct xe_sriov_pf_migration_data *
+xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid);
+
 #ifdef CONFIG_DEBUG_FS
 ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
 						char __user *buf, size_t count, loff_t *pos);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index fdc5a31dd8989..8434689372082 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/mutex.h>
+#include <linux/ptr_ring.h>
 #include <linux/types.h>
 
 /**
@@ -27,9 +28,11 @@ struct xe_gt_sriov_state_snapshot {
 /**
  * struct xe_gt_sriov_pf_migration - GT-level data.
  *
- * Used by the PF driver to maintain non-VF specific per-GT data.
+ * Used by the PF driver to maintain per-VF migration data.
  */
 struct xe_gt_sriov_pf_migration {
+	/** @ring: queue containing VF save / restore migration data */
+	struct ptr_ring ring;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 9a856da379d39..fbb08f8030f7f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
 
 	/** @snapshot: snapshot of the VF state data */
 	struct xe_gt_sriov_state_snapshot snapshot;
+
+	/** @migration: */
+	struct xe_gt_sriov_pf_migration migration;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index cf6a210d5597a..347682f29a03c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -4,7 +4,35 @@
  */
 
 #include "xe_sriov.h"
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
+#include "xe_pm.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration;
+}
+
+/**
+ * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration
+ * @xe: the &struct xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: pointer to the migration waitqueue.
+ */
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
+{
+	return &pf_pick_migration(xe, vfid)->wq;
+}
 
 /**
  * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
@@ -35,9 +63,128 @@ static bool pf_check_migration_support(struct xe_device *xe)
  */
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
+	unsigned int n, totalvfs;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+	if (!xe_sriov_pf_migration_supported(xe))
+		return 0;
+
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
+
+		init_waitqueue_head(&migration->wq);
+	}
 
 	return 0;
 }
+
+static bool pf_migration_empty(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
+			return false;
+	}
+
+	return true;
+}
+
+static struct xe_sriov_pf_migration_data *
+pf_migration_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration_data *data;
+	struct xe_gt *gt;
+	u8 gt_id;
+	bool no_data = true;
+
+	for_each_gt(gt, xe, gt_id) {
+		data = xe_gt_sriov_pf_migration_ring_consume_nowait(gt, vfid);
+
+		if (!IS_ERR(data))
+			return data;
+		else if (PTR_ERR(data) == -EAGAIN)
+			no_data = false;
+	}
+
+	if (no_data)
+		return ERR_PTR(-ENODATA);
+
+	return ERR_PTR(-EAGAIN);
+}
+
+/**
+ * xe_sriov_pf_migration_consume() - Consume a SR-IOV VF migration data packet from the device
+ * @xe: the &struct xe_device
+ * @vfid: the VF identifier
+ *
+ * If there is no migration data to process, wait until more data is available.
+ *
+ * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
+ *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
+ *	   ERR_PTR value in case of error.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+struct xe_sriov_pf_migration_data *
+xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
+	unsigned long timeout = HZ * 5;
+	struct xe_sriov_pf_migration_data *data;
+	int ret;
+
+	if (!IS_SRIOV_PF(xe))
+		return ERR_PTR(-ENODEV);
+
+	while (1) {
+		data = pf_migration_consume(xe, vfid);
+		if (!IS_ERR(data) || PTR_ERR(data) != -EAGAIN)
+			goto out;
+
+		ret = wait_event_interruptible_timeout(migration->wq,
+						       !pf_migration_empty(xe, vfid),
+						       timeout);
+		if (ret == 0) {
+			xe_sriov_warn(xe, "VF%d Timed out waiting for migration data\n", vfid);
+			return ERR_PTR(-ETIMEDOUT);
+		}
+
+		timeout = ret;
+	}
+
+out:
+	return data;
+}
+
+/**
+ * xe_sriov_pf_migration_produce() - Produce a SR-IOV VF migration data packet for device to process
+ * @xe: the &struct xe_device
+ * @vfid: the VF identifier
+ * @data: VF migration data
+ *
+ * If the underlying data structure is full, wait until there is space.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
+				  struct xe_sriov_pf_migration_data *data)
+{
+	struct xe_gt *gt;
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	gt = xe_device_get_gt(xe, data->gt);
+	if (!gt || data->tile != gt->tile->id) {
+		xe_sriov_err_ratelimited(xe, "VF%d Unknown GT - tile_id:%d, gt_id:%d\n",
+					 vfid, data->tile, data->gt);
+		return -EINVAL;
+	}
+
+	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d3058b6682192..f2020ba19c2da 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -7,12 +7,18 @@
 #define _XE_SRIOV_PF_MIGRATION_H_
 
 #include <linux/types.h>
+#include <linux/wait.h>
 
 struct xe_device;
 
 #ifdef CONFIG_PCI_IOV
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+struct xe_sriov_pf_migration_data *
+xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
+				  struct xe_sriov_pf_migration_data *data);
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 #else
 static inline int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
@@ -22,6 +28,20 @@ static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)
 {
 	return false;
 }
+static inline struct xe_sriov_pf_migration_data *
+xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
+{
+	return ERR_PTR(-ENODEV);
+}
+static inline int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
+						struct xe_sriov_pf_migration_data *data)
+{
+	return -ENODEV;
+}
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index e69de29bb2d1d..80fdea32b884a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
+#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
+
+#include <linux/types.h>
+#include <linux/wait.h>
+
+struct xe_sriov_pf_migration_data {
+	struct xe_device *xe;
+	void *vaddr;
+	size_t remaining;
+	size_t hdr_remaining;
+	union {
+		struct xe_bo *bo;
+		void *buff;
+	};
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		u8 version;
+		u8 type;
+		u8 tile;
+		u8 gt;
+		u32 flags;
+		u64 offset;
+		u64 size;
+	);
+};
+
+struct xe_sriov_pf_migration {
+	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
+	wait_queue_head_t wq;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 2d2fcc0a2f258..b3ae21a5a0490 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_sriov_pf_migration_types.h"
 #include "xe_sriov_pf_service_types.h"
 
 /**
@@ -17,6 +18,8 @@
 struct xe_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_sriov_pf_service_version version;
+	/** @migration: migration data */
+	struct xe_sriov_pf_migration migration;
 };
 
 /**
-- 
2.50.1

