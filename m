Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A8BB511
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B2589CF6;
	Mon, 23 Sep 2019 13:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680114.outbound.protection.outlook.com [40.107.68.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BEF6E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7OiEdVAj/Ah2hnl1WBRI1LXuTYa4CiK9l+deS8mzVd1Pi+8PjOutsEUgQjmCRVBa1jktLjj4VsuBiewpkUMjT8ob5U8EcD7j/SMVVvQt7WBJ4WAK52I9CgdEnN+DFgXWvUBSSykKBPDKpGIzq+ZLbsbQWaAHopTYI6B/9LpjadFqOpP/MIMohqL9UPxr6M4E84hXnvZsfCqEZJvhtFDNxT27SwRzZbEvUiYdBUch2dw8DBg8rgh2OZRZFn5xiU/5k0p47okRt3mYmJ1ZNkdgjhL945mVY0wI842RJdSeeha5ERujt41V4zL7M1tRSDNPR+SA+xLlAs6qzrBC29VfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV0ml3WFUXu0uS2X/imI1vPjeOu2HMIMPSA8SnDvzjg=;
 b=Pm1Iv/Wh5EHOhNk7JI9Sq8lfVmmFqc/Vpw6Uh8c/txKVWXvg+Gi7xrTBZ5oQGRBErxObhWlzhi9gpKlgcT0uwbv+1iiaU1pTD/0+kOjNRSIdNMZGfYLYpy+WJWrxefqkQO8m4TUQbOnVDv0AmMFiFJLPwiuiNqMiYZc2i7iqRFJWQBV+by5ArFUYg8yoI22FNFc2+LvjpIXgdSXAZGI3VjaVVbxFQfa0LOnCaCSuxmZQyDGHZUAeuBfgskpAIffr3Puhi9rsoWW7B97bJzNHP1bOswtJ19G/g/GKLj612Smhr6rzzTxQin94vDcviBl3XC/PaIjQyRIz0SchYEdcFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB6079.namprd04.prod.outlook.com (20.178.247.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Mon, 23 Sep 2019 09:06:09 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd%6]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:06:09 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v1 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v1 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVce4jZalL2j3UqU21V4teaUNI/A==
Date: Mon, 23 Sep 2019 09:06:08 +0000
Message-ID: <cover.1569229197.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::21) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5ccc297-ef6c-4c4a-a2a6-08d7400545e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB6079; 
x-ms-traffictypediagnostic: MN2PR04MB6079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB607980494501E8A5ABE1C4DFC7850@MN2PR04MB6079.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(346002)(136003)(396003)(376002)(366004)(189003)(199004)(53754006)(478600001)(66066001)(52116002)(26005)(6506007)(486006)(386003)(476003)(2616005)(71200400001)(2906002)(186003)(71190400001)(102836004)(256004)(14444005)(6116002)(86362001)(4744005)(316002)(2501003)(99286004)(14454004)(5660300002)(7416002)(6436002)(107886003)(66476007)(7736002)(305945005)(54906003)(3846002)(66556008)(64756008)(66446008)(8676002)(25786009)(81166006)(110136005)(36756003)(6512007)(66946007)(8936002)(81156014)(4326008)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6079;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /bnwyN9I4U0LrmdCh75NG3lFHiorpsQeinkCtlr85NpbRvNSsMfjGVL7Ia3WOqb8KqPUPOxtNJNuGNKy1Y/+fN2ZVTbDAEvaqIU3N2nRiY6bVZ0CWH0Uzl1GvoegkoDBKF9ecwY6Ma4p33CDX4pnTC2beKD5bPiO0YBcsBf+bdbmZBaxKs3RIbhRv5VIwJr+esZYhuSofJXsmDE5LMbMrMlpgT182bHMrq6b4jEiI6sSEXPukK1Hp8nU3KQ6FXvR06jbmMguFDZ94bV7bQ88sSLBDqICwG/WsaevOxNewBJx/06pAhRvy1gzirz3kHkDaJcw1UZlF3T07RXPpjJaWU4ww4yeJkw/DT8SGt85qAHRLB2vw/ttceyzbii8eHiE3/H6DDIolu9TMkMnF25LxctlZQKloUVtTtyp6lR6po4=
Content-ID: <E0035C45673DBC429FCFC9688CFF8FB5@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ccc297-ef6c-4c4a-a2a6-08d7400545e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:06:08.9777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFOw84XfZGbt4MdTjkXhjN4TI/3PcQlk0KpadEg19+sRaqihnftJIGv+b1hKpE/2N3CWF5vXeSZGM8DO0eORug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6079
X-Mailman-Approved-At: Mon, 23 Sep 2019 13:17:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV0ml3WFUXu0uS2X/imI1vPjeOu2HMIMPSA8SnDvzjg=;
 b=DNKcqyHY/LqJrK4+KsylpWTCM8/rp69AOTIzrQ/MZZMg6pBMjxePHz3IZe4FuZtw0aNdluUOaT8yt1btyjxtfRXSVCJmOSgupgbQfIkySfQyw16hrH7wmG6sibK6X/c7xJPQqVZHDPuItffBEPsvgPZZczl32HcTycv0i6sDEqk=
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

SGkgYWxsLAoKVGhlIGZvbGxvd2luZyBzZXJpZXMgYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhl
IFNsaW1wb3J0IEFOWDc2MjUgdHJhbnNtaXR0ZXIsIGEKdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQg
NEsgTUlQSSB0byBEUCB0cmFuc21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlLgoK
VGhpcyBpcyB0aGUgZmlyc3QgdmVyc2lvbiB1cGxvYWQsIGFueSBtaXN0YWtlcywgcGxlYXNlIGxl
dCBtZSBrbm93LCBJIHdpbGwgZml4Cml0IGluIHRoZSBuZXh0IHNlcmllcy4KClRoYW5rcywKWGlu
CgoKWGluIEppICgyKToKICBkdC1iaW5kaW5nczogZHJtL2JyaWRnZTogYW54NzYyNTogTUlQSSB0
byBEUCB0cmFuc21pdHRlciBiaW5kaW5nCiAgZHJtL2JyaWRnZTogYW54NzYyNTogQWRkIGFueDc2
MjUgTUlQSSBEU0kvRFBJIHRvIERQIGJyaWRnZSBkcml2ZXIKCiAuLi4vYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvYW54NzYyNS55YW1sICAgICAgICAgICB8ICAgODQgKwogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgICAgICAgICAgICB8ICAgIDYgKwogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9NYWtlZmlsZSAgICAgICAgICAgfCAgICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jICAgICAgICAgIHwgMjExMCAr
KysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3
NjI1LmggICAgICAgICAgfCAgNDA1ICsrKysKIDYgZmlsZXMgY2hhbmdlZCwgMjYwNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmgK
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
