Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9BC87ACC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70510E4E7;
	Wed, 26 Nov 2025 01:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yki7KB0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA5710E4E4;
 Wed, 26 Nov 2025 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764120022; x=1795656022;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fgllBegGExdNBxMlfQOOdecX9vWmR4IQXEaG5fcA+ew=;
 b=Yki7KB0pEAVEgo/IVgFNT9JQVcU+RhHpOFeTbhuZKLjTXXHooUoLCdqZ
 lvozaejcmJHRBEk88Sb35EBKFtvBSES9Tm7dXx9oh5stFGoFwdUrebNpb
 VvVKX65ScGKyjudyjSbpXQSzbvc4QVGCce1g9F+GHGfTRaUDyKYKV40BV
 1ZsQnO32psH/Dy9nixbT3IegB7PQyqSY0UuWIVzx6KLivv4Yx38THvcvY
 b7x3sTP7LpM8IoW7aCFSaGgVw6fMADB2IkXqsowqmf05fbM6OTy/1F+fD
 j8m/z+iTJC6hya0jtKv2oAZlXxMEPzza5nSuDAQUOqf04uVCaL1BbKCoT A==;
X-CSE-ConnectionGUID: KR23fKXMQLSpmb6ELvzSrQ==
X-CSE-MsgGUID: iAEpXEFXRu2x/Y3a4WEEKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83538769"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="83538769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 17:20:22 -0800
X-CSE-ConnectionGUID: XhK0Yf85RSS2bKo6RFeZtA==
X-CSE-MsgGUID: QZwevQVXTcqS2m/m+5XOpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="223494761"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 17:20:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 17:20:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 17:20:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 17:20:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvG5yysEM+NaihRYiqsNh12iLNpKLK/Edu1iOTLCDysEx0SOFZa0FMZhdMeOZ9wtALr7wDLR8E+5i7vx/dA/MONzkR9Pvi6rduesp6rpIe3Solu8hpW6f5AxbAqTrdu6aFy9hjhSysXJietJAgCmzq4glL2lrKwDbf0kIWsowqyhMyDZhEkLEJ/JEPAkan6hXYS1270pYAI2hWuKQMUtAvoxjCvrzqoUOdUV7ey7gC5dZODPlklYmyLVNjUID3xqjgWTUll6t6/uvy1lDexhEBcEtfJUYzrL++Y9IWjhKauEYWK9OcBd4E9E5cIHSf16HXEkUdkEWZmYi3Clc/MGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97U6fQ+9jZptYQ126EDCbd+Hsp6+/SEqH54bHAPMXQg=;
 b=gX7Wweo1GpwVlaZg6f9T+CkxlKgrpN/zx4OhjVoZYMRU3eM/BLR1YeT+NHobQ1DZKhM9Ol/XHdl4C+0r9lShDCDzGr6GdUaY6ySTt4KTSkyGkuT2Don8fA959puU1cNsCGkx1bsTjmmaGPUPblS04abHnJTAhQohDnR2dzSLoCLuS/vJcFf91s2onY/r2GJq75BX5bUe5L6ro6vzkP6fAUSJUJFxnH1sRjARfTFQ5djN/iPmU5w6NUlztjtxbFLWDC/dHes3W7RpuxkVSGkfWljFEbwGYSG7FRTU8JoymWNMGLERptaIbedKa9r4AcyZvIq6xTUeLO32J7WacI4ugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 01:20:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:20:13 +0000
Date: Tue, 25 Nov 2025 17:20:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alex Williamson <alex@shazbot.org>
CC: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v6 0/4] vfio/xe: Add driver variant for Xe VF migration
Message-ID: <aSZVybx3cgPw6HQh@lstrano-desk.jf.intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251125131315.60aa0614.alex@shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125131315.60aa0614.alex@shazbot.org>
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 947c4fa8-e80f-4ba7-2902-08de2c89f2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3MrUUNPdDN3RmNOc0dCeGVUK0ZmNG1NTHhXZWgxVkt6eDI3dnp6ZGc0Smpv?=
 =?utf-8?B?YjZ5ZXp3U1U2Y3VCV3h5QTBiUCtRcWp2aU5HS1FmZnFMN1NzbzN2N2txaXdN?=
 =?utf-8?B?UEg4MDQ0YVczcDZuMFRkaXNBaWRrWDF6RmxtcXNWQ3dBQXdXVFF4eUtBNFhY?=
 =?utf-8?B?a3VtRTIwZ3Eyb3d3WklkTXJSQUpFSlZpcHJUcHNYQ1dMU2lNbU44cjZBREx4?=
 =?utf-8?B?cGMzQXRscWdJUXlkdHdBdVhRK3BaOEhSOThuaFNIQjNiN05TdVljVm5uZ0pY?=
 =?utf-8?B?MXdIeG1sVDFJUzFkTGh4bWpVakIvWW9WNDVUWXNoaldJQi9VWXhlTThMT1ZL?=
 =?utf-8?B?VzRZLy9McmY4UlAydTBodmdKUGtDKytnU1FodlhIaXVNdytxQk9nR21Gb2J6?=
 =?utf-8?B?Y3U2R0NyWHJWNXk2eGRBQWpaUEU5UnhPWjVza2dKL29qQzFNUWpJZTI5WjNI?=
 =?utf-8?B?M0hra2FuVUhlaDFZWjArQnVCN09wV09yVit6QjZreXRlL1o0cGZuQzZlV3pV?=
 =?utf-8?B?NUo0THlyTzJ0dWhTRkZjUmRCc3BpbjZuSllKUWpEZWVRUkdXZDBDUVJjc2U4?=
 =?utf-8?B?cXBVVU5lNHRuS0xhaTYrNTJVdDliSVR3eno2bWxuVWlwM0hicWdrTURDL081?=
 =?utf-8?B?VHI5ZzN1WWpGYUZNOUFUQ0JJSTA4ZTduSlpjRUhzRWFtWmxIL3QwV3NFZCt0?=
 =?utf-8?B?ODJXWllCUzFKNi9lWEIwQVc4Qy9RY0ZoTTlwY2hEaFE0UE8zdXVQM1d6c1Rl?=
 =?utf-8?B?VXFsSnJTRlNCb1pkdXRtdEVkVzIyTGlIa2Z0ODFxdUErN1JkOStXUUZzRVUx?=
 =?utf-8?B?Tk1TTmM5d3lqR1kvODBNMmZOaU9pSGZTUFZxMHBZdXpoN3gvR2lGRitBM0lV?=
 =?utf-8?B?T0NyNWRNNHBzelVpeGVWOThYNWJuVWJCRTNRRDJuekR4ZzhxVW04WUw1SU5w?=
 =?utf-8?B?TTE0QWVVeEpTZmlIQk5aY1dGcUJBcHdRdDJBRUh3OU5wcEk5SDU3bWV3SWxn?=
 =?utf-8?B?SEtVMldXQTYxV1YvZ3NWN09OYW9UZFVYUVNZMFVvR0ZrRm1lTGlsT2sxZlhS?=
 =?utf-8?B?N25mL0Q3bktvV0tYQ01NWjRFdnd5Y1IvUlpWYitCU2s1V2lOb1lsWHRiejVL?=
 =?utf-8?B?V2dLSGtkVUtUVG9kbDl2VzRsUE9YWDhCVkRMeFVMeXh6WE4yNzg4SDFZd1Zj?=
 =?utf-8?B?WVNjZlZuZVZlMDhnVG00RkkrOFhlcjJPWjQyOTV6RDRQd1F2QU9mUUwyZ0s4?=
 =?utf-8?B?OTk3WGlRWWRIZE9zSTJTUE5TN1RMcnBFQVJ1R3Z4MDJuSzVKYUdQV0pQZUJj?=
 =?utf-8?B?Zlh1UDEwSnFIREplaklUUzFWcmdET24rQ3A2a1c3ck5WOUxtZ3A1WllvUnhJ?=
 =?utf-8?B?WXQ2dDFRZ0RGekNFZlRsaURZdGVyMFJ6MkFHRzMxYlB4R29pUHNhRm5tUy9L?=
 =?utf-8?B?Y1d0UHFhR0pnNThWbFBaaE5WRVRjMnduU2duS21lWHhSR3BVNDJjdzFqaUZC?=
 =?utf-8?B?RkdvbkpNYjhKWm8yRDNpODhqVlhrQ0ZJZXpjWW9Rb2JobDBjUDlibmZzNHRS?=
 =?utf-8?B?NHNnak5BV3FJcVlxWlJPS1RuYm5YRVFKak1OcU5JTndhL3pSSWVscWw1SVpE?=
 =?utf-8?B?LzEvU3BEQ3M3TlhqWXBtWjBNY1lqUHN1Rk51TTYwS2kxRHZjUmFNKzA2dVVl?=
 =?utf-8?B?dDg5MHFjWFJ0KzMwZUZVM25tR1Q1enJBbXZFMnBHL2ZhSWZmOHd6TmV6ZVAz?=
 =?utf-8?B?ZWlwMWt0RFY3Uy94RlVMK1hCby9CSC9ZT0lsTlk0dmd2cms4czQvTEZ4L3M5?=
 =?utf-8?B?WjgzVFhkZGp4dk5lUlUzczlxM3pyM05VTVI5RTNDOTZuS1dRdUdycHRoYzBO?=
 =?utf-8?B?SlFRQnJyQ3ZwVlptVmJ2RVNwbGhHaWdpQm5PeStMcW92U2VPOXBvLzhpSHZV?=
 =?utf-8?Q?4ofmH7kwc6MHQtovfHJFnlgNLZBn83/U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNWc1dzc2tSU2NYaFUxVU83cVBEcUdoV3hPNEdPbUgwcy93L0FmWDMwazZw?=
 =?utf-8?B?bzJDZWFyZE9xWFh3UTZXd2pKcEtHckYrNzVaMzc5NGdWcVV1QWwzL3k3aito?=
 =?utf-8?B?VWs2a01lRDh2T2RDT3V0M1JvcUl6Znl2a0xiS0Nzd2x0clJ3dDRUcGF5OHdS?=
 =?utf-8?B?Zk5KeFU4TjZ4ZWFzZ1l1c2VJeWdqMnZVdXlEaGhNY0plS042eVowV1Y4Wm5J?=
 =?utf-8?B?WXd3UnZudHZwNTJmZE9tYzFhWlVnUmJwWUo1czNJcDBwRGZaK3VVQUE3T2w0?=
 =?utf-8?B?c0R1b1JOMjkzdG9uUGNjejFFdmtlSytxTFFFSm5XWU1yZStKUFF1a0JpbEYy?=
 =?utf-8?B?WDFnbDFoSThtMUlYcGF5bjlWTnlGV0ttYzJoeXJML2d4NDc4U1NBVHZHTWJV?=
 =?utf-8?B?aVpiMjc4R3ZQWjh0SUw2ZFREaXFwZnAydWdkVzNtQ3dIcjNVWW1PUnEyWGYy?=
 =?utf-8?B?dFJlTmM4cklFazVXMDh5Z2NBSGk0YUtJKzgzRVZXb3pWSGxxM1U0Qm9xTGl0?=
 =?utf-8?B?MENHRy9sNHM5N0tTRGEzRWJZY3JMZlN6Sndoa09JaGNxNWRxUzV1S21RUFg1?=
 =?utf-8?B?K3Y4bXV5NzdSWXl5eGFNTHNhTy80ekdXR1BwREwyZHVjMm1JTld2S003UG1t?=
 =?utf-8?B?RmpkZTQ5dkpGdUcxWlhPaWNRK24vKzhnV2xlcG1lL2ZwdGpqRjgwU216ajRo?=
 =?utf-8?B?b3llc3FRaGpHMVdHMDhRekY3bVNYaEdia0ViSmdpQkNKSkhiVzJ4MHRaYjVS?=
 =?utf-8?B?cTJPNDVLNnZvU0drOXRudFB0enhaczg5NkYrYU1mTE9qaExqZkVzRlc3Tngy?=
 =?utf-8?B?QVRZZ0NYK3FRK0xNcXhEbmt4cXNFN0NqS29DakR3SXlQaVpRV0thdCtEWE1z?=
 =?utf-8?B?eXVsd0tnL3hLYlcrN3BDWW4xWjdpeHlRQnN6c1pOUWdIUnZEcVE0TWNoWTky?=
 =?utf-8?B?R21wMjQrMktTUDRHZFk1NDFqaWJYS2VJN3ZVMnF0ZG9uNTFQTzEzVklBc0tP?=
 =?utf-8?B?THRIU3dGeUQzRVN0UG8xRDZNM011WUI3WmsvTlk0enkxR042QVhTelFBcUNM?=
 =?utf-8?B?eGlCR09iV1RHVFlDc3k3OUZKYVFEMWxwWmpWYVQrcmN1N2FFaXRpeUh6WHRJ?=
 =?utf-8?B?ZGZHQnhGNC82R2JDeVdtRlJhWEwxTEZGVFc0QkJNcGpIQ1NnMTBZVmRXMmhP?=
 =?utf-8?B?UUtKa0tOekFVZEcyMVhmbUhhOTViNnpvUEQwVS90bEh1MDdwUGV5K1BqOG84?=
 =?utf-8?B?WWZ1akVnTHU3elp5VHArUERGWVNIMEhKbGxmd0c0WVZWaHRrWG9VWlZNcHR0?=
 =?utf-8?B?Wi9DWnNVRko4NGZCRjRzZW1FSVQyQXZjWUJsLzk3bExXLzRSRHU3U205L3Nn?=
 =?utf-8?B?WHY3aFpuN0kvQkkyQllDZGkyclp1eDFBQ3NFQmk0UW9VZmx0b3kvMmFhOGdC?=
 =?utf-8?B?N0RHUFNjUmJzWDBJY0RsYWZpMDF0SGo0ZU43STI4cEVkcnBMTHhDVFcxVXM1?=
 =?utf-8?B?SGJGMzdqVWo5NWE2dXJTSjRkYnIwWEhzaFlIZlE3c2JWKzI5Vjh3bkwwNGR6?=
 =?utf-8?B?NktDb3ZzcWVzY0h0YmdaWTc2dVo0YUlEYURBZlJ5VGNpQ01PTDhKeGN4M3dJ?=
 =?utf-8?B?UVlFbzIxNFRLU0N4Rnh0bWRYNHpPM0d5R0JCMHBTT1RmUnErSkxYWkRWNjc2?=
 =?utf-8?B?VGhQOTZ3QVA0QVVPSERZUEUzSUFUcFJiNXhPb2pDc2JJSnJSU2w1L1AzQ3pZ?=
 =?utf-8?B?Yk9QSWNrb08vVkxSbTk3bXFhMWk1ZFhWTGtYZ3R4bCtqeStxajlhTDMrSnVC?=
 =?utf-8?B?SU1nYzdOZEkxSmo3STkwcDVxL2E2c1JPUE1yRHEvL0RMYWVkT0VuQUVXMDFM?=
 =?utf-8?B?Wm5ubGF6TEQzc3JkMVhMYkxLVGNGQzZNZHdGb1lDQmJjTXAyQytDaUYxeFVP?=
 =?utf-8?B?ZENWb2s1T0lzNXpVeW1ZTmpyKys1Ym80RTFSNmpjcGx2ajFjZzFIK2JhclZY?=
 =?utf-8?B?YUlsYTVVWDlmeUhQZ0ljK2dqQlh3Umk4aDVoNUt6b20wLzM5bDE3YWJ0elg5?=
 =?utf-8?B?WkRTU1ZuZXlEN243RVNQZVVIVnNQR3hjVnMrRjBwSkE1Y29ReWhValFLOHBq?=
 =?utf-8?B?dzNzbWR2VmFKdFFBZmkrVlVWQ3VkRk02dnFYL1g4S01yQ2NNenVmcTh3Zy9Z?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 947c4fa8-e80f-4ba7-2902-08de2c89f2e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:20:13.2090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65i1ezQBrZwCyTVPwp4nGeu0Roj0tywyb4U4AiMv9ioSYNhujzGBR83zS9ayt9BxMF7Vl57nYIfA3mcOgk2H7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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

On Tue, Nov 25, 2025 at 01:13:15PM -0700, Alex Williamson wrote:
> On Tue, 25 Nov 2025 00:08:37 +0100
> Michał Winiarski <michal.winiarski@intel.com> wrote:
> 
> > Hi,
> > 
> > We're now at v6, thanks for all the review feedback.
> > 
> > First 24 patches are now already merged through drm-tip tree, and I hope
> > we can get the remaining ones through the VFIO tree.
> 
> Are all those dependencies in a topic branch somewhere?  Otherwise to
> go in through vfio would mean we need to rebase our next branch after
> drm is merged.  LPC is happening during this merge window, so we may
> not be able to achieve that leniency in ordering.  Is the better
> approach to get acks on the variant driver and funnel the whole thing
> through the drm tree?  Thanks,

+1 on merging through drm if VFIO maintainers are ok with this. I've
done this for various drm external changes in the past with maintainers
acks.

Matt

> 
> Alex
