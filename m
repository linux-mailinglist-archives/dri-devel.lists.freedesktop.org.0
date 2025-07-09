Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A271FAFEC73
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F4910E0BB;
	Wed,  9 Jul 2025 14:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCUePLAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9C010E0BB;
 Wed,  9 Jul 2025 14:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752072405; x=1783608405;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OpPoOf46yJdQKOReoPfuA1LG1FjtFggSveegKhbEgek=;
 b=QCUePLAFCr0LtVQB+8rszdNFpifNcFsVPz/r74omzhXapnxunNkFd8am
 41pHb5dZgJz4sFiOxgT1GVjtPyGNtxtUXkKkKL+l4ycdu/79GvO5vBtw1
 RIs4XJBYYCshOZpOMqSGJpIsx+lHnepriXSjYdy9CC3QEhzlcJO8j0Hzl
 rZX1lyyqOTVcxplansSd5DrFagOLBLe8AYXuKZCO12LiPQc/bJGgLWP+6
 ahcum9/4pACL0qekujvRf3UXitY7wq3zOlr6E6id0iUXo14mrWwGqQSQH
 EmonfqeHuO/sycJyGoECrgXyDwibxN/CtfGu9ijwawRBrqEiHgUW51ViS Q==;
X-CSE-ConnectionGUID: mdwkclmbSjuXjJ/wgtqqrw==
X-CSE-MsgGUID: es+L0sNlTDeMlKqUDuc1IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="41959844"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="41959844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 07:46:43 -0700
X-CSE-ConnectionGUID: yR0GJifqTIuBHRDKuW8bCA==
X-CSE-MsgGUID: 0o4i53UjRxGPn9hsE0R6Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161453869"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 07:46:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 07:46:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 07:46:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 07:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xX/bDmzaAzLrm04Xwhi/oYWrT2Z0nP8+rGQbvezWC+Pe3OwB1xT+Kb7K4TcpjMfq3Sc1L56YWeLU7Z4c0tI0hWU1hM6Xc+nDOazlzQ78d3oSRo1QydBWGgPrtMd+y74TOIvUOfN1iFHhqdpoUJ2TbHsPz/tc4r4dcDzMDCleLa7HfyADYChbY47J9cs47D//yf4Plug2Dm5v/QUu4MVbPCV0z7Vg9MYWNpiJKGDXubHaZKnXm4bghVFhiBIURapJ1ATXT/+IJn1vLi5kLGJM0dq0p4ZDsNus4KRWbSBE2EK69Ky4307SF05slHANJtlNUS0xZl4/qQhTiQjey6AVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8riE4UHb3jVP0Mo/bO8dyNnXGD2Xh7tUPH76XPvs41A=;
 b=byNFFUH31dIq2GWbrHLMsl/TL++WagBgyJIuWGDgRCkvcaQfS8kDhj6+vYcExWPEhAVmBnRZJ0iMRB2nSbCGcJjmBtxn9em0uaUY/VmCmXRlqBwGZ5ZujyUVCLzfP+msEMFpBX1ZBKBvgl0xeMQQzwElVTz7B2WxLV0M9HSP9Xr6f1WVASYyS1XJqXdW+Dw+aTeBKe55COJtAoGiqk6CjnPxgeg9g4cwhDhqls695OpyBrcMCJDTxWyiKYUIyIMGHqGwrc8bHVt3YR+y0TLMdldSLrr33gnxZyyxhi8tbRwZ2NJg77gNcf68Sy6cqIZnwzl3MgCSfTu/4B0KJ4E3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB9456.namprd11.prod.outlook.com (2603:10b6:8:290::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Wed, 9 Jul 2025 14:46:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 14:46:41 +0000
Message-ID: <dc62ee41-4b46-4a98-a200-055400108b5a@intel.com>
Date: Wed, 9 Jul 2025 20:16:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aG5xglf8BeGzleWM@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb9088f-8b26-4d84-b860-08ddbef76a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3VOcFZIdEYrZmlibXJ4aWxMOVA0TFo4dTdGaWRoNnZFK2xqQ1ZhcWNQanp4?=
 =?utf-8?B?Ulh5cFJvM3BTZS94aHRKL0RJcFcyTm1DVmRhaFRzWVlJb2JiZUV4ZlVmaHhi?=
 =?utf-8?B?enRWMzI4am8vUjVIMlFJTUo2MEFlTWlMSDl0amZEU0xoWGtSdGVJaEw0dUxu?=
 =?utf-8?B?RHRwUFl1M0Z1azA5NHhIVy85SVhON2xSZmVJaVNhc0lVbTgvNnA4bnBtNTVm?=
 =?utf-8?B?V2lWNnYrM2FVK0N5NnhjaGN6cEtnOTY2VHBmbXNDTDl5TG03dW9zVmozdTE0?=
 =?utf-8?B?Wm1PNFZodEpzRHFxdWVaUWhSZlpZb3NWS2pkNS9MOFgvaS9vUldCM3gzME16?=
 =?utf-8?B?aDdIRjJMRDdUYzhYcUF4U0RTblBhMlAraTRLVWRKTzJ2LzZFVjVHb1BVSEEv?=
 =?utf-8?B?WlRBc3lwQ2p1d3Q3VUZtNXNubktqTVJNK01IUHhTanVxMHJ3bWloUmE1eHdh?=
 =?utf-8?B?dWIzUFVsUnJzSVpKd0FNb0ZOZ0NaTjlUaU9wcDZZUHZFTk5UVmhzM0twcnJa?=
 =?utf-8?B?cU45Ym9qaitPRHo4aW1PT1dmS1EySjJiQlVxM21IODlOcE5yYnhreXNsakNr?=
 =?utf-8?B?cTg4b01EZkFXVGE1RCtZaHd2YUtsTVBac0pzZlJSS1NJTnRncVZDanBhbXJR?=
 =?utf-8?B?Z0FkZXVmOCt6UlBQYXlySC9ZZXJxdlBocjQ3eHg1dWhLMDFkY2Y0RUdZZFdR?=
 =?utf-8?B?SWs1ODNVUFpUR2wxNGhYbFgzU0hpV25ia3UySkh5a2hYUlJMaXhhdGhmMm5j?=
 =?utf-8?B?RzNtSW9RTzFxNlMyRVpyenFHaWllUVVPM2pRemdBb1M4UVdLekZRL3I0ZC9t?=
 =?utf-8?B?TitRUW52ckYveDZHZXVtZ2hiOVRseU9TQkdvSTFsMUtOc3F1WDdOek9yTFVH?=
 =?utf-8?B?OFRsZ09XQnUwZEJMYXZNSlVxQjVXOUQvanF1ZE5QajBRYlp4Uks4bmp5OURH?=
 =?utf-8?B?aFdoY0R4TDFnM3hDNXEwUnEyTnNSMS9uNG83N3JTdm1KK0xmVnJwK1J4cnNK?=
 =?utf-8?B?aTFFVElGanIwYXhvMDM1SVloZHJ2SWxYQTZ6Z2pyTWxNeGYwazlvb3MwV09G?=
 =?utf-8?B?eitOaHlMb0FCV0J4Tk10V0NKVjBtUldQMFRJN0hHVEpQV2ZkRjh3ZHBnVVYy?=
 =?utf-8?B?cVFuNTIxVnVjbmZZWFZNNkZibHMzSFNyZkhTbmhqYkFvK3hEbjRyNmhUbjV3?=
 =?utf-8?B?TzVHR05ZenZUUU5CMWFaMGJxK04rRDdja1FnRUROaEZ5OTNyekxaTEVJdHQ4?=
 =?utf-8?B?b3E0Z3ZnaTNXWGlPbXpkWm5zVnplQUhhRkd5a3RVY2FLMmRycUxKSnFFSmo4?=
 =?utf-8?B?eWNCdWk1RFpZbTA3U1o1YnJTWjRKVjRreVZHWjNKUnk5eTBudmVNRDJRYytK?=
 =?utf-8?B?MkpCRmVYTEhjSnF4citydTk1bDFhNmZKTW1WNVZpbkEveFozS2Y3SGpvY25U?=
 =?utf-8?B?UE1hd0xLcWJtL3JFQ3RIeWNjTjN4MmoxOXg2S1d3QVJ2bWxCSVZpNTBIS1BZ?=
 =?utf-8?B?TS9ORGhEM2I5c1A3OHZqaTdBOTlVWGNReXBKZlFsNnVmZ281N3p4M2FwRjNa?=
 =?utf-8?B?T1lNS3V1V0xpcE9KT2s5eGJhQXY2cWxOa3orYnNlcnpYZHN5bFBOVFNCVW1v?=
 =?utf-8?B?RXFQSWV0UW1xallZalV5cHNTejFCdzllNmFka2dWZVZTV0JpTWJWTFlzQTRo?=
 =?utf-8?B?TEdoaWFUdjNDT295VktFcFcxRzYxVzlpZWVTdjlVWU1PdFF5R3d5MWIzZUZK?=
 =?utf-8?B?T1JnczQ1bzlPUVF3V3B3aXhCTkpzaittb0lJa2JxWWxhMHM2d2tWbnVXVU8v?=
 =?utf-8?Q?/Po5m7Q8a5BXc/OZiXxoNN0lKIsSRrd1PcVV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1AyL0ZwTXl5eXJaRG5iWEU1SkFXWUN1MUZOOWNjWTdXemJnWXB6UzZRc0JW?=
 =?utf-8?B?QmlHdmN4WEhxWVY1R0NXek9udUFMMzlrRmxUaHJLWnF1MXdnMFM3S09jY1ZS?=
 =?utf-8?B?Z2ZoYnBWdXY2Y0pxZmJvcDI2ZWFCRElpaVlBQkl6bkZCeWN0UVFHK1k5dnRW?=
 =?utf-8?B?b1JvVTNVZUI2eE8zMlFhK0Vld3d5K0lPSzlFamNBL2xJZVQwWWV3ZllVVGtR?=
 =?utf-8?B?RVRLYVlhZU1xaTJ2eCtYQ0NLWDgwL0lFbGxJNVNTVnU3bUlVYnVDMFU1emZx?=
 =?utf-8?B?QjNhaXV2Njc5NVltYnN2THB1dGJpUnhSU05kK2VyMzJ2bytUNTdmR0VDQjlu?=
 =?utf-8?B?NmJDdm1wVXpsb2FqUVFLZHFBcGpZZ2dacUdzdk9kQU5tL3FibUF0bTg4OG5r?=
 =?utf-8?B?N2g4QlVMenNDckFSc1RhaUp1THZnU0Z0eVZYWU50VFJ6eG9JVHp3WDdpWDE0?=
 =?utf-8?B?KzRpWENkQVA3UURiUUx0L1lEVGtYNjltYWFXRUc0YmNxUGM0ZDFlZFJFckRJ?=
 =?utf-8?B?UVFnbjhrYkxlRFRLMWZhMHg4YWlzMkt3UndQdFVZK2hvcWlwd1FsM1dZdWxF?=
 =?utf-8?B?aG1ydUNEVXJuQzhaU1JGOVI5NGJjeTBaVXl1ZDN2L2EyTDc0c2dxcHI3ZnVX?=
 =?utf-8?B?VEIzY1JIbTl3cDF5YUdQenArVmhQZ0cwTWE0YXBwVE4vRFZ5SGhZM3l6UmFQ?=
 =?utf-8?B?SEJjNFBRaUl2Mm5wMzZpQ3NpS0d6YTBjOTdrblZ0LzdxQlhMRXZzL2ExTnBv?=
 =?utf-8?B?c0daeVdYRml0YlZpVTVGdUUzaVREcDhZcFZ1KzB0bGVRdTZQbFFhQjJkNHBN?=
 =?utf-8?B?WitleWJLUjNIOGIrVjRoM1M2U014UFJGSjkxNDA4L2k1MlBTeStTOXNlRG02?=
 =?utf-8?B?dS9McTRJVFFtVU9uZkVsSTJ6VXo1WXJMSmVWclRWRWNqc0dyc250aTJzc0Rx?=
 =?utf-8?B?UmVRYng0MFhOaWtpcXpxeDFmcUNLT3F4NlpOU2FLdEFlanRGU2F0UlI1TXZX?=
 =?utf-8?B?TFI4RzYvWXJOUE13Vzc4STdXaDMyZFlkWnVVR2pWTjAvVm4zazZ3RDJqODM0?=
 =?utf-8?B?Vy9rU2E1eC9QTjIwWWs4b01uMVlyVGlpSG1UNDVMNjdFY2dUeGR2di9OeW9T?=
 =?utf-8?B?SURWTWMxSURlUUx1V0NzUDgybUdyZ2RBdS9XME9oYUp2TzFTcW43V3NHUFdu?=
 =?utf-8?B?UUFybjdEMUFoWDk2NFg4TVF4NGc5a2JyVEpRaWdla25aWDFaNm1IeDErUCtv?=
 =?utf-8?B?ODVORmRIL1NML1BKZG8zbGFveFRxeGNZUWdSSVRBOVFrbkRwelcyWGo1OVRK?=
 =?utf-8?B?dzFic3NicWxIS0ZLeU1rV2RFM1g5dWJ0TFlxL3Jyc08vTEwwbXJhc053UWZi?=
 =?utf-8?B?Qmd4WnpxTitiUVJrb3dJdWtOaytjYXF3SVRvTnpWOGdNNW53RE1NaG1vZjV1?=
 =?utf-8?B?cm9taEE4eldyemlOMHk5UXpHbThhRW9ZMzZHRHE3OVdhTDV4b1BHTVdJNkph?=
 =?utf-8?B?Z3RqS2lHM0g1SVdxdXpHcDBiZ0U5YmMwTEttVEtpMVFxQ2dxd2o1dzZaMUcy?=
 =?utf-8?B?aVU5UnJmSVVHVWw5bGlLdnpaVTliNlVtRVUza0ErT1BvcGRmZ1U3ZzRGNVU1?=
 =?utf-8?B?Y0pRNFVUa0cyVjJvbUR6dkx0TUpMV2dsTlNDUlZUdHFScnpqOUNvNlJyNzQv?=
 =?utf-8?B?d2syc0ppdmVKdlcxS3dkU2ZJVUVsSWovZzd2c0xMRENZa3A3bDkvTlVHa1pa?=
 =?utf-8?B?dkhRR1NPUGRhZmExb2RtcXlFeWtlVmJzbjcwR3B6QlU1MWdGTXJFcWs1bnQ1?=
 =?utf-8?B?eUVWbi91di9iTGNVZ3pieE9mK29wZzBTdHBsQUpkd0UvNjh2S2hvUlNVS0tU?=
 =?utf-8?B?UndMOTY0ZjV6bHJNUk1nSnZkZlg5MXNORUN4K3FHUEpPZzBjSCt0L3B0YjlI?=
 =?utf-8?B?Y1p6VkF3bGgzcE1vZFNDQjZtVnMrVGdBQUp6QzBRMFRWdFZZYmJuL0dzMnNO?=
 =?utf-8?B?Zkdqb2hmeHZIVXRydE5NWWVDaEtQNmVPWlJneVNNODA5OVNQSVdScm5kYy9J?=
 =?utf-8?B?NVVYcnk4OWxyREllTlRmZzFqdUZoYXlHa3ZtZ3IzV0k5eFZmNk5VNXljVkZX?=
 =?utf-8?Q?l0WGxdYzLl2kxS7/0To9w7Kp+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb9088f-8b26-4d84-b860-08ddbef76a82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 14:46:41.1327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vr7SmOphyj13BAGxKnQFl1NlZSzV4aYhYsvE1TSgv/HgejoXI8DAr2BN+n8DbCMIkWf4un5HYix8WUYBSXezcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9456
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

Hi Sima

On 7/9/2025 7:11 PM, Simona Vetter wrote:
> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
>> Certain errors can cause the device to be wedged and may
>> require a vendor specific recovery method to restore normal
>> operation.
>>
>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>> must provide additional recovery documentation if this method
>> is used.
>>
>> v2: fix documentation (Raag)
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> I'm not really understanding what this is useful for, maybe concrete
> example in the form of driver code that uses this, and some tool or
> documentation steps that should be taken for recovery?

example and documentation for vendor specific recovery are part of the 
same series.
patchwork link: https://patchwork.freedesktop.org/series/149756/

fwupd tool will be using this. This was the initial PR raised.
It is yet to be updated to use 'vendor-specific'

PR: https://github.com/fwupd/fwupd/pull/8922

> 
> The issues I'm seeing here is that eventually we'll get different
> vendor-specific recovery steps, and maybe even on the same device, and
> that leads us to an enumeration issue. Since it's just a string and an
> enum I think it'd be better to just allocate a new one every time there's
> a new strange recovery method instead of this opaque approach.

It started as a specific macro and string but based on review comments 
it was changed to generic macro.

Thanks
Riana

> 
> Cheers, Sima
> 
>> ---
>>   Documentation/gpu/drm-uapi.rst | 9 +++++----
>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>   include/drm/drm_device.h       | 4 ++++
>>   3 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 263e5a97c080..c33070bdb347 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -421,10 +421,10 @@ Recovery
>>   Current implementation defines three recovery methods, out of which, drivers
>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>> -more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +more side-effects. If recovery method is specific to vendor
>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>> +specific documentation for further recovery steps. If driver is unsure about
>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +435,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    vendor-specific vendor specific recovery method
>>       unknown         consumer policy
>>       =============== ========================================
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index cdd591b11488..0ac723a46a91 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>   		return "rebind";
>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>   		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>> +		return "vendor-specific";
>>   	default:
>>   		return NULL;
>>   	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 08b3b2467c4c..08a087f149ff 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -26,10 +26,14 @@ struct pci_controller;
>>    * Recovery methods for wedged device in order of less to more side-effects.
>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>    * use any one, multiple (or'd) or none depending on their needs.
>> + *
>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>> + * details.
>>    */
>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>   
>>   /**
>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>> -- 
>> 2.47.1
>>
> 


