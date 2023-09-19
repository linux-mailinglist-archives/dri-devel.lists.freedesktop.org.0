Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E167A56FB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 03:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B0B10E37F;
	Tue, 19 Sep 2023 01:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW2PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11013004.outbound.protection.outlook.com [52.101.49.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9A10E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 01:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVFpO0pbxnEJHvhMqzx8JAguSK6b0dW+cCweDtPyZsmNMzPVUsUqhV7dRhNDy0KFd7cDQvPtNqvUCeGeWLUk82udLGSJIBG4Is/djynZ4EOC5rLcbRwsH7rRIum9Vi0TO6OgvYluPcSzuxVRRwBvo1373/5yclz5Ffq812b/bvEankLB53Iy16OrwzekllRgv1YsiBZ6TEBMd2AN/bPzXsXTZzGmpsaWzUgGKGoDoPBe85OlDVVUYLAkP+bM1Tee355+f+/yTQt3mQkb8EVeN5d56VTh6OzL3oUaN96jwkkdhK2VbMulz502kJmC6GmcJM9iYVsNexk99JA3uhgV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFWyqAmuylc96OlS/sCmlN/44OVzZ72aqvcjeXtevDU=;
 b=btF5gP5BzWF895jdclRxPIReo9FPzESI+YAr2hNF1eFhcbaXrLxmmgQ5/OcwuKFV257AL+XdWu1EJKy67msV3LLKKsJ+iCCNYw/XWEYwKliqGgg4sBnYmxv5XAGF9wVxEF0mdIisnl4rMY2RtECvCqDC0ndZLpvvO0haFgt7Gg7oxP8Rd89UoirMfNyS0HoI4FGoWl1tn6ifAQspqjGtlTEIKspRlPmWh/PbpZu1KcuIfBNlZqwzjEbKuOb52OH8m41/rZH/IjDwr9Y9rDmoBBgMcL1LMHscZiLaKvsyiD1cFQR4DAfbL/AuFR4jBhfrIeYvWc/Js0SstdKZo+IaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFWyqAmuylc96OlS/sCmlN/44OVzZ72aqvcjeXtevDU=;
 b=Pw+tM+wHjLf2kbsQ8NTfGTzJ72zQPw3NQJLLM1LYY2HsbHrGi/HNnXacj1aqAEgY3qH4qs0my7GJwsmbsrYgffoPLTSA0H1bm1tdxyXW90LPeGbkuqhFYQ1TLuiywNcZP9p0dP4Sf8jmp+FVcNiwCWgUSqzVV9X1Zc6yzlXGwH0=
Received: from DS7PR05MB9825.namprd05.prod.outlook.com (2603:10b6:8:ef::18) by
 PH0PR05MB8688.namprd05.prod.outlook.com (2603:10b6:510:bd::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 01:26:22 +0000
Received: from DS7PR05MB9825.namprd05.prod.outlook.com
 ([fe80::59f6:b9e9:7724:831a]) by DS7PR05MB9825.namprd05.prod.outlook.com
 ([fe80::59f6:b9e9:7724:831a%7]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:26:21 +0000
From: Zack Rusin <zackr@vmware.com>
To: "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: Decrypting tt maps in ttm
Thread-Topic: Decrypting tt maps in ttm
Thread-Index: AQHZ6eEE7lRDQCR+eU2u2hmQyPQPObAgdNYAgAA4JYCAAATBAIAACr6AgAAWKICAADTmgIAAVUwA
Date: Tue, 19 Sep 2023 01:26:21 +0000
Message-ID: <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
In-Reply-To: <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR05MB9825:EE_|PH0PR05MB8688:EE_
x-ms-office365-filtering-correlation-id: 34699970-0ca9-488e-4f1e-08dbb8af6eab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dx088durTrvnWzGNnyOMut/Z8fVTdJ/i2r57DP17SkmjE4Wztn87UkiDcys3lLrn4P6PtInvQbHZtCxZPcABpsmNjpcVxHKukDZ/U+Nm5C0Zii4poo3ToNKIJMzXwr42ojh5QrI6Q8wmwri5+lVw/0qLI0tQt6UNsJdtyvhwopngRW0xTQTC/BHS4soDB0DZ+b55b7vx6eHfnIoWjbrgKfhotUJBAtZWyBBSp/52qWvZTZgy/EglgXMCwPuDMNfCoQLhs7W7NN2p7DNKrC4kdktl58IufaCeyvbBTDF6axb9Kfyv4sdcnzEP9Otvmi29Ap5W4H2zdNFgGpnxmb8RFL68Txi8qbwYuMNg6dMzP8rH0f5ZmIDyFFrR32akYphy6i8Mz9zUhjDvzB0eKAw/jf3UFdCAmdCCWIh5XfuAqxk37/kAALHjjDgIcvTmCDHhIAYg22Z+Rk8jSQGC+yyjODumZ/lCJ+GAYbLwIRPVlmFWifwTZhE9bPqURxT5R1pW4XwXXrIvdlXcIBe/ZIjLywkzvmmuvn89KCph8mzXSP5PQVcfnYNWVprA8E8J3jSZzGcUyJlmwnzouEX/ruWcyPfMzmrA4D5vHgp6YJ6X/jZ5cylnSSRR9CY8L9kO3iSbS6148QVVS20Mch9XblvuEsrh+gQ/EP40/5O1/Hf1/+qQhnPiuiZf70u7GbH/FFuoTF13XQ/OfSPFTYp1vAKyyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR05MB9825.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(186009)(1800799009)(451199024)(4326008)(5660300002)(6486002)(6506007)(53546011)(8676002)(8936002)(316002)(41300700001)(66946007)(66556008)(66446008)(64756008)(66476007)(54906003)(478600001)(45080400002)(966005)(71200400001)(110136005)(91956017)(76116006)(2906002)(6512007)(66574015)(83380400001)(26005)(2616005)(36756003)(122000001)(38100700002)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVN6VFgwZEF4dFdtVm1HMXRJRjc5SXJ2VU9VOVVUUllWeG9TODBVSnVjNXdQ?=
 =?utf-8?B?QjZkRWxvcHg4c2JURlk2MjNkRU4wbFB5dSt6cVRTT25MSFNTZjFtOEJ5YTJy?=
 =?utf-8?B?QnhtSTU2cmFiTmNxODQ2ZTlJMFdDL0piWFdaNFd4TmZtSmZyV2Iwb1crNWdG?=
 =?utf-8?B?OHVjbTB6ZUNjRkxGMWcvRis3YTE2azV5R1owMjkzYmpQTkIxMklZSFFzM3ly?=
 =?utf-8?B?Wko1QXkwZGp2NnM0MlR5ZGlmbC9KVnRYeWwxUzRrNmJjaURmYVdFVXlKZTQy?=
 =?utf-8?B?RDJFUGJMcTBaTHpWRUtvN3ZhUUFhL25od2lJYnVHcGxMU3dJbE5naWpxZGJR?=
 =?utf-8?B?YmJ4cEJEckFyOFBqdkJsNUkxSWNDVFVRQU5KSFFMR21ab3hPVkZVN2R4bS9o?=
 =?utf-8?B?OTQ3Z0pwZnJ5cFNSbVFZWVY0ZTFZeFkwMldySG5BTFdybHBIb2tIQUhhVjBy?=
 =?utf-8?B?RXlhY3B5L0drL1prSDEzTUZveDhGdkxtYUdLWnpyVkRWOXBaaE5oaTFKZnZN?=
 =?utf-8?B?Sm92dzFoeEJSQzYzMUFNU1RpQ1pKaHdOMVJUa1I5RTJvMllid0diTGRENkxp?=
 =?utf-8?B?cHNRWW1ZckJLWUxRVXB0WCtFQVNURjlSUDF1cG9ZVW9STzJSWE44eHJLaHgr?=
 =?utf-8?B?bXNaYkRTd1lEQVN1amhQVC82RzZDaHFMRW5rdzdpb3pXcmVRL2J4MEhPU3RG?=
 =?utf-8?B?VnJmYkVENzVyZ0ZoUVhyZEFXYUhzSDBPQXFPdmxIYWU3Yk9EbUJkRXJySnZi?=
 =?utf-8?B?VkhXRUpGcUNHaFdjbnFhWG1SL0lDYk5jVGMvNUdVUFRXd3hteTVzODFpZk1n?=
 =?utf-8?B?dC9aTndIQzE1eVBDQUd0dmh1elhuOERPRWNoZEloN21NYzRyME1zaU9JQmUr?=
 =?utf-8?B?SytrNnRzVG1SOWJkT3F2cVNZVUVQdWJrdnRzUlJrSkV3dm5qTDRZZ2ZKekZZ?=
 =?utf-8?B?SUZrNk15UzBLcFhha3Vwd3piU2N6MkxScFBhWm5EelpBLzJMWEdmSGNtMVd0?=
 =?utf-8?B?REtoSHNRaDg2aG05ZWYrNWQxaDE0S0lYbFRxNkQrdGFhaVhmYmcyZXNlYjNW?=
 =?utf-8?B?ZVAxVDBzdUJPM0ZZRTlRY1ZKTzRIdmZKSDdaeTlLaG1DQTJFa3E5aytEa1Vy?=
 =?utf-8?B?ZmpDd0ZEYk03T1lBRE9iYlFXbE9henloNGc5c3huajZieUQxY3o0bDdKS2FK?=
 =?utf-8?B?RlRvMVY0Sm5lU0pEbDBkUVRQakdwYmR5aEpac2J4dkZqa3N5NzhteGtwc0Rv?=
 =?utf-8?B?S0IzYXhrdWF3Sm9xN3Jtakg1dHEyUE1WRVVtMUxBWnl6Nnp0SHRlc0RHaDlQ?=
 =?utf-8?B?MkY4YUFSSUhjTUp6bUpGUEFOOUFFRVZ2ZzFDUnMxakw0a0l1aFMyWUxPa3Fn?=
 =?utf-8?B?VmVPNkxZZFdLVVdhZWZ2N3NucXBzRnVIcjF4MWl6WDlTVjJEWVlUL0U2cy9W?=
 =?utf-8?B?R3FkQjROWEgxNEt6K0tYQS82NHJUMElFdFlqdXkwbkFGY0hkZVlPSkZUMjN0?=
 =?utf-8?B?cVVRakloMTZtTmtRR3V4TDlkUUFzL25WRVE2QVEyRW9FemhNRTJjUkhhY3JY?=
 =?utf-8?B?dWRsSFlKTTJqRHRxSFBpVEh6eDhhNDU4UjlTWjJLT3FyV1BoY1VpRTgwZUxX?=
 =?utf-8?B?UTZKcWU5NVJQaW11L3RtbFhEYkZpdkVqWHBYa0JrUUdGaHI4eDcySVdoeCsz?=
 =?utf-8?B?YzZjSTlXenhEV3V0ei9qQW92dEtRMDhYUFJTeEVWUzVRUG4zV1VORmUyN2RT?=
 =?utf-8?B?MmpjMUNoejJHTjlTemFOVmlCWS9CdUJMVHJBK0xRTDJkZFo4MTA1eXpvSjdL?=
 =?utf-8?B?UGIzWlZLR0F0ZWF1d3hGVnVENk9NekxSYUlQVGdBWGNXV0dJNVJKRDl5eEJK?=
 =?utf-8?B?bXpxY25XZ0VUbE91RkwrUW13Zm9iRWIvelYvYWk0ZmU3MEkzOHFDaXE4NVhl?=
 =?utf-8?B?SFROVzRwUytCZkwxVXB6NHNYVDRxc09rMHdNOC9XdFFNbGN5NHFkbWNWejNQ?=
 =?utf-8?B?UnZaZDRpVDBGZzczcURjNHp4dkdESllKK21tdjk1bUxNbisvY1FnWi9XK3VM?=
 =?utf-8?B?NEtaWUc3M0I1d25uVTU5UzZkQ0N0bkp5K2ZBa0pXYm5pdkx6VWl4UjNsTGVY?=
 =?utf-8?Q?g1ASTKhlmS/5OS+WEhy8UKqrF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEC8FDE1D7E3474FAF8E6AED7044D1ED@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR05MB9825.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34699970-0ca9-488e-4f1e-08dbb8af6eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 01:26:21.8181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3e/gAXEgy6VHKHbnEPXPxdKZH642qB8/ZvmlaDNDzFjt4tLBeQ+F/RUkDWM8UZf3X0v9jOPByOmGe9HAzvwzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8688
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDE2OjIxIC0wNDAwLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+
ICEhIEV4dGVybmFsIEVtYWlsDQo+DQo+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDM6MDbigK9Q
TSBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA5LzE4LzIzIDE3OjUyLCBaYWNrIFJ1c2luIHdyb3Rl
Og0KPiA+ID4gT24gTW9uLCAyMDIzLTA5LTE4IGF0IDE3OjEzICswMjAwLCBUaG9tYXMgSGVsbHN0
csO2bSB3cm90ZToNCj4gPiA+ID4gSGksDQo+ID4gPiA+DQo+ID4gPiA+IE9uIDkvMTgvMjMgMTY6
NTYsIFRob21hcyBIZWxsc3Ryw7ZtIHdyb3RlOg0KPiA+ID4gPiA+IEhpIFphY2ssIENocmlzdGlh
bg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gOS8xOC8yMyAxMzozNiwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIFphY2ssDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
YWRkaW5nIFRob21hcyBhbmQgRGFuaWVsLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkgYnJp
ZWZseSByZW1lbWJlciB0aGF0IEkgdGFsa2VkIHdpdGggVGhvbWFzIGFuZCBzb21lIG90aGVyIHBl
b3BsZQ0KPiA+ID4gPiA+ID4gYWJvdXQgdGhhdCBxdWl0ZSBhIHdoaWxlIGFnbyBhcyB3ZWxsLCBi
dXQgSSBkb24ndCBmdWxseSByZW1lbWJlciB0aGUNCj4gPiA+ID4gPiA+IG91dGNvbWUuDQo+ID4g
PiA+ID4gRm91bmQgb25lIG9sZCB0aHJlYWQsIGJ1dCBkaWRuJ3QgcmVhZCBpdDoNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1k
ZXZlbC8yMDE5LVNlcHRlbWJlci8yMzQxMDAuaHRtbA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiAvVGhvbWFzDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiBVZ2guIE5vdyBz
dGFydGluZyB0byByZWFkIHRoYXQgdGhyZWFkIEkgaGF2ZSBhIHZhZ3VlIHJlY29sbGVjdGlvbiBp
dCBhbGwNCj4gPiA+ID4gZW5kZWQgd2l0aCBub3Qgc3VwcG9ydGluZyBtYXBwaW5nIGFueSBkZXZp
Y2UgcGFnZXMgd2hhdHNvZXZlciB3aGVuIFNFVg0KPiA+ID4gPiB3YXMgZW5hYmxlZCwgYnV0IHJh
dGhlciByZXNvcnRpbmcgdG8gbGx2bXBpcGUgYW5kIFZNLWxvY2FsIGJvcy4NCj4gPiA+IEhpLCBU
aG9tYXMuDQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciBmaW5kaW5nIHRoaXMhIEknZCAob2YgY291
cnNlKSBsaWtlIHRvIHNvbHZlIGl0IHByb3Blcmx5IGFuZCBnZXQNCj4gPiA+IHZtd2dmeA0KPiA+
ID4gcnVubmluZyB3aXRoIDNkIHN1cHBvcnQgd2l0aCBTRVYtRVMgYWN0aXZlIGluc3RlYWQgb2Yg
ZXNzZW50aWFsbHkgZGlzYWJsaW5nDQo+ID4gPiB0aGUNCj4gPiA+IGRyaXZlciB3aGVuIFNFVi1F
UyBpcyBhY3RpdmUuDQo+ID4gPg0KPiA+ID4gSSB0aGluayB0aGVyZSBhcmUgdHdvIHNlcGFyYXRl
IGRpc2N1c3Npb25zIHRoZXJlLCB0aGUgbm9uLWNvbnRyb3ZlcnNpYWwgb25lDQo+ID4gPiBhbmQg
dGhlDQo+ID4gPiBjb250cm92ZXJzaWFsIG9uZToNCj4gPiA+IDEpIFRoZSBub24tY29udHJvdmVy
c2lhbDogaXMgdGhlcmUgYSBjYXNlIHdoZXJlIGRyaXZlcnMgd291bGQgd2FudCBlbmNyeXB0ZWQN
Cj4gPiA+IG1lbW9yeQ0KPiA+ID4gZm9yIFRUIHBhZ2VzIGJ1dCBub3QgZm9yIGlvIG1lbSBtYXBw
aW5ncz8gQmVjYXVzZSBpZiBub3QgdGhlbiBhcyBDaHJpc3RpYW4NCj4gPiA+IHBvaW50ZWQNCj4g
PiA+IG91dCB3ZSBjb3VsZCBqdXN0IGFkZCBwZ3Byb3RfZGVjcnlwdGVkIHRvIHR0bV9pb19wcm90
IGFuZCBiZSBlc3NlbnRpYWxseSBkb25lLg0KPiA+ID4gVGhlDQo+ID4gPiBjdXJyZW50IG1ldGhv
ZCBvZiBkZWNyeXB0aW5nIGlvIG1lbSBidXQgbGVhdmluZyBzeXMgbWVtIG1hcHBpbmdzIGVuY3J5
cHRlZCBpcw0KPiA+ID4gYSBiaXQNCj4gPiA+IHdlaXJkIGFueXdheS4NCj4gPiA+DQo+ID4gPiBJ
ZiB0aGUgYW5zd2VyIHRvIHRoYXQgcXVlc3Rpb24gaXMgInllcywgc29tZSBkcml2ZXIgZG9lcyB3
YW50IHRoZSBUVCBtYXBwaW5ncw0KPiA+ID4gdG8gYmUNCj4gPiA+IGVuY3J5cHRlZCIgdGhlbiB5
b3VyICJbUEFUQ0ggdjIgMy80XSBkcm0vdHRtLCBkcm0vdm13Z2Z4OiBDb3JyZWN0bHkgc3VwcG9y
dA0KPiA+ID4gc3VwcG9ydA0KPiA+ID4gQU1EIG1lbW9yeSBlbmNyeXB0aW9uIiBzb2x2ZXMgdGhh
dC4gSSB0aGluayBnZXR0aW5nIG9uZSBvZiB0aG9zZSB0d28gaW4gbWFrZXMNCj4gPiA+IHNlbnNl
DQo+ID4gPiByZWdhcmRsZXNzIG9mIGV2ZXJ5dGhpbmcgZWxzZSwgYWdyZWVkPw0KPiA+DQo+ID4g
V2VsbCwgdGhlcmUgaXMgbW9yZSB0byBpdCBJIHRoaW5rLg0KPiA+DQo+ID4gSUlSQywgdGhlIEFN
RCBTTUUgZW5jcnlwdGlvbiBtb2RlIGhhcyBhIHdheSBmb3IgYSBkZXZpY2UgdG8gaGF2ZSB0aGUN
Cj4gPiBtZW1vcnkgY29udHJvbGxlciAoPykgZW5jcnlwdCAvIGRlY3J5cHQgZGV2aWNlIHRyYWZm
aWMgYnkgdXNpbmcgYW4NCj4gPiBhZGRyZXNzIHJhbmdlIGFsaWFzLCBzbyBpbiB0aGVvcnkgaXQg
c3VwcG9ydHMgZW5jcnlwdGVkIFRUIHBhZ2VzLCBhbmQNCj4gPiB0aGUgZG1hLWxheWVyIG1heSBp
bmRlZWQgaGFuZCBlbmNyeXB0ZWQgRE1BIHBhZ2VzIHRvIFRUTSBvbiBzdWNoIHN5c3RlbXMNCj4g
PiBkZXBlbmRpbmcgb24gdGhlIGRldmljZSdzIERNQSBtYXNrLiBUaGF0J3Mgd2h5IEkgdGhpbmsg
dGhhdA0KPiA+IGZvcmNlX2RtYV91bmVuY3J5cHRlZCgpIGV4cG9ydCB3YXMgbmVlZGVkLCBhbmQg
SWYgdGhlIGFtZGdwdSBkcml2ZXINCj4gPiBhY2Nlc3NlcyBUVCBtZW1vcnkgaW4gU01FIG1vZGUg
KndpdGhvdXQqIHBncHJvdF9kZWNyeXB0ZWQoKSBhbmQgaXQgc3RpbGwNCj4gPiB3b3JrcywgdGhl
biBJIHRoaW5rIHRoYXQgbW9kZSBpcyBhY3R1YWxseSB1c2VkLiBIb3cgY291bGQgaXQgb3RoZXJ3
aXNlIHdvcms/DQo+DQo+IEZvciBTTUUsIGFzIGxvbmcgYXMgdGhlIGVuY3J5cHRlZCBiaXQgaXMg
c2V0IGluIHRoZSBwaHlzaWNhbCBhZGRyZXNzDQo+IHVzZWQgZm9yIERNQSwgdGhlIG1lbW9yeSBj
b250cm9sbGVyIHdpbGwgaGFuZGxlIHRoZSBlbmNyeXB0L2RlY3J5cHQNCj4gZm9yIHRoZSBkZXZp
Y2UuICBGb3IgZGV2aWNlcyB3aXRoIGEgbGltaXRlZCBkbWEgbWFzaywgeW91IG5lZWQgdG8gdXNl
DQo+IHRoZSBJT01NVSBzbyB0aGF0IHRoZSBlbmNyeXB0ZWQgYml0IGlzIHJldGFpbmVkIHdoZW4g
dGhlIGFkZHJlc3MgaGl0cw0KPiB0aGUgbWVtb3J5IGNvbnRyb2xsZXIuDQoNCkhvdyBkb2VzIHRo
YXQgd29yayBvbiBzeXN0ZW1zIHdpdGggc3dpb3RsYiwgZS5nLiBzd2lvdGxiPWZvcmNlLCBvciBp
LmUuIHdoYXQgd291bGQNCmRlY3J5cHQgdGhlIHR0bSB0dCBtYXBwaW5ncyB3aGVuIGNvcHlpbmcg
YmV0d2VlbiBzeXN0ZW0gYW5kIHZyYW0gd2hlbiBpb21tdSBpcw0KZGlzYWJsZWQvYWJzZW50Pw0K
DQp6DQoNCg==
