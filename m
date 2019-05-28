Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BECB2CA52
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78AD89236;
	Tue, 28 May 2019 15:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00054.outbound.protection.outlook.com [40.107.0.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8404A89268
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:26:46 +0000 (UTC)
Received: from AM6PR08MB4104.eurprd08.prod.outlook.com (20.179.2.31) by
 AM6PR08MB3958.eurprd08.prod.outlook.com (20.179.1.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 15:26:44 +0000
Received: from AM6PR08MB4104.eurprd08.prod.outlook.com
 ([fe80::2dd7:c53e:ed14:2be4]) by AM6PR08MB4104.eurprd08.prod.outlook.com
 ([fe80::2dd7:c53e:ed14:2be4%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 15:26:44 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Added AFBC support for komeda driver
Thread-Topic: [PATCH] drm/komeda: Added AFBC support for komeda driver
Thread-Index: AQHU6tZrSfGY2oLen0KpP248EWVF9aZuCQMAgAeEiACABN9HgIAAEWcAgARdRQCAAiJUgA==
Date: Tue, 28 May 2019 15:26:43 +0000
Message-ID: <20190528152641.yljgau26hhd6mr2d@DESKTOP-E1NTVVP.localdomain>
References: <20190404110552.15778-1-james.qian.wang@arm.com>
 <20190516135748.GC1372@arm.com>
 <20190521084552.GA20625@james-ThinkStation-P300>
 <20190524111009.beddu67vvx66wvmk@DESKTOP-E1NTVVP.localdomain>
 <20190524121226.GD5942@intel.com>
 <20190527065110.GA29041@james-ThinkStation-P300>
In-Reply-To: <20190527065110.GA29041@james-ThinkStation-P300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::35) To AM6PR08MB4104.eurprd08.prod.outlook.com
 (2603:10a6:20b:a9::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd0a941-1d96-4889-9d55-08d6e380e389
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3958; 
x-ms-traffictypediagnostic: AM6PR08MB3958:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM6PR08MB3958CC521DC43E60EE59BB31F01E0@AM6PR08MB3958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(39860400002)(366004)(346002)(199004)(189003)(51914003)(26005)(186003)(44832011)(11346002)(8676002)(66946007)(6486002)(3846002)(446003)(71190400001)(71200400001)(86362001)(486006)(476003)(66446008)(73956011)(66476007)(66556008)(66066001)(6246003)(64756008)(6116002)(25786009)(316002)(53936002)(6436002)(229853002)(6862004)(4326008)(6636002)(256004)(81156014)(54906003)(4744005)(7736002)(52116002)(9686003)(6512007)(68736007)(72206003)(5660300002)(478600001)(8936002)(76176011)(14454004)(99286004)(305945005)(58126008)(2906002)(6506007)(386003)(102836004)(81166006)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3958;
 H:AM6PR08MB4104.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HVSmIwPTL7vXB63Hln6t9v0iAgRj3q34CZjArJcyv3SC7UJsSJ6JYjBR+6QleHcz0myQvqB1O9g+ZZR8MlTeZYwQ4LTx7sj+jJltmJfL5oqN5FosOox3tNPTLTljz5z4ldVyF4TQQRKvGtGtTRGQTv5hpgXSJGdRe2FYS2+isEpeMQlWEXYOkUsJ+/Dbh1Kq+XPQISxrjK4EolwaYncsBbTGIoNZyIYyQRzjbOfEshuqjvxO9Y7JzjBRvEoIStAcB42CaCCcbaZjb/gyIQNvExDsoQ9bkcitA2gcPobyAxmOlpPCHoNYVDS0y8lsCc9u4CPzWCmX2RVjQ24QQWDBgC4gYZ0Hl2ye1XeGIoFjEhSsb/3iAKusyVuwWp8sP50yBl0MKl1sPSzPhZxbRuWi6KWNKZB9sVotymKAEZ2cjVQ=
Content-ID: <A0010D15580F254FAF72DE5257EF4B1C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd0a941-1d96-4889-9d55-08d6e380e389
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 15:26:44.2044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9N+INspqF3yuSB+fVWCYtlVrBOD/hWx8ff0NpmT+VQ=;
 b=NAk6MiRshWSLt2uxBX2btimFlSurOTxdPH8CvhlxTr/DZr7kFbjrlFSG9rfQzqjOB7r5xUhrNxDF3nGfI4KUeIvQ0gkGPTLgHBM5aDiNa77QZHlFj1j1KImFYZeCn4I8LP3+NCH1Wouz+ndDgbtHNBV+lFAhZlQQVzkHjdujlqA=
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
Cc: nd <nd@arm.com>, "Tiannan
 Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Jonathan Chai \(Arm
 Technology China\)" <Jonathan.Chai@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwNzo1MToxOEFNICswMTAwLCBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBIaSBCcmlhbiAmIFZp
bGxlOgo+IAo+IGtvbWVkIGhhcyBhIGZvcm1hdCttb2RpZmllciBjaGVjayBiZWZvcmUgdGhlIGZi
IHNpemUgY2hlY2suCj4gYW5kIGZvciBrb21lZGFfZmJfY3JlYXRlLCB0aGUgZmlyc3Qgc3RlcCBp
cyBkbyB0aGUgZm9ybWF0K21vZGlmaWVyCj4gY2hlY2ssIHRoZSBzaXplIGNoZWNrIGlzIHRoZSBm
dXJ0aHVyIGNoZWNrIGFmdGVyIHRoZSBzdWNoIGZvcm1hdAo+IHZhbGlkIGNoZWNrLiBhbmQgdGhl
IGRldGFpbGVkIGZiX2NyZWF0ZSBpcyBsaWtlOgoKVGhhbmtzIGZvciB0aGUgZGV0YWlsLCBpdCBz
b3VuZHMgZ29vZC4KCi1CcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
