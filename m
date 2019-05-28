Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D160C2BF0D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 08:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDA789B62;
	Tue, 28 May 2019 06:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30044.outbound.protection.outlook.com [40.107.3.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486689B62
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 06:08:12 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5037.eurprd08.prod.outlook.com (10.255.159.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 06:08:08 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 06:08:08 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v3 1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Topic: [PATCH v3 1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Index: AQHVFRu4JBxnsw+4AU2JU8mJVT7HnA==
Date: Tue, 28 May 2019 06:08:08 +0000
Message-ID: <20190528060800.GA14743@james-ThinkStation-P300>
References: <1559015784-18998-1-git-send-email-lowry.li@arm.com>
 <1559015784-18998-2-git-send-email-lowry.li@arm.com>
In-Reply-To: <1559015784-18998-2-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SL2P216CA0037.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:1a::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 066f9e36-c32b-4bde-624b-08d6e332db10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5037; 
x-ms-traffictypediagnostic: VE1PR08MB5037:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5037F6BB68BCA2A0878ACE19B31E0@VE1PR08MB5037.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:111;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(8936002)(81166006)(81156014)(1076003)(11346002)(446003)(53936002)(6246003)(8676002)(33716001)(71190400001)(33656002)(2906002)(66066001)(256004)(14444005)(6862004)(71200400001)(86362001)(5660300002)(6512007)(102836004)(478600001)(66946007)(73956011)(6436002)(186003)(476003)(14454004)(68736007)(25786009)(99286004)(316002)(55236004)(7736002)(305945005)(229853002)(76176011)(58126008)(66446008)(64756008)(66556008)(66476007)(26005)(4326008)(486006)(386003)(6506007)(3846002)(6116002)(9686003)(54906003)(6636002)(6486002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5037;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CZ84ZUeC6Hb6F4to37UqbJ64cT2rUAmREh21V6cQaHK/VET4YyzRXcK0xl5l/vGQSl0ByVX2NuqsyiSgJIR4rK0vu1AB+rSPZugWM6aOmt0bkUj57ML+3HFVhr0En5Q63kGuXXOvy6o1br8/sGKEnVOWi9fFHhL3Fy9bT1q/XV374At3UBE5b8CE9bvyQJimcK7eSaMtnF/bB5jaA9OYGncaRmXL/bQiGGGrL+pxiECZRvbuLzwCojeqCQIj0r65qLqTYap9CkkmcApQZ19gA4NjEjosHADJWaX733GGmxgnSpYAVigZjyXYU7Ce7rpcwwmHxWth8Ywvfw/ht6/xwZXAq/lv+zkkBB0xuC8Une8s63x0XFtY3eiiiZuEmv7QEiZR5m0+GJSEHEqBP0fvIdDy9fhN3pVJJ9wd2LswQIU=
Content-ID: <4F57110043732E4EA82BB1C59FBCA830@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066f9e36-c32b-4bde-624b-08d6e332db10
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 06:08:08.7185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHJz+Qa/IUF53j0nhwlXZzG6ST0QTj2xiPN+k0O6zLA=;
 b=0YsyGrNEhg0E78nepQOgoXcTCGUiAygbiUiFZPnewpCirQs15sxWex/9f4WIcQ6Y/syO/MrPto4xjRJSPkfYixi401+F8QjY165N8Wp6+/hbY5j2aU+wYuc76bWKETYbrA5r5f4Qfuc3QqBF+yjqDPMeoapfkwEqZdjocQqQgCo=
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
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTE6NTc6MDBBTSArMDgwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gLSBBZGRzIHJvdGF0aW9uIHByb3BlcnR5
IHRvIHBsYW5lLgo+IC0gS29tZWRhIGRpc3BsYXkgcm90YXRpb24gc3VwcG9ydCBkaXZlcmdlcyBm
cm9tIHRoZSBzcGVjaWZpYyBmb3JtYXRzLAo+IHNvIG5lZWQgdG8gY2hlY2sgdGhlIHVzZXIgcmVx
dWlyZWQgcm90YXRpb24gdHlwZSB3aXRoIHRoZSBmb3JtYXQgY2Fwcwo+IGFuZCByZWplY3QgdGhl
IGNvbW1pdCBpZiBpdCBjYW4gbm90IGJlIHN1cHBvcnRlZC4KPiAtIEluIHRoZSBsYXllciB2YWxp
ZGF0ZSBmbG93LCBzZXRzIHRoZSByb3RhdGlvbiB2YWx1ZSB0byB0aGUgbGF5ZXIKPiBzdGF0ZS4g
SWYgcjkwIG9yIHIyNzAsIHN3YXAgdGhlIHdpZHRoIGFuZCBoZWlnaHQgb2YgdGhlIGRhdGEgZmxv
dwo+IGZvciBuZXh0IHN0YWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggIHwgMTEgKysrKysrKysr
KysKPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jICAgfCAgNyArKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BsYW5lLmMgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiBpbmRleCBiYzNiMmRm
MzYuLjk2ZGUyMmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiBAQCAtNzksNiArNzksMTcgQEAgc3Ry
dWN0IGtvbWVkYV9mb3JtYXRfY2Fwc190YWJsZSB7Cj4gIAo+ICBleHRlcm4gdTY0IGtvbWVkYV9z
dXBwb3J0ZWRfbW9kaWZpZXJzW107Cj4gIAo+ICtzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmtv
bWVkYV9nZXRfZm9ybWF0X25hbWUodTMyIGZvdXJjYywgdTY0IG1vZGlmaWVyKQo+ICt7Cj4gKwlz
dHJ1Y3QgZHJtX2Zvcm1hdF9uYW1lX2J1ZiBidWY7Cj4gKwlzdGF0aWMgY2hhciBuYW1lWzY0XTsK
PiArCj4gKwlzbnByaW50ZihuYW1lLCBzaXplb2YobmFtZSksICIlcyB3aXRoIG1vZGlmaWVyOiAw
eCVsbHguIiwKPiArCQkgZHJtX2dldF9mb3JtYXRfbmFtZShmb3VyY2MsICZidWYpLCBtb2RpZmll
cik7Cj4gKwo+ICsJcmV0dXJuIG5hbWU7Cj4gK30KPiArCj4gIGNvbnN0IHN0cnVjdCBrb21lZGFf
Zm9ybWF0X2NhcHMgKgo+ICBrb21lZGFfZ2V0X2Zvcm1hdF9jYXBzKHN0cnVjdCBrb21lZGFfZm9y
bWF0X2NhcHNfdGFibGUgKnRhYmxlLAo+ICAJCSAgICAgICB1MzIgZm91cmNjLCB1NjQgbW9kaWZp
ZXIpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+IGluZGV4IGRiMzRlYTIuLjM0NzM3YzAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmVfc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBAQCAtMzM5LDYgKzMzOSwxMyBAQCBzdHJ1Y3Qga29tZWRh
X3BpcGVsaW5lX3N0YXRlICoKPiAgCS8qIHVwZGF0ZSB0aGUgZGF0YSBmbG93IGZvciB0aGUgbmV4
dCBzdGFnZSAqLwo+ICAJa29tZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0KCZkZmxvdy0+aW5wdXQs
ICZsYXllci0+YmFzZSwgMCk7Cj4gIAo+ICsJLyoKPiArCSAqIFRoZSByb3RhdGlvbiBoYXMgYmVl
biBoYW5kbGVkIGJ5IGxheWVyLCBzbyBhZGp1c3RlZCB0aGUgZGF0YSBmbG93IGZvcgo+ICsJICog
dGhlIG5leHQgc3RhZ2UuCj4gKwkgKi8KPiArCWlmIChkcm1fcm90YXRpb25fOTBfb3JfMjcwKHN0
LT5yb3QpKQo+ICsJCXN3YXAoZGZsb3ctPmluX2gsIGRmbG93LT5pbl93KTsKPiArCj4gIAlyZXR1
cm4gMDsKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BsYW5lLmMKPiBpbmRleCA5Yjg3YzI1Li5jOWYzN2ZmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gQEAg
LTEwLDYgKzEwLDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiAgI2luY2x1ZGUg
ImtvbWVkYV9kZXYuaCIKPiAgI2luY2x1ZGUgImtvbWVkYV9rbXMuaCIKPiArI2luY2x1ZGUgImtv
bWVkYV9mcmFtZWJ1ZmZlci5oIgo+ICAKPiAgc3RhdGljIGludAo+ICBrb21lZGFfcGxhbmVfaW5p
dF9kYXRhX2Zsb3coc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3QsCj4gQEAgLTE3LDYgKzE4LDcg
QEAKPiAgewo+ICAJc3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0ZSAqa3BsYW5lX3N0ID0gdG9fa3Bs
YW5lX3N0KHN0KTsKPiAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3QtPmZiOwo+ICsJ
Y29uc3Qgc3RydWN0IGtvbWVkYV9mb3JtYXRfY2FwcyAqY2FwcyA9IHRvX2tmYihmYiktPmZvcm1h
dF9jYXBzOwo+ICAKPiAgCW1lbXNldChkZmxvdywgMCwgc2l6ZW9mKCpkZmxvdykpOwo+ICAKPiBA
QCAtMzcsNiArMzksMTUgQEAKPiAgCWRmbG93LT5pbl93ID0gc3QtPnNyY193ID4+IDE2Owo+ICAJ
ZGZsb3ctPmluX2ggPSBzdC0+c3JjX2ggPj4gMTY7Cj4gIAo+ICsJZGZsb3ctPnJvdCA9IGRybV9y
b3RhdGlvbl9zaW1wbGlmeShzdC0+cm90YXRpb24sIGNhcHMtPnN1cHBvcnRlZF9yb3RzKTsKPiAr
CWlmICghaGFzX2JpdHMoZGZsb3ctPnJvdCwgY2Fwcy0+c3VwcG9ydGVkX3JvdHMpKSB7Cj4gKwkJ
RFJNX0RFQlVHX0FUT01JQygicm90YXRpb24oMHgleCkgaXNuJ3Qgc3VwcG9ydGVkIGJ5ICVzLlxu
IiwKPiArCQkJCSBkZmxvdy0+cm90LAo+ICsJCQkJIGtvbWVkYV9nZXRfZm9ybWF0X25hbWUoY2Fw
cy0+Zm91cmNjLAo+ICsJCQkJCQkJZmItPm1vZGlmaWVyKSk7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7
Cj4gKwl9Cj4gKwo+ICAJZGZsb3ctPmVuX2ltZ19lbmhhbmNlbWVudCA9IGtwbGFuZV9zdC0+aW1n
X2VuaGFuY2VtZW50Owo+ICAKPiAgCWtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2ZnKGRmbG93
KTsKPiBAQCAtMzAzLDYgKzMxNCwxMSBAQCBzdGF0aWMgaW50IGtvbWVkYV9wbGFuZV9hZGQoc3Ry
dWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAo+ICAJZHJtX3BsYW5lX2hlbHBlcl9hZGQocGxh
bmUsICZrb21lZGFfcGxhbmVfaGVscGVyX2Z1bmNzKTsKPiAgCj4gKwllcnIgPSBkcm1fcGxhbmVf
Y3JlYXRlX3JvdGF0aW9uX3Byb3BlcnR5KHBsYW5lLCBEUk1fTU9ERV9ST1RBVEVfMCwKPiArCQkJ
CQkJIGxheWVyLT5zdXBwb3J0ZWRfcm90cyk7Cj4gKwlpZiAoZXJyKQo+ICsJCWdvdG8gY2xlYW51
cDsKPiArCj4gIAllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX2FscGhhX3Byb3BlcnR5KHBsYW5lKTsK
PiAgCWlmIChlcnIpCj4gIAkJZ290byBjbGVhbnVwOwo+IC0tIAo+IDEuOS4xCj4gCgpMb29rcyBn
b29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
