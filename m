Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D06FE52C
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 22:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964710E51A;
	Wed, 10 May 2023 20:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E510E51A;
 Wed, 10 May 2023 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683750967; x=1715286967;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=RUJ7Ffu5oaeSYIMyzuVr76x6O3AKfdFPHZ1/TdY+q6U=;
 b=V/1NZBW/5GjzX958OV8EWOhkk3I7Q27wh4Hvm+JEif+sC8kqcOjiubet
 kz4gjsOx9hG8h6xYwlm8wqkv1WZeWix/8ZZyS2VocXQHG4NkVTPK9fCfy
 OPKmmWx3AtnAww2Cx1VDGAVbvwArMhNHNS+JHT10HC1zxdZmc1oYQIPoL
 3GI/AVsxkVftldO6wJyNOcIlGeCB+S9zDYy8aAIuqIOgV/OKqC5KgPjuG
 AMJplvGt+XlXovfnigik+506OobjumM/X6cs3PIP3C2NLav1RiW7IvdVR
 K1Bvc9wiiIBLBrNJidUjnHnlTNfawv5EU1NdTpu/gwuBXsX0ybqJYf5Wx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378427513"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="378427513"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 13:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702418872"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="702418872"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2023 13:36:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:36:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:36:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 13:36:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 13:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Stt8fZxjKZOC3vDJt3BYY7lbicNN3jJmLSjoFcr3cWNupIlyQpqfYNd6LSo/cjyiQnq+gCB0hv3aNyCvft1oITct8a1gAa68zu8ld6gDDtbJ9pDkKZX6yUOcagrS5jt1g0UzNsTMkMsAEJy+iapfRNSHaToAs8YZ2VXczYIu0ng3OTkbdkLWWVUXy15YIxkNvQT3WbSo2MY+RVLeNs2KBEvZxCQQKt2RyOMUwQedPpcw+5fomf5ugbgfrbLFlprQYIpExrBRs0/6nw42c3nIn6JLTRTlKqg7jvEpdoiTMIA4kUvuNJ5CSnxEjEl2PMcGKrOnoXsObhK9mTtGTu6lkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUJ7Ffu5oaeSYIMyzuVr76x6O3AKfdFPHZ1/TdY+q6U=;
 b=Z+MhlJvCN1U+J3Ijaw9YJIx2AvZocV99dZZwtC+C/jspBQbRTfYMdnoM/8ylUrqGN+9u9lrRP23oGluHP1diTfHi6KU41DoWuxvS9AQaCCBHlr2zuMmgNXomQdiZC2ljihhEPAJj7YGhRtp8HobYJwoThZpn+peQvSfvHO7Q7JbFcsw8adV+jSU/jHyERUA3SRSfHdIeoVRdJcuqdfybzIbak2Q+84H8W4i3f0TCBaUmMN7WyV8aGH96IKancIARpT6DEt4Fk3LsIDeDfHLCWpNSyydFLnEKDcOqBhcbdXUTjf6PIhlSUb2r4S42p0vsh7GZXAE2KKSY/EPYmh4mLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 20:36:03 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 20:36:03 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: Fix unprotected rebind_list
 accesses
Thread-Topic: [Intel-xe] [PATCH 0/2] drm/xe: Fix unprotected rebind_list
 accesses
Thread-Index: AQHZg0qRZOcEqMjY6UqBu4vUBW5ayq9T93mA
Date: Wed, 10 May 2023 20:36:03 +0000
Message-ID: <1ff32294fe85c8a812ae28f32303483cd32b189b.camel@intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB4787:EE_
x-ms-office365-filtering-correlation-id: 475b947d-9307-450e-33a0-08db51962c2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yWr+CxuXLdecCsOwMkkhhCjayDVlQiquc9m5ga/zRwGbaMl28w0h+WczjNcLz7N6S0mcIgYpVx9OM56D/SNx0vi8zkfqxnGED0pHvVyuC7AYOA9BJ5delIU7/f9a1MCMlg03V8mmqnMACxbQKr7QKRVWP9WiEBfHdiLUBmwdy0PGanfgPfvmVZ0rbh551C9bTXL+jJOVVPMHlQ7HKdnC6Yb9KA3OJSWX75Hr4ATp3LWFMEvy8c2/4HlF/34/gDKBFVh1q+XjrFVDYAIzYiOWfrSTlIbKkco5Hz8OnWH0hsqF5XNn94/w4MF2R9JKI+rQkuj6JQemr/uRfPV8eiFYnHo2kRw5zRgK/qm9OA7PYoSCUA0uZQTZoF9Y+ZEgSws9X/sgwcRVEIuOvlZJ0G4no8CzV+maS4U6qniyZ0fMifKwqo0h7x4OiGvNLQu6ivRJ7tZ6QDfhyNayYcpycTa9Pr/lGF9fknX8tjf7dEvB/vS5VBopbEQ6Gjpl4IjbyohW7AENewBuZNuytCsEaWFCrOsTqPusmIU8phpHPlrMrvq4azCfteoMNQW3c+aqCCd4mTipeFikUCNtSR1Zw6LbxOhQpr6q3b8AeQz7ZanriSujy89ulJjyKlZWsNCAR7fK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(86362001)(5660300002)(41300700001)(8676002)(38070700005)(4744005)(2906002)(8936002)(6486002)(6506007)(6512007)(26005)(82960400001)(110136005)(186003)(71200400001)(478600001)(66946007)(36756003)(91956017)(83380400001)(76116006)(66476007)(66556008)(2616005)(316002)(66446008)(66574015)(64756008)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHVtZXBvRFdqdmdCYlZ2cldxcU5vb3EvRk9VZFRPaENybThMUWNid2kxb2Fu?=
 =?utf-8?B?VTJpa0dPY2NMU1E2SmNQRStFeWllWUdkaVVBVTY3NWs0WlBtT1VpN2FGL3A4?=
 =?utf-8?B?VFlqb2tGV1plSEZrUDVka05UWXpkZjJxSm5jRUJuMElLTkZ5TzFoR3oySUV2?=
 =?utf-8?B?OHFGUnVwT1F6djVwb3g2dm15QTVDZVJHV2krekdEVGdoaEZsckRFbXZhcFlK?=
 =?utf-8?B?am40Q1lRMG93QUVDZ1V2UzdURlh6NFlrNTEyaFFhMUJrWGJQZzRCMjZ2L3B5?=
 =?utf-8?B?RE80R1dJR25VM2tnc2NQSk5LQ21uZUJaYTZidElMOWI3N0IxQkRYTzUxdzAz?=
 =?utf-8?B?b25oMWRieXZPOFFCTGliajlpc0R4bko0RkRJaTRVNFMzRWFKZmNRWkFUK2w2?=
 =?utf-8?B?TnNQZkovTkpBenhqaUtjekxVbjhsU3BSMU9GMmxUL2VqZUQ0VXBFYjlBdnJW?=
 =?utf-8?B?MDlxSVo5Tk1OWXVhUThqWGlFcEJDakQ0NEJNYlN5VVRndUdWQVNYWlJYUkhh?=
 =?utf-8?B?aDNjVDdwamJxRUxiZ05mQ0hhUlY3R245RTkvUWlmKzBUK0tyckVTYTZUdTkz?=
 =?utf-8?B?S3RhVHYzNENOQjNxeEdSVVdSUUdUUVdoZVlhQjhXNVROSk9KVWU5S3VhVlpN?=
 =?utf-8?B?SEhPQk1JQThJbktnejdKZWVyOFMwTE9GOVNOOFNscCtGVUIrSEhwRmVVZ052?=
 =?utf-8?B?SXRGRVI5SVNPU3g4YkNkMk93ZUp1aXhQUjBHdk5UdjRQTmJ3VXFCNC9NMVFB?=
 =?utf-8?B?aXM2Rit5QkkyMlQ0NHFOdFRhR3ZPdWRJSXdiSDlZRUliYjBWNHdZQnNaTmFz?=
 =?utf-8?B?VWplVHJlcEMveDZnZmp2VGd4c1VTNkJIZW4venZlTkxmT1h1N0hFSkxOaFQv?=
 =?utf-8?B?RlFjZmswQkhQcThVRG05T240MDB4T3Rwb2Vyclc3M3JVQmh5ZUJNUUNkNE5q?=
 =?utf-8?B?NEcrRzVPNVNNejJIdFV1YkprcGlEWFM2RG5iZ1dnL3RXWlFNOXFnZFJVeHB5?=
 =?utf-8?B?WFZPQnovVFlNaHZ3M0dhbUFtQ1pTeWl4NGRydzN5dFVRSlB0V3ZYcHZjQmd4?=
 =?utf-8?B?MFFXTjl4M1JGczIwYlkvWnIwZ2tuSVBGSG1qN1BGb1NrbkpLc3FKU3NRY21n?=
 =?utf-8?B?cWFuZ0hlR0VpaTFOMTdFZk9MSXFjMUZDa3pPUmhtOWJNZTNwNWFXcndoc1k0?=
 =?utf-8?B?WWFQRzZNMlFHSUhRaWYwZDEveDgvVVp2SUxvVWhGV2U1ZkE4V0w2eEVOOE1r?=
 =?utf-8?B?dUFGRUdydWxuZWtEVy9yVy95ai9LM2l6b3JDVnBNN015RWU2SS9uQXpwWVdv?=
 =?utf-8?B?TElPMFllMWs2bUxydGZkNzA1eUtnTE90Z0ZXbTlxajhUMU43QnRmK0UyR0k4?=
 =?utf-8?B?cXVvcDk3bm5QeTBDQ2VjZmRHOFMwMjY5cU5NYmtjVVhiY2Y0VjVIYUY1MFhT?=
 =?utf-8?B?THBqWDdvR3V2T2VjdEREaUhuaVFaSW5mM2ZUbzlyaXp0Um0wa2hEeTNDYm9a?=
 =?utf-8?B?SFJxQzZNbS9UWDZjM3E5QzFmcHJLNk9tYkhCN1FQWVhuRk4zcTk0QlpsZ2ZM?=
 =?utf-8?B?d0tJQUw3RUNaRVF3d0pETGU0QlFlQlI2QitlcEFSVTJ0aW12ZkFqejYrajBU?=
 =?utf-8?B?cFZVbWttcitqVkNyZmJwUTdOeW5TT0xHeXVlZEFkcE1QR2lBU0wzckpCUVNV?=
 =?utf-8?B?YSt3WDBJanFraTdLK016aU9jVWwwVFhzSUtUdFc3MXdacU5GRjh2cEl0dUpN?=
 =?utf-8?B?dXBnK0pXSTh5N1BtaytQKzNHS2ZSR0h4dDVyVTFzZmZDb21OK2FjMmRoR2Vj?=
 =?utf-8?B?UWJ4S1NmU3RJRW80QUVId2dvZTJ4ZitaT3QrOFJZcEVnNUgyMlVSUkpwaERN?=
 =?utf-8?B?OE5oQzdCbGR0V3JKbnlBeDJDa3dweUs4cGFOTThlaVdHd2hXditzTm9JcUVa?=
 =?utf-8?B?b3ovRDdtNFVpeW9PMXgvaWJubkhnbjJ2WEVTLzZLVTduK1M1R1hJNVhGanpB?=
 =?utf-8?B?Q2pib2swSzFBS3RZbnhxYkJJMTBLMDkrWFRkR1hoaFlqRDBZcm1RSnptYlVy?=
 =?utf-8?B?N01iVGNKcXJUcDYzakFjUS9PZmVZdFhCNHlaY0NySG14bDFSNkhsRkRsYk9E?=
 =?utf-8?Q?H655L5bGp2HINkPAgjU4H0Zga?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <115F44E61410584A862909A9ABE3E2F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475b947d-9307-450e-33a0-08db51962c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 20:36:03.0706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNLzGo2AhlQTd/PqN84Ls88zkM/RtZRowb4vfU0d5bwbqGOwaq3d+66NWMMMh9yMYg5POGMwKjdJ9Mk002ANmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
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

T24gV2VkLCAyMDIzLTA1LTEwIGF0IDE2OjE5ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gRWFjaCBWTSBoYXMgdHdvIHJlYmluZCBsaXN0cywgb25lIHByb3RlY3RlZCBieSB0aGUg
Vk0gcmVzdiwgdGhlIG90aGVyDQo+IG9uZSBwcm90ZWN0ZWQgZXNzZW50aWFsbHkgYnkgdGhlIFZN
IG5vdGlmaWVyLmxpc3RfbG9jay4gVGhpcyBzZXJpZXMNCj4gaW50ZW5kcyB0byBmaXggdHdvIHBv
aW50cyBvZiBpbGxlZ2FsIGFjY2Vzcy4NCj4gDQo+IFBhdGNoIDEgZml4ZXMgYW4gYWNjZXNzIG9m
IFZNIHJlYmluZF9saXN0cycgbGluayB3aXRob3V0IHRoZSBWTSByZXN2IGhlbGQuDQo+IFBhdGNo
IDIgZml4ZXMgYW4gaXNzdWUgd2hlcmUgdGhlIFZNQSBtYXkgbm90IGJlIHJlbW92ZWQgZnJvbSB0
aGUNCj4gVk0gbm90aWZpZXIucmViaW5kX2xpc3Qgb24gVk1BIGRlc3RydWN0aW9uLg0KDQpUZXN0
ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQpU
aGlzIGltcHJvdmVkIG92ZXJhbGwgc3RhYmlsaXR5IGFuZCBmaXhlZCB0aGUgJ2xpc3RfYWRkIGNv
cnJ1cHRpb24nIGVycm9ycywgdGhhbmsgeW91Lg0KDQo+IA0KPiBUaG9tYXMgSGVsbHN0csO2bSAo
Mik6DQo+ICAgZHJtL3hlOiBGaXggdW5sb2NrZWQgYWNjZXNzIG9mIHRoZSB2bWE6OnJlYmluZF9s
aW5rDQo+ICAgZHJtL3hlOiBQcm9wZXJseSByZW1vdmUgdGhlIHZtYSBmcm9tIHRoZSB2bTo6bm90
aWZlcjo6cmViaW5kX2xpc3Qgd2hlbg0KPiAgICAgZGVzdHJveWVkDQo+IA0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMgfCAyMyArKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KDQo=
