Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C306B480F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4E6EAF6;
	Tue, 17 Sep 2019 07:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410135.outbound.protection.outlook.com [40.107.141.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0DE6E029
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 04:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtMKnseAepIPPBk14nlSE0dH6lnpul7BZtbtcN8I83C/spSOGsE5/OrpZPsycuDMZhrHUpNRtRNFe1SPbiePJKCmtxuFKXxxlm+RPxxPQBpz6Wtc4okui7+Rruo8Xq1u0/A2R67OIOB0l5VTQpAiqZCoFzy/2YclM15xswEDPg5g5NgP2ee2Tv0vmOHNDHLS5r7SV/+y1exduvVyzWcXzl+jhkYCPl1VDI6VTgP20fNpzd/tVr8ncKG8Tqsn1ZkGLftbbMC0jZjfxE8qMvr91dnzzCWh5/WMvcpGflaWtXUv0psa8gC9/7h5K6u6dUGY21XJGdTmXy1upNdidmezYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbWTECiLrgqYHKyN/CetsK3wUFojhIJV6AZwfpVE/Fo=;
 b=JnzqqszeY8j31SmrsrcRvksmNATEMUdOUqlvayMKSmbg4j20U4hsdCD8rTtj/2x+FRRvOpO1qQ1zft6YdaS5tev1iqKG9pgxV+eQzJzTzp9vMHYRdm9hzHczXsGxdnbUDJtCk43prVyzo4Q8xquKw+/QWgxtkyUdZrpTQ+QgogBi1yN7DggIlMIOMoQZjqUjmzg6R4kApBQA9pphLqMgCi2hoWU9OL4Woy0zJLpeZxGDtvppRq5Q8g3hJOZfZsTMtOQlyJcqEtkE0xrccRdXklSEuIOZ20WAFA1bwO0tc71Sz8PWtaD9+Sz3w836EYCWPkn0Ldn/zFTsFKnb6vjBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4415.jpnprd01.prod.outlook.com (20.179.173.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Tue, 17 Sep 2019 04:38:58 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 04:38:58 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: RE: DRM Driver implementation question
Thread-Topic: DRM Driver implementation question
Thread-Index: AdVslX1ZBzegHzojRVS64lgG04s8jgAenS2A
Date: Tue, 17 Sep 2019 04:38:58 +0000
Message-ID: <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6f16fad-c1ba-44eb-27b7-08d73b28f4bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TYAPR01MB4415; 
x-ms-traffictypediagnostic: TYAPR01MB4415:|TYAPR01MB4415:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB44155E797DDDB4BDADA6D8DDD88F0@TYAPR01MB4415.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(189003)(51444003)(199004)(81166006)(6246003)(3846002)(66066001)(8676002)(86362001)(4744005)(4326008)(71200400001)(3480700005)(256004)(478600001)(25786009)(14454004)(486006)(6862004)(81156014)(5660300002)(476003)(9686003)(33656002)(55016002)(6116002)(229853002)(54906003)(2906002)(446003)(305945005)(71190400001)(8936002)(6636002)(64756008)(76116006)(66556008)(6506007)(66946007)(76176011)(7736002)(316002)(26005)(74316002)(66476007)(66446008)(102836004)(6436002)(11346002)(186003)(99286004)(52536014)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB4415;
 H:TYAPR01MB4544.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s9zZ46vhRg+t9z4vW6ZQesABXJCvsu1AxhwD3vJP4Dl5dY8RQMnEjEHX5gNBwk/X5mFer58yAAfVgHFWEhDgBXbbAGxA8PEO5goZ27kXBVF/3TV0LwgFHQg0i62T4E1pVkBjhXdlzUdVW8jkmPU9mVKVOzCBaIEWcZsDx2Fa5L+GUUJxLMbsYoTcEjqTlQGRa/zglpR+Ve06/ARuRu/o4jNCyVS1bqNtWhFc/xl9SC9mDuLyav+dSaB5rcGT5ueikXGEnbemwMHBtK61uijJzF2rWiRAvif2WyznEMraPusl2Zmz/LoOMJqEGIsOXPv9UrVze5FIVvHaMkSBum8gU1NfjYOqtF65134lyaJ0HGSJR65xf0Xn+Uct21gV9kBZvxXBZJbzQBdEEYMT/oQSyL7hC/wsDN2A8+/Et1cuwgA=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f16fad-c1ba-44eb-27b7-08d73b28f4bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 04:38:58.5764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ve2+nwRpxYi/sbVDsUY8qEwbKqb8B+L20G/ZBc9wjRgePQXVb3eZB3nXXCy97fHZyYsM5q2dgKqzNQ403EWm7GyFyXJPPqk02oV2KpNxGta0QXwKFsFHDPPv6g+JQ5v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4415
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbWTECiLrgqYHKyN/CetsK3wUFojhIJV6AZwfpVE/Fo=;
 b=a9ElEh+TuzrJp15EqJAe8QnTf6xBeOH3cYcmAEif3mid0us4QB1B9Qz/SeopSarnQiwMwHEbc6esDFSjkmbGSsXzicx8dDHzlx1PUTsHsdFR+3My5gNhlHM0U1ro75o4JGTX78YXgrTiE1PB9WUWpIueFMhvNCDpF+9Zc07UzPA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2FyZXRoLAoKPiBGcm9tOiBHYXJldGggV2lsbGlhbXMsIFNlbnQ6IE1vbmRheSwgU2VwdGVt
YmVyIDE2LCAyMDE5IDEwOjU2IFBNCj4gCj4gSGkgTGF1cmVudC9LaWVyYW4sCj4gCj4gSSBuZWVk
IHRvIHVwc3RyZWFtIGEgZHJpdmVyIGZvciBhIGRpc3BsYXkgY29udHJvbGxlciB0aGF0IHdpdGhp
biBpdHMgcmVnaXN0ZXJzIG1lbW9yeSByZWdpb24gY29udGFpbnMgcmVnaXN0ZXJzIHJlbGF0ZWQK
PiB0byBhIFBXTSBkZXZpY2UuIFRoZSBQV00gZGV2aWNlIGlzIGZvciBjb250cm9sbGluZyB0aGUg
YmFja2xpZ2h0IG9mIHRoZSBkaXNwbGF5Lgo+IElkZWFsbHksIEkgd291bGQgbGlrZSB0byBjcmVh
dGUgYSBzZXBhcmF0ZWQgZHJpdmVyIGZvciB0aGUgUFdNLCBzbyB0aGF0IEkgY2FuIHJlLXVzZSAi
cHdtLWJhY2tsaWdodCIsIGJ1dCBzaW5jZSB0aGUgcmVnaXN0ZXJzCj4gZm9yIHRoZSBQV00gYXJl
IHJpZ2h0IGluIHRoZSBtaWRkbGUgb2YgdGhlIHJlZ2lzdGVycyBmb3IgdGhlIGRpc3BsYXkgY29u
dHJvbGxlciBJIHdvdWxkIG5lZWQgdG8gaW9yZW1hcCB0aGUgbWVtb3J5IHJlZ2lvbgo+IGZvciB0
aGUgUFdNIHJlZ2lzdGVycyByZWdpb24gdHdpY2UsIG9uY2UgZnJvbSB0aGUgZGlzcGxheSBjb250
cm9sbGVyIGRyaXZlciwgYW5kIG9uY2UgZnJvbSB0aGUgUFdNIGRyaXZlci4KPiBEbyB5b3UgdGhp
bmsgdGhhdCB0aGUgZG91YmxlIGlvcmVtYXAgd291bGQgYmUgYWNjZXB0YWJsZSB1cHN0cmVhbT8K
CkkgdGhpbmsgdGhhdCBhbiBNRkQgZHJpdmVyIGNhbiBzdXBwb3J0IHN1Y2ggaGFyZHdhcmUuIEkg
Y2hlY2tlZCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkIHJvdWdobHksCmFu
ZCB0aGVuIGF0bWVsLWhsY2RjLnR4dCBzZWVtcyB0byBoYXZlIGEgZGlzcGxheSBjb250cm9sbGVy
IGFuZCBhIFBXTSBkZXZpY2UuCgpCZXN0IHJlZ2FyZHMsCllvc2hpaGlybyBTaGltb2RhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
