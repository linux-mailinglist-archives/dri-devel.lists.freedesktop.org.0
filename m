Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49BAE61D9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 12:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E44B10E0BC;
	Tue, 24 Jun 2025 10:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/4kPZnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F9710E0BC;
 Tue, 24 Jun 2025 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750759996; x=1782295996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f2bmwj0XAzchfNauMSrPhP5q9mFKZTEcu87oLb0FWyc=;
 b=P/4kPZnJBvo5H0y5/IW7R0ihiqJ5wneeALof6NWppuOYdEuxAwOUi1ci
 fyUFIZd+KMriNTNbJZdD9rvcnwsUSMBEAu3X+7T0sPs0Ppk/UrDANZjIj
 VBTMC+Gnw6w4W2m0E2HxxvoQNhThFiT3I7PD530752lmttUOUsQ6aeLRu
 9naQJRIcZiJbC8V3o+Mlt599PF//6/8+KrY7W12482jIDsfKmHe33CMqV
 rKp/gl+K63iybNwBoQW4gtaRsafTFXjyURHBCYrtrfvfmYN/o5qSpK2SJ
 GO6zhy9zXoEjCIZhivdovsyzIp9JkEKzidWQXPLox+mAtI6ltREYZfFcN w==;
X-CSE-ConnectionGUID: 92A6U0z7TdOsH2C+WF/Zfg==
X-CSE-MsgGUID: 7wOSxic7R06W9h+K3HTpOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52714863"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52714863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 03:13:16 -0700
X-CSE-ConnectionGUID: MLJ4ptsxSF6yobN8ALzImw==
X-CSE-MsgGUID: Ps0PSn1kTgSXn0NBeyqq1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="152378203"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 03:13:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 03:13:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 03:13:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 03:13:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTAbS305r1y1NRBwBJ7vAh4t1IA9A2VUQYeFr7I12ZUCNc3ixGNIFlFUO+9KV9BDnbdAvy34S162sfqhszxft33zOqlP67gfQODzWIDrdeWJtxKKhKw+EF4woui3hNiUw4Vr6qSaTlb0msGMVIio5Krv6oqfuwRGVRogZ+GSX8TKMYS8hXt3IMfLLDO5zOY+UMGis3uNajtls49kNUJ4bWiv7klRsiPf/E1PQ3o39i/Fh+nVq+ntA4qlhJQlQXicoSiFuJSkKGy+Mwikz3LIAbDrevyHRfjvg5R9IfLKrQrNEGg3jtcC7D4caKQDNoR1Tp5b2of5yVm7GnMBqZ2eHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqiI8O7Vk6yXFxY+ilX8D1Fgu1MuHsFCzphxMV1EJg4=;
 b=ATvRyr92zQsbsAWljF/0KE29oYYFaA7ywQjb5G39jedOhPn7p8W2jJEjgKbQp/VE+v42tSTh8z/j0f0GpZBPVsmmp2Tu4s/0jEMuYKxv9410qgkJlB1R766UKv7Kldpv/pCkVqGepQZxe2JwS4s16LF/t43VGouooNFF0B8/Wjc3GxfXzTLnaOHNzQSXOe/7QX1ope0lnNhYCJDdlg6YBvkgGrHuqTd1dxiYvRbqyLhcT/j4LcD5fpDJ/pIpCXQd5ZQhGmLDWND6c00DdHgqPBKL11MIM0dyj5U8FavAmlgXEFd+vAtXSocyPEndjv1XbfOKHpbWK/+yKeK6c8TpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 10:12:59 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:12:59 +0000
Message-ID: <852276a6-def4-45ee-97ef-cce7cf565ca0@intel.com>
Date: Tue, 24 Jun 2025 15:42:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-9-badal.nilawar@intel.com>
 <b9a468c0-53ed-4da4-a044-76c5e8461b95@intel.com>
 <3fad6292-cbdb-4724-8e28-5315bb735d78@intel.com>
 <4b582be9-74e7-4175-8528-59f8e0bd120d@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <4b582be9-74e7-4175-8528-59f8e0bd120d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: 77fd180f-d3ba-4287-02b4-08ddb307b1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzJ1VzdUMXlBZ25kc2RvYXV2dUJIYkZ3N200OUxkUmNRYXlSOGNBNm5DMUxW?=
 =?utf-8?B?R3BBWnZyaCs4azhEVnpNdHozeTExUDZMUTBqMStCVlExTUpYZmNJVlMwc2pL?=
 =?utf-8?B?enUxU2xJYTVLWXpUWEg4S2E2RDBROVFJbkxMWjJkVGQ1eU1pWVpLMjVkdXd1?=
 =?utf-8?B?a3dvcndKc3J4cUZhZFNUdW5BNGwwUWxIUXJpWXE2aDA3L3hYZVlEL01SamdN?=
 =?utf-8?B?Z3dtTFRNN0U1RENvUjhEZXppK2tWUmJVMmMwSXNiRExwR1lBdFFQNnM3d2RU?=
 =?utf-8?B?cFBGeUhmTm1yZEVPQlQ3d3VZd0Nvcm5ZM1NySmFzb3RzVWJLTG1PYVQyd0JW?=
 =?utf-8?B?L2ZyYmFGeWFsa0FoV1hHMFY5NTVlR203NTJ5V1JjaUxJV3FvbmFKSVBHTUtZ?=
 =?utf-8?B?UU9PejRWMWRHYlhRdXAzc0d0Qy9VWFVhSDNoaTdTWlBZVU5PVjEyMEM5NXFF?=
 =?utf-8?B?cDQyZHIwZlBMZFp2ZjdQNVR3SmRlZDlFNEJZbWd0ZjhDdStiUFVHeGpCREMx?=
 =?utf-8?B?emxvVlp4U3A1NE1XMmpMdWhkZVl1UWRNTWNxNFo2aDZJTG93MlJndCtwTTlk?=
 =?utf-8?B?UkU3R094dEtvMms0S3VVQmMySEw5MEJXRE50RmFna3pUbndPMjl6L09iUDQ3?=
 =?utf-8?B?VmhNK2RKRDJZcmE2Zy9FaW5jUDBPc1p5dGJyc1hyRkRxZk5DZldUQXpZOVUv?=
 =?utf-8?B?SEYyNnFlLzRRakhGbW5nazFseG1EelI4SFIxQ0t5amUrZ3Z1TXZmYUF5eHQ3?=
 =?utf-8?B?YTJ5WUdNNk9CNzNlWWhQdzRwMXVHVkpkSjcwTUNlYWNQZVpqMU82QWNEOWlM?=
 =?utf-8?B?K1ZCaVVtckhEM1k1MXdvZENNY1orT216eVk0d3VzNXBaTXBIK3FZSy9ZbllK?=
 =?utf-8?B?Q1gvRmlxRGNId2cvempGK2QzRkt3d3FXdVFBNnJaL3pxb3duZERjdXc5SW1u?=
 =?utf-8?B?azArdkV0WFpvcnVTWXcyQzFLTHZkWmZubE5hR084QmRZNDFMUG93R21ZQ1N5?=
 =?utf-8?B?QXh0NGZsRVZ1cVZ5WXVHckFvU1kwWCtOQzNRVVdJazRPMStRSzFmS1N4U1M0?=
 =?utf-8?B?L2FEcllmOHAzcENnNFYwaFBmRnhqZkR4d1Y3NzZRTWZZN0FtdEdvKzRhV3B2?=
 =?utf-8?B?R0NKYXZhZzBtMVdlMGJFLzB1Q2x0TENWZS84UWJjWEtOWkZVejVnRnpsdCtJ?=
 =?utf-8?B?RTc4eTRvWlNXL0ZWSGR1WFV6SnBWRU1hL2RwVjBEb0d2SmdvNXlNOTZKRVd3?=
 =?utf-8?B?RFFLVVNQR3cwRnpBUHJxK2VPSUJRQ2daSXRTZ2crZGlnOWJKRkZuSWJDWXFZ?=
 =?utf-8?B?UnN3YTRZQmZUYy8wTXd0VHBESzlyU2xxMHV5MVRVR1RyYVJTRk9NNzg3aXhU?=
 =?utf-8?B?Y2JwamhzRC96cUVZajlBSlpvSzd6UldyN05KM2c4ZzE4RE5Wczh2UWtzamlJ?=
 =?utf-8?B?Y3l6andTMTMxWHBGVHRDNmduRFRvOHVobjVuTC9obTFCNGZ2SFBqbVNRSmFj?=
 =?utf-8?B?VklPODhScVhnay9HQm5WUUJIM09Sc3FYZVhFUlMwMnhEL2ZBSldJNTIzMEhv?=
 =?utf-8?B?MFoxcUtPWmI0b2l0UkdjMW9KVHlDM3hJelkzMjgwa25FQk01Q0Z6TmNwUWdF?=
 =?utf-8?B?ZERhSm5TeUtqM1JkNGswRnRYTG41cDlYZU11TTkzU0VEcHFCalBiazMySHNE?=
 =?utf-8?B?MTlPRTY2NWFoQjhlSXhieWxFLzNwbXg3cHl4VVBKUGJqWFhXeTlYTUExbUtQ?=
 =?utf-8?B?Wm04c3FyY01mNzRJN1hxekQrdW14YjVNTmJpUTZmSTkyalJaMGRXU0laZDNx?=
 =?utf-8?B?eWpEMkY1dUI1emFLQlQ3VEhjdGVEek5HdXY4K0pXYjRIcnFKTzZLRGlRdUdL?=
 =?utf-8?B?bm9UaDNOcU1NbVBiemR2SysyL1BPOXhtVjRPUVBsZjRQNTQ0MGNGWkR0Mk93?=
 =?utf-8?Q?5E/e+IdKS4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGZsRjE2YXdBQnZFL0xyL0xmazAwbmxVcG5KWklyNmZpeWJjYlVSTlIyUHdt?=
 =?utf-8?B?TDQ3MlhWQkd3NDBXdWkxY04wbkJhZUVHc3pOektsVmJYMU1vb1hrM0ZQUGxl?=
 =?utf-8?B?c25DUmd0Z2FvZ2pyWjY4bjlWVnpyeENiWmVwd3BPUU1TZTBPRUJRWHFSQWw5?=
 =?utf-8?B?KzRxRWJ6VXZValIvVzJLb3E2VENBTE9SbjZZQmI4WnNNYjFKVUtkQkdTK0hG?=
 =?utf-8?B?eW1QLytnbXF4Vk1HaWRXalBlakdHaG1ublZhcnN4VE5YYlMvbnBLSXNFSnJk?=
 =?utf-8?B?Q1MwNlhON2xDbzZUMzEzTDhXc0pLWXM5anY2M3oxNHNObmdYM29ibHZ2Q1hv?=
 =?utf-8?B?T0xqYnlRS3hLUW5oUkpWMkFQdDZ5Um92QjFMUm01aG1LdUF5d2hyMmxRdUtO?=
 =?utf-8?B?SDQwdkFrTGw3Vk11eWdwTWFSUEZjaWRZR3VFRStJSWhGNTBaUVdpVGx0YXNW?=
 =?utf-8?B?QkVvRGtuREl4ZkdIYUVBUHpoVTl5ZjBHRHUyQ3R2QUpNckdMcVVzb3F5VGt3?=
 =?utf-8?B?ditSd202QzRGT1EzK1AyVnZjTVVQN2ppUFJTYjhaZUFhTHd5TUpjS2JDV1Vv?=
 =?utf-8?B?SVFLa0M4YjhHejdEd1gvSDROMVpSekwwQ0NPNy8rS3ROUy9QaFc3Q1A2U3Q3?=
 =?utf-8?B?SXJ3eE9EYXh5aEh5TEFiallac3hVRkVoWVdZVFBRWGxmMTJpSmlDa25QaHVW?=
 =?utf-8?B?SVI0M1hWSFlWcFcwQWh0dnNCZHRZdU1nQWt4eE5ZVVRuWFZtY1I5cndiMGpH?=
 =?utf-8?B?NmtJNzBoMFB5MmFyMTJEaHg3dkIxZGU4OFRYZmVHTFRRMWJYWGtBdHltWjBK?=
 =?utf-8?B?MmJtdUZFOFUwRW9VSFYzeEc2aURoTmZ5L3lzbmZtQ0RaUVpXVFpRdUpPV2xX?=
 =?utf-8?B?N2V2VTFIUFUrWWVVem1ERVhNVEg0dnRZT1hRUXRmWFpqcTNPaHl3clZpbmx4?=
 =?utf-8?B?SFU3eHRYYkVOWGhrOWhOSnNJanlxbHEvSUhSaG84MXBpS0xVczRuYm1zUHlm?=
 =?utf-8?B?M3JlaWkzQm5XR2RYS0YrS0pTanpZY3lvY0dGZFBIRDVjQUl2ZkVyallIQWxU?=
 =?utf-8?B?UVNTTjYrREQ2aWtPYXFYVkcvWnovcGNhMTN6YWszblgvS0lCcTB2eUM2SGhY?=
 =?utf-8?B?bnkzQmtMQ3VYakc1QlBhSkVKNEtRbkJxTC9vUWh1WFBqVEdzcFZ0dXRONnZW?=
 =?utf-8?B?U003bFVhWEp2TXM1ek04YkMwNWl2bXBFaDZRaDg2SGVLZnhTemc1QzRXbW9l?=
 =?utf-8?B?RlczN1lxN2lHMXg1dFJGQUpHM2wrbjF6T21YdUFxbHI0V1crYk84WjNyQ2RR?=
 =?utf-8?B?WFhxdGpiT3F3U0JmNFJqckg2YXo3NkVSdWhhZWc3ZENtekRqRUVqSWFIYmd4?=
 =?utf-8?B?YldLSUdEdlp4WFl0M2owSHRCSGovRXh3TGd3QWlqR25zMVpOS2hqR0taWHJF?=
 =?utf-8?B?V3lTYy9yL2x1UlF5aUlXWkRZR0UxL2hmVkw3VjRKYVB3Nm9wY2t5dDZxakFh?=
 =?utf-8?B?c2VKb2hwL2w1eUFpUzFPQ0FrcnVFcW00Ynl2bTdlNzl0dnVhcEtSbkYvQk54?=
 =?utf-8?B?MlRIMmRPMnRZZHBjWE9kQnFQY2dOTnRuVTkyWk5zV1ZrWDd5VDVOYm9tWmZQ?=
 =?utf-8?B?eTF2alBEUGs1ZVg0M3hVQUEwOWtYS24wU2RFTk0wV2lkMmFHV1BxQVdSajZG?=
 =?utf-8?B?eHVSa0xkVGxKeVFUR0xUTkpBOTdGc2dhS28xWndIbW1GWCtDSzMxdDVZTjJw?=
 =?utf-8?B?UThpeHc2NlNTZlFib2RMcnhmUjEyQlR2SHlxbm1VRGtrNUhJT2tydTBNOUNm?=
 =?utf-8?B?ZXoyZGtQRzhNVUpEOUp2czlJcFNDeStvRG04a1NYRkc1d1JrOWp6R05GRmkv?=
 =?utf-8?B?MXkzVUhGS2N4S1A2VTdMaHRmUUJEOUFiLzdIaTFLaDVneVJnSTNxWGJGYXI5?=
 =?utf-8?B?eFBZM3daQlh3SGV3Q3FDVWc2R0JVRkxBTDFOTFg1Ky9wa0I2bnZjUUN1ZjZD?=
 =?utf-8?B?UHQ0aDEwTXFDYmdBQWpyT3RidlIrdzJSMFRNZCt1eXgydEZGcHYwc0ppdFpP?=
 =?utf-8?B?WjNYaXhNblY0d2tPYVprV1hQTVpabGFISTBmK3Yvc0JxV2FOd0N3U25PdHVJ?=
 =?utf-8?Q?ASCIezHgfqQJwOt2RJjiYVDte?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fd180f-d3ba-4287-02b4-08ddb307b1ca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:12:58.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gf7wkK18zp5x5F3rSF5JMESBJ+vjQFTydSsl3IYp9Qz8MIpmLMk4We95bbSXrnWGXsd3uDl7zL/MM0BfRKOkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
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


On 23-06-2025 21:07, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 11:51 PM, Nilawar, Badal wrote:
>>
>> On 19-06-2025 02:49, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>>>> Introduce a debug filesystem node to disable late binding fw reload
>>>> during the system or runtime resume. This is intended for situations
>>>> where the late binding fw needs to be loaded from user mode.
>>>
>>> You haven't replied to my question on the previous rev in regards to 
>>> the expected use-case here.
>>> Is this for testing only, or something an actual user might want to 
>>> do? If we only need this for testing, please specify so.
>>
>> Apologies for the oversight. Yes, this is only necessary for testing 
>> the binary before releasing it for up-streaming. There is internal
>> tool which uses IGSC lib to download the binary. To avoid clash 
>> between the binaries, this debug fs node is provided.
>>
>>>
>>> Also, what happens if we suspend with a user-loaded binary? 
>>> userspace doesn't have visibility to know that they have to re-load 
>>> their binary.
>>
>> If the device enters D3 cold state, the binary needs to be reloaded. 
>> However, the kernel mode driver (KMD) does not have control over 
>> binaries downloaded via the IGSC library.
>> If needed D3 cold can be disabled from BIOS or by setting up 
>> vram_threshold = 0.
>
> I'm confused. Whatever the tool writes is lost on d3cold entry, does 
> it make any difference to the tester if we revert to the default 
> values or to the kernel-loaded table? It's still not what they've 
> written. It sounds to me more like what you need is to block D3cold 
> (and potentially S2/S3) when the UMD tool is used so that the 
> userspace-provided table is not lost.
>
> Otherwise, we could add a modparam to override the binary like we have 
> for the other firmwares and test anything new that way.

In user space late binding flow xe kmd doesn't need to participate. In 
System suspend flow we will not know whether it will go to D3Cold or 
not, so we will simply reload the binary during resume. Meanwhile as 
discussed offline I will document that config will be lost on D3Cold entry.

Regards,
Badal

>
> Daniele
>
>>
>> Regards,
>> Badal
>>
>>> Daniele
>>>
>>>>
>>>> v2:
>>>>    -s/(uval == 1) ? true : false/!!uval/ (Daniele)
>>>>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_debugfs.c            | 41 
>>>> ++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
>>>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
>>>>   3 files changed, 47 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> index d83cd6ed3fa8..d1f6f556efa2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -226,6 +226,44 @@ static const struct file_operations 
>>>> atomic_svm_timeslice_ms_fops = {
>>>>       .write = atomic_svm_timeslice_ms_set,
>>>>   };
>>>>   +static ssize_t disable_late_binding_show(struct file *f, char 
>>>> __user *ubuf,
>>>> +                     size_t size, loff_t *pos)
>>>> +{
>>>> +    struct xe_device *xe = file_inode(f)->i_private;
>>>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>>>> +    char buf[32];
>>>> +    int len;
>>>> +
>>>> +    len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
>>>> +
>>>> +    return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>>> +}
>>>> +
>>>> +static ssize_t disable_late_binding_set(struct file *f, const char 
>>>> __user *ubuf,
>>>> +                    size_t size, loff_t *pos)
>>>> +{
>>>> +    struct xe_device *xe = file_inode(f)->i_private;
>>>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>>>> +    u32 uval;
>>>> +    ssize_t ret;
>>>> +
>>>> +    ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    if (uval > 1)
>>>> +        return -EINVAL;
>>>> +
>>>> +    late_bind->disable = !!uval;
>>>> +    return size;
>>>> +}
>>>> +
>>>> +static const struct file_operations disable_late_binding_fops = {
>>>> +    .owner = THIS_MODULE,
>>>> +    .read = disable_late_binding_show,
>>>> +    .write = disable_late_binding_set,
>>>> +};
>>>> +
>>>>   void xe_debugfs_register(struct xe_device *xe)
>>>>   {
>>>>       struct ttm_device *bdev = &xe->ttm;
>>>> @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>       debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>>>>                   &atomic_svm_timeslice_ms_fops);
>>>>   +    debugfs_create_file("disable_late_binding", 0600, root, xe,
>>>> +                &disable_late_binding_fops);
>>>> +
>>>>       for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; 
>>>> ++mem_type) {
>>>>           man = ttm_manager_type(bdev, mem_type);
>>>>   diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> index c0be9611c73b..001e526e569a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> @@ -129,6 +129,9 @@ int xe_late_bind_fw_load(struct xe_late_bind 
>>>> *late_bind)
>>>>       if (!late_bind->component_added)
>>>>           return -EINVAL;
>>>>   +    if (late_bind->disable)
>>>> +        return 0;
>>>> +
>>>>       for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>>>>           lbfw = &late_bind->late_bind_fw[fw_id];
>>>>           if (lbfw->valid)
>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>>>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>>> index d256f53d59e6..f79f0c0b2c4a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>>> @@ -71,6 +71,9 @@ struct xe_late_bind {
>>>>       struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>>>>       /** @late_bind.wq: workqueue to submit request to download 
>>>> late bind blob */
>>>>       struct workqueue_struct *wq;
>>>> +
>>>> +    /** @late_bind.disable to block late binding reload during pm 
>>>> resume flow*/
>>>> +    bool disable;
>>>>   };
>>>>     #endif
>>>
>
