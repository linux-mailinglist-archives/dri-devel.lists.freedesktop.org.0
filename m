Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957AAFC48
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 14:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D500F6EADB;
	Wed, 11 Sep 2019 12:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52E56EAD0;
 Wed, 11 Sep 2019 12:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUm3JMc5cM7vFhOmU/jf5vW+h9Y2U/JsPF//oA38eXwgt6vw7Us7PhoJiVUa/siVNdZj55KxsSYKbEX4ov4X53Y7vmXbNLHO5yb5TahbuKrKS3qWOM4EiO23ejqH0pL6bJ9L31gRmX4NXtXCKm0kZFWn/ZolN8w6A+K7kHMmKO1aelpncVs+2OIt9/aBu3PQUNVOvTIcjGu5ex8mIqegYCRfDov0x2WSpmWrywgXeglYQ1M7UC2m+iUyULKnQ9gkXZPkFp/oF+UqkvTiTqhiP0MBaI87BxBBz1Tg+MVsuWLMXzwceGjR6xv/3BRRVbhoZk1RyiqY8G0ROe1fK5Ut6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqSKOt7zubZ1ymQs4Ejjok3XxNHO/N8rJT43IuGf7Fw=;
 b=TcqKJk8/0WovVBSd5wLAxj9614xgyUhtMxBHl1EAmC5/ByL3txnlFirrUI2JDerMP6/QqUabVk+LfbECeCXvEEIourUUN/bqeMRiKHpcIAenJ4OC7SSiLF9zeOMiz7MFDGeKbBJXwtiqgYa4Q8m1mL9Hv8r/DjLLa7lq8cRH2STkGQGiBy5IfthN4AYKIlgyMB5vM0yE/aBuiGTOBRQL3lXhj7tjaIuD4l+lsZlnfF44F/LNpJHqapkid4RIMGwvcZrwYAHpQ/9yyTkURGSp13mDGS77XEPy6Booob0oVPigh2fdVbB5yp87vnkxzg5PKwAmhYEdjo/AkMRWiIHy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1899.namprd12.prod.outlook.com (10.175.91.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 12:11:41 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 12:11:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 00/14] drm/amdgpu: introduce secure buffer object support
 (trusted memory zone)
Thread-Topic: [PATCH 00/14] drm/amdgpu: introduce secure buffer object support
 (trusted memory zone)
Thread-Index: AQHVaJcL6qF1r2/r6EufMx2zmHu1dacmYu6A
Date: Wed, 11 Sep 2019 12:11:41 +0000
Message-ID: <44140784-0437-6268-ce30-e7cc22a6f792@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae63f2d5-5c27-4171-a36a-08d736b13469
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1899; 
x-ms-traffictypediagnostic: DM5PR12MB1899:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1899BFFEBCDB3E3AC315349A83B10@DM5PR12MB1899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(189003)(199004)(53754006)(31696002)(446003)(7736002)(11346002)(52116002)(6636002)(2201001)(66946007)(2906002)(36756003)(450100002)(65806001)(256004)(14444005)(2501003)(58126008)(86362001)(65956001)(6512007)(6246003)(53936002)(71190400001)(71200400001)(6116002)(76176011)(486006)(476003)(102836004)(386003)(6506007)(8676002)(229853002)(478600001)(5660300002)(64756008)(4326008)(66574012)(305945005)(31686004)(81156014)(25786009)(81166006)(99286004)(316002)(46003)(54906003)(6486002)(66446008)(14454004)(110136005)(6436002)(2616005)(66476007)(66556008)(186003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1899;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tck9SumiCwbjwN6A6oJRBy2U34V7C2N3E8Qc4uWuS2oDVkHjbnfIW/J892gfknoXuZJjWc+915PHCwL4j86zHtFanCxPspeHmprmXZsqE1/DgTYfxYDAUp/7lZkDZCYkjYwuXBvhqbCfBIL8SeBTA2u+RYka82k1uMn8B2pg3xby4S0cBzqj1i7xEyLJIbl+KsRmGBTAiKgCDeKUiOw6uH/Tb0GihkltT8gEOxrdpDODihYvAFVMFXYwG4FgQj035j/YH80mfvEJL5OCOloh/wCRgKbZbz0nX6G+u4WWz0x+bkR49+OTr902mpahg+/TalvMGt/jMcrdyAsTXC0xYd/IOeDJyMxsT7ocKhYb4G8I4D3wFVb7wb7JmOMOEo6J9VNvDBWpU35C29ewg+UqqvFlBm12INsZmwRHPHhhHTo=
Content-ID: <D031D6FD24538545858FF02864E7F7BA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae63f2d5-5c27-4171-a36a-08d736b13469
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 12:11:41.4973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OwMSGP3jLJsyzl/W9kc1XgGQbDIQFDSzGpcplc0LOWvTl43EHh3h8NrIckez6dYF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqSKOt7zubZ1ymQs4Ejjok3XxNHO/N8rJT43IuGf7Fw=;
 b=HsNzZ+a2Ocl8e0XdE8AYDm5ROoRGc2tNo3yeCXLD2q4KQzXPOmYJK5vELpAirATJkiJA4E8b+19vmOnUQAP2VjQmhlDziCVFzA5SOW5hXYKCmusV4O8b6GpVBM5xuVstAGYjJqOJV8/2fNhJvYR1nxKX2HVla0FF0Ene7n0Fgs0=
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2hlcyAjMS0jNCwgIzgsICM5IGFyZSBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAN
CjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClBhdGNoZXMgIzEwLCAjMTEgYXJlIEFja2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClBhdGNo
ZXMgIzcgYW5kIHRoZSByZXN1bHRpbmcgd29ya2Fyb3VuZCBpbiBwYXRjaCAjMTMgYXJlIGEgY2xl
YXIgTkFLLiANClRoZSB0dG1fbWVtX3JlZyBjYW4ndCBiZSB1c2VkIGxpa2UgdGhpcyB0byBnZXQg
YmFjayB0byB0aGUgdHRtX2JvIG9iamVjdC4NCg0KR29pbmcgdG8gcmVwbHkgc2VwYXJhdGVseSBv
biBwYXRjaCAjMTQgcmVnYXJkaW5nIHRoaXMuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFt
IDExLjA5LjE5IHVtIDEzOjUwIHNjaHJpZWIgSHVhbmcsIFJheToNCj4gSGkgYWxsLA0KPg0KPiBU
aGVzZSBzZXJpZXMgb2YgcGF0Y2hlcyBpbnRyb2R1Y2UgYSBmZWF0dXJlIHRvIHN1cHBvcnQgc2Vj
dXJlIGJ1ZmZlciBvYmplY3QuDQo+IFRoZSBUcnVzdGVkIE1lbW9yeSBab25lIChUTVopIGlzIGEg
bWV0aG9kIHRvIHByb3RlY3QgdGhlIGNvbnRlbnRzIGJlaW5nIHdyaXR0ZW4NCj4gdG8gYW5kIHJl
YWQgZnJvbSBtZW1vcnkuIFdlIHVzZSBUTVogaGFyZHdhcmUgbWVtb3J5IHByb3RlY3Rpb24gc2No
ZW1lIHRvDQo+IGltcGxlbWVudCB0aGUgc2VjdXJlIGJ1ZmZlciBvYmplY3Qgc3VwcG9ydC4NCj4N
Cj4gVE1aIGlzIHRoZSBwYWdlLWxldmVsIHByb3RlY3Rpb24gdGhhdCBoYXJkd2FyZSB3aWxsIGRl
dGVjdCB0aGUgVE1aIGJpdCBpbiB0aGUNCj4gcGFnZSB0YWJsZSBlbnRyeSB0byBzZXQgdGhlIGN1
cnJlbnQgcGFnZSBpcyBlbmNyeXB0ZWQuIFdpdGggdGhpcyBoYXJkd2FyZQ0KPiBmZWF0dXJlLCB3
ZSBkZXNpZ24gYSBCTy1sZXZlbCBwcm90ZWN0aW9uIGluIGtlcm5lbCBkcml2ZXIgdG8gcHJvdmlk
ZSBhIG5ldyBmbGFnDQo+IEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCB0byBnZW0gY3JlYXRl
IGlvY3RsIHRvIGxpYmRybSBmb3IgdGhlIHNlY3VyZSBidWZmZXINCj4gYWxsb2NhdGlvbi4gQW5k
IGFsc28gcHJvdmlkZSB0aGUgQU1ER1BVX0NUWF9BTExPQ19GTEFHU19TRUNVUkUgdG8gaW5kaWNh
dGUgdGhlDQo+IGNvbnRleHQgaXMgdHJ1c3RlZCBvciBub3QuIElmIHRoZSBCTyBpcyBzZWN1cmUs
IHRoZW4gdGhlIGRhdGEgaXMgZW5jcnlwdGVkLCBvbmx5DQo+IHRoZSB0cnVzdGVkIElQIGJsb2Nr
cyBzdWNoIGFzIGdmeCwgc2RtYSwgdmNuIGFyZSBhYmxlIHRvIGRlY3J5cHQuIENQVSBhcyB0aGUN
Cj4gdW4tdHJ1c3RlZCBJUCBhcmUgdW5hYmxlIHRvIHJlYWQgdGhlIHNlY3VyZSBidWZmZXIuDQo+
DQo+IFdlIHdpbGwgc3VibWl0IHRoZSBuZXcgc2VjdXJlIGNvbnRleHQgaW50ZXJmYWNlIGxhdGVy
IGZvciBsaWJkcm0sIGFuZCBjcmVhdGUgYQ0KPiBuZXcgdGVzdCBzdWl0ZSB0byB2ZXJpZnkgdGhl
IHNlY3VyaXR5IGZlYXR1cmUgaW4gdGhlIGxpYmRybSB1bml0IHRlc3RzLg0KPg0KPiBTdWl0ZSBp
ZCA9IDExOiBOYW1lICdTZWN1cml0eSBUZXN0cyBzdGF0dXM6IEVOQUJMRUQnDQo+IFRlc3QgaWQg
MTogTmFtZTogJ2FsbG9jYXRlIHNlY3VyZSBidWZmZXIgdGVzdCBzdGF0dXM6IEVOQUJMRUQnDQo+
IFRlc3QgaWQgMjogTmFtZTogJ2dyYXBoaWNzIGNvbW1hbmQgc3VibWlzc2lvbiB1bmRlciBzZWN1
cmUgY29udGV4dCBzdGF0dXM6IEVOQUJMRUQnDQo+DQo+IFRoYW5rcywNCj4gUmF5DQo+DQo+IEFs
ZXggRGV1Y2hlciAoNCk6DQo+ICAgIGRybS9hbWRncHU6IGFkZCBVQVBJIGZvciBjcmVhdGluZyBl
bmNyeXB0ZWQgYnVmZmVycw0KPiAgICBkcm0vYW1kZ3B1OiBhZGQgVUFQSSBmb3IgY3JlYXRpbmcg
c2VjdXJlIGNvbnRleHRzICh2MikNCj4gICAgZHJtL2FtZGdwdTogZGVmaW5lIHRoZSBUTVogYml0
IGZvciB0aGUgUFRFDQo+ICAgIGRybS9hbWRncHU6IHNldCBUTVogYml0cyBpbiBQVEVzIGZvciBz
ZWN1cmUgYm8gKHYyKQ0KPg0KPiBIdWFuZyBSdWkgKDEwKToNCj4gICAgZHJtL2FtZGdwdTogYWRk
IHRteiBmZWF0dXJlIHBhcmFtZXRlciAodjIpDQo+ICAgIGRybS9hbWRncHU6IGFkZCBhbWRncHVf
dG16IGRhdGEgc3RydWN0dXJlDQo+ICAgIGRybS9hbWRncHU6IGFkZCBmdW5jdGlvbiB0byBjaGVj
ayB0bXogY2FwYWJpbGl0eSAodjQpDQo+ICAgIGRybS90dG06IGFkZCBoZWxwZXIgdG8gZ2V0IGJ1
ZmZlciBvYmplY3Qgd2l0aCB0dG1fbWVtX3JlZw0KPiAgICBkcm0vYW1kZ3B1OiByZXZpc2UgdGhl
IGZ1bmN0aW9uIHRvIGFsbG9jYXRlIHNlY3VyZSBjb250ZXh0ICh2MikNCj4gICAgZHJtL2FtZGdw
dTogYWRkIHRteiBiaXQgaW4gZnJhbWUgY29udHJvbCBwYWNrZXQNCj4gICAgZHJtL2FtZGdwdTog
ZXhwYW5kIHRoZSBlbWl0IHRteiBpbnRlcmZhY2Ugd2l0aCB0cnVzdGVkIGZsYWcNCj4gICAgZHJt
L2FtZGdwdTogZXhwYW5kIHRoZSBjb250ZXh0IGNvbnRyb2wgaW50ZXJmYWNlIHdpdGggdHJ1c3Qg
ZmxhZw0KPiAgICBkcm0vYW1kZ3B1OiBzZXQgdHJ1c3RlZCBtb2RlIHdoaWxlIHRoZSBqb2IgaXMg
dW5kZXIgc2VjdXJlIGNvbnRleHQNCj4gICAgICAodjIpDQo+ICAgIGRybS9hbWRncHU6IG1vZGlm
eSB0aGUgbWV0aG9kIHRvIHVzZSBtZW0gdW5kZXIgYnVmZmVyIG9iamVjdCBmb3INCj4gICAgICBh
bWRncHVfdHRtX3R0X3B0ZV9mbGFncw0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L01ha2VmaWxlICAgICAgICB8ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmggICAgICAgIHwgIDcgKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3MuYyAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2N0eC5jICAgIHwgMTkgKysrKysrKysrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2N0eC5oICAgIHwgIDEgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAzICsrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgMTEgKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICB8IDEyICsrKysrKystDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgICAgIHwgIDQgKy0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oICAgIHwgIDIgKysNCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAxMCArKysrKysNCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oICAgfCAgOSArKystLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMgICAgfCA0OSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16
LmggICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAyMyArKysrKysrKystLS0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oICAgICB8ICAzICsrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICAgIHwgMjAgKysrKysrKysrLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYyAgICAgIHwgIDMgKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jICAgICAgfCAgMyArLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgICAgICB8ICAzICstDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICAgIHwgMTYgKysrKysrKy0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252ZC5oICAgICAgICAgICB8ICAxICsN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNWQuaCAgICAgICAgfCAgMSArDQo+
ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAgICAgICAgICAgIHwgMTMgKysrKysr
KysNCj4gICBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCAgICAgICAgICAgICAgfCAgOSAr
KysrKy0NCj4gICAyNSBmaWxlcyBjaGFuZ2VkLCAyMzAgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRp
b25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90bXouYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdG16LmgNCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
