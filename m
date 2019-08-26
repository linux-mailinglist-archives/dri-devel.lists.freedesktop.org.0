Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EAA9DEB4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABC897C3;
	Tue, 27 Aug 2019 07:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02776E2A9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4vnbF3LfC0Er1Cwg7P/WQxWrYgqI1oVhtHluiYdy1g4mYEY44k4VUIa6z7ZyPIQtsd3PhzUjN7xqll1GcSWKeXbAxRZRZ3ybi7kiWAbz+DrHWLs5WW53FEczgqwzLDzmV4plmvlteUIsLGAeh1cO4TsACrTXqeGAGOyKcr6CPfBNErek6i7wCepk52EI1XFRPL8Ca+Cjir7epFPWFNVShxtYpDwq0T/erdD9rrdeJxbX87VJ9B1S3+X3ZyLsEyOq8qkKmaJD7L9cTWactnfoLp5b8x1n0h+/OpGrHcHmCiBp0UsOTRY+9R8tJNOPm+FzXs0dlKAl94TFEAIH787Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRspqHGpkffkgwELhLGwHdRPcZk7T7UDa07SdIKaT7k=;
 b=SGPBbGO/n5Fdb9TqzGH9WK6Y2/dx9geZmZkwJkwmqCJbjd9uD95xLuQdQsMhq3O/laB2ZrOr5CmP5dUdiUJQ5hZXzdO1n4Kk3rcjqREsC9uEmrFEZFyHiWMlAKEEqEz8QsyhTEXD17NWsYL1J2h5kDzQZLZv6dx/Sc2csyBD3gteZBcAPaMbjLlS8Xyz0jbCWPu9dYBAxA1l7GtVV0O3ORnNVJRWpSr0XZqpF41bTb81lqffbQhmOWSgBet05srtR5PgjdVdyo0F3jApV8ulQYohdP8Q6Y/xBeD+FhzDq6yavMRgjNT+dqvZ4coGafCY6x+PtWsSQYzz8dUJwW0T6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB3983.eurprd04.prod.outlook.com (10.171.182.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 19:19:18 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::c5e8:90f8:da97:947e]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::c5e8:90f8:da97:947e%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 19:19:17 +0000
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Stefan Agner <stefan@agner.ch>, Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v3 00/15] Improvements and fixes for mxsfb DRM driver
Thread-Topic: [PATCH v3 00/15] Improvements and fixes for mxsfb DRM driver
Thread-Index: AQHVWAl4KWfQYrgkMk+Db70gagBB/g==
Date: Mon, 26 Aug 2019 19:19:17 +0000
Message-ID: <VI1PR04MB70233374E91F85119FD21FD5EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
 <20190826120548.GA14316@bogon.m.sigxcpu.org>
 <3bd35686e046048d35cd4987567a13cf@agner.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d0d5059-de07-4019-3e3b-08d72a5a4a67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB3983; 
x-ms-traffictypediagnostic: VI1PR04MB3983:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB398315D6AA1CDEA1C549CBFEEEA10@VI1PR04MB3983.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(189003)(199004)(71190400001)(6436002)(6506007)(55016002)(71200400001)(66066001)(86362001)(186003)(81156014)(81166006)(9686003)(8676002)(5660300002)(6116002)(66556008)(66946007)(66446008)(76116006)(3846002)(8936002)(33656002)(64756008)(91956017)(7696005)(2906002)(76176011)(66476007)(486006)(6246003)(476003)(26005)(25786009)(7416002)(446003)(102836004)(110136005)(14454004)(99286004)(4326008)(229853002)(305945005)(52536014)(74316002)(54906003)(256004)(316002)(7736002)(6636002)(44832011)(53546011)(478600001)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3983;
 H:VI1PR04MB7023.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ch1vJqoVWK787E3WK3WIHLNokRfeIUs3naTk6FihbNJrRWegFVTKIk50RuJYtrvPwEBB56DUJp9xvG75mcmUs7Y1zrP39/qui808I9qwKKMDMRvCpNlhhSQnENETg/17+aipkq211vR8zoRIvKFYJZtVo2xVEv3r8v9eMWdcnHHRBY5hg/co1y/yTLxC5kOscOE8oElKPe006K8Y6mAQcnmtnAlMht82OQOHSThSpGDnDjwFs1SVWILJicLGmK4xH2dnQ3PV7LLeCvYRTvlvA5+ZavTock5mZ+3dVvTJA1PqrOXKKRT4WenTVLQsqTxfqix896PmQ6oFe2j257OJDdtbCOvEbZgNZ9gaq8S+8mBs07fs+kjQylqgQ10XUlFrt+kMAR+2QDK9FwUgbgdk/7W+Br2iG0MtbfOY+wzMqho=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0d5059-de07-4019-3e3b-08d72a5a4a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:19:17.8817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTdibkanzX+uGMNpOCROORN3vgeGTN/WE2CdgK6JgQT5iuFHCRu28ZfrgUORoJY07ETY506M4rPXmQF9/i009Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3983
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRspqHGpkffkgwELhLGwHdRPcZk7T7UDa07SdIKaT7k=;
 b=sGqVGdMRxcnVmcqZTgCw9KK36VaP3l9qWhGTpVT+WV7rzcyU1NLjB9YltCQxEj449ngrplCYfJk4QNtdVpgTBfleD6lqL3bP5Jkpt7UO0iYnAzx1gf6CvWRQPn2fbBUOzAndxyBDpvRLb78mG4SrehpxUPmcIyy/FgwJxHsLGnA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYuMDguMjAxOSAxNzozNSwgU3RlZmFuIEFnbmVyIHdyb3RlOgo+IE9uIDIwMTktMDgtMjYg
MTQ6MDUsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+PiBIaSwKPj4gT24gV2VkLCBBdWcgMjEsIDIw
MTkgYXQgMDE6MTU6NDBQTSArMDMwMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPj4+IFRoaXMgcGF0
Y2gtc2V0IGltcHJvdmVzIHRoZSB1c2Ugb2YgZUxDRElGIGJsb2NrIG9uIGlNWCA4IFNvQ3MgKGxp
a2UgOE1RLCA4TU0KPj4+IGFuZCA4UVhQKS4gRm9sbG93aW5nLCBhcmUgdGhlIG5ldyBmZWF0dXJl
cyBhZGRlZCBhbmQgZml4ZXMgZnJvbSB0aGlzCj4+PiBwYXRjaC1zZXQ6Cj4+Cj4+IEkndmUgYXBw
bGllZCB0aGlzIHdob2xlIHNlcmllcyBvbiB0b3Agb2YgbXkgTldMIHdvcmsgYW5kIGl0IGxvb2tz
IGdvb2QKPj4gd2l0aCBhIERTSSBwYW5lbC4gQXBwbHlpbmcgdGhlIHdob2xlIHNlcmllcyBhbHNv
IGZpeGVzIGFuIGlzc3VlIHdoZXJlCj4+IGFmdGVyIHVuYmxhbmsgdGhlIG91dHB1dCB3YXMgc29t
ZXRpbWVzIHNoaWZ0ZWQgYWJvdXQgaGFsZiBhIHNjcmVlbiB3aWR0aAo+PiB0byB0aGUgcmlnaHQg
KHdoaWNoIGRpZG4ndCBoYXBwZW4gd2l0aCBEQ1NTKS4gU28gYXQgbGVhc3QgZnJvbSB0aGUgcGFy
dHMKPj4gSSBjb3VsZCB0ZXN0Ogo+Pgo+PiAgICBUZXN0ZWQtYnk6IEd1aWRvIEfDvG50aGVyIDxh
Z3hAc2lneGNwdS5vcmc+Cj4+Cj4+IGZvciB0aGUgd2hvbGUgdGhpbmcuCj4gCj4gVGhhbmtzIGZv
ciB0ZXN0aW5nISBXaGF0IFNvQyBkaWQgeW91IHVzZT8gSSB0aGluayBpdCB3b3VsZCBiZSBnb29k
IHRvCj4gYWxzbyBnaXZlIHRoaXMgYSB0cnkgb24gaS5NWCA3IG9yIGkuTVggNlVMTCBiZWZvcmUg
bWVyZ2luZy4KCkkgZGlkIGEgcXVpY2sgdGVzdCBvbiBpbXg2c3gtc2RiIGFuZCBpdCBzZWVtcyB0
aGF0IFtQQVRDSCAwNy8xNV0gCiJkcm0vbXhzZmI6IEZpeCB0aGUgdmJsYW5rIGV2ZW50cyIgY2F1
c2VzIGEgaGFuZyBvbiBib290LCBldmVuIHdpdGhvdXQgYSAKcGFuZWwuCgpJZiBJIHJldmVydCB0
aGF0IHBhcnRpY3VsYXIgcGF0Y2ggaXQgc2VlbXMgdG8gYmUgZmluZTogdGhlIG5ldyBwaXhlbCAK
Zm9ybWF0cyBzZWVtIHRvIHdvcmsgaW4gbW9kZXRlc3QgKGNoZWNrZWQgd2l0aCBzaWksNDN3dmYx
ZyBwYW5lbCkuCgotLQpSZWdhcmRzLApMZW9uYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
