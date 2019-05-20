Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C922BB9
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 08:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916EE891BA;
	Mon, 20 May 2019 06:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A507891BA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:02:07 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4719.eurprd08.prod.outlook.com (10.255.115.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 06:02:04 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 06:02:04 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [v2] drm/komeda: fixing of DMA mapping sg segment warning
Thread-Topic: [v2] drm/komeda: fixing of DMA mapping sg segment warning
Thread-Index: AQHVDtGMYTV2kzYsOkmwOrRFiUsaNg==
Date: Mon, 20 May 2019 06:02:04 +0000
Message-ID: <20190520060158.GA2547@james-ThinkStation-P300>
References: <1554971813-22049-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1554971813-22049-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07946016-880c-4ce9-6237-08d6dce8aecf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4719; 
x-ms-traffictypediagnostic: VE1PR08MB4719:
x-ms-exchange-purlcount: 4
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB47192351F5CCCFB570830AA4B3060@VE1PR08MB4719.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(71200400001)(9686003)(71190400001)(6512007)(14444005)(256004)(6636002)(58126008)(26005)(229853002)(11346002)(476003)(2906002)(486006)(6486002)(54906003)(6436002)(6306002)(33716001)(53936002)(8936002)(6116002)(66066001)(66946007)(66476007)(7736002)(64756008)(3846002)(102836004)(305945005)(66556008)(55236004)(99286004)(52116002)(33656002)(316002)(6862004)(8676002)(6246003)(446003)(66446008)(73956011)(5660300002)(25786009)(4326008)(14454004)(86362001)(76176011)(186003)(81166006)(1076003)(386003)(6506007)(966005)(478600001)(81156014)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4719;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r6zUFDGEzwJvwIqgq+aKYrPWyX9e0Zyd/iLvLu1Kq+0roWMPkGSMUwMdFxgNiNFv4zMZVP8ZCXEogoAi/BYLG2wdZMyuUXy6SKaIt/Ex3eGCZaei/O/rMeXjKP2oSaPDRyfM/Akk8r9LJ08v8Kk64pTi9t3SjpsNZ92y5O41hgu0BwD39dHnKcYPeB3y0tVpgOUPICchc/+ugmYawuPJ3MgN5O+qbpsW1DgGedog4+5HnrYfYc3DFLtNnisE2dMMqgaiwA2bwh9q7ApnXIQ4rv3ebOFd4Id6KVrxS7f1ZW6vdsjzC9R0+9YRGQfphjRwGhda1lO1uJ0vx7lhAk2TT6bPIHOzAK998JEwTkTMXJKHhFmIubSbbwmP5KwUsbsCxxa6uGeXLCA2gPSl5eZC3vcoPRxtaz9RQcPQCtasFyU=
Content-ID: <D20C1DA5A994F84B8FE9744CA37FBE88@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07946016-880c-4ce9-6237-08d6dce8aecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 06:02:04.5412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izGjinr7pKrb/qL+eP2aMK3XxZzrnl7BtqT6bn9OMzo=;
 b=SfxFmR39kr7XlrxuC/DOTYyXs3NBDR5osI2hWcu2W5321hDrlKpQFIn0QwWTOBHp+vi1wbm5qK+NJerD2aA3MrxVV49vhacXBEL7u+6XnqQMB+6QNxYMXlQgUVhoWPulm8arZpM5FW87An8VkSDzxb1w4kuz+ym17RM1ZHhLD5Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDg6Mzc6MTNBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGaXhpbmcgdGhlIERNQSBtYXBwaW5nIHNnIHNlZ21l
bnQgd2FybmluZywgd2hpY2ggc2hvd3MgIkRNQS1BUEk6IG1hcHBpbmcKPiBzZyBzZWdtZW50IGxv
bmdlciB0aGFuIGRldmljZSBjbGFpbXMgdG8gc3VwcG9ydCBbbGVuPTkyMTYwMF0gW21heD02NTUz
Nl0iLgo+IEZpeGVkIGJ5IHNldHRpbmcgdGhlIG1heCBzZWdtZW50IHNpemUgYXQgS29tZWRhIGRy
aXZlci4KPiAKPiBUaGlzIHBhdGNoIGRlcGVuZHMgb246Cj4gLSBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzU0NDQ4Lwo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy81NDQ0OS8KPiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNTQ0NTAvCj4gLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzU4OTc2Lwo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBBZGRzIG1lbWJlciBkZXNj
cmlwdGlvbgo+IC0gQWRkcyBwYXRjaCBkZW5wZW5kZW5jeSBpbiB0aGUgY29tbWVudAo+IAo+IFNp
Z25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFy
bS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5jIHwgNCArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+
IC0tIAo+IDEuOS4xCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmMKPiBpbmRleCA3ZjI1ZTZhLi5iNDkwMmFlIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiBAQCAtOCw2ICs4
LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
b2ZfZ3JhcGguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5j
bHVkZSA8bGludXgvZG1hLWlvbW11Lmg+Cj4gICNpZmRlZiBDT05GSUdfREVCVUdfRlMKPiAgI2lu
Y2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4g
QEAgLTI0NSw2ICsyNDYsOSBAQCBzdHJ1Y3Qga29tZWRhX2RldiAqa29tZWRhX2Rldl9jcmVhdGUo
c3RydWN0IGRldmljZSAqZGV2KQo+ICAJCWdvdG8gZXJyX2NsZWFudXA7Cj4gIAl9Cj4gIAo+ICsJ
ZGV2LT5kbWFfcGFybXMgPSAmbWRldi0+ZG1hX3Bhcm1zOwo+ICsJZG1hX3NldF9tYXhfc2VnX3Np
emUoZGV2LCBETUFfQklUX01BU0soMzIpKTsKPiArCj4gIAllcnIgPSBzeXNmc19jcmVhdGVfZ3Jv
dXAoJmRldi0+a29iaiwgJmtvbWVkYV9zeXNmc19hdHRyX2dyb3VwKTsKPiAgCWlmIChlcnIpIHsK
PiAgCQlEUk1fRVJST1IoImNyZWF0ZSBzeXNmcyBncm91cCBmYWlsZWQuXG4iKTsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+IGluZGV4IDI5
ZTAzYzQuLjgzYWNlNzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kZXYuaAo+IEBAIC0xNDksNiArMTQ5LDggQEAgc3RydWN0IGtvbWVkYV9k
ZXYgewo+ICAJc3RydWN0IGRldmljZSAqZGV2Owo+ICAJLyoqIEByZWdfYmFzZTogdGhlIGJhc2Ug
YWRkcmVzcyBvZiBrb21lZGEgaW8gc3BhY2UgKi8KPiAgCXUzMiBfX2lvbWVtICAgKnJlZ19iYXNl
Owo+ICsJLyoqIEBkbWFfcGFybXM6IHRoZSBkbWEgcGFyYW1ldGVycyBvZiBrb21lZGEgKi8KPiAr
CXN0cnVjdCBkZXZpY2VfZG1hX3BhcmFtZXRlcnMgZG1hX3Bhcm1zOwo+ICAKPiAgCS8qKiBAY2hp
cDogdGhlIGJhc2ljIGNoaXAgaW5mb3JtYXRpb24gKi8KPiAgCXN0cnVjdCBrb21lZGFfY2hpcF9p
bmZvIGNoaXA7CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
