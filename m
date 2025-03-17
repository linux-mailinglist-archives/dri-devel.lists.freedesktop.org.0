Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49812A64CB0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 12:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE1F10E3E8;
	Mon, 17 Mar 2025 11:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ab/dhB3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4010E3E7;
 Mon, 17 Mar 2025 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742211076; x=1773747076;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rbwRi2NJGh46Esfwl9xiWVByEw/pJPgp8+5TeKNf7XA=;
 b=ab/dhB3FVpO5u4lOss+dqauDeSjbQy/Nb4f0EQ/cYKDpxt2xicUvtk0z
 FViJHZC4NEv/pEG6EkuG3Ud7+gQKAjxVmJ0xSVCIRoDUEWcvM/XBVtwnP
 HJwrCGA+/dWKK4plyXljiJuzXGJi+4ejyKl1uN0w25JX9lq+X1s/60zPu
 dSDlhX75pMyBm34rpfnXVfW5sB/fWthP+D1qVzlHm9oksjehjzIWos2a4
 fIWxOxdQ8vWNP6zPrr/myvFrGMzpMIYd/NS/4jKwkis4Pg61j4s97MQKs
 vVqDy68CmN4wKLKBnjbpAlBZ1RDTOeUXl7dcvbGtxOJtu2H/hNc9PcPtp A==;
X-CSE-ConnectionGUID: +828i67tQSuFdaExqvMOvg==
X-CSE-MsgGUID: Aj2hVY7JTh2BObdDsmRVcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43404116"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43404116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:31:14 -0700
X-CSE-ConnectionGUID: MAMAAAXeQSuERY4soM0Ggg==
X-CSE-MsgGUID: dValQjU7TDGcJP4nr3srNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122422907"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:31:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 04:31:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 04:31:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 04:31:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4Z9dujpaKhg16XJNFwKfVZPWXg/AVsxxO3gb6gJfz+9Z1lj2QcQ2VGEf5ZtgkHMo9FaQPBO4Sv1CBRYFuv94xbB2n41B+odv05XsvD0Ufbt6anj5enH1unR01H9N+qulduaLctc+RVeAOpTXh89ix4ocjqOKG63moH7aFFnH8LTQo2Le1sN0VwmWT7uTqFYsFpHv2NRq9L4I+pXhLp8rAUCezvS5Bfk0N8efwXAqqB7ymkrKO3M2xHJl6wn/3lfcI6H52aAEoCveyU6SS/GtFV211o4YeWAuZ2uUtywBvVy69vmHfeXGNSYYx0h3aF2y8iwhEGyb/yTu84ccMF1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wY4Mqc0AxGEUHYRheSpHwnrbD+CFC33lNLG/1GtvYXA=;
 b=c6870xOR8ze8SLIgwlXFD80/tfyluIRTCoMjuM22FZ9oeXgc0NKupFJAfumhton2Oat/y2ET0X8Fx8TMSUeqmysXjZAEO8qz1CtdwxhIWUgwY7sP8vp1KprKD7qIzjSWrj9ZJ6mVhtJOpLBQo20xL9QF2BTm2SWFwd1eZQaPGhITqwe4Y2tN70ammeO+EOh5MelFYkkrjtb7J4h5GIw2/4ESMuNj3E0wjjrmzhxSKEQ4TamBbwMg5tLPemDw9BkQojwWzK83hUILyHwztqAapNehQQDmBRJs4x2t7vnOI1JZgKGfgENoIcAo5UQgLRCezJbXhJbr46SCbNNwqj0eiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:30:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:30:56 +0000
Date: Mon, 17 Mar 2025 12:30:52 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Message-ID: <2lsuqoxvc7kdt354gvkkefdlvo5qwxedoxxcf6ggghr32qqo6f@qgydm7seotnc>
References: <20250312225949.969716-1-michal.winiarski@intel.com>
 <20250312225949.969716-4-michal.winiarski@intel.com>
 <a4eaa28c-a080-949d-6ae3-8eae4ca24f40@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4eaa28c-a080-949d-6ae3-8eae4ca24f40@linux.intel.com>
X-ClientProxiedBy: VI1PR08CA0259.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: b80a1381-0959-47dc-2d58-08dd65472efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3Q3VUJRczVpRU41dzVISXFnOStEZE5VZVJzWTd5MllEbkhyVnZiNWFoeGJ1?=
 =?utf-8?B?cFZSZmRRenhHZUpXRFF2ekZ1RWxYbFZzOGVLV0o1MFlCVFUxOGJBK0RnNHJH?=
 =?utf-8?B?S2E3QkZGS2orem82RWV0RDJtMElyT2NmMjArRUJWQytnbmtQVUd1QjFrVVdH?=
 =?utf-8?B?TjVOS1F5U1NBL1JPcnNRa0JpNC81TXQ3NUp1L0VZWXQ5aEU0b2FyWi8yT09v?=
 =?utf-8?B?Z1JZZExVZWdsSEFiZkFIckJBRnk4di9WWkRWQ01LZEFoNjhNT2lwbm1xVWJh?=
 =?utf-8?B?NVZ4NWJxZ0pNNHFEd3hXOGsrLzRUWURxeGxWcjBJN003QnFXQkc3NjBWTnhY?=
 =?utf-8?B?QTg0bDBBRFhjcytaOGdmNkk0cmFJZmJCOXE4dTFJWVFkb1AvdDIwVy9kem0w?=
 =?utf-8?B?TWRUb1MzZkVKRU9xeVpTc1VSQnFkUjlwZHJjOC8rTmJzOTAvRjhiMkl3ZDZt?=
 =?utf-8?B?c3FOdVZrZ2R4dG5vVEE1Nng2OGttcEFJQ3VuOVAxaG9IbjNrSjBKUGZHL2VU?=
 =?utf-8?B?UjFtRDgvMGtjVWdZdXJXMFgwbUZjNkZGZmVQanJVZnhFTjZ0QUlOcmo2TEtR?=
 =?utf-8?B?T0d1RzRjSk5DMlBUb3JvdXNSQUQ5NXl4V2lCRkdzVUxob3IxRnhKbERJK25J?=
 =?utf-8?B?bDVMeERqVzBRbHk4dUVUWC9admFLbndmd1M3WDU5U1QyclJRcGhvNDhHNUYr?=
 =?utf-8?B?YkFhMldkR3kzQXBxakFKbFliWFM0dU9sR1RkekwreXhFTXVBc0JEMDhQenkv?=
 =?utf-8?B?TFg4dDR0eGdOQlhtb2p0ZlptNWtqZGxXZ251UDlUcDAxZmFzY0RZOWNHUTdk?=
 =?utf-8?B?dlloZFQvdW5CYytCdkdiU0FYNHJtK0EzTEJ5V1pDUVNuMEFTd1ZlaXA2U2Ji?=
 =?utf-8?B?eHlNWlFOTnN4MmVmNUNiRWpIYk9scVJ1QTM3SllDalNQdkdSalkvWUVURGMr?=
 =?utf-8?B?a3U3dDVHMGZIejl5czhSWkhHY3Q4TlgrZVJ3aUhPU1MrQXFHY0phSnl3ZDNR?=
 =?utf-8?B?clY5S3VjUjcwQkFLUDM0UDJzUExVSFdjb2xrVnpNaFRHRVdnaWRJb0F4TURS?=
 =?utf-8?B?NnJzcVBuZW5yMXNkeGJ5QmtGMlZINHhGNm44SnRZMkFVdmVwZUpXTEV0TnlF?=
 =?utf-8?B?SFErUkZOODkwR1hBbVdjT1lNWEJ6SEhoWnFmRU8wQ3dUc0k3aVdTVFlvUzVz?=
 =?utf-8?B?OUFPSzQ3dG9nQTdyWVJyWmV1N0xaNVBOaHVYekFXRjRISUIzeWMwVzI0Mmdy?=
 =?utf-8?B?VlBIK2YySXlGdThLdVB1NUM5QUlRM1IzVHR6WDZId0FKTFpkejJHdmViMThn?=
 =?utf-8?B?TkJ4UkhkajIxdmFHTjZRMXk4eXR1VHdHMm13a3JnVzJOcXhnS0NRTzN4RkNW?=
 =?utf-8?B?aW0rM21sZnZVZHNxMWhERzVsSTgvd1ZidDRsZ2JBS3VQNXdvK1lXU0dCQXU0?=
 =?utf-8?B?cnZMMXRKalNBVVVQVFloakliY2IybUdlb2F5TzlJbFJTUmRUZVM5TlRTczgr?=
 =?utf-8?B?aFg1V0k2ak5wOHpzZDkvR0ptL1VTYktVbmVNNnNFdWxEcFg2TGhCKzhVbTBi?=
 =?utf-8?B?MzVLd2N2ZWc4aHVLUUZGQ3VRbWJ5Ykd4YkZXdGh3SWt1MzIzN25DR3IzUGQ0?=
 =?utf-8?B?N0JSVktSL2FZRlpYQ1hTZkZxV3JRTWlZQ0RsMmw1c1hPK3NkNEozK1loR3Jr?=
 =?utf-8?B?NUR5QmtHZWJ2K2Y2Vk83UzlEN29kWDVlNEtTZmMwS2pFbGYxRCtmWXlSTzZF?=
 =?utf-8?B?SFhWdDNnSjh1TTBQb3M4Nnk5UXhZQ3FYV2d4THZObWozK0I3NEYxWnlIbWR2?=
 =?utf-8?B?TkR3R2hOQ3NtQlJ4UURyQ1p6bHhNQVJjb01BTFp2UFhWZ2JKTHZ2T0pLeWRl?=
 =?utf-8?Q?LbuTAYxiBQlS0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTI5WUZjV3lreWFQbjdUYzgzWjFtTDF5OEk3QzNRdmc1bWV1bmhkeUhQWHJZ?=
 =?utf-8?B?YjcvdjlGQVBkb2JpWWpZeERXRHU4SVAycTdremsybWU2dkZ5eW1Ya1BWT1FO?=
 =?utf-8?B?K2R2WHA4SW9EMkw5WUNkYnhUem5LM0prNDk0UWROUnVnbXIzclM2OTBHMThQ?=
 =?utf-8?B?MElDVDlKSkdmZEdIVkNTemtNcEFYSWZNQ2dvUG1TdGdQYklQSmUwWlc3MFNq?=
 =?utf-8?B?QUlLenJYbGp3K2lmQWxFeDhEV3RkM3oyR1VubUE1bGFaZnI4Ykg1V0pPaFg0?=
 =?utf-8?B?OUQ5eEphYjdoaHVOL3ptRHc0MUgrVnU2ZW1ERHJTV2NvejhpZzRzWDNkYUsw?=
 =?utf-8?B?RUV4OFN5NUhkVUwxSFpFOExLQlVIVG1GTnkxRHVwUEZ0a2h2QXo3SjJZTTJC?=
 =?utf-8?B?WFBCMEptcGMrQTd1QzlYQmJXS3Fad0JzanlISnFQcHg2UmxwV0dXZVVWY2N1?=
 =?utf-8?B?aDV2RktpSnZnOW12dkZmZGlsWG5ZVndtZHgvR0JKSk1DQTBDWEsvaWRQYVJB?=
 =?utf-8?B?eStHRHNqRk9UcmtuSmpqdk41VlFEcHkva01IS1NsV1kxY2NlVVFHZG1nb3hy?=
 =?utf-8?B?d21ycWx1NisrdStjeHpYZDJDTm1NbVFjOVFGbWsvN09nZmxtbU5RenIxYjRl?=
 =?utf-8?B?MU10aEFvWEhoVHlHSzRMYk5peS81ZEpoWWczM2kvTE1oV0RxbHRRUHRvNVdS?=
 =?utf-8?B?aWE4MlNsMnVHa204S2VXZ3JNS1dvQW5BcUJSM3pnMncrdll3ZnpkUXVuSmdG?=
 =?utf-8?B?RTBhTi80TS8yZlE4NCs0dkR3RnFqdlh6OUFWZE56TmhnK2Y0YWdGU3V1TE83?=
 =?utf-8?B?Um0zdnpCYk5Hcmo1dXpaZE01TERwZWw3KzQ2Q1pUeko4K0VsdzYxNjY0OXZ0?=
 =?utf-8?B?dkNZSkdDYm9VMVMrOTZKVk1EZEsvNGtNTmFUSnRHUXNobXU4SWtITFNtOTFh?=
 =?utf-8?B?TXU5dXBXMG1wR052cDNqTUdPdVlZbUpOT0dhWVBOaHMvYytzQVZ2cG1rMGhO?=
 =?utf-8?B?L3JXY3Rpdk9oR0RLanhGNkI0SVNvcDZEVkZhYmczM3FaNEdCZWJBTHFMbHAr?=
 =?utf-8?B?V3FTMU1rMVlNWkhqQVVrS0w1djFlejI5Y2xwNXRUUTIzNUZyRW1pS3BIN05M?=
 =?utf-8?B?WVhFZUtoMExydGJHT01UMTNqeEZzZnhTdXl2bFRjUThJZjNlWXBPeVpkVzF4?=
 =?utf-8?B?UVhWRzV3anIzME91MVJYdjAyYmxEajRIVlpMTGd4MzIyU1ZTbHlKd28xYU01?=
 =?utf-8?B?azB3dTRIbW9CM1RiNWxnRkdUQ0x6N24yS3BoU2ZDNUtEbk94bzF6T0wvNlNj?=
 =?utf-8?B?UHZEUmYrOTJ2YzRPS3oxYS8rRmVhWHlyeVBIS3NTRjU1NVpITHZIUkJkcC9m?=
 =?utf-8?B?Z2dPc3A5dW1aNEZmVXNxR1pYc09jT2FkTFNmM0pwTnBwRTBab0JZbldyUFJx?=
 =?utf-8?B?YXUwYUUxeWFaOTUzWVVodkVwQTNsNi9KMTZTTkV3V2hwREdHMG1IWm43Tzli?=
 =?utf-8?B?dUNQM2o2L2x5T1JuYkQrZ0dkOUFESlZvVXdiY0ZzUkpmNzJmT1NkaHhoNjN6?=
 =?utf-8?B?c0hUUlV2Q1ZZVjVOOCsvQ1NkUGpiVXF1RkNCd3JIcTM3b2hORERhanp4VjN4?=
 =?utf-8?B?ZXA5YWpTVXM0TmpVZTJsRlRLWmNGZnQzalRTRlROWTFmSCtUVWFDeUwzcm8v?=
 =?utf-8?B?MzIxTGJ6cHdoaGRnVGZxUkhmQktpa2Z0WFovNDU2NXpQejc0cXhnVW41dHN4?=
 =?utf-8?B?aFFXMzl6MnVyNHVKVUZrdVRpQTRacVprM3c2aWNUdjJlQUtuYi95Mk1GNWZP?=
 =?utf-8?B?bTdjUlROUFdzK3IyRzVvMUZEUENxN0YwUUR4S2c0aGRNNEpCSTYrcXptZjll?=
 =?utf-8?B?amRnSzIrMmhsV0d6OHc0ODJLZW5GdEgvNXNlcmtiMHgyZ2FscGtQcjE5TXdv?=
 =?utf-8?B?dWlOWFdlTVdoRzBVSTFUbFA4VmxjdzdlcU5hVFhaUDNXOFF6aTFHWWN0T0FX?=
 =?utf-8?B?RDdFR2IrUTExbnpad01iTnI0OC9rUEhpS2M5dG81Wnd2V1ArNmk0MU9lWFUw?=
 =?utf-8?B?Z3diZzgycm16cS9ybzhNNDkvcHdDR1NSOEhaUTN4NUExVVNNVmpLZXZveS83?=
 =?utf-8?B?dDczbTlmN1VkSFZqUjI1N0VOZ0xoblhVRFNGRUhDU29NQUdwQk13ZVB1N2F0?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b80a1381-0959-47dc-2d58-08dd65472efe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:30:56.3335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVXCivakAaI8FX01yXyqWdvZoU5tIerqTrHElV3JMY2pHaW0PhjzM5E8bsIaPBkzQdy6LA+uz5wg7IRpxFkLnMk55hAwnT60fxJ/qgXHbZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
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

On Thu, Mar 13, 2025 at 11:56:07AM +0200, Ilpo Järvinen wrote:
> On Wed, 12 Mar 2025, Michał Winiarski wrote:
> 
> > Similar to regular resizable BAR, VF BAR can also be resized.
> > 
> > The structures are very similar, which means we can reuse most of the
> > implementation.
> > 
> > Extend the pci_resize_resource() function to accept IOV resources.
> > 
> > See PCIe r4.0, sec 9.3.7.4.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c       | 21 +++++++++++++++++++++
> >  drivers/pci/pci.c       | 10 +++++++++-
> >  drivers/pci/pci.h       |  9 +++++++++
> >  drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
> >  4 files changed, 69 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index 23c741e9ede89..7cc17e898cea7 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
> >  }
> >  
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +			       resource_size_t size)
> > +{
> > +	if (!pci_resource_is_iov(resno)) {
> > +		pci_warn(dev, "%s is not an IOV resource\n",
> > +			 pci_resource_name(dev, resno));
> > +		return;
> > +	}
> > +
> > +	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
> > +}
> > +
> > +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	u16 cmd;
> > +
> > +	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
> > +
> > +	return cmd & PCI_SRIOV_CTRL_MSE;
> > +}
> > +
> >  static void pci_read_vf_config_common(struct pci_dev *virtfn)
> >  {
> >  	struct pci_dev *physfn = virtfn->physfn;
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 72ac91e359aaf..e6a986ad24d61 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -3731,8 +3731,16 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
> >  {
> >  	unsigned int pos, nbars, i;
> >  	u32 ctrl;
> > +	int cap;
> >  
> > -	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
> > +	if (pci_resource_is_iov(bar)) {
> > +		cap = PCI_EXT_CAP_ID_VF_REBAR;
> > +		bar = pci_resource_num_to_vf_bar(bar);
> > +	} else {
> > +		cap = PCI_EXT_CAP_ID_REBAR;
> > +	}
> 
> Use the cached values here.

Ok.

> 
> > +
> > +	pos = pci_find_ext_capability(pdev, cap);
> >  	if (!pos)
> >  		return -ENOTSUPP;
> >  
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index e3cd9b8f9b734..af41f6c24451f 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -655,6 +655,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
> >  resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
> >  void pci_restore_iov_state(struct pci_dev *dev);
> >  int pci_iov_bus_range(struct pci_bus *bus);
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +			       resource_size_t size);
> > +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
> >  static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> > @@ -688,6 +691,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
> >  {
> >  	return 0;
> >  }
> > +static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +					     resource_size_t size) { }
> > +static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	return false;
> > +}
> >  static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return false;
> > diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> > index c6657cdd06f67..6cce3e19f22b0 100644
> > --- a/drivers/pci/setup-res.c
> > +++ b/drivers/pci/setup-res.c
> > @@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int resno)
> >  }
> >  EXPORT_SYMBOL(pci_release_resource);
> >  
> > +static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
> > +						  int resno)
> > +{
> > +	u16 cmd;
> > +
> > +	if (pci_resource_is_iov(resno))
> > +		return pci_iov_is_memory_decoding_enabled(dev);
> > +
> > +	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > +
> > +	return cmd & PCI_COMMAND_MEMORY;
> > +}
> > +
> > +static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
> > +					 int size)
> > +{
> > +	resource_size_t res_size = pci_rebar_size_to_bytes(size);
> > +	struct resource *res = dev->resource + resno;
> 
> pci_resource_n()

Ok.

> 
> > +
> > +	if (!pci_resource_is_iov(resno)) {
> > +		resource_set_size(res, res_size);
> > +	} else {
> > +		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
> 
> Should this too be done in pci_iov_resource_set_size()? Why is it being 
> done here?

pci_iov_resource_set_size is all about individual VF BAR size, not
the reservation (which at this point in always sized as BAR size
multipled by total VFs).
In patch 5/6 the helper comes handy during resize of the individual VF
BAR size independent of the original MMIO reservation.

Thanks,
-Michał

> 
> > +		pci_iov_resource_set_size(dev, resno, res_size);
> > +	}
> > +}
> > +
> >  int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  {
> >  	struct resource *res = pci_resource_n(dev, resno);
> >  	struct pci_host_bridge *host;
> >  	int old, ret;
> >  	u32 sizes;
> > -	u16 cmd;
> >  
> >  	/* Check if we must preserve the firmware's resource assignment */
> >  	host = pci_find_host_bridge(dev->bus);
> > @@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  	if (!(res->flags & IORESOURCE_UNSET))
> >  		return -EBUSY;
> >  
> > -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -	if (cmd & PCI_COMMAND_MEMORY)
> > +	if (pci_resize_is_memory_decoding_enabled(dev, resno))
> >  		return -EBUSY;
> >  
> >  	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > @@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  	if (ret)
> >  		return ret;
> >  
> > -	resource_set_size(res, pci_rebar_size_to_bytes(size));
> > +	pci_resize_resource_set_size(dev, resno, size);
> >  
> >  	/* Check if the new config works by trying to assign everything. */
> >  	if (dev->bus->self) {
> > @@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  
> >  error_resize:
> >  	pci_rebar_set_size(dev, resno, old);
> > -	resource_set_size(res, pci_rebar_size_to_bytes(old));
> > +	pci_resize_resource_set_size(dev, resno, old);
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(pci_resize_resource);
> > 
> 
> -- 
>  i.

