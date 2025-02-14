Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB6A35B7B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302BD10EC37;
	Fri, 14 Feb 2025 10:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QverDzhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC1310EC34;
 Fri, 14 Feb 2025 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528616; x=1771064616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBugFAsbl1Z1YN06iIxeqZKepgMhnsRSSNRKkWc+1+s=;
 b=QverDzhhFtNBL0Vm4qshRVvF9eiR0fH/6K33sBGAfkM20HLTXPk/cXSv
 rwTUFhtJJJICFRqDouu6AuzWJUSjGtJ8uegtnsno0OaiabydTu+EFp0UA
 561UwleRwrRPwvFJKxQVeDuW+76FIT3rM3yg4QOLhxvcBel8lwJSVZkNw
 2rANkQ/edYW+VSMcMf9AMrx0HUqQlczP2Qxml/c8EE4ap/l174Vn9YuyK
 QuOqqde01J32puhusvSsfRybz5k9EvLCqpxBk2gRSEiWDDWUb8Jf3dDWY
 DyUFodXXGEquyKm7CpJD93TP4PH1ULanKBpkdxVUoMrvgCYQRRr9d5Bc0 g==;
X-CSE-ConnectionGUID: pWVIruA7SMaeK6rr+fA/fQ==
X-CSE-MsgGUID: vwdfqBTLQ3m0eMuvQM1IKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57679506"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="57679506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:23:36 -0800
X-CSE-ConnectionGUID: 5K7HfOF8SxK/oRvXeRytwg==
X-CSE-MsgGUID: WucxD+caThWyNF2oHMGkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113910637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 02:23:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 02:23:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:23:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:23:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9qF5EcK+4yHeuuMklKhcC+js2/bNrM+VXJJDM3lqCEo6Y/oE8WcY9cSwya1xKGRaHQ5JD4mEWgZ/YE3YdQKFFUes4HU1veORN7SGW8+rKejdXnWGpvmtjkKz6yXNV5E9q+SALW6F3WNbZ6mG9rnQagfEVNQcc4A0L3je+nSZ7J/vH08rhiOSlMvoNw2DZsb2Qr1VGJid7XEScYQFV+bVChB8yQBYAmfymkFJv91jGyHjksat+ldJ/ta0wxeB7udfEwYCAwletyOXq8wddH/NjwxZl+bOmBAG8Ixj/3bMWTEuduRF6/5dfEeqH6TtZuzkvvrpqG+hjnXsCAJuZrO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBugFAsbl1Z1YN06iIxeqZKepgMhnsRSSNRKkWc+1+s=;
 b=qsINYtHh/8n1v0fgUAr3tlHuSnaEYyfjxghuP9SFweajq+Z3Ak5wm882YMC37Pb+MohYJlIxqHid4CAkyp7AXPzGcKWRwoH9RtEp+1sNBBGq0DaLrC/50Pj7o0pI/eWH6Ls5b6VaubZhcplge1dcqK30eyzjMXrx8tpa42MX/DfmtNgz1WyKp+O734txuAZyoqHHLN7sgqUQV+xPj0P1OF3nEL5PZmbVArCePf/fzSIY0u0KtRpHQZ00oZJ6lG4Ski+OKJ9dl8KxUVVrOcUCWUKDicTdEXXIbH2tKbY6mud5y1+EpR2JDZzpsf6mgApoi3mlS88GYNXPwm3gMmUH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 10:22:52 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 10:22:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 09/14] drm/i915/histogram: Hook i915 histogram with drm
 histogram
Thread-Topic: [PATCH v8 09/14] drm/i915/histogram: Hook i915 histogram with
 drm histogram
Thread-Index: AQHbcZ6j9Bz6JhNJg0q2wuPvCPB4ebNGsVtw
Date: Fri, 14 Feb 2025 10:22:52 +0000
Message-ID: <SN7PR11MB67507D37A9325E7DDC4D72B2E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-9-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-9-871b94d777f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ1PR11MB6179:EE_
x-ms-office365-filtering-correlation-id: 3d55bac6-f737-46c9-0b78-08dd4ce189e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TmhwK1lXQ0NtM3cyaS93T2hzT3ZjbVQ2UHZGN1FmWGZlN0dNYzkvRUpubDJE?=
 =?utf-8?B?QVRYNFpIWjNDYnE1YTAwWmNqR3FybnhrQkkvWGtUSlp1Wi9aUFdBdk5IeTRV?=
 =?utf-8?B?dnNQcEJPamVXY01QSHFSS1NZYkN5aGpaMU1PcHA0ZTkwMUJyMm5YMGJJK0Z1?=
 =?utf-8?B?dzB2c1lYTGFDTFBwYVJDUVNKTWxWeDVWUGFMZ3haVGJ3WG5LSG1HcUJpN2Zn?=
 =?utf-8?B?bkVFS3pZV0N2SVN3SEd5ZkZaM0Q0SVRyZWFqbENMYU56cWhxR1JYUXVNOFhu?=
 =?utf-8?B?aGxFS051TERkMjl1ZDJ2OUJTSTM0Q0laSDVkNTI5ZDk1cW84SWlab2JxbWlZ?=
 =?utf-8?B?Q1RLYmdqYTF3bHdab2pEQ3hUQ3k1a0gydDVaUExVcUN3b3RhRHVmTEtMSGZF?=
 =?utf-8?B?NW53Y2Y3ckFFU2lhOVRjbklIN3IyRU44UjhZRnlYZ1FDNTg2S3Bmd3hjcDFW?=
 =?utf-8?B?L0NZbExrVzl4SkN1dXpKRFJkUWpvK0N6dng5aEgvejBpalVtWElBeXBQQmZy?=
 =?utf-8?B?b2VYdTZabjAvc05BUjZ1WlVSeDg0M1hGV1dLQ0cxcndwdmhiZjJ4Qzk4U0RD?=
 =?utf-8?B?cm9rLy9hV1lXMHFvUkJDdzdDSjU5dDNmV3BaMDBkZElrRXFYNW41REJsL3NQ?=
 =?utf-8?B?aEdyclIwTlEvTit1d1llb1NXWDZLdWI1emRmczBxWEhnV1dGRE8xRkZ2T2lS?=
 =?utf-8?B?ZjBtVjQ0OXFJdktRN0JGL1NiL0xkcWVIcjJwWnVoMTh0OU9YN1dWajUzNDJ3?=
 =?utf-8?B?c1Z6RHVjQmErOFBqVDNaTjhSRXQ5QzlVQWc3ZXRYMlBISExQeUhYLzRDSXdI?=
 =?utf-8?B?d0EwYzIrM3o0aWI1WWMxcXNLdlFxMG9GMkc1TVdBWHhYOG1hOEFoeXNwMXhV?=
 =?utf-8?B?REFoZFhoV1ZyKzZWVE1PUUVNYThYZUFzMURERTBVK1M1b2tPSDBYUFZ4UHdy?=
 =?utf-8?B?bzRNbnZtTFVnNVFFUFJlU1oyYUY2blh5SlI5SHpDaW5GcVhGMjgwc25ic3dJ?=
 =?utf-8?B?NjFMcW5JaGhBNkpGczU4YVdWdSt2cUpWeEdDc1gwTTJydWlaQlAxbnFmYisx?=
 =?utf-8?B?MUVCQnYvQXZhWHdXdFhNaThpK2J0OXlEZVVYM0w2bnkwVCtzMWNkWkZhMXBj?=
 =?utf-8?B?V2o4U0dUYSt1VzVKMlU4SVRMVjBKV2Raa2haVjlRekY2WDJILzNwL3Ntazlz?=
 =?utf-8?B?ZHlCamZJZlVqWlV4TjFBeW5HNTdpQTI1cjdiTHJ3MTZINGxMSjRiYmh5dHRv?=
 =?utf-8?B?ZXMzSU5wU3lmc3hJVzhPQ20wTHN5QnVVbUdtTVBlcHdOK0tMdU5RdVJPelJy?=
 =?utf-8?B?TmhxUHQrYlh0ZU11cHhwTmNRWU9ia2M4N3dBMXNDdmMxdmZOTk1IbURPSkI4?=
 =?utf-8?B?NE5nY0NyYlFZZjJYczI0MW9xc1JOSlpPQzZUV0J0QU9YbHZCY08yNnJ1dnBn?=
 =?utf-8?B?VFh3d1ppUzFKR01oVy8yVEl6RFozL2VJdXVoNUdPY2poOGh4WHhaNXU5Q25a?=
 =?utf-8?B?akhpcGhKeFhaalhxYnlvdTZWUnFBNWtlcVhOa2xiSENwQUh0NkJXdWUvSUE5?=
 =?utf-8?B?eTFQS1pLVHZ0NzdHdGxnSXA1U3dmdnBBY2FWUnB2OGRKWEcxZlZiM2ZmdGxY?=
 =?utf-8?B?UCtGbFJhWDFuei9FYmFWN21BdU1wcEJMWVlyazMxcjlNM0lUUU5oVCt4MkJT?=
 =?utf-8?B?NTRURVBldXdrbkdodkJwSkFpTWJhQy82RDZKbnBVNEdkcFhoR1dGOWVLL01z?=
 =?utf-8?B?alJxZ1VXMXZDRDhmVHpOaE1EZHg2UmZ2YjRZY0F2a0lvY3RWV0lQZ0toVlcx?=
 =?utf-8?B?eEhOdkV3UklOSitVN1diM21Ed3hvd3k5NTFQUkxnQmJjY1JwMWpGVmwxeDEr?=
 =?utf-8?B?MWRKVm5BZzF2WndDTmt6Z3YzakNQZWFhNGJEZlIzb1BtNGhPYzZCR3BTUG02?=
 =?utf-8?Q?eb4JkeXwVgluOlDoEkR3DRZGfFs/006s?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3pjcG5KbVowcWw1QUNXOU51R0M4bWVvd3l1MlNlanBXSlJPWEFVMjcxMUFj?=
 =?utf-8?B?T1MvUElDSGpSaXc2QnUwemg4Zno5a3dveUFqMnVjbHJROHljU20vMjhpaUVH?=
 =?utf-8?B?ODhSUy9IVVA0T01NN3ZlMjkraGpoRHZCbHpKOG80UXEzeUM5RGtkZFRZVjRR?=
 =?utf-8?B?Nm1rV1NvSnFoTUNGNGRqSXpnMWMxcnFvZlJBaHlER2ZoaVZSQ0Z3OExmV1N3?=
 =?utf-8?B?d01LSHdLR2poaVpBTm9relRlMzF1V2Zyd1Bpd3Z1MFpkYkVuZy8xcUg0MDgx?=
 =?utf-8?B?Y0RkZWVVVkF4OTU4WUVaeGphbjJKb3BEcEJYVW92MktabTVJZThSRXdXSi9Q?=
 =?utf-8?B?aTJRVEQxZk9BRnU5NHd5SlA1L1A3L2JkUEtxRldoR3d6TXNEZ0dveHY3S0Yy?=
 =?utf-8?B?empTMm9IL0s4RUFzbGZRQk9UMkFocFB3UVdhTFFPREhqVlQ0Z2Q1cTBaVDNH?=
 =?utf-8?B?SHJTYWpMRy9ubklic3V0VUJEYVNlK3Q4YnI4aHM1eHA0K2kxOXlpdkdnTjhp?=
 =?utf-8?B?bUFSOEFkK1pSYlNOQ3FWVCtXaDBBVjlkclNDZTA4d1AvdWM4OGo2Y3J6cHVT?=
 =?utf-8?B?Vnp0QVVlVGk3STJOS2xiZmZ1QTlCMG9SRjNnTG9ISm9lU1h1N0JPdWlQOEh2?=
 =?utf-8?B?UDdZcnVhZTRiRm1hdmVtaG5rM1VTNFNFNkdXNWM5dit5Z1d4VXlRaTRaZFdO?=
 =?utf-8?B?eXYxeXBhdjNlQTlQV1c0cmVQTDhOcEQ4UkF1T2tLNS81bGpiS3NUU2IrYXFn?=
 =?utf-8?B?N25KQ2JIQXdyMXhEREJwWFd1Y0hVb2xHbkg4TGR4LzQzcEpNRlV6bEhydUFF?=
 =?utf-8?B?bGltL05pbnJ6bk84eld3SzRZOVJUZXhDaEZFU0NEeHJudFNhWWNOTXFJWnQ4?=
 =?utf-8?B?VFIwdXJrSmJPMVJhV3BRVkV4NXh1ekRLSG9obEc4cDR1K3grQ0dWQlFBdTg4?=
 =?utf-8?B?S0VxakpjZk9qekpkVjZGeFpZS2xNUmt5ZGZNMUVlbWFta1VoZVk3LzFONFlR?=
 =?utf-8?B?QjFDT0lQS0kvRWo1MmhjSUV2SDlTRXpVdGdDV2dSa1FEZ05jWXI1b1FtaHJy?=
 =?utf-8?B?dzdhUjEvSHRmeUtJT3p5b0dGdlNackF5T1Nlc052K1pQMlowL2FmMkZ4M1N5?=
 =?utf-8?B?aHhxbVlMbzBXa0NHdnNmeStCTHNwaXhGOGxpUUVCeWxtTjVpUEt4S2I4aEo2?=
 =?utf-8?B?N20rV1ptbm1qblorc0JuR1BuUGgzNjdWNTM1V3RRVENoeE8waU1uT3kxbVNP?=
 =?utf-8?B?OXR3THl1YW5rWXdvYnlENC9hWVg2YzVZRFduTU5IWGN5S0VCUWZEMklmSXNx?=
 =?utf-8?B?bzhBcXF2NC9zanV5ZkZ2bHNDK1Q0TnlPbURnSGorWTNQUCt0Y2srMEpCbVIx?=
 =?utf-8?B?bm9lZ3B4V293dlRyVThWc1hFYUhqRUR6VUZpejN2aFZldUk3WjV0M2EyK1pP?=
 =?utf-8?B?Z1lqVmt6V3dWcWJ2VDJIcFI3a1crZWQ4N0w4bkRmcFVsWlRjUFFRRWZGWG82?=
 =?utf-8?B?em03NDM0QmFmclBTbnpBa2VQbXAyeStLU0pJUVNjd3VWd3FYNVdLblY2cGZi?=
 =?utf-8?B?L2pJZVE5MGFYazhkcUtrRVFlbDdCTXc4bjVjMkV2bEdhZ2dVT1FiVjJFSDJa?=
 =?utf-8?B?MVNwZ2ZJbWZpQmZ1eWtTdUwyTER6TmhFZ3JabmloOTNyN0pVZld6TE5WRkdZ?=
 =?utf-8?B?VEcvdUVtRHFGK1A0ZFBPQ2dVdS9wcnVDQzZsSldIcWJHNmNvYUFpaGJuem5H?=
 =?utf-8?B?ZlN0M2dMNlByQkZ4emtpc1R0NWFRZTlZaHUwSXRTZEFHN1BxV1dVNk1qVjRD?=
 =?utf-8?B?T2Y5UDJ4QTZNcGVEOWprQWFDUFRVUXJsNzRacDNYdjd4Q0ZHOUhIM1EwTksr?=
 =?utf-8?B?dkhJV0IyTXQ1ejZFR0VUdXRDSXB1UFlWZE5HdlAyeXIxcHJQRWEwLzBvQjZ2?=
 =?utf-8?B?Tk5uWXlnaEFQQ2lsSWFvZW9oU3hoWXNkT0trQVlKaXJSV3VWRi9oSnBoK2RQ?=
 =?utf-8?B?R2p4dFNuV2RuaFM2QnlzR2hCNmxFSVhJTVQybWNtek54Y2Z6cEtBY0pjWWRR?=
 =?utf-8?B?M24vMVYyMUJqTlhnTDBNeFFUdk1nU0YyUUZ4VzNESnhuRWdXQmRyOU1vdk0r?=
 =?utf-8?Q?iQcl0IOBp9SHDwCPTE8KjBzCs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d55bac6-f737-46c9-0b78-08dd4ce189e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:22:52.1483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntoaYmNTO121ffIzRfnvj53f1XSE9Ze2zfyUp71LfOwSD9DIHgxPIa2Uj2rvonur8wNillPgL0c4nSPIgnQ5HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4LCAy
MDI1IDk6MjEgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gQ2M6IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47IGRt
aXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsNCj4gTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggMDkvMTRdIGRybS9pOTE1L2hpc3Rv
Z3JhbTogSG9vayBpOTE1IGhpc3RvZ3JhbSB3aXRoIGRybQ0KPiBoaXN0b2dyYW0NCj4gDQo+IEhh
bmRsZSBoaXN0b2dyYW0gY2FwcyBhbmQgaGlzdG9ncmFtIGNvbmZpZyBwcm9wZXJ0eSBpbiBpOTE1
IGRyaXZlci4gRmlsbCB0aGUNCj4gaGlzdG9ncmFtIGhhcmR3YXJlIGNhcGFiaWxpdHkgYW5kIGFj
dCB1cG9uIHRoZSBoaXN0b2dyYW0gY29uZmlnIHByb3BlcnR5IHRvDQo+IGVuYWJsZS9kaXNhYmxl
IGhpc3RvZ3JhbSBpbiBpOTE1Lg0KDQpOZWVkIHRvIGZpeCBjb21tZW50IGl0cyBub3QganVzdCBm
b3IgaTkxNSBidXQgeGUgYXMgd2VsbC4NCk90aGVyd2lzZSBMR1RNLA0KUmV2aWV3ZWQtYnk6IFN1
cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydGMuYyAgICB8ICA3ICsrKysrKysN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMTIgKysr
KysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydGMuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0Yy5jDQo+IGluZGV4DQo+IGU2
OWIyODc3OWFjNTUxYmRlNTZjOWMzZDM5NGU3ODQyNzVhOWI2OWUuLmI5MDAxNzQwOWEyM2RlMmEy
MTRjYTQzZA0KPiAzMmJhNTM3OTk4ZWEwZjc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2NydGMuYw0KPiBAQCAtMjgsNiArMjgsNyBAQA0KPiAgI2luY2x1ZGUg
ImludGVsX2RycnMuaCINCj4gICNpbmNsdWRlICJpbnRlbF9kc2kuaCINCj4gICNpbmNsdWRlICJp
bnRlbF9maWZvX3VuZGVycnVuLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfaGlzdG9ncmFtLmgiDQo+
ICAjaW5jbHVkZSAiaW50ZWxfcGlwZV9jcmMuaCINCj4gICNpbmNsdWRlICJpbnRlbF9wc3IuaCIN
Cj4gICNpbmNsdWRlICJpbnRlbF9zcHJpdGUuaCINCj4gQEAgLTIxMSw2ICsyMTIsNyBAQCBzdGF0
aWMgc3RydWN0IGludGVsX2NydGMgKmludGVsX2NydGNfYWxsb2Modm9pZCkgIHN0YXRpYw0KPiB2
b2lkIGludGVsX2NydGNfZnJlZShzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykgIHsNCj4gIAlpbnRl
bF9jcnRjX2Rlc3Ryb3lfc3RhdGUoJmNydGMtPmJhc2UsIGNydGMtPmJhc2Uuc3RhdGUpOw0KPiAr
CWludGVsX2hpc3RvZ3JhbV9maW5pc2goY3J0Yyk7DQo+ICAJa2ZyZWUoY3J0Yyk7DQo+ICB9DQo+
IA0KPiBAQCAtMzgxLDYgKzM4MywxMSBAQCBpbnQgaW50ZWxfY3J0Y19pbml0KHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICpkZXZfcHJpdiwNCj4gZW51bSBwaXBlIHBpcGUpDQo+IA0KPiAJQklUKERS
TV9TQ0FMSU5HX0ZJTFRFUl9ERUZBVUxUKSB8DQo+IA0KPiAJQklUKERSTV9TQ0FMSU5HX0ZJTFRF
Ul9ORUFSRVNUX05FSUdIQk9SKSk7DQo+IA0KPiArCWludGVsX2hpc3RvZ3JhbV9pbml0KGNydGMp
Ow0KPiArCWlmIChkcm1fY3J0Y19jcmVhdGVfaGlzdG9ncmFtX3Byb3BlcnR5KCZjcnRjLT5iYXNl
LA0KPiArCQkJCQkgICAgICAgY3J0Yy0+aGlzdG9ncmFtLT5jYXBzKSkNCj4gKwkJZHJtX2Vycigm
ZGV2X3ByaXYtPmRybSwgIkZhaWxlZCB0byBpbml0aWFsaXplIGhpc3RvZ3JhbQ0KPiArcHJvcGVy
dGllc1xuIik7DQo+ICsNCj4gIAlpbnRlbF9jb2xvcl9jcnRjX2luaXQoY3J0Yyk7DQo+ICAJaW50
ZWxfZHJyc19jcnRjX2luaXQoY3J0Yyk7DQo+ICAJaW50ZWxfY3J0Y19jcmNfaW5pdChjcnRjKTsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4g
aW5kZXgNCj4gN2Q2OGQ2NTJjMWJjOTFhY2M2ODI4MWM0NzYxZjY4OGYzNzc5YmQ3OS4uYzM4YTMz
ZWU5MGFlZjE0NDkzMTIxNTI1NGYNCj4gMTc4YmE5NTVmOTk4YjAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IEBAIC05Myw2ICs5Myw3
IEBADQo+ICAjaW5jbHVkZSAiaW50ZWxfZmlmb191bmRlcnJ1bi5oIg0KPiAgI2luY2x1ZGUgImlu
dGVsX2Zyb250YnVmZmVyLmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfaGRtaS5oIg0KPiArI2luY2x1
ZGUgImludGVsX2hpc3RvZ3JhbS5oIg0KPiAgI2luY2x1ZGUgImludGVsX2hvdHBsdWcuaCINCj4g
ICNpbmNsdWRlICJpbnRlbF9saW5rX2J3LmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfbHZkcy5oIg0K
PiBAQCAtNDY3NSw2ICs0Njc2LDEyIEBAIHN0YXRpYyBpbnQgaW50ZWxfY3J0Y19hdG9taWNfY2hl
Y2soc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJaWYgKHJldCkNCj4g
IAkJcmV0dXJuIHJldDsNCj4gDQo+ICsJaWYgKGNydGNfc3RhdGUtPnVhcGkuaGlzdG9ncmFtX3Vw
ZGF0ZWQpIHsNCj4gKwkJcmV0ID0gaW50ZWxfaGlzdG9ncmFtX2F0b21pY19jaGVjayhjcnRjKTsN
Cj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+ICAJcmV0dXJu
IDA7DQo+ICB9DQo+IA0KPiBAQCAtNzkzMyw2ICs3OTQwLDExIEBAIHN0YXRpYyB2b2lkIGludGVs
X2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSkN
Cj4gIAkJICovDQo+ICAJCW9sZF9jcnRjX3N0YXRlLT5kc2JfY29sb3JfdmJsYW5rID0NCj4gZmV0
Y2hfYW5kX3plcm8oJm5ld19jcnRjX3N0YXRlLT5kc2JfY29sb3JfdmJsYW5rKTsNCj4gIAkJb2xk
X2NydGNfc3RhdGUtPmRzYl9jb21taXQgPQ0KPiBmZXRjaF9hbmRfemVybygmbmV3X2NydGNfc3Rh
dGUtPmRzYl9jb21taXQpOw0KPiArDQo+ICsJCWlmIChuZXdfY3J0Y19zdGF0ZS0+dWFwaS5oaXN0
b2dyYW1fdXBkYXRlZCkNCj4gKwkJCWludGVsX2hpc3RvZ3JhbV91cGRhdGUoY3J0YywNCj4gKwkJ
CQkJICAgICAgIChzdHJ1Y3QgZHJtX2hpc3RvZ3JhbV9jb25maWcgKikNCj4gKwkJCQkJICAgICAg
IG5ld19jcnRjX3N0YXRlLQ0KPiA+dWFwaS5oaXN0b2dyYW1fZW5hYmxlLT5kYXRhKTsNCj4gIAl9
DQo+IA0KPiAgCS8qIFVuZGVycnVucyBkb24ndCBhbHdheXMgcmFpc2UgaW50ZXJydXB0cywgc28g
Y2hlY2sgbWFudWFsbHkgKi8NCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
