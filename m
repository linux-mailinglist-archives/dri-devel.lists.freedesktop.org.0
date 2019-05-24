Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26B29651
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD256E0F1;
	Fri, 24 May 2019 10:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4E56E0F1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:50:15 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4671.eurprd08.prod.outlook.com (10.255.115.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Fri, 24 May 2019 10:50:12 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 10:50:12 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Creates plane alpha and blend mode properties
Thread-Topic: [PATCH] drm/komeda: Creates plane alpha and blend mode properties
Thread-Index: AQHVEh52xJ4Oo9wXlU+wcwM2IPE1kA==
Date: Fri, 24 May 2019 10:50:12 +0000
Message-ID: <20190524105006.GA18826@james-ThinkStation-P300>
References: <1558689598-2215-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1558689598-2215-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:203:52::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6165d8d-9ec6-4147-57f5-08d6e03598ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4671; 
x-ms-traffictypediagnostic: VE1PR08MB4671:
x-ms-exchange-purlcount: 5
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB46718AA9F9BEB9600D029B7BB3020@VE1PR08MB4671.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(376002)(136003)(366004)(39860400002)(396003)(199004)(189003)(66446008)(66476007)(66556008)(64756008)(478600001)(54906003)(81156014)(81166006)(7736002)(14454004)(8936002)(58126008)(66946007)(5660300002)(8676002)(6486002)(73956011)(966005)(66066001)(5024004)(256004)(305945005)(33656002)(9686003)(6512007)(6636002)(6306002)(71200400001)(71190400001)(86362001)(6436002)(33716001)(386003)(6506007)(4326008)(55236004)(229853002)(6246003)(6862004)(53936002)(6116002)(102836004)(3846002)(26005)(25786009)(186003)(1076003)(316002)(68736007)(76176011)(52116002)(446003)(2906002)(476003)(99286004)(11346002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4671;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tUG3+C6inCWKDDkgogpgEm7tQQ+fpcDJ1YDeLJ5MueKBt4PetBpIqdvgnhb+NPoj18osByM1tqP2VXlDE4cjGDGN5R+mftHjuXoZvvyVqv1TF1LzWZw2UmV1xkXmzNkN9bVBsS9zywj+x4Lsl76ib+C24CDHAqOEjWwj79olYzXD0N3WaJXlAYGaAoEb1Z6+PgAWjcDw1m4xy0lv00jmgxg52TAZjYpdy2fTsxg9KQMI8Q7C5lnLHfF+5Qz7nTRzW6ulKCxDWC8adERfGqBoMT1TolBzBdZ6XJZb9f1CiqJhvJqHlLA+Au9zHrgDurHKOFgmt4SQLon0X+bKpAWU+xAK4DiKbE4W99kETna8Jb5+fhpxEQPz4f3BwQx5uzXM5PQMLUuSzj56gimnZ5+DEGyJWht1QIhTh41p7/UpGEk=
Content-ID: <6181A7944D56264781C2D7AE991D99DD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6165d8d-9ec6-4147-57f5-08d6e03598ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 10:50:12.6615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4671
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xqeAvNqdBn60d0nx9GinGOt5ujMTtwBY7H9n0wfzBk=;
 b=yNndyyEtBKVvwirkyzCze9iwXc+rGNbJIHNI33qSe3iiujUjugStQeB1N/tDZjHQGjiBZGvYujSsVpbEoqE8npCyj/6P5pFVOM5tdEigzpOkSTFY1icqhFtqP3YXl7xldhzRvivXrIlVj7rWxoglwnzUmb293M3xtL5Perwh5aE=
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

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDU6MjA6MjRQTSArMDgwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gQ3JlYXRlcyBwbGFuZSBhbHBoYSBhbmQg
YmxlbmQgbW9kZSBwcm9wZXJ0aWVzIGF0dGFjaGVkIHRvIHBsYW5lLgo+IAo+IFRoaXMgcGF0Y2gg
ZGVwZW5kcyBvbjoKPiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NTk5MTUvCj4gLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4NjY1
Lwo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTAwMC8KPiAt
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwMDIvCj4gLSBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU5NDcxLwo+IAo+IENoYW5nZXMg
c2luY2UgdjE6Cj4gLSBBZGRzIHBhdGNoIGRlbnBlbmRlbmN5IGluIHRoZSBjb21tZW50Cj4gCj4g
Q2hhbmdlcyBzaW5jZSB2MjoKPiAtIFJlbW92ZSBbUkZDXSBmcm9tIHRoZSBzdWJqZWN0Cj4gCj4g
Q2hhbmdlcyBzaW5jZSB2MzoKPiAtIFJlYmFzZSB0aGUgY29kZQo+IAo+IFNpZ25lZC1vZmYtYnk6
IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgfCAx
MSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFu
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+
IGluZGV4IGU3Y2Q2OTAuLjliODdjMjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBAQCAtMzAzLDYgKzMwMywxNyBAQCBz
dGF0aWMgaW50IGtvbWVkYV9wbGFuZV9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4g
IAo+ICAJZHJtX3BsYW5lX2hlbHBlcl9hZGQocGxhbmUsICZrb21lZGFfcGxhbmVfaGVscGVyX2Z1
bmNzKTsKPiAgCj4gKwllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX2FscGhhX3Byb3BlcnR5KHBsYW5l
KTsKPiArCWlmIChlcnIpCj4gKwkJZ290byBjbGVhbnVwOwo+ICsKPiArCWVyciA9IGRybV9wbGFu
ZV9jcmVhdGVfYmxlbmRfbW9kZV9wcm9wZXJ0eShwbGFuZSwKPiArCQkJQklUKERSTV9NT0RFX0JM
RU5EX1BJWEVMX05PTkUpIHwKPiArCQkJQklUKERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJKSAgIHwK
PiArCQkJQklUKERSTV9NT0RFX0JMRU5EX0NPVkVSQUdFKSk7Cj4gKwlpZiAoZXJyKQo+ICsJCWdv
dG8gY2xlYW51cDsKPiArCj4gIAllcnIgPSBrb21lZGFfcGxhbmVfY3JlYXRlX2xheWVyX3Byb3Bl
cnRpZXMoa3BsYW5lLCBsYXllcik7Cj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gY2xlYW51cDsKPiAt
LSAKPiAxLjkuMQo+IAoKbGd0bS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
