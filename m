Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49D76E1C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 17:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A0C6EDAB;
	Fri, 26 Jul 2019 15:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7653A6EDAB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dakCZIe8hHhOxDlPmrlhLPsNP7b99zsOrsJHuiQhpPmLTIobQveUTucxGyrJ0DQS4Pk1wucN16BIEryU8hcHnkzFahPabA/sGzu9BNv22PRAjRVMjDfDEGacFq4jJfBouxkpqLxKOHWQA5qYplHXMxxJ58TAUqh5DvLwsTZh77CIomaCxt53uZ7u9iAiB3eKFlDodDe92t8naibDyNHxI5sOQAMmSzCwmvPTNrL5MUt4pzfXUkrgfPpig+J0JSQV07mWQliTJkbIfa/7SAd8T5j15vxaugfVSq3Fgpt1PB9yvVLNGmTIZ/zuw563JtsuD0pb+2QfX1c+O76eZByoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLvehu91nYhmKJrq69eac/vavFv37spvn9yB3kJZaAA=;
 b=NSa1zFXZ16fTVZysYZIB9Sn7CMIKF4kXlY3RivF/fzvju6H34z6j5nIAcnUgWnZxF8YG/zufZBjw8QOIMYDyL9lTQ4L0apbmi4IiQyd7JVyfsTp45j3mD7HTJXEBntp2lcrOeAG8IPSVEfYuj2Yu3JE0MQLhcPnY8N5LG4iVaTMBbJMbLudnggFhEjn4CM0SaCnr/D7GZulszi3JfL72DimF4lWfmqZUJ0iGR4hOp7xCK0Ntta/w7zg4FAyMYtfZcpnfZpCzUPErmVNkUP0oQs5R28Vd7iXXFd93KsmOFuGrfdQHK/xpIt6siCU8KSC3IYaH8NDOGNP4HB9n9DtNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3946.namprd12.prod.outlook.com (10.255.174.155) by
 DM6PR12MB2796.namprd12.prod.outlook.com (20.176.118.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 15:40:18 +0000
Received: from DM6PR12MB3946.namprd12.prod.outlook.com
 ([fe80::b116:9b53:d395:3e71]) by DM6PR12MB3946.namprd12.prod.outlook.com
 ([fe80::b116:9b53:d395:3e71%3]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 15:40:18 +0000
From: David Zhang <dingzhan@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Thread-Topic: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Thread-Index: AQHVG8HK18lqmjWuAUS4jQvHb1raUKamQciAgAAXmICANv7/gA==
Date: Fri, 26 Jul 2019 15:40:18 +0000
Message-ID: <7eaef5ad-a8a0-7ec9-13b9-a2b4702db970@amd.com>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
 <20190605170639.8368-2-dingchen.zhang@amd.com>
 <dee2bc30-8af4-98f9-a7e9-936c925af840@amd.com>
 <20190621154609.GF12905@phenom.ffwll.local>
In-Reply-To: <20190621154609.GF12905@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::45) To DM6PR12MB3946.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfa43dcf-6607-480d-8d3f-08d711df8fb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2796; 
x-ms-traffictypediagnostic: DM6PR12MB2796:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB279644450F83B7DE62063CF68DC00@DM6PR12MB2796.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(316002)(6436002)(68736007)(6306002)(6246003)(446003)(11346002)(6512007)(36756003)(2616005)(81166006)(476003)(8936002)(81156014)(14454004)(31696002)(14444005)(110136005)(54906003)(229853002)(256004)(4326008)(66066001)(66476007)(66556008)(66446008)(76176011)(25786009)(8676002)(2906002)(66946007)(64756008)(6486002)(53546011)(6506007)(3846002)(71190400001)(31686004)(71200400001)(52116002)(6116002)(966005)(6636002)(305945005)(186003)(7736002)(99286004)(478600001)(5660300002)(102836004)(486006)(386003)(53936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2796;
 H:DM6PR12MB3946.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nZ/Jtii9iUf80eC0nA8UotpYzVt2QMQh8Pj6HvdtHgafD1DcHl0MiZZNgso4rUdViloRtShDbkGQLkgFrp2CpJ92t6/q6zL5TJncQsRg6HyePZPg82v0GG4Cv3zbJWDK5I511cNRy8bA8/x+4oP4hvzaQklEmJlZ5Ix7orBz2n4W5+gz8JjYYOGjQd08CJvNKR1sk4yfF/7TXOCs3LZAvUR83rxc2CjGBJbKpvgwPZHAIY5h5aE2T0m11ICqiE2PkGkP7yh3tt5UmdyO+niomU+Q2VZtNg6Sy8KzuduOAhFYb05G/KGx+8r5GYs9wRyrE5QY5IwcaoSdSLN+xmWWByv3JzNBvpVPkVrPD0JGImrHoo+3yc7c0rglPVtQdRmgbezNy8KUP4g+HXwS04mvf+UBM/7pX6nPZiPKB1MqXO4=
Content-ID: <D7D9E0BF47D4D74C859718E6C6500552@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa43dcf-6607-480d-8d3f-08d711df8fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 15:40:18.6783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dingzhan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2796
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLvehu91nYhmKJrq69eac/vavFv37spvn9yB3kJZaAA=;
 b=kx1KnGAngUZR8ukgD5NJOXwznFrELUoEs9QDunUbQaJU6RtM9Wduzsfdi2D6mOtvDjZVr2qKZWkPQVI2RIWfCe415xvAWpzQHFrKZN9vVI8wVsAK2DmzA2PkgjhZjyXh8SpvUz3KfOVPU3IVJ+ZHsy0H8HuQRQ3rvjynX8MR0go=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Dingchen.Zhang@amd.com; 
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
Cc: "Zhang, Dingchen \(David\)" <Dingchen.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDYtMjEgMTE6NDYgYS5tLiwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24g
RnJpLCBKdW4gMjEsIDIwMTkgYXQgMDI6MjE6NDNQTSArMDAwMCwgSGFycnkgV2VudGxhbmQgd3Jv
dGU6DQo+PiBPbiAyMDE5LTA2LTA1IDE6MDYgcC5tLiwgRGluZ2NoZW4gWmhhbmcgd3JvdGU6DQo+
Pj4gdG8gdGVybWluYXRlIHRoZSB3aGlsZS1sb29wIGluIGRybV9kcF9hdXhfY3JjX3dvcmsgd2hl
biBkcm1fZHBfc3RhcnQvc3RvcF9jcmMNCj4+PiBhcmUgY2FsbGVkIGluIHRoZSBob29rIHRvIHNl
dCBjcmMgc291cmNlLg0KPj4+DQo+Pj4gQ2M6TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+LCBI
YXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4sIE5pY2sgPE5pY2hvbGFzLkthemxhdXNrYXNA
YW1kLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8ZGluZ2NoZW4uemhh
bmdAYW1kLmNvbT4NCj4+DQo+PiBJIHdvbmRlciBob3cgdGhpcyBpc24ndCBjcmVhdGluZyBwcm9i
bGVtcyBmb3IgUm9ja2NoaXAgd2l0aCB0aGUgQW5hbG9naXgNCj4+IGJyaWRnZS4NCj4+DQo+PiBS
ZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+Pg0K
Pj4gSGFycnkNCj4+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNf
Y3JjLmMgfCA3ICsrKysrKysNCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMNCj4+PiBpbmRleCBlMjBhZGVmOWQ2
MjMuLjBlOGJjYzEzMDM4MyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnNfY3JjLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMN
Cj4+PiBAQCAtMjQ5LDYgKzI0OSwxMyBAQCBzdGF0aWMgaW50IGNydGNfY3JjX3JlbGVhc2Uoc3Ry
dWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQ0KPj4+ICAgCXN0cnVjdCBkcm1f
Y3J0YyAqY3J0YyA9IGZpbGVwLT5mX2lub2RlLT5pX3ByaXZhdGU7DQo+Pj4gICAJc3RydWN0IGRy
bV9jcnRjX2NyYyAqY3JjID0gJmNydGMtPmNyYzsNCj4+PiAgIA0KPj4+ICsJLyogdGVybWluYXRl
IHRoZSBpbmZpbml0ZSB3aGlsZSBsb29wIGlmICdkcm1fZHBfYXV4X2NyY193b3JrJyBydW5uaW5n
ICovDQo+Pj4gKwlpZiAoY3JjLT5vcGVuZWQpIHsNCj4+PiArCQlzcGluX2xvY2tfaXJxKCZjcmMt
PmxvY2spOw0KPj4+ICsJCWNyYy0+b3BlbmVkID0gZmFsc2U7DQo+Pj4gKwkJc3Bpbl91bmxvY2tf
aXJxKCZjcmMtPmxvY2spOw0KPj4+ICsJfQ0KPiANCj4gRWl0aGVyIHlvdSBkb24ndCBuZWVkIGEg
bG9jayB0byBsb29rIGF0IC0+b3BlbmVkLCBvciB5b3UgbmVlZCBpdC4gTm90DQo+IGJvdGguIFRv
byBsYXp5IGNoZWNrIHdoaWNoIHdheSB0aGlzIGlzLCBpdCdzIHByYWN0aWNhbGx5IHcvZSBoZXJl
IDotKQ0KPiAtRGFuaWVsDQo+IA0KDQpIaSBEYW5pZWwsDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcg
b3V0IGFuZCBzb3JyeSBmb3IgbGF0ZSByZXBseS4gV2lsbCBjcmVhdGUgdGhlIG5ldyANCnBhdGNo
IGZvciB0aGF0Lg0KDQotRGluZ2NoZW4NCg0KPj4+ICsNCj4+PiAgIAljcnRjLT5mdW5jcy0+c2V0
X2NyY19zb3VyY2UoY3J0YywgTlVMTCk7DQo+Pj4gICANCj4+PiAgIAlzcGluX2xvY2tfaXJxKCZj
cmMtPmxvY2spOw0KPj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
