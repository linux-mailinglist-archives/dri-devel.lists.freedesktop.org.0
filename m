Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C22DBC77A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5954989CB8;
	Tue, 24 Sep 2019 12:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B71989CB8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 12:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMXiJtACir+PWVc4iPFyg61NwlVd2DnfQqWDZywH8A19KZe3sJiDuu/VuFtmDqyPdxxPSoWJfsskfsBIBKbXuaRfGkMRGMtVO4SkbUQKRfM7SSPBMy+IuoLz8kEIEdVtYr4Eqfv2kt0xx/VBK3BdfIrQCvNawzhE78WPtos2rPrZtawwerVlcrlF3fjfBprO0bJrGH9UJRCkp4SMefSmGB2drGU0J2ZKjLX8CsGmqSCfokC8tGNstPAmGEvqhjd2Rnfu4l34Gs3h+OzDkjr7Pv5L1d+ovejoM6zXU+16hy9yA7s8RRw4tkfme0VYU67gmiCArHEclqLSSIPbXCeOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLbPwhrP6VZzzI+PA7ItVdyZa/XmHzD6/saHV/V4oxA=;
 b=F/NfpIM35EoNDmXkriOoXQPsM1BDmDrjAZQbT1W6I7041Ls5k8+545kooYDBTj8akkTuw0ZopzCotTF9pg042RSvmGXaQ47Nz5KTt/KBOsaD6c0kIdOTWINNZoCbgq1knNWpZeiXQXpDdgKRWuvHaUwsA9fS6aDxx3owZ1MgJ8DHuqJ8EPcGYEx5Pc2MMuKLC/XWKtr+k+3FL5mH12PywYQXLRqCR8jATLj3PIcMOAPUmqdULOQUBsA6TqMr/yIyc1XBkZF26BXpmucGBNmJOt3snLU5t7COCls0zgJhI7vec09s0Ibcj8PV9+N89we+86KkZcPOo9yjvSLwTQgJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1417.namprd12.prod.outlook.com (10.168.236.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 12:03:09 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 12:03:09 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>
Subject: Re: TTM huge page-faults WAS: Re: [RFC PATCH 1/2] x86: Don't let
 pgprot_modify() change the page encryption bit
Thread-Topic: TTM huge page-faults WAS: Re: [RFC PATCH 1/2] x86: Don't let
 pgprot_modify() change the page encryption bit
Thread-Index: AQHVY9W/NbX8l5jE2EqdnkeqDdb24qcdIPeAgAAShQCAAADnAIAH6LoAgAA2koCAAOVxgIAAEXGAgABB0YCAABGEAIAUOneA
Date: Tue, 24 Sep 2019 12:03:09 +0000
Message-ID: <a4fad2e1-c64d-a237-c07a-f480fe1a3351@amd.com>
References: <20190905103541.4161-1-thomas_os@shipmail.org>
 <20190905103541.4161-2-thomas_os@shipmail.org>
 <608bbec6-448e-f9d5-b29a-1984225eb078@intel.com>
 <b84d1dca-4542-a491-e585-a96c9d178466@shipmail.org>
 <20190905152438.GA18286@infradead.org>
 <10185AAF-BFB8-4193-A20B-B97794FB7E2F@amacapital.net>
 <92171412-eed7-40e9-2554-adb358e65767@shipmail.org>
 <d6da6e46-d283-9efc-52cb-9f2a6b0b7188@amd.com>
 <cace2653-447f-bcdc-2714-142d9dc85787@shipmail.org>
 <ea486b68-7751-e51f-5a59-7e1f145820f4@amd.com>
 <46a21ca5-a395-e644-9eed-77ea26fc871e@shipmail.org>
In-Reply-To: <46a21ca5-a395-e644-9eed-77ea26fc871e@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::34) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76803cd5-8a72-4b4e-6700-08d740e72a89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1417; 
x-ms-traffictypediagnostic: DM5PR12MB1417:
x-microsoft-antispam-prvs: <DM5PR12MB141789C331944F9F93F7DD2783840@DM5PR12MB1417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(51444003)(6116002)(14454004)(6246003)(25786009)(478600001)(486006)(58126008)(14444005)(65806001)(186003)(446003)(65956001)(31686004)(31696002)(66556008)(66446008)(81166006)(11346002)(64756008)(8676002)(256004)(2616005)(316002)(66476007)(66946007)(6916009)(54906003)(476003)(102836004)(8936002)(81156014)(71200400001)(46003)(71190400001)(76176011)(386003)(229853002)(6512007)(53546011)(6506007)(86362001)(7736002)(66574012)(52116002)(6486002)(99286004)(2906002)(4326008)(6436002)(5660300002)(36756003)(305945005)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1417;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lqRlDSAaMrDJfLWNch4jGCh1ZKSYti4pV4uRvQVIoqW13XBhZbyIydu0b2vgmtbbxjBh94UGgwySZgR0epjKMmZmehZ91gFocv0aG4DKjKRIRxpiRkFIFhWk+NVsJcYVQXOFgOvg1K8ZrIOYxsukCMryzbJpD04PpNW4gxH+xL54+JU4HbZ0fw3Y82+u1qPnB14tBv+rHjrz765Ms6dGNlMEi68DY98S6J+zYMyyAMZOmxv0N/FUadNAytBsKVL5GJnSHvQsvjcNHQnc6Fmd3HSo2LJdDs3PH3ILjANjGRUbjGxIqCxYQzYHs8rV/basY7i2woFRr1dky5fzyZJltL4DU4aSF7MS0eUsYyXRxhkpsP94BxsEgsANV7JnZC0sxTQZ90V8vFjnZRtbWL4wdGthFFmDxxH6SS8WsuRGWv8=
x-ms-exchange-transport-forked: True
Content-ID: <07F22D1394BF424F82E36F80465161B0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76803cd5-8a72-4b4e-6700-08d740e72a89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 12:03:09.3834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6/Xz3GzRn4xFbZlyt6PYcZ+tbnE51DqpU1h+9nioGjmlxrpfWEpAe3k56tB103/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLbPwhrP6VZzzI+PA7ItVdyZa/XmHzD6/saHV/V4oxA=;
 b=Pa7yE3iU2/ksjkLPeCZsMjK1uBHxmXo/xWTz3rszXuhvUz8tI6FOL8EBXpaQNg/CeTNZ9dM9QGbyd/f/PYsAxZnwv18BXff2e7V16DYiFA7B7lj5680KAcTKMLSTgYulGhIlrSXsoKb1sTiz3Mu3VNT+YlhyNHja3fQFhrrsXQM=
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDkuMTkgdW0gMTc6MDggc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
Cj4gT24gOS8xMS8xOSA0OjA2IFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+IEFtIDEx
LjA5LjE5IHVtIDEyOjEwIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6DQo+PiBb
U05JUF0NCj4+Pj4+IFRoZSBwcm9ibGVtIHNlZW4gaW4gVFRNIGlzIHRoYXQgd2Ugd2FudCB0byBi
ZSBhYmxlIHRvIGNoYW5nZSB0aGUNCj4+Pj4+IHZtX3BhZ2VfcHJvdCBmcm9tIHRoZSBmYXVsdCBo
YW5kbGVyLCBidXQgaXQncyBwcm9ibGVtYXRpYyBzaW5jZSB3ZQ0KPj4+Pj4gaGF2ZSB0aGUgbW1h
cF9zZW0gdHlwaWNhbGx5IG9ubHkgaW4gcmVhZCBtb2RlLiBIZW5jZSB0aGUgZmFrZSB2bWENCj4+
Pj4+IGhhY2suIEZyb20gd2hhdCBJIGNhbiB0ZWxsIGl0J3MgcmVhc29uYWJseSB3ZWxsLWJlaGF2
ZWQsIHNpbmNlDQo+Pj4+PiBwdGVfbW9kaWZ5KCkgc2tpcHMgdGhlIGJpdHMgVFRNIHVwZGF0ZXMs
IHNvIG1wcm90ZWN0KCkgYW5kIG1yZW1hcCgpDQo+Pj4+PiB3b3JrcyBPSy4gSSB0aGluayBzcGxp
dF9odWdlX3BtZCBtYXkgcnVuIGludG8gdHJvdWJsZSwgYnV0IHdlIGRvbid0DQo+Pj4+PiBzdXBw
b3J0IGl0ICh5ZXQpIHdpdGggVFRNLg0KPj4+PiBBaCEgSSBhY3R1YWxseSByYW4gaW50byB0aGlz
IHdoaWxlIGltcGxlbWVudGluZyBodWdlIHBhZ2Ugc3VwcG9ydCBmb3INCj4+Pj4gVFRNIGFuZCBu
ZXZlciBmaWd1cmVkIG91dCB3aHkgdGhhdCBkb2Vzbid0IHdvcmsuIERyb3BwZWQgQ1BVIGh1Z2Ug
cGFnZQ0KPj4+PiBzdXBwb3J0IGJlY2F1c2Ugb2YgdGhpcy4NCj4+PiBCeSBpbmNpZGVudCwgSSBn
b3Qgc2xpZ2h0bHkgc2lkZXRyYWNrZWQgdGhlIG90aGVyIGRheSBhbmQgc3RhcnRlZA0KPj4+IGxv
b2tpbmcgYXQgdGhpcyBhcyB3ZWxsLiBHb3QgdG8gdGhlIHBvaW50IHdoZXJlIEkgZmlndXJlZCBv
dXQgYWxsIHRoZQ0KPj4+IGhhaXJ5IGFsaWdubWVudCBpc3N1ZXMgYW5kIGFjdHVhbGx5IGdvdCBo
dWdlX2ZhdWx0KCkgY2FsbHMsIGJ1dCBuZXZlcg0KPj4+IGltcGxlbWVudGVkIHRoZSBoYW5kbGVy
LiBJIHRoaW5rIHRoYXQncyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3b3J0aA0KPj4+IGhhdmluZy4g
Tm90IHN1cmUgaXQgd2lsbCB3b3JrIGZvciBJTyBtZW1vcnksIHRob3VnaCwgKHNwbGl0X2h1Z2Vf
cG1kDQo+Pj4gd2lsbCBqdXN0IHNraXAgbm9uLXBhZ2UtYmFja2VkIG1lbW9yeSkgYnV0IGlmIHdl
IG9ubHkgc3VwcG9ydA0KPj4+IFZNX1NIQVJFRCAobm9uIENPVykgdm1hcyB0aGVyZSdzIG5vIHJl
YXNvbiB0byBzcGxpdCB0aGUgaHVnZSBwbWRzDQo+Pj4gYW55d2F5LiBEZWZpbml0ZWx5IHNvbWV0
aGluZyB3ZSBzaG91bGQgaGF2ZSBJTU8uDQo+PiBXZWxsIG91ciBwcmltYXJ5IHVzZSBjYXNlIHdv
dWxkIGJlIElPIG1lbW9yeSwgY2F1c2Ugc3lzdGVtIG1lbW9yeSBpcw0KPj4gb25seSBvcHRpb25h
bGx5IGFsbG9jYXRlIGFzIGh1Z2UgcGFnZSBidXQgd2UgbmVhcmx5IGFsd2F5cyBhbGxvY2F0ZSBW
UkFNDQo+PiBpbiBjaHVua3Mgb2YgYXQgbGVhc3QgMk1CIGJlY2F1c2Ugd2Ugb3RoZXJ3aXNlIGdl
dCBhIGh1Z2UgcGVyZm9ybWFuY2UNCj4+IHBlbmFsdHkuDQo+DQo+IEJ1dCB0aGF0IHN5c3RlbSBt
ZW1vcnkgb3B0aW9uIGlzIG9uIGJ5IGRlZmF1bHQsIHJpZ2h0PyBJbiBhbnkgY2FzZSwgYSANCj4g
cmVxdWVzdCBmb3IgYSBodWdlX2ZhdWx0DQo+IHdvdWxkIHByb2JhYmx5IG5lZWQgdG8gY2hlY2sg
dGhhdCB0aGVyZSBpcyBhY3R1YWxseSBhbiB1bmRlcmx5aW5nIA0KPiBodWdlX3BhZ2UgYW5kIG90
aGVyd2lzZSBmYWxsYmFjayB0byBvcmRpbmFyeSBmYXVsdHMuDQo+DQo+IEFub3RoZXIgcmVxdWly
ZW1lbnQgd291bGQgYmUgZm9yIElPIG1lbW9yeSBhbGxvY2F0aW9ucyB0byBiZSANCj4gUE1EX1BB
R0VfU0laRSBhbGlnbmVkIGluIHRoZSBtYXBwYWJsZSBhcGVydHVyZSwgdG8gYXZvaWQgZmFsbGJh
Y2tzIHRvIA0KPiBvcmRpbmFyeSBmYXVsdHMuIFByb2JhYmx5IGluY3JlYXNpbmcgZnJhZ21lbnRh
dGlvbiBzb21ld2hhdC4gKFNlZW1zIA0KPiBsaWtlIHBtZCBlbnRyaWVzIGNhbiBvbmx5IHBvaW50
IHRvIFBNRF9QQUdFX1NJWkUgYWxpZ25lZCBwaHlzaWNhbCANCj4gYWRkcmVzc2VzKSBXb3VsZCB0
aGF0IHdvcmsgZm9yIHlvdT8NCg0KWWVhaCwgd2UgZG8gaXQgdGhpcyB3YXkgYW55d2F5Lg0KDQpS
ZWdhcmRzLA0KQ2hyaXN0aWFuLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
