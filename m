Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA522BC6
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 08:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552D891BA;
	Mon, 20 May 2019 06:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3D891BA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:03:44 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4832.eurprd08.prod.outlook.com (10.255.113.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 20 May 2019 06:03:41 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 06:03:41 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [v2] drm/komeda: Creates plane alpha and blend mode properties
Thread-Topic: [v2] drm/komeda: Creates plane alpha and blend mode properties
Thread-Index: AQHVDtHFUO59T3T3VkWZqubG8mkPOA==
Date: Mon, 20 May 2019 06:03:40 +0000
Message-ID: <20190520060334.GA2690@james-ThinkStation-P300>
References: <1554971844-22101-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1554971844-22101-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:203:2e::16) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7068d6b7-f7be-4ac4-2d18-08d6dce8e844
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4832; 
x-ms-traffictypediagnostic: VE1PR08MB4832:
x-ms-exchange-purlcount: 3
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB48327FF72C4B9192DDDC1865B3060@VE1PR08MB4832.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(8936002)(6862004)(6506007)(52116002)(99286004)(4326008)(68736007)(316002)(966005)(54906003)(53936002)(86362001)(58126008)(478600001)(386003)(6436002)(6306002)(55236004)(9686003)(305945005)(486006)(7736002)(5660300002)(11346002)(6246003)(14454004)(476003)(66066001)(102836004)(446003)(76176011)(6512007)(66476007)(66556008)(73956011)(64756008)(66446008)(25786009)(81156014)(81166006)(2906002)(256004)(66946007)(33656002)(3846002)(6116002)(186003)(6486002)(71190400001)(6636002)(26005)(229853002)(8676002)(33716001)(71200400001)(1076003)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4832;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qIGSsB0OKNsvp1XCbKtVvYOsCUZKr5HuLKVqS+oP/81f6PsOFz1I1nsDnEozeMDMYNbWdwSnHVAlXwFSCHE8YEsvx5gzSy7sim0GD8CiYAv+FjxV7TpzaO6dZTYCZXRR1vsdbRMyGpeg/gTqZLCkg7b5mciiA38KAC/baGJeFe1NSzL6jDn2uaF55pCnkguozkmsX6I07scPjqCm8N5cEzhP9Q36ouYI2zLRfgVChI2lgAoH2yM0ZokwRhD+uMv4564vdI3tzRoWm41gLDcF8d1Y9Jx0jlK0YOHCsdk/F0bwwoKy1oIStB+syW7WAnM8VcTeHIJCHGRQC1lRBoOanFa1VV8IQME5HEdDePQb7CMn8zMGURGv9H+TsB/I4eM3ZWBmX0jbSimtVszt5sg21/B1WHtFMJiON7UH6gBbpsk=
Content-ID: <0431D2006ACF2543B05189EAD3AC6BCB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7068d6b7-f7be-4ac4-2d18-08d6dce8e844
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 06:03:40.9917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4832
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLfpWUZDJSUEKFO8mAY8uLihx9jQzdbYjAS15FSkWAE=;
 b=qjRpQRZ8Cie6IhIbgbq7zUP9An3uSQvDhxcSybl3YlDRbcoP/SMjafSTKMu1+a46wrhkZZKXOUz59Z6tMi1vosJGk64ZlcxQLana/ncNj9dpeilEAsiLGR70jOvw7ohpFjCB4kw9kIRArTPtJ5Rh8wQmeNK3JbPYh5qpczOL30M=
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

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDg6Mzc6NDNBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBDcmVhdGVzIHBsYW5lIGFscGhhIGFuZCBibGVuZCBt
b2RlIHByb3BlcnRpZXMgYXR0YWNoZWQgdG8gcGxhbmUuCj4gCj4gVGhpcyBwYXRjaCBkZXBlbmRz
IG9uOgo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81NDQ0OC8K
PiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTQ0NDkvCj4gLSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU0NDUwLwo+IAo+IENoYW5n
ZXMgc2luY2UgdjE6Cj4gLSBBZGRzIHBhdGNoIGRlbnBlbmRlbmN5IGluIHRoZSBjb21tZW50Cj4g
Cj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnku
bGlAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGxhbmUuYyB8IDExICsrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspCj4gCj4gLS0gCj4gMS45LjEKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBpbmRleCA2OGNkMmM5ZS4uYWFlNWU4
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGxhbmUuYwo+IEBAIC0yMjAsNiArMjIwLDE3IEBAIHN0YXRpYyBpbnQga29tZWRhX3BsYW5l
X2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCj4gIAlkcm1fcGxhbmVfaGVscGVy
X2FkZChwbGFuZSwgJmtvbWVkYV9wbGFuZV9oZWxwZXJfZnVuY3MpOwo+ICAKPiArCWVyciA9IGRy
bV9wbGFuZV9jcmVhdGVfYWxwaGFfcHJvcGVydHkocGxhbmUpOwo+ICsJaWYgKGVycikKPiArCQln
b3RvIGNsZWFudXA7Cj4gKwo+ICsJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3By
b3BlcnR5KHBsYW5lLAo+ICsJCQlCSVQoRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkgfAo+ICsJ
CQlCSVQoRFJNX01PREVfQkxFTkRfUFJFTVVMVEkpICAgfAo+ICsJCQlCSVQoRFJNX01PREVfQkxF
TkRfQ09WRVJBR0UpKTsKPiArCWlmIChlcnIpCj4gKwkJZ290byBjbGVhbnVwOwo+ICsKPiAgCXJl
dHVybiAwOwo+ICBjbGVhbnVwOgo+ICAJa29tZWRhX3BsYW5lX2Rlc3Ryb3kocGxhbmUpOwoKTG9v
a3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9s
b2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
