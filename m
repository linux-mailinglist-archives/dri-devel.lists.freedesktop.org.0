Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153CC69CCE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2910E4C1;
	Tue, 18 Nov 2025 14:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3F/w+ra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF3710E4B9;
 Tue, 18 Nov 2025 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763474680; x=1795010680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Ga8/PNx2wwT4GwlE0pcpw9JMeWkFAg8DK9tqlPswow=;
 b=S3F/w+raUNDZUohHILGvLozo1zsDCDLGzvoh3stmDweBfUypuQHEI1Fl
 COpMt2X3MM0wq0ppm1YyXfrt7ErPQ/vvEDXI0TrQ5tSHu8nkLk0bl++4c
 XP4GI94aoH431zSlsoaSUqMHviY8lgjAB9WueqPKhYVT98u7QXjor8TVR
 KN6mLpaVkGMu98mrE8lG/xdA+n3J9ZGlOlq+YvbKNHLlRVLeRocxHj3F8
 80O4WNNTC9UkyA3Lj+ButTztnbkGkyLhhLM3f8tqICNLYNOpfClj4936A
 LXblxFmkalDhcFIv1YXcCeEc1g/9VUD39LeI49xxRkdzTEc8fem4noPql w==;
X-CSE-ConnectionGUID: fRkJwZKnTIytOjdMeXQbaQ==
X-CSE-MsgGUID: /u03VAmBTPKc30+VPBje1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83122765"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83122765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:04:37 -0800
X-CSE-ConnectionGUID: x/+jUFP/Qc6UVerB2d1vvw==
X-CSE-MsgGUID: Q/hWs0xuTCiPg42jM4Q6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221668656"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:04:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 06:04:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 06:04:36 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 06:04:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrkCWWhMa4h1WduYyDiL3QD5o+vWeETNCiXoUJqvfLmQkRhomp60y/XIPuXo4QbPEAq5j/TbJAU9qNhwqeXDlkHYkiexUXS1iFl416qq/iMpl+q52kBcZrXJeGVrTugi/EBY6ooTzHy0TnF8R4EUqF8HCQvVS+r5+mfbGa2FA2KT6uaBCUjt+zSQ7tXjue0HHjxBjczBmDtwTguHKIniMjGAjrs4XDeAxRiBLBYBCMEHp0BGrVAzc0TZIJFZdrk/CfkvySytUVanl2TZQvQvsSYHyo6g/AFrjPxYP4bex1XPA13KxfQItKcGCxiqmRi41A7vfpzYijzpR6Vp2MMJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zMBomfMQuEiqieXzi0bGZldMy85BEFiix4lrijQVrM=;
 b=M2r9e2lyOHau+4P+2SBTqtOZgRFsdUU7Yd4sQQWkilY/zvL8q6EUV2M5oHkuqsF7MHYA29QXTJzHX8yqVOYbEgCe5s5Nh1MXrrFEP8gO+cHbFnJ48pEflUAS3Qd4ejMH4ylrNSV1hcy96kwI+xPnKsWUIol3KUICMrcHRqBsHEWOKd7TZb0O+2Lj+lKxDv79uGFDh/fye6v2GlkDeiWI0yWyAmH+PTzv+39Lt9IvzdocnjE1angi/oT3kc/UCH5TuFKWHEga+41CL9tbcjjuKdTehGwrUbeybYzG+beZ1B/7nJa7kQbcMGxWVW+68cONXvuVCtTe2cXvJeSot1pASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA4PR11MB8890.namprd11.prod.outlook.com (2603:10b6:208:55d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:04:32 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 14:04:32 +0000
Date: Tue, 18 Nov 2025 15:04:23 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Defer signalling the request fence
Message-ID: <hhpgo4c4soikgw3krk2woekabgwzjizjvhblf4djhzkuqc5xgu@lysgbjy3tol3>
References: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
 <v2dqkfbcbypssudrwzdr6m7a3ns7iwynaw2ld7im3m7hau33o3@qtftkian2k2e>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <v2dqkfbcbypssudrwzdr6m7a3ns7iwynaw2ld7im3m7hau33o3@qtftkian2k2e>
X-ClientProxiedBy: BE1P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA4PR11MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2cba66-a15e-430e-b9d0-08de26ab65bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW9FWkNPZVFVUEY1MWpCdlJ6eU1QTHJhemt1RnRGQzlkaDdDb2gyZE5xM0tF?=
 =?utf-8?B?elRIamx1Wlp6Uys3RE5zZFQ2UStWeGdENXdWZkR3cDZaMzlHQjRUM1BNZ0Ni?=
 =?utf-8?B?dU9IcFZtNk5Pa1BIcGk1Ym1GcUNFL0JYcGwvQ0hFdjNSL1JrM3VUUGZ3RUlP?=
 =?utf-8?B?NGdOTkpUb3lwazJpQmlEZUJuMTdDaEMwcU4vdUlBZmRBNGp0ai9QOFpzckNH?=
 =?utf-8?B?SkdEc1dZd1Z3L3BhdlZTU3d4aG5zeUwwaVBoczFxd0Z5bVluSkJNVGpqQlVY?=
 =?utf-8?B?ci9YeHE2UEM5L1ltQ2NtL2pLVko1dk4rWUxvVzFnSGowblU5NGVUeUQrU3Nt?=
 =?utf-8?B?bCtaVnp3YzJqVmhaUm12SGlncEovRE5jYWJSOWxBWnYzS1pxcUVjMGkzUnN4?=
 =?utf-8?B?WTJsY1B3R0lFMDVNUlVxM01iYlByVHBQRkhDcXMxSEFGMGxDVFNabm5VOElR?=
 =?utf-8?B?dlBLY1ZtY0kwcjBoc1E5bVQzU0lhMUt2dVBicTVjMnNEVHZQN3U2K0FKaUpR?=
 =?utf-8?B?eit3UGtUTnZDMU5EY1JjdVlpZWlKQllMTERNRCtFOUJrNC9iR2lKaEdvWVB6?=
 =?utf-8?B?Q3FGdHE3Y2ppdHYxRkZ5bDBmS0RqaENlUXFURVE5L0lEczJhOTRybHBPZWV1?=
 =?utf-8?B?bC9qUzhpNDFaSmdvRCszQjNCelU5WVNuYjUrRStKNDdHY1ZtUkNmL0JkcDBj?=
 =?utf-8?B?MW9BcUk4K3Zybzlmd0FEU1VYdzJ3R0Zwd2RLWjRJMjBBdkdqOVRmSFFuSEwy?=
 =?utf-8?B?S3NEYVRDWTFoK2IxS0pnd2tmbi9MVkVKVm9IbVE2Tkh6VHA1UFVVZjJ1a2p6?=
 =?utf-8?B?SW1mclpJM1BIUVlMMWxSK3hvMDA3T280VytSVGQrYzdHRk5RaTMxSXdtOU0w?=
 =?utf-8?B?VTltVUFYZEdlUGJlb3BTTjBnSzNXVHlGeU5YaEw1NUtxSGkwWkgxQlZSS2hw?=
 =?utf-8?B?d1JldTNsSnpxQk1mODJvWm9EYytPWndPNlhaVWMvT09xdEg0bU0zUXJqL0JX?=
 =?utf-8?B?aW5UNGhuRE9lMm1tWlUwRVlGMXpIbFlVYUEvUmE1UzgwT2NWbGJjVlN3YkdF?=
 =?utf-8?B?UEZJT3U1L05wVlVPOXowTlYrazZKSVVGc0xNWFF2bkE5Y3pIZ2w1S3dmZmtN?=
 =?utf-8?B?VFU2LytlWGNaTngvRjBRZ2VlZGthZC9MelMzd3NqWUZNRnQvY05STVhPTzJB?=
 =?utf-8?B?K0psckZOdzI2QWM3d2QzZXBiWHljcWQ3cTBqSEV2dXVYTitBRFVxSWRYdkpH?=
 =?utf-8?B?bG9TYzRVbXJSSVVKbzh2bzMyVG9EajFzbkd2UW8wdkVrTFloWnlFZ3E0NkFV?=
 =?utf-8?B?dmxEZmN1RVpoSE9YaVpjRFdRUTBEeFV0MnFWNXBhY2o1NjBjbEJJdUlHZmVq?=
 =?utf-8?B?MzdjZnpNdy9sdXlFd0lPdEp3ZmRQUFpCckdBVi9BZzAwaFRTZWFSM21scVFv?=
 =?utf-8?B?TzVCT0JNTUFSUzIvM3YzRk9RSlVyekVBdytLQ2U4T3E0cEk4cEJSWlVIMC9Q?=
 =?utf-8?B?bHdQaytURzZNaEpzTlRzeXRsMmNaelFGN3dsK08yNjZiZXN0bkh1UG9mNGYr?=
 =?utf-8?B?dUtoM2xoVnp4OHBrS3NQaVJ0RWJaTEhZUVFZdHp4NkVmaExpZ3RPSmtVL3ZU?=
 =?utf-8?B?MEdRbnFFSFBjcTNTcEFGS095NDVsemNvRXlXSTY3UXh1azhiUjBocU9qblBt?=
 =?utf-8?B?TWFwK1pqTXAwM1VYNkNWY2Q4QWp0OUt4WHNlOVVHK0h2MTF3YUlxN0phVWU2?=
 =?utf-8?B?ZmxJSFF4L0pxWktRUURjNFI4ZWszSWNmL2s5cFU1enV0M0xCbm8rdUZYdjJQ?=
 =?utf-8?B?cDE0K0NhUkFJSEVwRUduc1UzZ00wNTdsdW9nSmZJNHFoamZZZnlRdlc0Z2c2?=
 =?utf-8?B?K2E4TzZpMEc1UnV0L3VYTzA1d0VPV0J4aGNVZDk0a3J1enU2QW1YWVNyUGg2?=
 =?utf-8?Q?HAyTm6/x78dVuBEw+fIiU9OIq9Lg7/EC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzlwdFRTMmZGQzVZRzVmZUlqcURrR1F2Ty80bFhrRzlCN2I4Z1AxYW1nZEo5?=
 =?utf-8?B?UjdNWHg2RjdDMnB4M2V1UGszT1lLSFRWYVZvazdyR1lKc1JJNW5TQjVISnli?=
 =?utf-8?B?a0Y0Tks2dk5rcU42bTR5K0M1R2xsVVhURThIZjkwZnd4b0hjT08yUDRUK1Rq?=
 =?utf-8?B?SHZYdGEyYlZRS0F6ODhEeEZrL2FtWVJwdWFyTWRqOVlUTUc0c1FONTNPMzhJ?=
 =?utf-8?B?blI1REt6Z283UDRYNjFrcVl0ZnNXVlhRWEZHNWh5ejZjTERuNE1HNjkwVTdm?=
 =?utf-8?B?OEkraWZWdzZ6Q2VmeWhQNUVIUUl3Ylp0UFBuVXFvbisyWEdDOTRzRlRuSFh2?=
 =?utf-8?B?Zngxc2FNVFBzN0dNZUEzb0dUamZIWDRxZ2FxRHIrK0gvY0t3WUVkbVN5YjMv?=
 =?utf-8?B?MmJhSmRsbkh2T3Rkd1dkbHVqNEVKSkNMSzRNcm9BNTJJNDVBRU1ySkV4NW1I?=
 =?utf-8?B?eDZRSDB2dEZrZmg0Q05GQTd5YlRidzdBTVBXZ3BpaEZKeWZ1cERhVmpPbG9P?=
 =?utf-8?B?anhNbFlKV3JLVlUyTkR2Tnd1MGJveThOR0NTSE5oekc4c0hOeVZybGg2VnFO?=
 =?utf-8?B?bWJGSHU4OHFFd3ZwQ21CaDRHbERlaHo1OVV6RC9HYTBCWHZVcTVJb1hhYUE3?=
 =?utf-8?B?QjhsR1hNcDhMWHBpQ3lIcTJIUkdsZklHb2FsWEkvMUVzWTFEZzM2Sk5seW5n?=
 =?utf-8?B?bWFZc0ZUTzh5M2xQTzNZVE5NRkQ0OGtRNENJeVRtblNsWHd3TUJNVHVLM21U?=
 =?utf-8?B?bTFXYlYrcGcydUo5T1RZcldJaGFGbzF0aVpkSFNiWW5BcU5YZ2JrZmFydHhp?=
 =?utf-8?B?Q1FRMHQrM1ZWekYzY0R6SkYvbDF5b0JTWDFLQm9IYmNuRTZ3clBneEF1WU1N?=
 =?utf-8?B?WkJtU0hBTk5WRFhaZ2ovQXRoeDZzZ0lNTEwvZDF4Z1hvWEhXL1J4eWxrZ1NQ?=
 =?utf-8?B?UmphVUlraDB5cG5JZkJSTlpKb3QweXJiYUZRWlRyby9MTlFBOFdHQVc0WlE2?=
 =?utf-8?B?NXhDSG5OOHdWWmJjQUVXSzVXbEcyK0I5VWd3S3piU29qdXo4a29nSGtxTitF?=
 =?utf-8?B?SGsydjZhMFZmZ1M0N213N2FIeTh1UUFHdU9LVE4wdG94SUtjRDdVOUluemZV?=
 =?utf-8?B?NVpQOWYvNEFhM1o0dWtUbkQwclc5dC9YV2ovcldWSVZxQ3VYR3NZdGRFUkdo?=
 =?utf-8?B?Nk0rRTdrZUlJZXJ1S1hXVVVQcTJmZCtBN2prZk4vbFRId3l6bTgyWmI5dEMy?=
 =?utf-8?B?TW1JM0tWMU1HT2M1VnB1a056WkorNGdmTGtKWXBLWFJaUHBKeXZ5TEVzNWxW?=
 =?utf-8?B?S1U1VjRWaHZXaUdLMnAvMHVPT0o1T3hrSkZ1YXV4OGVydW9YdHZWTDFocFBx?=
 =?utf-8?B?TGpEOHRrRktCczZSMXhzVE9qaFhrMlZEQ3lqUENHVjdKcVZTSjFVelh0cVZR?=
 =?utf-8?B?WkVrL3RkeDRsTjhVT3o2MTRaQnM5UFRpbGErU1ZNbGhOcjJGZ1M0VzlkZ0cw?=
 =?utf-8?B?UWxUOWtDeVprMEhSTWZ0bGw3SHNLeFZ2V1JDdGNSSnNnQ25hcWVUNkNZMnda?=
 =?utf-8?B?T1FsY0xQR0VLZGZ4ZzVCSCtoYzlLNmE1dzZqdUpjTnhwZUJKNWM4b0JicFpu?=
 =?utf-8?B?WkgwQklyYk0zWit5RDJlVDhNTTJrVG9nM3NFeWxIaGUyZm9FaHJiYmhKVXdG?=
 =?utf-8?B?MnJFNjdLbnRycGM4bU0zakQ2K2RZQUhoUE5hVVk1S0htT3hYMUZGMEdrc1lR?=
 =?utf-8?B?WWYzSlpBemk2M1JrMFF6cXQ4aXJRUFh2dlRLWDFJaTBnaGNCbzhVcTZoald6?=
 =?utf-8?B?L2JlMlBvdHA4RmkyTFVnUnVNVlZwTUNHZ0xGWGJGemNFeXlhN2VXWUdVbHQ3?=
 =?utf-8?B?MjZJSThFVnFGTHhaekxLTHRCY2szYm8rVHBKMGRqcnhvMlRRdUZUZkpGZUlK?=
 =?utf-8?B?eDJaamZTWWxjTUVMOWd5WmduVGFhTmxmWjA5NzRCRUhLbGZyOHo3Q0RKYklL?=
 =?utf-8?B?SnJoR0ZralVDR3UzcWNMK1I5V2MxYkJZenJ6cnloSEVqdlF2TlR5dkdub3N4?=
 =?utf-8?B?WU55MVZKbG8yMFgrVTBEZUhVM3JuKys3VHVJSUdxOVNibWlDcmtJengvMTJU?=
 =?utf-8?B?anBOazU0MllmWnh3RzZTcXFHNmRYWSt4dU9abEZNMExKK0toQkpPRjVla0tw?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2cba66-a15e-430e-b9d0-08de26ab65bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:04:32.4057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUcR1CEBLSmxzQ8c7e7LcRuS+vQ6VSckVwqkcGWNDau/Rj2IrMl0aT24peI1WqTq8B154slKx8ScUq82Sz8dt4PxA7JDCFviMK5jOm8kxA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8890
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

On 2025-11-18 at 14:23:36 GMT, Andi Shyti wrote:
> Hi Krzysztof,
> 
> ...
> 
> > +static struct i915_sw_fence *submit;
> > +static struct delayed_work __live_submit_work;
> > +
> > +static void __live_submit_work_handler(struct work_struct *work)
> > +{
> > +	i915_sw_fence_commit(submit);
> > +	heap_fence_put(submit);
> > +}
> > +
> >  static struct live_active *
> >  __live_active_setup(struct drm_i915_private *i915)
> >  {
> >  	struct intel_engine_cs *engine;
> > -	struct i915_sw_fence *submit;
> >  	struct live_active *active;
> >  	unsigned int count = 0;
> >  	int err = 0;
> >  
> > +	INIT_DELAYED_WORK(&__live_submit_work, __live_submit_work_handler);
> > +
> >  	active = __live_alloc(i915);
> >  	if (!active)
> >  		return ERR_PTR(-ENOMEM);
> > @@ -132,8 +142,7 @@ __live_active_setup(struct drm_i915_private *i915)
> >  	}
> >  
> >  out:
> > -	i915_sw_fence_commit(submit);
> > -	heap_fence_put(submit);
> > +	schedule_delayed_work(&__live_submit_work, msecs_to_jiffies(500));
> 
> Please do not do this: you are scheduling work and leaving it
> to run on its own. This can cause races with the global
> variables, and you may exit with work still pending.
> 

The tests sleep waiting for the active, which only ever gets retired
after the scheduled work runs (which is precisely the point of the
change), and the global variable isn't touched in the test between
issuing the delayed work and waiting for the active. So strictly
technically speaking there shouldn't be a race happening, if that's what
you're referring to here.

I can get behind explicitly waiting for the work to finish at the end of
the test, even if for the sake of discipline. (will a plain
flush_scheduled_work() suffice here?)

> You must at least wait for the work to finish before leaving the
> test.
> 

That would be the "at least", does that mean you have other suggestions
for this?

Thanks
Krzysztof

> Andi
> 
> >  	if (err) {
> >  		__live_put(active);
> >  		active = ERR_PTR(err);
> > -- 
> > 2.45.2
> > 
