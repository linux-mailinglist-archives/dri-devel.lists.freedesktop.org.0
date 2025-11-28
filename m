Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6100C93029
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 20:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0610E10B;
	Fri, 28 Nov 2025 19:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsdtS/h0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30CD10E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764357784; x=1795893784;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=owAGzgyu/zZqQM7pOtIb5UAoP7pAfL+stPxVjAVnsss=;
 b=fsdtS/h0rezYit9bgtkOIBiHq8rgMjbLsTMTwPb+VIu64KiBLGAxHjsk
 QVJ8yRfgseJz2iFxediFFAldporxx7vy4yigF/OTd4gao/joM1y/VyuF8
 b5Cp+ScHXj1JhWzKI2CWIuilBgy9SDPgjgmukaFFT4VE22KxAL3hzkqX1
 XVqONbTs+Lg7g47KruPCLGyvUhypie6YZT4bMUf1Jx65cl9evVx+tXtsY
 iML8IdcU2jAj6eibfJ7T4Z1faWo7pgK0OXmO1gqOhkI4TToSoEB55bMxQ
 4Vu3brEboKA+ca0pqsjM1b5HUzjUtCv6HhImSQGYVUDD8DJjRfX7q0NTB A==;
X-CSE-ConnectionGUID: imflkfujSnuYupfrqFRgRg==
X-CSE-MsgGUID: IYn7f5XRS3iKduTTmPALKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66339413"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66339413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 11:23:04 -0800
X-CSE-ConnectionGUID: mQkoYqMbR+WYBE7Ahz0q4g==
X-CSE-MsgGUID: NN2JPuzsRwKzxBgg/W1cMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="193954854"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 11:23:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 11:23:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 11:23:02 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 11:23:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QE0PP6MJN3u4mRM6R8bH8RNvz3G5lE2H9ZvmGpbuycpcbm2+uoXkpsXzay4udnkt8u6tiYdxxLGoyUP20uXGFLc8ceG23ECwfDH8NobLE7Is5POEqRh7/s/tYEelsbvR4WtS8Md2nvTaYUVTOIBO37BVqPKxqTaOmTluY7bGs9J1eZf5ugcxOzFAAiCa0lDHA7152bHKoPC9Tc0d8p83Gh55QRitx7FZ+NWHrSbLolVQMBzEvVn5YG8aa2J+mP1ZMhcQAJNtUNQJT1ucdHOMGHc0Dbw/ElcfdYFO+igo9e+37NCoBJffLmSKKiofPj5GxnI4n2oaeIKHoj2H4My/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP5eSXdRUdvtyyYe4os+c7o1Nv/gx8+z9RHfB6Zd2gc=;
 b=wBccXtdz0M7yNFXjBp2RPieniAJFC8JzkVoXItuG4xjFdx/VB9NwyKrumkT9dt5S8mcn05zbPRZzdDNHlZI2EefL2W9/QZxc/Rz+zK1qWG0yHksWn2tWV9B6wd0LtmFbwu6lKal4uHh2jq/QjEE5T+Ea3Ke+fE9PK7jEx8Mu3sDZjMXHvPR5LLxCxw1pqKt6zgwMTXceQ+TBw+8ACMchkLb2cfIY9YCpqOHJM+oOEJTsoPXqCx6J8QzHIzxY1cqaVXmx4/9PMZJ4hEoz1Fufi/MSxPdWboWOYVGi10v+PQ/hDhtmcg+depw5is5hgeeA/hclmh8B0IPckGcxivvo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Fri, 28 Nov
 2025 19:23:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 19:23:00 +0000
Date: Fri, 28 Nov 2025 11:22:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>
CC: <linux-mm@kvack.org>, <balbirs@nvidia.com>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <david@redhat.com>, <ziy@nvidia.com>, <apopple@nvidia.com>,
 <lorenzo.stoakes@oracle.com>, <lyude@redhat.com>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <rcampbell@nvidia.com>,
 <mpenttil@redhat.com>, <jgg@nvidia.com>, <willy@infradead.org>
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical
 address space
Message-ID: <aSn2kXNG7X0UZJFW@lstrano-desk.jf.intel.com>
References: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7cf515-43dc-4a6f-cc68-08de2eb38b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTZucDM2bXFXdzRZQzlRSlQ1OE4zOUVFc1RnU2ppT0VSNlYvczA0TmpRNDdh?=
 =?utf-8?B?TVQvRUxCTDA1dEpuTGFhK0ZZYjc3TkJWZmZldkxUYTE4RWdRamFXWFFOcFRu?=
 =?utf-8?B?QjM5a2Zua3hwdFRCaStNeW9vWmJLVmZrL2ZiRVRPQkdMVDlNUm9MbFJvUHgw?=
 =?utf-8?B?L1AzK1dJWEJPM1J2bGtaS1BGc0VuS3dyektFQ2ZQTjRkVG12ZDU5MFNRNXMr?=
 =?utf-8?B?Q2N6dlFvV3cxQnBsWlJIckw1L2tIOFE1WS9XQm5QVlBUOURHMlNFcStJblg4?=
 =?utf-8?B?T0QyRkhKdlluVzI0bXFQVEhndFRSWDRlenJmZ2NsZHBrRDJ2VmFvUWNrTWgr?=
 =?utf-8?B?VjVTcm1BNFZKa0xqdC9XTDQzd0tEd2crRkFWUHhCN0ZRMHRoVE1kMWJRRHBG?=
 =?utf-8?B?L3Z3aDJUa1MyVjFDWFpZN3FSNG5acGlNQTJzalU1a2xaZmxRL1g1SzUzek1p?=
 =?utf-8?B?Y2lmaEhGa0c2aUtPMDhBOS8xM3hPbGp3SzdBeEFSaHJVaEhlQkkxdDhaM3RY?=
 =?utf-8?B?WWhRSjd4SDNOWFFmNXpLUEVqWjZMdGo4am0vZlFqMGx1VjhQMHl0Z3A5QkpP?=
 =?utf-8?B?cy85dWFDU2lBYlNQQktYcmhBejl0MzVQem16dW9jRlY5NUhUU0ROR0hkTUpP?=
 =?utf-8?B?Wi9pbmUvdVFxV0FEMTM4aXUvZ0ZLcVNiSkw3bHkxMTNFTno2R29XV3V1MnVE?=
 =?utf-8?B?bklURHFTdSs0aSt4TUxJbWdvSjUram44a09NaGlHaDJhWGQ3VjRmVVQ1Z3VB?=
 =?utf-8?B?NE1LV2RiZDI3bXZxcEVRU0RyaGUzU2puK3BFOEwzSUZNUGhDZkxiRDEyR1ll?=
 =?utf-8?B?UFNlUzNCRklhaXlSd1BsaGYrR0laN1hzN3N3dlB1SHIwem84UUtPSWRxZGtI?=
 =?utf-8?B?RmZ5cUVKSmFOWEdhQTJCTnVaOStQMjE5LzlvU2tMdm15bTc4aHVyQXNZaGl0?=
 =?utf-8?B?aEZlSS9zUlVwNnY0ajUvWnl6VTRjZkw2VEhMcjBqZzVISU5vY28xZEJRYVZR?=
 =?utf-8?B?VnlkaW92a3VyZnR2aXJ5c3NRK0xENFNodVBCUUJWeW1Tb04xTmRzdjFTOGYv?=
 =?utf-8?B?cjZTeEV0cjd6TENWRjRZL2NwSzlGM3U5ZitjVFB6Sy9CTTVyckxKZktHdW5Y?=
 =?utf-8?B?R0xmSDF5UHFZSVBkbjMwSXJRUmY1LzZwazJsbjY2R0RrbS9qMDJqNW5TN1px?=
 =?utf-8?B?Z2JCTHNROEZTbHVMTTRJcEFwYkxvc0NmbWs0TEViZGxWb3U1Zmk4VW9reXZz?=
 =?utf-8?B?eElMT1dlQnlVUXJoUWEzQnp0akVRUEpPSldoNk82cFBsZ1M2cFd3UXBmZjV2?=
 =?utf-8?B?ZlZkQThiOWtIaFBpMEludXBVdlR3cEIvUmU3YkFMSjZpNkR6OFJvNTJ5R0gy?=
 =?utf-8?B?WUltRVB2OWhYRndkaDVkNkVmbGtyWm5WWFZUU1hHYnRja2NNaURtVzlReVo4?=
 =?utf-8?B?bjRVaHNwN2dyTUJ6cFhsb3lMVVZUTHZNUE0xVjh1SGV6ZVVzYW9aam9OQkhO?=
 =?utf-8?B?SllUaVcvZGk3cm94L2xiQVdyVlI4WGJvWElzdXA5RisyRFJFcjBPY1lrRHc3?=
 =?utf-8?B?Vyt3RkVKNzJtQVZKR0RBek4wOWlOREs2emxJOThXUmJiOW4vc0U2UXplWnJ6?=
 =?utf-8?B?UTJ2aFdyaC9rOWxuS05HWGJxSEx5V3dBS1BKTTNTK3IzUHRVcHJXVWtaV1hy?=
 =?utf-8?B?d0E0dVJwZUlFV0xhZS9qVm1zZmxTWjZXb0VHaG5IdmZDd0dFdkQ0a2pTVzFt?=
 =?utf-8?B?dUtYL2FaSGg1WjZscExuQmx1UnA4NjVGWFRlYWJtQWpPcFk0WkFRWGQrY3hh?=
 =?utf-8?B?NSs5eDlLV2czQmg3OUJKQTd4ekZlSVIrTkhFRnh2ajlXOGFnNi9IVzRyTGlR?=
 =?utf-8?B?UzFTa3djTmtZSmVqT25wQU1xcldoY2QyS2krR2ZUYnV0aUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aldCZFVkdEdzb2FSVHRmeDhCdjZKVWpEbUd3ankxVk1IWlFqMlFCeXpNUW9F?=
 =?utf-8?B?SGZPS0NvWEZBY2s3a2dya25UdmZick5tN1BHd0NQOXhGTGZOOGIvMC8rWkp1?=
 =?utf-8?B?Um9XMXFYNS9RRC9pVUY4ZTdjOU92REFoSklQaTdTSWd4TVFyQWJZMVlMNFJu?=
 =?utf-8?B?VXcxM2lzYmJIaHBqaVdwVjNtcU1KOUF3dW9uS0dBM0Zad3czZ3FkWUxTMVdY?=
 =?utf-8?B?RXJnZDVkblVNVE9sTmVLZ1I5M29ncnlHZUp4c2dqaFY0em54RGt4cXIrVmZ4?=
 =?utf-8?B?bzBjUmlXSjNLcmt0ZHEvaURpeUNhZ3BMRGVlUExERUJXdlBhVTFIVTMyRm56?=
 =?utf-8?B?UStJdHlpREhvcWJPOHZ6Q1RrWGhXZm0xUjc0eUF6bkZDU2FWTzdHN0Z1ODF6?=
 =?utf-8?B?VDBrRnlzSTg1Vmpyc3lvcmI2Z1lGN0hqOWJDdkRJQkVIZnVOMzFYbWxBdGdx?=
 =?utf-8?B?ZmcwTEZVVW10M24rVndqZkVoMTFVdjl1RnVyRmg2Um13QlA5L1pLanRXeHFo?=
 =?utf-8?B?SjFVemI4OXdEbzNvaHpPV0ZVbkIycis1ZHgxWGlzSStOT0pUTzJlTm5KUFBv?=
 =?utf-8?B?MjA1RU9ScnhNT21UcDdUMHR3Y0tyaHQzYnFuN1FIWFBNUndJaEFYWjBmZEtn?=
 =?utf-8?B?N0I1enNCeC9DRUhhVjBPRXFxWXlDbUgvSFZYUW8vZ3R2MXBRMUxFT1plZWV4?=
 =?utf-8?B?SFhVdEw4L25HN1pwdkVmQUdIbTBZRkJXaE56LzBGNTlvbGlsYVpTUEVXUFpZ?=
 =?utf-8?B?VDlhQVlMUGNkWDBpQXk4R3ZPSVpNUFJpRXAzN0lYZHhwNjY0dnArbHJhcXBv?=
 =?utf-8?B?R1ZwWkx4UXNTM09ZWnZhQ2lDR2hPelV2aFl3eUpSQS9PTlZrMEo0a3l0SC9C?=
 =?utf-8?B?SkM5N2M4SFNZcFBUTmtOblhEUVczSHBCdG1iQTZWYnZpYlhpSlh3Z3NYckNa?=
 =?utf-8?B?eWxXWUxERXEvUlc3WFFJUzY4SERVY0JoK0VLS3MzNzA3Tzdvc3ZRQmcweWYy?=
 =?utf-8?B?NHRZZlovMmVIejh0UmRUUDcveVBtdDZvMkhQZHd6STlVU1RxbU1PRFd5SXJy?=
 =?utf-8?B?c0VVdDNsbTFSc2NtelZZRTFtT2NYVFpDTSt6THV1Mis1SlIrTVhjMVMxUkdt?=
 =?utf-8?B?NE1iQVAzbHdrem95Qk5xRVRIcGdjY0Qyb1E2RWVtTVRRZk1saG4zNzBOT2Rv?=
 =?utf-8?B?ZnlxQ3o4N3liV0ZGaWxUVjN5UGJJUEsyY3FDRFFUNVRNSS9TVThoRkIzMlFB?=
 =?utf-8?B?V3BtZHRndTF1NTNIUjF3dENQSUdxWHAwME5ZbDZ0T1NCZXRmM2hQRk81b0E0?=
 =?utf-8?B?NWZWd1Y3b3MrQnYyTnZaTzR5TlJ0TWRqMUhVVnExcS9zZVAxQm9HQ0tCdEk1?=
 =?utf-8?B?N05mYlZhTEFJMjNNVVo2Vm1qdmlGVkJLd0FXMlI2Q2pNbk1OQTQzY0hEdWRh?=
 =?utf-8?B?eHdSTUJRRUN3TkROWmwvbEhUUDRVdTlhQnRUTzVOVzJIMW12TFBvUlpxYTh1?=
 =?utf-8?B?bFNUZnBpVWNhQytWQWpwV3UyVzFSaWhQTG5UUU5aME55cUJiNHoyOEJWdWpx?=
 =?utf-8?B?Skc4UXF1V3lrK2wwa2I5bis2MXY4aksxUTI1TnJWM1VMNno1UFNvLzdmMFZj?=
 =?utf-8?B?WTlsM0tUTkJOVjMyREpROFVUc2NPS2ZKMWNoM0h4Nys4TEc4QXpXVUZXZ09x?=
 =?utf-8?B?ZWo5ZnIxMjBXdnhiUk1SU2REZVFwTXgxaUljZ0w1N0s5M01YNDcvNFQxT0hq?=
 =?utf-8?B?SXZkazhjTmhTSHUrMC96aDZETWx5WWxoSDgrMEhwMTdvVG5rZjZUZVRwbkhw?=
 =?utf-8?B?MmVsM1JNZzMxMUpLbkZ6ZVJjMDl6dVdHUmJjblF0VDRIMnVHKzlULzlyaHZs?=
 =?utf-8?B?bGFQbzBmSTVTTG5IRHdMb0Jsb1Y5YzltQUdtNHRUL241eVlIdEZmSldmVFM5?=
 =?utf-8?B?LzRaQVNjMTBIWHZtbTJVbEdwOU4xSFpKdlZJdlB2QXphQ2V0VzYzcitOdFR4?=
 =?utf-8?B?UGE0NmtrZy9tMGFvMjl5aDBhemZrcXRqd1loM096ejJZb2ZPalhWYU1vZTR4?=
 =?utf-8?B?OUJGeGdXOTJhbW1adnc5bi8vcWlsNGQyaVBFT3JkbWNzMUtkVGxuY01PMWtW?=
 =?utf-8?B?NlhQWFBYR2RIaGJXRnMyMWJIUllWeG5JU0NYVDBXeGkzcUpQZEg5YkNFMEI2?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7cf515-43dc-4a6f-cc68-08de2eb38b01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 19:23:00.0835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOMOKdU9wDdBxhtJ6Yo4pSdWfSSwMdOib+4E3BbLfMt9il93YdUjyCEpWrccu2rI2rC7rwRKQiXr5oKreNV28A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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

On Fri, Nov 28, 2025 at 03:41:40PM +1100, Jordan Niethe wrote:
> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.
> 
> Needing allocation of physical address space has some problems:
> 
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. This
>      has been observed to prevent device private from being initialized.  
> 
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64  - meaning the feature does not work there [0].
> 
> This RFC changes device private memory so that it does not require
> allocation of physical address space and these problems are avoided.
> Instead of using the physical address space, we introduce a "device
> private address space" and allocate from there.
> 
> A consequence of placing the device private pages outside of the
> physical address space is that they no longer have a PFN. However, it is
> still necessary to be able to look up a corresponding device private
> page from a device private PTE entry, which means that we still require
> some way to index into this device private address space. This leads to
> the idea of a device private PFN. This is like a PFN but instead of
> associating memory in the physical address space with a struct page, it
> associates device memory in the device private address space with a
> device private struct page.
> 
> The problem that then needs to be addressed is how to avoid confusing
> these device private PFNs with the regular PFNs. It is the inherent
> limited usage of the device private pages themselves which make this
> possible. A device private page is only used for userspace mappings, we
> do not need to be concerned with them being used within the mm more
> broadly. This means that the only way that the core kernel looks up
> these pages is via the page table, where their PTE already indicates if
> they refer to a device private page via their swap type, e.g.
> SWP_DEVICE_WRITE. We can use this information to determine if the PTE
> contains a normal PFN which should be looked up in the page map, or a
> device private PFN which should be looked up elsewhere.
> 
> This applies when we are creating PTE entries for device private pages -
> because they have their own type there are already must be handled
> separately, so it is a small step to convert them to a device private
> PFN now too.
> 
> The first part of the series updates callers where device private PFNs
> might now be encountered to track this extra state.
> 
> The last patch contains the bulk of the work where we change how we
> convert between device private pages to device private PFNs and then use
> a new interface for allocating device private pages without the need for
> reserving physical address space.
> 
> For the purposes of the RFC changes have been limited to test_hmm.c
> updates to the other drivers will be included in the next revision.
> 
> This would include updating existing users of memremap_pages() to use
> memremap_device_private_pagemap() instead to allocate device private
> pages. This also means they would no longer need to call
> request_free_mem_region().  An equivalent of devm_memremap_pages() will
> also be necessary.
> 
> Users of the migrate_vma() interface will also need to be updated to be
> aware these device private PFNs.
> 
> By removing the device private pages from the physical address space,
> this RFC also opens up the possibility to moving away from tracking
> device private memory using struct pages in the future. This is
> desirable as on systems with large amounts of memory these device
> private struct pages use a signifiant amount of memory and take a
> significant amount of time to initialize.

A couple things.

- I’m fairly certain that, briefly looking at this, it will break all
  upstream DRM drivers (AMDKFD, Nouveau, Xe / GPUSVM) that use device
  private pages. I looked into what I think conflicts with Xe / GPUSVM,
  and I believe the impact is fairly minor. I’m happy to help by pulling
  this code and fixing up our side.

- I’m fully on board with eventually moving to something that uses less
  memory than struct page, and I’m happy to coordinate on future changes.

- Before we start coordinating on this patch set, should we hold off until
  the 6.19 cycle, which includes 2M device pages from Balbir [1] (i.e.,
  rebase this series on top of 6.19 once it includes 2M pages)? I suspect
  that, given the scope of this series and Balbir’s, there will be some
  conflicts.

Matt

[1] https://patchwork.freedesktop.org/series/152798/

> 
> Testing:
> - selftests/mm/hmm-tests on an amd64 VM
> 
> [0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/
> 
> Jordan Niethe (6):
>   mm/hmm: Add flag to track device private PFNs
>   mm/migrate_device: Add migrate PFN flag to track device private PFNs
>   mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
>     device private PFNs
>   mm: Add a new swap type for migration entries with device private PFNs
>   mm/util: Add flag to track device private PFNs in page snapshots
>   mm: Remove device private pages from the physical address space
> 
>  Documentation/mm/hmm.rst |   9 +-
>  fs/proc/page.c           |   6 +-
>  include/linux/hmm.h      |   5 ++
>  include/linux/memremap.h |  25 +++++-
>  include/linux/migrate.h  |   5 ++
>  include/linux/mm.h       |   9 +-
>  include/linux/rmap.h     |  33 +++++++-
>  include/linux/swap.h     |   8 +-
>  include/linux/swapops.h  | 102 +++++++++++++++++++++--
>  lib/test_hmm.c           |  66 ++++++++-------
>  mm/debug.c               |   9 +-
>  mm/hmm.c                 |   2 +-
>  mm/memory.c              |   9 +-
>  mm/memremap.c            | 174 +++++++++++++++++++++++++++++----------
>  mm/migrate.c             |   6 +-
>  mm/migrate_device.c      |  44 ++++++----
>  mm/mm_init.c             |   8 +-
>  mm/mprotect.c            |  21 +++--
>  mm/page_vma_mapped.c     |  18 +++-
>  mm/pagewalk.c            |   2 +-
>  mm/rmap.c                |  68 ++++++++++-----
>  mm/util.c                |   8 +-
>  mm/vmscan.c              |   2 +-
>  23 files changed, 485 insertions(+), 154 deletions(-)
> 
> 
> base-commit: e1afacb68573c3cd0a3785c6b0508876cd3423bc
> -- 
> 2.34.1
> 
