Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCDD5C24
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB826E0EE;
	Mon, 14 Oct 2019 07:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680111.outbound.protection.outlook.com [40.107.68.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCB96E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 03:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAc6Edn65vggOx6qEpftT5WUa+vD5pHw55GYOwuAalLMgAo+Qrmfd4F8aj+UkjXRIXX+IDBsHH/0tW8y5kEXPrRLwdtLvE0LQtiV5nSbIo+jjp+aw/p+6l1vPF7AufmWY+wnk1CSrHBxuuYLkFqwUJn3FM8y3/nL65R06lTtoBeqYG3oePqr4HjEoKqcC3frOedeC8siUvla0xZllg8r25SdaYf2aE4jiC8ss3aNeaDKKQGUfo/DcPELxHCJVcOS6b6BxNcXxn97tjXtp1oNhRsNfU1l2WqyXYy+hiOWiU1d0HF6KVKQWhLNyM+iZwjFMg8PdmIResgV0xtF/nVXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHwvHJRgFuXHx1ZnddkkpCbKvQFCt0c/f0/1IeqLROU=;
 b=cOBmKFO2CpKyUsiGKg4Ia4N06F3hOIizLTQHfbxfa73WLSL8XzdDgYZL9MfRz0c+LRKFazmCbtyIYoNtyixpuyxverKGlSseDNKlh3L9s3PVZGb9L6GlVKCMww6PkaUNtRWu7Lh7Z0P/v1CAJtbkcZGgbnwDwXIt35d+TRMcqb3cmdV+kyf0yTH/+Ms0g1NncZ9U32x9zo7Fhycb4rIaow/9DxmSyvKaUQYixwUZpTdgfRZpJdA9tyfRpccqsVvXfRwEeIdAXQ2EzUVOcFHNq8pprmlZJo/W46Kig4a1qZPgqH5A5OgC5Y08YVst2gZOqAUE9eKXfD4+DDcfRcQK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4512.namprd04.prod.outlook.com (52.135.120.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 03:02:48 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 03:02:48 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVf9qi2ZQPn8IAhkqsNtop++SEM6dVTGmAgAAZ3gCABBGvAA==
Date: Mon, 14 Oct 2019 03:02:48 +0000
Message-ID: <20191014030238.GB2390@xin-VirtualBox>
References: <cover.1570760115.git.xji@analogixsemi.com>
 <CGME20191011022154epcas3p1a719423a23f8bf193b6136e853e66b04@epcas3p1.samsung.com>
 <75bb8a47d2c3c1f979c6d62158c21988b846e79b.1570760115.git.xji@analogixsemi.com>
 <3c6067de-9f3c-b93c-f263-fa5dd09c3270@samsung.com>
 <20191011125418.GE4882@pendragon.ideasonboard.com>
In-Reply-To: <20191011125418.GE4882@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0179.apcprd02.prod.outlook.com
 (2603:1096:201:21::15) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc7ed789-407d-4966-a3bb-08d75052fe7c
x-ms-traffictypediagnostic: SN6PR04MB4512:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4512A113D000E6233E5D8A96C7900@SN6PR04MB4512.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(39840400004)(376002)(396003)(346002)(366004)(189003)(199004)(99286004)(54906003)(9686003)(6306002)(33656002)(26005)(7736002)(186003)(8936002)(6512007)(52116002)(25786009)(6486002)(229853002)(386003)(6506007)(53546011)(2906002)(76176011)(1076003)(6436002)(102836004)(446003)(6916009)(11346002)(256004)(8676002)(14444005)(7416002)(71200400001)(478600001)(71190400001)(81156014)(107886003)(4326008)(86362001)(33716001)(81166006)(66556008)(64756008)(66446008)(966005)(305945005)(66066001)(316002)(66946007)(66476007)(14454004)(476003)(5660300002)(6116002)(486006)(3846002)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4512;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yjI0/kAxIdrhFFxiN6pcGWOi8rYc9Jj+2srWwcAWoaSxEKE/AsCTGh1MD6FX/vzMrsC4diF2EOJVc1sDxpyfNcjdWx25UWKH6cFZmOpIL9f14wuCQvnOpkxqHtDDQUbgocHem9re2ncieesMuajQ6CKefIF0KIJ4TYUm5dHdGcP1lV7uR0JD0n9FxioaiZb5cnxlpJvqMZRfwMtF3Il6hcnX/HxW0a8obloGA8QrUn48E1r6Sl+Bg0TFkMeUHtRGfbGDQOKemylDUXj7WnJ9OCnnqYbWmN71ERLoIyC6aD0R+QL/A6/gXc9EtQtnuSseUr9hku7+LvmDhlW28eyfoakapepaXSyjASGpvHzk905zLblLXqRIyDsdeI8/ZbthOCJA3hg7sZDXugwE0fHwFhWtB8VadYbOuJO1nrHqWG3kY+6SoztxMwhSG+FLaXxZfgNLDJX73DEhVhyGymJd+w==
Content-ID: <D47E5064666E4E4C9B07F0792B572D1F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7ed789-407d-4966-a3bb-08d75052fe7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 03:02:48.6963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TaweKUWg0Hm8TqrKDnwRV8kbVAO4ZUxD2PVAYE+iyB72uzZieQ8/FbSlvbm4a980bDB0GsF3AX6FMb4evFpI8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4512
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHwvHJRgFuXHx1ZnddkkpCbKvQFCt0c/f0/1IeqLROU=;
 b=NzNpjR+XlOR4ZkY+JrQOnoaKeKg/EMsnMXprD/0r2qozot1e5QyD799uxQN9CyNEWxrF0nZ4TrsYMT0a07qjBjX4awF2jShmdEQfSf8V9NKHxl0yohmxBdGUwU6bqc/DuN8VaxGmxUeekspaFDnF/g9bhg9ee0ZTMvKCihSUlDg=
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

SGkgTGF1cmVudCBQaW5jaGFydCwgcGxlYXNlIGNoZWNrIG15IGNvbW1lbnQgYmVsb3cuCgpUaGFu
a3MsClhpbgoKT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDM6NTQ6MThQTSArMDMwMCwgTGF1cmVu
dCBQaW5jaGFydCB3cm90ZToKPiBIaSBBbmRyemVqLAo+IAo+IE9uIEZyaSwgT2N0IDExLCAyMDE5
IGF0IDAxOjIxOjQzUE0gKzAyMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gPiBPbiAxMS4xMC4y
MDE5IDA0OjIxLCBYaW4gSmkgd3JvdGU6Cj4gPiA+IFRoZSBBTlg3NjI1IGlzIGFuIHVsdHJhLWxv
dyBwb3dlciA0SyBNb2JpbGUgSEQgVHJhbnNtaXR0ZXIgZGVzaWduZWQKPiA+ID4gZm9yIHBvcnRh
YmxlIGRldmljZS4gSXQgY29udmVydHMgTUlQSSB0byBEaXNwbGF5UG9ydCAxLjMgNEsuCj4gPiA+
Cj4gPiA+IFlvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBib2FyZCB3aXRoIGJpbmRpbmcuCj4g
PiA+Cj4gPiA+IEV4YW1wbGU6Cj4gPiA+IAlhbng3NjI1X2JyaWRnZTogZW5jb2RlckA1OCB7Cj4g
PiA+IAkJY29tcGF0aWJsZSA9ICJhbmFsb2dpeCxhbng3NjI1IjsKPiA+ID4gCQlyZWcgPSA8MHg1
OD47Cj4gPiA+IAkJc3RhdHVzID0gIm9rYXkiOwo+ID4gPiAJCXBhbmVsLWZsYWdzID0gPDE+Owo+
ID4gPiAJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gPiAJ
CXJlc2V0LWdwaW9zID0gPCZwaW8gNzMgR1BJT19BQ1RJVkVfSElHSD47Cj4gPiA+IAkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4gPiA+IAkJI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+Cj4gPiA+IAkJ
cG9ydEAwIHsKPiA+ID4gCQkgIHJlZyA9IDwwPjsKPiA+ID4gCQkgIGFueF8xX2luOiBlbmRwb2lu
dCB7Cj4gPiA+IAkJICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9kc2k+Owo+ID4gPiAJCSAg
fTsKPiA+ID4gCQl9Owo+ID4gPgo+ID4gPiAJCXBvcnRAMyB7Cj4gPiA+IAkJICByZWcgPSA8Mz47
Cj4gPiA+IAkJICBhbnhfMV9vdXQ6IGVuZHBvaW50IHsKPiA+ID4gCQkgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZwYW5lbF9pbj47Cj4gPiA+IAkJICB9Owo+ID4gPiAJCX07Cj4gPiA+IAl9Owo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgo+ID4g
PiAtLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwgICAg
ICAgICAgIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDk2IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvYW54NzYyNS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gPiBpbmRleCAwMDAwMDAwLi5mYzg0NjgzCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2
MjUueWFtbAo+ID4gPiBAQCAtMCwwICsxLDk2IEBACj4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ICsjIENvcHlyaWdodCAyMDE5
IEFuYWxvZ2l4IFNlbWljb25kdWN0b3IsIEluYy4KPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiArLS0t
Cj4gPiA+ICskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2JyaWRn
ZS9hbng3NjI1LnlhbWwjIgo+ID4gPiArJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIyIKPiA+ID4gKwo+ID4gPiArdGl0bGU6IEFuYWxvZ2l4IEFO
WDc2MjUgU2xpbVBvcnQgKDRLIE1vYmlsZSBIRCBUcmFuc21pdHRlcikKPiA+ID4gKwo+ID4gPiAr
bWFpbnRhaW5lcnM6Cj4gPiA+ICsgIC0gWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4KPiA+
ID4gKwo+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4gKyAgVGhlIEFOWDc2MjUgaXMgYW4gdWx0
cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRlcgo+ID4gPiArICBkZXNpZ25lZCBm
b3IgcG9ydGFibGUgZGV2aWNlcy4KPiA+ID4gKwo+ID4gPiArcHJvcGVydGllczoKPiA+ID4gKyAg
IiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQo+ID4gPiArICAiI3NpemUtY2VsbHMiOiB0cnVlCj4gPiA+
ICsKPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4gKyAgICBpdGVtczoKPiA+ID4gKyAgICAgIC0g
Y29uc3Q6IGFuYWxvZ2l4LGFueDc2MjUKPiA+ID4gKwo+ID4gPiArICByZWc6Cj4gPiA+ICsgICAg
bWF4SXRlbXM6IDEKPiA+ID4gKwo+ID4gPiArICBwYW5lbC1mbGFnczoKPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjogaW5kaWNhdGUgdGhlIHBhbmVsIGlzIGludGVybmFsIG9yIGV4dGVybmFsCj4gPiA+
ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4gKwo+ID4gPiArICBpbnRlcnJ1cHRzOgo+ID4gPiArICAg
IG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+ID4gKyAgZW5hYmxlLWdwaW9zOgo+ID4gPiArICAgIGRl
c2NyaXB0aW9uOiB1c2VkIGZvciBwb3dlciBvbiBjaGlwIGNvbnRyb2wsIFBPV0VSX0VOIHBpbiBE
Mi4KPiA+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gPiArCj4gPiA+ICsgIHJlc2V0LWdwaW9zOgo+
ID4gPiArICAgIGRlc2NyaXB0aW9uOiB1c2VkIGZvciByZXNldCBjaGlwIGNvbnRyb2wsIFJFU0VU
X04gcGluIEI3Lgo+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+ID4gKyAgcG9ydEAw
Ogo+ID4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPiAr
ICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBEU0kgaG9zdCBwb3J0IG5vZGUuCj4g
PiA+ICsKPiA+ID4gKyAgcG9ydEAxOgo+ID4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gPiArICAg
IGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gTUlQSSBE
UEkgaG9zdCBwb3J0IG5vZGUuCj4gPiA+ICsKPiA+ID4gKyAgcG9ydEAyOgo+ID4gPiArICAgIHR5
cGU6IG9iamVjdAo+ID4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgQSBwb3J0IG5v
ZGUgcG9pbnRpbmcgdG8gZXh0ZXJuYWwgY29ubmVjdG9yIHBvcnQgbm9kZS4KPiA+ID4gKwo+ID4g
PiArICBwb3J0QDM6Cj4gPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiA+ICsgICAgZGVzY3JpcHRp
b246Cj4gPiA+ICsgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBlRFAgcG9ydCBub2RlLgo+
ID4gCj4gPiAKPiA+IERlY3J5cHRpbmcgYXZhaWxhYmxlIHByb2R1Y3QgYnJpZWZbMV0sIHRoZXJl
IGFyZSBmb2xsb3dpbmcgcGh5c2ljYWwgbGluZXM6Cj4gPiAKPiA+IElucHV0Ogo+ID4gCj4gPiAt
IE1JUEkgRFNJL0RQSSAtIHZpZGVvIGRhdGEsIGFyZSBEU0kgYW5kIERQSSBsaW5lcyBzaGFyZWQ/
Cj4gCj4gSXQgd291bGQgYmUgbXVjaCBlYXNpZXIgaWYgd2UgY291bGQgaGF2ZSBhY2Nlc3MgdG8g
bW9yZSBjb21wbGV0ZQo+IGluZm9ybWF0aW9uLiBJIGJlbGlldmUgdGhlIERTSSBhbmQgRFBJIHBp
bnMgY291bGQgYmUgbXV4ZWQsIGJ1dCB0aGVyZQo+IHNob3VsZCBiZSBtb3JlIERQSSBwaW5zIHRo
YW4gRFNJIHBpbnMuClllcyBEUEkgcGlucyBtb3JlIHRoYW4gRFNJIHBpbnMuCj4gCj4gPiAKPiA+
IC0gSTJTIC0gYXVkaW8gZGF0YSwKPiA+IAo+ID4gLSBJMkMgLSBjb250cm9sIGxpbmUsCj4gPiAK
PiA+IC0gQUxFUlQvSU5UUCAtIGludGVycnVwdCwKPiA+IAo+ID4gLSBVU0IgMy4xIFNTUmMvVHgg
LSBmb3IgVVNCIGZvcndhcmRpbmcsCj4gPiAKPiA+IE91dHB1dDoKPiA+IAo+ID4gLSBTUzEsIFNT
MiwKPiA+IAo+ID4gLSBTQlUvQVVYLAo+ID4gCj4gPiAtIENDMS8yLgo+ID4gCj4gPiAKPiA+IEhh
dmluZyB0aGlzIGluZm9ybWF0aW9uIEkgdHJ5IHRvIHVuZGVyc3RhbmQgcG9ydHMgZGVmaW5lZCBi
eSB5b3U6Cj4gPiAKPiA+IC0gcG9ydEAyIHlvdSBoYXZlIGRlZmluZWQgYXMgcG9pbnRpbmcgdG8g
ZXh0ZXJuYWwgcG9ydCwgYnV0IGhlcmUgdGhlCj4gPiBwb3J0IHNob3VsZCBiZSByYXRoZXIgc3Vi
bm9kZSBvZiBBTlg3NjI1IC0gdGhlIGNoaXAgaGFzIENDIGxpbmVzLCBzZWUKPiA+IGJlZ2lubmlu
ZyBvZiBbMl0uCj4gPiAKPiA+IC0gcG9ydEAzIGRlc2NyaWJlcyBTUzEsIFNTMiBhbmQgU0JVL0FV
WCBsaW5lcyB0b2dldGhlciwgYW0gSSByaWdodD8gSW4KPiA+IFVTQi1DIGJpbmRpbmcgU0JVIGFu
ZCBTUyBsaW5lcyBhcmUgcmVwcmVzZW50ZWQgYnkgZGlmZmVyZW50IHBvcnRzLAo+ID4gZGlmZmVy
ZW50IGFwcHJvYWNoLCBidXQgbWF5YmUgYmV0dGVyIGluIHRoaXMgY2FzZS4KPiAKPiBJIGJlbGll
dmUgdGhhdCwgd2hlbiBjb25uZWN0ZWQgdG8gYSBEUCBkaXNwbGF5IChlaXRoZXIgRFAgb3IgZURQ
KSwgdGhlCj4gRGlzcGxheVBvcnQgc2lnbmFscyBhcmUgb3V0cHV0IG9uIFNTMSBhbmQvb3IgU1My
LiBJIHRoaXMgcmVhbGx5IHdvbmRlcgo+IGlmIHdlIG5lZWQgdHdvIHNlcGFyYXRlIHBvcnRzIGZv
ciB0aGlzLCBpdCBzZWVtcyB0aGF0IHBvcnRAMiBhbmQgcG9ydEAzCj4gc2hvdWxkIGJlIG1lcmdl
ZC4KT0ssIEkgd2lsbCBtZXJnZSB0aGUgcG9ydEAyIGFuZCBwb3J0QDMsIGFuZCB1c2UgYSBmbGFn
IHRvIGluZGljYXRlCndoZXRoZXIgdGhlIGNvbnRyb2wgaXMgZXh0ZXJuYWwgY29ubmVjdG9yIGNv
bnRyb2wgb3Igbm90Lgo+IAo+ID4gTWF5YmUgaXQgd291bGQgYmUgZ29vZCB0byBhZGQgMm5kIGV4
YW1wbGUgd2l0aCBVU0ItQyBwb3J0Lgo+IAo+IFRoYXQgd291bGQgaGVscCB3aXRoIHRoZSBkaXNj
dXNzaW9uLCB5ZXMuCkFzIHdlIGRpc2FibGVkIFVTQi1DIGZlYXR1cmUgaW4gYW54NzYyNSwgd2Ug
Y2Fubm90IGRlZmluZSBhIFVTQi1DIHBvcnQuCj4gCj4gPiBbMV06Cj4gPiBodHRwczovL3d3dy5h
bmFsb2dpeC5jb20vc3lzdGVtL2ZpbGVzL0FBLTAwMjI5MS1QQi02LUFOWDc2MjVfUHJvZHVjdEJy
aWVmLnBkZgo+ID4gCj4gPiBbMl06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
b25uZWN0b3IvdXNiLWNvbm5lY3Rvci50eHQKPiA+IAo+ID4gPiArCj4gPiA+ICtyZXF1aXJlZDoK
PiA+ID4gKyAgLSAiI2FkZHJlc3MtY2VsbHMiCj4gPiA+ICsgIC0gIiNzaXplLWNlbGxzIgo+ID4g
PiArICAtIGNvbXBhdGlibGUKPiA+ID4gKyAgLSByZWcKPiA+ID4gKyAgLSBwb3J0QDAKPiA+ID4g
KyAgLSBwb3J0QDMKPiA+ID4gKwo+ID4gPiArZXhhbXBsZToKPiA+ID4gKyAgLSB8Cj4gPiA+ICsg
ICAgYW54NzYyNV9icmlkZ2U6IGVuY29kZXJANTggewo+ID4gPiArICAgICAgICBjb21wYXRpYmxl
ID0gImFuYWxvZ2l4LGFueDc2MjUiOwo+ID4gPiArICAgICAgICByZWcgPSA8MHg1OD47Cj4gPiA+
ICsgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ID4gKyAgICAgICAgcGFuZWwtZmxhZ3MgPSA8
MT47Cj4gPiA+ICsgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IEdQSU9fQUNUSVZFX0hJ
R0g+Owo+ID4gPiArICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDczIEdQSU9fQUNUSVZFX0hJ
R0g+Owo+ID4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ID4gKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgcG9ydEAwIHsKPiA+ID4g
KyAgICAgICAgICByZWcgPSA8MD47Cj4gPiA+ICsgICAgICAgICAgYW54XzFfaW46IGVuZHBvaW50
IHsKPiA+ID4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9kc2k+Owo+ID4g
PiArICAgICAgICAgIH07Cj4gPiA+ICsgICAgICAgIH07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
cG9ydEAzIHsKPiA+ID4gKyAgICAgICAgICByZWcgPSA8Mz47Cj4gPiA+ICsgICAgICAgICAgYW54
XzFfb3V0OiBlbmRwb2ludCB7Cj4gPiA+ICsgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8
JnBhbmVsX2luPjsKPiA+ID4gKyAgICAgICAgICB9Owo+ID4gPiArICAgICAgICB9Owo+ID4gPiAr
ICAgIH07Cj4gCj4gLS0gCj4gUmVnYXJkcywKPiAKPiBMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
