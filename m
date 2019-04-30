Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0551F132
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2847989444;
	Tue, 30 Apr 2019 07:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A71889444
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:21:25 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4877.eurprd08.prod.outlook.com (10.255.113.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 07:21:22 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::6841:2153:b91f:759]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::6841:2153:b91f:759%4]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 07:21:22 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [v1,1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Topic: [v1,1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Index: AQHU/yVQOcJma0mqM0egze7YrU4xXw==
Date: Tue, 30 Apr 2019 07:21:22 +0000
Message-ID: <20190430072111.GA8277@james-ThinkStation-P300>
References: <1555902945-2877-2-git-send-email-lowry.li@arm.com>
In-Reply-To: <1555902945-2877-2-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d933466-9c70-42b4-8e1a-08d6cd3c7288
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4877; 
x-ms-traffictypediagnostic: VE1PR08MB4877:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4877F1521F656AF617EC455AB33A0@VE1PR08MB4877.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:111;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(376002)(346002)(136003)(39860400002)(396003)(366004)(199004)(189003)(478600001)(6862004)(316002)(86362001)(11346002)(26005)(14454004)(4326008)(53936002)(14444005)(6636002)(446003)(66066001)(54906003)(58126008)(6512007)(186003)(52116002)(256004)(9686003)(6246003)(476003)(102836004)(76176011)(99286004)(55236004)(25786009)(386003)(1076003)(6506007)(33656002)(7736002)(97736004)(73956011)(6116002)(305945005)(229853002)(64756008)(66556008)(68736007)(66946007)(3846002)(2906002)(8936002)(81156014)(6486002)(6436002)(8676002)(33716001)(5660300002)(66446008)(81166006)(71200400001)(486006)(66476007)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4877;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SpF7GCiNaNKBw5CNueMBc3QeZktIaMFupIxnKTLMI0F6OQcfSvOFAavqq+ucNrd5er8+Pz7kGsdVYHrRtrp8DyQnxneDxceod/1xGWtVSSP50mwxkl6o+Bv1qvOufo4WJZYIF/m+OCQeo/hIEk9eGM0kdmIWQdfzNDCFzYwyDDn1XHo9pCO2Als/IssqwEtNIIer7RpJbZjO0/ih/ZhTph9b1FqDwcET9zBrxxd8JZi+vkuIbtDJARrd+2SMtLNJ9ZkoVXHVhQtJowg/i5prM/qg6RfM/DAdYf8bszVOjg0W+kdpGbuTNJv3IZVBiaSmNua4JciFnkqy0TdXfogT1aHJvXIn9vjgRCDESN5GH4emhgb830iCOfwmkgpEWZziXjJydX2eayIBbpoVruqNZoBaXrJdNJ4/yi9GVzmL3d0=
Content-ID: <D76CE9544FA6394A988C0330002574AA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d933466-9c70-42b4-8e1a-08d6cd3c7288
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 07:21:22.6089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNjyS4WPZRJjNQ1gVe1kwFE4rShUMbpk+kQ81dvzpEg=;
 b=a+EaCWXrs1NfPDz3ChoGNun7paJXx0iRtDDNjrF88KGE2xrCFcL7ogvpC4hH52x6mTMJNOZYI9vTOP8OtP6SHdoaw9EdMK9xHfBTpAOQZLHovU7hROGeSNLrmUg8Duo3KVCQyBi1Xdpl8J71nAgwWIqcPhltAiX0SpzYtv/jePQ=
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

T24gTW9uLCBBcHIgMjIsIDIwMTkgYXQgMDM6MTY6MjZBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiAtIEFkZHMgcm90YXRpb24gcHJvcGVydHkgdG8gcGxh
bmUuCj4gLSBLb21lZGEgZGlzcGxheSByb3RhdGlvbiBzdXBwb3J0IGRpdmVyZ2VzIGZyb20gdGhl
IHNwZWNpZmljIGZvcm1hdHMsCj4gc28gbmVlZCB0byBjaGVjayB0aGUgdXNlciByZXF1aXJlZCBy
b3RhdGlvbiB0eXBlIHdpdGggdGhlIGZvcm1hdCBjYXBzCj4gYW5kIHJlamVjdCB0aGUgY29tbWl0
IGlmIGl0IGNhbiBub3QgYmUgc3VwcG9ydGVkLgo+IC0gSW4gdGhlIGxheWVyIHZhbGlkYXRlIGZs
b3csIHNldHMgdGhlIHJvdGF0aW9uIHZhbHVlIHRvIHRoZSBsYXllcgo+IHN0YXRlLiBJZiByOTAg
b3IgcjI3MCwgc3dhcCB0aGUgd2lkdGggYW5kIGhlaWdodCBvZiB0aGUgZGF0YSBmbG93Cj4gZm9y
IG5leHQgc3RhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaCAgfCAxMSArKysrKysrKysrKwo+ICAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICB8
ICA3ICsrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGxhbmUuYyAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MzQgaW5zZXJ0aW9ucygrKQo+IAo+IC0tIAo+IDEuOS4xCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gaW5k
ZXggYmMzYjJkZjM2Li45NmRlMjJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gQEAgLTc5LDYgKzc5
LDE3IEBAIHN0cnVjdCBrb21lZGFfZm9ybWF0X2NhcHNfdGFibGUgewo+ICAKPiAgZXh0ZXJuIHU2
NCBrb21lZGFfc3VwcG9ydGVkX21vZGlmaWVyc1tdOwo+ICAKPiArc3RhdGljIGlubGluZSBjb25z
dCBjaGFyICprb21lZGFfZ2V0X2Zvcm1hdF9uYW1lKHUzMiBmb3VyY2MsIHU2NCBtb2RpZmllcikK
PiArewo+ICsJc3RydWN0IGRybV9mb3JtYXRfbmFtZV9idWYgYnVmOwo+ICsJc3RhdGljIGNoYXIg
bmFtZVs2NF07Cj4gKwo+ICsJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiJXMgd2l0aCBt
b2RpZmllcjogMHglbGx4LiIsCj4gKwkJIGRybV9nZXRfZm9ybWF0X25hbWUoZm91cmNjLCAmYnVm
KSwgbW9kaWZpZXIpOwo+ICsKPiArCXJldHVybiBuYW1lOwo+ICt9Cj4gKwo+ICBjb25zdCBzdHJ1
Y3Qga29tZWRhX2Zvcm1hdF9jYXBzICoKPiAga29tZWRhX2dldF9mb3JtYXRfY2FwcyhzdHJ1Y3Qg
a29tZWRhX2Zvcm1hdF9jYXBzX3RhYmxlICp0YWJsZSwKPiAgCQkgICAgICAgdTMyIGZvdXJjYywg
dTY0IG1vZGlmaWVyKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBpbmRleCA5YjI5ZTlhLi44YzEz
M2U0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gQEAgLTMxNyw2ICszMTcsMTMgQEAgc3Ry
dWN0IGtvbWVkYV9waXBlbGluZV9zdGF0ZSAqCj4gIAkvKiB1cGRhdGUgdGhlIGRhdGEgZmxvdyBm
b3IgdGhlIG5leHQgc3RhZ2UgKi8KPiAgCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZs
b3ctPmlucHV0LCAmbGF5ZXItPmJhc2UsIDApOwo+ICAKPiArCS8qCj4gKwkgKiBUaGUgcm90YXRp
b24gaGFzIGJlZW4gaGFuZGxlZCBieSBsYXllciwgc28gYWRqdXN0ZWQgdGhlIGRhdGEgZmxvdyBm
b3IKPiArCSAqIHRoZSBuZXh0IHN0YWdlLgo+ICsJICovCj4gKwlpZiAoZHJtX3JvdGF0aW9uXzkw
X29yXzI3MChzdC0+cm90KSkKPiArCQlzd2FwKGRmbG93LT5pbl9oLCBkZmxvdy0+aW5fdyk7Cj4g
Kwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gaW5kZXggMTRkNjg2MS4uNWU1YmZkYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFu
ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxh
bmUuYwo+IEBAIC05LDEyICs5LDE0IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBl
ci5oPgo+ICAjaW5jbHVkZSAia29tZWRhX2Rldi5oIgo+ICAjaW5jbHVkZSAia29tZWRhX2ttcy5o
Igo+ICsjaW5jbHVkZSAia29tZWRhX2ZyYW1lYnVmZmVyLmgiCj4gIAo+ICBzdGF0aWMgaW50Cj4g
IGtvbWVkYV9wbGFuZV9pbml0X2RhdGFfZmxvdyhzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdCwK
PiAgCQkJICAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCj4gIHsKPiAgCXN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3QtPmZiOwo+ICsJY29uc3Qgc3RydWN0IGtvbWVk
YV9mb3JtYXRfY2FwcyAqY2FwcyA9IHRvX2tmYihmYiktPmZvcm1hdF9jYXBzOwo+ICAKPiAgCW1l
bXNldChkZmxvdywgMCwgc2l6ZW9mKCpkZmxvdykpOwo+ICAKPiBAQCAtMzUsNiArMzcsMTUgQEAK
PiAgCWRmbG93LT5pbl93ID0gc3QtPnNyY193ID4+IDE2Owo+ICAJZGZsb3ctPmluX2ggPSBzdC0+
c3JjX2ggPj4gMTY7Cj4gIAo+ICsJZGZsb3ctPnJvdCA9IGRybV9yb3RhdGlvbl9zaW1wbGlmeShz
dC0+cm90YXRpb24sIGNhcHMtPnN1cHBvcnRlZF9yb3RzKTsKPiArCWlmICghaGFzX2JpdHMoZGZs
b3ctPnJvdCwgY2Fwcy0+c3VwcG9ydGVkX3JvdHMpKSB7Cj4gKwkJRFJNX0RFQlVHX0FUT01JQygi
cm90YXRpb24oMHgleCkgaXNuJ3Qgc3VwcG9ydGVkIGJ5ICVzLlxuIiwKPiArCQkJCSBkZmxvdy0+
cm90LAo+ICsJCQkJIGtvbWVkYV9nZXRfZm9ybWF0X25hbWUoY2Fwcy0+Zm91cmNjLAo+ICsJCQkJ
CQkJZmItPm1vZGlmaWVyKSk7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICAJcmV0
dXJuIDA7Cj4gIH0KPiAgCj4gQEAgLTIzMyw2ICsyNDQsMTEgQEAgc3RhdGljIGludCBrb21lZGFf
cGxhbmVfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAo+ICAKPiAgCWRybV9wbGFuZV9o
ZWxwZXJfYWRkKHBsYW5lLCAma29tZWRhX3BsYW5lX2hlbHBlcl9mdW5jcyk7Cj4gIAo+ICsJZXJy
ID0gZHJtX3BsYW5lX2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0eShwbGFuZSwgRFJNX01PREVfUk9U
QVRFXzAsCj4gKwkJCQkJCSBsYXllci0+c3VwcG9ydGVkX3JvdHMpOwo+ICsJaWYgKGVycikKPiAr
CQlnb3RvIGNsZWFudXA7Cj4gKwo+ICAJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9w
ZXJ0eShwbGFuZSk7Cj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gY2xlYW51cDsKCkxvb2tzIGdvb2Qg
dG8gbWUuCgpKYW1lcy4KLS0gClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
