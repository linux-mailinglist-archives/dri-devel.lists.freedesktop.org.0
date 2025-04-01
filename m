Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3EA77406
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718410E4EE;
	Tue,  1 Apr 2025 05:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1GEhdmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07EB10E4EA;
 Tue,  1 Apr 2025 05:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743486037; x=1775022037;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NnTQhiRqzGm17sjOKaQhIwzS8NO+v0/BlrGdGsS55NQ=;
 b=b1GEhdmxttSOa+R2rBcoDqViOElpU1ueOqzMOuO3YA45ha1OfU+6cp0F
 AscbQ3v2nVc0UHZTTL3E2lyOqzbei3j8RiOTFrtgHvh65UJH4O5kwd/v/
 6OlpO0NBPfGh6vfqsQGXqcKkwbxhACCpPsu8GXJTmoBl0fbVUPvNT2N4L
 03AJsnezpMIz3Ho/0rzkZtHPb6RTQ62794T83VnvjRdL9QUQqLxrWPQKm
 +9/igofxvT5oiX7bPUnAEl9t69TA6bY26p4O88GjZ0N6EVMINF8SVylMT
 eOdFghIptdArCqGpUTgJAKaRqIHCEMfo2kvW4P2/AnAH5WGyxKvwFAaPa A==;
X-CSE-ConnectionGUID: s3Q2FHRfSZKiFtO2yKCxzg==
X-CSE-MsgGUID: tlUGfzqlR8iGKKDuTUSCfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32390177"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="32390177"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:40:36 -0700
X-CSE-ConnectionGUID: rNbvihItRZmmC0OnePJe3g==
X-CSE-MsgGUID: BPaaKJvmQ22Jiq3pYi1kEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126041217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:35:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 22:35:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 22:35:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5PTINBuITFRujw85tTzXrjHOYrfG44H6hl3jL2N3sXWC/12F+Kx68E6jmgg12fncsElLbcj3N7yg3/M6shf4OLv1z7PmDV3042gVxhji5E1Ns4F4eQ+C6x/6VwFuPIrxJEp7FX5TIC6AWrDuL4a5UHMb7bj7H3fWaG3tzFOnrDao42KKxrgU1wIrTu04YFHDWvd7RDvISK6PF1LfnoYp8Xo9ajS+7bzzSGa9O0IZmzWzh+Vv6xGct3/KXYgRjLYYvqdV/grSocDgC2C7NUbUsOB6ONfJpunTJt+E491lBdsc4yBoA0XVBGEuSLNfw6jgVdw1hL6eD7JP4KJpQuiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5ACsjwFVvaCHUvzjoOR58NtKdFBVuzLhbv963OsZ7E=;
 b=Ed8XpO6S0b+Kcl8NrdGq9CbbguiAfFbvTnKxNPyL3cm4C+XuhMY+UlyEeayhKXzGjMjICAXUL5xM0wxKf1LnAnJ9KTb7eKYMn4oM7Eb7iL3DVpWb80/1PqZkubI5qzCABBmtmZ41a4UTxFA+KnBcGMdI/Zlh6EsBCML540n9q0ZhvYRn6OdxVcJ0E0a/aX6fT0fuzTlDA/86xanfPoMTLVd9HkgdoZ0a2LDLUt3wA5fGsyr6Te4yZZ5eK0xBPn91XiMOG9Nh6ba7ijeCtN/oLlc0iFWoH6HRUgfeQPsodIBDB72shyfYaHegditoubi/BGZeYh50eCvQrUjyebKsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 05:34:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:34:48 +0000
Message-ID: <13638c0a-7d2d-45a3-a110-5821096dee70@intel.com>
Date: Tue, 1 Apr 2025 11:04:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/i915/display: Compare the sharpness state
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-9-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-9-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8e8c48-4111-452b-ae12-08dd70deeaf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjM4MWtwaFdPeGdzME5sUFBhZUxEUXpma0pFdmpLUSsvNDJ4KzRkeTJmOStz?=
 =?utf-8?B?dlFWSHJRazVtVHFCNWRlYkVGQjJ2RHFHSCtvaHo5V2IvSHcwSmlnYmJCSTRJ?=
 =?utf-8?B?OWFHOWlFS2FBU1A5eWdJVjRrUStwWFNuWmYxcnJkak4zOE0zZDdYMlFERUJa?=
 =?utf-8?B?U2dWZ01sRnRtd05jblJYdFBEcTRDYTkzVVczWWprN0YzT3RhdmdZZDlla1Bx?=
 =?utf-8?B?MU96SEdkcWp5M3QyZi9yRzQ2YU53MzFkS1BYUmNtOExRdUVzYnM4ZFlWV0Vy?=
 =?utf-8?B?VERESCtmSjAwcUFYZjc5ajgvNTVBYVR0ZUphWGtXaUUzMmxIUU4wam1kaVUx?=
 =?utf-8?B?UGtKMTd1Z0d6alFOVE5wZi9VTDJkK2pTVEd4c0tHa1F2TzNlalpIK0Z6RGs4?=
 =?utf-8?B?cHlkMDF0UFZhMDd4V2JmN0xHMzlvNGMvRUd4cktvR2NtaEFkOVFRT2VaY1Iw?=
 =?utf-8?B?TVRYUHFjb255L0s3UTBqQkpXT2tWaFZ5UFVKeHh4S2lMakI4TnVlOXEyM1cw?=
 =?utf-8?B?L2dNdXFOVklXN0tWQUhBcEhaR3NyaHhyK0dzS29qY0lMbEk1bm94bXBua21I?=
 =?utf-8?B?dUllamErbFhvOFZXdjJSQjBBbUtReGNZbmNqSVM0WmhGRUlvQTBrdWtocHZm?=
 =?utf-8?B?N05mRHF5R1ZIN3E3dkV6RDYydG9QYlErbjRxR3l4c1l5M3NhVFRiTC9tSExr?=
 =?utf-8?B?OS8rVE1Bc0l4VkZkbjF3UVN4WjB4U1VqYXNFS1NrVGFZK2dOSnptRkFGWG5J?=
 =?utf-8?B?bXlVZnErTFpxUXgzODZlckNDbFNveDZ3Umhlb1Z2aVduYkg4UmdUUkRKSHpr?=
 =?utf-8?B?RkZJdnBVdFlTNmNVb21EalNXNDhvY08rbW8yY3E5eSsxSk9yTEVWdlp1cG1z?=
 =?utf-8?B?MHcxYnNqVTJUS3dlS0NPV3VKQmFUMW0rcHZvbm1PZmFzKzZRYXAyelRsZWho?=
 =?utf-8?B?ekwxbUlyeXFxTEJJUWgwa09rYTR1am93Wmw2M1lra2hBamJDUWcwbWdrODJB?=
 =?utf-8?B?R1dvM3grRzhoYlBVS0tGNUdvVXlnQTdMV1UzOVp3R1VLN2ZBKytGdFZBbldp?=
 =?utf-8?B?ME1Yd2kvdXpLSWlQdnlkYlh1Slk3NVVpdzVudXI2d29oVDRScWM5Ui8wMVVN?=
 =?utf-8?B?T0E1ejIwRG4xck9WQnhRSlFremZTbTlFZHRPdnVjOGEwRTdCcENmamVBWlZm?=
 =?utf-8?B?MjlVblI3WjlrNUt3ZGZ1aCtybktYSkZyQk5KZlFFeU9jaWJVNjNFQW5rdU5z?=
 =?utf-8?B?Q2pSbTY1K3FxdDdEa2hwWW11TUFtejc5NkkxVFcxc2NoSlFYU3pDQjVXMzBG?=
 =?utf-8?B?RXc4amRRYWZFK1pUL09mRkx5NCtnU3BUa2tuaC9Mb1pYZ0tyTnpxSUNjQlJT?=
 =?utf-8?B?RmMxbE4wRkg4MEtGd0RzdnFJVkFDY0s1KzloclB1K2VyQXZJTkkzM3gvbUEv?=
 =?utf-8?B?S09oNE1GUVVUcnRxMjA5OFY1K29DNEdqTjVwZ1FyMFhzYUhqUEtEWE53U0JN?=
 =?utf-8?B?bHhpN0d2ejh0SCtFZTNoZnh0NUlzY1Y1WFRGdW80aEFTRXVoZmFJRVVUUjNh?=
 =?utf-8?B?VWxmZnJXTHBEaG9ncUNTQ3piQjlVRHptTjJVWkdBTVl0eUFPbGhXTXlIVW1v?=
 =?utf-8?B?ZUhXai9BbWdXb2Q1MkM2TTVqbDl3NkRVblpHSG5OZUhwSzBhYm8zS0hST1Ux?=
 =?utf-8?B?NzNTeVpSZ1NqT0pBV25zMHB3YXRIZXV5VEgzakliQUV4RlpVOTV1MHZSVUJ0?=
 =?utf-8?B?TkRxdWx5MVkzNGJmYkdFTTNGNUlKTXk1SFZ4bnJMTnNacnBQakRGZ0dTOWxm?=
 =?utf-8?B?ei9KWkFvWjJFckJrelZ1WDNlRllNbHo5RU9vRVEwT0ZFdUhCaHBYQStVenBF?=
 =?utf-8?Q?Ae2VFSeGkRD+K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXBEbno2UEJ4WHdjMjQzZFM3bXQ2VEVaUzUyR1locGw0VHBzeHJyMGJYTGJs?=
 =?utf-8?B?N25pb3FuMVM1ZFE4ZlF0TG41aE9tMmhHU1ByQjBna3QyTzNvQU53U3RPWkdk?=
 =?utf-8?B?cGVNNm43Zm0wSVNtaVg3NXJFWTZxbStTSTAxdlVicVJ2VVN3TUpTR3dNZWxn?=
 =?utf-8?B?OUxYL2pXRndBRnBWMDFaZmN2aXJtWWlIUlo1MEtteFIyaWhueFJpUmRmSjda?=
 =?utf-8?B?ZHN6SUkrbXFKT1kwRDRWTkdzUXpDdkRBVXptMDdjK1dyY044a09hZHdBeHh4?=
 =?utf-8?B?TEdueEhBaUNNZVVGSkVxM1pyVzhOSHF4YzlJd2l5RU5Ub1U3c3dMajZIMTl3?=
 =?utf-8?B?eTNUeE5aVjR2VUs2dytXS1lVVGhnbTFpMDZSZ1RXeHk4b0hJM3pjQ0tKR1RN?=
 =?utf-8?B?SnQxb3hEYXBKMGdrMDNOU0c1eWhSOUFuaHl3cHpaNUQ5WGV6YTRlUjZHRDFX?=
 =?utf-8?B?VHBMOEo2cDFWYjlBMmtpRFBwcUxtaXJjMlpUSTh2cVRNUlBsN2hNVWpDZUtw?=
 =?utf-8?B?cXFhN3h1azdVZU55a2NVMlFrd1RvaWw0NDVGSHBlYnhwTU5malhHUWlDcnEr?=
 =?utf-8?B?SVB1RVBtR21vbDRzc3V1L2J3RWt5NFZLajU1K25Bc1JCeXNxMWV3Mlpjam04?=
 =?utf-8?B?S1lUSytmek1wbDhtYzJZZU9PdnNCK0F2SEJVWERYbGtkc0Q0ZjZ2bHEzSTZk?=
 =?utf-8?B?U3pCNnczSDhlRTJEaE9YUzRPbXZ1OGdqaXFKVGZQUDdlVkNjOHRyTXBJcVM2?=
 =?utf-8?B?Zk5CVDVBS2I4K3VWdkpCNGQybERyWjhmSnNoSmt2MGl3eThoQ3RMcDlaUHM0?=
 =?utf-8?B?d0MyeEFQTER3U2U5b1Q3MVlZVlp6alJwNEttYkZWVjZYNjFBQjQreDllTUUw?=
 =?utf-8?B?b2xUeER3TjB3dEpMN3gyMlo0T20xQ0xyc1Vvcm40dTVRQURVNHVnN24vdmpB?=
 =?utf-8?B?VHQwWFZyZ2RQZ2hqdXkrN0dCOHIyTzJFU2h2YlAwcm5VOGE2VTZjMnMvdTRO?=
 =?utf-8?B?NU8yRHN2RXAyU0pQUmY3bnhRNTlZTCtqN1F6Wng1V0dzZGx6TncxaHFjaUFZ?=
 =?utf-8?B?RkJCSXQ2R0RQVnRrUlRWaWl5Q3BHNjZnbWxwQlUrMHYvVTNyU2tlK0syczdE?=
 =?utf-8?B?RldBTmFidURVY3pSN29rSVJFN0wvNFdqUlNPNFVNWUdScFgyWnJkTUhGQTBP?=
 =?utf-8?B?SFkydWwzb0pNb3lvZVI3dUMra3BibWdhY1hSb01kOWR2MDJTNDlZSUdHQ0lM?=
 =?utf-8?B?VXVzYUhZdGRuNWEwc2pzSCthS0lFbmRFb2Z0WXlqZ0g2cFh2cFZwL0lUVFlQ?=
 =?utf-8?B?cVJ6Z0crUlFuNktpdHM0Q0phdnJKazNlZk1wQTNXTm93SmoxN0ZkeXZXWmw0?=
 =?utf-8?B?UUFLS2xrWURMWGZxbndDd2p4Z3lJV0RvVkpGRzA1YUgxZTRNZFBkbjh6UEo4?=
 =?utf-8?B?a2tvQ2hQZWpHYVBKMHIxOFprZVE5WGZzcXhxbDl1SjEyRVdTdVJReStXbkN0?=
 =?utf-8?B?eEJGVktpbHFZMlE0UUVmanM3eHlXY2xGRk44UUE1YjJmMjNjdUROcnNPMzRE?=
 =?utf-8?B?RFE1WnZLMTdHN3pKWFVlUmIxaGZNWkhOKzZrQ1Z1Y1BTbVlWMHZsNjU4OCtY?=
 =?utf-8?B?QmprdEtiS1VyR2ZqbEZRL1FJeThrTHZJb3Fmdm1iYURlRXUrQTZOLysvaVh2?=
 =?utf-8?B?aE5MWUJuWjJUTVJsNFBQL2Qwa1lpNklBdHNTeEoyM0xYangxVzU5NC9hdE15?=
 =?utf-8?B?WEtrdmlyTGFBcVh5V2dnUjNsQmEwMWNOWVNraksvYkE3d2czTitqcHMwOUJs?=
 =?utf-8?B?bXZubkRteXdJUjdyUklCOUNDek5mVllXcFBVN2F4cVpXUjY5VDNqTUo2enhR?=
 =?utf-8?B?M2lCOWVaSllvUUZNUlRqY3FYK3FFUENDY2hZSGhOT3lPYTRXcUtzSVpWd1l0?=
 =?utf-8?B?REdhYk52TDkzank4MkkrVFhldkt5bjdqcEkvSFZHMnc0NVNIQ2cvamhCdFRV?=
 =?utf-8?B?cmZOY2ZWS1pPaVJPVmEwK3B2Z1hMQzI4dyt1aGdlSXJiZTUvWmE2dHlzL2JM?=
 =?utf-8?B?M3FNM3R3UG4zQjM3ZS9iZERZZCtlWmNicDBYbGlqZWhrckg0WlhvV056NjY3?=
 =?utf-8?B?OFd3SCtKTWd4ZjZIWVFkcE1rNXRVK1BCdmZXVHBuajJGS1BCNjBIMFVpbXdI?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8e8c48-4111-452b-ae12-08dd70deeaf4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:34:48.4758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b7aCrvdFwVng2OwuEF3HCkjtS9t3NzZGp3ZzugDJ90PZMWRmGLEBC8nodjBeaYyzgs8f01C2JR+KEh57oN/o5iQmqA3Jh3cunJ+98dxXVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> Compare the sharpness win_size, strength and enable bits
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 4ffe738ad725..f807915e0fee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5276,6 +5276,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   
>   		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
>   		PIPE_CONF_CHECK_I(pixel_rate);
> +		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
> +		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
> +		PIPE_CONF_CHECK_I(hw.casf_params.strength);

This can be clubbed with Patch#10 where we compute, and get the config 
for CASF.


Regards,

Ankit

>   
>   		PIPE_CONF_CHECK_X(gamma_mode);
>   		if (display->platform.cherryview)
