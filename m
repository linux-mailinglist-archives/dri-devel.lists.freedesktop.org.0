Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568245C9E9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 09:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D5689654;
	Tue,  2 Jul 2019 07:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140071.outbound.protection.outlook.com [40.107.14.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB20898E4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 23:10:44 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5695.eurprd05.prod.outlook.com (20.178.121.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 23:10:40 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 23:10:40 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the hmm tree
Thread-Topic: linux-next: build failure after merge of the hmm tree
Thread-Index: AQHVMADFlVCZuQtgG0K1dqA/V+XsLaa2ZF8A
Date: Mon, 1 Jul 2019 23:10:40 +0000
Message-ID: <20190701231036.GC23718@mellanox.com>
References: <20190701213304.34eeaef8@canb.auug.org.au>
In-Reply-To: <20190701213304.34eeaef8@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:fc::19) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f86c71f-9989-4bfc-672a-08d6fe7955a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5695; 
x-ms-traffictypediagnostic: VI1PR05MB5695:
x-microsoft-antispam-prvs: <VI1PR05MB5695D45FB5894D118E6B6702CFF90@VI1PR05MB5695.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(53754006)(102836004)(386003)(6506007)(76176011)(25786009)(8936002)(4326008)(476003)(2616005)(486006)(186003)(5660300002)(14454004)(54906003)(316002)(11346002)(26005)(6116002)(2906002)(68736007)(3846002)(52116002)(99286004)(66476007)(73956011)(66556008)(33656002)(7736002)(8676002)(6246003)(64756008)(256004)(36756003)(478600001)(66946007)(86362001)(53936002)(6512007)(66446008)(81166006)(81156014)(71200400001)(6486002)(229853002)(71190400001)(6436002)(1076003)(305945005)(446003)(6916009)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5695;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lCOCP/963DaWTbtI+uY9+nj8dJ/ioTxDE5tMwx0eL8vVw0Lxx7vgoXN1elaG2+POxUKmuSDPbkhvB2oSCit3UejjmHs23GNdCJrhqxS5wrNK/qu5wiEyhdFuB3aWUv5t0lwcbSqmVcMbrITrlpRmbt5TT6YmftWyWL3N+vx4M7vyDvQ+jZGEkFUSycX8R+m9BCLv8enGmphYVWZvxFbiZPckslmBb5d/vtefULRTXxNdsXLSpX9vCnotKWAw48rQf0gJZ+SVEXF2xZxcI89BBIxzPSotjmEpCLCH3+ngC4r1kxdddZqWnvP6V3beXT5r6Egmdatl1ERrMaTu4TiN4m5xFJbiUozUCuSWTjy6t0EuSjqSbYoow9p4IkeSPh0kPIC9+qRTVE608CUvZLVPgybH8+ghwRbdSZwZX7Pbxo0=
Content-ID: <89A8AB12ACF07449851614D76275C3DA@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f86c71f-9989-4bfc-672a-08d6fe7955a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 23:10:40.3440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5695
X-Mailman-Approved-At: Tue, 02 Jul 2019 07:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBQNw1wABUNAaUxOF7dAFZr3renLsUCBb/+lhNxWbcQ=;
 b=m3zHg+Xy0xSEkkqJo+SIYo9C8wy+nPsJNJyTKm9CSgUzvGFh4EQYVTwy2vzX0oSUrwa8AO65N2q78QJlW1M2O/OOZVX2gbKSgWS1Qaewb5PEFrW9GR/F4CQS0MLuhPgY6yf2gumnGQRmFYni9ZKV6s8c6yNzzulQBhum3Pdnps0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Philip Yang <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDk6MzM6MDRQTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gQWZ0ZXIgbWVyZ2luZyB0aGUgaG1tIHRyZWUsIHRvZGF5
J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0IGFsbG1vZGNvbmZpZykKPiBmYWlsZWQgbGlrZSB0
aGlzOgo+IAo+IG1tL2htbS5jOiBJbiBmdW5jdGlvbiAnaG1tX2dldF9vcl9jcmVhdGUnOgo+IG1t
L2htbS5jOjUwOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnbG9j
a2RlcF9hc3NlcnRfaGVsZF9leGNsdXNpdmUnOyBkaWQgeW91IG1lYW4gJ2xvY2tkZXBfYXNzZXJ0
X2hlbGRfb25jZSc/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAg
bG9ja2RlcF9hc3NlcnRfaGVsZF9leGNsdXNpdmUoJm1tLT5tbWFwX3NlbSk7Cj4gICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgbG9ja2RlcF9hc3NlcnRfaGVsZF9vbmNlCj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOiBJbiBmdW5jdGlvbiAnYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcl9wYWdlcyc6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jOjc3ODoyODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiAnaG1tX3Jhbmdl
X3JlZ2lzdGVyJyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21w
YXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gICBobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1tLCBz
dGFydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjM1Ogo+IGluY2x1
ZGUvbGludXgvaG1tLmg6NDY0OjI5OiBub3RlOiBleHBlY3RlZCAnc3RydWN0IGhtbV9taXJyb3Ig
KicgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ3N0cnVjdCBtbV9zdHJ1Y3QgKicKPiAgICAgICAg
ICAgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKPiAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+
fn5+fl5+fn5+fgo+IAo+IENhdXNlZCBieSBjb21taXQKPiAKPiAgIGUzNmFjZmU2Yzg2ZCAoIm1t
L2htbTogVXNlIGhtbV9taXJyb3Igbm90IG1tIGFzIGFuIGFyZ3VtZW50IGZvciBobW1fcmFuZ2Vf
cmVnaXN0ZXIiKQo+IAo+IGludGVyYWN0aW5nIHdpdGggY29tbWl0Cj4gCj4gICA2NmM0NTUwMGJm
ZGMgKCJkcm0vYW1kZ3B1OiB1c2UgbmV3IEhNTSBBUElzIGFuZCBoZWxwZXJzIikKPiAKPiBmcm9t
IHRoZSBkcm0gdHJlZS4KPiAKPiBBbGwgSSBjb3VsZCBkbyBmb3Igbm93IHdhcyB0byBtYXJrIHRo
ZSBBTURHUFUgZHJpdmVyIGJyb2tlbi4gIFBsZWFzZQo+IHN1Ym1pdCBhIG1lcmdlIGZvciBmb3Ig
bWUgKGFuZCBsYXRlciBMaW51cykgdG8gdXNlLgoKVGhpcyBpcyBleHBlY3RlZCwgdGhlIEFNRCBn
dXlzIGhhdmUgdGhlIHJlc29sdXRpb24gZm9yIHRoaXMgZnJvbSB3aGVuCnRoZXkgdGVzdGVkIGht
bS5naXQuLgoKSSB0aGluayB3ZSBhcmUgZ29pbmcgdG8gaGF2ZSB0byBtZXJnZSBobW0uZ2l0IGlu
dG8gdGhlIGFtZGdwdSB0cmVlIGFuZApwdXNoIHRoZSByZXNvbHV0aW9uIGZvcndhcmQsIGFzIGl0
IGxvb2tzIGtpbmQgb2YgY29tcGxpY2F0ZWQgdG8gc2hpZnQKb250byBMaW51cyBvciBEUk0uCgpQ
cm9iYWJseSBhbWRncHUgbmVlZHMgdG8gZ2FpbiBhIGZldyBwYXRjaGVzIG1ha2luZyB0aGUgaG1t
X21pcnJvcgp2aXNpYmxlIHRvIGFtZGdwdV90dG0uYyBhbmQgdGhlbiB0aGUgbWVyZ2UgcmVzb2x1
dGlvbiB3aWxsIGJlIHNpbXBsZT8KCkFNRC9EUk0gd2UgaGF2ZSBhIGZldyBkYXlzIGxlZnQgdG8g
ZGVjaWRlIG9uIGhvdyBiZXN0IHRvIGhhbmRsZSB0aGUKY29uZmxpY3QsIHRoYW5rcy4KClJlZ2Fy
ZHMsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
