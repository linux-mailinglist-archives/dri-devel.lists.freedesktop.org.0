Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBEDB8BE4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA716F58B;
	Fri, 20 Sep 2019 07:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770100.outbound.protection.outlook.com [40.107.77.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC466F65E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQTouy6eUKRRUktgATnJBZPemHH9vhzSatA6L4xVJl1ZoZxZBODxPzAiFjik0XJUwSG04DO+YrTYdwgwl2IwuEXcMKZhCW7fRFZC7fLx0hKHR19sCCnl0LLlBnbbQrn+7huLXxky26KMnS5hT5J2yLNj8hSxvTiqPv/EC1asVNAotkG7SIG2klo5ySzW1mr6NdGJT8E0DZWJlsDgxNU6qEEB6xADkiiBMV8cAjrC7/9c253GxYx0hSeo4hfI5Ove5EbGUP9tGtJ3E4egmQlVoTZPwChAc3kf2j3o4XB9Ps1eyqap2EK5dtJPNaiG2VvgioxhuEaS4cq60YVIJvREPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnviiPQztF2wMhw8UUZtUuwkxVKisF9/Tz/Lv4RZuOA=;
 b=VGOhGNxj9rQz6SLMybVPyZjlDHJMBwZHpQ//NWCSAyUYQXbmr9M9OyQcK0EYTQTj+g0W6fHD+7TEkDp1CHZL6mK30UGVKYbL3OLyxKbN7f5qxpuWsi4codcFrOPgejfoVS9xAa7ENVD3Af4RZNEhwyePN0lhjy+TEIAJBGOO7nQH5+MnMsNqOBa6TfbhwIN27X9CYNRTD0aHaM6a96HLtJ5huvn1flHK92t2RuO3R2XNOvs7fHcF9hJWflirld/1HCvimw078Ji/RGvtxIjKXUhVyoeJg4ncnrTNozXKTrcrwDitnzF+tzoFaZ3P8+mXL/fUWjnw9ZpIUgLaCA9XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB6861.namprd04.prod.outlook.com (10.186.145.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 10:48:42 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd%6]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 10:48:42 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v1 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v1 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVbrX5ZBWm7ngGmkilFiHXsbIhDacykSyAgABA+IA=
Date: Thu, 19 Sep 2019 10:48:42 +0000
Message-ID: <20190919104833.GA30631@xin-VirtualBox>
References: <cover.1568858880.git.xji@analogixsemi.com>
 <8bb69c72-50bf-c499-ff92-9e3662b4fe87@baylibre.com>
In-Reply-To: <8bb69c72-50bf-c499-ff92-9e3662b4fe87@baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0302CA0011.apcprd03.prod.outlook.com
 (2603:1096:202::21) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40cdd32b-6061-4148-ddb4-08d73ceef006
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB6861; 
x-ms-traffictypediagnostic: MN2PR04MB6861:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6861296ED3913D699C4D3F81C7890@MN2PR04MB6861.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(376002)(366004)(39850400004)(396003)(346002)(53754006)(199004)(189003)(7736002)(6916009)(1076003)(486006)(6512007)(3846002)(186003)(6436002)(14454004)(6116002)(6246003)(229853002)(11346002)(5660300002)(386003)(54906003)(53546011)(476003)(2906002)(8936002)(102836004)(107886003)(305945005)(26005)(14444005)(6506007)(446003)(66066001)(7416002)(86362001)(6486002)(256004)(81156014)(478600001)(316002)(66446008)(9686003)(71200400001)(33716001)(76176011)(71190400001)(4326008)(99286004)(8676002)(25786009)(81166006)(66556008)(64756008)(66946007)(66476007)(52116002)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6861;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dymHbQKjO4hSuVaR6UkRsts+cUlPgc1YaM6SLeKjCJuyl4vFdP0bQY1ev2/QuyhPpGYGLcfXukYEDGQ8I8G20KLvvUsqq9hF6eU5k2oU7TPJ7pUciGywHmNkhP+XGFgWQoS/ib6Eb8KExATQruOsE+6FfNYZeLafTQsSSDzqgyStqWhWYS4u6lEXUuVh9fxmAtMc5d/DJ6IxdatPEomweG3saMpFZS9yfTsmB7Y3jn6eU1mAc9RtPnK2ac/my7ThigPHFQrFSMJ5mdY6qmyAG1Cudt9/lADPDCfI3KSoxz2/EQQ6L+V2yp5UulaDWRYX4ol+WuotSYKfcUBG2W5O2LAai7jv/YQo/QD4iyIqKt5/EdvcV8GFyLtxxy9BlYmK/uDHBFFmu9TH8mLJKSTCBcmkU4WBADdQtUDJEDxOuz8=
Content-ID: <96D1184EF9664145ACC2E445F4D00A84@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cdd32b-6061-4148-ddb4-08d73ceef006
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 10:48:42.5587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJywVg77r63RDyezTwIqUYBbrQP7vRY9YJKEIfj1NIfV2Y2RuNTluwbAHPsvMlzP3+2UCZkHf+lNNg7MT5gOug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6861
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnviiPQztF2wMhw8UUZtUuwkxVKisF9/Tz/Lv4RZuOA=;
 b=HlgcVhy2o9lGl9AHUSheXsCIPlx2VfbOn9hxIi6cSOqXOiB2Yr1998JjCdzQiv4dIUt2aIr9hWL9QfnVPewhJRaX4echgpnZf39Rki5FRAkA9aigJMnHJAXkU4fIbfBrgavCNK4mWVgcQNYGZSvEQfjI27/OCU6yY7JZNNX03Pg=
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDg6NTY6MDFBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gUGxlYXNlIENjIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiAKPiBUaGFua3MsCj4gTmVpbAoKT0ssIHRoYW5rcy4KWGluCj4gCj4gT24gMTkvMDkvMjAx
OSAwODo1MSwgWGluIEppIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4gCj4gPiBUaGUgZm9sbG93aW5n
IHNlcmllcyBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgU2xpbXBvcnQgQU5YNzYyNSB0cmFu
c21pdHRlciwgYQo+ID4gdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQgNEsgTUlQSSB0byBEUCB0cmFu
c21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlLgo+ID4gCj4gPiBUaGlzIGlzIHRo
ZSBmaXJzdCB2ZXJzaW9uIHVwbG9hZCwgYW55IG1pc3Rha2VzLCBwbGVhc2UgbGV0IG1lIGtub3cs
IEkgd2lsbCBmaXgKPiA+IGl0IGluIHRoZSBuZXh0IHNlcmllcy4KPiA+IAo+ID4gVGhhbmtzLAo+
ID4gWGluCj4gPiAKPiA+IAo+ID4gWGluIEppICgyKToKPiA+ICAgZHQtYmluZGluZ3M6IGRybS9i
cmlkZ2U6IGFueDc2MjU6IE1JUEkgdG8gRFAgdHJhbnNtaXR0ZXIgYmluZGluZwo+ID4gICBkcm0v
YnJpZGdlOiBhbng3NjI1OiBBZGQgYW54NzYyNSBNSVBJIHRvIERQIGJyaWRnZSBkcml2ZXIKPiA+
IAo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUudHh0
IHwgICA0MiArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgfCAgICAyICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9L
Y29uZmlnICAgICAgICAgICAgfCAgICA2ICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4L01ha2VmaWxlICAgICAgICAgICB8ICAgIDEgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jICAgICAgICAgIHwgMjA4NiArKysrKysrKysrKysrKysr
KysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oICAgICAg
ICAgIHwgIDM5NyArKysrCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAyNTMzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUudHh0Cj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYy
NS5oCj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
