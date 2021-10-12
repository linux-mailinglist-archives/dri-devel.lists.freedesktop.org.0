Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15542A177
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 11:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA75E6E82B;
	Tue, 12 Oct 2021 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7BC6E829;
 Tue, 12 Oct 2021 09:59:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="207214324"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="207214324"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 02:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="562564470"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Oct 2021 02:59:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 02:59:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 02:59:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 02:59:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 02:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCr5XkusxLE9GF97BSKmuFkkj+QCwCXrUXthOC+HAfs2aldYf0S7JfQP0ZovK8d0pjD+VZzCyTcvIta1a2YsHrvX2OQ8IkIVBZXxncUtaczbTDoLj5FZ/P+tlv0m8O2uSkpUdkOdwfObhb4b+sLUYZVjpuB4GsK724z1rzDV3e5O628Q0A4uGpqs6Rvvw2TZ+K0jTprYRQuh5RWVw4jTgmR78UzILzA5Z/5yBGirmTqE0BZIxTsW89PDpm47TdUzMV8QiFqhw1D/GxLtVfXp2RMMTbI2C4UQOgiTT+b9SR2h6fiTmznbLeZ0f+uRqzEqHgbOAE/t4HEMiGWgCocu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eZO3Wlzk3ICmQUAiu7xGWQ2E7ETpkSQ1ZTV6Mp51OM=;
 b=i3H4D6iIXeOYNWKiDS+6FNltlTEsaazXqSg+WcT1CKMANhQPA6WG9XqNMN0LY4/p5r+yxDt4d6AK/ewuz2ZwPoEThPb7dqLOrFh/QbAtozgESXwG7k4Sa/khenmiKg6eVR8nNRKE2UDT0hexkAeEzKlYjLVf8HlxgGVHHSipkUnmeXymV8jv5luN/RiEU2sLleYWahW2H+aqddk0OzyB4T+ySfSS8FtfSsK5GgcwZuET8rFxBIA8qf3MsgoCpyLwNVa1cr2ssg3oHxneheuBH6+8JiSxBjGsiWJhH3hDUL+kJLAFBfePMZOVw+5/K1X+uNC1iXgFcjqXrQxysGRfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eZO3Wlzk3ICmQUAiu7xGWQ2E7ETpkSQ1ZTV6Mp51OM=;
 b=WccvsqDaPDP2UcV9hKbLrtb1osvzFOLkNwN3VcnKG/O3fBnopfBgn8+hzdRK9J0G7gC+gqAalKk5lUlzQk1/74CsKzVaoVRwHL+j+Hv7+CXNRSM3d4vqKdK593/VuibkFT2o8QERPL17f5ZqflIm0MKBrc2gpj5gEJVSVr1Xq/s=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB4170.namprd11.prod.outlook.com (2603:10b6:5:19a::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Tue, 12 Oct 2021 09:59:24 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:59:24 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Nirmoy Das <nirmoy.das@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/5] drm/i915: check dri root before debugfs init
Thread-Topic: [PATCH 2/5] drm/i915: check dri root before debugfs init
Thread-Index: AQHXvCbKYMJcOSYSQkemEiRsja/2h6vPJ1yA
Date: Tue, 12 Oct 2021 09:59:24 +0000
Message-ID: <95bb9aa6-1e6e-c0da-64ed-30ac31f44b67@intel.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <20211008091704.27094-2-nirmoy.das@amd.com>
In-Reply-To: <20211008091704.27094-2-nirmoy.das@amd.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e21d2c49-1426-4b4f-afaa-08d98d66f87e
x-ms-traffictypediagnostic: DM6PR11MB4170:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB417003451F469BD68528F564CAB69@DM6PR11MB4170.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NPzcyDaEh586i+XHR8VBFP/H/1Tozk99HNEk3LAjbN+ooCB5zYbpp+r8aL6hek20z4UZM3XQydn2myB59cRK1gM6scIcL8q0gTHYyFts2ixWonXeE5bUxMDjUp8tF3EpicvIPvHx4x1cZ5w+wfBRwhEX8BfMD/VJOLnAZiUA8PEJg0zO9mIq96g0kqgAJkZMeiJqLYl44Ym08JWmK9VGhpPBD32r86/lkU5g1krlOfwA/PBFxXfB9K2BqqyrmxkL6QPABOV4Llt8st+zfiE8ecr5SGMIRiQTislPAWHKc3tUHWkPCklKBiD7y6OmEl8xXWTe07HkhEGmkzFUK381aOOoSkDY/XY2MG/nUwYDqzMQlhCRbAO7VSBPbEosDtnoPPb30xclc0iFc6uoshK7MUP9sDjP9CQtGJwhxiyiqspMjfgnPxCzzts5WPlPMHMq945kj+V+7s50Umcu9RX7FDH0sv4aZrijd8oIHTAnUl5Fjo5Xmkh3yaEoClWARf38y7SO8tsTtSnFhMc4IDix9pq9qQpZLtxahPORWhDVcOdgbhqvPA2e3LoJeUX6fTI41bV+Uo+TS/WDiuO/hLVA0YkWa3PsLdFYKWgVf9d4aHejLJoBaW0jhhUjLBocxdwevMCoeY8F97AYQKarZ9lDV2+3bp4agX4XDnr/64eJcpsTITmmP/xxwy4i44jNO7wG7emByyagmzbkwmuA3r3ZWkPlNPatSpi2uZI8HPw3/JyaMqcUjr/SDkezMd/3/ma97OX4rN6Fzb5yhTtfQJBLbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(64756008)(71200400001)(2616005)(36756003)(53546011)(508600001)(26005)(66446008)(186003)(6506007)(66946007)(76116006)(66476007)(4326008)(8936002)(91956017)(6486002)(66556008)(54906003)(31696002)(316002)(110136005)(38070700005)(5660300002)(86362001)(38100700002)(31686004)(2906002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tzg1UWZ5TDlQUmRoUGFrb1BKcDNYdk1WOXMxd1RHSEUzMk04YXR1WmFXeXNK?=
 =?utf-8?B?ZDdMVnFVQVVCTVlvckY4YVBqbG95a296UjlXTXhIbzIwMTI5NVR5WnFGRjUx?=
 =?utf-8?B?bkxicUIrcXY5V0hhUjIzbmVlOTRQMFhPd2lyVkZEcXNoeGo5OWp4S0lja2w2?=
 =?utf-8?B?YVRlc0JHeVIxQzBOSUtHcGNzSFJrbFNEUnRLTUlXSnNTSmkxS1RhQk5zNmNJ?=
 =?utf-8?B?aWNBTXFWTWdRTlJaUGpxNXNwUjRrVVVseXZKMU9RbldTbHNRbTZhZkVXeHlO?=
 =?utf-8?B?UE1ST0lzcjZqY0RsaW9lQmFaZDdReTJYcXVwWEtHVU9Mb2xwS3lVcGw1Qmoz?=
 =?utf-8?B?Mk9RMEJUTzYxRXdKa2laNmRsUjlTNEsvS1M1Mkw3dmZFZ0ZObUdibW54T2li?=
 =?utf-8?B?NDdQdUtjbEFmOUNyVmxaK29za1lpbHdEV0Rxdkw0U0QwdW5ubFFTQlJ4Ym5u?=
 =?utf-8?B?ekJVa2ZrakFPR3pPSFZyOTRXZ0FOcVNMdGk3cUk2SHJHaE9qVUVUKzh6cnhU?=
 =?utf-8?B?emFMN05UeW1KYXVSOE1NRHVMQTl0S0thY2xhdFovdHR0SG9YL1dOajRHUUo3?=
 =?utf-8?B?UmtFRTR6cjluNzJISUNGbHRic1lUWERvSDgvYU5IUGF2ZEcwVzBjZmxQZ2J1?=
 =?utf-8?B?THcxNlZXejRKRWY2SW5IUlo5S3BQMjA1NU43K2VWcElqMmRiNjJLRXRuOGJZ?=
 =?utf-8?B?d3VWOEw5WEpReU4wbmdaRkZjclhuMnBLTnhuMHVkb3ExRFdGNzQ2bDAvUjZJ?=
 =?utf-8?B?OVVFTGF4M1paM0hzYzUzS2Z0MWFrQXZJQnhpTlc5YUxuSDVPV1dxQ1VHVVFW?=
 =?utf-8?B?WklDSzNaY2RRZURnaUhSK0lBbko5S3hQbXBOYWRKeDRKcFVyOHZxQ2FiOVhN?=
 =?utf-8?B?ajdQeHVWcFlDbHBnb1FvZUtFUFc0MWJiMUtuMzZjcklsa2M2SWpuYjBadE1a?=
 =?utf-8?B?M0xQNnVJeS9GbjNzWXJURnY1NkxhYVVleEc1ODVBNm9yUFJBQUhySGFxRE9u?=
 =?utf-8?B?RHlsaG95OW1rZGYxMHZoQ2Zwc0cyUWRWRE1yak1Pd2Vyb0RrekJQNEh1S0cw?=
 =?utf-8?B?amRYdjhJdDBoNXN5UVRkVk9HQmlPVjJQblJXTXhQbC9sSDlmWmgrckNHSFJu?=
 =?utf-8?B?WlRDWmhKRE9BWE1VL3NoR2UwZkxBeitNS3BJQUZMQU5VY1pBSHZlSW9zSXRy?=
 =?utf-8?B?eEgrUm5NazRSVGFUamlXbE8zcHBwZStsYmRkc1IyQU9sdDhJTktqUUg5MDJv?=
 =?utf-8?B?ZTVudzFYQUg4L1AvaVQrZnhGamt1WEVwK3Fjakc5N3pid212UWc5cDdIdm10?=
 =?utf-8?B?ZklqUlJoNnh6VFNDOGthUFpCY1BHc014THVZazV0THZrYlZ5ZDZ5bndiQTVy?=
 =?utf-8?B?MDRCR1JtTWFCcGpkL3d3ZktjbWtaS1ZLT1FwdHQvVHZ2M3VlNk5NSmVWRVF6?=
 =?utf-8?B?WC9uRFRXZS9TNGZMUGs4ckZuQ05DSE1pSi9FbHE4RjYyVkhoMG44Z0Q2bXQ2?=
 =?utf-8?B?TThFbEdJNFk0VEs2VW0zdzBSYXpPemRpTWxqc2JyZk1leDlndzNlYXN1Tkg2?=
 =?utf-8?B?MUdkZkxZRllCZzU2NE1LQ3lrVUo5bHZ3MzE4c2RndlMvby9wUm0zWXZqUzk1?=
 =?utf-8?B?Zk5WQ1p6U2cyQzRoVGVtNTJ1VnQxOTJSVkl2a3Y1S0puRGEwZUtBUW9wVDRS?=
 =?utf-8?B?azgvMUdjNEdQWENWazlLanZRcDRRZFY4SmJhSXhON3RsMy9hWURvYjJUOGVF?=
 =?utf-8?Q?H5s1hQxGXNhOW6C8mgT03SwmziJ2cpADiy2KevA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFF7D396F83D7E4F8E3F0B7EBCF0B4CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21d2c49-1426-4b4f-afaa-08d98d66f87e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 09:59:24.3713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zksRoSHoKPupeyKikLNUhGmDchtWI1N5oFFnDS26l5/FV0SsfoYMJAXIvq7JuVseuaviMZBF+eeToR0xyExH3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4170
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

T24gMTAvOC8yMSA5OjE3IEFNLCBOaXJtb3kgRGFzIHdyb3RlOg0KPiBSZXR1cm4gZWFybHkgaWYg
ZHJpIG1pbm9yIHJvb3QgZGVudHJ5IGlzIE5VTEwuDQo+IA0KPiBDQzogWmhlbnl1IFdhbmcgPHpo
ZW55dXdAbGludXguaW50ZWwuY29tPg0KPiBDQzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwu
Y29tPg0KPiBDQzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4g
Q0M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4NCj4g
Q0M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gQ0M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4NCj4gQ0M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4NCj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jICB8IDMgKysrDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgfCAzICsrKw0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1
Z2ZzLmMNCj4gaW5kZXggOWYxYzIwOWQ5MjUxLi4yZDQ3YWNhYTAzZWUgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYw0KPiBAQCAtMTg3LDYgKzE4Nyw5IEBAIHZvaWQgaW50ZWxf
Z3Z0X2RlYnVnZnNfaW5pdChzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgZHJtX21pbm9yICptaW5vciA9IGd2dC0+Z3QtPmk5MTUtPmRybS5wcmltYXJ5Ow0KPiANCj4g
KwlpZiAoIW1pbm9yLT5kZWJ1Z2ZzX3Jvb3QpDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgIAlndnQt
PmRlYnVnZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcigiZ3Z0IiwgbWlub3ItPmRlYnVnZnNf
cm9vdCk7DQo+IA0KPiAgIAlkZWJ1Z2ZzX2NyZWF0ZV91bG9uZygibnVtX3RyYWNrZWRfbW1pbyIs
IDA0NDQsIGd2dC0+ZGVidWdmc19yb290LA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMu
Yw0KPiBpbmRleCA0NDk2OWY1ZGRlNTAuLmQ1NzJiNjg2ZWRlYiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kZWJ1Z2ZzLmMNCj4gQEAgLTEwMTIsNiArMTAxMiw5IEBAIHZvaWQgaTkxNV9k
ZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikNCj4gICAJ
c3RydWN0IGRybV9taW5vciAqbWlub3IgPSBkZXZfcHJpdi0+ZHJtLnByaW1hcnk7DQo+ICAgCWlu
dCBpOw0KPiANCj4gKwlpZiAoIW1pbm9yLT5kZWJ1Z2ZzX3Jvb3QpDQo+ICsJCXJldHVybjsNCj4g
Kw0KPiAgIAlpOTE1X2RlYnVnZnNfcGFyYW1zKGRldl9wcml2KTsNCj4gDQo+ICAgCWRlYnVnZnNf
Y3JlYXRlX2ZpbGUoImk5MTVfZm9yY2V3YWtlX3VzZXIiLCBTX0lSVVNSLCBtaW5vci0+ZGVidWdm
c19yb290LA0KPiAtLQ0KPiAyLjMyLjANCj4gDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4gcXVldWVk
Lg0KUmV2aWV3ZWQtYnk6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNvbT4NCg==
