Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D559022B29
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E219C8915F;
	Mon, 20 May 2019 05:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6709A8915F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:37:59 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 05:37:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:37:55 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drm/komeda: Potential error pointer dereference
Thread-Topic: drm/komeda: Potential error pointer dereference
Thread-Index: AQHVDs4sZjc2KsmCH0WNvaCQQ5WVmw==
Date: Mon, 20 May 2019 05:37:55 +0000
Message-ID: <20190520053748.GA1724@james-ThinkStation-P300>
References: <20190503122525.GA29695@mwanda>
In-Reply-To: <20190503122525.GA29695@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de04d61-490e-4df8-cb77-08d6dce54ef1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4958; 
x-ms-traffictypediagnostic: VE1PR08MB4958:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB49585447F70DAF6F26FF9AECB3060@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(366004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(66946007)(6486002)(102836004)(1076003)(68736007)(6116002)(386003)(52116002)(2906002)(14454004)(6512007)(6506007)(9686003)(73956011)(25786009)(3846002)(66446008)(64756008)(66556008)(66476007)(4326008)(76176011)(6436002)(478600001)(53936002)(33716001)(186003)(26005)(305945005)(8676002)(99286004)(6916009)(55236004)(6246003)(5660300002)(7736002)(81156014)(476003)(486006)(11346002)(66066001)(58126008)(8936002)(81166006)(54906003)(229853002)(316002)(33656002)(86362001)(256004)(446003)(71200400001)(71190400001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x/BtK7fWE7CznVdapvxihRU/5s1U/uu+09bw9XbOEaneTDhuHr2rPXF/nyyMak2E685I3OWuEkD3MRJGz+w3m0l9VKxmj6lFZd0STylajy5fUoGWszmmG1/b5MftL4oFQ/RadkQwohzUl+IRXaRidIltEv82qB1c5cvx7xfn7lPgzLgXAWlG1PtRAgzLP8hXVPbR0p3yFR1Iw7geJj0AqM7VGswbyhfiQ7P9ffZSO0VOPYbCb7xQeY54CRw+O2iW0EF/gDqG/tG9rqfIukHw0jgzS8Y6ciVdzDAxeSoNtR72/zG9AvU+7l2CeG+W8FThWHFr4p8oyrO+NOul6z035zYdjnmFHx3O9H7JgljHYKrEH510oRThTfiiVmIGRLaYAXozzuvLtT4TddbCI1APZChgQeuQxBJi4sOkQsp6f1U=
Content-ID: <3ED8629A5D8EBD49B046F77750C758AD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de04d61-490e-4df8-cb77-08d6dce54ef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:37:55.4811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs6bNwILKP5oILv7Hfq1bkr2k1jKxsSUGpjXjjUlbbU=;
 b=BDd/S0RlC3l3JWwecIC+BXBe7iyfwu1CiExSgHr34/h+p3d1uIDAu4Uj2iuFbrGEQK5frx1dcP/n0RchHgoMd1QptQ8tQ6yp6cPFqc87kh8SNMIwlxaAIUGJtqrc3o6kHvIS1XFg5LynnoqrUFyW6vt1yV10NRsusviRXKi1A2g=
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 nd <nd@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuIAoKT24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDM6MjU6MjVQTSArMDMwMCwgRGFuIENh
cnBlbnRlciB3cm90ZToKPiBXZSBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgZHJtX2F0b21pY19nZXRf
Y3J0Y19zdGF0ZSgpIHJldHVybnMgYW4gZXJyb3IKPiBwb2ludGVyIGJlZm9yZSBkZXJlZmVyZW5j
aW5nICJjcnRjX3N0Ii4KPiAKPiBGaXhlczogN2QzMWI5ZTdhNTUwICgiZHJtL2tvbWVkYTogQWRk
IGtvbWVkYV9wbGFuZS9wbGFuZV9oZWxwZXJfZnVuY3MiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBBY2tlZC1ieTogTGl2aXUgRHVk
YXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+IGluZGV4IDA3ZWQwY2MxYmM0NC4uYzdl
NWZjNmU1NTAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9wbGFuZS5jCj4gQEAgLTY0LDcgKzY0LDcgQEAga29tZWRhX3BsYW5lX2F0b21p
Y19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAlj
cnRjX3N0ID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZS0+c3RhdGUsIHN0YXRlLT5j
cnRjKTsKPiAtCWlmICghY3J0Y19zdC0+ZW5hYmxlKSB7Cj4gKwlpZiAoSVNfRVJSKGNydGNfc3Qp
IHx8ICFjcnRjX3N0LT5lbmFibGUpIHsKPiAgCQlEUk1fREVCVUdfQVRPTUlDKCJDYW5ub3QgdXBk
YXRlIHBsYW5lIG9uIGEgZGlzYWJsZWQgQ1JUQy5cbiIpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+
ICAJfQoKVGhhbmsgeW91IGZvciB0aGUgZml4aW5nLgotLSAKUmV2aWV3ZWQtYnk6IEphbWVzIFFp
YW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
