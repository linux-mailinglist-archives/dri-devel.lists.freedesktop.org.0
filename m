Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB7CB55A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B806EAE0;
	Fri,  4 Oct 2019 07:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400128.outbound.protection.outlook.com [40.107.140.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0366E109
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 06:30:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErO3zvEv+bGxhHrZ7Cx2Cqg2Mo68NVfxYnyK5l1ontBR9QYJMqE+n3aEa1KunBNrhxu0NPEpPYA2JQ315VUyiuGvUU2I3/4BSDdtrCj2B9uJODAuokkAl5x980R5kcbNeukCJOVrjllLDn4r1lqvXWXPI+zoHe2YhaZI1il8m6Mi6iN1qp+hD9VwEmcQ1hhG8eeyQ6GwOOUFYvBJW0g8kxVJDrYEyWUOwvIsBFesvXp08LRMLM4ulF4sGxyOvDPMOeii0BcQmpPXz8+mE5rfoRNHMOeRfzKGwPTD0OzsqooDVZEG2MM46D11st0q9H5sDKo3MjcoEKIzNM5zFXWU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dh4u9mgJakKb9+E0/cX6cv/0Z/fwV9+ct0rIN9H9Hjc=;
 b=Y9/1/0omZUgmRJKlZ4HcCt5cKaTrwktncXCiqj/wwrrdchIZ8CB+wOLSZf30KMKgbhWgD+F7SqkWVkwG/y+hp6FiRi0Ikh6CzvkefB3It9Ai6ExJxa6qSH071LLS1q06aV9+CKr9n2ypXvs42UWI51/BK8NUKAL31oHUc7ZQRvOPmG8NDQYK4BpgeizGtvhZbB2m3I2/V3CkQ6QrjypnwPXH5UQyEbta363sk45ewdmxE4szo2/9aZ+yy+DcOwAXSQjYWb+G05RfT/u+EOZ9XRLMBx9LLWDGOgpECit/taO8NzgjmgsojnRDjKqSxsEvW0RQpikwIvl6DPNBxs2Mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3173.jpnprd01.prod.outlook.com (52.134.254.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 06:30:52 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 06:30:52 +0000
From: Biju Das <biju.das@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH 0/4] Add RZ/G2N DU support
Thread-Topic: [PATCH 0/4] Add RZ/G2N DU support
Thread-Index: AQHVd2+b221ppzOaWUan7Z4AmDDfRadKC0Jg
Date: Fri, 4 Oct 2019 06:30:52 +0000
Message-ID: <OSBPR01MB2103458EC171151BF8C05D9FB89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b8026d1-0936-42d2-94c7-08d74894679e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB3173:|OSBPR01MB3173:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB317341F1A60297A440C57224B89E0@OSBPR01MB3173.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(189003)(199004)(76116006)(76176011)(6436002)(305945005)(99286004)(107886003)(4744005)(74316002)(7736002)(3846002)(25786009)(7696005)(6116002)(66946007)(186003)(4326008)(66446008)(66476007)(9686003)(64756008)(7416002)(66556008)(6246003)(6506007)(55016002)(26005)(6306002)(8936002)(256004)(81156014)(81166006)(33656002)(316002)(8676002)(966005)(54906003)(102836004)(110136005)(14454004)(86362001)(52536014)(44832011)(2906002)(476003)(71200400001)(66066001)(486006)(11346002)(446003)(229853002)(5660300002)(71190400001)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB3173;
 H:OSBPR01MB2103.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HOAkVhSGB373x6VXJOFssZs/t4YgISXSO3W5q2VNGqvepK4oxJB9i002kz57vW2hlI8Mm0mRN5cHjWvYd4+2SaMQAEsGoa/hfilPCcHd8hbfskoVjlQ5l4RePrvKc4LtOdj5KAaZW/7JR5OnqV9oRXN/pa0JKbMSG+Ssnu4PJLv0k8Dh+VvPbGMZ1ut6htIDFxqfdJDSKgUDlkG37DFQpWisEiXYibHWdh865nMlW/xHUjx6M+zelJnH/IgCUJ9dcXyxakOTg9tENKUIwxkSHmwluzmMBtslHp1XHlUsJwnUWzcnwSxZVDuAZM7FNX5lfehwuDXDUilF0QDfovEHcOzV91mXCzPBYUfLmgeetBatN3XD6GOodkqsOti4Vyqmu1xU830zS2DsApmUnAYjnkGpLJboLJ1mmJ8Q7dSt5qivu61OPjRO3d0IwNhGyTCotpQDCcYe/q0pciHyVI49cQ==
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8026d1-0936-42d2-94c7-08d74894679e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 06:30:52.5091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XbDbHgTVqGRlONVsXXgEE/0Jpu6eToUTyXvHRLiK+15HkdAmVGt/liNAj/cwdiDA8D0QD+Dl4Ps7KEh5GcV5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3173
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dh4u9mgJakKb9+E0/cX6cv/0Z/fwV9+ct0rIN9H9Hjc=;
 b=Dg7LKCMedUDlWicor0mJwNulpuEW/OL2JTHoKnC4V4eb9qjt45KXnTMCzQL8soYHgs1R39KG8agCCZENlrQleADMtybmNSDs2vehxqvK2/6fo3kLgNTftgU67ArTW2BYnK+vkaOkI7WEUQbKW9DAxiQf9e9Dj91YtRqzYgGMS9c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCkFyZSB5b3UgaGFwcHkgd2l0aCB0aGlzIHBhdGNoPyBQbGVhc2UgbGV0IG1l
IGtub3cuCgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNh
cy1zb2MvbGlzdC8/c2VyaWVzPTE4MDI3MQoKcmVnYXJkcywKQmlqdQoKPiBTdWJqZWN0OiBbUEFU
Q0ggMC80XSBBZGQgUlovRzJOIERVIHN1cHBvcnQKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1z
IHRvIGFkZCBiaW5kaW5nL2RyaXZlciBzdXBwb3J0IGZvciBSOEE3NzRCMShhLmsuYQo+IFJaL0cy
TikgRFUgKHdoaWNoIGlzIHZlcnkgc2ltaWxhciB0byB0aGUgUjhBNzc5NjUgRFUpOyBpdCBoYXMg
b25lIFJHQgo+IG91dHB1dCwgb25lIExWRFMgb3V0cHV0IGFuZCBvbmUgSERNSSBvdXRwdXQuCj4g
Cj4gQmlqdSBEYXMgKDQpOgo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6IGR1OiBE
b2N1bWVudCB0aGUgcjhhNzc0YjEgYmluZGluZ3MKPiAgIGRybTogcmNhci1kdTogQWRkIFI4QTc3
NEIxIHN1cHBvcnQKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBEb2N1
bWVudCByOGE3NzRiMSBiaW5kaW5ncwo+ICAgZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgcjhhNzc0
YjEgc3VwcG9ydAo+IAo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRz
LnR4dCAgICAgICB8ICAxICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5l
c2FzLGR1LnR4dCAgICAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2Rydi5jICAgICAgICAgICAgICB8IDMwCj4gKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAgICB8ICAxICsKPiAg
NCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4gCj4gLS0KPiAyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
