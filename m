Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1FA0B0F5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC510E4CE;
	Mon, 13 Jan 2025 08:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVXFp7YB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9F10E4C8;
 Mon, 13 Jan 2025 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736756600; x=1768292600;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dKInLb2+pBBul1plt+yWZkzttUwaG4Z7Y6p48Mv4BGk=;
 b=EVXFp7YBogjz3swcFHddIPwFrd3Aodwff/KRdNwZa9ndaljZE6CUC5T0
 7bElzVL0pZeLutCJuhj8JGwittBfjuJj341HCriPwHhcYrnI8e8IjwKAd
 fB4D1oxpFDrMbrDzir+7Za/wU8TNxp9bwpVVen7x1IxxBoq39aAzqs6Jf
 wv43AUXr6HOfGyB1qhRRCUR7sd9eepTJrDIztwM7yG2GS3vhKvNXIybWS
 JTfXmQLu74SLO1cNq6b6gF1KAeIPhK6OHy8ivkujIIyi9BOWzDKf5gGQS
 mSRPOzCn18YVmwweNC0pChyv/mmK8JZ9SGPtrJw8G2atiVXyZgk+6nKvx Q==;
X-CSE-ConnectionGUID: IirUk+DtSveCItzoPgS1iQ==
X-CSE-MsgGUID: 6w1C3D4yRdCCDixEtRHhPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="37023712"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37023712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 00:23:19 -0800
X-CSE-ConnectionGUID: DMFCHEfyREKdnGe/FbXxfQ==
X-CSE-MsgGUID: mnv2qUu/RoGIsNm+C40+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108463698"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 00:23:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 00:23:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 00:23:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 00:22:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWJbmH50Plp0Q+/AgOkHHfIhonBKZNrcMVeZfR4j01TcJ+xLiCwyLJRrQwrr/PbIxUH7qduFHKN96kPeZvajTqP932YwlK+z2R/bklstUtrXdYhmxt3sRMExP41ZRGUoF1ptadJurjc1e87j8ERUyz82s1hQP2TJYz94rvA4bM64B+MIuUzo+TDYiYG13ysAzSr/SDI129sVA0+u7vW1FePvZXJQRQnWsCvfeoDtQf6vsUjTl0GK+TbMpEHskbZi+/8ujWQ2EM9ZDgrfxEzhGDKk6xI/ahFEZxEckX9axl6Ok6N+rpdDEVB36GBE+fw5V5DQPjCvZaQF/SDqez11nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKInLb2+pBBul1plt+yWZkzttUwaG4Z7Y6p48Mv4BGk=;
 b=W0dt1PgSQWeXHNzI5ToFymXpBPNfpYtykMjlZ288zR+rwSl/vsR0Yn5L8CvBOMjLebBPJDiEyJNp9g7t9VllD5z+J43oa/wJg2QlcJkLRxplvNm5foYgZXK2yF+lyM1UhX12Bs3/REf910iQ/GGJwYZlPLJz4tD67cn90EWGaF87OmVNaHcHuwWNuauShPTmvhnJKJDs+SdaWbcF/NxbLEjsQ2+ooO4laVmR+eh29Re5MDIoQTaXywVCTxXMBzGiM4HrRMd02cBioHT+HwFN2rVkqlRzlzQXHQEdzQhWLlxPfBf92fQPCH/fpS9fwgGAHFmDs3gWzEh1e5tCy0PspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:22:16 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:22:16 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/5] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v3 1/5] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbYZGvPisuwAJycE+nq9/hhj3OyLMSzJmAgAFxpdA=
Date: Mon, 13 Jan 2025 08:22:16 +0000
Message-ID: <IA0PR11MB7307C9002F145EEAF4ABDBC3BA1F2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-1-f4399635eec9@intel.com>
 <SJ1PR11MB61292EA1EF93BB7B78EAAD45B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61292EA1EF93BB7B78EAAD45B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN0PR11MB6158:EE_
x-ms-office365-filtering-correlation-id: bacb1a1d-2fea-4c04-2bd5-08dd33ab63c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SnE5ZkFUTy8yMjB6Y0lPUS9lVGtlL3krREtOWWcxa0s5VlNNN0VFWWN2cXpI?=
 =?utf-8?B?eDlMaXhaMGRpYWR1cjBEdjVwekdSa25PMWxhNzE5UXdkMUQ2NWI4YVZhSDlz?=
 =?utf-8?B?TjhtNjFtQ2tyR1kzRzdjang5MmpqN0p6YmxyTnVuVTdHVjlZMTIwWGdiQTNx?=
 =?utf-8?B?Q0swUi9FQVhsYk96QUVjcEFaSlhQN1YxQlJIZkJwYVphZEI0WWkxVkhiWFdK?=
 =?utf-8?B?M1lKejdpTUxCVXg4Zld3bHBieWZ0blVVZ01nZGpKWWhWYVRnTlV0NWxVR3h5?=
 =?utf-8?B?YWRhQUJva051R2xVV3RRRHA5UFlZS2JoSWZsSmRqWU1nWWtSbFZ3d3ZlQThw?=
 =?utf-8?B?azhmUW9HMnNjdjFiWHRjUVdSR0JDZVY4cHB4eUM3NHQ3YU4yNVR0b3Zsb1cr?=
 =?utf-8?B?MDQzSlRNSGhIOG9WWnRzaC9WRUhHanliVnN3OTQxMDRjRThod2lSYTRpcDcr?=
 =?utf-8?B?eVZSd1pnMEQ2RHVGWTkyVkR0eHlBMUJDRkVCZjFtendOcnFpa2wvak5YTlJn?=
 =?utf-8?B?QXo2Qy9FUVM5VVF5ckV3M2Q4RC9ockpabERiOTJ6cDdNSHNETm1Ka1BGeEhR?=
 =?utf-8?B?UzMyN2FHTUo3SzVXdFYyMU1sM1U2UGcyYWRiK2RGM3FrRUJPenZWeENxNWM0?=
 =?utf-8?B?QUpNcDdJNGFiVWtZZXkvTkJxUGhCVTZTR251eTVpMDZwYllOZldYVWZNbE5R?=
 =?utf-8?B?STNyL3VSd3RLMTc0ayswUENVaW01bDlPM2ZDVWhpclhGWCs2TlJkQUNvNG5w?=
 =?utf-8?B?c0cyZURra3o1VGJXblNPRTl4d3UybGk4ZWhyZEFJbkhGYldyTlJQbWNnOVZ5?=
 =?utf-8?B?Vm1VdkNqeHpaZlZ2dnJuREJaWm8yK2d2ZEQ1ZEVnY0JSSlBSUEUrekduOFlX?=
 =?utf-8?B?RG5mcHI2QVZ3akxySW1ZTE9UeHduWUtEblVkdnpkNlh6eDFPUFl3MSthR0Z6?=
 =?utf-8?B?YUttVmFhNW96L1h3RVowaVgxM1B4V0w2cXh5ZnRYZHpPMWxheXhLZ1dZNjZn?=
 =?utf-8?B?Q0RnZkE5SFMrb1VTbGU5dkNkNVJ5TmM5QkkwUTFTSXhZTmhxRzVvSEhCR0lS?=
 =?utf-8?B?K2RKTHZ3RUZMYjVxL0VUYithUlN5S3lNUzVLNm9LQ1hoWFBwNUJTVU5NY0N1?=
 =?utf-8?B?WVJ0MGd4VnBqa1BWZ2c4T3RUQyszanFVeGVuS09DZDFnMGdWVG1KaXVubk9v?=
 =?utf-8?B?M3FyaDNWdHhTb0IwNDc3eFJmdzRoNUxYUFRpRWRZamV1SmgvWHVFZWFwU2xs?=
 =?utf-8?B?WHJtY2hQc2JhMVRvQngvVGVoYkpmb0ZDck5sWTZrZDNPRGN0bzcwU3JaeTVt?=
 =?utf-8?B?ZlYyNnArVXJwQXBFV3RzWWhhcGZVV3FiRjhCVUFCN0JNMFFXUFNaSDAxcy9E?=
 =?utf-8?B?U3lxZ0VyRTZlZFdNWG12dEhUbU1hbG1jc25iS0RvMGMwb253L1BhRC9IR2pi?=
 =?utf-8?B?OW9BTXJVc0pJbVF0bG9DcFZvUWh5RVpBZlYyL2JhVGsrdFpZd0tVRUxFallC?=
 =?utf-8?B?cGp6ZHlTRnNLSVNaaE5HNS9VTndGTU1VSkdEOHpFQUltazZGaVo1TGxJa3Q1?=
 =?utf-8?B?L296MVFGQzFkcVVyYk8xMVBNYm42TWo1QlZKVldMb3hRcDB5L05uK0YwaU1F?=
 =?utf-8?B?UUdRMEM0dXdxLzhDTm4wNTVXWHZtcXdNL0pFL25zcDZaNzU2OGQwRkl3c2x5?=
 =?utf-8?B?QTY5WE1ubWVjVmdsT3pXU0RLUFljSENnQnRWRkF2WHhET2tDcUU0MzJHV2t2?=
 =?utf-8?B?dUIvTUpUdHhLZmVaUGdPNnp5d21DYU13bGJwUzg2aGpuR0JZeDdZd1VmSWs0?=
 =?utf-8?B?V0N1UjZHOEl5WndBT1k1eG50Yms0eWpYS3dwWjRVRm5XY0pkTC80MUV2Nk44?=
 =?utf-8?B?by9aK1dObDB1M2RtRTJ1ZzBWUTY3QXZqUmVWUmN1QkRNL1ZadDRHU3RZTzlu?=
 =?utf-8?Q?4eqgTBsNtZQuOVwtbVOfkov6Lp+IMCKg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDcxbG80YWVVM0QrT0JkZHJ2VFZwZ2JnVHY4UVdyVjk1Z0VaSXh5b2RLU0xp?=
 =?utf-8?B?OGpTS1N4TlFkZHcwaUlJSUluQzVpbXNwNnZrUk1yQk9zbHVNWGRkZFdEd0dt?=
 =?utf-8?B?UlNZQ0FPb1FiSlFJY3hvODllaU9zN1YzTTVQcHBrR2I0NytGcXNHbmp1VEVD?=
 =?utf-8?B?UmVlRDJ0S3gvQm9UdzZjOVoyMmFDSFBZK2J4OWFab3FpeEtvS2dwb3dPcEt2?=
 =?utf-8?B?ZW5taGZtSEtTOE5UZDlXNFhUQ21wS2Yzb01Gc1F2dXlwa1Zlclltb29OeUlt?=
 =?utf-8?B?UVpydkdFMC9XZFJhdXNoYXBlZGZnYUlrb2ZwSVd3RWVkU2pTekFZZ08wNktT?=
 =?utf-8?B?eWxKMGQ2LzUrNWcyVXNiSGdjTjU1UXFRaTVpR096VG0rdkU3cExDRVhHdmp2?=
 =?utf-8?B?MFpFSFMxQ0ZieFdRU3dGelVoOWFaekJQSUljMEZrUDR5dVpIV3U1UWYwQU5m?=
 =?utf-8?B?MXI4UHFvdS82T2dsd1JhSG41elk0RkptRVc4bW92TDIzNDdsL0dmbUpQdDFZ?=
 =?utf-8?B?Yi85VzZjZEs1MXdLQ2oraU43L3VNOEU5c2tEZmp6a1MyTGFJSlY5cGJRL2Z3?=
 =?utf-8?B?VzVaL21xRFQ2SjR6ZDZqYWdsb2pTdjNMOTlhdzVaYnRKSzV5aUJ2aGNLV0g0?=
 =?utf-8?B?R2dXVFl0V1djRlFaRjF5Um44N3g1a0l2U0RxdDF5UzlNdHBkYXQxRmhMU0Fn?=
 =?utf-8?B?blJWMEVCS2tBSEtmS0ZFMy9naUE3Mlh3MUZzR0l5N0p3UjVBdWs1cGhGdWZn?=
 =?utf-8?B?TndsSGpaakdOa3NvRmJWaFhFODFPK0Zta3Z0OXdGTlpmTU5tQ1VlUHlqRjNw?=
 =?utf-8?B?dGNpaTQyVXQvVDNaZ1lRTkx5RXdiemxNRFk3VmZKZmVNOW1SNUQ1Rk9oQzcv?=
 =?utf-8?B?aUF1QlU5T2tJZnQ3SXViL1dGR1ROSVpBbTdZdDAyZE5JM2JrZHBlbE1yaHo3?=
 =?utf-8?B?MkFEUllubDVkbk1YWjdJc1o2MmorNXZ2QmJ3ejFMNlNVUlBBaDJZQ2FYNFYw?=
 =?utf-8?B?L3ZSVmI4SjJIdk04T0lCVURGTjYrV1hnQTloWElZS3dzRnVMNnZCWldqd3hR?=
 =?utf-8?B?YmxleExNTEVHZE1Qd1NuSjYwbTlPVEd4MlFrNzZ3eXJ4WVZBa2R1M2JHOGVT?=
 =?utf-8?B?Vk93UUphQUxrbS9FMmtlYzZzL2MzcWw4aEp4RUFaOUdCa1JCNmVwd29CVlQx?=
 =?utf-8?B?NUhMYXZNSGJwcEx5QXhPQ0NDWkw5Mk5hcmkzOXkxZjFIUjNXQ3cyUWJBaTg3?=
 =?utf-8?B?STlaZnVkdUY2MUNZQWhhSHJyVitaN2NaRFhZamwrNnpQdGNUTXR5cTdLQzRy?=
 =?utf-8?B?bTZOeWRkaUZiMnc4OTNQUFpMN3pRdTk2bnhHcER5Rm9CRmxNTVZuM1lXV3VP?=
 =?utf-8?B?d0x6MU9SWnMwMmRFcVczRDZkbFd0dmVSRzZIQUV3b3pBQUs3bE9ELzRSTjQr?=
 =?utf-8?B?bDE5TWFwb2NYZlVSWDBycHFra2dHY2tNdzAvZmh6cngrNkxIWUt6N3FlTjZI?=
 =?utf-8?B?UFNCZ0ZnMkR4Z1NCRE95U1F2eVBQRkFoanVxTTMyNjdIRzl2YTgwbUtXN1hw?=
 =?utf-8?B?dklpU0kxbTNEUEtrQkh1aUQ2YUliOEFsZDBCb2dJWEZmbWc2N0tNUXM0bkxQ?=
 =?utf-8?B?RXphaVZ5R09hejY2ZVo4QUNnY2dRMXYxNkFTSlU3NmRCYnFMcXd6aDhSREMy?=
 =?utf-8?B?MTVldi93emdEKzl5SlQxOFFIek1DZHNsdXFqMk5EcnJPbEhKbys3WWZ0bjFp?=
 =?utf-8?B?THN4cUgwOGdJaE9uUWpRTVgvR3VXbkE2QzZjZ1czRGNPTVBoaHhpL3p2R25T?=
 =?utf-8?B?bTlaZ1JMNkd2VVpwcmVJVGwxRG5Oci9MdW55WjhpTnBNM2RYVFRYc3ZwbDFV?=
 =?utf-8?B?Y2NiVDIxZ084Z2xnTEh0SUZ1cm1sREVHWmJxT3luYVowK3N1MmZ5VHdENFN2?=
 =?utf-8?B?T2ZPenJzalU5YkVBK2F2Z0lzM29tMEsvT1hxRVVjVUtOckdzZUJNSWRnMVpV?=
 =?utf-8?B?dXFqalU3V0RnaVFpSHVoR2ZTYm9BUDkrMEZ6SVVyc0lQb0hIUTJ3YUdDWGRx?=
 =?utf-8?B?QVcza09BOXpTZzUxUndBcDU1RG40bXpzUjF1dUxWMitoMTh3N1lqWUMzWWFt?=
 =?utf-8?Q?EEeV+LTVzD1mhecC7Cx69m1mF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacb1a1d-2fea-4c04-2bd5-08dd33ab63c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 08:22:16.2391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVGqmzkXrE2uFRA5jW8xalqkwVn6xyUCXh8xC6yKEOwy7uBqUAUQ2bCiasp3sskLsgQ5BAom7xWAEejBgv+VlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
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

PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IEFy
dW4gUiBNdXJ0aHkNCj4gPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgOCwgMjAyNSAxMTowOSBB
TQ0KPiA+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+IGludGVsLSB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gPiBDYzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IFN1
YmplY3Q6IFtQQVRDSCB2MyAxLzVdIGRybS9wbGFuZTogQWRkIG5ldyBwbGFuZSBwcm9wZXJ0eQ0K
PiA+IElOX0ZPUk1BVFNfQVNZTkMNCj4gPg0KPiA+IFRoZXJlIGV4aXN0cyBhIHByb3BlcnR5IElO
X0ZPUk1BVFMgd2hpY2ggZXhwb3NlcyB0aGUgcGxhbmUgc3VwcG9ydGVkDQo+ID4gbW9kaWZpZXJz
L2Zvcm1hdHMgdG8gdGhlIHVzZXIuIEluIHNvbWUgcGxhdGZvcm1zIHdoZW4gYXN5bmNocm9ub3Vz
DQo+ID4gZmxpcHMgYXJlIHVzZWQgYWxsIG9mIG1vZGlmaWVycy9mb3JtYXRzIG1lbnRpb25lZCBp
biBJTl9GT1JNQVRTIGFyZSBub3QNCj4gc3VwcG9ydGVkLg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBh
IG5ldyBwbGFuZSBwcm9wZXJ0eSBJTl9GT1JNQVRTX0FTWU5DIHRvIGV4cG9zZSB0aGUNCj4gPiBh
c3luYyBmbGlwcyBzdXBwb3J0ZWQgbW9kaWZpZXJzL2Zvcm1hdHMgc28gdGhhdCB1c2VyIGNhbiB1
c2UgdGhpcw0KPiA+IGluZm9ybWF0aW9uIGFoZWFkIGFuZCBkb25lIGZsaXBzIHdpdGggdW5zdXBw
b3J0ZWQgZm9ybWF0cy9tb2RpZmllcnMuDQo+ID4gVGhpcyB3aWxsIHNhdmUgZmxpcHMgZmFpbHVy
ZXMuDQo+IA0KPiBzL2RvbmUvZG8NCj4gcy91bnN1cHBvcnRlZC9zdXBwb3J0ZWQNCj4gcy9mbGlw
cy9mbGlwDQo+IA0KRG9uZSENCg0KPiA+IEFkZCBhIG5ldyBmdW5jdGlvbiBwb2ludGVyIHNpbWls
YXIgdG8gZm9ybWF0X21vZF9zdXBwb3J0ZWQNCj4gPiBzcGVjaWZpY2FsbHkgZm9yIGFzeW5jaHJv
bm91cyBmbGlwcy4NCj4gPg0KPiA+IHYyOiBSZW1vdmUgYXN5bmMgdmFyaWFibGUgZnJvbSBkcm1f
cGxhbmUgKFZpbGxlKQ0KPiA+IHYzOiBBZGQgbmV3IGZ1bmN0aW9uIHBvaW50ZXIgZm9yIGFzeW5j
IChWaWxsZSkNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5t
dXJ0aHlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVf
Y29uZmlnLmMgfCAgNyArKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyAg
ICAgICB8ICA2ICsrKysrKw0KPiA+ICBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCAgICAg
fCAgNiArKysrKysNCj4gPiAgaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggICAgICAgICAgIHwgMjAg
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25z
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZp
Zy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMNCj4gPiBpbmRleA0K
PiA+DQo+IDg2NDJhMmZiMjVhOTAxMTZkYWI5NzVhYTBhYjZiNTFkZWFmYjRiOTYuLmRiYmVmMjA3
NTNmODM0YTg1YWU5ZGVkDQo+ID4gNzQ4Y2ZmMmIzZjBlODUwNDMgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+ID4gQEAgLTM4OCw2ICszODgsMTMgQEAgc3RhdGljIGlu
dA0KPiA+IGRybV9tb2RlX2NyZWF0ZV9zdGFuZGFyZF9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpDQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ID4gIAlkZXYtPm1vZGVfY29uZmln
LnNpemVfaGludHNfcHJvcGVydHkgPSBwcm9wOw0KPiA+DQo+ID4gKwlwcm9wID0gZHJtX3Byb3Bl
cnR5X2NyZWF0ZShkZXYsDQo+ID4gKwkJCQkgICBEUk1fTU9ERV9QUk9QX0lNTVVUQUJMRSB8DQo+
ID4gRFJNX01PREVfUFJPUF9CTE9CLA0KPiA+ICsJCQkJICAgIklOX0ZPUk1BVFNfQVNZTkMiLCAw
KTsNCj4gPiArCWlmICghcHJvcCkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArCWRldi0+
bW9kZV9jb25maWcuYXN5bmNfbW9kaWZpZXJzX3Byb3BlcnR5ID0gcHJvcDsNCj4gPiArDQo+ID4g
IAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiA+IGluZGV4DQo+
ID4NCj4gYTI4YjIyZmRkN2E0MWFjYTgyZDA5N2Q0MjIzNzg1MWRhOWEwYTc5Yi4uNDE2ODE4ZTU0
Y2NmZmNmM2QzYWFkYTI3DQo+ID4gMjNlOTZjZThjY2YxZGQ5NyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMNCj4gPiBAQCAtMTQxLDYgKzE0MSwxMiBAQA0KPiA+ICAgKiAgICAgdmFyaW91cyBi
dWdzIGluIHRoaXMgYXJlYSB3aXRoIGluY29uc2lzdGVuY2llcyBiZXR3ZWVuIHRoZSBjYXBhYmls
aXR5DQo+ID4gICAqICAgICBmbGFnIGFuZCBwZXItcGxhbmUgcHJvcGVydGllcy4NCj4gPiAgICoN
Cj4gPiArICogSU5fRk9STUFUU19BU1lOQzoNCj4gPiArICogICAgIEJsb2IgcHJvcGVydHkgd2hp
Y2ggY29udGFpbnMgdGhlIHNldCBvZiBidWZmZXIgZm9ybWF0IGFuZCBtb2RpZmllcg0KPiA+ICsg
KiAgICAgcGFpcnMgc3VwcG9ydGVkIGJ5IHRoaXMgcGxhbmUgZm9yIGFzeW5jaHJvbm91cyBmbGlw
cy4gVGhlIGJsb2IgaXMgYSBzdHJ1Y3QNCj4gPiArICogICAgIGRybV9mb3JtYXRfbW9kaWZpZXJf
YmxvYi4gV2l0aG91dCB0aGlzIHByb3BlcnR5IHRoZSBwbGFuZSBkb2Vzbid0DQo+ID4gKyAqICAg
ICBzdXBwb3J0IGJ1ZmZlcnMgd2l0aCBtb2RpZmllcnMuIFVzZXJzcGFjZSBjYW5ub3QgY2hhbmdl
IHRoaXMgcHJvcGVydHkuDQo+ID4gKyAqDQo+IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBtZW50aW9u
IGhlcmUgdGhhdCB0aGUgYWJzZW5jZSBvZiB0aGlzIHByb3BlcnR5IHdvdWxkIG1lYW4NCj4gdGhh
dCBhbGwgZm9ybWF0IG1vZGlmaWVyIHBhaXIgaW4gSU5fRk9STUFUUyBhcmUgYWxzbyBzdXBwb3J0
ZWQgZm9yIGFzeW5jIGZsaXBzLg0KPiBUaGF0IHdheSB0aGUgdUFQSSByZW1haW5zIGJhY2t3YXJk
IGNvbXBhdGlibGUuDQo+IA0KSSB0aGluayB0aGlzIGlzIGNsZWFyIHdpdGggdGhlIGFib3ZlIGRv
Y3VtZW50YXRpb24uIEFueXdheSB3aWxsDQpyZWZyYW1lIHRvIGJlIG1vcmUgc3BlY2lmaWMuDQoN
Cj4gPiAgICogU0laRV9ISU5UUzoNCj4gPiAgICogICAgIEJsb2IgcHJvcGVydHkgd2hpY2ggY29u
dGFpbnMgdGhlIHNldCBvZiByZWNvbW1lbmRlZCBwbGFuZSBzaXplDQo+ID4gICAqICAgICB3aGlj
aCBjYW4gdXNlZCBmb3Igc2ltcGxlICJjdXJzb3IgbGlrZSIgdXNlIGNhc2VzIChlZy4gbm8gc2Nh
bGluZykuDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+
ID4gYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBpbmRleA0KPiA+DQo+IDI3MTc2NWUy
ZTlmMmRhNjJhYWYwZDI1ODgyOGVmNDE5NmUxNDgyMmUuLjBjMTE2ZDZkZmQyNzcyNjJiMWE0YzBm
MA0KPiA+IDk3ZmNlMmQ3MTlmNDM4NDQgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X21vZGVfY29uZmlnLmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaA0K
PiA+IEBAIC05MzYsNiArOTM2LDEyIEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWcgew0KPiA+ICAJ
ICovDQo+ID4gIAlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICptb2RpZmllcnNfcHJvcGVydHk7DQo+ID4N
Cj4gPiArCS8qKg0KPiA+ICsJICogQGFzeW5jX21vZGlmaWVyc19wcm9wZXJ0eTogUGxhbmUgcHJv
cGVydHkgdG8gbGlzdCBzdXBwb3J0DQo+ID4gbW9kaWZpZXIvZm9ybWF0DQo+ID4gKwkgKiBjb21i
aW5hdGlvbiBmb3IgYXN5bmNocm9ub3VzIGZsaXBzLg0KPiA+ICsJICovDQo+ID4gKwlzdHJ1Y3Qg
ZHJtX3Byb3BlcnR5ICphc3luY19tb2RpZmllcnNfcHJvcGVydHk7DQo+ID4gKw0KPiA+ICAJLyoq
DQo+ID4gIAkgKiBAc2l6ZV9oaW50c19wcm9wZXJ0eTogUGxhbmUgU0laRV9ISU5UUyBwcm9wZXJ0
eS4NCj4gPiAgCSAqLw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaCBi
L2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGluZGV4DQo+ID4NCj4gZGQ3MThjNjJhYzMxYmYxNjYw
NmYzZWU5ZjAyNWE1YjE3MWNkMWU2Ny4uZTg3NDllNmZjM2JjMGFjZmM3M2JiZDg0MA0KPiA+IDFm
ODVjMzEyNmU4Njc1OSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaA0K
PiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oDQo+ID4gQEAgLTU0OSw2ICs1NDksMjYg
QEAgc3RydWN0IGRybV9wbGFuZV9mdW5jcyB7DQo+ID4gIAkgKi8NCj4gPiAgCWJvb2wgKCpmb3Jt
YXRfbW9kX3N1cHBvcnRlZCkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHVpbnQzMl90DQo+ID4g
Zm9ybWF0LA0KPiA+ICAJCQkJICAgICB1aW50NjRfdCBtb2RpZmllcik7DQo+ID4gKwkvKioNCj4g
PiArCSAqIEBmb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYzoNCj4gPiArCSAqDQo+ID4gKwkgKiBU
aGlzIG9wdGlvbmFsIGhvb2sgaXMgdXNlZCBmb3IgdGhlIERSTSB0byBkZXRlcm1pbmUgaWYgZm9y
DQo+ID4gKwkgKiBhc3ljaHJvbm91cyBmbGlwIHRoZSBnaXZlbiBmb3JtYXQvbW9kaWZpZXIgY29t
YmluYXRpb24gaXMgdmFsaWQgZm9yDQo+ID4gKwkgKiB0aGUgcGxhbmUuIFRoaXMgYWxsb3dzIHRo
ZSBEUk0gdG8gZ2VuZXJhdGUgdGhlIGNvcnJlY3QgZm9ybWF0DQo+ID4gKwkgKiBiaXRtYXNrICh3
aGljaCBmb3JtYXRzIGFwcGx5IHRvIHdoaWNoIG1vZGlmaWVyKSwgYW5kIHRvIHZhbGlkYXRlDQo+
ID4gKwkgKiBtb2RpZmllcnMgYXQgYXRvbWljX2NoZWNrIHRpbWUuDQo+ID4gKwkgKg0KPiA+ICsJ
ICogSWYgbm90IHByZXNlbnQsIHRoZW4gYW55IG1vZGlmaWVyIGluIHRoZSBwbGFuZSdzIG1vZGlm
aWVyDQo+ID4gKwkgKiBsaXN0IGlzIGFsbG93ZWQgd2l0aCBhbnkgb2YgdGhlIHBsYW5lJ3MgZm9y
bWF0cy4NCj4gPiArCSAqDQo+IA0KPiBXZSBzdGlsbCBoYXZlIHRvIGhvbm9yIHRoZSBJTl9GT1JN
QVRTIHByb3BlcnR5LCByaWdodD8NClNvcnJ5IGRpZG7igJl0IGdldCBpdCwgdGhpcyBuZXcgcHJv
cGVydHkgaXMgaW4gcGFyYWxsZWwgdG8gdGhlIGV4aXN0aW5nDQpJTl9GT1JNQVRTLiBXZSBoYXZl
IHJldGFpbmVkIGl0IGFzIGlzIGFuZCBhZGRlZCBuZXcgcHJvcGVydHkgZm9yIGFzeW5jLg0KQW55
d2F5IHdpbGwgcmVmcmFtZSB0byBiZSBtb3JlIGNsZWFyLg0KDQo+IA0KPiA+ICsJICogUmV0dXJu
czoNCj4gPiArCSAqDQo+ID4gKwkgKiBUcnVlIGlmIHRoZSBnaXZlbiBtb2RpZmllciBpcyB2YWxp
ZCBmb3IgdGhhdCBmb3JtYXQgb24gdGhlIHBsYW5lLg0KPiA+ICsJICogRmFsc2Ugb3RoZXJ3aXNl
Lg0KPiA+ICsJICovDQo+ID4gKwlib29sICgqZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiA+ICsJCQkJCSAgIHVpbnQzMl90IGZvcm1hdCwgdWlu
dDY0X3QgbW9kaWZpZXIpOw0KPiA+ICsNCj4gPiAgfTsNCj4gPg0KPiANCj4gU29tZSB0aG91Z2h0
cyBhZnRlciBnb2luZyB0aHJvdWdoIGFsbCB0aGUgcGF0Y2hlcy4gVGhlcmUgaXMgYSBiaXQgb2Yg
YW1iaWd1aXR5DQo+IGhvdyBhIGRyaXZlciBjYW4gaGFuZGxlIHRoZSBJTl9GT1JNQVRTX0FTWU5D
IHByb3BlcnR5IGluIGNhc2VzIHdoZXJlDQo+IHRoZXJlIGFyZSBubyBzcGVjaWZpYyByZXN0cmlj
dGlvbnMgaW4gZm9ybWF0IG1vZGlmaWVyIHBhaXJzIGZvciBhc3luYy4NCj4gDQo+IFR3byBhcHBy
b2FjaGVzIGhlcmUuDQo+IA0KPiAxLiBUaGUgZHJpdmVyIHNob3VsZCBub3QgZXhwb3NlIHRoZSBw
cm9wZXJ0eSBhdCBhbGwuDQo+IDIuIFRoZSBkcml2ZXIgc2hvdWxkIGZpbGwgdXAgSU5fRk9STUFU
U19BU1lOQyBibG9iIHRoYXQgaW5kaWNhdGVzIHRoYXQgYWxsDQo+IGZvcm1hdCBtb2RpZmllciBw
YWlyIHN1cHBvcnRlZCBmb3Igc3luYyBhcmUgYWxzbyBzdXBwb3J0ZWQgZm9yIGFzeW5jIGZsaXBz
Lg0KPiANCj4gQXBwcm9hY2ggMSBzZWVtcyB0byBiZSBiZXR0ZXIgZm9yIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkuIElmIHdlIGZvbGxvdw0KPiBhcHByb2FjaCAyLCB3ZSBkbyBub3QgbmVlZCB0byBl
eHBvc2UgdGhlIGZ1bmN0aW9uIGNyZWF0ZV9pbl9mb3JtYXRzX2Jsb2IoKQ0KPiBhbmQgaXQgY2Fu
IGJlIGhhbmRsZWQgdGhyb3VnaCB0aGUgZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMoKSBmdW5j
dGlvbg0KPiBpbnRlcm5hbGx5IGR1cmluZyBwbGFuZSBpbml0aWFsaXphdGlvbi4NCj4gDQo+IEVp
dGhlciB3YXkgdGhlIGRvY3VtZW50YXRpb24gc2hvdWxkIGJlIG1hZGUgY2xlYXIgd2hhdCB3ZSBl
eHBlY3QgZnJvbSB0aGUNCj4gdXNlcnNwYWNlLg0KPiANCkRvY3VtZW50YXRpb24gYWRkZWQgc2F5
cyB0aGlzIGlzIGFuIG9wdGlvbmFsIHByb3BlcnR5IHRvIGNvbnZleSB0aGUgdXNlciB3aXRoIHRo
ZSBsaXN0IGZvciBmb3JtYXRzL21vZGlmaWVycyBzdXBwb3J0ZWQgYnkgdGhlIHBsYW5lIGZvciBh
c3luYyBmbGlwcy4NCkNvbXBhdGliaWxpdHkgd2lzZSB0aGlzIGlzIGEgbmV3IHByb3BlcnR5IHdo
aWNoIGlzIGluIHBhcmFsbGVsIHRvIElOX0ZPUk1BVFMgYW5kIGhlbmNlIHNob3VsZCBub3QgYnJl
YWsgYW55dGhpbmcuDQpBbnl3YXkgd2lsbCByZWZyYW1lIGFuZCBiZSBtb3JlIHNwZWNpZmljLg0K
DQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0t
LQ0K
