Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B60FC114
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB646E22E;
	Thu, 14 Nov 2019 08:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-oln040092004010.outbound.protection.outlook.com [40.92.4.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3046E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mh8MAlFYTacQm5+ORksPmXxMY+5TzCYc32F3rGe50DiKi+eCvf3wEewv3YIVYveIYNzh/cePWv2En4cTH49C8y+HX1WKuVXZjoNueQQmY/2oKQmk67pnm93WjLGsG9y/AVP1PsmYglIg7zKp7yix374+6SSHyQYi21RwZtxzrUAI1WqBGQrHE3nVk8xDwVnEQwB1zIPGvapJodF5hcNl9W6UcIqmW/5CRFKExjMaNWLowP1SlgFp3PeUXA8Alh4zhQA/MAnPqikv8acPyZbMgpJjoDHwyyMj2+GPamDHLe0drr1xeDCpoUpfn+I2awuPF6P0u9skGYJ6JxlJygk15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN5KM83NGeGccwWSQX6mtbGp2aMV1Mc8qI63fYqAkac=;
 b=aVfPDjo/KA6BHBQg/aagqmi14sfDAaMGkVlHltys08u3GaQOf43yhBNAK+gxwnaCK0rcPML71AbzPLfkA1pgMDdOHsqsJgdpgvVedwPOKIpAnJ7h1BeIcRYokMC8v/azeV0jDkVqSvIMObtoQgZakL6UXhFDyalVFCa4bFL//r31F7zGrdc65Pf7BXjNR75bWHM2dFElnqGQLqaG9Xy/Vq3Yg/oPgtlcnXPk6b/qHiAB/+K4YH1lOztlTIpmqj1Q46JIpbUxTrXe8b92cNG/RMmh1j7JIqnq7JaeaMLuiGBPhpAmWCIGTVjML+xqEs18G7N88TgybaXWkJWikraUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (10.152.72.54) by SN1NAM02HT010.eop-nam02.prod.protection.outlook.com
 (10.152.72.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Wed, 13 Nov
 2019 13:27:25 +0000
Received: from MN2PR08MB5790.namprd08.prod.outlook.com (10.152.72.52) by
 SN1NAM02FT037.mail.protection.outlook.com (10.152.72.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Wed, 13 Nov 2019 13:27:25 +0000
Received: from MN2PR08MB5790.namprd08.prod.outlook.com
 ([fe80::85cd:bb91:76fb:d02]) by MN2PR08MB5790.namprd08.prod.outlook.com
 ([fe80::85cd:bb91:76fb:d02%7]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 13:27:25 +0000
From: Tian Yunhao <t123yh@outlook.com>
Subject: [PATCH] drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.
Thread-Topic: [PATCH] drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.
Thread-Index: AQHVmiYWqxGkz4TNPEmj0K/5QKzS7Q==
Date: Wed, 13 Nov 2019 13:27:25 +0000
Message-ID: <MN2PR08MB57905AD8A00C08DA219377C989760@MN2PR08MB5790.namprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To MN2PR08MB5790.namprd08.prod.outlook.com
 (2603:10b6:208:110::11)
x-incomingtopheadermarker: OriginalChecksum:92B84D7270789A620E93BB66452BCF808367EC9B97D0F0F2F3DD1C9CE753F1C9;
 UpperCasedChecksum:FA771C74AC3788796078C1F516131242D61E05C18FB374D08320E979D64AB0C3;
 SizeAsReceived:7604; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-tmn: [yJzxOhn4bXw+IFFGmUdu2jQ942kKM1GOwMOlDZykNu1P0thFPMq/QCz7PUgQqRgh]
x-microsoft-original-message-id: <20191113132702.26218-1-t123yh@outlook.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d3812f3f-bcd4-4d14-f550-08d7683d38a5
x-ms-exchange-slblob-mailprops: CaK+F7me6ClxJoM+FkHQMl3uLp5JzPLhxS1g0sbuVNMlDS1TzqIBJ0/PyMt7rR0/VSO32ytthbLxnWK690HZsukjW096Hz6fwTPwsAJil1C30ZqHoC29bTH5fqYHoUlH6+Me1xqs1GnnRzpllvIfrKx9cbt39906ToIVnMcBmDGYgFpduHTAixLrys8lFDFzv4qhQKhm0mPf6+4tvimuoqH53iVVp7oZcUvo1Jq7LbsuVA/i79XrqUs3y8T5gz5UG8CsgfKBHyAkfJt0xHpo80GrSeiNsO/9ou0rImShYwMlYKjYD198HUrVT19lBPYyzXEEwnyp8ie8WC98k4rtJsUVDH+Y4KPDDqUwIljnIv/LMc+CR0jzHhDcAj2I5a5apGG6yPj7C7fqNxzrrnA1qSsUdFom1QwaR9B6vVhai17NSgXgiV72lOvT/cYaDveb4noZ3871q2GCaOe7tWG987VT2plwZFhisnQrPRQnjaQRrCL7kgNxBVbgh/RAxVDCfA3Nd6dvNa+3egigVMNpHeAaTYU+NFnBfuutnv4C8LxKyQZKwEr35zFmoXW7DkqXLVk45vumL/h9Rh+gi7fbl1FmLnDbr2fcblmE9LCPeN/IO9FPadFu5jJtqhBIzR6ixmNDXeOvolwJzwev0IjOoZ8zhKGZOdagNVmU97petgVA6lyfUtgqp3Rsjqte7L+9hVOKqQInu5Hw7DrMcPMAKz6PmLo71Nyl3OOHCmb9YM0P6SP1ZerIBA==
x-ms-traffictypediagnostic: SN1NAM02HT010:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hPplGUv3tqZO+QzfgRLjBlsH1k2LR1jvOUsYjYQEaT0qBk6IfakGnfXHieYfXJgBAMUE7xdqtuUqHlzTjccxynQ6ULz8t+V5n6nEDUfBBp0ivwHR83xluZcRJhKRXHTsoPalN3N1qKf6m8IpVaKDdY76SHCDpUJPSpPlgP/Vxfr3/w9lCj8AnhSlnzpogJDZ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d3812f3f-bcd4-4d14-f550-08d7683d38a5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 13:27:25.5834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT010
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN5KM83NGeGccwWSQX6mtbGp2aMV1Mc8qI63fYqAkac=;
 b=b9cG48c3xb/JRSwj1TDsT0LDbqFvwRZrGc7ScsUD8QNPfRqSN0v8qw6N5dFs8IIeLS2fuRd0Ck6NxnBa/zgPJYjrEV74b8Vscl45kzUwSXUVnbQeD701AoE5TP2l/euy33iof5REHj6X3owTkf9N7SdvxiIxq10x46lId47LtiaNSRrIuJG6nc3GL2KK5h91a7TaZyKTLBw7wVahgE151bx+r2x8Px+t86kI+blOICI/bfUm7K8DhO9WkzEwEXI6zLWo4igcr1c30uB9Ny/iLt4ydo2NB34FEdlDDxX6v1QNKCYmyq9OSPa5wIN17ETt55LvG4nD5LAEv3OeJM8bFQ==
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
Cc: Tian Yunhao <t123yh@outlook.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRhdGFzaGVldCBvZiBWM3MgKGFuZCB2YXJpb3VzIG90aGVyIGNoaXBzKSB3cm90ZQp0aGF0
IFRDT04wX0RDTEtfRElWIGNhbiBiZSA+PSAxIGlmIG9ubHkgZGNsayBpcyB1c2VkLAphbmQgbXVz
dCA+PSA2IGlmIGRjbGsxIG9yIGRjbGsyIGlzIHVzZWQuIEFzIGN1cnJlbnRseQpuZWl0aGVyIGRj
bGsxIG5vciBkY2xrMiBpcyB1c2VkIChubyB3cml0ZXMgdG8gdGhlc2UKYml0cyksIGxldCdzIHNl
dCBtaW5pbWFsIGRpdmlzaW9uIHRvIDEuCgpJZiB0aGlzIG1pbmltYWwgZGl2aXNpb24gaXMgNiwg
c29tZSBjb21tb24gZG90IGNsb2NrCmZyZXF1ZW5jaWVzIGNhbid0IGJlIHByb2R1Y2VkIChlLmcu
IDMwTUh6IHdpbGwgbm90IGJlCnBvc3NpYmxlIGFuZCB3aWxsIGZhbGxiYWNrIHRvIDI1TUh6KSwg
d2hpY2ggaXMKb2J2aW91c2x5IG5vdCBhbiBleHBlY3RlZCBiZWhhdmlvdXIuCgpTaWduZWQtb2Zm
LWJ5OiBZdW5oYW8gVGlhbiA8dDEyM3loQG91dGxvb2suY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW40aV90Y29uLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfdGNvbi5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRleCAwNGM3
MjFkMGQzYjkuLmI4OTQzOWVkMjEwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX3Rjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBA
IC00ODgsNyArNDg4LDcgQEAgc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRfcmdiKHN0
cnVjdCBzdW40aV90Y29uICp0Y29uLAogCiAJV0FSTl9PTighdGNvbi0+cXVpcmtzLT5oYXNfY2hh
bm5lbF8wKTsKIAotCXRjb24tPmRjbGtfbWluX2RpdiA9IDY7CisJdGNvbi0+ZGNsa19taW5fZGl2
ID0gMTsKIAl0Y29uLT5kY2xrX21heF9kaXYgPSAxMjc7CiAJc3VuNGlfdGNvbjBfbW9kZV9zZXRf
Y29tbW9uKHRjb24sIG1vZGUpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
