Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44490A32001
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5AF10E7CB;
	Wed, 12 Feb 2025 07:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SctdrklA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026810E25B;
 Wed, 12 Feb 2025 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739345571; x=1770881571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1RBcGMIKtv10ISn8HcEjOdO6VxveBeku0O2xk34U2hA=;
 b=SctdrklABdjQstrn/kJZWJ6r7GMDWU2pa+HFDsQQCB9hXM8vObrRyIUQ
 ofQtiD0XV4PMP05MosqWuaa7Yhb0CCoxtxI9oGhPnKbKhzxY0o6ISlCNH
 Enk9Lq3GgLJRyI25ueL6VcqWAMtNONTJLz50I33i+FENEBFU9Xse1rQeO
 NqifDnYLMRzdaM3AOyLTsGFphRelE12gfx95TLNeOY7HpRS48Dzg7/W3I
 e2ryh1hNEpZjrGFtDX5hMsEIRCJ3QNfsNNNs7jNjoNhMyuic+TGXkY0Hx
 KGfUQKH4g/RT8b4kZ8dtuzlNKmtzXckrzfK73xFKKtbxUe+7J8dpJf0p3 g==;
X-CSE-ConnectionGUID: vWo1gqRXQ7OdL3lbJIChqQ==
X-CSE-MsgGUID: xw8xATEGTHGBqHAsPiV+cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40132846"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="40132846"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:32:36 -0800
X-CSE-ConnectionGUID: v84Npa8uSye//MiomyuZqg==
X-CSE-MsgGUID: jF8eqzOBRsKQ24F0ma6iow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117364205"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 23:32:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 23:32:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 23:32:35 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 23:32:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bu2Ka9S/urz7QCYR5IVo6d7yysvY/6W51brNNa5IJ+f3E05Ax5uIC6slaGDWIAXpE1ZK4REsx5zQwPExgoAUF82JxPVuuzJ4oJvzJNOTzW+pc1hNyuDG0lzshsiVWYTYeZbvSPHcuJF0oWolW9sp1UHFOYvLQCpiCTcpGdJqnIZYzVd1y4CbPfQytmVuHvcT9N03bni4miLqdu/7HON9yRqikk7IJo0MQnO2RYHftOegHKQXnr+rwnhTPJdu6Fibfsmmz5N5Zf0MsdDzsKK2Dn0CSGe39ulaIyPPuS0R1E1eI7ReiSoGmQoul9fhsbJY3r31dDZOi2UdBfRThyyBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RBcGMIKtv10ISn8HcEjOdO6VxveBeku0O2xk34U2hA=;
 b=ASLp596rQ5bqH/guk21hOP3h1eXOAJYTOfFCimCj2xIfoH6cZYLTho27i8LnhPRa8Z1BZTkb1nzKJVGcGwrfW52QrklQbHUS/ppwKWknd1VSl0IIrNEZRDNwnxpSKTghI3A39AwsNQlYdw3PoYnURtAaWs2ByUXXn2KmGe5gUwa7tYg1zcBJW2qJJimRDOCd4C7nRSTOo+WmNjhzfe5qan+ugraqZXpt93wFj6dNXuCxZNeq+LZMSdRtaoKG0QfbPJ4zwfnDIu1maZjEStX9SE5CMCx/sGXowdzc45ZvaDxZhg6aLfC4y1W5NbZZbWV4Abs2ayH6IIEKEn1iZa7LCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 07:32:32 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 07:32:32 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v4 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Thread-Topic: [PATCH v4 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Thread-Index: AQHbd7qjkE6WksV4a0uEr4xKQhg0YrNDSFHw
Date: Wed, 12 Feb 2025 07:32:32 +0000
Message-ID: <SJ1PR11MB6129BE6565855F8756C9AF8CB9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-3-9a5b018e359b@intel.com>
In-Reply-To: <20250205-asyn-v4-3-9a5b018e359b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB7662:EE_
x-ms-office365-filtering-correlation-id: 9009a9c8-9203-4d36-1674-08dd4b376989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y0VWL0haNER4UmNTd1RLZnZ4Kzg4MFRKb3pOc1MyN3lUTEk5M1F6UVlVa0NM?=
 =?utf-8?B?OEQxQ1dxZUJMbTdmMndiNG8rTnZ2azRKcG9NR085NnRINEpjNDM5dWhZbDhR?=
 =?utf-8?B?SEUwZXpsSUNkMnVJb1ZjNk84RUg5ekx0dmtlWVBOVGtLWkdmbmZMM3lHK29Z?=
 =?utf-8?B?MW1jZmFRZHZwbGZQVzZTQmxNU2NuQ2gzOVEwRTlGN3dCM3ZQdWhldjFGZTlF?=
 =?utf-8?B?YXBITkhUREsxdHFjWXpNblp4T2RjMDJEOW1CMGMzelNkR1d6di8rS2puTGFn?=
 =?utf-8?B?amFiVTVTU3Z3OHRXemhvUXlmRitWZ1NSanFSd3JEZ2hNeDlKNFMxM3pNM2Fr?=
 =?utf-8?B?QlZoUGlXc1ByT0I4L0sxZHc1akVMTUNhemlMTnNCcUNIcVZGRnk1aXJab0hi?=
 =?utf-8?B?UFhoMnpnVmN5djExekFIcVV0eVN2WUU3MHNXNnJNQWw0dWxXYVpXMEd6NnVU?=
 =?utf-8?B?NTQ1T0lvdjJabWZ5U2szbVhDd284WnRIaWpDNlZkTktmeTZzWEUydDg0S250?=
 =?utf-8?B?clNZd0x3VzVHVnErbURvL1p3eEx5ZDljck5lOVB4VW9XdFhjbWhEL2ZVaDJG?=
 =?utf-8?B?aWdySXR0YTlEaTUzM2ZqV28vcW5mYllkU1RlOHVEWmYxRXIrM3lRUnpZaDVh?=
 =?utf-8?B?YmRNa2gxbmJPMW9YS0RPMCtNKys1U0xweklQd2hXLzhDZW95cUxXMlFjcHVI?=
 =?utf-8?B?UjZtYW9RSzlrZm4yUGtMMkpjSnJMOThvbEF1d2llSnU1bUM1cnZ1bVRKKzlo?=
 =?utf-8?B?M2w2eDNRdno1R0tNMmhIbW00OThjTzBRYjZpZnd1OHBNNjN4UlZZeWxIZjhP?=
 =?utf-8?B?dXUrdkpGWm1wMWdLR2JXdUc5NlJ4UWZZa1VYOGtMS0VPS1g2VHRjL1hwUC9m?=
 =?utf-8?B?MG9TL1ZGZTNhZ2VVYUcxZkQ3ZXp3eEttSk03cC81RmlzZStmcXhDSTc5Mmp2?=
 =?utf-8?B?YlFuODhpVG1iYUpZSTBMZUhKR1MyZHlqUjJNbUcrTWQ4TkQwUVcwaVc5V1U2?=
 =?utf-8?B?V0FvQTVRREw1Q0RiM0FOcmdibDR6Nzk1bXVHWEdZdmZNQ3o1VUlkektoamdX?=
 =?utf-8?B?SGJORDc3dVdIN3dHSzlLNHU2TkdiMm14dFduTjcwMVhyektzeWlEb0IyTXhs?=
 =?utf-8?B?ZWRmMDlhT3g3OEVReldLc3ZsK0Y2SHg2MVVZeDVzeWw1ekJaMU50OENvVjhJ?=
 =?utf-8?B?bnpuOVNqZnlEUDF1VzJ6d3lUaE56MTlHalBwaVpWMWxjSlFwdm94dDNEblFp?=
 =?utf-8?B?ZVA2WDFPUEIyTXpLTFF6UXZ0UlhCcU1zSWc5VlNMNE5iVmtsYUVjeUpKU1Vl?=
 =?utf-8?B?N3dXSlZGdEVqQ1RSb0tJR3I4SHFML1VmdEJYUlNKQWNBSW04ajBrUkxGYW5K?=
 =?utf-8?B?L1BQdzV1bldXVjE2YjdTWUpMMjd4NyswVCtmYmI3MmdKb3AxNWd5ZUNaT3ZF?=
 =?utf-8?B?dmE1K0NNMjJwcXdsWWc1azFKUE0xMUF1VWRsWGlQU3I4Tyt1TjBsUUtsMFF2?=
 =?utf-8?B?aW1wSHU2dWxNWkFXM2xiQU1BdDNKK3pFVENoNU00ZTRUcXQwNldTY1lZbFYx?=
 =?utf-8?B?KzF5N1lYSXppdkJaaGtVemxGaHYwZW9kajNGZUJLckZaRkUrTFp5WDcreGtr?=
 =?utf-8?B?cmJLdE42RlM0TmtQVkRMRXJaeTd1MHF3eGlzeEI3SGlJNGkvVHQ3MWQ4dnhO?=
 =?utf-8?B?MVhKbkNzdTBZT2xaRXZkS3Z5WDMxNEk5ck4wZ29GQ0dHYkZlSEhaZ09WeGl0?=
 =?utf-8?B?NkU5TVZiSkhFVGJOMjN2aTBkdU1lQWZWdHBxV1ZBQjdVNHVZRUJabHlmN1hD?=
 =?utf-8?B?K2sxenc5TWo4Q2FMWHhOYU9hdHhVQm4rRk5ISVd5N29OVDd3RnVBelh6Rndl?=
 =?utf-8?Q?Uu9OWpKGgfAH6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UndiN1ZNS1liQnFVbkx6M21sdThUMno0UmtLckJOZTMzVTYvb25ZT2luRDRa?=
 =?utf-8?B?WGhxWGZUUTQyeFpNZ1dCK0hHZGtkUzFGMHVoQlcwT25EKzQ1QVAxMVVKaFRC?=
 =?utf-8?B?Vm9LL3U2QjRXSXQ3c2R6VGVaNjgxUmxVMmI2Zld6ODBpTHhIQ2dZNHFMVXd4?=
 =?utf-8?B?RjhWRTVIV2wrTVZiUzd5akNZOGVveDlvRFF0eWhNOUQ2Tmw2TkpVRmlZWE9W?=
 =?utf-8?B?c1M0cTRjbm5IWHZEd1dmTGdsWlNVRVhKZlZJSDJJR0VMZnlPS1ZpeHlvOVFh?=
 =?utf-8?B?Q2NETUVZdW5jQXB2VlZGdUgwMUFTb3I2S0JQM3BVdldpU2U4aHlYQUVDa21N?=
 =?utf-8?B?TzYxSUQ3ZWIzd1dId0VaRDdwejNqY25SVk44WVhpUVBXZHJFcGVhc04xWTJH?=
 =?utf-8?B?cWFqeEQvdmJFYit6eHlNb0E0MXJYVGF6T0xSQjRBajhKSlQxbU9YTmxndDVE?=
 =?utf-8?B?eStqRE1yZUt6b21WeGFCRDEwQmhwVDh6YlIxUUtEU1pZa1habURtUURjdFhl?=
 =?utf-8?B?akI0bE4xWXpjTGZmRjZwNkJmQ01ackd4cDF0S3ZncE8zUzBST3lKODRpQTR0?=
 =?utf-8?B?MFVWa2xCY3I5anExL1FHdHE4WmFkZklXZGt1emlObmhPM1BReW1iM3d1UjA2?=
 =?utf-8?B?S3BKeFlYZjROb01iY21zOUVZbTY5cG1PMTR4MWJwRWVLcDFpbUVId0xWSmVz?=
 =?utf-8?B?QnZlSzRtMllFd2RWVTg4OGNUZUt5bTNaclJPOFd2bWZGeUVXREhheU8yQTRW?=
 =?utf-8?B?a1lPRzh0eE01dzVzWmg4cHloUkgySnJkQjgxbHpoWFVOanp1TURXdDlReWhT?=
 =?utf-8?B?WXROUmNyUXVwc1NJOG9sTGYvOUQ0Ukw5WTdZZFozUlljMFQveGpQWlRhOG1x?=
 =?utf-8?B?RFM3Y3E5dngrSkFmUDVHamozT2xsNGx6empVTjh3M2tDVnlNRHc0S2VMTElB?=
 =?utf-8?B?dFFEMnd6N1ZJZTVPOHFVYkhOdzJhQ1Jrd3o2WmlZY29aRFdEUXo0U3FjcU02?=
 =?utf-8?B?WDRSZG9ZR0dTZ0hrdTNyZWxPTHN1ZWFSL2JGSDdyNy9BZUIzMWtEaXF1cENG?=
 =?utf-8?B?RTdOUjJpeVVEcTlGdkNmUExiS20vMk9UbHFkSTV4RW4xM2ZValU0QnR1UVNl?=
 =?utf-8?B?djBFYXdKdi9vRFhhTGI4YnlQVHFaTytFUnpvSjRNYk92MUhZMDU4eS9mSjIy?=
 =?utf-8?B?Qy9MYnAwcDlkYTRGd1NRNWh2V0F0VWxVUEorU0t6VUZ3V3d3RTZ0RUo1cUhO?=
 =?utf-8?B?SERBRFFKTWc2bEdMNDZRc2pYTjFwcmRYak1NSDBhWC9aRTJmUmVOSjk4RVFv?=
 =?utf-8?B?dHJQWnptdW9sNzBCZThlZ2Eydk1adGlJNGZ1Q2ZJaVVyZ0tJbzFjNitlQjNk?=
 =?utf-8?B?d2Z3S0N1YWs0RmJ0MSt0NG05REVad1QxWkxDMzVxOTNJWERoNCtqWnVrdjNr?=
 =?utf-8?B?QXBWQm9UNHhXVXdaYlJGQTN0SXNYSW82M21QY0hIOUZxWllHNXhvdkRPZHJM?=
 =?utf-8?B?VDJ6SkdOWWRvd2JtV255SEJMb3Jycm5KbEYrWjF5Q3dVMVNEaExHL3NMb25k?=
 =?utf-8?B?YVMyYWIxRExsVTR4M3JrajlsU1BabnNybkhoME12M3dXTkQvRDJmZmN4VXdh?=
 =?utf-8?B?TDY5SzltYzlqazVCT3N6ZjNkWHFCL3hiL2lWcTUyc3B5OVRHc2ZQQTlWeGRW?=
 =?utf-8?B?cHVYM2V1L3VoaVFGYVdvZlFGNU9aUUhHUGFDTjEyOEpMWEhuSTA1QUUybHBY?=
 =?utf-8?B?blUvbDIzNko4bTFKdkNVTVRTRFBkYzhWQTBFSCs5RjFuOHNWcnFEaGZlZUNJ?=
 =?utf-8?B?YW5LRUNpTExqRUs1T1RqK0l1cUxIQ0dRRG01OHZYR3Y4RE9EY01RMFpBK0c5?=
 =?utf-8?B?QjR1NUVndUlTUTJzeDJoN0I4L1B3NlVOWHUwTVlFSDFzbmF3SUdEMGZVVDF2?=
 =?utf-8?B?bGdzWmU1WTNnWGpjRnkzcndtZHpDcTNhSFZSTjluN0xvMjJXZ2pnaDhOeVJ2?=
 =?utf-8?B?blNWOVlxd0hjTG0ycWJsbnpjVzUvQVlDRlh3ZmN3OGIxZjVEQWZBK3FJazlq?=
 =?utf-8?B?Y2QyQW5BSlltNHRrckhqTFBYVFVNK0FuSXJQWGhPK0NRNUNrSklqSDF2Z2sr?=
 =?utf-8?B?MUV6Yk10a0xsNkI2Z05mSzM5WHBqYTg5MXgyRThQZzdRQ0pEbFg1dlgwNzRj?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9009a9c8-9203-4d36-1674-08dd4b376989
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 07:32:32.2185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VH9xofh4qEsUW/wKgzvOUw8im4v+IQ6JazvEORsoEpl1a6h7I9syxxjZexpoVxOLHMbZ3yEyMGsVysE9PvDSSPPo0TTao/BGvMgPOUG3VVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDUs
IDIwMjUgMzo1NyBQTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJv
cmFoQGludGVsLmNvbT47IFN5cmphbGEsDQo+IFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVsLmNv
bT47IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY0IDMvM10gZHJtL2k5MTUvZGlzcGxheTogQWRkIGk5MTUgaG9vayBmb3INCj4gZm9y
bWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMNCj4gDQo+IEhvb2sgdXAgdGhlIG5ld2x5IGFkZGVkIHBs
YW5lIGZ1bmN0aW9uIHBvaW50ZXINCj4gZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMgdG8gcG9w
dWxhdGUgdGhlIG1vZGlmaWVycy9mb3JtYXRzIHN1cHBvcnRlZA0KPiBieSBhc3luY2hyb25vdXMg
ZmxpcHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91
bml2ZXJzYWxfcGxhbmUuYyB8IDU2ICsrKysrKysrKysrKysrKystDQo+IC0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5l
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUu
Yw0KPiBpbmRleA0KPiBiYTVkYjU1M2MzNzQyNTlmOGYzMjQ2YzE0MDhiNTVkMzJjODc5NGU1Li45
NmQ1M2IyMjcxNWNmMzk3NDgzYWNiZGINCj4gMjNiNGRkNjBkNmNiYjYwNCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMN
Cj4gQEAgLTUxMSw2ICs1MTEsMzMgQEAgc2tsX3BsYW5lX21heF9zdHJpZGUoc3RydWN0IGludGVs
X3BsYW5lICpwbGFuZSwNCj4gIAkJCQltb2RpZmllciwgcm90YXRpb24sDQo+ICAJCQkJbWF4X3Bp
eGVscywgbWF4X2J5dGVzKTsNCj4gIH0NCj4gK3N0YXRpYyBib29sIGludGVsX3BsYW5lX2FzeW5j
X2Zvcm1hdHMoc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSwNCj4gK3VpbnQzMl90IGZvcm1hdCkg
ew0KPiArCXN3aXRjaCAoZm9ybWF0KSB7DQo+ICsJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToNCj4g
KwljYXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hCR1I4ODg4
Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9BUkdCODg4ODoNCj4gKwljYXNlIERSTV9GT1JNQVRfQUJH
Ujg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hSR0IyMTAxMDEwOg0KPiArCWNhc2UgRFJNX0ZP
Uk1BVF9YQkdSMjEwMTAxMDoNCj4gKwljYXNlIERSTV9GT1JNQVRfWFJHQjE2MTYxNjE2RjoNCj4g
KwljYXNlIERSTV9GT1JNQVRfWEJHUjE2MTYxNjE2RjoNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsJ
ZGVmYXVsdDoNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gK30NCj4gKw0KPiArc3RhdGlj
IGJvb2wgaW50ZWxfcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMoc3RydWN0IGRybV9w
bGFuZQ0KPiAqcGxhbmUsDQo+ICsJCQkJCQkgICB1aW50MzJfdCBmb3JtYXQsDQo+ICsJCQkJCQkg
ICB1aW50NjRfdCBtb2RpZmllcikNCj4gK3sNCj4gKwlpZiAoaW50ZWxfcGxhbmVfY2FuX2FzeW5j
X2ZsaXAodG9faW50ZWxfcGxhbmUocGxhbmUpLCBtb2RpZmllcikpDQo+ICsJCXJldHVybiBmYWxz
ZTsNCg0KVGhpcyBzaG91bGQgYmUNCg0KaWYgKCFpbnRlbF9wbGFuZV9jYW5fYXN5bmNfZmxpcCh0
b19pbnRlbF9wbGFuZShwbGFuZSksIG1vZGlmaWVyKSkNCg0KDQpJIHRoaW5rIHdlIHNob3VsZCBl
dmVudHVhbGx5IG1vdmUgdG8gYSBzd2l0Y2ggY2FzZSBsYWRkZXIgdGhhdCBhY3R1YWxseSBjaGVj
a3MgZm9yIGNvbXBhdGliaWxpdHkgYW1vbmcgZm9ybWF0LW1vZGlmaWVyIHBhaXINCnJhdGhlciB0
aGFuIGNoZWNraW5nIHRoZW0gaW5kaXZpZHVhbGx5LiBUaG91Z2ggd2UgZG9uJ3QgaGF2ZSBhIGdv
b2QgdXNlIG9mIGl0IHRvZGF5LCB3ZSBtaWdodCBlbmQgdXAgaGF2aW5nIHNjZW5hcmlvcyB3aGVy
ZSBzb21lIGZvcm1hdHMNCmFyZSBzdXBwb3J0ZWQgb25seSBmb3IgY2VydGFpbiBtb2RpZmllcnMg
YW5kIHZpY2UgdmVyc2EuIEJ1dCBpdCBjYW4gYmUgdGFrZW4gdXAgbGF0ZXIuDQoNCkkgc2VlIHNv
bWUgY29tbWVudHMgbWFkZSBvbiByZXYgMiBbMV0gcmVnYXJkaW5nIHJlLXVzaW5nIHRoZSBmb3Jt
YXRfbW9kX3N5bmMoKSBob29rIGZvciB0aGlzLg0KSSBoYXZlIG5vdCB5ZXQgZm9ybWVkIGEgc3Ry
b25nIG9waW5pb24gYWJvdXQgaXQgYW5kIHdpdGggdGhlIGFib3ZlIHN1Z2dlc3RlZCBjaGFuZ2Us
IGl0IGF0IGxlYXN0IHNlZW1zIHRvIHdvcmsuDQoNCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC82MzEyNjQvP3Nlcmllcz0xNDA5MzUmcmV2PTINCg0KPiArDQo+
ICsJcmV0dXJuIGludGVsX3BsYW5lX2FzeW5jX2Zvcm1hdHModG9faW50ZWxfcGxhbmUocGxhbmUp
LCBmb3JtYXQpOyB9DQo+IA0KPiAgc3RhdGljIGJvb2wgdGdsX3BsYW5lX2Nhbl9hc3luY19mbGlw
KHU2NCBtb2RpZmllcikgIHsgQEAgLTI1NTksMzAgKzI1ODYsMjkNCj4gQEAgc3RhdGljIGJvb2wg
dGdsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkKHN0cnVjdCBkcm1fcGxhbmUgKl9wbGFuZSwN
Cj4gIAl9DQo+ICB9DQo+IA0KPiArI2RlZmluZSBJTlRFTF9QTEFORV9GVU5DUyBcDQo+ICsJLnVw
ZGF0ZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9wbGFuZSwgXA0KPiArCS5kaXNh
YmxlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfZGlzYWJsZV9wbGFuZSwgXA0KPiArCS5kZXN0
cm95ID0gaW50ZWxfcGxhbmVfZGVzdHJveSwgXA0KPiArCS5hdG9taWNfZHVwbGljYXRlX3N0YXRl
ID0gaW50ZWxfcGxhbmVfZHVwbGljYXRlX3N0YXRlLCBcDQo+ICsJLmF0b21pY19kZXN0cm95X3N0
YXRlID0gaW50ZWxfcGxhbmVfZGVzdHJveV9zdGF0ZSwgXA0KPiArCS5mb3JtYXRfbW9kX3N1cHBv
cnRlZF9hc3luYyA9DQo+IGludGVsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jDQo+
ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIHNrbF9wbGFuZV9mdW5j
cyA9IHsNCj4gLQkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5l
LA0KPiAtCS5kaXNhYmxlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfZGlzYWJsZV9wbGFuZSwN
Cj4gLQkuZGVzdHJveSA9IGludGVsX3BsYW5lX2Rlc3Ryb3ksDQo+IC0JLmF0b21pY19kdXBsaWNh
dGVfc3RhdGUgPSBpbnRlbF9wbGFuZV9kdXBsaWNhdGVfc3RhdGUsDQo+IC0JLmF0b21pY19kZXN0
cm95X3N0YXRlID0gaW50ZWxfcGxhbmVfZGVzdHJveV9zdGF0ZSwNCj4gKwlJTlRFTF9QTEFORV9G
VU5DUywNCj4gKw0KPiAgCS5mb3JtYXRfbW9kX3N1cHBvcnRlZCA9IHNrbF9wbGFuZV9mb3JtYXRf
bW9kX3N1cHBvcnRlZCwgIH07DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVf
ZnVuY3MgaWNsX3BsYW5lX2Z1bmNzID0gew0KPiAtCS51cGRhdGVfcGxhbmUgPSBkcm1fYXRvbWlj
X2hlbHBlcl91cGRhdGVfcGxhbmUsDQo+IC0JLmRpc2FibGVfcGxhbmUgPSBkcm1fYXRvbWljX2hl
bHBlcl9kaXNhYmxlX3BsYW5lLA0KPiAtCS5kZXN0cm95ID0gaW50ZWxfcGxhbmVfZGVzdHJveSwN
Cj4gLQkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGludGVsX3BsYW5lX2R1cGxpY2F0ZV9zdGF0
ZSwNCj4gLQkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRlbF9wbGFuZV9kZXN0cm95X3N0YXRl
LA0KPiArCUlOVEVMX1BMQU5FX0ZVTkNTLA0KPiArDQo+ICAJLmZvcm1hdF9tb2Rfc3VwcG9ydGVk
ID0gaWNsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkLCAgfTsNCj4gDQo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyB0Z2xfcGxhbmVfZnVuY3MgPSB7DQo+IC0JLnVwZGF0
ZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9wbGFuZSwNCj4gLQkuZGlzYWJsZV9w
bGFuZSA9IGRybV9hdG9taWNfaGVscGVyX2Rpc2FibGVfcGxhbmUsDQo+IC0JLmRlc3Ryb3kgPSBp
bnRlbF9wbGFuZV9kZXN0cm95LA0KPiAtCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gaW50ZWxf
cGxhbmVfZHVwbGljYXRlX3N0YXRlLA0KPiAtCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGludGVs
X3BsYW5lX2Rlc3Ryb3lfc3RhdGUsDQo+ICsJSU5URUxfUExBTkVfRlVOQ1MsDQo+ICsNCj4gIAku
Zm9ybWF0X21vZF9zdXBwb3J0ZWQgPSB0Z2xfcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWQsICB9
Ow0KPiANCg0KVGhpcyBsZWFkcyB0byBleHBvc2luZyB0aGUgcHJvcGVydHkgZXZlbiBvbiBwbGFu
ZXMgdGhhdCBkbyBub3Qgc3VwcG9ydCBhc3luYyBmbGlwLg0KRnVuY3Rpb25hbGx5IGl0IHNob3Vs
ZCBub3QgYmUgYSBwcm9ibGVtIGFzIGNhbl9hc3luYyBpcyBleHBvc2VkIG9ubHkgZm9yIHByaW1h
cnkgcGxhbmUuDQoNCk1heSBiZSB3ZSBjYW4gbGl2ZSB3aXRoIGl0IGZvciBub3cuIFZpbGxlIGFu
eSB0aG91Z2h0cz8NCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiANCj4gLS0NCj4gMi4yNS4x
DQoNCg==
