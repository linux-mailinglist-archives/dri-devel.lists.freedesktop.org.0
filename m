Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF16A490B9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119B910EBFD;
	Fri, 28 Feb 2025 05:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhmAoimF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF04110EBFD;
 Fri, 28 Feb 2025 05:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740719549; x=1772255549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jez5tjraF5QtUv1XxsoTVkNXKpZKlXnV0LA0mpiZsxc=;
 b=YhmAoimFz4I30GOnDNvUR0sQF4Lh6djvf+kHauuQuNQafzpOZkWjYFlR
 3wa5cCyrPoxOGzBasGCsht7xbh0/TJpohlV6pTEEUmZsa3S7F9R/C2D+e
 WZ18gCbOeWEroqgPJaATdHKdvigdbhc0VciXYnccrgPtnQK2BQSFyLT8P
 12jdOlPtye1+bnG89JrlVo/vp82lS7nS9EG79zQCc33NqwxeKo+acs8DL
 U0W2b/DnEd8kBfYuLIlVslOmBk7Dfh7ztCTCe3b9QBJ2F42TIi9pALSeu
 YxO3f3QE/oWCJXD+mRIUDR4sqh58Irm+2K04ZO2ud2LJBWZQcdfw2puuI A==;
X-CSE-ConnectionGUID: eEdJ2g5FRim/CP50RNrSRw==
X-CSE-MsgGUID: er6jk51PTee9XKOn4yVi3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="67010036"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="67010036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 21:12:28 -0800
X-CSE-ConnectionGUID: oB70xfSjQDqrfKwWANjEvw==
X-CSE-MsgGUID: OJqNGGhXSFSppdEMAZ4pSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117906102"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 21:12:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 21:12:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 21:12:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 21:12:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIwHlZKzas/atKoWDsO8fyP9EhvU4eWPg9YGvBx+ClL5r+w1JPTc4BtHPi/1A75tikkuENzpoNR9j/7GHEy8QiwFVwygOTperKVuSg0uzhNFsa8bz8rfPZCn0etOUy2UbHWYNTRJUGiibh6Mk3E3R1ep4Znzs8S4vul42MbbB2cTSc460JwF+olthdxMvQv/lIbS6jrqvoLsWWHQw0SE1IbRl6AXzAPKDlhdpT3k7ye+ZSZdq93+XYxfj+7E9RCTannIjryD3uQbcXkl5GzUfiGETUEoPK3/Ek6GpmNOJWaS2ilEsbQ/rDsIFpOU2o+usjQ05F0XXEBcWhq0VpbpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jez5tjraF5QtUv1XxsoTVkNXKpZKlXnV0LA0mpiZsxc=;
 b=QvB37b7pjk78M9nDRYhG0Xs9tDQ9LNIYj8NzKwcl0wLYI8dmuUN/6gQT+LRB3+ny9BWcRlJi2dg9QhTe+mFU8OcviwpFcBwTXLagm1fui6tNHpNWt/Mnp5/x+lNWv5E2aZM0dJC2hhF2hua44m19V0jJJGgH9UDiw0DVvXWyAHy5ZCEsNRjk+0qR9lNenUGxDWZVj9V8959DOy7NAtDNePehOs6/GlYktVZAW5t2ZRV/UdMU5nIjNGrlDiupybc4OzxSChxDoVl264phtBvHhGHbAlMHFNplHkIxDe884xqmirEO9hmWSOcRk+P2qqtxTj1wGjQXfGI7yrm40IhDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 05:12:24 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%4]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 05:12:24 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Wilson, Chris P" <chris.p.wilson@intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Thread-Topic: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Thread-Index: AQHbiGOmhWtKqOvGMU+O16o5TdpyTLNbHAUAgAAWPYCAAPMecA==
Date: Fri, 28 Feb 2025 05:12:24 +0000
Message-ID: <SJ0PR11MB5867D9835902F0A3F6C0E204D0CC2@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
 <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
In-Reply-To: <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|SJ0PR11MB4798:EE_
x-ms-office365-filtering-correlation-id: 22b27491-b8ac-43e3-b132-08dd57b67ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WG9xSEY4cVU2QVJjRnR2NExsRFdNMGJyUUxESmx0ald0TFJncktQQ2pUUzhM?=
 =?utf-8?B?OVhOMVB3dTRTS2pMMHY4aGFzTlowaHk5SjQrVi9xRDZIRVp1QitVZXpSRnk1?=
 =?utf-8?B?YWVTeTBxL2F3RW1iNHhJZExrOWZEdEZ2Yzk3NkZUdklsdHF0cGdyOTF0bXM0?=
 =?utf-8?B?USs5VTdzMi83RERDTnlvWEZIMmxIV256N1U1NE5ia1NOT3RTU2tHNGRzSzZh?=
 =?utf-8?B?S0VMUzdHWDZLOUk3REIzTkhuRjJPUTRpcHVCWUx2Y0RmbFR4cmRtQ1VrNTRw?=
 =?utf-8?B?UDNWUjJsb0R1WFVPaTZEd3Jkc1lhZnh1VHl1TjBKdkJMR2EvQmhOOWtjaFpq?=
 =?utf-8?B?V1RPanNUSi80RlFQTnF5b09VekhOQVZsSlBjY0ZwRWJaUDZodC9iQXczOVFE?=
 =?utf-8?B?MHJJRkwyVCtQTTRQdTZudjcxK3lDMHFIVEl2b2d1aWtrTUpsQzlhQUFuWDZw?=
 =?utf-8?B?WWhsVFdzRlhIYm9scEhYdTJiSUlGQ1BEdkl1YlkzeVExM2tqcmREckNNNFRx?=
 =?utf-8?B?VVR5WEJwSjZLS1RKLzlhUExjaEtkQzhTUHJPajdTZVBpREhTOWpVVFZMK2N3?=
 =?utf-8?B?blE4MkMra3ZVS05WQVdpTFdwYmxqaE1jMkpURWVPUkh2ZmpKeHJPTUU0SVgz?=
 =?utf-8?B?UzgyYUVsSFFrV2NYYmVudDlhWll3VzlOYk5qRVE0VE5uZ2VONE54UXp4dnVk?=
 =?utf-8?B?aERyczFhRGhScjdBWlhqRlo3Z3Rham1LdHdYak5VQ0prTlpaVjg4SHNKQXpv?=
 =?utf-8?B?MmRkY2VNZnVNYWJsejV6Z3pRZW4wQTZ6OVNFMGs4UVk4UkF0YUdSbXZJbVQ2?=
 =?utf-8?B?dnJNQTRaQ3AzV2djUVhlQy9KNUk3OGlPTEVDeVFqL3hoc1NmbnFnSVlKalRM?=
 =?utf-8?B?Y3hEZFpyaDZyKzE3YjErSXdXSFMwc1Nra0k1Z1NFMmV2SVN0VUFDUDNudEJp?=
 =?utf-8?B?OUVpQW1DZmdSZFlSRXRxMXlrdVhFVkdqeTl0RnZKMDdia28zaWJYVkU1TEsv?=
 =?utf-8?B?di93SXNNMFQ2M3BDR25zU0swd2hQdnhNN0podXdRZWJOT1VUbnppdjgzK1Zo?=
 =?utf-8?B?LzdNMjdxVittNlZNS0s4b2VLcDRVUXpmMXlHdUFVN3dIWDVsZlBXMjQzb3lH?=
 =?utf-8?B?K1hBQ1p0Q1p4V3hLQm5UQVl3NlRuaXpvT0JEc2tsTlhQVE40TVIwSmFHUmFz?=
 =?utf-8?B?dWZoT0x2QU9xUVl2TVBBd09aKzRCWDVYZ3Jza20vYjhkZUpuWnQ3YTR5Q2hB?=
 =?utf-8?B?VEU3bmNTYnRCRk1OTW1EOXoxNzJiVDJLRGxmZVhNZmNEMkxnMUx5N3M1U1Ey?=
 =?utf-8?B?YkZERlhpN09OOENnT2JFZkE3RFZmZlRiYmVNZks3V2M5dVV0VXd5ZjdlaE1I?=
 =?utf-8?B?dlowaXhDWU5XSW8wNVp4Z09aaUJmYXF2RGc2WVZnY2pycUhVMnpldk5LUDB5?=
 =?utf-8?B?QkY4YVRnVE0zSGlYcGtuaVF1UCs4MEliQmhlWGpwZFo4eEo2ZUFRQmoyV0pE?=
 =?utf-8?B?RzI2K3o1OVhocDRXaWhmVURhYTMzMXlLVzVmU21mQjdIWlh6RmhKZmp1aUVY?=
 =?utf-8?B?bUJ3TFZJd1d5dkM2TUwvTm0rNWZOWlFSSHAreUhpZGhJeWVZd1lkamlUVTBN?=
 =?utf-8?B?bmdFOG4yeU42Z2lINXVjSFF0cnQ1TC9HUy9QSTdJT0xJc3hsUTZoQkxoc0t6?=
 =?utf-8?B?MW5ITGVxZ1lXZFRyanVkekMyY0t2S2JWVDRZZDZVb2FvVklJV3hrd2NlRHNj?=
 =?utf-8?B?Y04zbnU0WUdib1NTUDlHbXRlaTBzWnJpNmlrZk5IajdkUFFMb1c1Ty9BOGRS?=
 =?utf-8?B?L2x2MzNoUmJmQTd2QnhtNVdZaVArVE92enpzUm91OGRiUnRZNFk1MDQ3Zjhp?=
 =?utf-8?Q?Lg61M3tmqvYG8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FHTVdDVjRCTis0NlZmMmpNTG1GWnhNM2JkTnR6T3BhV2RES0RnR1V2bzhC?=
 =?utf-8?B?TUlZeUFPR0JWSmQ4STMvNjJraktJQmRlVGN5SnVFVjZHQlFjZVVESkFIcTBO?=
 =?utf-8?B?bVh3T2VFaHRrcmZ5ckZtdlBkVHlMNkFnTkVycFpzNnhRZk5sQlVIZnQ1cmlB?=
 =?utf-8?B?OCtLUWdPYnBqemZkK3NsZG5EMHRCcklBZTVyR2FHWWZ6NXZBaTltYmlTWTlC?=
 =?utf-8?B?QVhMcWdTalpWVElrbWFnaE5xZ2dMMENjZXJIZlVPdmZuUkFzeXFiSUYzMVpH?=
 =?utf-8?B?Szk1eXlDaUdUbU1teVZNbHIxcVJFQ3ZRdm1mNHNxVG1ZRXdlWVRDU1JEblov?=
 =?utf-8?B?QzlhR0xPekU0WFNiUEJNODNqU2VuQ2paMUlpRWlnS21BT3lKZFR0V1dxeUFJ?=
 =?utf-8?B?STFxckpYeG42VFJjSElmcVBHRjk0YldvZzgzcmU1d2NxUlN2Vnlnb0ljRHlE?=
 =?utf-8?B?V0RFVHNmVm1vVXRrUklIVGNuZlRBNEhUMXltRzJ0WE05RzVzdmprV0dnRGF4?=
 =?utf-8?B?bzgybXVjdzFMRlhOcjYwSG9CU28yV3JlTTduaEFsTlIvdWFXUGNLL2h2eTRI?=
 =?utf-8?B?aEN6NGJGZ0ZjTlg2MTRIdUpzNHdPOHIxdEdmTHg2c3BqMklZY0xpTG9GcVV2?=
 =?utf-8?B?SGxxeUhyRjJWMSs2OXhaaEFWMUtWRXQyVFM2SFA0TW5KMGdnZGhlZFhBRGsz?=
 =?utf-8?B?bVJueE4rbDAzcWZsanhyaDRMMVZ1b0xrNDd4YmRncC9sTm95RnV0TFJzYjlF?=
 =?utf-8?B?NktWV0plRTFsQWFmYXRDb0tnaWR3SSs0ZGxSYnlITjNLZ0ZGVWRTZHdCTnpn?=
 =?utf-8?B?RXFmOWhkR0xJdG9tVTJzMjg4QVlsV2hKMlZxdXVNckRrY3d0OWhhMk5VVWhK?=
 =?utf-8?B?K25VVGkrSTdJUy9yek94TjkwT0FBRGpvd2pDWWc2SnhOV2xmVFJJOXg3YnpQ?=
 =?utf-8?B?M01sQVJ1NThLQklKaFJqcndkbS80SENLeE1mS1dMRWl4eGhXdyt6R3RQdEQ1?=
 =?utf-8?B?Z0l3K0VNbG1FWXppdkxabDFSVnRka0NRNXVnOERsZUhHRzRzRFNCOTA3Z0Jo?=
 =?utf-8?B?dEp6U3l3OHdXWnVLUWYrUHlmOGpRQS9aSWY5Q1Z5VDl0MGJNalpkZmVNQ0Ir?=
 =?utf-8?B?YzQ0N0VtTnZNMEYxR0ZoakQ5UVE0QzVnZDB5QUN6OUlIYTRvWktwS2NtREFa?=
 =?utf-8?B?WTUrTFdLeVlhRjh2ZTZXN2xzVStia1ZRS2dEb0pOQXZkc3lTR1h1YUdEWlNV?=
 =?utf-8?B?OEdOZG14bGw4NUR0cXFnZk8xQ0pwL2EwQ1lMOWhsRHZEQ0hlWDFIMGNvY3l6?=
 =?utf-8?B?M0E2cFh6VXI5MUxoYU9EeWVKWEl5RStydnFkT1oxWTJaL0RpTzFjaTdoVHFj?=
 =?utf-8?B?TmE1OWlydjNBUkhKeGhDOC93RDkwTG9BbGJTand1ZmRwdE5ncDhVWWRWbUhk?=
 =?utf-8?B?MnB3MHRpQ0tCUVJpdlBQMnIwNVBZVzd5cUt2Nmc0UHRnWFFaaHBkbCs1M1Zj?=
 =?utf-8?B?VGdtdituaWVva00rT3ZUaHdkd24wbFUvbFBXdFV6blM2SU9iSU96YlpJQit4?=
 =?utf-8?B?R3JkREFsV0MvSnVnOWlVTFk4RDlSRElnUlB6dkF3UHpnbmx5ajhZNVpNRStV?=
 =?utf-8?B?L0dPMEI1dHZ6NWhtTjBlTDlHdm53U2dkQmwzY3pGY2Y1cEFDcllJT1hhSVlE?=
 =?utf-8?B?WlI5bzZveTc5SWNyaDFDZ01Bc2IrSTRDVUpXKzRYNHlCTFNQS01xNzd5b1pM?=
 =?utf-8?B?dUdpYklBSXhDY1RnSWdLTHI0bGQ5RWlSSnFpNTF0TGpSUEtVZHVRd2pxV2JE?=
 =?utf-8?B?b2dacVFOYWFRVDF0N09saTlPWGlyWXp2b3Z4b0RaT2ZIMWRZT1pFRThxUll3?=
 =?utf-8?B?NXlqekZ0b21lNDFSZm95aWJ1L1FIRjNZRmZhdHlMMnFHNVZRVy82S1NxVEls?=
 =?utf-8?B?eEZsbTFuNVcvcmRabzd4M3FWZjVQajJycEJxVnZZTDJEc1JIeDFvMDduU2ty?=
 =?utf-8?B?aGxIeUVUSWVhdEZEalorTFVVak8vYmpWUWNQZG54VVF1N2h1WVhTbEdFS3lr?=
 =?utf-8?B?aWJFSHhzRnBJSW5JaHY3cWd0ckh2OTljYXlBemx0S21QMi9KWkIvWW5SQnFV?=
 =?utf-8?Q?rLjSHDe9NENDwG2DgPAR/jQHp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b27491-b8ac-43e3-b132-08dd57b67ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 05:12:24.5690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chEolxm30a1UfGXInklbE1hcz8Zw47UR/pMtYJVpXEmpdoKWoU3YggZVnxP6a0hOdHlr94+69P/4LTbkH2vRCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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

SGksDQogDQo+IEFtIDI3LjAyLjI1IHVtIDEzOjUyIHNjaHJpZWIgQW5kaSBTaHl0aToNCj4gPiBI
aSBOaXRpbiwNCj4gPg0KPiA+IE9uIFdlZCwgRmViIDI2LCAyMDI1IGF0IDA5OjI1OjM0UE0gKzA1
MzAsIE5pdGluIEdvdGUgd3JvdGU6DQo+ID4+IEdpdmUgdGhlIHNjaGVkdWxlciBhIGNoYW5jZSB0
byBicmVhdGggYnkgY2FsbGluZyBjb25kX3Jlc2NoZWQoKSBhcw0KPiA+PiBzb21lIG9mIHRoZSBs
b29wcyBtYXkgdGFrZSBzb21lIHRpbWUgb24gb2xkIG1hY2hpbmVzIChsaWtlDQo+ID4+IGFwbC9i
c3cvcG52KSwgYW5kIHNvIGNhdGNoIHRoZSBhdHRlbnRpb24gb2YgdGhlIHdhdGNoZG9ncy4NCj4g
Pj4NCj4gPj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUv
a2VybmVsLy0vaXNzdWVzLzEyOTA0DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE5pdGluIEdvdGUgPG5p
dGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gVGhpcyBwYXRjaCBnb2VzIGJleW9uZCB0aGUgaW50
ZWwtZ2Z4IGRvbWFpbiBzbyB0aGF0IHlvdSBuZWVkIHRvIGFkZA0KPiA+IHNvbWUgcGVvcGxlIGlu
IENjLiBCeSBydW5uaW5nIGNoZWNrcGF0Y2gsIHlvdSBzaG91bGQgYWRkOg0KPiA+DQo+ID4gU3Vt
aXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4gKG1haW50YWluZXI6RE1BIEJVRkZF
UiBTSEFSSU5HDQo+ID4gRlJBTUVXT1JLKSAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4NCj4gPiAobWFpbnRhaW5lcjpETUEgQlVGRkVSIFNIQVJJTkcgRlJBTUVX
T1JLKSBsaW51eC0NCj4gbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+ID4gKG9wZW4gbGlzdDpETUEg
QlVGRkVSIFNIQVJJTkcgRlJBTUVXT1JLKQ0KPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcgKG9wZW4gbGlzdDpETUEgQlVGRkVSIFNIQVJJTkcNCj4gPiBGUkFNRVdPUkspDQo+ID4N
Cj4gPiBJIGFkZGVkIHRoZW0gbm93LCBidXQgeW91IG1pZ2h0IHN0aWxsIGJlIGFza2VkIHRvIHJl
c2VuZC4NCg0KVGhhbmsgeW91IEFuZGksIGZvciBhZGRpbmcgZG1hLWJ1ZiBtYWludGFpbmVycy4N
Cg0KPiA+DQo+ID4gU2FpZCB0aGF0LCBhdCBhIGZpcnN0IGdsYW5jZSwgSSBkb24ndCBoYXZlIGFu
eXRoaW5nIGFnYWluc3QgdGhpcw0KPiA+IHBhdGNoLg0KPiANCj4gVGhlcmUgaGFzIGJlZW4gc29t
ZSBwdXNoIHRvIGRlcHJlY2F0ZSBjb25kX3Jlc2NoZWQoKSBjYXVzZSBpdCBpcyBhbG1vc3QgYWx3
YXlzDQo+IG5vdCBhcHByb3ByaWF0ZS4NCg0KVGhhbmsgeW91IEtvbmlnIGZvciByZXZpZXcuDQpJ
J20gbm90IGZpbmRpbmcgYW55IHB1c2gvY29tbWl0IG9yIGRvY3VtZW50YXRpb24gb2YgZGVwcmVj
YXRlZCBjb25kX3Jlc2NoZWQoKSBhcGkuDQpJZiB5b3UgaGF2ZSBhbnkgcmVmZXJlbmNlLCBDb3Vs
ZCB5b3UgcGxlYXNlIHNoYXJlIGEgcHVzaCBvZiBkZXByZWNhdGVkIGNvbmRfcmVzY2hlZCgpPw0K
DQo+IA0KPiBTYXlpbmcgdGhhdCBpZiBJJ20gbm90IGNvbXBsZXRlbHkgbWlzdGFrZW4gdGhhdCBo
ZXJlIGlzIGFsc28gbm90IDEwMCUgY29ycmVjdA0KPiB1c2FnZS4NCj4gDQo+IFF1ZXN0aW9uIGlz
IHdoeSBpcyB0aGUgdGVzdCB0YWtpbmcgMjYgKGJ1c3k/KSBzZWNvbmRzIHRvIGNvbXBsZXRlPyBU
aGF0IHNvdW5kcw0KPiByZWFsbHkgbG9uZyBldmVuIGZvciBhIHZlcnkgb2xkIENQVS4NCj4gDQo+
IERvIHdlIG1heWJlIGhhdmUgYW4gdWRlbGF5KCkgaGVyZSB3aGljaCBzaG91bGQgaGF2ZSBiZWVu
IGFuIHVzbGVlcCgpIG9yDQo+IHNpbWlsYXI/DQoNCkkgd2lsbCBjaGVjayBhbmQgdGVzdCB3aXRo
IHVkZWxheSgpIG9yIHNpbWlsYXIgYXBpLg0KQW5kIEkgd2lsbCByZXNlbmQgYSBwYXRjaCBhZnRl
ciB0ZXN0aW5nLiAgDQoNClJlZ2FyZHMsDQpOaXRpbg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0
aWFuLg0KPiANCj4gPg0KPiA+IEFuZGkNCj4gPg0KPiA+PiAtLS0NCj4gPj4gSGksDQo+ID4+DQo+
ID4+IEZvciByZXZpZXdlciByZWZlcmVuY2UsIGFkZGluZyBoZXJlIHdhdGNoZG9nIGlzc3VlIHNl
ZW4gb24gb2xkDQo+ID4+IG1hY2hpbmVzIGR1cmluZyBkbWEtZmVuY2UtY2hhaW4gc3VidGVzdHMg
dGVzdGluZy4gVGhpcyBsb2cgaXMNCj4gPj4gcmV0cmlldmVkIGZyb20gZGV2aWNlIHBzdG9yZSBs
b2cgd2hpbGUgdGVzdGluZyBkYW0tYnVmQGFsbC10ZXN0czoNCj4gPj4NCj4gPj4gZG1hLWJ1Zjog
UnVubmluZyBkbWFfZmVuY2VfY2hhaW4NCj4gPj4gUGFuaWMjMSBQYXJ0Nw0KPiA+PiA8Nj4gc2l6
ZW9mKGRtYV9mZW5jZV9jaGFpbik9MTg0DQo+ID4+IDw2PiBkbWEtYnVmOiBSdW5uaW5nIGRtYV9m
ZW5jZV9jaGFpbi9zYW5pdHljaGVjayA8Nj4gZG1hLWJ1ZjogUnVubmluZw0KPiA+PiBkbWFfZmVu
Y2VfY2hhaW4vZmluZF9zZXFubyA8Nj4gZG1hLWJ1ZjogUnVubmluZw0KPiA+PiBkbWFfZmVuY2Vf
Y2hhaW4vZmluZF9zaWduYWxlZCA8Nj4gZG1hLWJ1ZjogUnVubmluZw0KPiA+PiBkbWFfZmVuY2Vf
Y2hhaW4vZmluZF9vdXRfb2Zfb3JkZXIgPDY+IGRtYS1idWY6IFJ1bm5pbmcNCj4gPj4gZG1hX2Zl
bmNlX2NoYWluL2ZpbmRfZ2FwIDw2PiBkbWEtYnVmOiBSdW5uaW5nDQo+ID4+IGRtYV9mZW5jZV9j
aGFpbi9maW5kX3JhY2UgPDY+IENvbXBsZXRlZCA0MDk1IGN5Y2xlcyA8Nj4gZG1hLWJ1ZjoNCj4g
Pj4gUnVubmluZyBkbWFfZmVuY2VfY2hhaW4vc2lnbmFsX2ZvcndhcmQgPDY+IGRtYS1idWY6IFJ1
bm5pbmcNCj4gPj4gZG1hX2ZlbmNlX2NoYWluL3NpZ25hbF9iYWNrd2FyZCA8Nj4gZG1hLWJ1Zjog
UnVubmluZw0KPiA+PiBkbWFfZmVuY2VfY2hhaW4vd2FpdF9mb3J3YXJkIDw2PiBkbWEtYnVmOiBS
dW5uaW5nDQo+ID4+IGRtYV9mZW5jZV9jaGFpbi93YWl0X2JhY2t3YXJkIDwwPiB3YXRjaGRvZzog
QlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMyDQo+ID4+IHN0dWNrIGZvciAyNnMhIFtkbWFidWY6MjI2
M10NCj4gPj4gUGFuaWMjMSBQYXJ0Ng0KPiA+PiA8ND4gaXJxIGV2ZW50IHN0YW1wOiA0MTU3MzUN
Cj4gPj4gPDQ+IGhhcmRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDQxNTczNCk6IFs8ZmZmZmZmZmY4
MTNkM2ExYj5dDQo+ID4+IGhhbmRsZV9zb2Z0aXJxcysweGFiLzB4NGQwIDw0PiBoYXJkaXJxcyBs
YXN0IGRpc2FibGVkIGF0ICg0MTU3MzUpOg0KPiA+PiBbPGZmZmZmZmZmODI3YzdlMzE+XSBzeXN2
ZWNfYXBpY190aW1lcl9pbnRlcnJ1cHQrMHgxMS8weGMwDQo+ID4+IDw0PiBzb2Z0aXJxcyBsYXN0
ICBlbmFibGVkIGF0ICg0MTU3MjgpOiBbPGZmZmZmZmZmODEzZDNmOGY+XQ0KPiA+PiBfX2lycV9l
eGl0X3JjdSsweDEzZi8weDE2MCA8ND4gc29mdGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoNDE1NzMz
KToNCj4gPj4gWzxmZmZmZmZmZjgxM2QzZjhmPl0gX19pcnFfZXhpdF9yY3UrMHgxM2YvMHgxNjAg
PDQ+IENQVTogMiBVSUQ6IDANCj4gPj4gUElEOiAyMjYzIENvbW06IGRtYWJ1ZiBOb3QgdGFpbnRl
ZA0KPiA+PiA2LjE0LjAtcmMyLWRybS1uZXh0XzQ4My1nN2I5MTY4M2U3ZGU3KyAjMSA8ND4gSGFy
ZHdhcmUgbmFtZTogSW50ZWwNCj4gPj4gY29ycG9yYXRpb24gTlVDNkNBWVMvTlVDNkNBWUIsIEJJ
T1MNCj4gQVlBUExDRUwuODZBLjAwNTYuMjAxOC4wOTI2LjExMDANCj4gPj4gMDkvMjYvMjAxOCA8
ND4gUklQOiAwMDEwOmhhbmRsZV9zb2Z0aXJxcysweGIxLzB4NGQwIDw0PiBSU1A6DQo+ID4+IDAw
MTg6ZmZmZmM5MDAwMDE1NGY2MCBFRkxBR1M6IDAwMDAwMjQ2IDw0PiBSQVg6IDAwMDAwMDAwMDAw
MDAwMDAgUkJYOg0KPiA+PiAwMDAwMDAwMDAwMDAwMDAxIFJDWDogMDAwMDAwMDAwMDAwMDAwMCA8
ND4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFJTSToNCj4gPj4gMDAwMDAwMDAwMDAwMDAwMCBS
REk6IDAwMDAwMDAwMDAwMDAwMDAgPDQ+IFJCUDogZmZmZmM5MDAwMDE1NGZiOCBSMDg6DQo+ID4+
IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwIDw0PiBSMTA6IDAwMDAwMDAw
MDAwMDAwMDANCj4gUjExOg0KPiA+PiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogMDAwMDAwMDAwMDAw
MDAwYSA8ND4gUjEzOiAwMDAwMDAwMDAwMDAwMjAwDQo+IFIxNDoNCj4gPj4gMDAwMDAwMDAwMDAw
MDIwMCBSMTU6IDAwMDAwMDAwMDA0MDAxMDAgPDQ+IEZTOg0KPiA+PiAwMDAwNzc1MjFjNWNkOTQw
KDAwMDApIEdTOmZmZmY4ODgyNzc5MDAwMDAoMDAwMCkNCj4gPj4ga25sR1M6MDAwMDAwMDAwMDAw
MDAwMA0KPiA+PiBQYW5pYyMxIFBhcnQ1DQo+ID4+IDw0PiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzIDw0PiBDUjI6DQo+ID4+IDAwMDA1ZGJmZWU4YzAw
YzQgQ1IzOiAwMDAwMDAwMTMzZDM4MDAwIENSNDogMDAwMDAwMDAwMDM1MjZmMCA8ND4NCj4gQ2Fs
bA0KPiA+PiBUcmFjZToNCj4gPj4gPDQ+ICA8SVJRPg0KPiA+PiA8ND4gID8gc2hvd19yZWdzKzB4
NmMvMHg4MA0KPiA+PiA8ND4gID8gd2F0Y2hkb2dfdGltZXJfZm4rMHgyNDcvMHgyZDANCj4gPj4g
PDQ+ICA/IF9fcGZ4X3dhdGNoZG9nX3RpbWVyX2ZuKzB4MTAvMHgxMCA8ND4gID8NCj4gPj4gX19o
cnRpbWVyX3J1bl9xdWV1ZXMrMHgxZDAvMHg0MjAgPDQ+ICA/IGhydGltZXJfaW50ZXJydXB0KzB4
MTE2LzB4MjkwDQo+ID4+IDw0PiAgPyBfX3N5c3ZlY19hcGljX3RpbWVyX2ludGVycnVwdCsweDcw
LzB4MWUwDQo+ID4+IDw0PiAgPyBzeXN2ZWNfYXBpY190aW1lcl9pbnRlcnJ1cHQrMHg0Ny8weGMw
DQo+ID4+IDw0PiAgPyBhc21fc3lzdmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzB4MWIvMHgyMA0K
PiA+PiA8ND4gID8gaGFuZGxlX3NvZnRpcnFzKzB4YjEvMHg0ZDANCj4gPj4gPDQ+ICBfX2lycV9l
eGl0X3JjdSsweDEzZi8weDE2MA0KPiA+PiA8ND4gIGlycV9leGl0X3JjdSsweGUvMHgyMA0KPiA+
PiA8ND4gIHN5c3ZlY19pcnFfd29yaysweGEwLzB4YzANCj4gPj4gPDQ+ICA8L0lSUT4NCj4gPj4g
PDQ+ICA8VEFTSz4NCj4gPj4gPDQ+ICBhc21fc3lzdmVjX2lycV93b3JrKzB4MWIvMHgyMA0KPiA+
PiA8ND4gUklQOiAwMDEwOl9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSsweDU3LzB4ODANCj4g
Pj4gPDQ+IFJTUDogMDAxODpmZmZmYzkwMDAyOTJiOGYwIEVGTEFHUzogMDAwMDAyNDYgPDQ+IFJB
WDoNCj4gPj4gMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmY4ODgxMGYyMzU0ODAgUkNYOiAwMDAw
MDAwMDAwMDAwMDAwIDw0PiBSRFg6DQo+ID4+IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAw
MDAwMDAwMDAwIFJESTogMDAwMDAwMDAwMDAwMDAwMCA8ND4NCj4gUkJQOg0KPiA+PiBmZmZmYzkw
MDAyOTJiOTAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAgPDQ+
IFIxMDoNCj4gPj4gMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiAw
MDAwMDAwMDAwMDAwMjQ2IDw0Pg0KPiBSMTM6DQo+ID4+IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiAw
MDAwMDAwMDAwMDAwMjQ2IFIxNTogMDAwMDAwMDAwMDAzODI4Yw0KPiA+PiBQYW5pYyMxIFBhcnQ0
DQo+ID4+IDw0PiBkbWFfZmVuY2Vfc2lnbmFsKzB4NDkvMHhiMA0KPiA+PiA8ND4gd2FpdF9iYWNr
d2FyZCsweGY4LzB4MTQwIFtkbWFidWZfc2VsZnRlc3RzXSA8ND4NCj4gPj4gX19zdWJ0ZXN0cysw
eDc1LzB4MWYwIFtkbWFidWZfc2VsZnRlc3RzXSA8ND4NCj4gPj4gZG1hX2ZlbmNlX2NoYWluKzB4
OTQvMHhlMCBbZG1hYnVmX3NlbGZ0ZXN0c10gPDQ+IHN0X2luaXQrMHg2YS8weGZmMA0KPiA+PiBb
ZG1hYnVmX3NlbGZ0ZXN0c10gPDQ+ID8gX19wZnhfc3RfaW5pdCsweDEwLzB4MTAgW2RtYWJ1Zl9z
ZWxmdGVzdHNdDQo+ID4+IDw0PiBkb19vbmVfaW5pdGNhbGwrMHg3OS8weDQwMCA8ND4gZG9faW5p
dF9tb2R1bGUrMHg5Ny8weDJhMCA8ND4NCj4gPj4gbG9hZF9tb2R1bGUrMHgyYzIzLzB4MmY2MCA8
ND4gaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4OTcvMHhlMCA8ND4gPw0KPiA+PiBpbml0X21vZHVs
ZV9mcm9tX2ZpbGUrMHg5Ny8weGUwIDw0Pg0KPiA+PiBpZGVtcG90ZW50X2luaXRfbW9kdWxlKzB4
MTM0LzB4MzUwDQo+ID4+IDw0PiBfX3g2NF9zeXNfZmluaXRfbW9kdWxlKzB4NzcvMHgxMDAgPDQ+
IHg2NF9zeXNfY2FsbCsweDFmMzcvMHgyNjUwDQo+ID4+IDw0PiBkb19zeXNjYWxsXzY0KzB4OTEv
MHgxODAgPDQ+ID8gdHJhY2VfaGFyZGlycXNfb2ZmKzB4NWQvMHhlMCA8ND4gPw0KPiA+PiBzeXNj
YWxsX2V4aXRfdG9fdXNlcl9tb2RlKzB4OTUvMHgyNjANCj4gPj4gPDQ+ID8gZG9fc3lzY2FsbF82
NCsweDlkLzB4MTgwDQo+ID4+IDw0PiA/IGRvX3N5c2NhbGxfNjQrMHg5ZC8weDE4MA0KPiA+PiA8
ND4gPyBpcnFlbnRyeV9leGl0KzB4NzcvMHhiMA0KPiA+PiA8ND4gPyBzeXN2ZWNfYXBpY190aW1l
cl9pbnRlcnJ1cHQrMHg1Ny8weGMwDQo+ID4+IDw0PiBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3
ZnJhbWUrMHg3Ni8weDdlDQo+ID4+IDw0PiBSSVA6IDAwMzM6MHg3NzUyMWU3MjcyNWQNCj4gPj4N
Cj4gPj4NCj4gPj4gIGRyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UtY2hhaW4uYyB8IDE0ICsr
KysrKysrKysrLS0tDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9zdC1k
bWEtZmVuY2UtY2hhaW4uYw0KPiA+PiBiL2RyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UtY2hh
aW4uYw0KPiA+PiBpbmRleCBlZDRiMzIzODg2ZTQuLjMyOGE2NmVkNTllNSAxMDA2NDQNCj4gPj4g
LS0tIGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS1jaGFpbi5jDQo+ID4+ICsrKyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UtY2hhaW4uYw0KPiA+PiBAQCAtNTA1LDYgKzUwNSw3
IEBAIHN0YXRpYyBpbnQgc2lnbmFsX2ZvcndhcmQodm9pZCAqYXJnKQ0KPiA+Pg0KPiA+PiAgCWZv
ciAoaSA9IDA7IGkgPCBmYy5jaGFpbl9sZW5ndGg7IGkrKykgew0KPiA+PiAgCQlkbWFfZmVuY2Vf
c2lnbmFsKGZjLmZlbmNlc1tpXSk7DQo+ID4+ICsJCWNvbmRfcmVzY2hlZCgpOw0KPiA+Pg0KPiA+
PiAgCQlpZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZChmYy5jaGFpbnNbaV0pKSB7DQo+ID4+ICAJ
CQlwcl9lcnIoImNoYWluWyVkXSBub3Qgc2lnbmFsZWQhXG4iLCBpKTsgQEAgLTUzNyw2DQo+ICs1
MzgsNyBAQA0KPiA+PiBzdGF0aWMgaW50IHNpZ25hbF9iYWNrd2FyZCh2b2lkICphcmcpDQo+ID4+
DQo+ID4+ICAJZm9yIChpID0gZmMuY2hhaW5fbGVuZ3RoOyBpLS07ICkgew0KPiA+PiAgCQlkbWFf
ZmVuY2Vfc2lnbmFsKGZjLmZlbmNlc1tpXSk7DQo+ID4+ICsJCWNvbmRfcmVzY2hlZCgpOw0KPiA+
Pg0KPiA+PiAgCQlpZiAoaSA+IDAgJiYgZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGZjLmNoYWluc1tp
XSkpIHsNCj4gPj4gIAkJCXByX2VycigiY2hhaW5bJWRdIGlzIHNpZ25hbGVkIVxuIiwgaSk7IEBA
IC01ODcsOCArNTg5LDEwDQo+IEBADQo+ID4+IHN0YXRpYyBpbnQgd2FpdF9mb3J3YXJkKHZvaWQg
KmFyZykNCj4gPj4gIAlnZXRfdGFza19zdHJ1Y3QodHNrKTsNCj4gPj4gIAl5aWVsZF90byh0c2ss
IHRydWUpOw0KPiA+Pg0KPiA+PiAtCWZvciAoaSA9IDA7IGkgPCBmYy5jaGFpbl9sZW5ndGg7IGkr
KykNCj4gPj4gKwlmb3IgKGkgPSAwOyBpIDwgZmMuY2hhaW5fbGVuZ3RoOyBpKyspIHsNCj4gPj4g
IAkJZG1hX2ZlbmNlX3NpZ25hbChmYy5mZW5jZXNbaV0pOw0KPiA+PiArCQljb25kX3Jlc2NoZWQo
KTsNCj4gPj4gKwl9DQo+ID4+DQo+ID4+ICAJZXJyID0ga3RocmVhZF9zdG9wX3B1dCh0c2spOw0K
PiA+Pg0KPiA+PiBAQCAtNjE2LDggKzYyMCwxMCBAQCBzdGF0aWMgaW50IHdhaXRfYmFja3dhcmQo
dm9pZCAqYXJnKQ0KPiA+PiAgCWdldF90YXNrX3N0cnVjdCh0c2spOw0KPiA+PiAgCXlpZWxkX3Rv
KHRzaywgdHJ1ZSk7DQo+ID4+DQo+ID4+IC0JZm9yIChpID0gZmMuY2hhaW5fbGVuZ3RoOyBpLS07
ICkNCj4gPj4gKwlmb3IgKGkgPSBmYy5jaGFpbl9sZW5ndGg7IGktLTsgKSB7DQo+ID4+ICAJCWRt
YV9mZW5jZV9zaWduYWwoZmMuZmVuY2VzW2ldKTsNCj4gPj4gKwkJY29uZF9yZXNjaGVkKCk7DQo+
ID4+ICsJfQ0KPiA+Pg0KPiA+PiAgCWVyciA9IGt0aHJlYWRfc3RvcF9wdXQodHNrKTsNCj4gPj4N
Cj4gPj4gQEAgLTY2Myw4ICs2NjksMTAgQEAgc3RhdGljIGludCB3YWl0X3JhbmRvbSh2b2lkICph
cmcpDQo+ID4+ICAJZ2V0X3Rhc2tfc3RydWN0KHRzayk7DQo+ID4+ICAJeWllbGRfdG8odHNrLCB0
cnVlKTsNCj4gPj4NCj4gPj4gLQlmb3IgKGkgPSAwOyBpIDwgZmMuY2hhaW5fbGVuZ3RoOyBpKysp
DQo+ID4+ICsJZm9yIChpID0gMDsgaSA8IGZjLmNoYWluX2xlbmd0aDsgaSsrKSB7DQo+ID4+ICAJ
CWRtYV9mZW5jZV9zaWduYWwoZmMuZmVuY2VzW2ldKTsNCj4gPj4gKwkJY29uZF9yZXNjaGVkKCk7
DQo+ID4+ICsJfQ0KPiA+Pg0KPiA+PiAgCWVyciA9IGt0aHJlYWRfc3RvcF9wdXQodHNrKTsNCj4g
Pj4NCj4gPj4gLS0NCj4gPj4gMi4yNS4xDQoNCg==
