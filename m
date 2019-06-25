Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5A56433
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E476E2F6;
	Wed, 26 Jun 2019 08:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00082.outbound.protection.outlook.com [40.107.0.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4317689D30;
 Tue, 25 Jun 2019 11:44:32 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6429.eurprd05.prod.outlook.com (20.179.27.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 11:44:29 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 11:44:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Topic: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Index: AQHVIcyVeqgMzBs0VkumwilsEzSkhqak+JsAgAcTLYCAAEdIAA==
Date: Tue, 25 Jun 2019 11:44:28 +0000
Message-ID: <20190625114422.GA3118@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190620192648.GI12083@dhcp22.suse.cz>
 <20190625072915.GD30350@lst.de>
In-Reply-To: <20190625072915.GD30350@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:208:134::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [209.213.91.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e4dfbc-5b01-4b89-e89c-08d6f9627a81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6429; 
x-ms-traffictypediagnostic: VI1PR05MB6429:
x-microsoft-antispam-prvs: <VI1PR05MB6429E15F0940959724D7B61CCFE30@VI1PR05MB6429.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(346002)(136003)(396003)(199004)(189003)(2906002)(52116002)(54906003)(8676002)(53936002)(5660300002)(11346002)(81166006)(81156014)(68736007)(66446008)(66946007)(71200400001)(478600001)(305945005)(66476007)(3846002)(6116002)(14454004)(36756003)(73956011)(1076003)(256004)(71190400001)(446003)(76176011)(486006)(316002)(7416002)(6512007)(66556008)(7736002)(64756008)(33656002)(86362001)(4326008)(6246003)(476003)(186003)(2616005)(8936002)(102836004)(26005)(6486002)(66066001)(386003)(6506007)(6436002)(229853002)(6916009)(25786009)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6429;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KvSArAdb6oF3ia/u73x5Rm05QnQCPBHemQrCRtpJGi8yD5h29saYmk9PT1xbrEAZJ9dPKmR+komLg+x3ZVv13yfbRnfb/cwtQ6ECdT6g5lhognBgTrUp3dW/dJMkl647bq2tpjh/ons35mu7BhmlmYoqCkfNz5XAdd7veZBiiWMwA54isp3xfz1ynXyrTmeoXcyWM4WksZzPetHcj3BtpHWkCYpxcBA3Hx3W8PMYKy1DAIveWea2oz4yjrnhztNCOPDAGng0NdfI7wuv0SBA1iZ4bf6l/58enmEryLl4O/byyEqMPxpoI0P3xJt9UMgOCwm0Qt8WR9FftnHAdcP92IdBa4mKsSsvO9UGTWsWapNf8KPFJK+ZiYGjddLsEtodSeB8kv9lcKcF4R+hXZfuNErpQPQNV62z/y1X1PA7qis=
Content-ID: <9099450B868E3548B355AC3B0AFD1F5E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e4dfbc-5b01-4b89-e89c-08d6f9627a81
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 11:44:28.8132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6429
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5g/kXs53cyAU/0l6biTfPEBGQO4pWzyaBiiFsCrnwQ=;
 b=P5BHz3RmliJy0oSxBWbLono/6B0JZ4yTq07dKrkzyH4DvRzC+vmRuo7ABmDLYuzmqYGIBgNnOwUlJ6V9IMczIyKB3vaZiwSEfc/D54nWznYH6/jgYg9Wg4YL7dyQk9TOqxPHWDqccjKJ3LGRtUW2TQPLsgoWWADBUC01t4IHTRI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDk6Mjk6MTVBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDk6MjY6NDhQTSArMDIwMCwgTWlj
aGFsIEhvY2tvIHdyb3RlOgo+ID4gT24gVGh1IDEzLTA2LTE5IDExOjQzOjIxLCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiA+ID4gVGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3
YXMgYWRkZWQgdG8gdGhlIHRyZWUsIGFuZCBkb2Vzbid0Cj4gPiA+IGFwcGVhciB0byBhY3R1YWxs
eSBiZSB1c2FibGUuICBNYXJrIGl0IGFzIEJST0tFTiB1bnRpbCBlaXRoZXIgYSB1c2VyCj4gPiA+
IGNvbWVzIGFsb25nIG9yIHdlIGZpbmFsbHkgZ2l2ZSB1cCBvbiBpdC4KPiA+IAo+ID4gSSB3b3Vs
ZCBnbyBldmVuIGZ1cnRoZXIgYW5kIHNpbXBseSByZW1vdmUgYWxsIHRoZSBERVZJQ0VfUFVCTElD
IGNvZGUuCj4gCj4gSSBsb29rZWQgaW50byB0aGF0IGFzIEkgbm93IGdvdCB0aGUgZmVlZGJhY2sg
dHdpY2UuICBJdCB3b3VsZAo+IGNyZWF0ZSBhIGNvbmZsaWN0IHdpdGggYW5vdGhlciB0cmVlIGNs
ZWFuaW5nIHRoaW5ncyB1cCBhcm91bmQgdGhlCj4gaXNfZGV2aWNlX3ByaXZhdGUgZGVmaW50aW9u
LCBidXQgb3RoZXJ3aXNlIEknZCBiZSBnbGFkIHRvIGp1c3QgcmVtb3ZlCj4gaXQuCj4gCj4gSmFz
b24sIGFzIHRoaXMgZ29lcyB0aHJvdWdoIHlvdXIgdHJlZSwgZG8geW91IG1pbmQgdGhlIGFkZGl0
aW9uYWwKPiBjb25mbGljdD8KCldoaWNoIHRyZWUgYW5kIHdoYXQgZG9lcyB0aGUgcmVzb2x1dGlv
biBsb29rIGxpa2U/CgpBbHNvLCBJIGRvbid0IHdhbnQgdG8gYmUgbWFraW5nIHRoZSBkZWNpc2lv
biBpZiB3ZSBzaG91bGQga2VlcC9yZW1vdmUKREVWSUNFX1BVQkxJQywgc28gbGV0J3MgZ2V0IGFu
IEFjayBmcm9tIEFuZHJldy9ldGM/CgpNeSBtYWluIHJlbHVjdGFuY2UgaXMgdGhhdCBJIGtub3cg
dGhlcmUgaXMgSFcgb3V0IHRoZXJlIHRoYXQgY2FuIGRvCmNvaGVyZW50LCBhbmQgSSB3YW50IHRv
IGJlbGlldmUgdGhleSBhcmUgY29taW5nIHdpdGggcGF0Y2hlcywganVzdAp0b28gc2xvd2x5LiBC
dXQgSSdkIGFsc28gcmF0aGVyIHRob3NlIHBlb3BsZSBkZWZlbmQgdGhlbXNlbHZlcyA6UAoKVGhh
bmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
