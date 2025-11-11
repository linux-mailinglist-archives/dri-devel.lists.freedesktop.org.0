Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669EC4A2C5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBAB10E49F;
	Tue, 11 Nov 2025 01:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQclgQJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E310E4A2;
 Tue, 11 Nov 2025 01:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823126; x=1794359126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UjsbzOlDBoG9GxDqlXnBQ+RZcfcuWEleSP1JkcaufHE=;
 b=dQclgQJLpW/sK2cDx93IouKLPj9Slm8fnrMhagTDkrwP/FXK1g/GMDSt
 QKXpvm8D90gsBVBF9QwIuEqkBifI13mx242ujhQcCEZh/1XIf6/Hl2PFT
 ZTqnswIPR2mEeXUwtKwm3CfM4G5usjrmV72lNOZ0jmLRf+im/lq8tjl1+
 zA2e8+Cn2MEic951qs8f+8fvTWSA82w1h8fd+QwytbrzsqqC78SgQmH2C
 T0xT9iyq54eb4rGFflMKr+xUZyFiLJRohXavZwiJguZ0RTU5OpeIsNq2f
 salvXZwbY0yrouvh8xrqLh07s3NTfrgTeVLcXQdbEgO2SDqoGT/RR63K6 A==;
X-CSE-ConnectionGUID: ah8MLZaiRw66UlcT9vpuzg==
X-CSE-MsgGUID: 9rt9mXXjSJq3zL4sKPl5Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63883550"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="63883550"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:26 -0800
X-CSE-ConnectionGUID: 3M+UdRXrT9ql7hz/FRcFVA==
X-CSE-MsgGUID: wftyBsZZRGKr5EjLOu+MMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188081758"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSjtgV/g3LMOPSYmSb7dOQEiKh9VihvclzlGeqlsAjS22q1ACsWUQVEvngj3Gs++aS5soXe6VBIBj2/bdjtwaxUn5O+/LKN/HQ9c8hvDzM7nPDZ31t3ByWFJeaOow8Bj7AM2V9dVpjY2qUkHcwBai82PLPiCQrujxZYh+Wfqhx/RxdeqMYBZv9SVrsiOufmpmbfcEsx/VHo7yKPe5Raf5M9yj8T3L5Sn5FhB2Ql3NepvwQ641DeNeaWMe1fsohjFaHHt8PumGjlVl2pLCFc+XzZIt9MZU+UGYDuircl588fbn+3nBrdHyyRUTh25ow05q1amwCzLKJ+OUJcQtTbOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjzEH1sDsCnriHVSOqoOfbA6dNtug30ukoNSvrVcMi4=;
 b=xJmmx0KnXwSVkhPwK7X+e4+tTM0mIDIphtL0YaxVayCSYRSoodgDjyALKqhpG51TeP2iFQKJTr2wiIeiPt25JAdYqPMw5wsRci0jtTtUoRarXvUcNpCAlX3aAOYFu6OtLiQt0BKhKpMAscu8MDG+WTcn+e+CMbwSpRtMbd/Ev7avOtob2K8jJRq4QoCyYv3+pQAd/O6ALT0PhxmexS92qmqTpulIbsXXk80SxOhA4+nJcRC/TMRUHzZamCdKTaCvCWRrvdfLct3eyyC5/XVmaoyTy0aC1MaTcGRn8uPHUrQj7/mFOU8hYtQ3E6GnrQNe5ksCeyLru8Y0KlF19/Z02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH v5 03/28] drm/xe/pf: Convert control state to bitmap
Date: Tue, 11 Nov 2025 02:04:14 +0100
Message-ID: <20251111010439.347045-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4127e088-4e55-4644-db37-08de20be63a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdFMm5CL1lOMWtlQzRaRE1BNS9KMjRUcUhkOVdQVS9ibk11SDlQNEpqMTNh?=
 =?utf-8?B?N1Fkb3ZMWGFlWGwzQWY5cVhVOGdVMFFocVEwQVNQc3BKN1NSdTZqU3JtOSt6?=
 =?utf-8?B?blowQi96c3lhM1dLbVdoNlJoN1FUSFpta3o1NE03U2pnUnViampYcTBZY0k2?=
 =?utf-8?B?RjIyd2tpRXhXenVBaitranUrQmliQjVUVjhHZzJpMUp2MkdEUHc3QnJXdlIw?=
 =?utf-8?B?Uk11SklzbXRHRlJFOXdVaGtIejVWbHlJVWtRL1hYaXJGeGttWXJMcDVwZEdC?=
 =?utf-8?B?RVZKK2l5SWliL25uN1puSk9VelRZOVJVbTB3SytBY2tDVGZmaVpRSlI4bkRT?=
 =?utf-8?B?b2MxMVFiV0hObWROeC92bjRPRmNldytIZU1Xa3ZLcDJaSFU1NjV4NFg4cEE3?=
 =?utf-8?B?Z1Y2cXlaMGFTSzZVdjJmTXU1a2kydCt3ajlJOTM1YTFzRjcyZXB3Y0FwVHlV?=
 =?utf-8?B?ZmJNL1hLMHdDcE5DcDlKamlkSEpPU01YZ0R3T1RCcE1SUUdzb2ZRWjl5YjJa?=
 =?utf-8?B?aFRhTDd5MmRNWU40WEZEaFByWk5iVklUSDdXanlvTU4rUHkxUjJTcWsrRHNW?=
 =?utf-8?B?LytFbzBpd2hXbHBYVDFLTHVMd1Rhc0YwYzVtZElXa04ydTVzZit6c0cvZk5I?=
 =?utf-8?B?QjZCcWllUW0zSGFmOVRHRFFiRjJMZUpDeEwzdzIxUmpQeXJ6WGNscmNWamRn?=
 =?utf-8?B?Vkx5ekRaOVZjeGZ0L25hWlBDdnJVRVhBeXdKVHU4TVpPa0J2MUllYzFLanNG?=
 =?utf-8?B?SXpVTGxVREdDQm1CMEhYZjFubWY3L29uR3VtTEx4MmZOMldwQjJiZTMrN1Jo?=
 =?utf-8?B?dzlWZ28xWlR6UzFpeEJrOUJOM2R4UWx2ZklGRUJ2VUFWbUU2U2RXQzhqai9Q?=
 =?utf-8?B?TVY5UE1hM2FDb0RzaUpMeVNtYVdkTDZaZnl2M3F6S3B4OGJ0emFtcnkzTzV2?=
 =?utf-8?B?OW5CVmJ4dVZsNlB2QXBhcEwyT0pQT28yZzM4OVVSaUZ6NitKSTFrdVBVN0s2?=
 =?utf-8?B?cGZpQ2Rxa0YrREhxRDRUYWxpQ1YyK2Z0Z05abFh0aG5XVmdqazF2ZWRNd0lj?=
 =?utf-8?B?ZlJSN0ttVktoRVMyMHRteWt2N1FsVWJndnFzQ3EzTXdoZ0Q5dmFVUXAwRUMx?=
 =?utf-8?B?NCtDRWkzeFZEUE9YbURTaldyMUlFUnVYbEdFWHl2WDNQYUNlN0lQNEFPQ25O?=
 =?utf-8?B?TG1ORU14SHNCNGlmMlQ1cHFadjkraW9BR0Flek1YaThTL1RNU3ViVjFsVTd3?=
 =?utf-8?B?YTRSb3NyQndoK1RvTk9BZWZPY2w1SGN2ZnBEL1dRVkxUNE1yaHF3clpDOWc4?=
 =?utf-8?B?ZmhhcUx3bDhWRWhIWTIvcmhEMkpyaE15a3M3RmY3YW01NmJITkxCL3J4dzk5?=
 =?utf-8?B?ZmN4R1p5OHl0WXVoYUZZa0lmVUpBd2k2U250dVVibFZMaG5IeGJ2WndEbWFq?=
 =?utf-8?B?TTNaT3hxcVNXL3dXZWZrMlZSenlGanZJK09QbTFIQ29HRGNDekhLN3RVT1Vq?=
 =?utf-8?B?YnhReEZFN25NMHRXY0orV2dEVTc2Q0dBQTA5T0Y0T2hPSEJuNHBsbWcwVkZ4?=
 =?utf-8?B?QUdjWlBYWVZHY01ycmlENFVtK0gwdDZYbUVCZjNaUVF1OERERnRMU1BNblJU?=
 =?utf-8?B?SjRSY3U1d2NlZzFUbjRYTjZCUFg2bEJtYVpvRjdDU2VTTzQxQkh0NEhSNzFw?=
 =?utf-8?B?bHlBR1VHN2xSVml4aWE0QkZpbG1YUFZxYktHMnZJWWd3d3puSUxOZ2NhNmtC?=
 =?utf-8?B?VWpPNk0zek5oY1RqWWpObDBwdkJwT25qNU1lYkRuZW1ETzRFV3hXRzA5YUx0?=
 =?utf-8?B?UjM1SG5zT3d5ODZnUjBCTzEyVGl2blF2MDJTSTl2TEZDcnFmOVY3Wk5VaThx?=
 =?utf-8?B?M3BhQ3B5OCtFVnBveXVOM3M2T0lLQUFrcjRjdFpWcWxnNmQwcUJsUlYzeTR3?=
 =?utf-8?B?Uk43R0haakdCVjNoVC9oR1BVMER2N2c0VzJyekxsb3E0SkxOY3dUREN5U2Nx?=
 =?utf-8?B?OUNuY0laeU85WVVIcHZRZmlsSVJVU202SWJmaFZXRFR6V1MycDEwWDU4YWZN?=
 =?utf-8?Q?/ZNpZk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RzOFBVbXV5ek1JOXZuTSt4Smx1SE5McUFMd2pOcG11Y2d1WElQSzVncHc1?=
 =?utf-8?B?ODhvWTNQL2kyTVN6aEtsVzRuZHJ5OWpiUGxUTk9tdUJSRG5oaVI1Nkw0QmRy?=
 =?utf-8?B?a1JuWURDbUoxY21mTmJSNHhRQlVOU1FlcmNTenQ1b2pKbmkyWGhUQUZqV1NB?=
 =?utf-8?B?a3RWYWh1MW5VZE15M0FvZnZ3T0YwZkpxdXRYSWVnZWJjZEMxNTdmREtDcEgx?=
 =?utf-8?B?czlHaUQ4alJSNUlPeG1vUlZ3ckg2L1hNOXVrcVY5cFU4YWtvc0RPb0luQllj?=
 =?utf-8?B?NWpCWnpqdzNQT3R0d1dnQ2xOK3hpMTQ4VXBPQlZpS2k1YUlHMzhKN3FRdEhR?=
 =?utf-8?B?YUJrS21uWnNmdUxhZEg2NjZDK3Q2SXJqdHRqQmFXQitmSTJ3ZVFPUDY1ZUto?=
 =?utf-8?B?ZFVzMHdYZVBhOGJCajhPN2ZsbnM5T0ZTZE5qUzk5aVBBd2hlM1k0TXVUL1Bq?=
 =?utf-8?B?enV0SldFMHhOa0F5bHZ3WVZhRVpGVEhBdGhZSmJENmdhRzdCbEJDaXpkMWdz?=
 =?utf-8?B?WkorZk1WV3VCV2xyd1ZUNkdBelJ2U0VjR05RQVZaeXEzODI0cmJvWS9zMDZU?=
 =?utf-8?B?a09Fdk5rczFMeWQrMDBmRWVSYjlldlhTZy9henpXb1BLeW01ajJXRGNVYW9i?=
 =?utf-8?B?by82eWJoZ240bE1ZbEtocEZHZWxtdWltR0todnhJTkQ0amMzUjhhSy9URElx?=
 =?utf-8?B?dnB0aGN1c1JXZ2IydTZCUGFOMnpqRDhpOTJpVER6NFJwQkhsenpnbUVBTjlt?=
 =?utf-8?B?VFVweTlYcVo4WG9rWFFqWi82ZUR0QVRFV2QybGJvS0h2TlVjWS93QUI3eEZn?=
 =?utf-8?B?a0t0SjZuVk1sN21TQUxtcWpRbHJLVGsyL29WMjMyYjN3aTRPYm03UDNUK2xP?=
 =?utf-8?B?OXorOXNxM2xzTlFtaURuUk1mTWd6ZU82MDJJZDVtR2FMeVluTHBNU2pHL01a?=
 =?utf-8?B?V2k2U0RuN1VLTkpBRVVKank4dDBSRTlOMDlwQ2V3Q1lsR3g4bUZKajlZaDY4?=
 =?utf-8?B?L2ozS3NsbWh0TmZwN29kMUNzUzJpdklZVU1GejgxOEFJcytvampOQ1pDYTRF?=
 =?utf-8?B?OWFGcDV3bWNiNjQ4d2krc2l1YkRWeDVmWmJad1JvUEhzWXR0QmVnNjZCdFVm?=
 =?utf-8?B?TG9EaVJHbzBybkUrakNISTNqQkJ6b1JKYWt2alBEWE1sR2JYN2p1UFdPS0xs?=
 =?utf-8?B?dmdINHlieldtTnlRVk9BWUloRVVpVHZOS3ZZY1dta2NzZDd0TTB4dmYrM2ND?=
 =?utf-8?B?MitjNlNFNHBYV1E5MjlDMlgxTFpjc2MvMVBBR3JkVGxldkV4UXhJRldONzA4?=
 =?utf-8?B?TTBLai9rd05CeVZNeFFabGVKb1RFdTNYZGtZbHlkbm93enYxcFZmN29mUERP?=
 =?utf-8?B?S2kxZHRNekxWa2dNcnYxMTE1bWhoeFEwTW1adFVuSExPQ0FuRWt1T0VCMmRZ?=
 =?utf-8?B?cnZnNHdxWnVGZTNCZStRcHhiWXRqTTU2NXZBQXFNdGtVSHJaT2Q3ZkhJd2VI?=
 =?utf-8?B?WTczZDRZeE45dkVIakU5LzhmNnBEeFBHSWg0aytlbWNRNUtqdTlVTUNGWTB0?=
 =?utf-8?B?ekNwU3ZkTTNzQndtcEJPQmYvT1NLSGZleU9YRDZXaU1LZnNycWlUWFZBdWpO?=
 =?utf-8?B?S3FrbEd0TjFEN3ZpajdHcVZ0bHM4NTlUNjYzVUlBVDZlUVF1UThZRHlGTTli?=
 =?utf-8?B?SUV3WWVaM1BLM2FPYy9vaDkxOG1SZ3BQN0wvdFU4Rk9sYlNpZlFmMWpJc3Bq?=
 =?utf-8?B?NkZjb2xJRXh5MU94ZEo4QnlTSUNpMi95NStHcTFadC84enVUVGlyZXFXYmRF?=
 =?utf-8?B?UFppMEhTMU5qYzU1d1hNNzJYLzRjYkV5WWhyTDJXdDZWcGU5RGVNTlBhMGhL?=
 =?utf-8?B?VjJOQi9vR3ZBQ3IwOENOdnJ1ZkZoVGN5Qm9FRm81TmpIT1A1ZUNSV1RrYkRD?=
 =?utf-8?B?VXVvSXZTS0hJVFFuT0w0cTZxc2c1Tm1Cd1FCNFQzaDZGbjlzbzY2M0ZMeGNG?=
 =?utf-8?B?RXJaUjBZZFBUZ2RReDkydnV5SUp5QW16Z1IvN0dMSGhqdHkydzEvWWFjNXBJ?=
 =?utf-8?B?R21HckZTbTZzdU9ZSlFJa0M0Wi9nM2REclFVSXlxbTllemRsOXBubENqOFJs?=
 =?utf-8?B?akt5cHRVaXNVL2RVOU95MzZOQ25KYU5IYUJrdzY1dk94M3JnSFZmbVdaYjFD?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4127e088-4e55-4644-db37-08de20be63a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:22.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phwCrOxBTPY5QNU+8haSq9ab6V3wuY0H7nvo8BFUhyuEnp75aqq/C6Jev0/GpLmcfRVkG2/ASW0q8K308zulUmmYNoP1IHOyeKHP+eXZIm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

In upcoming changes, the number of states will increase as a result of
introducing SAVE and RESTORE states.
This means that using unsigned long as underlying storage won't work on
32-bit architectures, as we'll run out of bits.
Use bitmap instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 9de05db1f0905..8a2577fda4198 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -225,7 +225,7 @@ static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
 
-	return &cs->state;
+	return cs->state;
 }
 
 static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c80b7e77f1ad2..d9282eb259727 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -73,9 +73,11 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_STOP_FAILED,
 	XE_GT_SRIOV_STATE_STOPPED,
 
-	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
+	XE_GT_SRIOV_STATE_MISMATCH, /* always keep as last */
 };
 
+#define XE_GT_SRIOV_NUM_STATES (XE_GT_SRIOV_STATE_MISMATCH + 1)
+
 /**
  * struct xe_gt_sriov_control_state - GT-level per-VF control state.
  *
@@ -83,7 +85,7 @@ enum xe_gt_sriov_control_bits {
  */
 struct xe_gt_sriov_control_state {
 	/** @state: VF state bits */
-	unsigned long state;
+	DECLARE_BITMAP(state, XE_GT_SRIOV_NUM_STATES);
 
 	/** @done: completion of async operations */
 	struct completion done;
-- 
2.51.2

