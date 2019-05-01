Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436F10647
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 11:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78F389309;
	Wed,  1 May 2019 09:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710044.outbound.protection.outlook.com [40.107.71.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26989309
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 09:24:35 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1691.namprd12.prod.outlook.com (10.172.36.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Wed, 1 May 2019 09:24:32 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 09:24:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH v2] drm: introduce a capability flag for syncobj timeline
 support
Thread-Topic: [PATCH v2] drm: introduce a capability flag for syncobj timeline
 support
Thread-Index: AQHU//+vibXtpK+zzkO0M5YuaPbCDw==
Date: Wed, 1 May 2019 09:24:32 +0000
Message-ID: <5cb28694-943e-473a-a81c-a81b7e896509@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [37.201.193.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 292f57f6-5a02-4196-c81f-08d6ce16d1f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1691; 
x-ms-traffictypediagnostic: DM5PR12MB1691:
x-microsoft-antispam-prvs: <DM5PR12MB1691003BA797336E26EC069D833B0@DM5PR12MB1691.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(6916009)(229853002)(7736002)(53546011)(66066001)(86362001)(8676002)(72206003)(478600001)(25786009)(316002)(14454004)(6246003)(102836004)(31686004)(6506007)(26005)(31696002)(4326008)(66446008)(66946007)(66556008)(3846002)(73956011)(76116006)(9686003)(71200400001)(6512007)(66574012)(2906002)(68736007)(54896002)(64756008)(6436002)(99286004)(8936002)(6486002)(66476007)(81156014)(486006)(256004)(14444005)(476003)(71190400001)(5660300002)(305945005)(53936002)(54906003)(186003)(81166006)(91956017)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1691;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: txa3NBBiL/WoA6IwVoZPrOErQawFcDyJxqVGSFdJ1XkWXXkHjwJXIRH9P4JFLaj6orhxhFCX7conbjY1mrdktsqR3d7dVYtH8Jm1yO5m9SaOeTKqmbNpxNUYMnFP7/XpCQsttgXKIg47SI2NPtW4fSWvgueBgMR4JMxrsnt/+GXQ/VktGKUnviLJbSxVvJNqE+xMxNaI+4ehjy5dToUUnQsg+ZsZ85SDthGCfCzujWpbYdZ63rcOv5JHlexNzKQ+u4/pY+mktC4dIWLh41hHAudh80MNeO0c4MVmQYc2udocqDk0hWoIOKZBCFplwyuD19wis/Suv2JeGsvWc0WYxKT6psQUv463wtAjZuBdMKIT0R3iRoDhBbPD1A9AyQJjjRHDek2WyrjJ6QCU7PomfNZvkADSiMhMCoy0U05c43g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292f57f6-5a02-4196-c81f-08d6ce16d1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 09:24:32.5527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw1bWHUDwImy6irc9netu4Scz7o7SW9k8XcYz9efAAg=;
 b=G+cr/chV/RwJcejuAhRZcuWLFrpL9oAPTwGviauzWWIJp6XPGn8RoPwncA/OIksfoPmVXzisYWG/0bKqOaA5o87EvwsZEq7v069XOI/4kHkDKf0RtUU8lMidRYmNTP6YIVhBluIjowg7JeiTrUc0oqfs20w14Z0DGrT03S9Uaq0=
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0679598359=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0679598359==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_5cb28694943e473aa81ca81b7e896509emailandroidcom_"

--_000_5cb28694943e473aa81ca81b7e896509emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDAxLjA1LjIwMTkgMTE6MDAgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVs
LmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Og0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQpP
biAxNi8wNC8yMDE5IDIwOjUzLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4gT24gVHVlLCAxNiBBcHIg
MjAxOSBhdCAyMjo1OCwgTGlvbmVsIExhbmR3ZXJsaW4NCj4gPGxpb25lbC5nLmxhbmR3ZXJsaW5A
aW50ZWwuY29tPiB3cm90ZToNCj4+IFVuZm9ydHVuYXRlbHkgdXNlcnNwYWNlIHVzZXJzIG9mIHRo
aXMgQVBJIGNhbm5vdCBiZSBwdWJsaWNseSBkaXNjbG9zZWQNCj4+IHlldC4NCj4+DQo+PiBUaGlz
IGNvbW1pdCBlZmZlY3RpdmVseSBkaXNhYmxlcyB0aW1lbGluZSBzeW5jb2JqIGlvY3RscyBmb3Ig
YWxsDQo+PiBkcml2ZXJzLiBFYWNoIGRyaXZlciB3aXNoaW5nIHRvIHN1cHBvcnQgdGhpcyBmZWF0
dXJlIHdpbGwgbmVlZCB0bw0KPj4gZXhwb3NlIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FLg0KPj4N
Cj4+IHYyOiBBZGQgdUFQSSBjYXBhYmlsaXR5IGNoZWNrIChDaHJpc3RpYW4pDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwu
Y29tPg0KPj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gKHYxKQ0KPj4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4+IENjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+PiBDYzogQ2h1bm1pbmcg
WmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4NCj4gTEdUTSwNCj4NCj4gUmV2aWV3ZWQtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+DQo+IE5vdCBzdXJlIGlmIEknbSBkdWUg
YW55bW9yZSBtaXNjLW5leHQgcHVsbHMsIGlmIHNvIHdvdWxkIGJlIGdvb2QgdG8NCj4gaGF2ZSBp
dCBnbyB0aGF0IHdheSwgYnV0IG90aGVyd2lzZSBJIGNhbiBwdWxsIGl0IGludG8gLW5leHQgd2hl
biBJIGdldA0KPiBzb21lIHRpbWUuDQo+DQo+IERhdmUuDQo+DQpDaHJpc3RpYW4sIERhdmUsDQoN
CldobyBzaG91bGQgcHVsbCB0aGVzZSBwYXRjaGVzIGluPw0KDQpJIHdhcyBhc3N1bWluZyBEYXZl
IGRvZXMgdGhpcy4NCg0KSSBjb3VsZCBkbyBpdCB0b21vcnJvdywgYnV0IHRvZGF5IGlzIGEgaG9s
aWRheSBoZXJlIGFuZCBJIGFtIG5vdCBldmVuIGNsb3NlIHRvIG15IGxhcHRvcC4NCg0KQ2hyaXN0
aWFuLg0KDQoNClRoYW5rcywNCg0KLUxpb25lbA0KDQo=

--_000_5cb28694943e473aa81ca81b7e896509emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <E9115C45A4D54B4882F4F9E477589764@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDAxLjA1LjIwMTkgMTE6MDAgc2NocmllYiBMaW9uZWwgTGFuZHdl
cmxpbiAmbHQ7bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20mZ3Q7OjxiciB0eXBlPSJhdHRy
aWJ1dGlvbiI+DQo8YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+
PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+W0NBVVRJ
T046IEV4dGVybmFsIEVtYWlsXTxicj4NCjxicj4NCk9uIDE2LzA0LzIwMTkgMjA6NTMsIERhdmUg
QWlybGllIHdyb3RlOjxicj4NCiZndDsgT24gVHVlLCAxNiBBcHIgMjAxOSBhdCAyMjo1OCwgTGlv
bmVsIExhbmR3ZXJsaW48YnI+DQomZ3Q7ICZsdDtsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNv
bSZndDsgd3JvdGU6PGJyPg0KJmd0OyZndDsgVW5mb3J0dW5hdGVseSB1c2Vyc3BhY2UgdXNlcnMg
b2YgdGhpcyBBUEkgY2Fubm90IGJlIHB1YmxpY2x5IGRpc2Nsb3NlZDxicj4NCiZndDsmZ3Q7IHll
dC48YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IFRoaXMgY29tbWl0IGVmZmVjdGl2ZWx5IGRp
c2FibGVzIHRpbWVsaW5lIHN5bmNvYmogaW9jdGxzIGZvciBhbGw8YnI+DQomZ3Q7Jmd0OyBkcml2
ZXJzLiBFYWNoIGRyaXZlciB3aXNoaW5nIHRvIHN1cHBvcnQgdGhpcyBmZWF0dXJlIHdpbGwgbmVl
ZCB0bzxicj4NCiZndDsmZ3Q7IGV4cG9zZSBEUklWRVJfU1lOQ09CSl9USU1FTElORS48YnI+DQom
Z3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IHYyOiBBZGQgdUFQSSBjYXBhYmlsaXR5IGNoZWNrIChDaHJp
c3RpYW4pPGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBTaWduZWQtb2ZmLWJ5OiBMaW9uZWwg
TGFuZHdlcmxpbiAmbHQ7bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20mZ3Q7PGJyPg0KJmd0
OyZndDsgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgJmx0O2NocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbSZndDsgKHYxKTxicj4NCiZndDsmZ3Q7IENjOiBEYXZlIEFpcmxpZSAmbHQ7YWlybGll
ZEByZWRoYXQuY29tJmd0Ozxicj4NCiZndDsmZ3Q7IENjOiBEYW5pZWwgVmV0dGVyICZsdDtkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoJmd0Ozxicj4NCiZndDsmZ3Q7IENjOiBDaHJpc3RpYW4gS8O2bmln
ICZsdDtjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20mZ3Q7PGJyPg0KJmd0OyZndDsgQ2M6IENodW5t
aW5nIFpob3UgJmx0O2RhdmlkMS56aG91QGFtZC5jb20mZ3Q7PGJyPg0KJmd0OyBMR1RNLDxicj4N
CiZndDs8YnI+DQomZ3Q7IFJldmlld2VkLWJ5OiBEYXZlIEFpcmxpZSAmbHQ7YWlybGllZEByZWRo
YXQuY29tJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IE5vdCBzdXJlIGlmIEknbSBkdWUgYW55bW9y
ZSBtaXNjLW5leHQgcHVsbHMsIGlmIHNvIHdvdWxkIGJlIGdvb2QgdG88YnI+DQomZ3Q7IGhhdmUg
aXQgZ28gdGhhdCB3YXksIGJ1dCBvdGhlcndpc2UgSSBjYW4gcHVsbCBpdCBpbnRvIC1uZXh0IHdo
ZW4gSSBnZXQ8YnI+DQomZ3Q7IHNvbWUgdGltZS48YnI+DQomZ3Q7PGJyPg0KJmd0OyBEYXZlLjxi
cj4NCiZndDs8YnI+DQpDaHJpc3RpYW4sIERhdmUsPGJyPg0KPGJyPg0KV2hvIHNob3VsZCBwdWxs
IHRoZXNlIHBhdGNoZXMgaW4/PGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9i
bG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4N
CjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPkkgd2FzIGFzc3VtaW5nIERhdmUgZG9lcyB0aGlzLjwv
ZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPkkgY291
bGQgZG8gaXQgdG9tb3Jyb3csIGJ1dCB0b2RheSBpcyBhIGhvbGlkYXkgaGVyZSBhbmQgSSBhbSBu
b3QgZXZlbiBjbG9zZSB0byBteSBsYXB0b3AuPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0K
PC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+Q2hyaXN0aWFuLjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8i
Pjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPg0KPGRpdiBjbGFzcz0iZ21haWxfZXh0cmEi
Pg0KPGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPg0KPGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBz
dHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGlu
Zy1sZWZ0OjFleCI+DQo8ZGl2Pjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTFwdCI+DQo8ZGl2Pjxicj4NClRoYW5rcyw8YnI+DQo8YnI+DQotTGlvbmVsPGJyPg0KPC9kaXY+
DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8YnI+DQo8L2Rp
dj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_5cb28694943e473aa81ca81b7e896509emailandroidcom_--

--===============0679598359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0679598359==--
