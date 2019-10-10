Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB04D2880
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6916EB0A;
	Thu, 10 Oct 2019 11:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752B6EB0A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuEagToDjKoXB1R8Q5W2kG+8RbEVlmJu7dlnyYUfTasWq0v9y/z/sCfdELOqZcyGNINmMC1swlOHmToW8bOyT6QzQ8hgytQDhh+bfRgOl+5GkJZ0qj94qoGbYG1xbko9zjYuhzROrIKaQVt5Ld3BAUaBPoL2YnHxADAPFWYcWTi1McUoPrLdhMfbmeC0j4lU2IQ53F5ZDKq7V8P5Sp+hyoOJNcSory+kZPPW76vL2ptAZufoh7R8OA5yA7dGTX2zQY6wmNYkGsPLImCNhTQVfLno+qw2jLoTYkSZn619v58qaSHzMlP7fpQfO3qY8b05tTxYVWh6Y3cYJ+BRisMfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jsIsknOA+sZtjerIk9Nx/oD+eXuBqhxSuTUiHJisGQ=;
 b=ao37bsggklUJmq0aucY5he2DfMx4YZXUWHZqJHVn5/ybgFmGxNRm/TZ3OBONbw+NNhEV4jJXlKPExWZELNfzLLZSHRDHHwMPgxGn03/2TTd7mgpWBBp7cG34Oyl+NisWriO/Aol/uN3vFGz8qn5uxHQLuq7UnZckFVns4aXDtid0wMMkCrAwWdXap+iXT7PjGuD2/pRCx1MvhSUaO3I70L47S2hMjQnqu34l5Qb2N2xCATVKZD7ym4sfpos0y0vPLMoKMcal/pHLBflILZCc30PF96nVHlSw3zb/zCb8qL2z7Jzag+6KIY9+rG58j8F2NQZdiiyv9DKt75b74S25Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2584.namprd12.prod.outlook.com (52.132.139.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 10 Oct 2019 11:58:24 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.026; Thu, 10 Oct
 2019 11:58:24 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
Thread-Topic: [pull] ttm drm-fixes-5.4
Thread-Index: AQHVfUmXvjZaF5zfJEekUt8X3OCS/KdQY2iAgABWbYCAATcOAIAB2IcA
Date: Thu, 10 Oct 2019 11:58:23 +0000
Message-ID: <55cad18c-b69f-226c-182e-cdaf743822e3@amd.com>
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
 <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
 <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
 <20191009074700.ieujxt3ueads2cbt@ahiler-desk1.fi.intel.com>
In-Reply-To: <20191009074700.ieujxt3ueads2cbt@ahiler-desk1.fi.intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:208:122::43) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1653843c-7f0e-4103-3240-08d74d7926e4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2584:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2584E6F835CE29025E9E890483940@DM5PR12MB2584.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(189003)(199004)(6436002)(6506007)(186003)(31686004)(446003)(25786009)(11346002)(6246003)(36756003)(76176011)(81166006)(52116002)(2616005)(4326008)(81156014)(486006)(102836004)(476003)(14444005)(386003)(6116002)(14454004)(53546011)(229853002)(256004)(316002)(2906002)(8676002)(6486002)(65806001)(65956001)(31696002)(305945005)(66946007)(66556008)(64756008)(66446008)(66476007)(54906003)(966005)(58126008)(8936002)(6512007)(7736002)(5660300002)(46003)(71200400001)(478600001)(110136005)(66574012)(99286004)(6306002)(71190400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2584;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H0rRierkORrvzpfgR6Vm5i67faDHYnbL6hju+TnwPAoZGx7mgdcIxcjAbnlSYbomhwZrb4XbRi4+hXvZzICht04bdzuW371FPQwlFsMbElxFNTQon0Y5AcL+9rRfumMp407rSUq2lsKrgJ2PY/1LP1jgFU6rsbdzcCFm5tjAY1DMe+ghUNJi7KspWP1gcdnS75ooegHJ1OMW5k957Z+ecOO6hjBel080JBHWWxQpwpwasEJry9eigozPTzCzVEVYY0AqRqK8D4geYrojittsukrUjIPC4gBi9YG3jGCuJbklMYk79zmlXfhBd5RLJob3b4Aes+KaLtbztq28fjs6vpafJxks2qKaQRcm/FVUt0D3GtUYyBTPVdzG334sEtXHXb0zQATEme9TsMmZBMWwX3bsfNiH+CQUMtPWOwOWghX2uZnMeiCvHDz7vEHu3MQfVasd7hoG0dTJQdogoml0Vg==
Content-ID: <319628B2CE9EDD45B48F53B58E068C77@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1653843c-7f0e-4103-3240-08d74d7926e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 11:58:23.9413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3MxRoQgN4Rf1446fFmWnCMEwEFaltn2hWL8OPqlE5OaVVOE1dmdtIwJWJyuRODlp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2584
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jsIsknOA+sZtjerIk9Nx/oD+eXuBqhxSuTUiHJisGQ=;
 b=ioKIZKPf2nJp+PfsEqTm3AnoIYwdILk7XQSCqmOtHVcqE0qKWg4P8m4qdTbFipY/AhvSNwibmknabeqScxchvPaKmf5nLWUSHEFbzzuPHGGif59WRhdoJhDS3+B4dDs7gFpSvidRj++ibPbJ7pbpamFtjBDGJEnpO4kbX3HWBdI=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Huang, Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTAuMTkgdW0gMDk6NDcgc2NocmllYiBBcmthZGl1c3ogSGlsZXI6DQo+IE9uIFR1ZSwg
T2N0IDA4LCAyMDE5IGF0IDA5OjEzOjQxQU0gLTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4+
IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgNDowNCBBTSBLb2VuaWcsIENocmlzdGlhbg0KPj4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6DQo+Pj4gTXkgZ2l0IHZlcnNpb24gc2hvdWxk
IGJlIHJlbGF0aXZlIG5ldywgYnV0IEknbSB1c3VhbGx5IHVzaW5nIHRodW5kZXJiaXJkDQo+Pj4g
dG8gc2VuZCBwdWxsIHJlcXVlc3RzIG5vdCBnaXQgaXRzZWxmIHNpbmNlIEkgd2FudCB0byBlZGl0
IHRoZSBtZXNzYWdlDQo+Pj4gYmVmb3JlIHNlbmRpbmcuDQo+Pj4NCj4+PiBIb3cgd291bGQgSSBk
byB0aGlzIGluIGEgd2F5IHBhdGNod29yayBsaWtlcyBpdCB3aXRoIGdpdD8NCj4+IEZXSVcsIEkg
dXN1YWxseSBnZW5lcmF0ZSB0aGUgZW1haWwgZmlyc3QgYW5kIHRoZW4gdXNlIGdpdC1zZW5kLWVt
YWlsDQo+PiB0byBhY3R1YWxseSBzZW5kIGl0Lg0KPj4NCj4+IEFsZXgNCj4gSGV5LA0KPg0KPiBG
RE8gcGF0Y2h3b3JrIG1haW50YWluZXIgaGVyZS4NCj4NCj4gSSBoYXZlIHRyaWVkIGZldyB0aGlu
Z3MgcXVpY2tseSB3aXRoIG5vIGx1Y2suIFRoZXJlIGlzIHNvbWV0aGluZyBmaXNoeQ0KPiBhYm91
dCBGRE8gZGVwbG95bWVudCBvZiBwYXRjaHdvcmsgLSB5b3UgZW1haWwgd29ya3MganVzdCBmaW5l
IG9uIG15DQo+IGRldmVsb3BtZW50IGluc3RhbmNlLg0KPg0KPiBJIGhhdmUgY3JlYXRlZCBpc3N1
ZSBmb3IgdGhpczoNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BhdGNod29yay1m
ZG8vcGF0Y2h3b3JrLWZkby9pc3N1ZXMvMjgNCj4NCj4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmll
bmNlLg0KDQpNYXliZSBpdCdzIHRoZSBub24tTGF0aW4gbGV0dGVyIGluIG15IGxhc3QgbmFtZT8g
QW55d2F5IHdlIG5lZWQgdG8gZ2V0IA0KdGhlIFRUTSBmaXhlcyB1cHN0cmVhbSBmb3IgNS40Lg0K
DQpEYXZlL0RhbmllbCBhbnkgb2JqZWN0aW9ucyB0aGF0IEkgcHVzaCB0aG9zZSBkaXJlY3RseSB0
byBkcm0tbWlzYy1maXhlcz8NCg0KVGhhbmtzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IENoZWVycywN
Cj4gQXJlaw0KPg0KPj4+IFRoYW5rcywNCj4+PiBDaHJpc3RpYW4uDQo+Pj4NCj4+PiBBbSAwNy4x
MC4xOSB1bSAyMTo1OCBzY2hyaWViIERhdmUgQWlybGllOg0KPj4+PiBGb3Igc29tZSByZWFzb24g
dGhpcyBkaWRuJ3QgZW5kIHVwIGluIHBhdGNod29yayB3aGljaCBtYWtlcyBpdCBoYXJkDQo+Pj4+
IGZvciBtZSB0byBwcm9jZXNzLg0KPj4+Pg0KPj4+PiBVc3VhbCBzdXNwZWN0cyBhcmUgdXNpbmcg
dG9vIG9sZCBhIGdpdCB0byBzZW5kIGl0IG9yIG1heWJlIGl0IGdvdCBjdHJsLU1zIGluIGl0Lg0K
Pj4+Pg0KPj4+PiBEYXZlLg0KPj4+Pg0KPj4+PiBPbiBUaHUsIDMgT2N0IDIwMTkgYXQgMDE6NDQs
IENocmlzdGlhbiBLw7ZuaWcNCj4+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29t
PiB3cm90ZToNCj4+Pj4+IEhpIERhdmUsIERhbmllbCwNCj4+Pj4+DQo+Pj4+PiB3ZSBoYWQgc29t
ZSBwcm9ibGVtcyB0aGlzIGN5Y2xlIHNlbmRpbmcgb3V0IFRUTSBmaXhlcyBiZWNhdXNlIG9mIGxh
Y2sgb2YNCj4+Pj4+IHRpbWUgdG8gcmViYXNlIGFtZC1zdGFnaW5nLWRybS1uZXh0Lg0KPj4+Pj4N
Cj4+Pj4+IEJlY2F1c2Ugb2YgdGhpcyBBbGV4IGFuZCBJIGRlY2lkZWQgdGhhdCBJJ20gZ29pbmcg
dG8gc2VuZCBvdXQgVFRNIHB1bGwNCj4+Pj4+IHJlcXVlc3RzIHNlcGFyYXRlbHkgbm93LiBTbyB0
aGlzIGlzIHRoZSBmaXJzdCBzbWFsbCBidW5jaCBvZiBmaXhlcyBmb3IgNS40Lg0KPj4+Pj4NCj4+
Pj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNTRlY2I4ZjcwMjhjNWViM2Q3
NDBiYjgyYjBmMWQ5MGYyZGY2M2M1YzoNCj4+Pj4+DQo+Pj4+PiAgICAgIExpbnV4IDUuNC1yYzEg
KDIwMTktMDktMzAgMTA6MzU6NDAgLTA3MDApDQo+Pj4+Pg0KPj4+Pj4gYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+Pj4+Pg0KPj4+Pj4gICAgICBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvY2tvZW5pZy9saW51eC1kcm0uZ2l0IGRybS10dG0tZml4ZXMNCj4+
Pj4+DQo+Pj4+PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gM2VlZmNmZTlhNjQ0YmU0
NDA5NjkxYjQ0YzNiMmQ2MjlkMTc3ZmI5YToNCj4+Pj4+DQo+Pj4+PiAgICAgIGRybS90dG06IFJl
c3RvcmUgdHRtIHByZWZhdWx0aW5nICgyMDE5LTEwLTAyIDE1OjU3OjM0ICswMjAwKQ0KPj4+Pj4N
Cj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4+Pj4+IENocmlzdGlhbiBLw7ZuaWcgKDEpOg0KPj4+Pj4gICAgICAg
ICAgZHJtL3R0bTogZml4IGJ1c3kgcmVmZXJlbmNlIGluIHR0bV9tZW1fZXZpY3RfZmlyc3QNCj4+
Pj4+DQo+Pj4+PiBUaG9tYXMgSGVsbHN0cm9tICgxKToNCj4+Pj4+ICAgICAgICAgIGRybS90dG06
IFJlc3RvcmUgdHRtIHByZWZhdWx0aW5nDQo+Pj4+Pg0KPj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgICAgfCAgNCArKy0tDQo+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyB8IDE2ICsrKysrKystLS0tLS0tLS0NCj4+Pj4+ICAgICAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4gUmVn
YXJkcywNCj4+Pj4+IENocmlzdGlhbi4NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+PiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
