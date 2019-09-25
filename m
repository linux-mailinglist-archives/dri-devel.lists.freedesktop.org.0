Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2B6BD830
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 08:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB27E6EB29;
	Wed, 25 Sep 2019 06:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30040.outbound.protection.outlook.com [40.107.3.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B98E6E0D1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 06:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKDK3UC++eWzCA8xg8JJYb/w2Xk/o+cP0ff/91YN+1eI9CWNfwP3xAKEudh1oUT8rjk4tPXi2spYeyaZnZfpC/oe8+4GYzEiANvrwiAjXoO8sFGocNMYwyd6MmbbOBED5PdDKl5BtTtskZIBGtCvWbDizDul3gQxD4POoJmF/JSJ+C8jjbLAyqcPCvMHTXWul11prsCQDiURToaOJsptGUJDpQSZqssNUbojL1KQ0cCrXebqem6cj39G+DonXJMu7edsBnUYn85Cx0Vrwi1wzZUZpeZkcEcvjwHisEUAXf1YNA9MfOgZ9FBk73LgqutEYhoNrfshdpstaBH8IT+NAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFFqjkSTwjWJ61G2p/Ns/OxWyB6zFWGzNWYZpu9nznk=;
 b=Aij/c5v5dCNbt8Tt4sEmUwhjB/fdHayD2EAwI+zAf4bXcWhHHwtKA2b8icZRAT/rwnVxCwT9zR1mhHHbOO03CSiDahv3+5BlxKLOJtA3AGA/t3qoBUnI3KIxu6WyKPQwkaplMwZi4rJDgRawtaNDi0fjbPFC63lAwjM9EpAjtaCjjXM/zvHRLdP3YhkrkjgUSBfIh8CnysXdbtonxdziS2dkhdjfdEiNNYfPlhMeIufpZj/IvyyELpAoJpkx1xepviS617ev5PRjmfLWGg1a+jNZU5p00LpUOoyAkvgO/B5a8IZe7GJ3s1Fw8BCFcq0MY1L9Bm8WeAVd+Qr43PVkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB4270.eurprd04.prod.outlook.com (52.134.31.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Wed, 25 Sep 2019 06:14:35 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c887:7d43:1e17:9485]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c887:7d43:1e17:9485%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 06:14:35 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: Re: [PATCH 4/5] dt-bindings: display: imx: add bindings for DCSS
Thread-Topic: Re: [PATCH 4/5] dt-bindings: display: imx: add bindings for DCSS
Thread-Index: AQHVc2iALMH+ZTgD6EK6yTZZJtKpAg==
Date: Wed, 25 Sep 2019 06:14:34 +0000
Message-ID: <20190925061433.GA16686@fsr-ub1664-121>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
 <1569248002-2485-5-git-send-email-laurentiu.palcu@nxp.com>
 <CAL_JsqK1egTpkqsgVUMUiYzKvVJ=nWtJu+OeujJotRCD9ADsnw@mail.gmail.com>
In-Reply-To: <CAL_JsqK1egTpkqsgVUMUiYzKvVJ=nWtJu+OeujJotRCD9ADsnw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7e88fe7-1cb8-41d3-2b44-08d7417fa331
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR04MB4270; 
x-ms-traffictypediagnostic: VI1PR04MB4270:|VI1PR04MB4270:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB42709C77C7BD6966E5858437FF870@VI1PR04MB4270.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(52314003)(478600001)(966005)(71200400001)(71190400001)(5660300002)(3846002)(6116002)(1076003)(81156014)(81166006)(26005)(7416002)(7736002)(8936002)(305945005)(8676002)(45080400002)(66066001)(316002)(2906002)(14454004)(86362001)(54906003)(99286004)(25786009)(102836004)(44832011)(6512007)(9686003)(476003)(33716001)(256004)(446003)(33656002)(229853002)(6486002)(6436002)(6306002)(11346002)(66446008)(64756008)(66556008)(66476007)(4326008)(76116006)(91956017)(186003)(6246003)(6916009)(486006)(76176011)(53546011)(6506007)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4270;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7Zp2xphtbR3Umwk5sHTwyIfeXBtZzn9hrl0gj2whMI8NJfvublIRnRw75w34IlqUXXQBxSENt1wvESitBrh545vk1fKCkZcywpq7MJkDS7iet+y/evsniXt9pOTeB7tUvdL50E2o5sabuBYfDoHg3TyA+pJykjtebqF8aQdqkcXSvaiDLkFgpcDg8hhDLVhGlPNJXRqRlQqSonjjF5kCjuefDRVmmP93JuIFWTLRkac3Cd2nVHdRjlOQXdz/Ek6zIkAb75MkGG2kfnQEeaWG4HlVn9vn+f70qXJPSfX1GcVIVJ1cJqYm9n2iqVI+XuS7ADqzEoGTJ453XZjf7u7AFZ3/bJMxbTqE2tSN8YU68B5yZYf92EZiOZKW+aBZCAAvvEclj2VTTLN1fVAt0eOgyn1mDzeJ9NGtfxnLaCVzrqFStPq6TxnL4gJahjxpsu0h4EMxZecdOjkKzSSoXO6LPw==
Content-ID: <C68E1DEA7D81984A98B5320990996987@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e88fe7-1cb8-41d3-2b44-08d7417fa331
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 06:14:34.9365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jzdu8ZmyCyuD0/aVGrKqMrcMdF1X2aCj+R19uN93QSR0fefFJbBgZ8g0kAdxg74wYma/gkMG8WvKbQx16BcUfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFFqjkSTwjWJ61G2p/Ns/OxWyB6zFWGzNWYZpu9nznk=;
 b=S10PDyI7YCAR4PxxQliKTCExL4i+UEoFomsWNGj2kI3ccX3NYeJd4VNOc7AH3RWyZ7CDpPXRVHcP8Nivou400pPzOgYOioqbKYUDU8aYEFOZG3dY0zw6I2RgmApdMXxQmSeiJGaQYWKQVWxQ8VYw1NuobEfOUgDAXCkYQpaKLBQ=
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
 dri-devel <dri-devel@lists.freedesktop.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwMTo1MzoyOFBNIC0wNTAwLCBSb2IgSGVycmlu
ZyB3cm90ZToKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCA5OjE0IEFNIExhdXJlbnRpdSBQYWxj
dSA8bGF1cmVudGl1LnBhbGN1QG54cC5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCBiaW5kaW5ncyBm
b3IgaU1YOE1RIERpc3BsYXkgQ29udHJvbGxlciBTdWJzeXN0ZW0uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTGF1cmVudGl1IFBhbGN1IDxsYXVyZW50aXUucGFsY3VAbnhwLmNvbT4KPiA+IC0tLQo+
ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbCAgICAgIHwg
ODYgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NiBpbnNlcnRp
b25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbAo+IAo+IEZhaWxzIHRvIGJ1
aWxkIHdpdGggJ21ha2UgZHRfYmluZGluZ19jaGVjayc6CgpNdXN0IGJlIGJlY2F1c2Ugb2YgdGhl
IGV4dHJhICcweCcgU3RlcGhlbiBCb3lkIHBvaW50ZWQgb3V0LiBGdW5ueSB0aGluZwppcyBJIHJh
bjoKCm1ha2UgZHRic19jaGVjayBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L254cCxpbXg4bXEtZGNzcy55YW1sCgphdCBteSBzaWRl
LCBiZWZvcmUgc2VuZGluZyBvdXQgdGhlIHBhdGNoc2V0LCBhbmQgaXQgcGFzc2VkLiBUaGUgY29t
bWFuZAphbHNvIHJ1bnMgZHRfYmluZGluZ19jaGVjaywgQUZBSVM6CgogIFNDSEVNQSAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Byb2Nlc3NlZC1zY2hlbWEueWFtbAogIENIS0RU
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L254cCxpbXg4
bXEtZGNzcy55YW1sCiAgRFRDICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9pbXgvbnhwLGlteDhtcS1kY3NzLmV4YW1wbGUuZHQueWFtbAogIENIRUNLICAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L254cCxpbXg4bXEtZGNz
cy5leGFtcGxlLmR0LnlhbWwKCk5vdCBzdXJlIHdoYXQgSSdtIGRvaW5nIHdyb25nIHdoZW4gcnVu
bmluZyBpdC4gSSBzaG91bGQndmUgY2F0Y2hlZCB0aGF0LiA6LwoKQW55d2F5LCBhbHJlYWR5IGZp
eGVkIGl0IGFuZCB3aWxsIGJlIGluY2x1ZGVkIGluIHYyLgoKVGhhbmtzLApsYXVyZW50aXUKCgo+
IAo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRnBhdGNod29yay5vemxhYnMub3JnJTJGcGF0Y2glMkYxMTY2MDczJTJGJmFt
cDtkYXRhPTAyJTdDMDElN0NsYXVyZW50aXUucGFsY3UlNDBueHAuY29tJTdDZjk3ODQ3Y2U3Mzli
NDZmZGI3MjMwOGQ3NDEyMDg1OGIlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3
QzAlN0MwJTdDNjM3MDQ5NDgwMjQ0NDI0OTgwJmFtcDtzZGF0YT1manlxNTJsaXZFbk1BUVl6VkFH
cU8lMkZPdG1MUzgzZHVuZ1N2UHFIWWxlMTAlM0QmYW1wO3Jlc2VydmVkPTAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
