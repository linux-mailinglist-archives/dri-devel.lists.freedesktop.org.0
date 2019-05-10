Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62821A299
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 19:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC456E7B0;
	Fri, 10 May 2019 17:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9206E7B1;
 Fri, 10 May 2019 17:48:34 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1882.namprd12.prod.outlook.com (10.175.91.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 17:48:32 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 17:48:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Topic: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Index: AQHVB0DJVkIxCCCoYECMKlqE0zp4P6ZkdgmAgAAEsgCAACfkAA==
Date: Fri, 10 May 2019 17:48:32 +0000
Message-ID: <64d12227-a0b9-acee-518c-8c97c5da4136@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <f63c8d6b-92a4-2977-d062-7e0b7036834e@gmail.com>
 <CAOWid-fpHqvq35C+gfHmLnuHM9Lj+iiHFXE=3RPrkAiFL2=wvQ@mail.gmail.com>
 <1ca1363e-b39c-c299-1d24-098b1059f7ff@amd.com>
 <CAOWid-eVz4w-hN=4tPZ1AOu54xMH_2ztDDZaMEKRCAeBgt9Dyw@mail.gmail.com>
In-Reply-To: <CAOWid-eVz4w-hN=4tPZ1AOu54xMH_2ztDDZaMEKRCAeBgt9Dyw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:3e::22) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96a6fb4b-ca3e-41fe-6b1c-08d6d56fb7d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1882; 
x-ms-traffictypediagnostic: DM5PR12MB1882:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1882AA900EA5043CC84A319A830C0@DM5PR12MB1882.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(346002)(39860400002)(396003)(199004)(189003)(72206003)(305945005)(81156014)(25786009)(65826007)(68736007)(71190400001)(1411001)(54906003)(6506007)(966005)(478600001)(36756003)(386003)(58126008)(229853002)(6436002)(316002)(64126003)(81166006)(6486002)(2906002)(53546011)(2616005)(102836004)(11346002)(65956001)(446003)(476003)(186003)(46003)(65806001)(486006)(8676002)(4326008)(7736002)(66574012)(99286004)(71200400001)(8936002)(6246003)(6916009)(53936002)(6116002)(31686004)(6306002)(6512007)(66946007)(73956011)(14444005)(14454004)(52116002)(256004)(66476007)(64756008)(66556008)(66446008)(76176011)(5660300002)(86362001)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1882;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 36uvzz1UErxgycaBj/uSBnRN35fJ1j95N4L8kaedj5W8ulov2E2M9BVVWNNzKi+SVvbUQj/g8F6oMmKBxB6l8aRZDPDr3sFfNPl6qOATuoEwDMt4dG9IcMsbDhUDDMKzOAZWq/+FPb6l1ZX5gn5rdpgSw0NWm/rHM0snBbieV60fVm7VRcg8WqHiWqz4uktysgFKwoyYQDxQ7a9jBDsHDWOxHl4Dn7+N50YeFUxG962GrCOVSpL02foI2IyoBQNzpiWy1tKG10lXH5FvQjO+nFdOHZehNUNFvX4bV1RKbv0NyCBcWhQI7KoQvY92P6YlRhNAktL9YI3cOIplj7QcUZayC+Shcl3sQGiPO90K9m0tlqWoQWCc5Jq/sfv1LJs/bzslh1PFokmctvbLdkQO0TpVSJp1uYLqhT3FEUEMIAQ=
Content-ID: <9983955C6C6EAB4889D7F39A79324FF4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a6fb4b-ca3e-41fe-6b1c-08d6d56fb7d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 17:48:32.5228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QWemaJATZzRBd5TNSZtkHDozQzs+DD+66Z/ahgKuPQ=;
 b=ftdH29+HieG86wQVefrm6tkjTP8117eUAxNsdRhf603nmZlHsnNtico3u2HKwAfNX7rfVxzeo7nlTAHRtYXNxLvYvQ3h4Ytm4R+EzPTVJuuY+TdAPa46Ob2fFJcQ2096a3GbsiO4i5o2EhrsDEavNIvfXfuhLarBPvpTX8YlwGA=
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
 Kenny" <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDUuMTkgdW0gMTc6MjUgc2NocmllYiBLZW5ueSBIbzoNCj4gW0NBVVRJT046IEV4dGVy
bmFsIEVtYWlsXQ0KPg0KPiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAxMTowOCBBTSBLb2VuaWcs
IENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+IEFtIDEw
LjA1LjE5IHVtIDE2OjU3IHNjaHJpZWIgS2VubnkgSG86DQo+Pj4gT24gRnJpLCBNYXkgMTAsIDIw
MTkgYXQgODoyOCBBTSBDaHJpc3RpYW4gS8O2bmlnDQo+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tPiB3cm90ZToNCj4+Pj4gQW0gMDkuMDUuMTkgdW0gMjM6MDQgc2NocmllYiBL
ZW5ueSBIbzoNCj4+IFNvIHRoZSBkcm0gY2dyb3VwIGNvbnRhaW5lciBpcyBzZXBhcmF0ZSB0byBv
dGhlciBjZ3JvdXAgY29udGFpbmVycz8NCj4gSW4gY2dyb3VwLXYxLCB3aGljaCBpcyBtb3N0IHdp
ZGVseSBkZXBsb3llZCBjdXJyZW50bHksIGFsbCBjb250cm9sbGVycw0KPiBoYXZlIHRoZWlyIG93
biBoaWVyYXJjaHkgKHNlZSAvc3lzL2ZzL2Nncm91cC8pLiAgSW4gY2dyb3VwLXYyLCB0aGUNCj4g
aGllcmFyY2h5IGlzIHVuaWZpZWQgYnkgaW5kaXZpZHVhbCBjb250cm9sbGVycyBjYW4gYmUgZGlz
YWJsZWQgKEkNCj4gYmVsaWV2ZSwgSSBhbSBub3Qgc3VwZXIgZmFtaWxpYXIgd2l0aCB2Mi4pDQo+
DQo+PiBJbiBvdGhlciB3b3JkcyBhcyBsb25nIGFzIHVzZXJzcGFjZSBkb2Vzbid0IGNoYW5nZSwg
dGhpcyB3b3VsZG4ndCBoYXZlDQo+PiBhbnkgZWZmZWN0Pw0KPiBBcyBmYXIgYXMgdGhpbmdzIGxp
a2UgZG9ja2VyIGFuZCBwb2RtYW4gaXMgY29uY2VybiwgeWVzLiAgSSBhbSBub3QNCj4gc3VyZSBh
Ym91dCB0aGUgYmVoYXZpb3VyIG9mIG90aGVycyBsaWtlIGx4YywgbHhkLCBldGMuIGJlY2F1c2Ug
SQ0KPiBoYXZlbid0IHVzZWQgdGhvc2UgbXlzZWxmLg0KPg0KPj4gV2VsbCB0aGF0IGlzIHVuZXhw
ZWN0ZWQgY2F1c2UgdGhlbiBhIHByb2Nlc3NlcyB3b3VsZCBiZSBpbiBkaWZmZXJlbnQNCj4+IGdy
b3VwcyBmb3IgZGlmZmVyZW50IGNvbnRyb2xsZXJzLCBidXQgaWYgdGhhdCdzIHJlYWxseSB0aGUg
Y2FzZSB0aGF0DQo+PiB3b3VsZCBjZXJ0YWlubHkgd29yay4NCj4gSSBiZWxpZXZlIHRoaXMgaXMg
YSBwb3NzaWJpbGl0eSBmb3IgdjEgYW5kIGlzIHdoeSBmb2xrcyBjYW1lIHVwIHdpdGgNCj4gdGhl
IHVuaWZpZWQgaGllcmFyY2h5IGluIHYyIHRvIHNvbHZlIHNvbWUgb2YgdGhlIGlzc3Vlcy4NCj4g
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvYWRtaW4tZ3VpZGUvY2dyb3Vw
LXYyLmh0bWwjaXNzdWVzLXdpdGgtdjEtYW5kLXJhdGlvbmFsZXMtZm9yLXYyDQoNCldlbGwgYW5v
dGhlciBxdWVzdGlvbiBpcyB3aHkgZG8gd2Ugd2FudCB0byBwcmV2ZW50IHRoYXQgaW4gdGhlIGZp
cnN0IHBsYWNlPw0KDQpJIG1lYW4gdGhlIHdvcnN0IHRoaW5nIHRoYXQgY2FuIGhhcHBlbiBpcyB0
aGF0IHdlIGFjY291bnQgYSBCTyBtdWx0aXBsZSANCnRpbWVzLg0KDQpBbmQgZ29pbmcgaW50byB0
aGUgc2FtZSBkaXJlY3Rpb24gd2hlcmUgaXMgdGhlIGNvZGUgdG8gaGFuZGxlIGFuIG9wZW4gDQpk
ZXZpY2UgZmlsZSBkZXNjcmlwdG9yIHdoaWNoIGlzIHNlbmQgZnJvbSBvbmUgY2dyb3VwIHRvIGFu
b3RoZXI/DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gUmVnYXJkcywNCj4gS2VubnkN
Cj4NCj4+PiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgdGhlcmUgYXJlIGV4cGVjdGF0aW9ucyBmb3Ig
cmVzb3VyY2UgbWFuYWdlbWVudA0KPj4+IGJldHdlZW4gY29udGFpbmVycywgSSB3b3VsZCBsaWtl
IHRvIGtub3cgd2hvIGlzIHRoZSBleHBlY3RlZCBtYW5hZ2VyDQo+Pj4gYW5kIGhvdyBkb2VzIGl0
IGZpdCBpbnRvIHRoZSBjb25jZXB0IG9mIGNvbnRhaW5lciAod2hpY2ggZW5mb3JjZSBzb21lDQo+
Pj4gbGV2ZWwgb2YgaXNvbGF0aW9uLikgIE9uZSBwb3NzaWJsZSBtYW5hZ2VyIG1heSBiZSB0aGUg
ZGlzcGxheSBzZXJ2ZXIuDQo+Pj4gQnV0IGFzIGxvbmcgYXMgdGhlIGRpc3BsYXkgc2VydmVyIGlz
IGluIGEgcGFyZW50IGNncm91cCBvZiB0aGUgYXBwcycNCj4+PiBjZ3JvdXAsIHRoZSBhcHBzIGNh
biBzdGlsbCBpbXBvcnQgaGFuZGxlcyBmcm9tIHRoZSBkaXNwbGF5IHNlcnZlcg0KPj4+IHVuZGVy
IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiAgTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRo
aXMgaXMNCj4+PiBtb3N0IGxpa2VseSB0aGUgY2FzZSwgd2l0aCB0aGUgZGlzcGxheSBzZXJ2ZXIg
c2ltcGx5IHNpdHRpbmcgYXQgdGhlDQo+Pj4gZGVmYXVsdC9yb290IGNncm91cC4gIEJ1dCBJIGNl
cnRhaW5seSB3YW50IHRvIGhlYXIgbW9yZSBhYm91dCBvdGhlcg0KPj4+IHVzZSBjYXNlcyAoZm9y
IGV4YW1wbGUsIGlzIHJ1bm5pbmcgbXVsdGlwbGUgZGlzcGxheSBzZXJ2ZXJzIG9uIGENCj4+PiBz
aW5nbGUgaG9zdCBhIHJlYWxpc3RpYyBwb3NzaWJpbGl0eT8gIEFyZSB0aGVyZSBwZW9wbGUgcnVu
bmluZw0KPj4+IG11bHRpcGxlIGRpc3BsYXkgc2VydmVycyBpbnNpZGUgcGVlciBjb250YWluZXJz
PyAgSWYgc28sIGhvdyBkbyB0aGV5DQo+Pj4gY29vcmRpbmF0ZSByZXNvdXJjZXM/KQ0KPj4gV2Ug
ZGVmaW5pdGVseSBoYXZlIHNpdHVhdGlvbnMgd2l0aCBtdWx0aXBsZSBkaXNwbGF5IHNlcnZlcnMg
cnVubmluZw0KPj4gKGp1c3QgdGhpbmsgb2YgVlIpLg0KPj4NCj4+IEkganVzdCBjYW4ndCBzYXkg
aWYgdGhleSBjdXJyZW50bHkgdXNlIGNncm91cHMgaW4gYW55IHdheS4NCj4+DQo+PiBUaGFua3Ms
DQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IEkgc2hvdWxkIHByb2JhYmx5IHN1bW1hcml6ZSBzb21l
IG9mIHRoZXNlIGludG8gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPj4+DQo+Pj4gUmVnYXJkcywNCj4+
PiBLZW5ueQ0KPj4+DQo+Pj4NCj4+Pg0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4+DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
