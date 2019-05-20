Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6E22B60
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246678919F;
	Mon, 20 May 2019 05:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130059.outbound.protection.outlook.com [40.107.13.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E578919F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:43:41 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 05:43:38 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:43:38 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drm/komeda: Potential error pointer dereference
Thread-Topic: drm/komeda: Potential error pointer dereference
Thread-Index: AQHVDs75IJ2/qTTzt0+NH2vjSD797g==
Date: Mon, 20 May 2019 05:43:38 +0000
Message-ID: <20190520054331.GB1724@james-ThinkStation-P300>
References: <20190503122525.GA29695@mwanda>
In-Reply-To: <20190503122525.GA29695@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fe05b8e-94d9-4b49-07d5-08d6dce61b6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4958; 
x-ms-traffictypediagnostic: VE1PR08MB4958:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4958007CFDC2BA717B0685A1B3060@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(136003)(39860400002)(376002)(396003)(366004)(199004)(189003)(66066001)(11346002)(8936002)(54906003)(81166006)(58126008)(55236004)(8676002)(305945005)(6916009)(99286004)(476003)(486006)(6246003)(5660300002)(7736002)(81156014)(86362001)(446003)(256004)(71190400001)(71200400001)(14444005)(229853002)(33656002)(316002)(6116002)(386003)(68736007)(14454004)(2906002)(52116002)(102836004)(6486002)(66946007)(1076003)(53936002)(478600001)(6436002)(186003)(26005)(33716001)(73956011)(3846002)(25786009)(6506007)(6512007)(9686003)(66476007)(66556008)(4326008)(64756008)(66446008)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +DSEyaH1kgLMz3u0kiLdhG3Zr8xB+Mk2niys6p/e6ZofcsdH83qE3aw4DwevshUCAmJcIo9cX8FtlI87SD3th7JzVKJZydGNoWudsESsp34r89qQnd3ccrLhqL2UU72rwjHEqI/Zh6Ay74T+Rds2ruwfMNVTlnVKaDG5Z8GA1baskwb6gtb43lo9uKTz6HOo59pORUofZjkdb4mRJ0TqsvzoJyCHZY5sLx/hxjX8PDyUDO/a01RlUdreT09LSjlfKlkImxbIVh3QCdwlzhKgPbB/d5mqYqDhQ3Jy8nxsq7Q8Jjw6JpFSBuWoHfqOnHNyjpqx78HWUXjFJFOupy5/bNsGXg0e0wIRgia5QohtEBFnLd9lrjbpvtTXEtr/p1fUv+z0VNFzi/oWocn1EUYphUI3tc2kmGeD2DbR2mE3FUU=
Content-ID: <1A8BFFC4EC453A408D2336704001C380@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe05b8e-94d9-4b49-07d5-08d6dce61b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:43:38.2864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu9FZSU02YyFspJ2JSmkuUX1BpVOZlFv9wXLfeue16U=;
 b=RqfC3qpbySxvXqln2VP4gUNAPvRR2uvbYSL4VJZ0v5jNbAlYN/T527GCIcbYoxKk6st5jE5kLFkApyzhUWkgBhMyGueSn8dEpoNZz+JhaecHxzr7AxYxbEqyWGwVZVhZNLcE/nTZKQvFkBYQzWoMPpqK0It/6I2VX2OEUyieQTU=
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

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDM6MjU6MjVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBXZSBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0
ZSgpIHJldHVybnMgYW4gZXJyb3IKPiBwb2ludGVyIGJlZm9yZSBkZXJlZmVyZW5jaW5nICJjcnRj
X3N0Ii4KPiAKPiBGaXhlczogN2QzMWI5ZTdhNTUwICgiZHJtL2tvbWVkYTogQWRkIGtvbWVkYV9w
bGFuZS9wbGFuZV9oZWxwZXJfZnVuY3MiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1
LmR1ZGF1QGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BsYW5lLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+IGluZGV4IDA3ZWQwY2MxYmM0NC4uYzdlNWZjNmU1NTAw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9wbGFuZS5jCj4gQEAgLTY0LDcgKzY0LDcgQEAga29tZWRhX3BsYW5lX2F0b21pY19jaGVjayhz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAljcnRjX3N0ID0g
ZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZS0+c3RhdGUsIHN0YXRlLT5jcnRjKTsKPiAt
CWlmICghY3J0Y19zdC0+ZW5hYmxlKSB7Cj4gKwlpZiAoSVNfRVJSKGNydGNfc3QpIHx8ICFjcnRj
X3N0LT5lbmFibGUpIHsKPiAgCQlEUk1fREVCVUdfQVRPTUlDKCJDYW5ub3QgdXBkYXRlIHBsYW5l
IG9uIGEgZGlzYWJsZWQgQ1JUQy5cbiIpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQoKVGhh
bmsgeW91IGZvciB0aGUgZml4aW5nLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
