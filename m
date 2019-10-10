Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD462D398B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4B06EBA3;
	Fri, 11 Oct 2019 06:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770125.outbound.protection.outlook.com [40.107.77.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30326EAE0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcVtowPkP7jwJJ5bqOm+J9nzzmQcX/KCdEB+rcpCgaftjUKGK6fuZtWS/8C0UeDk745suaSsDJDhwvQcVp+wjKe4SrXPTuT/DtoFQ0qa62r4fwocAx10S6KwvVgItetsAF8kyMNLbiePZuHwYcR9NVaX4nwUiVCCzTozLGrdKC/bYSjXZYLHiRTdFll2uuZCfrGWA/2+SrYl4TzvUd5W500Cbiy04dy/jh0ZD2dxm/36BX5bCRILJecicm5xzSx82c0E5wNBQWL3IZejwAin0ZQNOHFiY8YTY1pEfFsVx2732XYqHqk4PSphC/ml4bO34Npm0xul22Jro8Fogt4A1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrgTNskGg8ZuhmFhtCjGXkTrtLDGZr+OZQHgY6yQ/BY=;
 b=UzQh2Yprnxob11qgJyfhmfCA4Ysvx11nxXrj3qBhIGSXhvHeX2mB6iO3QDVTdjd5E/bGg9GZF2BlCCjsuexAouzq3/1dfCjEQ+Dm4qsxJls66adPz7QyCFvp33A1IpU8uvngMg+oPGlU2zwinceynLMuyffhG15bRyGJKbsMgRXJEOpM2Eq8ZWddOdIH0nMXE9brk+yB9aLOM69OJGh4Adu6Nwt5miC2Avbv1ncayWYBSJmAfkdZs3yQI9izaL7YMLJMYTj4DoDfvP5FIhffN+5Z37FboWHei8pVrnLUXsVrnwOv/syE3YlYp9JQ3TflMcp+PtdQmhQwU/+KkFAkOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB5374.namprd04.prod.outlook.com (20.178.6.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 10 Oct 2019 09:32:53 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 09:32:53 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVf02w0tar4Vo+gkmhei+cTfK0uQ==
Date: Thu, 10 Oct 2019 09:32:53 +0000
Message-ID: <75bb8a47d2c3c1f979c6d62158c21988b846e79b.1570699576.git.xji@analogixsemi.com>
References: <cover.1570699576.git.xji@analogixsemi.com>
In-Reply-To: <cover.1570699576.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::22) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a98796f1-9818-403c-f437-08d74d64d346
x-ms-traffictypediagnostic: SN6PR04MB5374:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB53746A930F2088112C8EB57FC7940@SN6PR04MB5374.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(99286004)(4326008)(71200400001)(71190400001)(6506007)(256004)(52116002)(386003)(76176011)(316002)(305945005)(2906002)(7736002)(186003)(102836004)(478600001)(25786009)(118296001)(26005)(14454004)(66066001)(8676002)(446003)(11346002)(86362001)(6436002)(5660300002)(8936002)(6306002)(2501003)(81166006)(81156014)(6512007)(486006)(54906003)(110136005)(7416002)(6116002)(3846002)(2616005)(6486002)(476003)(66556008)(66946007)(66476007)(107886003)(64756008)(66446008)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5374;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNKIk+ezn9/3Oq0wGijk9CdJElpYUOP9DKOfMMxD+12e/jpY2j1DZ+uCwdgjvIcVPI2YBEoFmkMpdmmqlNnPj3Odpb5CvNBr6HhMUEMfeMVuXPJrhx+Oo+j5yzHowFXsMw744UYzeDLpKEJ3KTN4DZehvgCQRBDmYieH3MXgy/kuntEbHNzlZ5LOBlroU4PGQH3oippssDEPxB3zSESK55IGChKCWvcoic8mdHA1FGzEcRC3xUc11ahE7zy8iIq5slkNc+3qgl1u6cM8xehNuAV6kupF2vVOQFWKMfyV0Fevv25egBvrraCHJWeWWePeekusQnzpgxmmNaH/zXEcXrneMEZWLRMSzlhnAtakFMHSTHGruyWRWHrkz0vCoymZoj//BAuO5BxB7cLg9UpRU7O1paVTX1TX9javd+Z9sZ5pjpMYTEIuaYJS/Ld8NJC40Paj0RXX4gBWFbUXl4inug==
Content-ID: <E8563689AB4F514E8864186E35B468E8@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98796f1-9818-403c-f437-08d74d64d346
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 09:32:53.6443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ttDePMQPlv/HbvZHwTUYZlKGjgabEC7gzxNUNyxB0emIBYp/EBr/jyjmOZX036t1346PuDi17nTfilsUObOug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5374
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrgTNskGg8ZuhmFhtCjGXkTrtLDGZr+OZQHgY6yQ/BY=;
 b=rEAgOEFUHoPvhEJ3NyR/nEy5N/dTH/EWRwBOuBH0oDbkNDJ598RcwLKtqWX3+R37y3T6C7G34dsgX1beFPv5jCRWa4tE1erGhHeFZX2z76DiAE5Gg/hRnUAqEbi5DhbXlCFmyf2E9L8lnUnK2Xtr9SrBBZqgyvh0NbiDC/vXA6c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRl
ciBkZXNpZ25lZApmb3IgcG9ydGFibGUgZGV2aWNlLiBJdCBjb252ZXJ0cyBNSVBJIHRvIERpc3Bs
YXlQb3J0IDEuMyA0Sy4KCllvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBib2FyZCB3aXRoIGJp
bmRpbmcuCgpFeGFtcGxlOgoJYW54NzYyNV9icmlkZ2U6IGVuY29kZXJANTggewoJCWNvbXBhdGli
bGUgPSAiYW5hbG9naXgsYW54NzYyNSI7CgkJcmVnID0gPDB4NTg+OwoJCXN0YXR1cyA9ICJva2F5
IjsKCQlwYW5lbC1mbGFncyA9IDwxPjsKCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSBHUElPX0FD
VElWRV9ISUdIPjsKCQlyZXNldC1ncGlvcyA9IDwmcGlvIDczIEdQSU9fQUNUSVZFX0hJR0g+OwoJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDA+OwoKCQlwb3J0QDAgewoJ
CSAgcmVnID0gPDA+OwoJCSAgYW54XzFfaW46IGVuZHBvaW50IHsKCQkgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZtaXBpX2RzaT47CgkJICB9OwoJCX07CgoJCXBvcnRAMyB7CgkJICByZWcgPSA8Mz47
CgkJICBhbnhfMV9vdXQ6IGVuZHBvaW50IHsKCQkgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5l
bF9pbj47CgkJICB9OwoJCX07Cgl9OwoKU2lnbmVkLW9mZi1ieTogWGluIEppIDx4amlAYW5hbG9n
aXhzZW1pLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1s
ICAgICAgICAgICB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbAoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54
NzYyNS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmZjODQ2ODMKLS0t
IC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvYW54NzYyNS55YW1sCkBAIC0wLDAgKzEsOTYgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKKyMgQ29weXJpZ2h0IDIwMTkgQW5h
bG9naXggU2VtaWNvbmR1Y3RvciwgSW5jLgorJVlBTUwgMS4yCistLS0KKyRpZDogImh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCMiCiskc2No
ZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgorCit0
aXRsZTogQW5hbG9naXggQU5YNzYyNSBTbGltUG9ydCAoNEsgTW9iaWxlIEhEIFRyYW5zbWl0dGVy
KQorCittYWludGFpbmVyczoKKyAgLSBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgorCitk
ZXNjcmlwdGlvbjogfAorICBUaGUgQU5YNzYyNSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgNEsgTW9i
aWxlIEhEIFRyYW5zbWl0dGVyCisgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLgorCitw
cm9wZXJ0aWVzOgorICAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCisgICIjc2l6ZS1jZWxscyI6IHRy
dWUKKworICBjb21wYXRpYmxlOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYW5hbG9naXgs
YW54NzYyNQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIHBhbmVsLWZsYWdzOgorICAg
IGRlc2NyaXB0aW9uOiBpbmRpY2F0ZSB0aGUgcGFuZWwgaXMgaW50ZXJuYWwgb3IgZXh0ZXJuYWwK
KyAgICBtYXhJdGVtczogMQorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDEKKworICBl
bmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHBvd2VyIG9uIGNoaXAgY29u
dHJvbCwgUE9XRVJfRU4gcGluIEQyLgorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXQtZ3Bpb3M6
CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHJlc2V0IGNoaXAgY29udHJvbCwgUkVTRVRfTiBw
aW4gQjcuCisgICAgbWF4SXRlbXM6IDEKKworICBwb3J0QDA6CisgICAgdHlwZTogb2JqZWN0Cisg
ICAgZGVzY3JpcHRpb246CisgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERTSSBo
b3N0IHBvcnQgbm9kZS4KKworICBwb3J0QDE6CisgICAgdHlwZTogb2JqZWN0CisgICAgZGVzY3Jp
cHRpb246CisgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERQSSBob3N0IHBvcnQg
bm9kZS4KKworICBwb3J0QDI6CisgICAgdHlwZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246Cisg
ICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBleHRlcm5hbCBjb25uZWN0b3IgcG9ydCBub2Rl
LgorCisgIHBvcnRAMzoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAg
IEEgcG9ydCBub2RlIHBvaW50aW5nIHRvIGVEUCBwb3J0IG5vZGUuCisKK3JlcXVpcmVkOgorICAt
ICIjYWRkcmVzcy1jZWxscyIKKyAgLSAiI3NpemUtY2VsbHMiCisgIC0gY29tcGF0aWJsZQorICAt
IHJlZworICAtIHBvcnRAMAorICAtIHBvcnRAMworCitleGFtcGxlOgorICAtIHwKKyAgICBhbng3
NjI1X2JyaWRnZTogZW5jb2RlckA1OCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgs
YW54NzYyNSI7CisgICAgICAgIHJlZyA9IDwweDU4PjsKKyAgICAgICAgc3RhdHVzID0gIm9rYXki
OworICAgICAgICBwYW5lbC1mbGFncyA9IDwxPjsKKyAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZw
aW8gNDUgR1BJT19BQ1RJVkVfSElHSD47CisgICAgICAgIHJlc2V0LWdwaW9zID0gPCZwaW8gNzMg
R1BJT19BQ1RJVkVfSElHSD47CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICBwb3J0QDAgeworICAgICAgICAgIHJlZyA9
IDwwPjsKKyAgICAgICAgICBhbnhfMV9pbjogZW5kcG9pbnQgeworICAgICAgICAgICAgcmVtb3Rl
LWVuZHBvaW50ID0gPCZtaXBpX2RzaT47CisgICAgICAgICAgfTsKKyAgICAgICAgfTsKKworICAg
ICAgICBwb3J0QDMgeworICAgICAgICAgIHJlZyA9IDwzPjsKKyAgICAgICAgICBhbnhfMV9vdXQ6
IGVuZHBvaW50IHsKKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW4+Owor
ICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
