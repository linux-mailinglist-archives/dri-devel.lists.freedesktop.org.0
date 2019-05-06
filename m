Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41D114816
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 12:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75998930B;
	Mon,  6 May 2019 10:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5189831
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 10:05:09 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1227.namprd12.prod.outlook.com (10.168.238.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Mon, 6 May 2019 10:05:08 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 10:05:07 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 10/12] drm/amdgpu: add independent DMA-buf export v3
Thread-Topic: [PATCH 10/12] drm/amdgpu: add independent DMA-buf export v3
Thread-Index: AQHVA+Jo6vmdZqU+TkCAx+5OC2JEMKZd3pGA
Date: Mon, 6 May 2019 10:05:07 +0000
Message-ID: <5825dded-25eb-d266-4bb6-5f40d358ae9d@amd.com>
References: <20190426123638.40221-1-christian.koenig@amd.com>
 <20190426123638.40221-10-christian.koenig@amd.com>
 <20190430141638.GT3271@phenom.ffwll.local>
 <09619fce-fa36-2bbc-ad24-7814748a84e0@gmail.com>
 <20190506080455.GC17751@phenom.ffwll.local>
In-Reply-To: <20190506080455.GC17751@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0061.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::38) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6b7076a-4818-4faa-6fa9-08d6d20a514b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1227; 
x-ms-traffictypediagnostic: DM5PR12MB1227:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB122781C3E58D4C5A48EA172083300@DM5PR12MB1227.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(376002)(39860400002)(396003)(189003)(199004)(71200400001)(71190400001)(65806001)(65956001)(2906002)(5660300002)(11346002)(2616005)(446003)(476003)(64126003)(6116002)(486006)(65826007)(6916009)(14454004)(46003)(478600001)(52116002)(8676002)(305945005)(7736002)(966005)(5024004)(256004)(72206003)(14444005)(186003)(99286004)(53936002)(64756008)(66446008)(68736007)(66556008)(386003)(31686004)(66476007)(66946007)(73956011)(25786009)(6436002)(81156014)(81166006)(76176011)(102836004)(6306002)(8936002)(6506007)(6512007)(6246003)(58126008)(31696002)(36756003)(229853002)(4326008)(316002)(86362001)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1227;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eh3ubMJadgWklhIeXi7jHQwY/RSJsKkqnlhfgDM7/1rZJnVhE/pMz2b6vfboM+yT53rV08QLr60oM0s9PO3Gib5Q1cezI8s1DWajs2AZ7F5AJvqvEu7DJLAkl4pW8ZPkYWBLAj1tT+4XHHsiDO4fx5SaO8PepxbK8OaweOCDYEgqFZNRS2zgW7y7HHm+zKC+9sbYFTJk8O/SHWKVWZ6l11ICUWmD5u/9RWJc8vDlPPsqUfPFi/TATsjFlrUlBWEnFOgH0G9S9J68tDkCodIz9kTvlwnGnW5gNpDU/UNU8nNTk3dIWtZz9v809kK8xBmYAJXO0doPXy6qgcXYKD2PU7/ip8q65uNtqZkYELVXteOeQuRtP+LulDQfileLvnHlKAx/Thd5Hl0mva9IJk6PaGr1TOE65rtc8H3k33EvKg4=
Content-ID: <07BC11852FCA3A4BBA504E9661D2CFA8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b7076a-4818-4faa-6fa9-08d6d20a514b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 10:05:07.7420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1227
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRV1QdaKl5lgyeBhKbb/v2H6+03nlYWfN0TDVy+9LBk=;
 b=FrhhVd4SluQgbIihQXf4t45g+oinPiI1hGJFo0Mk5xszyy/r0tlcvlkI6K56AvFqU84sVZjGbGxQZ393Tc7l+qqV2rYyDlmZUFcULv75C+Z01xBzHj4hKUi3J217u2J5Wzw2/CKmgpXOlVJ2gVjIujmDJU9jxBi19RPCD5EhYq8=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMDUuMTkgdW0gMTA6MDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbU05JUF0NCj4+
Pj4gKyAvKiBwaW4gYnVmZmVyIGludG8gR1RUICovDQo+Pj4+ICsgcmV0dXJuIGFtZGdwdV9ib19w
aW4oYm8sIEFNREdQVV9HRU1fRE9NQUlOX0dUVCk7DQo+Pj4gVGhpcyBpcyBraW5kYSB3aGF0IEkg
bWVhbiB3aXRoICJzaG91bGRuJ3Qgd2UgcGluIHRoZSBhdHRhY2htZW50IiAtIGFmYWl1aQ0KPj4+
IHRoaXMgY2FuIGZhaWwgaXMgc29tZW9uZSBhbHJlYWR5IHBpbm5lZCB0aGUgYnVmZmVyIGludG8g
dnJhbS4gQW5kIHRoYXQNCj4+PiBraW5kIG9mIGNoZWNraW5nIGlzIHN1cHBvc2VkIHRvIGhhcHBl
biBpbiB0aGUgYnVmZmVyIGF0dGFjaG1lbnQuDQo+PiBXaHkgaXMgdGhhdCBzdXBwb3NlZCB0byBo
YXBwZW4gb24gdGhlIGF0dGFjaG1lbnQ/IEkgbWVhbiBpdCBjb3VsZCBiZSBuaWNlIHRvDQo+PiBo
YXZlIGZvciBkZWJ1Z2dpbmcsIGJ1dCBJIHN0aWxsIGRvbid0IHNlZSBhbnkgcHJhY3RpY2FsIHJl
YXNvbiBmb3IgdGhpcy4NCj4gZG1hX2J1Zl9hdHRhY2ggaXMgc3VwcG9zZWQgdG8gbWFrZSBzdXJl
IHRoZSBidWZmZXIgd29uJ3QgbGFuZCBzb21ld2hlcmUNCj4gd2hlcmUgeW91IGNhbid0IGdldCBh
dCBpdCBhbnltb3JlLiBXcnQgcGluIHRoYXQgbWVhbnMgdGhlIGV4cG9ydGVyIG5lZWRzDQo+IHRv
IG1ha2Ugc3VyZSBpdCBjYW4ndCBnZXQgcGlubmVkIGludG8gYSB3cm9uZyBwbGFjZSwgYW5kIGFs
c28gaXNuJ3QgcGlubmVkDQo+IGludG8gYSB3cm9uZyBwbGFjZSBhbnltb3JlLiBUaGF0J3Mgd2h5
IEkgdGhpbmsgcGlubmluZyB0aWVzIGluIHdpdGgNCj4gZG1hX2J1Zl9hdHRhY2ggYW5kIG5vdCB0
aGUgb3ZlcmFsbCBidWZmZXIuDQo+DQo+IEluIGEgd2F5IHRoZXJlJ3MgdHdvIHBpZWNlcyBvZiBh
IHBpbjoNCj4gLSBEbyBub3QgbW92ZSB0aGUgYnVmZmVyIGFueW1vcmUuDQo+IC0gTWFrZSBzdXJl
IEkgY2FuIHN0aWxsIGdldCBhdCBpdC4NCj4NCj4gSW50ZXJuYWxseSB0aGUgMm5kIHBhcnQgaXMg
ZW5jb2RlZCBpbiB0aGUgZG9tYWluIHBhcmFtZXRlciB5b3UgcGFzcyB0bw0KPiBhbWRncHVfYm9f
cGluLiBXaGVuIGdvaW5nIHRocm91Z2ggZG1hLWJ1ZiB0aGF0IGluZm9ybWF0aW9uIGlzIGRlcml2
ZWQNCj4gZnJvbSB0aGUgYXR0YWNobWVudCAoZS5nLiBpZiBpdCdzIGEgcDJwIG9uZSwgdGhlbiB5
b3UgY2FuIHB1dCBpdCB3aGVyZXZlcg0KPiB5b3UgZmVlbCBsaWtlLCBpZiBpdCdzIGEgbm9ybWFs
IG9uZSBpdCBtdXN0IGJlIGluIHN5c3RlbSByYW0pLiBUaGUgZG1hLWJ1Zg0KPiBhbG9uZSBkb2Vz
bid0IHRlbGwgeW91IF93aGVyZV8gdG8gcGluIHNvbWV0aGluZy4NCg0KT2ssIHRoYXQgZmluYWxs
eSBtYWtlcyBzb21lIHNlbnNlLiBTbyB0aGUgYXR0YWNobWVudCBkZXNjcmliZXMgd2hlcmUgdGhl
IA0KYnVmZmVyIG5lZWRzIHRvIGJlIGZvciB0aGUgYXR0YWNoaW5nIGRldmljZS91c2UgY2FzZSB0
byBiZSBhYmxlIHRvIA0KYWNjZXNzIGl0Lg0KDQpHb2luZyB0byBjaGFuZ2UgaXQgdG8gdXNlIGFu
IGF0dGFjaG1lbnQgaW5zdGVhZC4NCg0KPj4gV2VsbCBjb21wbGV0ZWx5IGFtZGdwdSBpbnRlcm5h
bCBoYW5kbGluZyBoZXJlLiBLZXkgcG9pbnQgaXMgd2UgaGF2ZSBib3RoDQo+PiBwcmVmZXJyZWRf
ZG9tYWlucyBhcyB3ZWxsIGFzIGFsbG93ZWRfZG9tYWlucy4NCj4+DQo+PiBEdXJpbmcgY29tbWFu
ZCBzdWJtaXNzaW9uIHdlIGFsd2F5cyB0cnkgdG8gbW92ZSBhIEJPIHRvIHRoZQ0KPj4gcHJlZmVy
cmVkX2RvbWFpbnMgYWdhaW4uDQo+Pg0KPj4gTm93IHdoYXQgY291bGQgaGFwcGVuIGlmIHdlIGRv
bid0IGhhdmUgdGhpcyBjaGVjayBpcyB0aGUgZm9sbG93aW5nOg0KPj4NCj4+IDEuIEJPIGlzIGFs
bG9jYXRlIGluIFZSQU0uIEFuZCBwcmVmZXJyZWRfZG9tYWlucyBzYXlzIG9ubHkgVlJBTSBwbGVh
c2UsIGJ1dA0KPj4gYWxsb3dlZF9kb21haW5zIHNheXMgVlJBTSBvciBHVFQuDQo+Pg0KPj4gMi4g
RE1BLWJ1ZiBJbXBvcnRlciBjb21lcyBhbG9uZyBhbmQgbW92ZXMgdGhlIEJPIHRvIEdUVCwgd2hp
Y2ggaXMgcGVyZmVjdGx5DQo+PiB2YWxpZCBiZWNhdXNlIG9mIHRoZSBhbGxvd2VkX2RvbWFpbnMu
DQo+Pg0KPj4gMy4gQ29tbWFuZCBzdWJtaXNzaW9uIGlzIG1hZGUgYW5kIG1vdmVzIHRoZSBCTyB0
byBWUkFNIGFnYWluLg0KPj4NCj4+IDQuIEltcG9ydGVyIGNvbWVzIGFsb25nIGFuZCBtb3ZlcyB0
aGUgQk8gdG8gR1RULg0KPj4gLi4uLg0KPj4NCj4+IEUuZy4gYSBuaWNlIHBpbmcvcG9uZyBzaXR1
YXRpb24gd2hpY2gganVzdCBlYXRzIHVwIG1lbW9yeSBiYW5kd2lkdGguDQo+IEhtIHllYWggdGhl
IHBpbmcvcG9uZyBpcyBiYWQsIGJ1dCBJIGZpZ3VyZSB5b3UgaGF2ZSB0byBhbHJlYWR5IGhhbmRs
ZSB0aGF0DQo+ICh3aXRoIHNvbWUgYmlhcyBvciB3aGF0ZXZlcikuIE91dHJpZ2h0IGRpc2FibGlu
ZyBpbnZhbGlkYXRlL2R5bmFtaWMNCj4gZG1hLWJ1ZiBzZWVtcyBsaWtlIG92ZXJraWxsLg0KPg0K
PiBXaGF0IGFib3V0IHVwZ3JhZGdpbmcgcHJlZmVycmVkX2RvbWFpbnMgdG8gaW5jbHVkZSBHVFQg
aGVyZT8gRGVmYWN0byB3aGF0DQo+IHlvdSBkbyBpcyBmb3JjaW5nIEdUVCwgc28ganVzdCBhZGRp
bmcgR1RUIGFzIGEgcG9zc2libGUgZG9tYWluIHNlZW1zIGxpa2UNCj4gdGhlIGJldHRlciBjaG9p
Y2UuIEJvbnVzIHBvaW50cyBmb3IgdW5kb2luZyB0aGF0IHdoZW4gdGhlIGxhc3QgaW1wb3J0ZXIN
Cj4gZGlzYXBwZWFycy4NCg0KV2VsbCB0aGF0J3MgZXhhY3RseSB3aGF0IHdlIHdhbnQgdG8gYXZv
aWQgaGVyZS4NCg0KVGhlIHByZWZlcnJlZF9kb21haW5zIGlzIHdoZXJlIHVzZXJzcGFjZSBsaWtl
cyB0aGUgYnVmZmVyIHRvIGJlIGFuZCANCnNob3VsZCBuZXZlciBiZSBjaGFuZ2VkIGJ5IHRoZSBr
ZXJuZWwuDQoNClRoZSBhbGxvd2VkX2RvbWFpbnMgaXMgd2hlcmUgdGhlIGJ1ZmZlciBzaG91bGQg
YmUgYmFzZWQgb24gdGhlIGhhcmR3YXJlIA0KcmVzdHJpY3Rpb25zIGFuZCBpcyB1c3VhbGx5IHVw
ZGF0ZWQgYnkgdGhlIGtlcm5lbCBkcml2ZXIuDQoNCj4gSW4gZ2VuZXJhbCBJIHRoaW5rIGR5bmFt
aWMgZG1hLWJ1ZiBuZWVkcyB0byBiZSBhYmxlIHRvIGhhbmRsZSB0aGlzDQo+IHNvbWVob3csIG9y
IGl0IHdvbid0IHJlYWxseSB3b3JrLiBTaW1wbGVzdCBpcyBwcm9iYWJseSB0byBqdXN0IHN0b3Ag
bW92aW5nDQo+IGJ1ZmZlcnMgYXJvdW5kIHNvIG11Y2ggZm9yIGJ1ZmZlcnMgdGhhdCBhcmUgZHlu
YW1pY2FsbHkgZXhwb3J0ZWQgKHNvIG1heWJlDQo+IGNvdWxkIGFsc28gY2hhbmdlIHRoYXQgaW4g
dGhlIENTIGlvY3RsIHRvIG5vdCBtb3ZlIGV4cG9ydGVkIGJ1ZmZlcnMNCj4gYW55bW9yZSwgd291
bGQgYWNoaWV2ZSB0aGUgc2FtZSkuDQoNClllYWgsIHRoYXQncyB0aGUgb2J2aW91cyBhbHRlcm5h
dGl2ZS4gQnV0IEkgZGlkbid0IHdhbnRlZCB0byBhZGQgZXZlbiANCm1vcmUgY29tcGxleGl0eSB0
byB0aGUgcGF0Y2ggcmlnaHQgbm93Lg0KDQpDbGVhbmluZyB0aGlzIHVwIGlzIHB1cmUgYW1kZ3B1
IGludGVybmFsbHksIGUuZy4gd2UgbmVlZCB0byBtYWtlIHN1cmUgdG8gDQpub3QgbW92ZSBidWZm
ZXJzIGFyb3VuZCBzbyBtdWNoIG9uIGNvbW1hbmQgc3VibWlzc2lvbi4NCg0KQ2hyaXN0aWFuLg0K
DQo+IC1EYW5pZWwNCj4gLS0NCj4gRGFuaWVsIFZldHRlcg0KPiBTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24NCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
