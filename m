Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1AD9C6B8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678826E14F;
	Mon, 26 Aug 2019 00:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0725.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::725])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319496EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq1+JMt7sXjPTQT/GTtOc+viAVDFHcAFaFi5o09LMypeFdSfQB8loVolBzYzy0Fxx9CGTwcmpjb8XNql9CMfoCHnezoEB6OfaC1gcqWSPly6HqsOk0laEU0orOrO9p+i//INDmW2CZHtuIfqf58X4ZEvbMIOA99KmD5q11WyWRXi8tWw21n8Zf1/7TFMymVE2O2YriXvrRoVnohZZX94llQ2ewS+RVy4bdf+JSloA/k1YvwwYHT59Bab4oZatCj8c2IUQIo4GOyiWl6ZkQKiZAkUDjvd0eHUDWTRpklv9OMyvMw2BuWXVV2CJJiaZ9JwJOogf6n/EPWCwodLtGKLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+XxbCn9n99C2q5/webEDiPCnjhg/SXsjfOw/mOvU6g=;
 b=hva7x5vR6E62Q+u9SvjCu3SkU5H2b/Pi3hdyZ43GkJMxRtYTHpHmmsUnmmbTxPRvMLl3P2Z+UUoa+p1GR5QU0oO6Exej7evHsCavA//ssaZs3xVJK9D2JvI2nBIQ1FIVqPDxEDDJzBOQvmCuMgxVbb5m0BOclmdiU+w/ZDecVzpMbAI9FMTOi+mbd9Q59kc4fIsEULDF26tsjMgUtnXCHTfNipXWdDmwhipBBlxx5/SIEvGy+OUmysWe1rLStI6DP/kpRE7XQyb+S7p8hvPU31KeynoSpKLZZ6ZkQjRd3qaeTx0yzQ7Q5DHrVIdZZ95ONGjId0c0jyJa23Er8MPX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3322.eurprd02.prod.outlook.com (52.134.66.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 08:47:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 08:47:33 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add possibility to specify the number of displayed logos
Thread-Topic: [PATCH 0/2] Add possibility to specify the number of displayed
 logos
Thread-Index: AQHVWY9nGTFic++gsUyrSu+1jjFGlQ==
Date: Fri, 23 Aug 2019 08:47:33 +0000
Message-ID: <20190823084725.4271-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0401CA0084.eurprd04.prod.outlook.com
 (2603:10a6:3:19::52) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1e1a3ab-5a7d-4bc0-a679-08d727a689ea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3322; 
x-ms-traffictypediagnostic: DB3PR0202MB3322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3322C72BAF832713A7C47369BCA40@DB3PR0202MB3322.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(376002)(396003)(39830400003)(189003)(199004)(2501003)(2351001)(86362001)(66066001)(36756003)(71190400001)(6512007)(71200400001)(2906002)(3846002)(4326008)(14444005)(53936002)(256004)(25786009)(7736002)(26005)(305945005)(6486002)(6916009)(186003)(1076003)(102836004)(6506007)(386003)(6436002)(99286004)(52116002)(8936002)(6116002)(476003)(2616005)(50226002)(486006)(81156014)(81166006)(508600001)(8676002)(14454004)(5660300002)(4744005)(66446008)(66946007)(5640700003)(54906003)(64756008)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3322;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2uKnoCyNFGRIV/1gmsD+vTELafSKMJavSdQieOKMPtrFF4IdSdYhn2HNYKy1OoigRX8UtxAfAp4D+QKDmW/cmO8p17gYp8BCKnMhkjIwxdriV8EY6lXr02Hfq4G1R+FiSPcCkGU9TiqWpEFlf9KCBVxwVYxEkpqSQ+wD4bisHpXQZU2CUOSSefG9SueflP0go+FOzHAK9zgKUMr+j5b0u8xUnSwW/KH/SijmDtkrvjDs8pmFVVH1L1SLELjhvdze94WTb170dcYnQvnRGeZnbCBweZNXm4SYcDwoMdtsiovvccuetWnYlham0IUO9tETATcfaSGQw4imtKWt3mdPPi5IS5uJRwlkQaucVULlOU6vkbK/f6gp3SOKPLl5DBXkdQkhGRywB6cWC4tR8BT5iZzUhP1adbUUzevv+P0mrZk=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e1a3ab-5a7d-4bc0-a679-08d727a689ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 08:47:33.5911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuoCl/9/chbh6finhWWf4mcXNYXz4O9hEjYqfXwThMgxcMX6NqHjrQBEr7ydNTnm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3322
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+XxbCn9n99C2q5/webEDiPCnjhg/SXsjfOw/mOvU6g=;
 b=TvtC6AP3t12QiZmcvBIUKcPPAaJAuJPQ6FrhnuYkTeueLNAdDnh03iuCzSWdsiqpO1uRNAfyNmPaBmAPaz4Ifx/rU4hRmayZVWPxLWZqBQk0UYb/KMwmZim3Lv9JYQ6RXXwTNtGd1QfDYZu8EPq5XRgsW69s2+J9XgfRMZ72xjU=
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
 Peter Rosin <peda@axentia.se>
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
ZS4KCkNoZWVycywKUGV0ZXIKClBldGVyIFJvc2luICgyKToKICBmYmRldjogZml4IG51bWJlcmlu
ZyBvZiBmYmNvbiBvcHRpb25zCiAgZmJkZXY6IGZibWVtOiBhbGxvdyBvdmVycmlkaW5nIHRoZSBu
dW1iZXIgb2YgYm9vdHVwIGxvZ29zCgogRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QgICAgICAg
fCAxMyArKysrKysrKystLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyB8ICA3
ICsrKysrKysKIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgIDUgKysrKy0KIGlu
Y2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
