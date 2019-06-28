Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F059591
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DAF6E883;
	Fri, 28 Jun 2019 08:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780058.outbound.protection.outlook.com [40.107.78.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601D06E883
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 08:05:33 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2406.namprd12.prod.outlook.com (52.132.141.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Fri, 28 Jun 2019 08:05:29 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 08:05:29 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Topic: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Index: AQHVLPGOv8ZFH37+40SwLhEqcDKxyqavrjOAgAAKLQCAAATKgIAAANEAgAAEAICAAO1lgIAABzYA
Date: Fri, 28 Jun 2019 08:05:28 +0000
Message-ID: <32b2a05f-735a-92ef-cc09-67b8017015ee@amd.com>
References: <20190627140626.GA6027@mwanda>
 <41b33cc3-2f07-681a-5fee-25a328de46bd@amd.com>
 <20190627165532.GD10652@lst.de>
 <278388a6-bd2d-2891-19be-97e33bc470a5@amd.com>
 <20190627171536.GA11117@lst.de>
 <f851fb21-fdf6-f5d7-0f53-7d6ed060b191@amd.com>
 <20190628073935.GA29114@lst.de>
In-Reply-To: <20190628073935.GA29114@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::20) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f74024c-5dd1-48bf-b0b3-08d6fb9f6229
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2406; 
x-ms-traffictypediagnostic: DM5PR12MB2406:
x-microsoft-antispam-prvs: <DM5PR12MB2406D0F34D744BCB6E4370BA83FC0@DM5PR12MB2406.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(189003)(199004)(58126008)(72206003)(4326008)(5660300002)(229853002)(256004)(14444005)(305945005)(31696002)(36756003)(186003)(86362001)(6246003)(7736002)(478600001)(66946007)(66476007)(66556008)(65806001)(65956001)(73956011)(65826007)(66446008)(64756008)(6916009)(31686004)(14454004)(316002)(476003)(6512007)(68736007)(81156014)(446003)(11346002)(81166006)(486006)(8676002)(6116002)(99286004)(2616005)(6436002)(2906002)(6486002)(8936002)(76176011)(102836004)(71190400001)(71200400001)(54906003)(53936002)(386003)(6506007)(64126003)(25786009)(52116002)(46003)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2406;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A5jqc0oL6jwPyaqbr9uqhqqlsvB1k8QRpbKZNSm37BM/HGyRxoVB6VXKx+b0Hc7gYqB2cBmWvN9RyY0oStpsW6y71yzcoofWKfnsaHPpMJiPD7ROjggXlz2+n+huXog5GAeJn+DEZFWTgYe3O4u8f0e8XU91Oq3SK6EjTdcaNOKRltzciEarFJFghKPvwcyztcAseJzzNY7CbPllilQYORs5NGoL30HQ4Y4iP4LDfzI9s+zz1+aeduvTkZer16aaJWiM753JXrFX9SQgfznEfhOwIVHPUz2ve9c29CUwCXod8H9/TqIoeFbSMUykxQNsyXty+7iMGE6KjJSYs8Eep/zVFomHFGzjS/60Gp6jOn133HqAGBHoj7Bdq5IF5o3eQ3n6IyyUZSXPCpJUe3Ow73vAJOtiscOQ0RdUlvA44+k=
Content-ID: <1F006A044BA8D741AACBF8FDFB900B3C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f74024c-5dd1-48bf-b0b3-08d6fb9f6229
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 08:05:28.9038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2406
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXud1WojA+K14oLGivnIO3g3DObE3N5TU0weOaxCmfM=;
 b=bzP29iTsWIuqFrQp2vpXVd6j4LpQuyt+G5GencsnloRtOwWNfhOeMZYaZ1CMJizBgPJlb7AqTI4FNaac4YKLx9zmD4qCJ5VcON4Z4htCGrFBAcEsuAY0TSSMb9IQ4BmrXwWr3r6cOhTbQqUSx+7uhGSuVmcsoHdDUfYesTqOX4w=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDYuMTkgdW0gMDk6Mzkgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gVGh1
LCBKdW4gMjcsIDIwMTkgYXQgMDU6MzA6MDBQTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6DQo+PiBBbSAyNy4wNi4xOSB1bSAxOToxNSBzY2hyaWViIENocmlzdG9waCBIZWxsd2lnOg0K
Pj4+IE9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDA1OjEyOjQ3UE0gKzAwMDAsIEtvZW5pZywgQ2hy
aXN0aWFuIHdyb3RlOg0KPj4+PiB0aGUgd2hvbGUgVFRNIHBhZ2UgYWxsb2NhdGlvbiBjb2RlIGlz
IG5vdCByZWFsbHkgd29ya2luZyB0aGF0IHdlbGwuDQo+Pj4+DQo+Pj4+IEhvdyBkbyB3ZSB0aGVu
IGRvIHRoaW5ncyBsaWtlIG1hcHBpbmcgdGhhdCBtZW1vcnkgdG8gdXNlcnNwYWNlPw0KPj4+IGRt
YV9tbWFwX2F0dHJzIHdpdGggdGhlIHNhbWUgZmxhZ3MgYXMgcGFzc2VkIHRvIGRtYV9hbGxvY19h
dHRycw0KPj4gV2UgbmVlZCBhIHdheSB0byBtYXAgb25seSBhIGZyYWN0aW9uIG9mIGEgVk1BIG9u
IGEgcGFnZSBmYXVsdC7CoCBPZiBoYW5kDQo+PiBJIGRvbid0IHNlZSB0aGF0IHBvc3NpYmxlIHdp
dGggZG1hX21tYXBfYXR0cnMoKS4NCj4gZG1hX21tYXBfYXR0cnMgaXMgaW50ZW50ZWQgdG8gY2Fs
bCBmcm9tIC0+bW1hcCBhbmQgc2V0cyB1cCBhbGwgdGhlDQo+IHBhZ2UgdGFibGVzLiAgVGhhdCBi
ZWluZyBzYWlkIHRoZXJlIGlzIG5vdGhpbmcgaW4gaXQgdGhhdCBwcmV2ZW50cw0KPiB5b3UgZnJv
bSBjYWxsaW5nIGl0IGZvciBwYXJ0cyBvZiBhIG1hcHBpbmcgLSB5b3UganVzdCBuZWVkIHRvIGlu
Y3JlbWVudA0KPiB0aGUgY3B1X2FkZHIgYW5kIGRtYSBhZGRyLCBhbmQgcmVkdWNlIHRoZSBzaXpl
IGJ5IHRoZSBzYW1lIGFtb3VudC4NCj4NCj4gSSBkb24ndCBzZWUgYW55dGhpbmcgb2J2aW91cyB3
aHkgaXQgY291bGQgbm90IGJlIGNhbGxlZCBmcm9tIGENCj4gLT5mYXVsIGhhbmRsZXIsIGJ1dCBJ
IGFsc28gZG9uJ3Qgc2VlIGFueXRoaW5nIG9idmlvdXMgcHJldmVudGluZw0KPiB1cyBmcm9tIGRv
aW5nIHRoYXQuDQoNCldlbGwgdGhlIG9mZnNldCBpbnRvIHRoZSBWTUEgd2hlcmUgdG8gc3RhcnQg
ZmlsbGluZyBpcyBtaXNzaW5nLCBidXQgDQphcGFydCBmcm9tIHRoYXQgSSBhZ3JlZSB0aGF0IHRo
aXMgc2hvdWxkIHByb2JhYmx5IHdvcmsuDQoNCj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgSSBzZWUg
cXVpdGUgYSBidW5jaCBvZiBmdW5jdGlvbnMgd2hpY2ggYXJlIG5lZWRlZCBieQ0KPj4gR1BVIGRy
aXZlcnMgYW5kIGFyZSBub3QgaW1wbGVtZW50ZWQgaW4gdGhlIERNQSBBUEkuDQo+IFdlbGwsIHdl
IGNhbiB3b3JrIG9uIHRoYXQuDQo+DQo+PiBGb3IgZXhhbXBsZSB3ZSBuZWVkIHRvIGJlIGFibGUg
dG8gc2V0dXAgdW5jYWNoZWQgbWFwcGluZ3MsIHRoYXQgaXMgbm90DQo+PiByZWFsbHkgc3VwcG9y
dGVyIGJ5IHRoZSBETUEgQVBJIGF0IHRoZSBtb21lbnQuDQo+IExldHMgcHV0IGl0IGluIGFub3Ro
ZXIgd2F5LiAgT3V0c2lkZSBvZiB4ODYgdW5jYWNoZWQgbWFwcGluZ3MgYXJlIHRoZQ0KPiBub3Jt
LCBidXQgdGhlcmUgaXMgbm8gd2F5IHRvIGV4cGxpY2l0bHkgcmVxdWVzdCB0aGVtIG9uIGFyY2hp
dGVjdHVyZXMNCj4gdGhhdCBhcmUgRE1BIGNvaGVyZW50LiAgQWRkaW5nIGEgRE1BX0FUVFJfVU5D
QUNIRUQgd291bGQgYmUgbW9zdGx5DQo+IHRyaXZpYWwsIHdlIGp1c3QgbmVlZCB0byBkZWZpbmUg
cHJvcGVyIHNlbWFudGljcyBmb3IgaXQuDQoNClNvdW5kcyBnb29kLiBDYW4geW91IGRvIHRoaXM/
IENhdXNlIEkgb25seSBrbm93IHg4NiBhbmQgYSBmZXcgYml0cyBvZiBBUk0uDQoNCj4+IEFkZGl0
aW9uYWwgdG8gdGhhdCB3ZSBuZWVkIGEgd2F5IHRvIGZvcmNlIGEgY29oZXJlbnQgbWFwcGluZ3Mg
d2l0aA0KPj4gZG1hX21hcF9wYWdlKCkgd2hpY2ggZmFpbHMgd2hlbiB0aGlzIGlzbid0IGd1YXJh
bnRlZWQuDQo+IFdlIGNhbid0IGZvcmNlIHRoaW5ncyB0byBiZSBjb2hlcmVudCB0aGF0IHdlcmVu
J3QgYWxsb2NhdGUgc3BlY2lmaWNhbGx5DQo+IHRvIGJlIERNQSBjb2hlcmVudC4gIElmIHlvdSB3
YW50IGNvaGVyZW50IERNQSBtZW1vcnkgaXQgbmVlZHMgdG8gY29tZQ0KPiBmcm9tIGRtYV9hbGxv
Y18qLg0KDQpZZWFoLCBidXQgeW91IGNhbiByZXR1cm4gYW4gZXJyb3IgaW5zdGVhZCBvZiB1c2lu
ZyBib3VuY2UgYnVmZmVycyA6KQ0KDQpTZWUgT3BlbkdMLCBPcGVuQ0wgYW5kIFZ1bGthbiBoYXZl
IEFQSXMgd2hpY2ggYWxsb3cgYW4gYXBwbGljYXRpb24gdG8gDQpnaXZlIGEgbWFsbG9jZWQgcG9p
bnRlciB0byB0aGUgZHJpdmVyIGFuZCBzYXkgaGV5IEkgd2FudCB0byBhY2Nlc3MgdGhpcyANCm1l
bW9yeSBjb2hlcmVudGx5IGZyb20gdGhlIEdQVS4NCg0KSW4gdGhpcyBzaXR1YXRpb24gaXQgaXMg
dmFsaWQgdG8gcmV0dXJuIGFuIGVycm9yIHNheWluZyBzb3JyeSB0aGF0IA0KZGV2aWNlIGNhbid0
IGFjY2VzcyB0aGF0IG1lbW9yeSBjb2hlcmVudGx5LCBidXQgaXQncyBub3Qgb2sgdG8ganVzdCBt
YXAgDQppdCBub24tY29oZXJlbnRseS4NCg0KRm9yIE9wZW5HTCBhbmQgT3BlbkNMIHdlIGNhbiBz
dGlsbCBzYXkgdGhhdCB0aGUgY3VycmVudCBwbGF0Zm9ybSBkb2Vzbid0IA0Kc3VwcG9ydCB0aGlz
IGZlYXR1cmUsIGJ1dCB0aGF0IHJlbmRlcnMgYSBidW5jaCBvZiBhcHBsaWNhdGlvbnMgdW51c2Fi
bGUuDQoNCkZvciBWdWxrYW4gaXQncyBldmVuIHdvcnNlIGJlY2F1c2UgaXQgaXMgYWN0dWFsbHkg
cGFydCBvZiB0aGUgY29yZSBBUEkgDQphcyBmYXIgYXMgSSBrbm93IChidXQgdGFrZSB0aGlzIHdp
dGggYSBncmFpbiBvZiBzYWx0IEknbSBub3QgcmVhbGx5IGFuIA0KdXNlcnNwYWNlIGRldmVsb3Bl
cikuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
