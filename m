Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98A4ABFFC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799FA10E423;
	Mon,  7 Feb 2022 13:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F6A10E2EC;
 Mon,  7 Feb 2022 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644241782; x=1675777782;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding;
 bh=Kj7VQlYssEzKOi33O4UdxPJUhb3FadklxW29cWpEBX0=;
 b=his1SWOqR4yvWJ0Udc0HhxzoKgJhAJSbaT0ihrdnc9ULKUspMPh2Na8R
 xxHCmcNBfAah/SUWKXGhJ7bFsdTVUQFcpebot8p23ECdVEdFbKqLmM39M
 Z5yFByYEJ+80XqFQMTp8geThMaWV/B+ekKZrl+v9192Mr4TE0teQ+GazG
 K9pbpYxjdh+0N5N9EBxfVr0VkI5dfPFFLy8zO7jrdytyetx52nHMHT+f3
 VzM1KQ2HCpDgkTlh+ZxyB6Wkdx77VSvqdVsHtM4t/U9EybuplhQqxD96q
 xr2Nh0wp/NZ7cJHuikdi64ZRjudyVDercsCc7OchrUYvTM4WLHpdvNUGn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248666375"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248666375"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="567482383"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 07 Feb 2022 05:49:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 05:49:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 05:49:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 05:49:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 05:49:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWwi7sW6/2VZ9L98xe3lMccyzNFYvCBCzIrjKwoXQ1mihU0SSVIJVGKga8+jwXdpOeWr2pzO+HfmOx0NvjeWCJaUimCB9ySI3buBRHybfHIsg1/Sqa4vzq6TG/T4FTrLUUo6N6dvLTKxMdgW0Vj8uXN2d0RAb08hIICkCWM/39BJy31ha7B8I3TY0JG0/RJjzO8Xx1W6eBfS32rL7eXcxMu7QrIBtGm9k5UwGidh+Qp1WYVlF7+vf82PuReaQnmjvD+N9rIT5CrzZyzhsh2h714RwM9t5AQGnwHWB0fPNXszraSrRFXU8rf/OC8OXarVTAPFk18ry+a6US2Ry2o4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clc3wuYggWwN+xeW04ar8laVXoHMOGwu4VLbMLWmIUs=;
 b=hPB+t3V0K5KHcLFLE0sgRZaf2q/LLit35sc2/VXtttlLkhO2CePofKZA2zGGGB72y9wn+BAPwOreppOIzeI43R73LPFE51DGUNb6BipEy0vhR7R4tCB0ln+TPrmoqsVqw90BG9pZ2SME0AE+SrH0qZ+NqzznP2wpgzBih73w0HqX9rcaBf/GKnKbloXQeIL6ucKWZy3JOqkTNuYWxRRGEVc9976ZEt1f3q0gbKlwtWhY24qjEBGusvSS1HMPX5Ekfi8wXFkPKo5IeFwvv+xVFGICP0H3bS83MLbWyoMcRuOJAz/VLJ2y1BYqBTIYRxZ3ozDPEl85nDhqwj7sUGsk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 13:49:35 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462%5]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 13:49:35 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "C, Ramalingam"
 <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Thread-Topic: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Thread-Index: AQHYHAZeTcHj2cn+4E6fHwjPb8Tmu6yH92GAgAAjpIA=
Date: Mon, 7 Feb 2022 13:49:35 +0000
Message-ID: <beab72d62fcc5909fbdf736fe02dc10bbe895d4d.camel@intel.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
In-Reply-To: <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d68a267d-7d4b-412f-e4af-08d9ea40ad45
x-ms-traffictypediagnostic: MN2PR11MB4613:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4613178173505500E8F67EE7972C9@MN2PR11MB4613.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NCyc8ZsF+QMv8k/UY+RtlZUCWCm2W1u4iTPgj3/7zsFltwR3P50nM040pHRhpmF/rwNBRvKiU7vm4FfB9eQOd+ZZ44B45x5/T38F/GBvByeuNfFFI4WzCpkAchBtj0JcMJOFDDrToJSDtRLYk+QSD93Ci8hAOJNn1l9t9xk8kWw04Mxc6V3xEWWhFR8foN2vwlKTC77U6nmVF8rG9lEX+oljhEeWboagqpsX2Aj0nYbeY2v5zJkqQE8xmYNR3pqyduTBRzB3wcksCY2ycYz1+hQrW4klG8O5WnyTdDBJ2fp2NDgXW5DGs9ealublb9aLOn0ZYI0E4x7oDezL6UwFPe2i6nujVrmqiYI8LRWcyaOmcQldXVDs0fXP1rP7kf6XmsRzmunLLLZnjh/tnJDYz1Rg5UylymZ/RQ2jxKio73ufjVjymwW7SGhq9ZrgNnuJjqYmkQyhUcRURBANBNeQUo3eJV55V7u8quxUL6Sa53+cFxt8/PpxPiEHsMZBWKNwvO/kOXGj2jU5K387uCD7lXPSVBuhQUGhISwVWA+eYsVuzDcBFPwwwgg9vHUClMDzapuSvwDPIaUsM+1sSm5ciW6Pw07N+3Jn5Ku7kmNkSQcycQUjDal12VlTLQRXeohGnkY1e1Mry9VS/RADmMgQCD6ejxGbU1OQnGyS+mXg2qwco7M4K1P9yrzO5wYa4uCjahrHTuh/+yi+a+q9Nej4vQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(186003)(26005)(2906002)(8676002)(8936002)(64756008)(66446008)(66476007)(66946007)(66556008)(66574015)(86362001)(91956017)(83380400001)(76116006)(71200400001)(110136005)(82960400001)(36756003)(6506007)(6512007)(38100700002)(5660300002)(122000001)(2616005)(508600001)(316002)(966005)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXA5YUszM2V3Zm1oZmhnREx1dElJcWszbm5Xd1RwTm9tRnlMNDBqL0dnYU04?=
 =?utf-8?B?SUhZb1AvWVdNU1BJdEtXWUYrcWJKaUZjT3FvYWk2T1FrM2FodVF4UUIzTU9J?=
 =?utf-8?B?UGFTajNMUGV5dmVVdzNCR09sRDZURUJKcUh6Tk02SmRRZCtyUGZnMFJlT2NP?=
 =?utf-8?B?dm9XSVprbjMrd0hpZXBWTytCWnI3aVBOSDFubEpSK1lCdERURnl6bXV3RjJC?=
 =?utf-8?B?RGlMbDVpNUovN2lzdmwvV2xSZHZ2ZnByc3E0MGl3S1RQT1pReURKVzZWbWEw?=
 =?utf-8?B?SU1GTmM0RGRoZ3RkMWU4aStBd0RUTjlwQXJ5cW9LaCt3dms2Y2FHRkJQbFFV?=
 =?utf-8?B?VnRRRUR1dGNRc1RiK1ZVVk52WTl3cFREcjA0REVHbmNJN2lScHovQkFaMXJK?=
 =?utf-8?B?WjQ5VDlWN25SMUpFNkVSU0dRN2hoYktWYlpjSy84SW1pSXFQbmNpL3h0Yk5o?=
 =?utf-8?B?V1RJRFBKY1RDWENaTFM0YW9rbENrZXJ1UE0vRFJVWE5BQlhIZWRzV3NGR2J3?=
 =?utf-8?B?QjVlaUFRYU1taW9lQVRWamVGTnc2VW1EOC81Mkx5T0JWR2RCU1NiTWI2T3NG?=
 =?utf-8?B?RUtabDQ0a3MzOTZWZHduTkRCNGRpU0ZuVTJBYnNvUWVRdTZKdE5DdXQ0dWpa?=
 =?utf-8?B?YTFqanhMVXpyVi9TOXZnWC9KNzNhYkdKcXNSeHNZYUp6NWdsMWZFRzNFSEM3?=
 =?utf-8?B?dUxtdFFTYWtOSDlIU0ltekhyMjZodmZmMGF3OGVEMzRNY2dXb2FjWHpEbk1s?=
 =?utf-8?B?cXFXUm8zdmxicDdBazEyd05YdU9YYk10aGZmOW0rUDBudHNiUDBFaVZ6SllJ?=
 =?utf-8?B?M1VndHdDcXZOcDZ2NGcyMHF2NVQyMFU5d1R3NzVIQ0xxdk9yYkRXTWdEdklW?=
 =?utf-8?B?a0ZLNEZGMUVvWmhQWks0ZjNwRFBiRWpBclN3VVVaWjNuVjRzWFBPYW9xeFNZ?=
 =?utf-8?B?dUZCTnBwUjM4Z1BQZWFKdmRBbjdiYmU2WjVSMXUwdEZRcjROcy9QNHI1eHo4?=
 =?utf-8?B?aW0vSGNkQXA3ZDFMaEtGWmJ4eWRDQS8xNU80ajFMNkVhbGlZaG9VY2pZYXFp?=
 =?utf-8?B?KzJjZStrYUE2cEtrYTVyZS9RKzRGcjI5OGRsdC9xdFVtOEZ4VFBreS9XQTZD?=
 =?utf-8?B?eHhRZXJuVnpzeXJub0szZDRTd1lmS3dPVEFIRFJCYU15SUE4RzhBTVhKMm5p?=
 =?utf-8?B?Y05tYWFpRjljcVl1ZXJlUFF5QThFYi9takJQUElIY2VuTlBJd3FUOVc0Tm1T?=
 =?utf-8?B?VU9UMDVSV2NGb2pzc2FzNjRKdG42dFovV0M1TVJGS1R2M3dtWVkyaVNmM2Zp?=
 =?utf-8?B?ZlhKWk43LytRbVBYNW5EajdzcTAyTFM2Zi9sRm1qN2p3djZ0UkNoakxrcGVN?=
 =?utf-8?B?VXpwSzRsWVZqL1Nzb2V0S0taaEVJRlg5MXp6L1RBQXNMcjZrZk1UaVBpWEpF?=
 =?utf-8?B?VTBQcXZNazdrYmkvUXdVZGd0ZU9KYWRQLzBiNVpoRGlWcTRtY1ZzYjBWdnB5?=
 =?utf-8?B?clFobVdPTUdGSlRXUnZzSXMvQWoyeWJMdWgzS1VSNTB4Qi8zbUxHTTlLRmR0?=
 =?utf-8?B?UDZsRzMyT0k3bkUwbHZsWVBhQmNlcy9NUlpCNzhpc0VsQzZwNjdzWUlvK2hv?=
 =?utf-8?B?WjFCNlNCcXh6dHpldVlWbWFFOUdhTXQzNmhTWmdGNW5qQ0FTQXVqeFZDYzhj?=
 =?utf-8?B?SVRBYXpMaEtPMEs2c2ZqVXZEdnhNUGhlOHk0TnUwenZldmJyTXV6dWo0VHFy?=
 =?utf-8?B?MkZTOWdXaUpRbGoycUwzOVYyVmRPRVN6QnF6RjJFZ0xFUnJuakRFT2hXRzdl?=
 =?utf-8?B?bWc2aXVkUmFvTnluVWsxTGlCMUFJU3dOZmtlOStqbzJNZkZuVmlWRkYrQVE4?=
 =?utf-8?B?Vi9HWmNqVUZ4d0VzNk04dmxvVTBPNGRIUVJndWdsUlBkWFQ3OFZLWGp6Ujhp?=
 =?utf-8?B?M2FXbW5lZTFLR0p3WXQwNDg3K0dDSitlRXdtWEFVbFFmUGE1d3lYdUFCK2x3?=
 =?utf-8?B?OE5vUHJOSVJVTy91RHRJQmdSOTYzRDRITEJ2b0R4RUREOWFidGZ5ZjlTV1hM?=
 =?utf-8?B?YllYWG5tWUFOUUViblMvYmg5OU9WR21QM2szVTdKSGUrNEtOWHJ5eWQvZDRr?=
 =?utf-8?B?R0dKV1J4dHJVaDAwc0gzN21xaWgwMjRrNmJISjYybmZQL0YvRW5aZ2ozTy9E?=
 =?utf-8?B?TnJTejM3ZGhXcWRUSndsT2Q1dTRKd0lVZkRodXNrQmgyNDQyK05iMXVkL1Vi?=
 =?utf-8?Q?QGAEtOH3/twkReTgMUDb/Mi1lSg5WrpEsB04a19jp4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEAD9EF4F260FC4DA9965AA0017244EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68a267d-7d4b-412f-e4af-08d9ea40ad45
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:49:35.4387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acF364GrIeBq1A7AQ2EtGOGpf3b2+ERXxWO/eU/1vttCU8mLaq7oEz43/JMrv2ETUeM37ziUEPujsvPzt/Jp/Jt+1zAhTOUPj6XpvMhd+PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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

SGksIENocmlzdGlhbiwNCg0KT24gTW9uLCAyMDIyLTAyLTA3IGF0IDEyOjQxICswMTAwLCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBBbSAwNy4wMi4yMiB1bSAxMDozNyBzY2hyaWViIFJhbWFs
aW5nYW0gQzoNCj4gPiBPbiBmbGF0LWNjcyBjYXBhYmxlIHBsYXRmb3JtIHdlIG5lZWQgdG8gZXZp
Y3QgYW5kIHJlc29yZSB0aGUgY2NzIGRhdGENCj4gPiBhbG9uZyB3aXRoIHRoZSBjb3JyZXNwb25k
aW5nIG1haW4gbWVtb3J5Lg0KPiA+IA0KPiA+IFRoaXMgY2NzIGRhdGEgY2FuIG9ubHkgYmUgYWNj
ZXNzIHRocm91Z2ggQkxUIGVuZ2luZSB0aHJvdWdoIGEgc3BlY2lhbA0KPiA+IGNtZCAoICkNCj4g
PiANCj4gPiBUbyBzdXBwb3J0IGFib3ZlIHJlcXVpcmVtZW50IG9mIGZsYXQtY2NzIGVuYWJsZWQg
aTkxNSBwbGF0Zm9ybXMgdGhpcw0KPiA+IHNlcmllcyBhZGRzIG5ldyBwYXJhbSBjYWxsZWQgY2Nz
X3BhZ2VzX25lZWRlZCB0byB0aGUgdHRtX3R0X2luaXQoKSwNCj4gPiB0byBpbmNyZWFzZSB0aGUg
dHRtX3R0LT5udW1fcGFnZXMgb2Ygc3lzdGVtIG1lbW9yeSB3aGVuIHRoZSBvYmogaGFzDQo+ID4g
dGhlDQo+ID4gbG1lbSBwbGFjZW1lbnQgcG9zc2liaWxpdHkuDQo+IA0KPiBXZWxsIHF1ZXN0aW9u
IGlzIHdoeSBpc24ndCB0aGUgYnVmZmVyIG9iamVjdCBhbGxvY2F0ZWQgd2l0aCB0aGUgZXh0cmEN
Cj4gc3BhY2UgaW4gdGhlIGZpcnN0IHBsYWNlPw0KDQpUaGF0IHdhc3RlcyBwcmVjaW91cyBWUkFN
LiBUaGUgZXh0cmEgc3BhY2UgaXMgbmVlZGVkIG9ubHkgd2hlbiB0aGUgYm8NCmlzIGV2aWN0ZWQu
DQoNCldlJ3ZlIGhhZCBhIHByZXZpb3VzIHNob3J0IGRpc3Vzc2lvbiBvbiB0aGlzIGhlcmU6DQpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMS1BdWd1
c3QvMzIxMTYxLmh0bWwNCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KPiANCj4gUmVnYXJkcywNCj4g
Q2hyaXN0aWFuLg0KPiANCj4gPiANCj4gPiBUaGlzIHdpbGwgYmUgb24gdG9wIG9mIHRoZSBmbGF0
LWNjcyBlbmFibGluZyBzZXJpZXMNCj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzk1Njg2Lw0KPiA+IA0KPiA+IEZvciBtb3JlIGFib3V0IGZsYXQtY2NzIGZlYXR1
cmUgcGxlYXNlIGhhdmUgYSBsb29rIGF0DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoLzQ3MTc3Ny8/c2VyaWVzPTk1Njg2JnJldj01DQo+ID4gDQo+ID4gVGVzdGlu
ZyBvZiB0aGUgc2VyaWVzIGlzIFdJUCBhbmQgbG9va2luZyBmb3J3YXJkIGZvciB0aGUgZWFybHkg
cmV2aWV3DQo+ID4gb24NCj4gPiB0aGUgYW1lbmRtZW50IHRvIHR0bV90dF9pbml0IGFuZCB0aGUg
YXBwcm9hY2guDQo+ID4gDQo+ID4gUmFtYWxpbmdhbSBDICgyKToNCj4gPiDCoMKgIGRybS9pOTE1
L3R0bTogQWRkIGV4dHJhIHBhZ2VzIGZvciBoYW5kbGluZyBjY3MgZGF0YQ0KPiA+IMKgwqAgZHJt
L2k5MTUvbWlncmF0ZTogRXZpY3QgYW5kIHJlc3RvcmUgdGhlIGNjcyBkYXRhDQo+ID4gDQo+ID4g
wqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuY8KgwqDCoMKgwqAgfMKgwqAg
MiArLQ0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uY8KgwqDC
oCB8wqAgMjMgKy0NCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRl
LmPCoMKgwqAgfCAyODMgKysrKysrKysrKystLS0tLS0tDQo+ID4gLS0tDQo+ID4gwqAgZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfdHRtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAy
ICstDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYWdwX2JhY2tlbmQuY8KgwqDCoMKg
wqAgfMKgwqAgMiArLQ0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArLQ0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyB8wqDCoCAyICstDQo+ID4gwqAgaW5jbHVkZS9kcm0v
dHRtL3R0bV90dC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQg
Ky0NCj4gPiDCoCA4IGZpbGVzIGNoYW5nZWQsIDE5MSBpbnNlcnRpb25zKCspLCAxMzkgZGVsZXRp
b25zKC0pDQo+ID4gDQo+IA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIFN3ZWRlbiBBQgpSZWdpc3Rl
cmVkIE9mZmljZTogSXNhZmpvcmRzZ2F0YW4gMzBCLCAxNjQgNDAgS2lzdGEsIFN0b2NraG9sbSwg
U3dlZGVuClJlZ2lzdHJhdGlvbiBOdW1iZXI6IDU1NjE4OS02MDI3CgpUaGlzIGUtbWFpbCBhbmQg
YW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhl
IHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlz
dHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5v
dCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBk
ZWxldGUgYWxsIGNvcGllcy4K

