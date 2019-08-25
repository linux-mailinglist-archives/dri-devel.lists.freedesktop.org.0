Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484DE9C6BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B27899E8;
	Mon, 26 Aug 2019 00:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150100.outbound.protection.outlook.com [40.107.15.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14F56E0FB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 09:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiaPv3frdIyg/umf0SsHKwXA9hucgOy9pOuaEvR1F+KwHPWQ6GnmBaBzIKwSXslpb7wNcc/p82hBmm3NUXUXiIpEr3dSKUSNyBo/iHcPBX5NABuZ+yoX03upzTkfwd7YUNlYYEHHbwrl/z37rYRSataEwBoyJnFaejrUylWAuxyxF6TVCKfSSc3OhtGCF97g7Aq+0gVwfTYN+Wr3McZjiAdBMRibyDpqhpH36HLNDhf/BT6Mfzd8e4hTXttCwzKkYcW0mLierViYqQgHgsN0eZHiH93a+V8DeiFQRjsffb2PwzgxvHG6FcfQgN1mjiA13fZKUNp3OM4QahF9aYMWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD3XPZYV4+7rW0+XwacvGaCFJI2PRWmuW4I/D4G4Lts=;
 b=ksTpA3jsfs/mW6ypBz1qnBnMRmdY71TnsnICRnRoUSMr9k5Iblndq/3oeIEl50dbfG3IcCMNJn1pzuw6kpz89QDb2h2QNCIIwz6hTQumK4BIdqQKVFdg42nTJBZ2ZE2uka07rc12f2Vu/JWYTIMUOg8NIJbDuOO6d4YktiBGS8tYXMIvaeO/ODlRni9hlI2AteMypl5XFL+NxBlbAfxtv+PU16d7Zh1tsE4+ih62kqdKurYTtWFDk2MPpx7BNf6GbCJK1j+ns4HipidrKWfvq/hpH4AbYX5BJ4vCeoxGhVt7xRgtYoDJfk6NeUdsDIcszcIDgYPaSI+POhFZukdbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3451.eurprd02.prod.outlook.com (52.134.72.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sun, 25 Aug 2019 09:35:53 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Sun, 25 Aug 2019
 09:35:53 +0000
From: Peter Rosin <peda@axentia.se>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 2/2] fbdev: fbmem: allow overriding the number of bootup
 logos
Thread-Topic: [PATCH 2/2] fbdev: fbmem: allow overriding the number of bootup
 logos
Thread-Index: AQHVWY9wDEebDlWGKU6SxCgqM+AamqcKb8sAgAEuCgA=
Date: Sun, 25 Aug 2019 09:35:52 +0000
Message-ID: <4194b690-027f-be16-dc4e-299643e75b83@axentia.se>
References: <20190823084725.4271-1-peda@axentia.se>
 <20190823084725.4271-3-peda@axentia.se>
 <20190824153446.GB28002@bombadil.infradead.org>
In-Reply-To: <20190824153446.GB28002@bombadil.infradead.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P190CA0040.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::29)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71fda20d-325b-4a27-3dca-08d7293f9edb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3451; 
x-ms-traffictypediagnostic: DB3PR0202MB3451:
x-microsoft-antispam-prvs: <DB3PR0202MB34519449D315069AD40A126DBCA60@DB3PR0202MB3451.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(346002)(376002)(396003)(51914003)(189003)(199004)(52116002)(11346002)(386003)(102836004)(65956001)(6506007)(65806001)(53936002)(66066001)(2906002)(53546011)(76176011)(66946007)(4744005)(66446008)(64756008)(66556008)(66476007)(36756003)(99286004)(256004)(5660300002)(6436002)(31686004)(6486002)(229853002)(6116002)(4326008)(26005)(86362001)(3846002)(31696002)(305945005)(7736002)(2616005)(186003)(25786009)(6246003)(6916009)(8936002)(446003)(71200400001)(508600001)(54906003)(6512007)(8676002)(71190400001)(14454004)(58126008)(476003)(81166006)(486006)(316002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3451;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eELRV+namhchu5zJL4dycpn8LIq+DAD1Mz6yh3bb2OmSgxo96yx3/Q2ezdVupfWP0Ec9s6sNe9Q7YhDnNNUqMcdXNhDjBkCMM14j4eahA1SLWKHmZvgt3RRYFt6z6jz6uw0IPJN30h/2UyM/aZEkoSXUR2tw0MTQWyNOuCKqxeGsnvWpru1KM7eHnS0ELR9l5DksDfOM1fGrV1wQTp0GW+Sss0hoQH+L08yiY4UyvFX0LKsLwivVIrwI5bCl/MifsuQ0+wbpsLLJ3JOKxvw9JRoADY5XlGqVngR+qMdlEfE6g3eJV3W5XxhM6HgMp2GWSDGZfytcuqvZdXGu0rnUbanuGKB2LVCQCybzLXIq9xNNgw17AG9rKPl/eQ6y4+4mFxF6BqqQYwKlxHPbVJ2u0IvjXUAj9ktf+7eU8BiBH+s=
x-ms-exchange-transport-forked: True
Content-ID: <20CFC03BFBBA1C48B7A294607FC89968@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fda20d-325b-4a27-3dca-08d7293f9edb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 09:35:53.2524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vK0x7Xevkz31d6JQKlIkkywrXORS0m2gbDrdgFL7mayWkBUDY48tCFnaFjFmVRmh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3451
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD3XPZYV4+7rW0+XwacvGaCFJI2PRWmuW4I/D4G4Lts=;
 b=Ds+94otnT70nFUTEIO3xDLL/NmYzDcpdOSwBUCVstLzLsvgw+ap+GXWOy7M96JRvFv4wT2rP8+hb8CkqlgYlZJaKo21UJ7SOnGyr9x2XUjmaaXO+Nj0jVlUEPzFzLqRUvZv+WbLBMT5UwuhdNFbY+K7/E+eMUvdqGpGvFx7ML4s=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNCAxNzozNCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6DQo+IE9uIEZyaSwgQXVn
IDIzLCAyMDE5IGF0IDA4OjQ3OjQ3QU0gKzAwMDAsIFBldGVyIFJvc2luIHdyb3RlOg0KPj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jDQo+PiBAQCAtNTYsNiArNTYsOSBAQCBFWFBPUlRfU1lNQk9M
KG51bV9yZWdpc3RlcmVkX2ZiKTsNCj4+ICBib29sIGZiX2NlbnRlcl9sb2dvIF9fcmVhZF9tb3N0
bHk7DQo+PiAgRVhQT1JUX1NZTUJPTChmYl9jZW50ZXJfbG9nbyk7DQo+PiAgDQo+PiArdW5zaWdu
ZWQgaW50IGZiX2xvZ29fY291bnQgX19yZWFkX21vc3RseTsNCj4+ICtFWFBPUlRfU1lNQk9MKGZi
X2xvZ29fY291bnQpOw0KPiANCj4gV2h5IGRvZXMgdGhpcyBzeW1ib2wgbmVlZCB0byBiZSBleHBv
cnRlZD8gIEFzIEkgcmVhZCB0aGUgTWFrZWZpbGUsIGZiY29uDQo+IGFuZCBmYm1lbSBhcmUgY29t
YmluZWQgaW50byB0aGUgc2FtZSBtb2R1bGUsIHNvIHdoaWxlIHRoZSBzeW1ib2wgbmVlZHMNCj4g
dG8gYmUgbm9uLXN0YXRpYywgaXQgZG9lc24ndCBuZWVkIHRvIGJlIGV4cG9ydGVkIHRvIG90aGVy
IG1vZHVsZXMuDQoNCkkgZ3Vlc3MgeW91IGFyZSByaWdodC4gSSdsbCBzZW5kIGEgdjIgdG9tb3Jy
b3cgd2l0aCBhbiBhZGRlZCBwYXRjaCB0bw0KdW5leHBvcnQgdGhlIGZiX2NlbnRlcl9sb2dvIHZh
cmlhYmxlIHdoaWxlIGF0IGl0Li4uDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpDaGVl
cnMsDQpQZXRlcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
