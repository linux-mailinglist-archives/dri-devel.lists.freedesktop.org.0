Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269985E740
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0015F6E157;
	Wed,  3 Jul 2019 14:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9389C28;
 Wed,  3 Jul 2019 14:58:11 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1628.namprd12.prod.outlook.com (10.172.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 14:58:08 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 14:58:08 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Topic: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Index: AQHVMa+5D4JQAZoizUi8c/qNyeh4ow==
Date: Wed, 3 Jul 2019 14:58:08 +0000
Message-ID: <0bc184ea-bcc3-48cb-9b28-42e8fc037303@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a01:598:928d:d54e:7e09:f50a:2f8d:8161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29de6317-eda4-411c-c6df-08d6ffc6dc8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1628; 
x-ms-traffictypediagnostic: DM5PR12MB1628:
x-microsoft-antispam-prvs: <DM5PR12MB16283C9593829A9B92D684D283FB0@DM5PR12MB1628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(46003)(6486002)(81156014)(316002)(14454004)(86362001)(102836004)(4326008)(6506007)(486006)(186003)(71190400001)(8936002)(6916009)(25786009)(305945005)(8676002)(72206003)(31696002)(68736007)(31686004)(478600001)(476003)(81166006)(76116006)(66476007)(6246003)(71200400001)(6436002)(6512007)(9686003)(91956017)(66556008)(66446008)(66946007)(64756008)(73956011)(5660300002)(54896002)(2906002)(229853002)(6116002)(7736002)(53936002)(256004)(99286004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1628;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jkqqeSlZekeRIzvfbhez8xxJDc951bMiIBy07IMI175AG6+wmySQKLHWnNzUugqkC0ubaupQX1imRdrzJ613h+PXaIwunvQmLMmsn4c2FsBc8qT/i1VsZdVfCrrTG5SCCNmKVzdZVOiQeiHZb+ieERQvy0gxJnqNWxSsCy3vWCzDuC8oMXfyvmLtvzzgOWWp9066XcHvC7I+8vRqo/ssizBGSqVf7hC/LLC565MAETXqgWE94AD3HhRvipLD9EzR7/khYWnXAcvCtXL7LD2O0nFcItBQGFqxl7ExfPgokKpPDdOvND8URQcajuee7ROgIQ9x5tyQewGxSrcqFyewt66NVlrPOvCGwtNWcGvbP7jDxbneq9prC4t1fc+TXSy+zXZttx9soyIYY8gRjQ6Mm+PHq5VRWAfNHVKvjLZrigs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29de6317-eda4-411c-c6df-08d6ffc6dc8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 14:58:08.7030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5Ux2j9iz54ZgRkz2X+Hv7QO4SGpryk0jP6bioNWsD4=;
 b=1l6kyTY1WEx5Pd/oN1uFTBrJMvaXzXIySxVuG3K7udQ86z1eoWomVFyfFhcA+9EC9m+dbKV4D2h40N+dqytYnfh0dYRh/C9nhrNmmw2WdblX9FDioc/vpbhj8lnL056JZMG1imCN544W97YfhrOB1p5jkM49xQ6LLZNlNr6VxCs=
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
Content-Type: multipart/mixed; boundary="===============1258289419=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1258289419==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_0bc184eabcc348cb9b2842e8fc037303emailandroidcom_"

--_000_0bc184eabcc348cb9b2842e8fc037303emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDAzLjA3LjIwMTkgMTY6NTEgc2NocmllYiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxp
a292QGdtYWlsLmNvbT46DQpPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTU6MzMsIEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiBBbSAwMy4wNy4yMDE5
IDE2OjAwIHNjaHJpZWIgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Og0K
Pg0KPiBPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTQ6NDgsIEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gV2VsbCB0aGlzIGlzIHN0aWxs
IGEgTkFLLg0KPiA+DQo+ID4gQXMgc3RhdGVkIHByZXZpb3VzbHkgcGxlYXNlIGp1c3QgZG9uJ3Qg
cmVtb3ZlIERSTV9BVVRIIGFuZCBrZWVwIHRoZSBmdW5jdGlvbmFsaXR5IGFzIGl0IGlzLg0KPiA+
DQo+IEFGQUlDVCBub2JvZHkgd2FzIGluIGZhdm91ciBvZiB5b3VyIHN1Z2dlc3Rpb24gdG8gcmVt
b3ZlIERSTV9BVVRIIGZyb20NCj4gdGhlIGhhbmRsZSB0by9mcm9tIGZkIGlvY2x0cy4NCj4gVGh1
cyB0aGlzIHNlZW1zIGxpa2UgdGhlIHNlY29uZCBiZXN0IG9wdGlvbi4NCj4NCj4NCj4gV2VsbCBq
dXN0IGtlZXAgaXQuIEFzIEkgc2FpZCBwbGVhc2UgZG9uJ3QgY2hhbmdlIGFueXRoaW5nIGhlcmUu
DQo+DQo+IERyb3BwaW5nIERSTV9BVVRIIGZyb20gdGhlIGRyaXZlciBJT0NUTHMgd2FzIHN1ZmZp
Y2llbnQgdG8gd29yayBhcm91bmQgdGhlIHByb2JsZW1zIGF0IGhhbmQgZmFyIGFzIEkga25vdy4N
Cj4NCldlIGFsc28gbmVlZCB0aGUgRFJNX0FVVEggZm9yIGhhbmRsZSB0by9mcm9tIGZkIG9uZXMu
IE1lc2EgZHJpdmVycyB1c2UNCnRob3NlIGlvY3Rscy4NCg0KWWVhaCwgYnV0IG9ubHkgZm9yIGlt
cG9ydGluZy9leHBvcnRpbmcgdGhpbmdzLg0KDQpBbmQgaW4gdGhvc2UgY2FzZXMgd2UgZWl0aGVy
IGFscmVhZHkgZ2F2ZSByZW5kZXIgbm9kZXMgb3IgY29ycmVjdGx5IGF1dGhlbnRpY2F0ZWQgcHJp
bWFyeSBub2Rlcy4NCg0KU28gbm8gbmVlZCB0byBjaGFuZ2UgYW55dGhpbmcgaGVyZSBhcyBmYXIg
YXMgSSBzZWUuDQoNCkkgc2ltcGx5IHdhbnQgdG8gcHJldmVudCB0aGF0IHVzZXJzcGFjZSBnZXRz
IHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgZnJvbSB0aGUgcHJpbWFyeSBub2RlIHRoZXkgZ2V0IGZy
b20gdGhlIHJlbmRlciBub2RlLiBBbmQgdGhhdCBhY3R1YWxseSBzZWVtcyB0byBiZSBhIGdvb2Qg
d2F5IHRvIGtlZXAgdGhlIHJlc3RyaWN0aW9uIGFuZCBzdGlsbCB3b3JrIGFyb3VuZCB0aGUgdXNl
cnNwYWNlIHByb2JsZW1zLg0KDQpDaHJpc3RpYW4uDQoNCg0KDQotRW1pbA0KDQo=

--_000_0bc184eabcc348cb9b2842e8fc037303emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <9E2E903CA109FF43ACDD3C21BB7D0662@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDAzLjA3LjIwMTkgMTY6NTEgc2NocmllYiBFbWlsIFZlbGlrb3Yg
Jmx0O2VtaWwubC52ZWxpa292QGdtYWlsLmNvbSZndDs6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj4N
CjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRl
ci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj48Zm9udCBzaXpl
PSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdj5PbiBXZWQsIDMgSnVsIDIw
MTkgYXQgMTU6MzMsIEtvZW5pZywgQ2hyaXN0aWFuICZsdDtDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20mZ3Q7IHdyb3RlOjxicj4NCiZndDsgQW0gMDMuMDcuMjAxOSAxNjowMCBzY2hyaWViIEVtaWwg
VmVsaWtvdiAmbHQ7ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tJmd0Ozo8YnI+DQomZ3Q7PGJyPg0K
Jmd0OyBPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTQ6NDgsIEtvZW5pZywgQ2hyaXN0aWFuICZsdDtD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20mZ3Q7IHdyb3RlOjxicj4NCiZndDsgJmd0Ozxicj4NCiZn
dDsgJmd0OyBXZWxsIHRoaXMgaXMgc3RpbGwgYSBOQUsuPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0
OyAmZ3Q7IEFzIHN0YXRlZCBwcmV2aW91c2x5IHBsZWFzZSBqdXN0IGRvbid0IHJlbW92ZSBEUk1f
QVVUSCBhbmQga2VlcCB0aGUgZnVuY3Rpb25hbGl0eSBhcyBpdCBpcy48YnI+DQomZ3Q7ICZndDs8
YnI+DQomZ3Q7IEFGQUlDVCBub2JvZHkgd2FzIGluIGZhdm91ciBvZiB5b3VyIHN1Z2dlc3Rpb24g
dG8gcmVtb3ZlIERSTV9BVVRIIGZyb208YnI+DQomZ3Q7IHRoZSBoYW5kbGUgdG8vZnJvbSBmZCBp
b2NsdHMuPGJyPg0KJmd0OyBUaHVzIHRoaXMgc2VlbXMgbGlrZSB0aGUgc2Vjb25kIGJlc3Qgb3B0
aW9uLjxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBXZWxsIGp1c3Qga2VlcCBpdC4gQXMg
SSBzYWlkIHBsZWFzZSBkb24ndCBjaGFuZ2UgYW55dGhpbmcgaGVyZS48YnI+DQomZ3Q7PGJyPg0K
Jmd0OyBEcm9wcGluZyBEUk1fQVVUSCBmcm9tIHRoZSBkcml2ZXIgSU9DVExzIHdhcyBzdWZmaWNp
ZW50IHRvIHdvcmsgYXJvdW5kIHRoZSBwcm9ibGVtcyBhdCBoYW5kIGZhciBhcyBJIGtub3cuPGJy
Pg0KJmd0Ozxicj4NCldlIGFsc28gbmVlZCB0aGUgRFJNX0FVVEggZm9yIGhhbmRsZSB0by9mcm9t
IGZkIG9uZXMuIE1lc2EgZHJpdmVycyB1c2U8YnI+DQp0aG9zZSBpb2N0bHMuPGJyPg0KPC9kaXY+
DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPlllYWgs
IGJ1dCBvbmx5IGZvciBpbXBvcnRpbmcvZXhwb3J0aW5nIHRoaW5ncy48L2Rpdj4NCjxkaXYgZGly
PSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5BbmQgaW4gdGhvc2UgY2FzZXMg
d2UgZWl0aGVyIGFscmVhZHkgZ2F2ZSByZW5kZXIgbm9kZXMgb3IgY29ycmVjdGx5IGF1dGhlbnRp
Y2F0ZWQgcHJpbWFyeSBub2Rlcy48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4N
CjxkaXYgZGlyPSJhdXRvIj5TbyBubyBuZWVkIHRvIGNoYW5nZSBhbnl0aGluZyBoZXJlIGFzIGZh
ciBhcyBJIHNlZS48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGly
PSJhdXRvIj5JIHNpbXBseSB3YW50IHRvIHByZXZlbnQgdGhhdCB1c2Vyc3BhY2UgZ2V0cyB0aGUg
c2FtZSBmdW5jdGlvbmFsaXR5IGZyb20gdGhlIHByaW1hcnkgbm9kZSB0aGV5IGdldCBmcm9tIHRo
ZSByZW5kZXIgbm9kZS4gQW5kIHRoYXQgYWN0dWFsbHkgc2VlbXMgdG8gYmUgYSBnb29kIHdheSB0
byBrZWVwIHRoZSByZXN0cmljdGlvbiBhbmQgc3RpbGwgd29yayBhcm91bmQgdGhlIHVzZXJzcGFj
ZSBwcm9ibGVtcy48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGly
PSJhdXRvIj5DaHJpc3RpYW4uPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8
ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+DQo8ZGl2IGNsYXNz
PSJnbWFpbF9leHRyYSI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+DQo8YmxvY2txdW90ZSBj
bGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2Nj
YyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+PGJyPg0KLUVtaWw8YnI+DQo8L2Rpdj4NCjwvc3Bh
bj48L2ZvbnQ+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxicj4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_0bc184eabcc348cb9b2842e8fc037303emailandroidcom_--

--===============1258289419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1258289419==--
