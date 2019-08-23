Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097AD9C6A5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727916E147;
	Mon, 26 Aug 2019 00:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2019 07:37:18 UTC
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF136E040
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:37:18 +0000 (UTC)
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Nicolas.Ferre@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="Nicolas.Ferre@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
IronPort-SDR: PfsfFgVHP9zMlwY5aS0AMhbO/x3SUIFUKUjswmMRa+fuKYoWDTBxhSzap3ZIe48jVUhpeRFGnJ
 eFgg4rCm6iC9pUjVjua39WKtUhb1n3xnplHAdQaOfAHQ2nZN116Vvcc6lPzNjHM6gb8k7J6O5W
 YqIRtEMrWjT63DQPFGbUmc8YvlalvYmAddYu0CE5RLnFsxUkzb+PlscsiKDAfSPPjJ7Gpvs8o9
 zT1Lt5tyqgJwAGNP+1Q71nuQRwab2khse3hncJATrLTEg1EVXNi4mf4u48YSPFMtNrx/Hf60VR
 0y8=
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; d="scan'208";a="46260086"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Aug 2019 00:30:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 00:30:10 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 23 Aug 2019 00:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZQz1Tq8MSFWvUVIsnQ0LfWvE/TFDBfzuq24UD8i6qVag/dwL3Qz8NtlSMgPyqyz2dw7UQhZyW/5qLCc8PeYfoAL7u0t6Rb1SQfQa+uoClPb9oEZA9mweu1FAQ1IoGNbSRrOJiYqyU+VDlK93eLI/AaWgQF9oMaqSipqUJbmMtJnSYmte8vn0K3jWch36HPqoY+fg6u2p+hOzFnuKVDkXKXJmppl40ndJIkb1oBAFU0MYmUjD7A1/7Np2yaLFJR5l3MCw9HuJUcD4EbAsVQsDfnyklr8gNIuh7frKHcvcgDCg3w49RYkxsFTrqdgX5CqvAdyol2vXhNLA/7eKHbCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nq0jeWNCBbbLH5y244XolOvLLqss7YzZSjtvcqQTT/s=;
 b=WdNG0SmqV1nc+BhpvUdqDJJYSs8X/34oMNO5NTlCyjLzWBG9CNrMxJrP/k6VRvUxjtaoDF6r3uEl2cPSma6eL+JqWPsY4ILHZdg7xWqvp6cSwhyJqtHh19NYj4Ea5ir6kTjXNUk+mFv6AcGc2Qju0qL5PxnCX6h8M0vNyjE2o+uzUwt6Dorjw29amj16fDosDxReLwoPMcUTPrzZNAfGH4zbXCqFX+hf3LOQ+N1TwN5TPUZGnKdLuQlzQtMRY16uSoa6yxR+KmaG91JMKIjnX5YP5LLYgKF/hpLql+oszTd7c4E9eepuTn+PDr/Jcw4ycYXFeaA08e+kIvF097us1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from MWHPR11MB1662.namprd11.prod.outlook.com (10.172.55.15) by
 MWHPR11MB1936.namprd11.prod.outlook.com (10.175.54.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 07:30:07 +0000
Received: from MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::410a:9d4b:b1df:2134]) by MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::410a:9d4b:b1df:2134%12]) with mapi id 15.20.2178.020; Fri, 23 Aug
 2019 07:30:07 +0000
From: <Nicolas.Ferre@microchip.com>
To: <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] drm/panel: Add and fill drm_panel type field
Thread-Topic: [PATCH 1/2] drm/panel: Add and fill drm_panel type field
Thread-Index: AQHVWVPgB8eb0PGTiESiXOdC5s+3E6cIVnaA
Date: Fri, 23 Aug 2019 07:30:07 +0000
Message-ID: <01887051-7cf7-cf52-65d1-85d60c3dd02c@microchip.com>
References: <20190823014033.2971-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190823014033.2971-1-laurent.pinchart@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::14) To MWHPR11MB1662.namprd11.prod.outlook.com
 (2603:10b6:301:e::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c59a9c-b7cf-43be-e764-08d7279bb8d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR11MB1936; 
x-ms-traffictypediagnostic: MWHPR11MB1936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1936F005A925A4FCA73AA955E0A40@MWHPR11MB1936.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(6436002)(76176011)(52116002)(14444005)(446003)(99286004)(7736002)(305945005)(6486002)(5660300002)(256004)(229853002)(4744005)(6512007)(7416002)(3846002)(6116002)(14454004)(478600001)(107886003)(86362001)(186003)(2906002)(26005)(476003)(386003)(6506007)(53546011)(11346002)(6246003)(316002)(4326008)(102836004)(36756003)(53936002)(25786009)(8936002)(81166006)(81156014)(8676002)(486006)(2501003)(66476007)(110136005)(31686004)(66556008)(2616005)(64756008)(54906003)(31696002)(71200400001)(71190400001)(66446008)(66946007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1936;
 H:MWHPR11MB1662.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bftuLYBC663ZAIktVKS9AX7UJEeUW+Af6pwQpuXIgDCedcprUbaum/fFPBYmGlb0A/XMcIEKEXeOpCW12TFqIWCSjSup5nPM52BYnoAj37UDefn0imUINU4uz4M1BgPY4sbL963MpxyIDFrqaNwAUo58iAVCJ5rD+oROQ0HwZGWn6b8gmki00jferTjluBtSNTglOs+BK21lpyYYGqWzr2C0rgxq3aea7eHORyg/3Al+8w5DvZ8pNkNFxsZ5TF1Ca1716qQM6Ct/krELXAfQd2MAj4ga0H1yAygIpiAA2oS+4pbDPTy2cXC0vd5hklkvlBKtTs2pYwveOV34FDHhLqBCHe0ieaXHcMqqoPFJO+MxtsnYVM/BJQy2YdcxrjsC8DYoWMSxFJ5WZPQa04I5tiG0+M2ojb5RuNbhX4m+Rlg=
Content-ID: <C9840AEFF36A9C4C81F08D0E96D5DE8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c59a9c-b7cf-43be-e764-08d7279bb8d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 07:30:07.5780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qb7tp9m1Ax2v7jidtU/qUmcOtFkI+jI+rqSI5OMhPiybrNiZq3RzzZCM8jcIgURB4pq6uBFRXxlBaUJe+dMKszHa3yuxoQNKd1IZXMryQWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1936
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nq0jeWNCBbbLH5y244XolOvLLqss7YzZSjtvcqQTT/s=;
 b=T6ugYEMSVPId33e1HItXxPMOIPUAgVP3Zb5RWuR94E4q4lMF+/vD+NkSG0MXJd3Vao9SoIrj2ZB0Ov2qnXixov+up0T+rpkeyljsldOGzj6u8QSeJNjWNYAWdkVbpgofe0oLvojXZFuQ1jzQH9bxL6KWPa2gPFOo+br5tjNZR50=
X-Mailman-Original-Authentication-Results: esa2.microchip.iphmx.com; spf=Pass
 smtp.mailfrom=Nicolas.Ferre@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
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
Cc: alexandre.belloni@bootlin.com, narmstrong@baylibre.com, agx@sigxcpu.org,
 philippe.cornu@st.com, paul@crapouillou.net, thierry.reding@gmail.com,
 stefan@olimex.com, tomi.valkeinen@ti.com, Tudor.Ambarus@microchip.com,
 Ludovic.Desroches@microchip.com, boris.brezillon@collabora.com,
 jagan@amarulasolutions.com, robert.chiras@nxp.com, alexandre.torgue@st.com,
 jonas@kwiboo.se, jsarha@ti.com, vincent.abriou@st.com, jernej.skrabec@siol.net,
 kernel@puri.sm, yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDIzLzA4LzIwMTkgYXQgMDM6NDAsIExhdXJlbnQgUGluY2hhcnQgd3Jv
dGU6Cj4gQWRkIGEgdHlwZSBmaWVsZCB0byB0aGUgZHJtX3BhbmVsIHN0cnVjdHVyZSB0byByZXBv
cnQgdGhlIHBhbmVsIHR5cGUsCj4gdXNpbmcgRFJNX01PREVfQ09OTkVDVE9SXyogbWFjcm9zICh0
aGUgdmFsdWVzIHRoYXQgbWFrZSBzZW5zZSBhcmUgTFZEUywKPiBlRFAsIERTSSBhbmQgRFBJKS4g
VGhpcyB3aWxsIGJlIHVzZWQgdG8gaW5pdGlhbGlzZSB0aGUgY29ycmVzcG9uZGluZwo+IGNvbm5l
Y3RvciB0eXBlLgoKV2l0aCBNaWNyb2NoaXAvQXRtZWwgZHJpdmVyLCB3ZSBtYWlubHkgKG9ubHkp
IHVzZSB0aGUgIlVua25vd24iIHR5cGUgb2YgCmNvbm5lY3RvciBiZWNhdXNlIG91ciBoYXJkd2Fy
ZSBzaW1wbHkgdXNlcyBSR0Igd2lyZXMgaW4gcGFyYWxsZWwuCgpTaG91bGQgd2UgbW92ZSB0byBh
bm90aGVyIGNvbm5lY3RvciB0eXBlIChtYXliZSBub3cgdGhhdCBpdCdzIGNyZWF0ZWQgCmFuZCBp
dCB3YXMgbm90LCBiYWNrIHdoZW4gd2UgY2hvc2UgdGhlICJVbmtub3duIiBvbmUpPwoKV2hhdCB3
b3VsZCBiZSB0aGUgY29uc2VxdWVuY2VzIGlmIHdlIG1vdmUgKHNpbGVudGx5PykgdG8gYW5vdGhl
ciB0eXBlIAphbmQgcGFydGljdWxhcmx5IG9uIHRoZSBjb21tYW5kIGxpbmUgYXJndW1lbnQgbGlr
ZSB0aGUgb25lcyB3ZSBjdXJyZW50bHkgCnVzZTogIlVua25vd24tMTo4MDB4NDgwLTE2Ij8KClRo
YW5rcyBmb3IgeW91ciBpbnNpZ2h0IG9uIHRoaXMuIEJlc3QgcmVnYXJkcywKICAgTmljb2xhcwoK
PiBVcGRhdGUgYWxsIHBhbmVsIGRyaXZlcnMgdG8gZmlsbCB0aGUgbmV3IGZpZWxkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiAtLS0KWy4uXQoKLS0gCk5pY29sYXMgRmVycmUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
