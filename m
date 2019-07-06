Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1460F32
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 08:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D286E0C8;
	Sat,  6 Jul 2019 06:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041C06E077;
 Sat,  6 Jul 2019 06:16:33 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1947.namprd12.prod.outlook.com (10.175.90.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Sat, 6 Jul 2019 06:16:31 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2032.019; Sat, 6 Jul 2019
 06:16:31 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Topic: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Index: AQHVM8Ja2/wl7EyrX0WlYS8RKbb01w==
Date: Sat, 6 Jul 2019 06:16:31 +0000
Message-ID: <97b57c0b-b0ec-4224-a3bd-cf994159a32a@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.158.42.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef5a5202-bbca-4a0c-c646-08d701d97cff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1947; 
x-ms-traffictypediagnostic: DM5PR12MB1947:
x-microsoft-antispam-prvs: <DM5PR12MB1947738D6181FC4A8A41CE1A83F40@DM5PR12MB1947.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(189003)(199004)(6512007)(99286004)(53936002)(3846002)(7736002)(86362001)(54896002)(476003)(6116002)(9686003)(316002)(4326008)(305945005)(81166006)(6486002)(25786009)(8676002)(486006)(81156014)(71200400001)(229853002)(8936002)(71190400001)(256004)(68736007)(6436002)(91956017)(2906002)(478600001)(72206003)(76116006)(66946007)(73956011)(31686004)(6916009)(66476007)(66556008)(64756008)(66066001)(31696002)(6506007)(186003)(54906003)(102836004)(26005)(66446008)(5660300002)(14454004)(6246003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1947;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T0qeiJltTRC9Y8lzoVOHwxIGNmyL5+G+6kv5Ta29R07LIPqAP+YE63VJjwh4/U9TALH2A9AySfohHPRiaYYW6uFpyR1rvQkuu+OaiV/oq8hALIwvOiV335kH8l4wpoIssOeIVszcvHEPrX6kysMrpmnuxkU8Fik88u3iUm6bJBUeT+IojPjx3ANQcXfp/h1yqRWruxZTHjMLFrXdsOu6r22vkAqvl+JiWk4VYNFF6HVEyLmA22xQ42rouCkoOG3D43rnDpQotnhalht/he7jERQj4lyKrs+XReKd6IXCgxObQr2mpoX5ZMz9YRkTpaQ5cohzQjONH111Awi3dOAkFMasLi+yuW+R2TftEezUjeKn/IQGmly0JEL1Zz8W1f3HR5bw7SNyfBVj92RsQ9yj7EMaDzH0rgX8uuwJYbBZNWk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5a5202-bbca-4a0c-c646-08d701d97cff
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 06:16:31.1631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TKinz6cfpeBumuU4nJK/MezaniuTT3WO/7EVA8DjRg=;
 b=Zox2WryZ21NMAgEMPbEz6QzCFaaARXtZs89PtB3qq4tTMzQRH5XUJzsXwRHAupYP/VvkacFwByQFGCC2i731ywZR0TPSEVeY4wyjHuu8q2Dd6SD03B1CQfsFa4dzvdosp4jFPJBWHf6QhprsD1BjKG6e8wnQ+vhrHJQ6umN8bSg=
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
Content-Type: multipart/mixed; boundary="===============0207079238=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0207079238==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_97b57c0bb0ec4224a3bdcf994159a32aemailandroidcom_"

--_000_97b57c0bb0ec4224a3bdcf994159a32aemailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDAzLjA3LjIwMTkgMTc6MTQgc2NocmllYiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxp
a292QGdtYWlsLmNvbT46DQpPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTU6NTgsIEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiBBbSAwMy4wNy4yMDE5
IDE2OjUxIHNjaHJpZWIgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Og0K
Pg0KPiBPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTU6MzMsIEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiA+IEFtIDAzLjA3LjIwMTkgMTY6MDAgc2No
cmllYiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT46DQo+ID4NCj4gPiBP
biBXZWQsIDMgSnVsIDIwMTkgYXQgMTQ6NDgsIEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IFdlbGwgdGhpcyBpcyBzdGlsbCBh
IE5BSy4NCj4gPiA+DQo+ID4gPiBBcyBzdGF0ZWQgcHJldmlvdXNseSBwbGVhc2UganVzdCBkb24n
dCByZW1vdmUgRFJNX0FVVEggYW5kIGtlZXAgdGhlIGZ1bmN0aW9uYWxpdHkgYXMgaXQgaXMuDQo+
ID4gPg0KPiA+IEFGQUlDVCBub2JvZHkgd2FzIGluIGZhdm91ciBvZiB5b3VyIHN1Z2dlc3Rpb24g
dG8gcmVtb3ZlIERSTV9BVVRIIGZyb20NCj4gPiB0aGUgaGFuZGxlIHRvL2Zyb20gZmQgaW9jbHRz
Lg0KPiA+IFRodXMgdGhpcyBzZWVtcyBsaWtlIHRoZSBzZWNvbmQgYmVzdCBvcHRpb24uDQo+ID4N
Cj4gPg0KPiA+IFdlbGwganVzdCBrZWVwIGl0LiBBcyBJIHNhaWQgcGxlYXNlIGRvbid0IGNoYW5n
ZSBhbnl0aGluZyBoZXJlLg0KPiA+DQo+ID4gRHJvcHBpbmcgRFJNX0FVVEggZnJvbSB0aGUgZHJp
dmVyIElPQ1RMcyB3YXMgc3VmZmljaWVudCB0byB3b3JrIGFyb3VuZCB0aGUgcHJvYmxlbXMgYXQg
aGFuZCBmYXIgYXMgSSBrbm93Lg0KPiA+DQo+IFdlIGFsc28gbmVlZCB0aGUgRFJNX0FVVEggZm9y
IGhhbmRsZSB0by9mcm9tIGZkIG9uZXMuIE1lc2EgZHJpdmVycyB1c2UNCj4gdGhvc2UgaW9jdGxz
Lg0KPg0KPg0KPiBZZWFoLCBidXQgb25seSBmb3IgaW1wb3J0aW5nL2V4cG9ydGluZyB0aGluZ3Mu
DQo+DQo+IEFuZCBpbiB0aG9zZSBjYXNlcyB3ZSBlaXRoZXIgYWxyZWFkeSBnYXZlIHJlbmRlciBu
b2RlcyBvciBjb3JyZWN0bHkgYXV0aGVudGljYXRlZCBwcmltYXJ5IG5vZGVzLg0KPg0KPiBTbyBu
byBuZWVkIHRvIGNoYW5nZSBhbnl0aGluZyBoZXJlIGFzIGZhciBhcyBJIHNlZS4NCj4NCk5vdCBx
dWl0ZS4gV2hlbiB3b3JraW5nIHdpdGggdGhlIHByaW1hcnkgbm9kZSB3ZSBoYXZlIHRoZSBmb2xs
b3dpbmcgc2NlbmFyaW9zOg0KIC0gaGFuZGxlIHRvIGZkIC0+IHBhc3MgZmQgdG8gb3RoZXIgQVBJ
cyAtIGdibSwgb3BlbmNsLCB2ZHBhdSwgZXRjDQogLSBoYW5kbGUgdG8gZmQgLT4gZmQgdG8gaGFu
ZGxlIC0gdXNlIGl0IGludGVybmFsbHkNCg0KWWVhaCwgSSdtIGF3YXJlIG9mIHRoYXQgYnV0IGhv
cGVkIHRoYXQgdGhpcyB3b3VsZCBiZSBhIHJhdGhlciByYXJlIGNhc2UuDQoNCkkgbmVlZCB0byB0
YWtlIGFub3RoZXIgY2xvc2VyIGxvb2sgb24gdGhpcywgYnV0IGN1cnJlbnRseSBJIGFtIG9uIHZh
Y2F0aW9uIGFuZCB3b24ndCBoYXZlIHRpbWUgbmV4dCB3ZWVrIGVpdGhlci4NCg0KVHJ5aW5nIHRv
IGdldCBiYWNrIHRvIHRoaXMgYXMgc29vbiBhcyBwb3NzaWJsZSwNCkNocmlzdGlhbi4NCg0KDQot
RW1pbA0KDQo=

--_000_97b57c0bb0ec4224a3bdcf994159a32aemailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F3682A95E1DE514D9EF64C65AC8AEC67@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDAzLjA3LjIwMTkgMTc6MTQgc2NocmllYiBFbWlsIFZlbGlrb3Yg
Jmx0O2VtaWwubC52ZWxpa292QGdtYWlsLmNvbSZndDs6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj4N
CjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRl
ci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj48Zm9udCBzaXpl
PSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdj5PbiBXZWQsIDMgSnVsIDIw
MTkgYXQgMTU6NTgsIEtvZW5pZywgQ2hyaXN0aWFuICZsdDtDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20mZ3Q7IHdyb3RlOjxicj4NCiZndDsgQW0gMDMuMDcuMjAxOSAxNjo1MSBzY2hyaWViIEVtaWwg
VmVsaWtvdiAmbHQ7ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tJmd0Ozo8YnI+DQomZ3Q7PGJyPg0K
Jmd0OyBPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTU6MzMsIEtvZW5pZywgQ2hyaXN0aWFuICZsdDtD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20mZ3Q7IHdyb3RlOjxicj4NCiZndDsgJmd0OyBBbSAwMy4w
Ny4yMDE5IDE2OjAwIHNjaHJpZWIgRW1pbCBWZWxpa292ICZsdDtlbWlsLmwudmVsaWtvdkBnbWFp
bC5jb20mZ3Q7Ojxicj4NCiZndDsgJmd0Ozxicj4NCiZndDsgJmd0OyBPbiBXZWQsIDMgSnVsIDIw
MTkgYXQgMTQ6NDgsIEtvZW5pZywgQ2hyaXN0aWFuICZsdDtDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20mZ3Q7IHdyb3RlOjxicj4NCiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7ICZndDsgV2Vs
bCB0aGlzIGlzIHN0aWxsIGEgTkFLLjxicj4NCiZndDsgJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7
ICZndDsgQXMgc3RhdGVkIHByZXZpb3VzbHkgcGxlYXNlIGp1c3QgZG9uJ3QgcmVtb3ZlIERSTV9B
VVRIIGFuZCBrZWVwIHRoZSBmdW5jdGlvbmFsaXR5IGFzIGl0IGlzLjxicj4NCiZndDsgJmd0OyAm
Z3Q7PGJyPg0KJmd0OyAmZ3Q7IEFGQUlDVCBub2JvZHkgd2FzIGluIGZhdm91ciBvZiB5b3VyIHN1
Z2dlc3Rpb24gdG8gcmVtb3ZlIERSTV9BVVRIIGZyb208YnI+DQomZ3Q7ICZndDsgdGhlIGhhbmRs
ZSB0by9mcm9tIGZkIGlvY2x0cy48YnI+DQomZ3Q7ICZndDsgVGh1cyB0aGlzIHNlZW1zIGxpa2Ug
dGhlIHNlY29uZCBiZXN0IG9wdGlvbi48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDs8YnI+
DQomZ3Q7ICZndDsgV2VsbCBqdXN0IGtlZXAgaXQuIEFzIEkgc2FpZCBwbGVhc2UgZG9uJ3QgY2hh
bmdlIGFueXRoaW5nIGhlcmUuPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IERyb3BwaW5n
IERSTV9BVVRIIGZyb20gdGhlIGRyaXZlciBJT0NUTHMgd2FzIHN1ZmZpY2llbnQgdG8gd29yayBh
cm91bmQgdGhlIHByb2JsZW1zIGF0IGhhbmQgZmFyIGFzIEkga25vdy48YnI+DQomZ3Q7ICZndDs8
YnI+DQomZ3Q7IFdlIGFsc28gbmVlZCB0aGUgRFJNX0FVVEggZm9yIGhhbmRsZSB0by9mcm9tIGZk
IG9uZXMuIE1lc2EgZHJpdmVycyB1c2U8YnI+DQomZ3Q7IHRob3NlIGlvY3Rscy48YnI+DQomZ3Q7
PGJyPg0KJmd0Ozxicj4NCiZndDsgWWVhaCwgYnV0IG9ubHkgZm9yIGltcG9ydGluZy9leHBvcnRp
bmcgdGhpbmdzLjxicj4NCiZndDs8YnI+DQomZ3Q7IEFuZCBpbiB0aG9zZSBjYXNlcyB3ZSBlaXRo
ZXIgYWxyZWFkeSBnYXZlIHJlbmRlciBub2RlcyBvciBjb3JyZWN0bHkgYXV0aGVudGljYXRlZCBw
cmltYXJ5IG5vZGVzLjxicj4NCiZndDs8YnI+DQomZ3Q7IFNvIG5vIG5lZWQgdG8gY2hhbmdlIGFu
eXRoaW5nIGhlcmUgYXMgZmFyIGFzIEkgc2VlLjxicj4NCiZndDs8YnI+DQpOb3QgcXVpdGUuIFdo
ZW4gd29ya2luZyB3aXRoIHRoZSBwcmltYXJ5IG5vZGUgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIHNj
ZW5hcmlvczo8YnI+DQombmJzcDstIGhhbmRsZSB0byBmZCAtJmd0OyBwYXNzIGZkIHRvIG90aGVy
IEFQSXMgLSBnYm0sIG9wZW5jbCwgdmRwYXUsIGV0Yzxicj4NCiZuYnNwOy0gaGFuZGxlIHRvIGZk
IC0mZ3Q7IGZkIHRvIGhhbmRsZSAtIHVzZSBpdCBpbnRlcm5hbGx5PGJyPg0KPC9kaXY+DQo8L3Nw
YW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0K
PGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPlllYWgsIEknbSBh
d2FyZSBvZiB0aGF0IGJ1dCBob3BlZCB0aGF0IHRoaXMgd291bGQgYmUgYSByYXRoZXIgcmFyZSBj
YXNlLjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8i
PkkgbmVlZCB0byB0YWtlIGFub3RoZXIgY2xvc2VyIGxvb2sgb24gdGhpcywgYnV0IGN1cnJlbnRs
eSBJIGFtIG9uIHZhY2F0aW9uIGFuZCB3b24ndCBoYXZlIHRpbWUgbmV4dCB3ZWVrIGVpdGhlci48
L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5Ucnlp
bmcgdG8gZ2V0IGJhY2sgdG8gdGhpcyBhcyBzb29uIGFzIHBvc3NpYmxlLDwvZGl2Pg0KPGRpdiBk
aXI9ImF1dG8iPkNocmlzdGlhbi48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4N
CjxkaXYgZGlyPSJhdXRvIj4NCjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj4NCjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj4NCjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjow
IDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0K
PGRpdj48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdj48
YnI+DQotRW1pbDxicj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4NCjwvYmxvY2txdW90
ZT4NCjwvZGl2Pg0KPGJyPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_97b57c0bb0ec4224a3bdcf994159a32aemailandroidcom_--

--===============0207079238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0207079238==--
