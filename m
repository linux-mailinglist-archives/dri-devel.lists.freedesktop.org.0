Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5E7BA48
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9786E686;
	Wed, 31 Jul 2019 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760131.outbound.protection.outlook.com [40.107.76.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464306E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiJ3XDObEosBmJb9GrW1LTY/kB81GehET/A5e3Ih2LZcyu8kLq2KnBNy/vWUx5g7sMai3FH7vQas+H/+Ml+N1GX8c+KPbfCpRyAZAfmzbLlYVbkJBzQTw0c2GQDktrvarSueRHLBQYTl5vUWe6ECIJWksVGtonv1dJFMUW7SCL8ME5UVT2wiXS21tu28GKe9IxHZJbSsqyQMLZACMLQoYbkrYfYnvTwJsnU7jiUhlRqp7UYEBenDKd+wYKsvkCMokrMe9pdEbj9jy4YMZVSuzUkC7YCDL35lcb7+PDWe1o0QMXqoyedllWTkXAsc1Ky1dsuFdVH+TeS/XClhuOzx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+zjCxUAQD9m680Ix4UeeuF7K/eR3x6uU6kM5wHy3lI=;
 b=at0kFB58m1/LehSfq0sZLLtbb3QZkY/nASnykmK/3JzR5o32XcRbIYZxtdoWYdywNC8rKzUuB20F94iR6iTXJ9CLcii9J9b8WEb1OZnEUePp68TpLhId84zOq0vSV9Jqvjy7q0HbF1RBcWTIvnG160LbOV+TVTCD4z2euLuZ1eP60Zz7TlvGTot70w61SZrddtg2nrGs+xLYXyh4DodryjFd5X6IovnuCP09Ai3XRVRzZGyuOzHRtH0kf1syTIdrZt4F0sHiess8DnXJStquIulbF9EbpJ16AVfGW/D3Fdv9P/IxqGaIZg0XEzGjAPGoworLrM1ty17reRbOUiNgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1199.namprd22.prod.outlook.com (10.174.169.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 17:43:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:43 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Topic: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Index: AQHVRv5UMJ/SoHC9Gk60MsTZ5BIvEQ==
Date: Tue, 30 Jul 2019 17:43:43 +0000
Message-ID: <MWHPR2201MB127750BFB9E4A64236710A6FC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-3-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-3-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07b5ec6c-4cbb-46ea-8805-08d7151576da
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1199; 
x-ms-traffictypediagnostic: MWHPR2201MB1199:
x-microsoft-antispam-prvs: <MWHPR2201MB1199D436144EE4374D04D8B5C1DC0@MWHPR2201MB1199.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(52314003)(76176011)(54906003)(4326008)(8936002)(68736007)(14454004)(81156014)(66066001)(99286004)(6916009)(81166006)(7416002)(52116002)(7696005)(71200400001)(71190400001)(316002)(8676002)(256004)(7736002)(2906002)(186003)(6246003)(305945005)(42882007)(478600001)(64756008)(66476007)(66556008)(66446008)(6436002)(6506007)(386003)(66946007)(53936002)(26005)(102836004)(6116002)(74316002)(25786009)(3846002)(55016002)(229853002)(52536014)(476003)(44832011)(33656002)(9686003)(486006)(5660300002)(11346002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1199;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T3g95IsMIEfxoGLC7iAz1B8kCaJZYtFUkYfld7Nn/4xmUWXPAOm3juEELq+kCPUU2X1dQ+Ue+UmfwJ7U7TDNUEG0Gf1pd+okWlpmJKmDzi8YwD7ssQbBW+F/LBuK5E1C37nNcwG6NiCNgFZucLdQYK3aYll3FT2pMNjgA1XM+ippcwcEQvwJ2x8bidRlHdOrJQWFxXMwBpP17weB1vu8dcQQGNZxz5CuWLvbUgkRehE7tZcpgXINHCR6/k7B7U+3RYLPNe00SijQqz8z4kfu6ANF3mzgnr0clctESS+aY1dHEj9VcLFMT+zhHVjy7T4QpjZBo99w5EBgs/S+U3/W4iWoPYLEGJff7bdDQu6Kq2juPOewF6QVK5O/XMRMumbcb0Gz16uBSEi4XwHt5zbacm7fB4QuOMZkRwvcKpbnAL0=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b5ec6c-4cbb-46ea-8805-08d7151576da
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:43.2717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1199
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavecomp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+zjCxUAQD9m680Ix4UeeuF7K/eR3x6uU6kM5wHy3lI=;
 b=nryBVCHQq310G+h3Mm8EjUngRt9l8qzTbYezSaauD2OcL9v0HMKjNxjPgNEynY9G8f7aiQW/Qjj9L11tCTn0Ye/W7HIAwAumHOfZYUpT9Fy9uExVHSQqILVdEL0Ahw8ufSBH9v9kCniV2fbYSVeGfYUL3zQ8menSAAYtyOmr0oQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Burton <pburton@wavecomp.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 "od@zcrc.me" <od@zcrc.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IE1vdmUgYWxsIHRoZSBwbGF0Zm9ybSBkYXRh
IHRvIGRldmljZXRyZWUuCj4gCj4gVGhlIG9ubHkgYml0IGRyb3BwZWQgaXMgdGhlIFBXTSBiZWVw
ZXIsIHdoaWNoIHJlcXVpcmVzIHRoZSBQV00gZHJpdmVyCj4gdG8gYmUgdXBkYXRlZC4gSSBmaWd1
cmVkIGl0J3Mgb2theSB0byByZW1vdmUgaXQgaGVyZSBzaW5jZSBpdCdzIHJlYWxseQo+IGEgbm9u
LWNyaXRpY2FsIGRldmljZSwgYW5kIGl0J2xsIGJlIHJlLWludHJvZHVjZWQgc29vbiBlbm91Z2gu
Cj4gCj4gVGhlIG90aGVyIGNoYW5nZSBpcyB0aGUgQ1MgbGluZSBvZiB0aGUgU1BJIGlzIG5vdyBz
ZXQgYXMgYWN0aXZlIGxvdy4gVGhlCj4gU1BJIGNvcmUgd291bGQgaGF2ZSBmb3JjZWQgImFjdGl2
ZSBsb3ciIGFueXdheSwgdW5sZXNzIHRoZSAnc3BpLWNzLWhpZ2gnCj4gcHJvcGVydHkgaXMgc2V0
Lgo+IAo+IEluIHRoZSBwcm9jZXNzIG9mIG1vdmluZyB0byBkZXZpY2V0cmVlLCB3ZSBhbHNvIHN3
aXRjaGVkIHRvIG5ldyBkcml2ZXJzOgo+IC0gV2UgdXNlIHRoZSBzaW1wbGUtYXVkaW8tY2FyZCBh
bmQgc2ltcGxlLWFtcGxpZmllciBkcml2ZXJzIGluc3RlYWQgb2YKPiB0aGUgY3VzdG9tIEFTb0Mg
Y29kZTsKPiAtIFdlIHVzZSB0aGUgbmV3IEluZ2VuaWMgRFJNIGRyaXZlciBjb3VwbGVkIHdpdGgg
dGhlIEdpYW50UGx1cyBHUE05NDBCMAo+IERSTSBwYW5lbCBkcml2ZXIgaW5zdGVhZCBvZiB0aGUg
b2xkIGZyYW1lYnVmZmVyIGRyaXZlcjsKPiAtIFdlIHVzZSB0aGUgbmV3IGp6NDc4MC1kbWEgZHJp
dmVyIGluc3RlYWQgb2YgdGhlIG9sZCBqejQ3NDAtZG1hIG9uZTsKPiAtIFdlIHVzZSB0aGUgaW5n
ZW5pYy1uYW5kIGFuZCBqejQ3NDAtZWNjIGRyaXZlcnMgaW5zdGVhZCBvZiB0aGUgb2xkCj4gano0
NzQwLW5hbmQgZHJpdmVyOwo+IC0gV2UgdXNlIGluZ2VuaWMtYmF0dGVyeSBpbnN0ZWFkIG9mIGp6
NDc0MC1iYXR0ZXJ5Owo+IC0gV2UgdXNlIGlpby1od21vbiBpbnN0ZWFkIG9mIGp6NDc0MC1od21v
bjsKPiAtIFdlIHVzZSBpbmdlbmljLWlpbyBpbnN0ZWFkIG9mIHRoZSBvbGQgano0NzQwLWFkYyBN
RkQgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0Pgo+IFRlc3RlZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsu
ZXU+CgpBcHBsaWVkIHRvIG1pcHMtbmV4dC4KClRoYW5rcywKICAgIFBhdWwKClsgVGhpcyBtZXNz
YWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsgaWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3Jy
ZWN0CiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0
LiBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
