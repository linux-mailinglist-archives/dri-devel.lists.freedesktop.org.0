Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E2214B0F0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0992B6ED0B;
	Tue, 28 Jan 2020 08:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40087.outbound.protection.outlook.com [40.107.4.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D06E436
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 16:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4+Cpb7ah4mc7PTTPvPqUWy0JtmO82LGwQAAhBoCvmynBwgDlTji8tEksEoUQEEEUmblyMgqpV4Bq/Y3TMrvOb9ZfRRZcEEMymyH1iOmr41miYA7ckqIu9pCP9wpRRhFqF0F/gyXnkLgDSqR82HlmbnlLJ7d4CQggYrnL15ES5s090yGeMVVfWTG6uFD3twoD84cWTtB4FDy5QgG/+w1uhqUBeBXv4GDz9vDBwmigREQaYY3qdjcGTSjMLe278h8IB3WxGQdCvgHBaEbU8APkOE34hi8HCKXC/ZqbR6sRQp3jQAN8W78nQGQKQAgILK6r2taBuPepgCxB3fofuJ8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpf3i8MnlA/X4E0Y1lItO4MWc+oS0Z8KhaSo2Gu/GW8=;
 b=eyAQCqoBqJbH0j/oy/fAzRKXIxUg6k9ku7EX4MAG7FOQKWb5jvarg16+Lx/8OuZ35VNIYmpPcVI1rnYIiDM+5YxOP/y9jz/Qbc6O2osasvhcdR7GX/UJExMsqoKP/hCCNeU6JAfPmozRBOcy9ztMi0NE6Lq6Pv/+soo0o7tktauhPRAnPIdXuRF8OsLY7kmJB3g/x//paPSqv95v68rTKDk9NOBUkYwQAdCnhh023pJvtHqUa0HHhczdNXfcPQllBCgLJGDm+YKWhZc5lG34pKLxD7spI7qr2iQuOK/el597ZD46RYTK1biEvh7pDbWhqOjXGJIDQGRF3hN3U97sfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpf3i8MnlA/X4E0Y1lItO4MWc+oS0Z8KhaSo2Gu/GW8=;
 b=p1FCDOXqdWOslhHFU+RF+CfSoaeSKtqf8KFt523PNrTl70CTUkobEZuDJ5GfbNU5QviUtV+Lvo1re/uX+05PoAB/6+zclGLNn0IPlpulCfXN+k3P+5YgKUhtxwCg3MnpvHKlpNU40oCwGT9e6yBw1dIsGmOTeGDSczc9Vnq0PoA=
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com (52.134.21.155) by
 VI1PR03MB4896.eurprd03.prod.outlook.com (20.178.15.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Mon, 27 Jan 2020 16:18:11 +0000
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9]) by VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9%5]) with mapi id 15.20.2665.017; Mon, 27 Jan 2020
 16:18:11 +0000
Received: from [192.168.1.121] (91.145.109.188) by
 HE1PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:3:8c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22 via Frontend Transport; Mon, 27 Jan 2020 16:18:10 +0000
From: =?utf-8?B?TWlrYSBQZW50dGlsw6Q=?= <mika.penttila@nextfour.com>
To: "hjc@rock-chips.com" <hjc@rock-chips.com>
Subject: Interfacing mipi-lvds bridge with rk3399
Thread-Topic: Interfacing mipi-lvds bridge with rk3399
Thread-Index: AQHV1S1exDZDNXtx80WTyob83jkbZQ==
Date: Mon, 27 Jan 2020 16:18:10 +0000
Message-ID: <2bf23a36-1b6c-c793-20f9-39aec71afc63@nextfour.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::18) To VI1PR03MB3775.eurprd03.prod.outlook.com
 (2603:10a6:803:2b::27)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mika.penttila@nextfour.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.145.109.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 956a7f2f-fca4-424a-fb7b-08d7a34480a3
x-ms-traffictypediagnostic: VI1PR03MB4896:
x-microsoft-antispam-prvs: <VI1PR03MB48963ED342C0EE41433ADB1B830B0@VI1PR03MB4896.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39840400004)(366004)(199004)(189003)(66946007)(66476007)(6916009)(6486002)(66556008)(5660300002)(31696002)(64756008)(66446008)(81166006)(52116002)(81156014)(8676002)(86362001)(8936002)(2906002)(36756003)(54906003)(4326008)(956004)(2616005)(31686004)(85182001)(508600001)(16526019)(16576012)(26005)(316002)(71200400001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB4896;
 H:VI1PR03MB3775.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nextfour.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJgFY0ilsljDNIqbmcg7ysmCOuT4FgWOzLUsDsGaXu8bSg1q3kDqxSw1Q8Btt8Nla/oDQXjIoqUvsgymEEwamu9xjytL03wSG/cArscvIQVgOkI27cLLb0bUS4Eah7bcxBjFEYhu8HrGMGEXt7QzHUlfuR2QKAZm11UjaQ6mAVlVMKe5yTiyYdgS30W0/3q/8gBu30UNxphD3DHAu+QuJN1hk2Uxz7S/SjZwtcU3E2YpKOfNKYsAS4MSIEiuby9JbYeVREvnLE7vKnDDAPueVFYnEkUQSIPYiLdv8cxR7JbxiMAHPX6mr55nk4nwkLRDP6rCjTpzgjQjnIYkFRxJ75c0ImnSMLNtLcRHT6OIunjgVjNGyjyuAsPCfqAkchOOZqCDYRq3TcaJ2PjRKTlnwu4/DE5840hc63dqbAw/OfCA8l8x5CCyxyP6QXJyR3wh
x-ms-exchange-antispam-messagedata: OAFKPqAPHHxXHhXuE1UfIFS0R0enmN56UnG+XJvNWhFrd5DZyDlV9rEO6gv9UbgA8SozC2IXCuvGedJcqHFnWgPFMvvsEDGNw2xTEQoRWzLhZQOlocUNc4fg1cKGxCxpYB7JMwn4QY3+Uvt2hHE7ng==
x-ms-exchange-transport-forked: True
Content-ID: <B660F7DC3638D6449B92F45E75C83E24@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956a7f2f-fca4-424a-fb7b-08d7a34480a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 16:18:11.0566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hh/AKsHO6LvzfzfIwCz0NeRrlQrbW6pghfJUd5+4iVmPNNBYFdmAD8i7AZYHbuKopyyRK0AV1reSYg6RU1lAboULmwPtUPfeVZJ+RA5N5No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4896
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCldlIGFyZSBkZXZlbG9waW5nIGEgY3VzdG9tIGJvYXJkLCBpbiB3aGljaCB3ZSBhcmUg
dXNpbmcgdGhlIHJrMzM5OSBzb2MuIA0KV2UgaGF2ZSBMVkRTIGRpc3BsYXlzLCBhbmQgdXNlIFRJ
IFNONjVkc2k4NCBicmlkZ2UgYXMgYSBtaXBpLWx2ZHMgYnJpZGdlLg0KVGhlIGJyaWRnZSBkZW1h
bmRzIHRoZSBEU0kgZGF0YSBsYW5lcyBiZSBpbiBMUC0xMSBzdGF0ZSAoc3RvcCBzdGF0ZSkuIFdl
IA0KZGV2ZWxvcGVkIHN1cHBvcnQgZm9yIHRoZSBicmlkZ2UgYXMgYSBEUk0gYnJpZGdlIG1vZHVs
ZS4gSXQgZ2V0cyBjYWxsZWQgDQppbiB0aGUgcGxhY2VzIHdlIHdhbnQsIGJ1dCB0aGUgcHJvYmxl
bSBpcyB0aGUgZGF0YSBsYW5lcywgbm8gaW4gTFAtMTEuIA0KSW5zdGVhZCwgdGhleSBzZWVtIHRv
IGJlIGxvd2lzaCwgdW50aWwgZGF0YSBzdGFydHMgKHRoZXkgc2VlbSB0byB2aXNpdCANCkxQLTEx
IGEgYSBzaG9ydCB0aW1lLCBsaWtlIDVtcyBiZWZvcmUgZGF0YSBzdHJlYW0uIFRoaXMgaXMgbm90
IGVub3VnaCANCmFuZCBub3QgdW5kZXIgb3VyIGNvbnRyb2wuIFdlIHdvdWxkIGxpa2UgdG8gZGVt
YW5kIHRoZSBtaXBpIGRocHkgaW50byANCkxQLTExIChvciBtYWtlIHN1cmUgaXQgc3RheXMgdGhl
cmUgZnJvbSBwb3dlcnVwL3Jlc2V0KS4gQW5kIGFmdGVyIA0KY29uZmlndXJpbmcgYnJpZGdlLCBs
ZXQgdGhlIGRhdGEgbGVhdmUgTFAtMTEuDQoNCkRvY3VtZW50YXRpb24gc3RhdGVzIHRoYXQgdGhl
IGRhdGEgc2hvdWxkIGJlIExQLTExIHVwb24gcGh5IHJlc2V0LiBIb3cgDQpjb21lIGl0IGlzIG5v
dD8gQW5kLCB3aGlsZSBib290aW5nLCB3ZSBzZSBhIGNvdXBsZSBvZiBzZXQgbW9kZSBjYWxscywg
DQpkdXJpbmcgd2hpY2ggdGhlIHBoeSBpcyBjb25maWd1cmVkLiBEdXJpbmcgdGhlIHBoeSBpbml0
LCB0aGVyZSdzIGNvZGUgdG8gDQp3YWl0IGZvciB0aGUgcGh5IGVudGVyIHN0b3Agc3RhdGUuIEZp
cnN0IHRpbWUgdGhlIHBoeSBzdGF0dXMgc2F5cyBpdCBoYXMgDQplbnRlcmVkIHN0b3Agc3RhdGUu
IEJ1dCBzZWNvbmQgdGltZSB0aGUgd2FpdCB0aW1lb3V0cyAoYWZ0ZXIgMTBtcyBvciANCnNvKS4g
V2l0aCBvc2NpbGxvc2NvcGUgYW55dGhpbmcgbGlrZSBMUC0xMSBpc24ndCBvYnNlcnZlZC4NCg0K
SGFzIHNvbWVvbmUgc3VjY2Vzc2Z1bGx5IGludGVncmF0ZWQgU042NWRzaTh4IHdpdGggcmszMzk5
ID8gRG9lcyBzb21lb25lIA0KaGF2ZSBpbmZvcm1hdGlvbiBvbiBob3d0byBjb21tYW5kIHRoZSBw
aHkgd3J0IHN0b3Agc3RhdGVzIGFuZCBob3cgaXQgDQpzaG91bGQgYmVoYXZlPw0KDQpUaGFua3Mg
aW4gYWR2YW5jZSwNCk1pa2EgUGVudHRpbMOkDQpOZXh0Zm91cg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
