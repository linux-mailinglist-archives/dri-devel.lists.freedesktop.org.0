Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A86D5E6C9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF04E6E14D;
	Wed,  3 Jul 2019 14:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F46E140;
 Wed,  3 Jul 2019 14:33:20 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1802.namprd12.prod.outlook.com (10.175.86.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Wed, 3 Jul 2019 14:33:18 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 14:33:18 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Topic: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Index: AQHVMaxBmF7WFgo7g0GO3HOJn43GVg==
Date: Wed, 3 Jul 2019 14:33:18 +0000
Message-ID: <744310ce-4546-4406-ad8d-49af0f06cd49@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:598:928d:d54e:7e09:f50a:2f8d:8161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9065ab5d-3e45-4a71-d866-08d6ffc36458
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1802; 
x-ms-traffictypediagnostic: DM5PR12MB1802:
x-microsoft-antispam-prvs: <DM5PR12MB18028FD855655F876219475083FB0@DM5PR12MB1802.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(199004)(189003)(316002)(229853002)(186003)(256004)(99286004)(102836004)(68736007)(72206003)(8676002)(14454004)(81156014)(2906002)(31696002)(71190400001)(478600001)(81166006)(86362001)(71200400001)(76116006)(66476007)(66446008)(64756008)(66556008)(5660300002)(73956011)(66946007)(91956017)(6116002)(6246003)(25786009)(8936002)(4744005)(31686004)(7736002)(305945005)(54906003)(476003)(4326008)(6916009)(486006)(6436002)(6486002)(6506007)(54896002)(46003)(6512007)(9686003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1802;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JUrrxCbs0oYQ1GW5h+8waxXQqh6C+TxSpvtQzHt+k3+aTxTUaqpImO20DNLcS/YOqs5LJVsGYYlHCbVDyGbXF3fwHIj1Q64k2hgarPgSDj3b7LCFTueFAFibUu2t5hO7ASEHkyJBMjPePfyOEsLhauEbVmKfpmZH1i7/Qn0jJXSDsmLkmczQ13k+ck+0iuy/D1ZHIs3R4/B7PJwqxtlGFVTExkVlTMU93pieGY/bjGDd/+VGG4jxrU8umxbVjEULcdKb4ZurkEDYIPdYRdFunJqyM1Pm5R0fnkWbYDuxNYxOvCJ7oPdoILKGDNlLtnfp6RGioH3ijDVHBeU5jGMDqx8gAaEtHTuMAr7OrPMpcfS0h4ECXu5utS4IEBwIQAXo6QFtC6Gy4RA/+EIn7K5YMTP07aKk6yeKQL+w6v0KJdo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9065ab5d-3e45-4a71-d866-08d6ffc36458
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 14:33:18.5392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1802
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imb5gggPgXYpU5ETb57LSxvEZVlQeXBNvkhAk7jA/p0=;
 b=Wa/M5+y3VQStUnc72Kp4nsO7DfUDyeKBkVhVHTpVw9+aUiz8zfoNCIp9h/1xyWNsNExeroktsh11eFjjYdvilZCy10qpA0rIBlz5x7EHThSLyEOKNSwrdf1kWgEA8Cqy3xbWKwodQmmJ8bkZjCfyb4yxb30rp/KrkujijWmGqNE=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0718213152=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0718213152==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_744310ce45464406ad8d49af0f06cd49emailandroidcom_"

--_000_744310ce45464406ad8d49af0f06cd49emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDAzLjA3LjIwMTkgMTY6MDAgc2NocmllYiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxp
a292QGdtYWlsLmNvbT46DQpPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTQ6NDgsIEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPg0KPiBXZWxsIHRoaXMg
aXMgc3RpbGwgYSBOQUsuDQo+DQo+IEFzIHN0YXRlZCBwcmV2aW91c2x5IHBsZWFzZSBqdXN0IGRv
bid0IHJlbW92ZSBEUk1fQVVUSCBhbmQga2VlcCB0aGUgZnVuY3Rpb25hbGl0eSBhcyBpdCBpcy4N
Cj4NCkFGQUlDVCBub2JvZHkgd2FzIGluIGZhdm91ciBvZiB5b3VyIHN1Z2dlc3Rpb24gdG8gcmVt
b3ZlIERSTV9BVVRIIGZyb20NCnRoZSBoYW5kbGUgdG8vZnJvbSBmZCBpb2NsdHMuDQpUaHVzIHRo
aXMgc2VlbXMgbGlrZSB0aGUgc2Vjb25kIGJlc3Qgb3B0aW9uLg0KDQpXZWxsIGp1c3Qga2VlcCBp
dC4gQXMgSSBzYWlkIHBsZWFzZSBkb24ndCBjaGFuZ2UgYW55dGhpbmcgaGVyZS4NCg0KRHJvcHBp
bmcgRFJNX0FVVEggZnJvbSB0aGUgZHJpdmVyIElPQ1RMcyB3YXMgc3VmZmljaWVudCB0byB3b3Jr
IGFyb3VuZCB0aGUgcHJvYmxlbXMgYXQgaGFuZCBmYXIgYXMgSSBrbm93Lg0KDQpBbmQgc3RvcHBp
bmcgdGhvc2UgdHdvIGF0IGxlYXN0IHByZXZlbnRzIHVzZXJzcGFjZSB0byBhYnVzZSB0aGlzIGV2
ZW4gbW9yZS4NCg0KT24gdGhlIG90aGVyIGhhbmQgSSBoYXZlbid0IHNlZW4gYW55IE5BSyBvbiBk
cm9wcGluZyBEUk1fQVVUSCBmcm9tIHRoZW0uDQoNCkNocmlzdGlhbi4NCg0KDQoNClRoaXJkIHJv
dXRlIHRoYXQgSSBzZWUgaXMgZG9pbmcgZHJpdmVyX25hbWUgPT0gImFtZGdwdSIgfHwgZHJpdmVy
X25hbWUNCj09ICJyYWRlb24iIGluIGNvcmUuDQpJZiB5b3UgaGF2ZSBhbHRlcm5hdGl2ZSBzb2x1
dGlvbiBJJ20gYWxsIGVhcnMuDQoNCi1FbWlsDQoNCg==

--_000_744310ce45464406ad8d49af0f06cd49emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D5DFF67CD0A98A44BD01BDD8FC171AF5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDAzLjA3LjIwMTkgMTY6MDAgc2NocmllYiBFbWlsIFZlbGlrb3Yg
Jmx0O2VtaWwubC52ZWxpa292QGdtYWlsLmNvbSZndDs6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj4N
CjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRl
ci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj48Zm9udCBzaXpl
PSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdj5PbiBXZWQsIDMgSnVsIDIw
MTkgYXQgMTQ6NDgsIEtvZW5pZywgQ2hyaXN0aWFuICZsdDtDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20mZ3Q7IHdyb3RlOjxicj4NCiZndDs8YnI+DQomZ3Q7IFdlbGwgdGhpcyBpcyBzdGlsbCBhIE5B
Sy48YnI+DQomZ3Q7PGJyPg0KJmd0OyBBcyBzdGF0ZWQgcHJldmlvdXNseSBwbGVhc2UganVzdCBk
b24ndCByZW1vdmUgRFJNX0FVVEggYW5kIGtlZXAgdGhlIGZ1bmN0aW9uYWxpdHkgYXMgaXQgaXMu
PGJyPg0KJmd0Ozxicj4NCkFGQUlDVCBub2JvZHkgd2FzIGluIGZhdm91ciBvZiB5b3VyIHN1Z2dl
c3Rpb24gdG8gcmVtb3ZlIERSTV9BVVRIIGZyb208YnI+DQp0aGUgaGFuZGxlIHRvL2Zyb20gZmQg
aW9jbHRzLjxicj4NClRodXMgdGhpcyBzZWVtcyBsaWtlIHRoZSBzZWNvbmQgYmVzdCBvcHRpb24u
PGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+
DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9
ImF1dG8iPldlbGwganVzdCBrZWVwIGl0LiBBcyBJIHNhaWQgcGxlYXNlIGRvbid0IGNoYW5nZSBh
bnl0aGluZyBoZXJlLjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBk
aXI9ImF1dG8iPkRyb3BwaW5nIERSTV9BVVRIIGZyb20gdGhlIGRyaXZlciBJT0NUTHMgd2FzIHN1
ZmZpY2llbnQgdG8gd29yayBhcm91bmQgdGhlIHByb2JsZW1zIGF0IGhhbmQgZmFyIGFzIEkga25v
dy48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5B
bmQgc3RvcHBpbmcgdGhvc2UgdHdvIGF0IGxlYXN0IHByZXZlbnRzIHVzZXJzcGFjZSB0byBhYnVz
ZSB0aGlzIGV2ZW4gbW9yZS48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxk
aXYgZGlyPSJhdXRvIj5PbiB0aGUgb3RoZXIgaGFuZCBJIGhhdmVuJ3Qgc2VlbiBhbnkgTkFLIG9u
IGRyb3BwaW5nIERSTV9BVVRIIGZyb20gdGhlbS48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+
DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5DaHJpc3RpYW4uPC9kaXY+DQo8ZGl2IGRpcj0iYXV0
byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0i
YXV0byI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+DQo8YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+PGJyPg0KVGhpcmQg
cm91dGUgdGhhdCBJIHNlZSBpcyBkb2luZyBkcml2ZXJfbmFtZSA9PSAmcXVvdDthbWRncHUmcXVv
dDsgfHwgZHJpdmVyX25hbWU8YnI+DQo9PSAmcXVvdDtyYWRlb24mcXVvdDsgaW4gY29yZS48YnI+
DQpJZiB5b3UgaGF2ZSBhbHRlcm5hdGl2ZSBzb2x1dGlvbiBJJ20gYWxsIGVhcnMuPGJyPg0KPGJy
Pg0KLUVtaWw8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+
DQo8L2Rpdj4NCjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4N
Cg==

--_000_744310ce45464406ad8d49af0f06cd49emailandroidcom_--

--===============0718213152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0718213152==--
