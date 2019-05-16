Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF61FF61
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 08:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55960891BF;
	Thu, 16 May 2019 06:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40069.outbound.protection.outlook.com [40.107.4.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4C4891BF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 06:13:06 +0000 (UTC)
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com (20.177.120.80) by
 DB7PR08MB3788.eurprd08.prod.outlook.com (20.178.84.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Thu, 16 May 2019 06:13:04 +0000
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6]) by DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6%5]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 06:13:04 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v1 0/2] drm/komeda: Enable color-encoding (YUV format) support
Thread-Topic: [PATCH v1 0/2] drm/komeda: Enable color-encoding (YUV format)
 support
Thread-Index: AQHVC65sP3yuCt81TECLI/puUBXUnw==
Date: Thu, 16 May 2019 06:13:04 +0000
Message-ID: <1557987170-24032-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0007.apcprd04.prod.outlook.com
 (2603:1096:202:2::17) To DB7PR08MB3530.eurprd08.prod.outlook.com
 (2603:10a6:10:49::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad6eeb6e-89b3-4831-ae4d-08d6d9c58e7b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR08MB3788; 
x-ms-traffictypediagnostic: DB7PR08MB3788:
x-ms-exchange-purlcount: 3
nodisclaimer: True
x-microsoft-antispam-prvs: <DB7PR08MB37885C868120ACBBE625CD2E9F0A0@DB7PR08MB3788.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(486006)(6512007)(6306002)(36756003)(8676002)(6436002)(26005)(81156014)(73956011)(66446008)(64756008)(66556008)(66476007)(81166006)(66946007)(7736002)(6636002)(186003)(305945005)(2616005)(6486002)(476003)(8936002)(50226002)(66066001)(478600001)(316002)(55236004)(25786009)(102836004)(2201001)(966005)(386003)(52116002)(71190400001)(86362001)(71200400001)(6506007)(3846002)(72206003)(2906002)(2501003)(68736007)(6116002)(14454004)(53936002)(4326008)(54906003)(5660300002)(256004)(14444005)(99286004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3788;
 H:DB7PR08MB3530.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AC1tuWaZ91YRoP0TgzaNOm2q7rkdku1y3ix6kSB0dfuBy/gZ3pcFpHyt067UroDBSHvLSfNzkDXO8esR3NZukGn48fAYLeMUZpHpYsRIth1MsmgA8seDjxLjlJgySG92kP5clFpIdhsOtM0Z8+ZqigNPZpkwaSL57B3GYt7imWA5R4zkwimFsle+i1Nr6Q44jmsRtbtIgIqOqcPLeErsIKEwVN3KdGbC0Sm4B2Pu+PtmpJ39lo+VlNLBMTzemM4swAGDNxvuEazJ3iztjXjWJB9RZfoLxVbu3TdH5gcMec5enhd96eA1BDL1R7xhUGIXzly4PiYF3707o3uvZ86y87BjXAHAdo/HgK2Drt4+nyFZlLDjdaIB272q3/SiS0+zAazfGiiG1BR1rwKcDLkmU/psmTSFCco6XNB9sj8m4j8=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6eeb6e-89b3-4831-ae4d-08d6d9c58e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 06:13:04.6595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3788
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdOW3Gg4dzp7/w+rKshKDCDQDZCd2FljqMhRbNlybig=;
 b=D7uhAQkzR1tO1w8Ig3p5Yx6QGn6XkEHl5JsdYYf6qM5NBeOFW4IWGbxRcW6+YRJgee/9O9e18CzayL3gdR9GMrvjEP2kcc009JZTYKmotKbBg4bi84dytSkyHjQkYvA2RGX3nDgyIi3SXvdoLexV62HxvYVhA9jERUuzwy2g6Sg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoaXMgc2VyaWUgYWltcyBhdDoNCi0gVXBkYXRpbmcgSFcgdXAtc2FtcGxpbmcgbWV0
aG9kIGFjY29yZGluZyB0byB0aGUgZm9ybWF0IHR5cGUuDQotIEFkZGluZyBjb2xvci1lbmNvZGlu
ZyBwcm9wZXJ0aWVzIGlmIGxheWVyIGNhbiBzdXBwb3J0IFlVViBmb3JtYXQsDQphbmQgdXBkYXRp
bmcgSFcgWVVWLVJHQiBtYXRyaXggc3RhdGUgYWNjb3JkaW5nIHRvIHRoZSBjb2xvci1lbmNvZGlu
Zw0KcHJvcGVydGllcy4NCg0KVGhpcyBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbjoNCi0gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODcxMC8NCi0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTAwMC8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTAwMi8NCg0KTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSAoMik6DQogIGRybS9rb21lZGE6IFVwZGF0ZSBIVyB1cC1zYW1wbGluZyBvbiBENzEN
CiAgZHJtL2tvbWVkYTogRW5hYmxlIGNvbG9yLWVuY29kaW5nIChZVVYgZm9ybWF0KSBzdXBwb3J0
DQoNCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlICAgICAgICB8
ICAxICsNCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YyB8IDM1ICsrKysrKysrKysrDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgfCA2NyArKysrKysrKysrKysrKysrKysrKysrDQogLi4uL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAxNyArKysrKysNCiBkcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jICB8IDEzICsrKysr
DQogNSBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5oDQoNCi0tIA0KMS45LjENCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
