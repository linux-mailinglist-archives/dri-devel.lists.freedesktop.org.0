Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80FE296A7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 13:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD6C6E0FD;
	Fri, 24 May 2019 11:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00068.outbound.protection.outlook.com [40.107.0.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02DF6E0FD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:10:12 +0000 (UTC)
Received: from AM6PR08MB4038.eurprd08.prod.outlook.com (20.179.1.84) by
 AM6PR08MB3912.eurprd08.prod.outlook.com (20.178.91.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 11:10:09 +0000
Received: from AM6PR08MB4038.eurprd08.prod.outlook.com
 ([fe80::397e:708d:dcfd:a30f]) by AM6PR08MB4038.eurprd08.prod.outlook.com
 ([fe80::397e:708d:dcfd:a30f%3]) with mapi id 15.20.1922.019; Fri, 24 May 2019
 11:10:09 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Added AFBC support for komeda driver
Thread-Topic: [PATCH] drm/komeda: Added AFBC support for komeda driver
Thread-Index: AQHU6tZrSfGY2oLen0KpP248EWVF9aZuCQMAgAeEiACABN9HgA==
Date: Fri, 24 May 2019 11:10:09 +0000
Message-ID: <20190524111009.beddu67vvx66wvmk@DESKTOP-E1NTVVP.localdomain>
References: <20190404110552.15778-1-james.qian.wang@arm.com>
 <20190516135748.GC1372@arm.com>
 <20190521084552.GA20625@james-ThinkStation-P300>
In-Reply-To: <20190521084552.GA20625@james-ThinkStation-P300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::17) To AM6PR08MB4038.eurprd08.prod.outlook.com
 (2603:10a6:20b:a6::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1729f098-5715-4a7d-996e-08d6e038625b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3912; 
x-ms-traffictypediagnostic: AM6PR08MB3912:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM6PR08MB39126C0041D667A162361C60F0020@AM6PR08MB3912.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(52116002)(99286004)(76176011)(25786009)(2906002)(102836004)(386003)(316002)(256004)(446003)(44832011)(11346002)(486006)(476003)(66446008)(64756008)(1076003)(66946007)(66066001)(66556008)(66476007)(71200400001)(71190400001)(53936002)(73956011)(6486002)(9686003)(6436002)(72206003)(6506007)(6636002)(14454004)(478600001)(86362001)(8676002)(305945005)(81156014)(6512007)(229853002)(7736002)(5660300002)(6862004)(4326008)(26005)(6246003)(54906003)(186003)(58126008)(81166006)(8936002)(68736007)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3912;
 H:AM6PR08MB4038.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yXkg6tYTNKZLumKq2LN9tBXeiBdd694fuEB2a31+hGCUvASyDAtcspeQU/IAS0tX0r9Ty8tmYkR080KRXRBiSiMaQrIDMv0WkMsgDwEHca9ahR+EC5NoYOOSX6DST5d1tB84aNYDFUFuX+JnNP+n3qx1qop7kH8SgAcMdnR9naq20HRtla5UIDInA1q3+yPdGyPrjD28ZIIymIFhfrZSGySPUbonp/gP+0cJqul4KpjFOcY6HvFplwacrotjrN8UmO5ficiXajxHC2U0ySVPlpZRpqY8SQ/ho2yYX0dvT86aXYOPM47rZE4Z2bizjvyeU1ZiNB/639oQHKc+7dU7MeONy9EXvYAWowKN/yrQuDIMPQ00xeEVxPyHzUN0vscELi6YZUtq50y+LnA4tGLVQzsjoc83oZnr7ZCCixucVDE=
Content-ID: <464F27F342C0B34FA294379AE634D9A1@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1729f098-5715-4a7d-996e-08d6e038625b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 11:10:09.5502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3912
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHGGkRxKq55STwUJXDbQ6Lye9Zkh2OIt5S2/wfjfKC8=;
 b=R4TmkzJRfqLnHe0EUuHVc65Vu+Rkrm5QZokr+MNQcMSTZTgTWME1S+HrhfLNLROcYXOlrm4H068XfQdyON2OcmCEhDr9bs47Wz6FTVJb3UgfBrqttYSFp2OzbCYIJdx+ycTDQCflecRn5u8PSd73cGsYe4O9zR5I0TWYnycX2Q4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
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
Cc: nd <nd@arm.com>, "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwOTo0NTo1OEFNICswMTAwLCBqYW1lcyBxaWFu
IHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAx
OSBhdCAwOTo1Nzo0OVBNICswODAwLCBBeWFuIEhhbGRlciB3cm90ZToKPiA+IE9uIFRodSwgQXBy
IDA0LCAyMDE5IGF0IDEyOjA2OjE0UE0gKzAxMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiAgCj4gPiA+ICtzdGF0aWMgaW50Cj4gPiA+ICtrb21l
ZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9m
aWxlICpmaWxlLAo+ID4gPiArCQkJICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9k
ZV9jbWQpCj4gPiA+ICt7Cj4gPiA+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSAma2Zi
LT5iYXNlOwo+ID4gPiArCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm8gPSBmYi0+
Zm9ybWF0Owo+ID4gPiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwo+ID4gPiArCXUzMiBh
bGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlcjsKPiA+ID4g
Kwl1MzIgbl9ibG9ja3MgPSAwLCBtaW5fc2l6ZSA9IDA7Cj4gPiA+ICsKPiA+ID4gKwlvYmogPSBk
cm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgbW9kZV9jbWQtPmhhbmRsZXNbMF0pOwo+ID4gPiAr
CWlmICghb2JqKSB7Cj4gPiA+ICsJCURSTV9ERUJVR19LTVMoIkZhaWxlZCB0byBsb29rdXAgR0VN
IG9iamVjdFxuIik7Cj4gPiA+ICsJCXJldHVybiAtRU5PRU5UOwo+ID4gPiArCX0KPiA+ID4gKwo+
ID4gPiArCXN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVf
TUFTSykgewo+ID4gPiArCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMzJ4ODoKPiA+
ID4gKwkJYWxpZ25tZW50X3cgPSAzMjsKPiA+ID4gKwkJYWxpZ25tZW50X2ggPSA4Owo+ID4gPiAr
CQlicmVhazsKPiA+ID4gKwljYXNlIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzE2eDE2Ogo+
ID4gPiArCQlhbGlnbm1lbnRfdyA9IDE2Owo+ID4gPiArCQlhbGlnbm1lbnRfaCA9IDE2Owo+ID4g
PiArCQlicmVhazsKPiA+ID4gKwlkZWZhdWx0Ogo+ID4gQ2FuIHdlIGhhdmUgc29tZXRoaW5nIGxp
a2UgYSB3YXJuIGhlcmUgPwo+IAo+IHdpbGwgYWRkIGEgV0FSTiBoZXJlLgo+IAoKSSB0aGluayBp
dCdzIGJldHRlciBub3QgdG8uIGZiLT5tb2RpZmllciBjb21lcyBmcm9tCnVzZXJzcGFjZSwgc28g
YSBtYWxpY2lvdXMgYXBwIGNvdWxkIHNwYW0gdXMgd2l0aCBXQVJOcywgZWZmZWN0aXZlbHkKZG9z
LWluZyB0aGUgc3lzdGVtLiAtRUlOVkFMIHNob3VsZCBiZSBzdWZmaWNpZW50LgoKVGhhbmtzLAot
QnJpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
