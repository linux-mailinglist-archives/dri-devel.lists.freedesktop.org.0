Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20BE1CB3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486796EACE;
	Wed, 23 Oct 2019 13:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E136EAD6;
 Wed, 23 Oct 2019 13:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI7w62c0FuHh7gWJovXPHS6YiKYBnMbCF0bMbuuBPicx3pSy+LU0SqjDktEkjP+G6Es8EMXEOgsYiVRR/rAfhmc8STQiWehRweva2VPs6BdPRCKShK4GHX9Gun05kcCwUXCA3uYB+omKHqQQMKhZ5R1+TRQfP0j1jIJl95nNxHFH3QTNfvd9wMbrH21OBth8xfK9jUSLtZ56djChiBlAS71ENgZYi4p6mchVjmvCV3Ch2eCo+jP6oO6Zwx7i2pEj15FKEDqVzuSR8yYhQuXPfw5LKTlrz3pk5nu0bNXPaSCbjxpbOA2qwQ8bedKDRVr3reSogRdHkxReV8GM2ZUFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcALwbRggHuEL+ngRJBDqegkYJatfNONegGp/7qjzhs=;
 b=fOAfigJbSFrLeqdmsTPrpJ53jL/eMQ62+nb9HXjgbX3SetsDkhSLZDHyhIu/7snGqhEL/ImGTHvln+P2MQ2lc1Dhq1EG+t+BJ/arhTx/iqi/BOO1c+7/BVBiqeLiysI6oVhYq4WeIvw2dxLv3jcSNcozWl3I735k5P0Z/5wY6YbwCBpX2J5kxN7UCh/EWsf7dLcNuKJJ3ZiPZZWAiKAtS3O8ZbOQG3eZ/35pmS4qtmaE17V34gIthk0SyoVZ4IIbSfbuCi1j08n/PHFMxCmqXsfxazgUr6o2SD72QcNaKkcGnjQN61blzH/ui3r/w+BrqjVuhbt5CojKl6/NoqsJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0070.namprd12.prod.outlook.com (10.172.76.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Wed, 23 Oct 2019 13:35:10 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 13:35:09 +0000
From: Harry Wentland <hwentlan@amd.com>
To: zhongshiqi <zhong.shiqi@zte.com.cn>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: Re: [PATCH] dc.c:use kzalloc without test
Thread-Topic: [PATCH] dc.c:use kzalloc without test
Thread-Index: AQHViXxGNdmdXeQn1kuTzFek/LoFxqdoOmQA
Date: Wed, 23 Oct 2019 13:35:09 +0000
Message-ID: <fa46cad1-8845-78b7-eb6a-45942813020b@amd.com>
References: <1571819543-15676-1-git-send-email-zhong.shiqi@zte.com.cn>
In-Reply-To: <1571819543-15676-1-git-send-email-zhong.shiqi@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 02407ec4-7f5c-4c46-2a47-08d757bdd2bd
x-ms-traffictypediagnostic: CY4PR1201MB0070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00701337BF08CD3516D091508C6B0@CY4PR1201MB0070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(189003)(199004)(76176011)(386003)(6506007)(65956001)(6486002)(476003)(66066001)(26005)(2616005)(229853002)(186003)(99286004)(11346002)(316002)(256004)(6436002)(478600001)(25786009)(102836004)(52116002)(53546011)(31686004)(4326008)(4744005)(6512007)(65806001)(486006)(446003)(36756003)(58126008)(6636002)(14454004)(81156014)(305945005)(6246003)(4001150100001)(71200400001)(54906003)(81166006)(71190400001)(8676002)(2906002)(6116002)(66476007)(110136005)(31696002)(64756008)(8936002)(5660300002)(3846002)(66556008)(66946007)(7736002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0070;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpUgVSBySIBKmcJfAWliADljm4dOAwkRg/ZjkYJ5vvwt+o7sC6lhGtrOo5SO4ZhwwpYZD16phOWu5KwVZTpK2AfOnpZuOMQCU2963NkfEs5rraR/3ijZqIHn7y36Nv+ZpjmaTD7vwbC/q0LVcvOIb781y9bFJft9zYUwXBIgOy4vsZKgdM5V9+u/a6PJqy9v3cqlJWMBHNT2p4B0TxHlrknReeAf3HBV0FOQvP9R4YoWIX+k2Nb7QeEx7DPVYA78wBC2ZSLdKe5jHgZzffyo9nJo2Cjq3GQ3CDngIGIehPxbheJej03FkTdIUPLq5Vo2LUuvyNzGzHX7lL6lrmA/cYD/xHibC5VmhQHyRty0ylcziRJAtvM4SMQwWpWBY/Wn2flQJF2lmKHsN9rfom/NZX0x1oE98phF5hYxh6BEizM8eKYmh/VH0h/jwfL/Fl11
Content-ID: <F3FA943D0EB68E45B22BDE28854746E9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02407ec4-7f5c-4c46-2a47-08d757bdd2bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 13:35:09.6430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5+V7nki8KWlnt+mUbW2KYLjrce2KPy+ScmWIRZovjW36i9pJwMforEsBKHa4RnkEO0QJv40CF5ZaeI6cEDQsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcALwbRggHuEL+ngRJBDqegkYJatfNONegGp/7qjzhs=;
 b=d0ce1aJu++WcHeJsZJ1j8SXIn8HB46YeFftu7tt3xPj/TiNn1LN1rguk2EQ7DiAqMYS16f+o+4Zt7C8WSNOfdc7XQUiUiqcbb0fxogg6QAVGRVrQ8JGmTdxSzyZCeZw2cRWKHOwEZd164qxY1rI3Fk3uMgCGqbM015SOnftI6lI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>,
 "David.Francis@amd.com" <David.Francis@amd.com>, "Liu, 
 Wenjing" <Wenjing.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "cheng.shengyu@zte.com.cn" <cheng.shengyu@zte.com.cn>,
 "wang.yi59@zte.com.cn" <wang.yi59@zte.com.cn>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Aidan.Wood@amd.com" <Aidan.Wood@amd.com>,
 "xue.zhihong@zte.com.cn" <xue.zhihong@zte.com.cn>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Park, Chris" <Chris.Park@amd.com>,
 "Yang, Eric" <Eric.Yang2@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMyA0OjMyIGEubS4sIHpob25nc2hpcWkgd3JvdGU6DQo+IGRjLmM6NTgzOm51
bGwgY2hlY2sgaXMgbmVlZGVkIGFmdGVyIHVzaW5nIGt6YWxsb2MgZnVuY3Rpb24NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IHpob25nc2hpcWkgPHpob25nLnNoaXFpQHp0ZS5jb20uY24+DQoNClJldmll
d2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkN
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCA0
ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYw0KPiBpbmRleCA1ZDFhZGVkLi40Yjg4MTlj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4gQEAg
LTU4MCw2ICs1ODAsMTAgQEAgc3RhdGljIGJvb2wgY29uc3RydWN0KHN0cnVjdCBkYyAqZGMsDQo+
ICAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wDQo+ICAJLy8gQWxsb2NhdGUgbWVtb3J5
IGZvciB0aGUgdm1faGVscGVyDQo+ICAJZGMtPnZtX2hlbHBlciA9IGt6YWxsb2Moc2l6ZW9mKHN0
cnVjdCB2bV9oZWxwZXIpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWRjLT52bV9oZWxwZXIpIHsN
Cj4gKwkJZG1fZXJyb3IoIiVzOiBmYWlsZWQgdG8gY3JlYXRlIGRjLT52bV9oZWxwZXJcbiIsIF9f
ZnVuY19fKTsNCj4gKwkJZ290byBmYWlsOw0KPiArCX0NCj4gIA0KPiAgI2VuZGlmDQo+ICAJbWVt
Y3B5KCZkYy0+YmJfb3ZlcnJpZGVzLCAmaW5pdF9wYXJhbXMtPmJiX292ZXJyaWRlcywgc2l6ZW9m
KGRjLT5iYl9vdmVycmlkZXMpKTsNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
