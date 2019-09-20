Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800BB8C02
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373E6F870;
	Fri, 20 Sep 2019 07:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810131.outbound.protection.outlook.com [40.107.81.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCA06E9DA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt1p7Ld5J5t8cWG6basDZfCpljg67dF6zUg/PJ9qDLJ9LL7RHELEJoqNyIBGLacAoPQ1k689tfFlJ8n5A5zrCpDqP86wYclifAB04P8wlNZ8wb8gLbjgu3ADIry5+xSTe5zIjHgOqfluIpmwciF7X63lqFz3oHHGZfS2XbA6MHjadfz9PjrZqmiQladJjwMiNrfHCbxmIQ6ALxL64hhuvsZlbsMDpN4i+guhXgrHVNqQqNs9Ojvug3/T1cLBdf/PLlg9fZuwDfqDHTro3I/AyP14OjFY6buZWAvpMdhMsGEF5JcNqVkN9nZMiSj6Ppew9jg0Y0mUESgwf5sY+ygI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZbyxqoDfsSEBJm/62GjTKW3U/CyBbHQyU77+ew/xPs=;
 b=VpFIeBKvIlNuo9cXUyXDzpqdJ78vnYdLpsTyfwapghhsbuoN3944lp3J7INbo+9GL1QkjLEgPF+Y7m/VX9rsG/7ZgSS9zu95yhOAMxYxOWwSdzpVCh6jSBYdTKsY8FyMXbhn3x7haFcCX2z6JyEu/Y54MlTP89y9qSoK1upV629pFl6FaAJ8gaJEpnMz3GkpE1SdG6PGJmagUJGG7pt/b7ykEas4KamULSzIzSXxkxQ42gMA9d6GqaRPkaSYq8YyzXFFVBFad4JXDdWm6hrg3jlD5NBsFs4JkDwkOoC8fF44VYGOtU6sh0lZ3PXdYbGgX/6duRnf8YXpBtButC30Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB5855.namprd04.prod.outlook.com (20.179.23.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Fri, 20 Sep 2019 06:05:03 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd%6]) with mapi id 15.20.2284.009; Fri, 20 Sep 2019
 06:05:03 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVb3lXQwBziOXQuEKo5Zf6i7JBmw==
Date: Fri, 20 Sep 2019 06:05:03 +0000
Message-ID: <606dba07640f0c9aba930e1dfb5d6a797f393ecc.1568957789.git.xji@analogixsemi.com>
References: <cover.1568957788.git.xji@analogixsemi.com>
In-Reply-To: <cover.1568957788.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b51af266-fc3d-4176-a053-08d73d907a05
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5855; 
x-ms-traffictypediagnostic: MN2PR04MB5855:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB5855731FEFE606F8AC828775C7880@MN2PR04MB5855.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(396003)(39850400004)(346002)(189003)(199004)(6306002)(7416002)(6512007)(14454004)(81156014)(81166006)(316002)(86362001)(6436002)(25786009)(4326008)(2906002)(8936002)(6116002)(6486002)(3846002)(478600001)(305945005)(7736002)(8676002)(52116002)(486006)(54906003)(66476007)(26005)(186003)(66066001)(66556008)(66446008)(107886003)(256004)(2501003)(5660300002)(66946007)(64756008)(71200400001)(36756003)(71190400001)(11346002)(446003)(102836004)(6506007)(386003)(2616005)(476003)(76176011)(118296001)(110136005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5855;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +UYZd0uEkaKtb+Xws0YpNL608GazaWWAetAu5sKsNtnEbN79AQbkT6T16W6S5ALP/QAK9uUKsqmfmubWITcX5AqlndsGhQSCgFE85l5PbemQf2kvhm40MEFnA7qPo9UY+Fuamfe3IlhB1WRATfM0mvbDf2ZyFyGfJY3OolfnWRnyNK/ANWwVez+pHnpeh4pC34Mhcabxk+J6WshI8SRt4iIB075lY6DQ+D6B8CBu2u5v9TTxd3mohkeiiHJC+AGEhky2eggv3xZ9Ch/3wGoFAa/7JUyGjQunAhQDDcTd0r7X6S7McXVpruJD/LpVIvXr/umQ2OCvdxvrZiVovxWqgGupmvPTke7ubKrnvT9gyzoOjax0+G9VSkXaXTtvyMIcqnRRglWPS2MBeDuq0foWJrrLj94lGU7mYQtIkPdjvv8=
Content-ID: <FA40A5B2F8942640838DA5B7DDDD766E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51af266-fc3d-4176-a053-08d73d907a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 06:05:03.0107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3jdEM7py+7IN3uuxbVqG9isuJyx1m3gUeA78xNYNQA6wfi8+a5bAAYxseWyuwnLYr9/VJIquk5R6uyzvSZlUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5855
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZbyxqoDfsSEBJm/62GjTKW3U/CyBbHQyU77+ew/xPs=;
 b=EtIJAv54pHfZ/B150xnB1xGho0a3i8tWSkv0y2vyKxO30toQWV717pZBJWxKkCizizBSDoT76MdRLrooemjxAIFq2WCmIyAgNrTfL3nB7SaLwjKdcjF15dVLe5J+7tomAuFxGG8spjmqAfJNFJR54xqaC0YxL/xC359lZZcUy2U=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRl
ciBkZXNpZ25lZApmb3IgcG9ydGFibGUgZGV2aWNlLiBJdCBjb252ZXJ0cyBNSVBJIHRvIERpc3Bs
YXlQb3J0IDEuMyA0Sy4KCllvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBib2FyZCB3aXRoIGJp
bmRpbmcuCgpFeGFtcGxlOgoJYW54X2JyaWRnZTogYW54NzYyNUA1OCB7CgkJY29tcGF0aWJsZSA9
ICJhbmFsb2dpeCxhbng3NjI1IjsKCQlyZWcgPSA8MHg1OD47CgkJbG93LXBvd2VyLW1vZGUgPSA8
MT47CgkJZHNpLXN1cHBvcnRlZCA9IDwxPjsKCQlkc2ktY2hhbm5lbC1pZCA9IDwxPjsKCQlkc2kt
bGFuZXMtbnVtID0gPDQ+OwoJCWludGVybmFsLXBhbm5lbC1zdXBwb3J0ZWQgPSA8MT47CgkJcG9u
LWdwaW9zID0gPCZncGlvMCA0NSBHUElPX0FDVElWRV9MT1c+OwoJCXJlc2V0LWdwaW9zID0gPCZn
cGlvMCA3MyBHUElPX0FDVElWRV9MT1c+OwoJCXN0YXR1cyA9ICJva2F5IjsKCQlwb3J0IHsKCQkJ
YW54NzYyNV8xX2luOiBlbmRwb2ludCB7CgkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfZHNp
X2JyaWRnZV8xPjsKCQkJfTsKCQl9OwoJfTsKClNpZ25lZC1vZmYtYnk6IFhpbiBKaSA8eGppQGFu
YWxvZ2l4c2VtaS5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUu
eWFtbCAgICAgICAgICAgfCA4NCArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgODQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYy
NS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2FueDc2MjUueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi45NWZlMThi
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbApAQCAtMCwwICsxLDg0IEBACisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCisjIENvcHlyaWdodCAyMDE5
IEFuYWxvZ2l4IFNlbWljb25kdWN0b3IsIEluYy4KKyVZQU1MIDEuMgorLS0tCiskaWQ6ICJodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwjIgor
JHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyIK
KwordGl0bGU6IEFuYWxvZ2l4IEFOWDc2MjUgU2xpbVBvcnQgKDRLIE1vYmlsZSBIRCBUcmFuc21p
dHRlcikKKworbWFpbnRhaW5lcnM6CisgIC0gWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4K
KworZGVzY3JpcHRpb246IHwKKyAgVGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRL
IE1vYmlsZSBIRCBUcmFuc21pdHRlcgorICBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlcy4K
KworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAgIC0gY29uc3Q6
IGFuYWxvZ2l4LGFueDc2MjUKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBsb3ctcG93
ZXItZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IExvdyBwb3dlciBtb2RlIHN1cHBvcnQgZmVhdHVy
ZQorICAgIG1heEl0ZW1zOiAxCisKKyAgaHBkLWdwaW9zOgorICAgIGRlc2NyaXB0aW9uOiB1c2Vk
IGZvciBIUEQgaW50ZXJydXB0CisgICAgbWF4SXRlbXM6IDEKKworICBwb24tZ3Bpb3M6CisgICAg
ZGVzY3JpcHRpb246IHVzZWQgZm9yIHBvd2VyIG9uIGNoaXAgY29udHJvbAorICAgIG1heEl0ZW1z
OiAxCisKKyAgcmVzZXQtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHJlc2V0IGNo
aXAgY29udHJvbAorICAgIG1heEl0ZW1zOiAxCisKKyAgZXh0Y29uLXN1cHBvcnRlZDoKKyAgICBk
ZXNjcmlwdGlvbjogZXh0ZXJuYWwgY29ubmVjdG9yIGludGVyZmFjZSBzdXBwb3J0IGZsYWcKKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKworICBpbnRl
cm5hbC1wYW5uZWwtc3VwcG9ydGVkOgorICAgIGRlc2NyaXB0aW9uOiBpbmRpY2F0ZSBkb2VzIGlu
dGVybmFsIHBhbm5lbCBleGlzdCBvciBub3QKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKKworICBkc2ktc3VwcG9ydGVkOgorICAgIGRlc2NyaXB0aW9u
OiBzdXBwb3J0IE1JUEkgRFNJIG9yIERQSQorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMgorCisgIGRzaS1jaGFubmVsLWlkOgorICAgIGRlc2NyaXB0aW9u
OiBkc2kgY2hhbm5lbCBpbmRleAorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMgorCisgIGRzaS1sYW5lcy1udW06CisgICAgZGVzY3JpcHRpb246IGRzaSBs
YW5lcyB1c2VkIG51bQorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQzMgorCisgIHBvcnRAMDoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBkZXNjcmlwdGlvbjoK
KyAgICAgIEEgcG9ydCBub2RlIHBvaW50aW5nIHRvIE1JUEkgRFNJIGhvc3QgcG9ydCBub2RlLgor
CityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gZHNpLWNoYW5uZWwtaWQK
KyAgLSBkc2ktbGFuZXMtbnVtCisgIC0gcG9ydEAwCisKK2V4YW1wbGU6CisgIC0gfAorICAgIGFu
eF9icmlkZ2U6IGFueDc2MjVANTggeworICAgICAgICBjb21wYXRpYmxlID0gImFuYWxvZ2l4LGFu
eDc2MjUiOworICAgICAgICByZWcgPSA8MHg1OD47CisgICAgICAgIGxvdy1wb3dlci1ncGlvcyA9
IDwwPjsKKyAgICAgICAgZHNpLXN1cHBvcnRlZCA9IDwxPjsKKyAgICAgICAgZHNpLWNoYW5uZWwt
aWQgPSA8MT47CisgICAgICAgIGRzaS1sYW5lcy1udW0gPSA8ND47CisgICAgICAgIGhwZC1ncGlv
cyA9IDwmZ3BpbzEgMTkgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKyAgICAgICAgc3RhdHVzID0gIm9r
YXkiOworICAgIH07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
