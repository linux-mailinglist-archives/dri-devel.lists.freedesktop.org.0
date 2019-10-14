Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4872D5C1B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB4F89D4B;
	Mon, 14 Oct 2019 07:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740090.outbound.protection.outlook.com [40.107.74.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC8C6E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 02:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUCJlufzAi5V7pv6bammKlOiI04/7V93LFIcao462VVxotDgeTdNQetSBh5E4lioS4LA13FHC42T14Brgc2mvKQsZAnoTklyEIzOUDcVneGvsfwf01szu7aInsd/Tvtdh5Iwmmuedc1Jytb5njuIkQkDDcqMs0GrYqNm5fMgNs7gROkz89DW3j+3dDcGI5yO8mA+o5Xv8Nv9xo47PRLDvHJM0ou+XtGmLgqvAUysbONkRR79XWCDqhvJAvxH6w3T2hyulF4+nCDOIjO0IATvmkN2CAMhSO/9ZyD2C/ugoL7SwOhbWm32bsb6o4cYkTSfwJmKxrUmja51D0oa7nyH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpP7ocOwyme+KvszB4vYQpewzyYmu7E4aS6LnB6QbcE=;
 b=QbiZbPpVL/KU+m6EbpQ2SYUHp2wtmdQR5+DH27EyteU3t+ooQo6fyBYuDUPPV4ZjlaTXRV5pL+IJXmkrWRf5I6q/AzHAGvWZpZc4qwkQt7ld3F9cjvImT91l/lSEx+FU51L/edDXmzKjPec8AzfigOm8gz9aMLfK/36Z1sd92Vdp3aDjJmXciuVtBruD6JIsngpbBdhUFrl83v3UPx18REmgSX0h2y5BqV0lphCJrPmT7YNLumoNwD75L/AXYCHkDUtjF79B37z8fexmBK2fqyMIvDNkJPM6lcKCJEmPQPcyg5/ZUhz8pQaLDMzztA+8vSkO7Bhvf1rQD4+/a69s0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB3791.namprd04.prod.outlook.com (52.135.81.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 02:53:33 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 02:53:33 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVf9qi2ZQPn8IAhkqsNtop++SEM6dVTGmAgAQo94A=
Date: Mon, 14 Oct 2019 02:53:33 +0000
Message-ID: <20191014025322.GA2390@xin-VirtualBox>
References: <cover.1570760115.git.xji@analogixsemi.com>
 <CGME20191011022154epcas3p1a719423a23f8bf193b6136e853e66b04@epcas3p1.samsung.com>
 <75bb8a47d2c3c1f979c6d62158c21988b846e79b.1570760115.git.xji@analogixsemi.com>
 <3c6067de-9f3c-b93c-f263-fa5dd09c3270@samsung.com>
In-Reply-To: <3c6067de-9f3c-b93c-f263-fa5dd09c3270@samsung.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::36) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 536e5202-1e21-4dbe-78ec-08d75051b33e
x-ms-traffictypediagnostic: SN6PR04MB3791:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB3791AF83122ACDA5C238C202C7900@SN6PR04MB3791.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(39840400004)(376002)(396003)(346002)(366004)(189003)(199004)(6512007)(9686003)(6306002)(54906003)(186003)(99286004)(26005)(7736002)(33656002)(8936002)(52116002)(25786009)(6486002)(53546011)(2906002)(229853002)(76176011)(6506007)(386003)(6436002)(1076003)(102836004)(107886003)(6916009)(4326008)(11346002)(256004)(8676002)(71190400001)(71200400001)(81166006)(478600001)(81156014)(446003)(7416002)(86362001)(33716001)(66556008)(64756008)(66446008)(966005)(66066001)(316002)(66946007)(66476007)(6116002)(14454004)(5660300002)(476003)(486006)(3846002)(305945005)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB3791;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xsomvpfWCxbKmmVoa69tYSEK/MwbI0srJR/+DAlcbkkIqlmE9xfsnaA+h+FnOmXI/XcVjVMCM936thWXWZh+jUVYuCcQvwAAQyyCOs7Bcbkwz2rTKr08auw0V+/wTHjEp+TSNdb4kE+fgnY0s8TC25WlubrdLHpMM6D25Z0t5AM9Yom1WKToymHMEpxe32AZ0JDaAmG/+XHk2EzZD6UoDSiMdS5YZq/NoFMQsHWB25EbazBu+rqIaN9UybBBE2y4X+Xtuf4gW8DV5fNm8syVII+zw7RpJ6oYhG1w9nxgTAWwCP1IKAagJ7UrjxgBnAUu+TJNHVfyp4B9R1dpiQPBEe8fRllpgVnVkyq/4eRDMwXpGVvKY46OO4hCOxQyVphgepF2VRwj4XqbsT1fKVZslj69osuj+rVA9QYiLoCuXCDK25IJZf2mMJXGoCD1FRpktywkz4hxBmQzbqVUaiAPUg==
Content-ID: <7D2EC0DAA8B81945BC9C60B8717ED260@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536e5202-1e21-4dbe-78ec-08d75051b33e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 02:53:33.3629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O95mewymmSIHyYBWGfqtRqRyaF/SovpzxFGYeU5tbthdRGUiRXKJqea9U8Vd8BwsQzNHqyH19AmSIs+Lb+i0dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3791
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpP7ocOwyme+KvszB4vYQpewzyYmu7E4aS6LnB6QbcE=;
 b=kFInHfcThUNiX652RZ8ryLFURIAteqRAX076A6ZnOqH7p2+SGkp8vNOcQ8tGRGsciKsEbxKcIibc4iMRUzHOSjmuepcG5CpMtXqwZd/QV4n0acTwabp4q3I91uDvgyDZEOG5soEx/uzA4/jqISOuk08jFpJv+dosDm3d79FUMOk=
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
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiBIYWpkYSwgcGxlYXNlIGNoZWNrIG15IGNvbW1lbnQgYmVsb3cuCgpUaGFua3Ms
ClhpbgoKT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDE6MjE6NDNQTSArMDIwMCwgQW5kcnplaiBI
YWpkYSB3cm90ZToKPiBPbiAxMS4xMC4yMDE5IDA0OjIxLCBYaW4gSmkgd3JvdGU6Cj4gPiBUaGUg
QU5YNzYyNSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgNEsgTW9iaWxlIEhEIFRyYW5zbWl0dGVyIGRl
c2lnbmVkCj4gPiBmb3IgcG9ydGFibGUgZGV2aWNlLiBJdCBjb252ZXJ0cyBNSVBJIHRvIERpc3Bs
YXlQb3J0IDEuMyA0Sy4KPiA+Cj4gPiBZb3UgY2FuIGFkZCBzdXBwb3J0IHRvIHlvdXIgYm9hcmQg
d2l0aCBiaW5kaW5nLgo+ID4KPiA+IEV4YW1wbGU6Cj4gPiAJYW54NzYyNV9icmlkZ2U6IGVuY29k
ZXJANTggewo+ID4gCQljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDc2MjUiOwo+ID4gCQlyZWcg
PSA8MHg1OD47Cj4gPiAJCXN0YXR1cyA9ICJva2F5IjsKPiA+IAkJcGFuZWwtZmxhZ3MgPSA8MT47
Cj4gPiAJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gCQly
ZXNldC1ncGlvcyA9IDwmcGlvIDczIEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiA+IAkJI3NpemUtY2VsbHMgPSA8MD47Cj4gPgo+ID4gCQlwb3J0QDAgewo+
ID4gCQkgIHJlZyA9IDwwPjsKPiA+IAkJICBhbnhfMV9pbjogZW5kcG9pbnQgewo+ID4gCQkgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2RzaT47Cj4gPiAJCSAgfTsKPiA+IAkJfTsKPiA+Cj4g
PiAJCXBvcnRAMyB7Cj4gPiAJCSAgcmVnID0gPDM+Owo+ID4gCQkgIGFueF8xX291dDogZW5kcG9p
bnQgewo+ID4gCQkgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47Cj4gPiAJCSAgfTsK
PiA+IAkJfTsKPiA+IAl9Owo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFhpbiBKaSA8eGppQGFuYWxv
Z2l4c2VtaS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54
NzYyNS55YW1sICAgICAgICAgICB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1s
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+ID4gaW5kZXggMDAwMDAwMC4uZmM4NDY4Mwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUu
eWFtbAo+ID4gQEAgLTAsMCArMSw5NiBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiA+ICsjIENvcHlyaWdodCAyMDE5IEFuYWxvZ2l4
IFNlbWljb25kdWN0b3IsIEluYy4KPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6ICJo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwj
Igo+ID4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMiCj4gPiArCj4gPiArdGl0bGU6IEFuYWxvZ2l4IEFOWDc2MjUgU2xpbVBvcnQgKDRLIE1v
YmlsZSBIRCBUcmFuc21pdHRlcikKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gWGlu
IEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4g
KyAgVGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21p
dHRlcgo+ID4gKyAgZGVzaWduZWQgZm9yIHBvcnRhYmxlIGRldmljZXMuCj4gPiArCj4gPiArcHJv
cGVydGllczoKPiA+ICsgICIjYWRkcmVzcy1jZWxscyI6IHRydWUKPiA+ICsgICIjc2l6ZS1jZWxs
cyI6IHRydWUKPiA+ICsKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAg
ICAgIC0gY29uc3Q6IGFuYWxvZ2l4LGFueDc2MjUKPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAg
bWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIHBhbmVsLWZsYWdzOgo+ID4gKyAgICBkZXNjcmlwdGlv
bjogaW5kaWNhdGUgdGhlIHBhbmVsIGlzIGludGVybmFsIG9yIGV4dGVybmFsCj4gPiArICAgIG1h
eEl0ZW1zOiAxCj4gPiArCj4gPiArICBpbnRlcnJ1cHRzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+
ID4gKwo+ID4gKyAgZW5hYmxlLWdwaW9zOgo+ID4gKyAgICBkZXNjcmlwdGlvbjogdXNlZCBmb3Ig
cG93ZXIgb24gY2hpcCBjb250cm9sLCBQT1dFUl9FTiBwaW4gRDIuCj4gPiArICAgIG1heEl0ZW1z
OiAxCj4gPiArCj4gPiArICByZXNldC1ncGlvczoKPiA+ICsgICAgZGVzY3JpcHRpb246IHVzZWQg
Zm9yIHJlc2V0IGNoaXAgY29udHJvbCwgUkVTRVRfTiBwaW4gQjcuCj4gPiArICAgIG1heEl0ZW1z
OiAxCj4gPiArCj4gPiArICBwb3J0QDA6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gKyAgICBk
ZXNjcmlwdGlvbjoKPiA+ICsgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERTSSBo
b3N0IHBvcnQgbm9kZS4KPiA+ICsKPiA+ICsgIHBvcnRAMToKPiA+ICsgICAgdHlwZTogb2JqZWN0
Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIEEgcG9ydCBub2RlIHBvaW50aW5nIHRv
IE1JUEkgRFBJIGhvc3QgcG9ydCBub2RlLgo+ID4gKwo+ID4gKyAgcG9ydEAyOgo+ID4gKyAgICB0
eXBlOiBvYmplY3QKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgQSBwb3J0IG5vZGUg
cG9pbnRpbmcgdG8gZXh0ZXJuYWwgY29ubmVjdG9yIHBvcnQgbm9kZS4KPiA+ICsKPiA+ICsgIHBv
cnRAMzoKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAg
ICAgIEEgcG9ydCBub2RlIHBvaW50aW5nIHRvIGVEUCBwb3J0IG5vZGUuCj4gCj4gCj4gRGVjcnlw
dGluZyBhdmFpbGFibGUgcHJvZHVjdCBicmllZlsxXSwgdGhlcmUgYXJlIGZvbGxvd2luZyBwaHlz
aWNhbCBsaW5lczoKPiAKPiBJbnB1dDoKPiAKPiAtIE1JUEkgRFNJL0RQSSAtIHZpZGVvIGRhdGEs
IGFyZSBEU0kgYW5kIERQSSBsaW5lcyBzaGFyZWQ/Cj4gCj4gLSBJMlMgLSBhdWRpbyBkYXRhLAo+
IAo+IC0gSTJDIC0gY29udHJvbCBsaW5lLAo+IAo+IC0gQUxFUlQvSU5UUCAtIGludGVycnVwdCwK
PiAKPiAtIFVTQiAzLjEgU1NSYy9UeCAtIGZvciBVU0IgZm9yd2FyZGluZywKPiAKPiBPdXRwdXQ6
Cj4gCj4gLSBTUzEsIFNTMiwKPiAKPiAtIFNCVS9BVVgsCj4gCj4gLSBDQzEvMi4KQXQgdGhpcyBh
cHBsaWNhdGlvbiwgd2UgZGlkbid0IHVzZSBDQzEvMiBsaW5lLCB3ZSBvbmx5IHVzZSB0aGUgdmlk
ZW8KZm9ybWF0IGNvbnZlcnQoTUlQSSB0byBEUCkgZmVhdHVyZSBvbiBhbng3NjI1Lgo+IAo+IAo+
IEhhdmluZyB0aGlzIGluZm9ybWF0aW9uIEkgdHJ5IHRvIHVuZGVyc3RhbmQgcG9ydHMgZGVmaW5l
ZCBieSB5b3U6Cj4gCj4gLSBwb3J0QDIgeW91IGhhdmUgZGVmaW5lZCBhcyBwb2ludGluZyB0byBl
eHRlcm5hbCBwb3J0LCBidXQgaGVyZSB0aGUKPiBwb3J0IHNob3VsZCBiZSByYXRoZXIgc3Vibm9k
ZSBvZiBBTlg3NjI1IC0gdGhlIGNoaXAgaGFzIENDIGxpbmVzLCBzZWUKPiBiZWdpbm5pbmcgb2Yg
WzJdLgpUaGUgcG9ydEAyIGlzIGZvciBDaHJvbWl1bSBib29rIGV4dGVybmFsIHBvcnQgbG93IHBv
d2VyIG1vZGUgY29udHJvbCwKdGhlIGRyaXZlciBhY2NvcmRpbmcgdGhpcyBwb3J0IHRvIHJlZ2lz
dGVyIGV4dGVybmFsIGNvbm5lY3Rvcgpub3RpZnkgaW50ZXJmYWNlIHRvIHJlY2VpdmUgImNvbm5l
Y3QvZGlzY29ubmVjdCIgZXZlbnQgdG8gZG8gbG93IHBvd2VyCmNvbnRyb2wuCj4gCj4gLSBwb3J0
QDMgZGVzY3JpYmVzIFNTMSwgU1MyIGFuZCBTQlUvQVVYIGxpbmVzIHRvZ2V0aGVyLCBhbSBJIHJp
Z2h0PyBJbgo+IFVTQi1DIGJpbmRpbmcgU0JVIGFuZCBTUyBsaW5lcyBhcmUgcmVwcmVzZW50ZWQg
YnkgZGlmZmVyZW50IHBvcnRzLAo+IGRpZmZlcmVudCBhcHByb2FjaCwgYnV0IG1heWJlIGJldHRl
ciBpbiB0aGlzIGNhc2UuCj4gCj4gCj4gTWF5YmUgaXQgd291bGQgYmUgZ29vZCB0byBhZGQgMm5k
IGV4YW1wbGUgd2l0aCBVU0ItQyBwb3J0LgpObyBuZWVkIHRvIGFkZCAybmQgZXhhbXBsZSB3aXRo
IFVTQi1DIHBvcnQsIGFzIEkgc2FpZCwgd2UgZGlkbid0IHVzZSB0aGUKVVNCIFR5cGUtQyBQRCBm
ZWF0dXJlIGF0IGFueDc2MjUuCj4gCj4gCj4gWzFdOgo+IGh0dHBzOi8vd3d3LmFuYWxvZ2l4LmNv
bS9zeXN0ZW0vZmlsZXMvQUEtMDAyMjkxLVBCLTYtQU5YNzYyNV9Qcm9kdWN0QnJpZWYucGRmCj4g
Cj4gWzJdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1j
b25uZWN0b3IudHh0Cj4gCj4gCj4gUmVnYXJkcwo+IAo+IEFuZHJ6ZWoKPiAKPiAKPiA+ICsKPiA+
ICtyZXF1aXJlZDoKPiA+ICsgIC0gIiNhZGRyZXNzLWNlbGxzIgo+ID4gKyAgLSAiI3NpemUtY2Vs
bHMiCj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIHBvcnRAMAo+ID4g
KyAgLSBwb3J0QDMKPiA+ICsKPiA+ICtleGFtcGxlOgo+ID4gKyAgLSB8Cj4gPiArICAgIGFueDc2
MjVfYnJpZGdlOiBlbmNvZGVyQDU4IHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9n
aXgsYW54NzYyNSI7Cj4gPiArICAgICAgICByZWcgPSA8MHg1OD47Cj4gPiArICAgICAgICBzdGF0
dXMgPSAib2theSI7Cj4gPiArICAgICAgICBwYW5lbC1mbGFncyA9IDwxPjsKPiA+ICsgICAgICAg
IGVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gKyAgICAgICAg
cmVzZXQtZ3Bpb3MgPSA8JnBpbyA3MyBHUElPX0FDVElWRV9ISUdIPjsKPiA+ICsgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiAr
Cj4gPiArICAgICAgICBwb3J0QDAgewo+ID4gKyAgICAgICAgICByZWcgPSA8MD47Cj4gPiArICAg
ICAgICAgIGFueF8xX2luOiBlbmRwb2ludCB7Cj4gPiArICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZtaXBpX2RzaT47Cj4gPiArICAgICAgICAgIH07Cj4gPiArICAgICAgICB9Owo+ID4g
Kwo+ID4gKyAgICAgICAgcG9ydEAzIHsKPiA+ICsgICAgICAgICAgcmVnID0gPDM+Owo+ID4gKyAg
ICAgICAgICBhbnhfMV9vdXQ6IGVuZHBvaW50IHsKPiA+ICsgICAgICAgICAgICByZW1vdGUtZW5k
cG9pbnQgPSA8JnBhbmVsX2luPjsKPiA+ICsgICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4g
PiArICAgIH07Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
