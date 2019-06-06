Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177837D61
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EFF89289;
	Thu,  6 Jun 2019 19:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C24189269;
 Thu,  6 Jun 2019 19:41:11 +0000 (UTC)
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3077.namprd12.prod.outlook.com (20.178.54.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 19:41:09 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::2da9:6db9:100f:54de]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::2da9:6db9:100f:54de%5]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 19:41:09 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] drm/dp_mst: Register AUX devices for MST ports
Thread-Topic: [PATCH 2/7] drm/dp_mst: Register AUX devices for MST ports
Thread-Index: AQHVC/vRNbh7KxrWdkmdmhbUvKRuFaZuR+GAgBXI4wCABltegIAAAQ0AgAS6aQA=
Date: Thu, 6 Jun 2019 19:41:09 +0000
Message-ID: <1acd58fd-a5e8-0f07-709a-902ea67ba760@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-3-git-send-email-sunpeng.li@amd.com>
 <3e237f325a98b044231661886329a808d6701146.camel@redhat.com>
 <a387faf3-2375-f7a8-1508-d7b4464ee2b3@amd.com>
 <c04bed17d1da34ee355f711283c68d0dc3e0da77.camel@redhat.com>
 <2dce5d6ea4fe1c082a14962ed21568dbfd743d70.camel@redhat.com>
In-Reply-To: <2dce5d6ea4fe1c082a14962ed21568dbfd743d70.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::18) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4311b6c-c544-4533-448c-08d6eab6ec51
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3077; 
x-ms-traffictypediagnostic: BYAPR12MB3077:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR12MB30772AC648FA5E294F03FB2A82170@BYAPR12MB3077.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(366004)(39850400004)(136003)(51914003)(199004)(189003)(5660300002)(52116002)(71200400001)(71190400001)(2906002)(64756008)(76176011)(6116002)(3846002)(186003)(8936002)(66556008)(386003)(66446008)(73956011)(256004)(66066001)(53546011)(6506007)(2201001)(36756003)(66946007)(102836004)(86362001)(31686004)(66476007)(14444005)(110136005)(446003)(486006)(25786009)(31696002)(81166006)(6246003)(53936002)(478600001)(229853002)(476003)(26005)(6436002)(966005)(6306002)(316002)(6512007)(99286004)(2616005)(305945005)(7736002)(68736007)(11346002)(14454004)(2501003)(8676002)(4326008)(6486002)(81156014)(72206003)(10126625002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3077;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2IxWgnC8tBOqbs2ypc5510BOCN18WrWtW4JDrGb5Nu6cLuqwHMCqbUIFzITmV0Q9FAe9pkLCsnppqkqYL1X3ijXB1YPJRBq+rfyJom6MhP/asMNQkInOsX7KcAWc2/QwJLlRNjcCYMZ6ZcRXqVGLK80lUGsbh3uZtLC8JDdukxyu+b3d0c14P+fG1nb+A0WI+8UBDkU1w1GkZeBfje+I8gszdNUQlO4MH6hxOj4B7XXvX/d5ROaS4fqjeb5CfmvfHosnqWdRAI3Ieirox7tI8JcqBLmD/7RLcjpCoKnMkEXt6QnLGWuEcpCeyWKewUKG8w6qCb1PRZWOWuoBpP8jK8RPgU5tqV3pZ7hj7FNvMXxm8t8fcIs9N+ob2B/CQaha1Y3fOX3xxgXsOVW13Q31muHwBsujYGBGbarnUir4zbg=
Content-ID: <05D27C355AE57A458FF0B3CE20C2E2FC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4311b6c-c544-4533-448c-08d6eab6ec51
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 19:41:09.1698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cetzgp3nuK9nyeTBFzb0J65YyOjdSvh/n4im1qCWj3s=;
 b=onPg2HCXIKYKMSolPLXIH9AgScgs5fPdZyZgTsKqfWD6nHWiJZhzdn5htSalNlW3HQowspiKezLYzAb9IrHBG6DTR9PtmE2UGqRjYQYcv453s6TAe4Zc1jwRgjCzFLKWgNBwD/BEWYnROhNSPH+LB2Sn+wzThi/2EOaBTr57n3c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDYtMDMgMzoyOCBwLm0uLCBMeXVkZSBQYXVsIHdyb3RlOg0KPj4gSSdtIHJl
cHJvZHVjaW5nIHRoaXMganVzdCBieSByZWxvYWRpbmcgaTkxNSBvbiBhIG1hY2hpbmUgd2l0aCBz
b21lIE1TVA0KPj4gZGlzcGxheXMgY29ubmVjdGVkLiBJIHVwbG9hZGVkIGEgY29weSBvZiB0aGUg
c2NyaXB0IHRoYXQgSSB1c2UgdG8gZG8gdGhpcw0KPj4gaGVyZToNCj4+DQo+PiBodHRwczovL3Bl
b3BsZS5mcmVlZGVza3RvcC5vcmcvfmx5dWRlc3MvYXJjaGl2ZS8wNi0wMy0yMDE5L3VubG9hZGdw
dW1vZC5zaA0KPiBvb3BzLWFsbW9zdCBmb3Jnb3QgdG8gbWVudGlvbi4gVGhlIGFyZ3VtZW50IHlv
dSBwYXNzIHRvIG1ha2UgaXQgcmVsb2FkIGluc3RlYWQNCj4gb2YganVzdCB1bmxvYWRpbmcgaXMg
LS1yZWxvYWQNCj4gDQoNClRoYW5rcyBmb3IgdGhlIHNjcmlwdCENCg0KU28sIHRoZSB3YXJuaW5n
IGhhcyB0byBkbyB3aXRoOg0KDQoxLiBIYXZpbmcgdGhlIGF1eCBkZXZpY2UgYXMgYSBjaGlsZCBv
ZiBjb25uZWN0b3IgZGV2aWNlLCBhbmQNCjIuIER1cmluZyBkcml2ZXIgdW5sb2FkLCBkcm1fY29u
bmVjdG9yX3VucmVnaXN0ZXIoKSBpcyBjYWxsZWQgYmVmb3JlDQogICAgZHJtX2RwX21zdF90b3Bv
bG9neV9wdXRfcG9ydCgpDQoNCldoaWNoIG1lYW5zIHRoYXQgY29ubmVjdG9yX3VucmVnaXN0ZXIo
KSB3aWxsIHJlY3Vyc2l2ZWx5IHJlbW92ZSB0aGUNCmNoaWxkIGF1eCBkZXZpY2UsIGJlZm9yZSBw
dXRfcG9ydCgpIGNhbiBwcm9wZXJseSB1bnJlZ2lzdGVyIGl0LiBBbnkNCmZ1cnRoZXIgYXR0ZW1w
dHMgdG8gcmVtb3ZlIGFmdGVyIHRoZSBmaXJzdCB3aWxsIHRocm93IGEgIm5vdCBmb3VuZCIgd2Fy
bmluZy4NCg0KQ2FsbC1zdGFja3MgZm9yIHJlZmVyZW5jZToNCg0KICAgKmRybV9jb25uZWN0b3Jf
dW5yZWdpc3RlciorMHgzNy8weDYwIFtkcm1dDQogICBkcm1fY29ubmVjdG9yX3VucmVnaXN0ZXJf
YWxsKzB4MzAvMHg2MCBbZHJtXQ0KICAgZHJtX21vZGVzZXRfdW5yZWdpc3Rlcl9hbGwrMHhlLzB4
MzAgW2RybV0NCiAgIGRybV9kZXZfdW5yZWdpc3RlcisweDljLzB4YjAgW2RybV0NCiAgIGk5MTVf
ZHJpdmVyX3VubG9hZCsweDczLzB4MTIwIFtpOTE1XQ0KDQogICBkcm1fZHBfYXV4X3VucmVnaXN0
ZXJfZGV2bm9kZSsweGY1LzB4MTgwIFtkcm1fa21zX2hlbHBlcl0NCiAgICpkcm1fZHBfbXN0X3Rv
cG9sb2d5X3B1dF9wb3J0KisweDRlLzB4ZjAgW2RybV9rbXNfaGVscGVyXQ0KICAgZHJtX2RwX21z
dF90b3BvbG9neV9wdXRfbXN0YisweDkxLzB4MTYwIFtkcm1fa21zX2hlbHBlcl0NCiAgIGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3QrMHgxMmIvMHgyYjAgW2RybV9rbXNfaGVscGVyXQ0K
ICAgPyBfX2ZpbmlzaF9zd2FpdCsweDEwLzB4NDANCiAgIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
X2Rlc3Ryb3krMHgxMS8weGEwIFtkcm1fa21zX2hlbHBlcl0NCiAgIGludGVsX2RwX2VuY29kZXJf
Zmx1c2hfd29yaysweDMyLzB4YjAgW2k5MTVdDQogICBpbnRlbF9kZGlfZW5jb2Rlcl9kZXN0cm95
KzB4MzIvMHg2MCBbaTkxNV0NCiAgIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKzB4NTEvMHgyZTAg
W2RybV0NCiAgIGludGVsX21vZGVzZXRfY2xlYW51cCsweGM4LzB4MTQwIFtpOTE1XQ0KICAgaTkx
NV9kcml2ZXJfdW5sb2FkKzB4YTAvMHgxMjAgW2k5MTVdDQoNCkEgc29sdXRpb24gaXMgdG8gdW5y
ZWdpc3RlciB0aGUgYXV4IGRldmljZSBpbW1lZGlhdGVseSBiZWZvcmUgdGhlDQpjb25uZWN0b3Ig
ZGV2aWNlIGlzIHVucmVnaXN0ZXJlZCAtIGlmIHdlIGFyZSB0byBrZWVwIHRoZSBhdXggZGV2aWNl
IGFzIGENCmNoaWxkLiBGb2xsb3dpbmcgY3VycmVudCBzY2hlbWUgd2l0aCBTU1QsIGl0IGxvb2tz
IGxpa2UNCmRybV9jb25uZWN0b3JfZnVuY3MtPmVhcmx5X3VucmVnaXN0ZXIoKSBpcyB0aGUgcmln
aHQgcGxhY2UgdG8gZG8gc28uDQpUbyBrZWVwIHRoZSBiYWxhbmNlLCBhdXggcmVnaXN0cmF0aW9u
IHdpbGwgdGhlbiBoYXBwZW4gaW4NCmRybV9jb25uZWN0b3JfZnVuY3MtPmxhdGVfcmVnaXN0ZXIo
KS4gVGhpcyB3aWxsIGxlYXZlIHRoZSBTRFANCnRyYW5zYWN0aW9uIGhhbmRsaW5nIHBhcnQgaW4g
RFJNIHN0aWxsLCBidXQgcGFzcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YNCmNyZWF0aW5nIGFuZCBy
ZW1vdmluZyByZW1vdGUgKGZha2UpIGF1eCBkZXZpY2VzIHRvIHRoZSBkcml2ZXIuDQoNCkkgaGF2
ZSBhIFdJUCBwYXRjaCBoZXJlIGZvciB5b3UgdG8gdGFrZSBhIGxvb2suIEl0IHNob3VsZCBhcHBs
eSBvbiB0b3ANCm9mIHRoZSBleGlzdGluZyBwYXRjaHNldDoNCmh0dHBzOi8vcGFzdGViaW4uY29t
LzFZSlpoTDRDDQoNCkknZCBsaWtlIHRvIGhlYXIgeW91ciB0aG91Z2h0cywgYmVmb3JlIEkgZ28g
YW5kIG1vZGlmeSBvdGhlciBkcml2ZXJzIDopDQoNClRoYW5rcywNCkxlbw0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
