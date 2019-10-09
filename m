Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DBD2121
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027876EA99;
	Thu, 10 Oct 2019 06:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690108.outbound.protection.outlook.com [40.107.69.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6396E949
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pd4CzFu/GmvKFTXoNKPsuJCB4WKUQoRkusqTBi7t5/DAP3zqwWVZn3eWuC+UXLjsrb5uTVWK5A2x5ldMZZF7k9/je2vlIDDJQdv98wwgZ5E6sMvr/CHgxOpQ+4Golpp0TSnYYfyQR1SxUnJ0CilfsPVSDn0cYD3Vn+jmyyX5Tyk8vVaJGY7BnVxeE6WyB9nWGslQ+m3bpGne0nWqNRewtplh1HRlvVBla+NIirEVkufnDEW1P8tzlha4SsWgwvML9iATlibgJS+A2o43eo4c6Z2ub+b86A3CcCoo2OsvuvyCuAhW3ZxociCtS0VTDfmcO3BaheTXsAaGgo+Hekf0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8tUA9PN3+q8T4MJJ0kraCUMeebvhUfsvzI0Hu1LZug=;
 b=HXkW1LxKaMOD4p6th/7mOxEPdgh4w8q1r8MFoy3g+moTXr7Wu7+LtPFUBFaiLNQuBJ3e+b4fIGMwwchTpGOem6rHsdHCtkIrtqzsX/2payzgc7zEONFgUHrM74lmybfXhVbI6rJTFVpu17/8ARnMDlISk1nOJQq0c/d6LobCQ4XTJ0j7toTt1BK1CCrt4mGaGIL9uDY5r31F9RGR1lCzlwo+SUMZ9ocKl5LwZD/eI5mIFdF8g6f3dUTUG7BAii37n0ZA1hpaA6Jfp7hjjC71WzQ10WCCiRR9Jri486gnLNfKZhalNb8hUrdXQLmaCQ6y8n9teN1jOgiLYlePTslcgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4189.namprd04.prod.outlook.com (52.135.71.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 09:27:07 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 09:27:07 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVfoO4ZRVMsEYORESrPx4IOG5NEQ==
Date: Wed, 9 Oct 2019 09:27:07 +0000
Message-ID: <82d9e3d505699da8f32069844b3cfe7c9fbfd0f1.1570588741.git.xji@analogixsemi.com>
References: <cover.1570588741.git.xji@analogixsemi.com>
In-Reply-To: <cover.1570588741.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:2e::35) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd23233-6faf-4e39-95e2-08d74c9ada74
x-ms-traffictypediagnostic: SN6PR04MB4189:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4189D1C521073916C1542E27C7950@SN6PR04MB4189.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39850400004)(346002)(396003)(136003)(199004)(189003)(478600001)(64756008)(66476007)(486006)(446003)(26005)(66946007)(66556008)(66446008)(2906002)(186003)(86362001)(11346002)(2616005)(476003)(52116002)(7736002)(66066001)(71200400001)(71190400001)(76176011)(99286004)(305945005)(54906003)(118296001)(6486002)(6436002)(6306002)(8676002)(25786009)(7416002)(81156014)(81166006)(8936002)(107886003)(6512007)(102836004)(14454004)(316002)(5660300002)(386003)(6506007)(110136005)(3846002)(4326008)(6116002)(36756003)(2501003)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4189;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6FI33n5Rwbg50xg9GcQDrYm/Su8yaMcXcI1fcwz0VvBleT+VeZuPn7JZu43knASjzi6DxWqYqvF4Vdc3HjH9aRyq2xQFfgb8vUZOULZXH8cDFV5iv2cSnOb4EL1aWZMyPQxRMdMk6557QxTIWi+6G3AHRcONBYKauIqYrl6X60NGZGFMM4Os5b2FmY0Ve9nW/FvuD2bb/Ba5OfqQR/oVwXzTfc3uRv8K47t6qll3f0h/kZbj5m/4X6gvAyn9nk++6VutnjQcV51sLWrLnfdQtawKbOdpJxOigGhAf/WEwMJyNiSOpko7MpEZ37VJhAp4s1SvnHcW0RMvX1BOnpwjUA1aiYBu+wSBtRpgGySx+cYq2iDRLyua2CimTkHSU/tSr6MWGiYcGoBiHD/SWKu4i+TICB530CEeIp8U8sZamELOL9tps9LxDMrZ9sCU28pueI0vu0O7MpyqSK714teaAQ==
Content-ID: <3F4D1B719F23EB478B5541F140A3EE1A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd23233-6faf-4e39-95e2-08d74c9ada74
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 09:27:07.2111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhtWbDgRj80oXyPBGZTUkrn94rnQYlP/3CsisHSXuG0gHnTpCy9vTC7u2Fmdn+cuYdvGs0Nqwo+zGElfUzjWYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4189
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8tUA9PN3+q8T4MJJ0kraCUMeebvhUfsvzI0Hu1LZug=;
 b=tDOPphOtJVU2vdhhADv+dGOVsg3MUG64lawGBbdBd+xBoUjhDmiSoE8hmvJv9vQhwemsKZZZeN4hlTaizjlZ/tO0HcPF3Je60jMO9LJg6GrOdPN/fB0UucwDvPD3PVoQg7PTwHamnboZ37TJICPT3Guv9Cx0cxBUDoVk4gsk7GU=
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
bmRpbmcuCgpFeGFtcGxlOgoJYW54X2JyaWRnZTogYW54NzYyNUA1OCB7CgkJY29tcGF0aWJsZSA9
ICJhbmFsb2dpeCxhbng3NjI1IjsKCQlyZWcgPSA8MHg1OD47CgkJZW5hYmxlLWdwaW9zID0gPCZn
cGlvMCA0NSBHUElPX0FDVElWRV9MT1c+OwoJCXJlc2V0LWdwaW9zID0gPCZncGlvMCA3MyBHUElP
X0FDVElWRV9MT1c+OwoJCXN0YXR1cyA9ICJva2F5IjsKCQlwb3J0QDAgewoJCQlyZWcgPSA8MD47
CgkJCWFueDc2MjVfMV9pbjogZW5kcG9pbnQgewoJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBp
X2RzaV9icmlkZ2VfMT47CgkJCX07CgkJfTsKCX07CgpTaWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhq
aUBhbmFsb2dpeHNlbWkuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3
NjI1LnlhbWwgICAgICAgICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDc5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2Fu
eDc2MjUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9hbng3NjI1LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMGVm
NjI3MQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKQEAgLTAsMCArMSw3OSBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorIyBDb3B5cmlnaHQg
MjAxOSBBbmFsb2dpeCBTZW1pY29uZHVjdG9yLCBJbmMuCislWUFNTCAxLjIKKy0tLQorJGlkOiAi
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1s
IyIKKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMiCisKK3RpdGxlOiBBbmFsb2dpeCBBTlg3NjI1IFNsaW1Qb3J0ICg0SyBNb2JpbGUgSEQgVHJh
bnNtaXR0ZXIpCisKK21haW50YWluZXJzOgorICAtIFhpbiBKaSA8eGppQGFuYWxvZ2l4c2VtaS5j
b20+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBBTlg3NjI1IGlzIGFuIHVsdHJhLWxvdyBwb3dl
ciA0SyBNb2JpbGUgSEQgVHJhbnNtaXR0ZXIKKyAgZGVzaWduZWQgZm9yIHBvcnRhYmxlIGRldmlj
ZXMuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIGNv
bnN0OiBhbmFsb2dpeCxhbng3NjI1CisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaHBk
LWdwaW9zOgorICAgIGRlc2NyaXB0aW9uOiB1c2VkIGZvciBIUEQgaW50ZXJydXB0CisgICAgbWF4
SXRlbXM6IDEKKworICBlbmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHBv
d2VyIG9uIGNoaXAgY29udHJvbAorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXQtZ3Bpb3M6Cisg
ICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHJlc2V0IGNoaXAgY29udHJvbAorICAgIG1heEl0ZW1z
OiAxCisKKyAgcG9ydEAwOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAg
ICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBEU0kgaG9zdCBwb3J0IG5vZGUuCisKKyAg
cG9ydEAxOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0
IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBEUEkgaG9zdCBwb3J0IG5vZGUuCisKKyAgcG9ydEAyOgor
ICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0IG5vZGUgcG9p
bnRpbmcgdG8gZXh0ZXJuYWwgY29ubmVjdG9yIHBvcnQgbm9kZS4KKworICBwb3J0QDM6CisgICAg
dHlwZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246CisgICAgICBBIHBvcnQgbm9kZSBwb2ludGlu
ZyB0byBpbnRlcm5hbCBwYW5lbCBwb3J0IG5vZGUuCisKKyAgcG9ydEA0OgorICAgIHR5cGU6IG9i
amVjdAorICAgIGRlc2NyaXB0aW9uOgorICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gbm9y
bWFsIGVEUCBwb3J0IG5vZGUuCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcK
KyAgLSBwb3J0QDAgfCBwb3J0QDEKKworZXhhbXBsZToKKyAgLSB8CisgICAgYW54X2JyaWRnZTog
YW54NzYyNUA1OCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzYyNSI7Cisg
ICAgICAgIHJlZyA9IDwweDU4PjsKKyAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICBw
b3J0QDAgeworICAgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgICBhbng3NjI1XzFfaW46IGVu
ZHBvaW50IHsKKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9kc2lfYnJpZGdl
XzE+OworICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
