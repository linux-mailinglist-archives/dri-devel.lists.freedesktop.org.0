Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA1B20921
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C745895E1;
	Thu, 16 May 2019 14:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EA18912D;
 Thu, 16 May 2019 14:08:41 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1611.namprd12.prod.outlook.com (10.172.38.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 14:08:39 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 14:08:39 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Topic: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Index: AQHVC48rVkIxCCCoYECMKlqE0zp4P6ZtV34AgAACeYCAAFTIAIAAG9GA
Date: Thu, 16 May 2019 14:08:38 +0000
Message-ID: <65075485-3c94-41cf-d39a-1fd451ecc430@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
 <7db2caae-7eab-7c6a-fe90-89cb9cae30b4@amd.com>
 <6e124f5e-f83f-5ca1-4616-92538f202653@gmail.com>
 <20190516122858.GB3851@phenom.ffwll.local>
In-Reply-To: <20190516122858.GB3851@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:206:1::43) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f26ca75-3dae-4d4c-df47-08d6da07fdf1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1611; 
x-ms-traffictypediagnostic: DM5PR12MB1611:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <DM5PR12MB16116428BF27A1B2C7FB9EE8830A0@DM5PR12MB1611.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(65956001)(65806001)(2906002)(53936002)(6116002)(31686004)(99286004)(25786009)(6246003)(4326008)(54906003)(76176011)(58126008)(52116002)(36756003)(102836004)(53546011)(6506007)(386003)(5660300002)(186003)(7736002)(486006)(2616005)(446003)(476003)(46003)(305945005)(66556008)(64756008)(66476007)(66574012)(256004)(73956011)(66446008)(14444005)(66946007)(71200400001)(71190400001)(11346002)(8936002)(229853002)(68736007)(478600001)(65826007)(31696002)(86362001)(72206003)(966005)(316002)(6306002)(6512007)(6916009)(14454004)(64126003)(8676002)(6436002)(81166006)(81156014)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1611;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +6HPxn4g8jVBBO19H1FaVNU3e4ZFdDt85fqfAmqw1iRaO1nh9ADQ+nHlZcdqxNHtzmBCpdPGD0LYp9wwUwqq8tfuAMLM0lnkK8MY4f3CA/TvgCsBJwndT8RUU1fWqfHgIEuwUx3YZRBku1Ij9iN9AWEmiFSbgGGVjp2/d/HWz92y5mVnKrAwiZ91g8lEhYnWli5JvgO4Mwx1bCSy32dfbRPh3rtEWQPZLt0mjkVjtmc/SugTr6D0uC0GDgpRt1PtFd4SS0drHxhiFzQJAsuhGqQGxvFEu2GkWiON24fqe5xLl7v249HrHDYGVP1bpaddGPpGe1zXW/UX5+Nc8k4XKCpkX7BKqGrOrTd6q4pHSKWiekQb4JGOQWG9ki1yQoKmt2vW/8ogJSFo/KKO/qT9nTTIjy4SV1+fMujm667W/h4=
Content-ID: <303281B957BB504189E859716D523295@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f26ca75-3dae-4d4c-df47-08d6da07fdf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 14:08:38.8364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1611
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5hlLBK742OArBpEumWpYhELl7VGA5KHo9JGpQE7tpk=;
 b=iA2eP9Rw72sIqmT1CkipIvVMDw7vuZvCVhUpRtyMstgp4j5jlI15RAZL+dKmKbOrJ3KoP8v46Q3b5Ibg7ofK1Zzyk47qIESTIzk4nAEh7aGJKYPwSaj7Kevf+uZRHl4y4VFJ7m2lz83MA2m5Q5981kLG0X8THQXNbZlfvjl+4YA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Kenny Ho <y2kenny@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDUuMTkgdW0gMTQ6Mjggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDA5OjI1OjMxQU0g
KzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAxNi4wNS4xOSB1bSAwOToxNiBz
Y2hyaWViIEtvZW5pZywgQ2hyaXN0aWFuOg0KPj4+IEFtIDE2LjA1LjE5IHVtIDA0OjI5IHNjaHJp
ZWIgS2VubnkgSG86DQo+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4+Pj4NCj4+Pj4g
T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgNToyNiBQTSBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5
QGludGVsLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiA1LzkvMjAxOSAyOjA0IFBNLCBLZW5ueSBIbyB3
cm90ZToNCj4+Pj4+PiBUaGVyZSBhcmUgZm91ciBjb250cm9sIGZpbGUgdHlwZXMsDQo+Pj4+Pj4g
c3RhdHMgKHJvKSAtIGRpc3BsYXkgY3VycmVudCBtZWFzdXJlZCB2YWx1ZXMgZm9yIGEgcmVzb3Vy
Y2UNCj4+Pj4+PiBtYXggKHJ3KSAtIGxpbWl0cyBmb3IgYSByZXNvdXJjZQ0KPj4+Pj4+IGRlZmF1
bHQgKHJvLCByb290IGNncm91cCBvbmx5KSAtIGRlZmF1bHQgdmFsdWVzIGZvciBhIHJlc291cmNl
DQo+Pj4+Pj4gaGVscCAocm8sIHJvb3QgY2dyb3VwIG9ubHkpIC0gaGVscCBzdHJpbmcgZm9yIGEg
cmVzb3VyY2UNCj4+Pj4+Pg0KPj4+Pj4+IEVhY2ggZmlsZSBpcyBtdWx0aS1saW5lZCB3aXRoIG9u
ZSBlbnRyeS9saW5lIHBlciBkcm0gZGV2aWNlLg0KPj4+Pj4gTXVsdGktbGluZSBpcyBjb3JyZWN0
IGZvciBtdWx0aXBsZSBkZXZpY2VzLCBidXQgSSBiZWxpZXZlIHlvdSBuZWVkDQo+Pj4+PiB0byB1
c2UgYSBLRVkgdG8gZGVub3RlIGRldmljZSBmb3IgYm90aCB5b3VyIHNldCBhbmQgZ2V0IHJvdXRp
bmVzLg0KPj4+Pj4gSSBkaWRuJ3Qgc2VlIHlvdXIgc2V0IGZ1bmN0aW9ucyByZWFkaW5nIGEga2V5
LCBvciB0aGUgZ2V0IGZ1bmN0aW9ucw0KPj4+Pj4gcHJpbnRpbmcgdGhlIGtleSBpbiBvdXRwdXQu
DQo+Pj4+PiBjZ3JvdXBzLXYyIGNvbnZlbnRpb25zIG1lbnRpb24gdXNpbmcgS0VZIG9mIG1ham9y
Om1pbm9yLCBidXQgSSB0aGluaw0KPj4+Pj4geW91IGNhbiB1c2UgZHJtX21pbm9yIGFzIGtleT8N
Cj4+Pj4gR2l2ZW4gdGhpcyBjb250cm9sbGVyIGlzIHNwZWNpZmljIHRvIHRoZSBkcm0ga2VybmVs
IHN1YnN5c3RlbSB3aGljaA0KPj4+PiB1c2VzIG1pbm9yIHRvIGlkZW50aWZ5IGRybSBkZXZpY2Us
DQo+Pj4gV2FpdCBhIHNlY29uZCwgdXNpbmcgdGhlIERSTSBtaW5vciBpcyBhIGdvb2QgaWRlYSBp
biB0aGUgZmlyc3QgcGxhY2UuDQo+PiBXZWxsIHRoYXQgc2hvdWxkIGhhdmUgcmVhZCAiaXMgbm90
IGEgZ29vZCBpZGVhIi4uDQo+IFdoYXQgZWxzZSBzaG91bGQgd2UgdXNlPw0KDQpXZWxsIHdoYXQg
ZG9lcyBmb3IgZXhhbXBsZSB1ZGV2IHVzZXMgdG8gaWRlbnRpZnkgYSBkZXZpY2U/DQoNCj4+IENo
cmlzdGlhbi4NCj4+DQo+Pj4gSSBoYXZlIGEgdGVzdCBzeXN0ZW0gd2l0aCBhIFZlZ2ExMCBhbmQg
YSBWZWdhMjAuIFdoaWNoIGRldmljZSBnZXRzIHdoaWNoDQo+Pj4gbWlub3IgaXMgbm90IHN0YWJs
ZSwgYnV0IHJhdGhlciBkZWZpbmVkIGJ5IHRoZSBzY2FuIG9yZGVyIG9mIHRoZSBQQ0llIGJ1cy4N
Cj4+Pg0KPj4+IE5vcm1hbGx5IHRoZSBzY2FuIG9yZGVyIGlzIGFsd2F5cyB0aGUgc2FtZSwgYnV0
IGFkZGluZyBvciByZW1vdmluZw0KPj4+IGRldmljZXMgb3IgZGVsYXlpbmcgdGhpbmdzIGp1c3Qg
YSBsaXR0bGUgYml0IGR1cmluZyBpbml0IGlzIGVub3VnaCB0bw0KPj4+IGNoYW5nZSB0aGlzLg0K
Pj4+DQo+Pj4gV2UgbmVlZCBzb21ldGhpbmcgbGlrZSB0aGUgTGludXggc3lzZnMgbG9jYXRpb24g
b3Igc2ltaWxhciB0byBoYXZlIGENCj4+PiBzdGFibGUgaW1wbGVtZW50YXRpb24uDQo+IFlvdSBj
YW4gZ28gZnJvbSBzeXNmcyBsb2NhdGlvbiB0byBkcm0gY2xhc3MgZGlyZWN0b3J5IChpbiBzeXNm
cykgYW5kIGJhY2suDQo+IFRoYXQgbWVhbnMgaWYgeW91IGNhcmUgeW91IG5lZWQgdG8gd2FsayBz
eXNmcyB5b3Vyc2VsZiBhIGJpdCwgYnV0IHVzaW5nDQo+IHRoZSBkcm0gbWlub3IgaXNuJ3QgYSBi
bG9ja2VyIGl0c2VsZi4NCg0KWWVhaCwgYWdyZWVkIHRoYXQgdXNlcnNwYWNlIGNvdWxkIGRvIHRo
aXMuIEJ1dCBJIHRoaW5rIGlmIHRoZXJlIGlzIGFuIG9mIA0KaGFuZCBhbHRlcm5hdGl2ZSB3ZSBz
aG91bGQgdXNlIHRoaXMgaW5zdGVhZC4NCg0KPiBPbmUgZG93bnNpZGUgd2l0aCB0aGUgZHJtIG1p
bm9yIGlzIHRoYXQgaXQncyBwcmV0dHkgZ29vZCBub25zZW5zZSBvbmNlIHlvdQ0KPiBoYXZlIG1v
cmUgdGhhbiA2NCBncHVzIHRob3VnaCwgZHVlIHRvIGhvdyB3ZSBzcGFjZSByZW5kZXIgYW5kIGxl
Z2FjeSBub2Rlcw0KPiBpbiB0aGUgbWlub3IgaWRzIDotKQ0KDQpPaywgYW5vdGhlciBnb29kIHJl
YXNvbiB0byBhdCBsZWFzdCBub3QgdXNlIHRoZSBtaW5vcj1saW5lbnVtIGFwcHJvYWNoLg0KDQpD
aHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPj4+IFJlZ2FyZHMsDQo+Pj4gQ2hyaXN0aWFuLg0KPj4+
DQo+Pj4+ICAgICBJIGRvbid0IHNlZSBhIG5lZWQgdG8gY29tcGxpY2F0ZQ0KPj4+PiB0aGUgaW50
ZXJmYWNlcyBtb3JlIGJ5IGhhdmluZyBtYWpvciBhbmQgYSBrZXkuICBBcyB5b3UgY2FuIHNlZSBp
biB0aGUNCj4+Pj4gZXhhbXBsZXMgYmVsb3csIHRoZSBkcm0gZGV2aWNlIG1pbm9yIGNvcnJlc3Bv
bmRzIHRvIHRoZSBsaW5lIG51bWJlci4NCj4+Pj4gSSBhbSBub3Qgc3VyZSBob3cgc3RyaWN0IGNn
cm91cCB1cHN0cmVhbSBpcyBhYm91dCB0aGUgY29udmVudGlvbiBidXQgSQ0KPj4+PiBhbSBob3Bp
bmcgdGhlcmUgYXJlIGZsZXhpYmlsaXR5IGhlcmUgdG8gYWxsb3cgZm9yIHdoYXQgSSBoYXZlDQo+
Pj4+IGltcGxlbWVudGVkLiAgVGhlcmUgYXJlIGEgY291cGxlIG9mIG90aGVyIHRoaW5ncyBJIGhh
dmUgZG9uZSB0aGF0IGlzDQo+Pj4+IG5vdCBkZXNjcmliZWQgaW4gdGhlIGNvbnZlbnRpb246IDEp
IGluY2x1c2lvbiBvZiByZWFkLW9ubHkgKi5oZWxwIGZpbGUNCj4+Pj4gYXQgdGhlIHJvb3QgY2dy
b3VwLCAyKSB1c2UgcmVhZC1vbmx5ICh3aGljaCBJIGNhbiBwb3RlbnRpYWxseSBtYWtlIHJ3KQ0K
Pj4+PiAqLmRlZmF1bHQgZmlsZSBpbnN0ZWFkIG9mIGhhdmluZyBhIGRlZmF1bHQgZW50cmllcyAo
c2luY2UgdGhlIGRlZmF1bHQNCj4+Pj4gY2FuIGJlIGRpZmZlcmVudCBmb3IgZGlmZmVyZW50IGRl
dmljZXMpIGluc2lkZSB0aGUgY29udHJvbCBmaWxlcyAodGhpcw0KPj4+PiB3YXksIHRoZSByZXNl
dHRpbmcgb2YgY2dyb3VwIHZhbHVlcyBmb3IgYWxsIHRoZSBkcm0gZGV2aWNlcywgY2FuIGJlDQo+
Pj4+IGRvbmUgYnkgYSBzaW1wbGUgJ2NwJy4pDQo+Pj4+DQo+Pj4+Pj4gVXNhZ2UgZXhhbXBsZXM6
DQo+Pj4+Pj4gLy8gc2V0IGxpbWl0IGZvciBjYXJkMSB0byAxR0INCj4+Pj4+PiBzZWQgLWkgJzJz
Ly4qLzEwNzM3NDE4MjQvJyAvc3lzL2ZzL2Nncm91cC88Y2dyb3VwPi9kcm0uYnVmZmVyLnRvdGFs
Lm1heA0KPj4+Pj4+DQo+Pj4+Pj4gLy8gc2V0IGxpbWl0IGZvciBjYXJkMCB0byA1MTJNQg0KPj4+
Pj4+IHNlZCAtaSAnMXMvLiovNTM2ODcwOTEyLycgL3N5cy9mcy9jZ3JvdXAvPGNncm91cD4vZHJt
LmJ1ZmZlci50b3RhbC5tYXgNCj4+Pj4+PiAgICAgLyoqIEBmaWxlIGRybV9nZW0uYw0KPj4+Pj4+
IEBAIC0xNTQsNiArMTU2LDkgQEAgdm9pZCBkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4+Pj4+PiAgICAgICAgICBvYmotPmhhbmRsZV9jb3VudCA9
IDA7DQo+Pj4+Pj4gICAgICAgICAgb2JqLT5zaXplID0gc2l6ZTsNCj4+Pj4+PiAgICAgICAgICBk
cm1fdm1hX25vZGVfcmVzZXQoJm9iai0+dm1hX25vZGUpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAg
ICBvYmotPmRybWNncnAgPSBnZXRfZHJtY2dycChjdXJyZW50KTsNCj4+Pj4+PiArICAgICBkcm1j
Z3JwX2NoZ19ib19hbGxvYyhvYmotPmRybWNncnAsIGRldiwgc2l6ZSk7DQo+Pj4+PiBXaHkgZG8g
dGhlIGNoYXJnaW5nIGhlcmU/DQo+Pj4+PiBUaGVyZSBpcyBubyBiYWNraW5nIHN0b3JlIHlldCBm
b3IgdGhlIGJ1ZmZlciwgc28gdGhpcyBpcyByZWFsbHkgdHJhY2tpbmcgc29tZXRoaW5nIGFraW4g
dG8gYWxsb3dlZCB2aXJ0dWFsIG1lbW9yeSBmb3IgR0VNIG9iamVjdHM/DQo+Pj4+PiBJcyB0aGlz
IHJlYWxseSB1c2VmdWwgZm9yIGFuIGFkbWluaXN0cmF0b3IgdG8gY29udHJvbD8NCj4+Pj4+IElz
bid0IHRoZSByZXNvdXJjZSB3ZSB3YW50IHRvIGNvbnRyb2wgYWN0dWFsbHkgdGhlIHBoeXNpY2Fs
IGJhY2tpbmcgc3RvcmU/DQo+Pj4+IFRoYXQncyBjb3JyZWN0LiAgVGhpcyBpcyBqdXN0IHRoZSBm
aXJzdCBsZXZlbCBvZiBjb250cm9sIHNpbmNlIHRoZQ0KPj4+PiBiYWNraW5nIHN0b3JlIGNhbiBi
ZSBiYWNrZWQgYnkgZGlmZmVyZW50IHR5cGUgb2YgbWVtb3J5LiAgSSBhbSBpbiB0aGUNCj4+Pj4g
cHJvY2VzcyBvZiBhZGRpbmcgYXQgbGVhc3QgdHdvIG1vcmUgcmVzb3VyY2VzLiAgU3RheSB0dW5l
ZC4gIEkgYW0NCj4+Pj4gZG9pbmcgdGhlIGNoYXJnZSBoZXJlIHRvIGVuZm9yY2UgdGhlIGlkZWEg
b2YgImNyZWF0b3IgaXMgZGVlbWVkIG93bmVyIg0KPj4+PiBhdCBhIHBsYWNlIHdoZXJlIHRoZSBj
b2RlIGlzIHNoYXJlZCBieSBhbGwgKHRoZSBpbml0IGZ1bmN0aW9uLikNCj4+Pj4NCj4+Pj4+PiAr
ICAgICB3aGlsZSAoaSA8PSBtYXhfbWlub3IgJiYgbGltaXRzICE9IE5VTEwpIHsNCj4+Pj4+PiAr
ICAgICAgICAgICAgIHN2YWwgPSAgc3Ryc2VwKCZsaW1pdHMsICJcbiIpOw0KPj4+Pj4+ICsgICAg
ICAgICAgICAgcmMgPSBrc3RydG9sbChzdmFsLCAwLCAmdmFsKTsNCj4+Pj4+IElucHV0IHNob3Vs
ZCBiZSAiS0VZIFZBTFVFIiwgc28gS0VZIHdpbGwgZGV0ZXJtaW5lIGRldmljZSB0byBhcHBseSB0
aGlzIHRvLg0KPj4+Pj4gQWxzbywgcGVyIGNncm91cHMtdjIgZG9jdW1lbnRhdGlvbiBvZiBsaW1p
dHMsIEkgYmVsaWV2ZSBuZWVkIHRvIHBhcnNlIGFuZCBoYW5kbGUgdGhlIHNwZWNpYWwgIm1heCIg
aW5wdXQgdmFsdWUuDQo+Pj4+Pg0KPj4+Pj4gcGFyc2VfcmVzb3VyY2VzKCkgaW4gcmRtYSBjb250
cm9sbGVyIGlzIGV4YW1wbGUgZm9yIGJvdGggb2YgYWJvdmUuDQo+Pj4+IFBsZWFzZSBzZWUgbXkg
cHJldmlvdXMgcmVwbHkgZm9yIHRoZSByYXRpb25hbGUgb2YgbXkgaG9wZSB0byBub3QgbmVlZA0K
Pj4+PiBhIGtleS4gIEkgY2FuIGNlcnRhaW5seSBhZGQgaGFuZGxpbmcgb2YgIm1heCIgYW5kICJk
ZWZhdWx0Ii4NCj4+Pj4NCj4+Pj4NCj4+Pj4+PiArdm9pZCBkcm1jZ3JwX2NoZ19ib19hbGxvYyhz
dHJ1Y3QgZHJtY2dycCAqZHJtY2dycCwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+Pj4+PiAr
ICAgICAgICAgICAgIHNpemVfdCBzaXplKQ0KPj4+Pj4gU2hvdWxkbid0IHRoaXMgcmV0dXJuIGFu
IGVycm9yIGFuZCBiZSBpbXBsZW1lbnRlZCB3aXRoIHNhbWUgc2VtYW50aWNzIGFzIHRoZQ0KPj4+
Pj4gdHJ5X2NoYXJnZSgpIGZ1bmN0aW9ucyBvZiBvdGhlciBjb250cm9sbGVycz8NCj4+Pj4+IEJl
bG93IHdpbGwgYWxsb3cgc3RhdHNfdG90YWxfYWxsb2NhdGVkIHRvIG92ZXJydW4gbGltaXRzX3Rv
dGFsX2FsbG9jYXRlZC4NCj4+Pj4gVGhpcyBpcyBiZWNhdXNlIEkgYW0gY2hhcmdpbmcgdGhlIGJ1
ZmZlciBhdCB0aGUgaW5pdCBvZiB0aGUgYnVmZmVyDQo+Pj4+IHdoaWNoIGRvZXMgbm90IGZhaWwg
c28gdGhlICJ0cnkiIChkcm1jZ3JwX2JvX2Nhbl9hbGxvY2F0ZSkgaXMgc2VwYXJhdGUNCj4+Pj4g
YW5kIHBsYWNlZCBlYXJsaWVyIGFuZCBuZWFyZXIgb3RoZXIgY29uZGl0aW9uIHdoZXJlIGdlbSBv
YmplY3QNCj4+Pj4gYWxsb2NhdGlvbiBtYXkgZmFpbC4gIEluIG90aGVyIHdvcmRzLCB0aGVyZSBh
cmUgbXVsdGlwbGUgcG9zc2liaWxpdGllcw0KPj4+PiBmb3Igd2hpY2ggZ2VtIGFsbG9jYXRpb24g
bWF5IGZhaWwgKGNncm91cCBsaW1pdCBiZWluZyBvbmUgb2YgdGhlbSkgYW5kDQo+Pj4+IHNhdGlz
ZnlpbmcgY2dyb3VwIGxpbWl0IGRvZXMgbm90IG1lYW4gYSBjaGFyZ2UgaXMgbmVlZGVkLiAgSSBj
YW4NCj4+Pj4gY2VydGFpbmx5IGNvbWJpbmUgdGhlIHR3byBmdW5jdGlvbnMgdG8gaGF2ZSBhbiBh
ZGRpdGlvbmFsIHRyeV9jaGFyZ2UNCj4+Pj4gc2VtYW50aWMgYXMgd2VsbCBpZiB0aGF0IGlzIHJl
YWxseSBuZWVkZWQuDQo+Pj4+DQo+Pj4+IFJlZ2FyZHMsDQo+Pj4+IEtlbm55DQo+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+PiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdA0KPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4g
LS0NCj4gRGFuaWVsIFZldHRlcg0KPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24NCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
