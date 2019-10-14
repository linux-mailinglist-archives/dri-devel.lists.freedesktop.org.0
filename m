Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D2D5D0C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89E66E130;
	Mon, 14 Oct 2019 08:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50064.outbound.protection.outlook.com [40.107.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299F6E130
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFaigwrMYoPlv6wmn9ArzBfArZNTpR9NZsN2S3A+HLOU7Df7Rpho4Cubpc68PArUPmlp8ZRpczCphJfAvI/fq6DxAm2TGrz5/VW27/uEctvwnQniEIXUBfe/BDdBSn59ltDQVPlRsSfI3dDx9/s6TTW9sqEttl8KzDOEDKedE3BptMEOTCYsEEWGZ79JBDBWyzZ4WYPigIdv/cSxqTO6SNPzzvNfcQJcF/gG7GHXesCt4BZhM8R9vUehBcXGPAHRAGXejtm3YtwUwGtpjorbfOh+WkYA9pjaOYVZqe8ieNFYjYCzx/rbU4NBuubmoAnMf1frs+RBFdwJmRn+5x8edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mghH0qUr+aorSqe0THnJLTPlSNTh3RUcYxaLM12aSqg=;
 b=ZZJkOTr+p/A2Mp5PzNMP1chgFQ2kzMort4oOlm9q59Po5SdMXyVuzzvxKVjlxPZKK8ejOCAa5C5w1HAwH/yvK4BkQBatNIUOUWb16rGFzlEnIfOel/3+32uCNFIh+cAmjFGEdy4LshEHMbEl2PYVVVJ91gny2xutXNP01k+QEjXmPyni4O3a4WE+hvqzYDB1q88/RfF4YgEx3h6vwc/bLTZDhoExHrXtE1GXOuU7gloSlQaMDNOvXhDHYDqcsdBuupfVVz8bFKA0dGaOU80PSzf4mxMQxXOaacJkbuId//8uzESwLxDMgTwg+dwZSB+m1pdnmV8PXP7yc0uqOtniOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB5951.eurprd04.prod.outlook.com (20.178.123.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 08:03:28 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::79d2:e4fd:999e:51d2]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::79d2:e4fd:999e:51d2%5]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 08:03:28 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: Re: [PATCH v2 4/5] dt-bindings: display: imx: add bindings for
 DCSS
Thread-Topic: Re: [PATCH v2 4/5] dt-bindings: display: imx: add bindings for
 DCSS
Thread-Index: AQHVgmXcD7fEdW9cjEycMUHo/JX/xA==
Date: Mon, 14 Oct 2019 08:03:28 +0000
Message-ID: <20191014080327.GB14065@fsr-ub1664-121>
References: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
 <1570025100-5634-5-git-send-email-laurentiu.palcu@nxp.com>
 <20191011145042.GA15680@bogus>
In-Reply-To: <20191011145042.GA15680@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d4f8dc8-13c3-4863-f606-08d7507cff54
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB5951:|VI1PR04MB5951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5951CB33C3E06507F2EFA00BFF900@VI1PR04MB5951.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(6916009)(7416002)(26005)(305945005)(486006)(44832011)(4326008)(316002)(99286004)(76176011)(7736002)(1076003)(54906003)(4744005)(5660300002)(25786009)(11346002)(476003)(2906002)(33656002)(446003)(6506007)(6116002)(3846002)(86362001)(186003)(102836004)(478600001)(256004)(91956017)(81156014)(66946007)(8676002)(81166006)(6512007)(14454004)(9686003)(71190400001)(71200400001)(6436002)(66556008)(66476007)(66446008)(64756008)(229853002)(33716001)(66066001)(6486002)(6246003)(8936002)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5951;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 96R1WNudbfmRGzJC1us6rdE+Rrzr34AJCNDKE1nyzby7agLzgIknfOzboUsgmDvgQW2h2anKnQvRHA44kNp3gyHVxzSZcktdWv9B1rbmo60lzB7661qnIjNl+78x5JvzxTmEJTAhgZIOcMy1Bp0NYxkdtC0A/ApVoqoV6cF6d8wE0gGd4uXLeQRh7voTY0qulkVFGaJNppuVzgrqN1Tbt8rtjJHuELvDu6dklIKpLQHzNJWw5W3kDo6k5o5dj08mgwOTg0Izq7SEzhpZfZDQns3QZ3UmGXzgs1NdiFubZPpsVCvWiVmKEExAxF1HIa6uAAZp/3TlZoFoIEgk1r9P0XTxC6ELAsA6wlAsySGwotcO3W8OHBBN/Q5YecQk2+UEbHBoSwpojK+EmtxS+H8Ve1qMgO4KqR7Q3gOVaZ1tyvg=
Content-ID: <3066FF801F56084A93888E509A157F7D@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4f8dc8-13c3-4863-f606-08d7507cff54
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:03:28.4140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIsxVCLvXl77z3Sf9FdPJg8coHy0fLA+0Z+H9EN6vOBWwlTQ5yuzf6WV0xywMFBZSyYoOGUABLjHyFWsUC3MMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5951
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mghH0qUr+aorSqe0THnJLTPlSNTh3RUcYxaLM12aSqg=;
 b=ei7q9Pw8+3BkU3lr+V0PB6WAdDZf4j2F/jWc/6gGYSAK1QVyKvo1Ktc8oVXETf3C31v/bYBORwlBJd0NvapxqfO2QkpCKn4iURRM83gy99IzcqjdhnlaNJG5rV4+0F379qJYR5LPKz1nP88qgLV+zaQaD0h0wdDxdqn7aSZoPGc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@nxp.com; 
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "agx@sigxcpu.org" <agx@sigxcpu.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwOTo1MDo0MkFNIC0wNTAwLCBSb2Ig
SGVycmluZyB3cm90ZToNCj4gOnU/d2M/P201P14/456+P300LT8/entiPz8/cj8rP9eAdT8/P9in
Pz8/PyMXPz8DPz9layA/Pz8/P1c/Sj8/Pz9ePyg/Pz9ofT8/LT8/entiPz8/cj9aPz8/Pys/alcu
PxpcP2/bindiPyA/dispPz8/P2x/PxpiPx8mPz8sPyY/P86+Pz8/Pz8/Pz8/Pz8/Pz8/P1c/Pz8h
anged86iP8erPyonPz8reT9ePz9eP006Pz8/cumentatPz8/dT8/cT9reT/bindiPyA/dispPz8/
P2x/PxpiPx8mPz8sPyY/Pxc/Pz8edT8/Pz/erj8/Pz8bP0c/Pz9oDQoNCk9rISBOb3Qgc3VyZSBo
b3cgdG8gYWRkcmVzcyB0aGlzIHRob3VnaC4uLiA6KQ0KDQpUaGFua3MsDQpsYXVyZW50aXUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
