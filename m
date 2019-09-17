Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A8B576C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 23:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22CE6ED76;
	Tue, 17 Sep 2019 21:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310127.outbound.protection.outlook.com [40.107.131.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F346ECE3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 15:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFMH0Pf674JwqGWcx4vfQ3A6qR5DKKbNII2rwV8lahhid4D9XYrb6DeBaMcjZV4hJZUWeCytyQxA61ucrtpZocHtiabx5pJCqI/YNtm8ajdDoN9DqnVWuaHdoIVyWsILL0Je9Ctygv8Q/c1jAVsSvxcKR9WRK4sDVmDX1w+Ei8u67Pxi/dWUF0aVq156UJCJz6DSFSlp+ntsrWRL6cZ8XQKR5nZivlbnPIQoC9kA5CzUafpLXQsn+M1NQT+Twx4SrA1tnSqi4ivXiyDlfGfY9UH7Jgld+GFBzMPhjazgHqFXxqsUpINCmokF1v9NwRCuv7UZXpHxcmHgm/S21naY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFjXcB3661EPhKfJjK3ZiQu8zLfnoOpVEvZUb8+1U6w=;
 b=ki6rbbqtH3PAQMUYcybm8h4Padn97aKtDKeKDFciyvtEkEK/LwnuYn9n2ERnlVCbKyzbupO46pJpBgKkeOFl5tm6d+9IKBl/YBmGf0QROZFZo5YXV8+BOtDrawM4ZVPwjjGyNQeB9dqFMHjsUNjRGv48FgNODmHcFZQ2kcZ57BCiU1+ceckefnbYP/Hhse8NUip7J93wPMpEjRCTWmscXeol9Eg+72YlFJ3F0ToEEEII5EKKZPt1qL+wKff3Oont225O4jZs8gd8BxZRQy/7rZqbFZ6OhpTH+UAzcw3TK8ZvR2xRu59EBSg66O1ZhGgp8w8APDnHZqvAlh1wcqkXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (20.177.98.81) by
 TY2PR01MB3916.jpnprd01.prod.outlook.com (20.178.133.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Tue, 17 Sep 2019 15:27:34 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:27:34 +0000
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: DRM Driver implementation question
Thread-Topic: DRM Driver implementation question
Thread-Index: AdVslX1ZBzegHzojRVS64lgG04s8jgAenS2AABbmTEA=
Date: Tue, 17 Sep 2019 15:27:34 +0000
Message-ID: <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
References: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1b30422-70c5-4c9a-4721-08d73b83906b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TY2PR01MB3916; 
x-ms-traffictypediagnostic: TY2PR01MB3916:|TY2PR01MB3916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3916558A9A81E6432C7DD8E6DF8F0@TY2PR01MB3916.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(51444003)(199004)(189003)(6636002)(6246003)(55016002)(74316002)(86362001)(7736002)(33656002)(446003)(25786009)(54906003)(66066001)(99286004)(5660300002)(6506007)(11346002)(9686003)(26005)(76176011)(4326008)(6862004)(316002)(7696005)(256004)(81166006)(66946007)(8676002)(186003)(6116002)(3846002)(76116006)(66446008)(66556008)(66476007)(64756008)(305945005)(486006)(81156014)(229853002)(71200400001)(2906002)(71190400001)(476003)(3480700005)(8936002)(6436002)(478600001)(102836004)(52536014)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY2PR01MB3916;
 H:TY2PR01MB2924.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: USC6RO7cXyQvl51euqQ1OU30wbdVyY2EOmt7WUKA9nCkUQoaDOFlDeSb5L0i3ZcRyKVYflYmMF3DnSPvnx1TlXjyaFTRMe6Cywdv76VP0xLh/LhPePlDxHKojFmP8H1wKpc/GZ6dHD69Kcx8ToEiFJdU+y76CDTg6ziN5Lx5ftRcd4YdfdaBlm17zR6Wh59wHoWsAd7up4qT+mioijwIsBY1Pq7oRok+d5Ot+alKXWefh55ib5iDSqMVaKtMZrgXmJnhtmMs7mR5S2nYp5RrR5iGaevn9Yx+I2zwGOvOC6tmBcgqQh1UJ7wVsUU+mIldyD4Uhlocqwg47yOOaz0oHxU7IALaxdJrRskCpMF7s7zCzJ1gUYr9T6puTigixh7nsNV8O5pRYnQyX1xGyLO6UU19NW9Dkx7mcpGC5fDKe7U=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b30422-70c5-4c9a-4721-08d73b83906b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:27:34.2720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4bRpjsXLmE6KLuUyVI+6lL8LOPVfSnfU8r1eOFuCs/fWbb7nJl4LfvOQk6bPoxy7nX0UzjNy3O149UTYjame7Qb3rgyAh+5plfGlVGHuyz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3916
X-Mailman-Approved-At: Tue, 17 Sep 2019 21:19:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFjXcB3661EPhKfJjK3ZiQu8zLfnoOpVEvZUb8+1U6w=;
 b=P1CitctruDNVphngf0spj19r+m2Ioc8xixbE7PYA7oj8rJn0ix+T1SaovZG1gfIZ8FRQCENh7F6zUBAnu+SA3T+E8Dc909lipO5kXMgaYRXi/hwRpYNxq+gKojdVAKwTAdqVzQNQU6uyDJoC1WQF7sbac5MrEUk/OslNdSzbbys=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=gareth.williams.jx@renesas.com; 
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWW9zaGloaXJvLAoKVGhpcyBsb29rcyBsaWtlIGFuIGVsZWdhbnQgc29sdXRpb24gdGhhdCBJ
IGNhbiBpbXBsZW1lbnQuCk1hbnkgdGhhbmtzIGZvciBwb2ludGluZyBtZSBpbiBhIGdvb2QgZGly
ZWN0aW9uLgoKPiBGcm9tOiBZb3NoaWhpcm8gU2hpbW9kYSwgU2VudDogVHVlc2RheSwgU2VwdGVt
YmVyIDE3LCAyMDE5IDA1OjM5IFBNCj4gCj4gSGkgR2FyZXRoLAo+IAo+ID4gRnJvbTogR2FyZXRo
IFdpbGxpYW1zLCBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNiwgMjAxOSAxMDo1NiBQTQo+ID4K
PiA+IEhpIExhdXJlbnQvS2llcmFuLAo+ID4KPiA+IEkgbmVlZCB0byB1cHN0cmVhbSBhIGRyaXZl
ciBmb3IgYSBkaXNwbGF5IGNvbnRyb2xsZXIgdGhhdCB3aXRoaW4gaXRzCj4gPiByZWdpc3RlcnMg
bWVtb3J5IHJlZ2lvbiBjb250YWlucyByZWdpc3RlcnMgcmVsYXRlZCB0byBhIFBXTSBkZXZpY2Uu
IFRoZQo+IFBXTSBkZXZpY2UgaXMgZm9yIGNvbnRyb2xsaW5nIHRoZSBiYWNrbGlnaHQgb2YgdGhl
IGRpc3BsYXkuCj4gPiBJZGVhbGx5LCBJIHdvdWxkIGxpa2UgdG8gY3JlYXRlIGEgc2VwYXJhdGVk
IGRyaXZlciBmb3IgdGhlIFBXTSwgc28KPiA+IHRoYXQgSSBjYW4gcmUtdXNlICJwd20tYmFja2xp
Z2h0IiwgYnV0IHNpbmNlIHRoZSByZWdpc3RlcnMgZm9yIHRoZSBQV00KPiA+IGFyZSByaWdodCBp
biB0aGUgbWlkZGxlIG9mIHRoZSByZWdpc3RlcnMgZm9yIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIg
SSB3b3VsZAo+IG5lZWQgdG8gaW9yZW1hcCB0aGUgbWVtb3J5IHJlZ2lvbiBmb3IgdGhlIFBXTSBy
ZWdpc3RlcnMgcmVnaW9uIHR3aWNlLAo+IG9uY2UgZnJvbSB0aGUgZGlzcGxheSBjb250cm9sbGVy
IGRyaXZlciwgYW5kIG9uY2UgZnJvbSB0aGUgUFdNIGRyaXZlci4KPiA+IERvIHlvdSB0aGluayB0
aGF0IHRoZSBkb3VibGUgaW9yZW1hcCB3b3VsZCBiZSBhY2NlcHRhYmxlIHVwc3RyZWFtPwo+IAo+
IEkgdGhpbmsgdGhhdCBhbiBNRkQgZHJpdmVyIGNhbiBzdXBwb3J0IHN1Y2ggaGFyZHdhcmUuIEkg
Y2hlY2tlZAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQgcm91Z2hseSwg
YW5kIHRoZW4gYXRtZWwtaGxjZGMudHh0Cj4gc2VlbXMgdG8gaGF2ZSBhIGRpc3BsYXkgY29udHJv
bGxlciBhbmQgYSBQV00gZGV2aWNlLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBZb3NoaWhpcm8gU2hp
bW9kYQoKQmVzdCBSZWdhcmRzLAoKR2FyZXRoIFdpbGxpYW1zCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
