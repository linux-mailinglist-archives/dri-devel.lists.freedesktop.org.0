Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B599DEC3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98D3898D9;
	Tue, 27 Aug 2019 07:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891B689070
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNfUCV95ETOWVzhCJnZRuV0/KiW6ePcs8w9GQ1pTe2XMm9rirG4ZqpwTm00rqju0OoFHxqIzcMwITvPs2U3JyxXppvIDJ674xXtTnWfMmJXOhrGeNzFV2NHIJAri0L5B5wLCqf3tq830H/Bqh+De9p7J19xr7X76zaNK91YcXJrOpYvj6kFGzkD4r4qy0YEG/LxoQV9/fFYWy7qqtcPTBNDpH5kImifDopWn5H4Ltd5doFr0gSFMKtsiF3v3y91KWLHBZBq0p1qZ+R9OpZ605fiRsKNmj1GBGSWYO3rfAbKeU3NU0Xyb/Y27wDuCLwnnw1ZPzxSB0pKJkxFkXYeAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMeM0C91Pv4VBt3O65TdvV1hEoXv618AVnADCtf63yM=;
 b=ZhGGzmvMFQhR6M1kL5nNdSD9poVFEZyPpxRNJTrnCQoxy2Q9y3Eqo0zLLP4Vn3qVvVRmfXU8ldHL65c7VPMeDAYO/k17omR5Pb4o5uTJFeNapd/+FCSbTOqwWeu2EOWOZM2cKQMvRHOy1tyGSq5oSGm9LGqhDGZXFBJ5DweBUFuqBTkzZDbPhenhsLqpYktpOljBmdnGU8HbHnLj+Jxitgw5EWrS99obkRGWv7vFsi6vlQhfNEy1h3agxm6DEJ+OdKSm4iZmHhYJGzvNKzh6AEgV9EAz8dusE5MXYeOujosehj76JVuv/Jb9Tk/ajExC9sCZtoIhRaCQm2ktm6LLHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3340.eurprd02.prod.outlook.com (52.134.67.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 19:58:49 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 19:58:49 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] Add possibility to specify the number of displayed
 logos
Thread-Topic: [PATCH v2 0/3] Add possibility to specify the number of
 displayed logos
Thread-Index: AQHVXEittl9d6/zAz0iinWdXxueGTA==
Date: Mon, 26 Aug 2019 19:58:49 +0000
Message-ID: <20190826195740.29415-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0901CA0054.eurprd09.prod.outlook.com
 (2603:10a6:3:45::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bb67bbf-f294-4f80-9bd0-08d72a5fcfa7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3340; 
x-ms-traffictypediagnostic: DB3PR0202MB3340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3340F6895D68348E7EB6875EBCA10@DB3PR0202MB3340.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(396003)(39830400003)(136003)(189003)(199004)(8936002)(256004)(316002)(54906003)(26005)(476003)(2616005)(99286004)(102836004)(386003)(6506007)(4744005)(66066001)(52116002)(5640700003)(508600001)(186003)(6436002)(486006)(66946007)(66476007)(66446008)(36756003)(64756008)(66556008)(2351001)(1076003)(6486002)(6916009)(2906002)(50226002)(86362001)(71200400001)(71190400001)(2501003)(53936002)(6512007)(4326008)(25786009)(3846002)(6116002)(305945005)(14454004)(81156014)(81166006)(14444005)(5660300002)(7736002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3340;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b2mMQfEXBY1lAbxpM7TADQmq+KCYL6SUfURiTkogsgnsOx+6CopdsJCx0KPPngX3lFaY6ZWlLABbnx+j385v/oXkazbKjxZ0KmvpSRjBLR20/wPQ2jwbBAmr+0dH94Kr1DN6gWsxxcHPKtCgLtDyv/msotdXN0DVIKNohhMmzCTmDXR1qeCM1nttl2cC/+1qq0nNB8FOQAbb41xHpZ/Cf/63CFZK4JErEAEsc/Mk/wMfUg3vWPUW3RWc7/jOb/bKjXGkB7tTsaPA8NKAc45m1WVNTbPfo6oUy9155hgeaMr9HlUx6VBVrH8J7XHEo/Arvo85XmxAl72dUY0rbhx2L/1e5vtg4Al1eppmAheTKNi/xuEKX/DTLHCJQyy10dMyoGmTN0fkDOtUon1w5OViFFOFNc/1LGZflQWemsfAbOU=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb67bbf-f294-4f80-9bd0-08d72a5fcfa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:58:49.5399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJYYvQsJFtCR2z7mYeLY9eLESvEEZio4MsSK5WjGJtcOpkwh9gyMI7ITo94ElfRP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3340
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMeM0C91Pv4VBt3O65TdvV1hEoXv618AVnADCtf63yM=;
 b=IsmC8/RzhQAoZfUSkH8S3WqCI24mqJeWfpzvsLbYGif3pwFR399eLyPM8noh36poete/h3+dJQQrUip7KBa5WFHohNedjsWX4lUcwdWo7wIzJsOmBTPzg8xNCy/tcxuOqP2Dg4+QLzrEglICVnKnymXDG58mnApW7QdcLSEZIoQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpUaGUgZmlyc3QgcGF0Y2ggZml4ZXMgdGhlIGZhY3QgdGhhdCB0aGVyZSBhcmUgdHdvIGl0
ZW1zIG51bWJlcmVkICI0IiBpbgp0aGUgbGlzdCBvZiBmYmNvbiBvcHRpb25zLiBUaGlzIGJ1ZyBp
cyBhIHRlZW5hZ2VyLi4uCgpUaGUgc2Vjb25kIHBhdGNoIGV4dGVuZHMgdGhhdCBsaXN0IHdpdGgg
YSBuZXcgb3B0aW9uIHRoYXQgYWxsb3dzIHRoZQp1c2VyIHRvIGRpc3BsYXkgYW55IG51bWJlciBv
ZiBsb2dvcyAodGhhdCBmaXRzIG9uIHRoZSBzY3JlZW4pLiBJIG5lZWQgaXQKdG8gbGltaXQgdGhl
IGRpc3BsYXkgdG8gb25seSBvbmUgbG9nbyBpbnN0ZWFkIG9mIG9uZSBmb3IgZWFjaCBDUFUgY29y
ZS4KCkNoYW5nZXMgc2luY2UgdjEKCi0gZG8gbm90IG5lZWRsZXNzbHkgZXhwb3J0IGZiX2xvZ29f
Y291bnQgW01hdHRoZXcgV2lsY294XQotIGFkZGVkIHBhdGNoIDMvMywgd2hpY2ggcmVtb3ZlcyB0
aGUgZXhwb3J0IG9mIGZiX2NlbnRlcl9sb2dvCgpDaGVlcnMsClBldGVyCgpQZXRlciBSb3NpbiAo
Myk6CiAgZmJkZXY6IGZpeCBudW1iZXJpbmcgb2YgZmJjb24gb3B0aW9ucwogIGZiZGV2OiBmYm1l
bTogYWxsb3cgb3ZlcnJpZGluZyB0aGUgbnVtYmVyIG9mIGJvb3R1cCBsb2dvcwogIGZiZGV2OiBm
Ym1lbTogYXZvaWQgZXhwb3J0aW5nIGZiX2NlbnRlcl9sb2dvCgogRG9jdW1lbnRhdGlvbi9mYi9m
YmNvbi5yc3QgICAgICAgfCAxMyArKysrKysrKystLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJjb24uYyB8ICA3ICsrKysrKysKIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5j
IHwgIDUgKysrLS0KIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgIHwgIDEgKwogNCBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
