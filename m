Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01851CE4A4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 16:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CA56E0CD;
	Mon,  7 Oct 2019 14:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BAC6E0CC;
 Mon,  7 Oct 2019 14:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuByP4CuX2s1haYmNWblMCn57f62rzoYBHgKzrh6N5cER017B5aD4Ga+C2rZQTwOmuA8Iam3pyJmqHka41QEhd+dXI65Osu3azFpbE0ElbtvzQM18T/dsuNm8+vj2SdBDCzbM0BjD7j8BaBG+aFj8mKHgxxUDN74UFR98wxV4Xfexi3x7y6VVzUYsgggUeULcGBtd8vieGVE5LPMg1cIU23BNKwqB8xe0mrN3pyj3u+7ZxJCuOIz4f0DE2mqpR5LxZMBs82aIsq5QEzp6qGk6HwK2lOl2jipwOu5mYXpFdZUUWUVQsG4gro5rJHg2hLzdoV4jRX2bUvNl5kPZ8C9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4D0QOxR1pMWnTI4vcK+H6omBMYJrVN4wbAIv7leQ28=;
 b=JJi8NGXuAw/qKi9ylDNYxI40cH4J+//lvX1SLyqKeUYQoUVSzl7fFWwiDSbFVS0weAYxlwxbEccn8a76ib9lfCTH9/62m1ZSX8GyNqAlI5/FMmidWrSv7b4b6NFFbFgIKi0ccR5NNWNeAigbZaJ3Y30Z87yfixOXkbxIwT804/hiDD5zWPYJEfls6TLCqmq4wk9XvvnFT67vQh6CIWtk6rD5Owxo4QVV7mkZb7B8t3ccPYgZduaa4ehGELPXKhgMChcZHguOYAaFDT+gLK1ciwT2bYZv7DEiaQzDkKrsxBlQVLW6iHZgg1eqRcMhA0qlWa5yW07+V/cU4spYzSJIAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0264.namprd12.prod.outlook.com (10.172.79.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Mon, 7 Oct 2019 14:06:46 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 14:06:46 +0000
From: Harry Wentland <hwentlan@amd.com>
To: YueHaibing <yuehaibing@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koo, Anthony"
 <Anthony.Koo@amd.com>, "Cyr, Aric" <Aric.Cyr@amd.com>,
 "Harmanprit.Tatla@amd.com" <Harmanprit.Tatla@amd.com>,
 "bayan.zabihiyan@amd.com" <bayan.zabihiyan@amd.com>, "Othman, Ahmad"
 <Ahmad.Othman@amd.com>, "Amini, Reza" <Reza.Amini@amd.com>
Subject: Re: [PATCH -next] drm/amd/display: remove set but not used variable
 'core_freesync'
Thread-Topic: [PATCH -next] drm/amd/display: remove set but not used variable
 'core_freesync'
Thread-Index: AQHVfDTsIlq0DJfsn0ealK21btG4e6dPOHuA
Date: Mon, 7 Oct 2019 14:06:46 +0000
Message-ID: <db644945-24df-7d67-7fc6-880833466593@amd.com>
References: <20191006105735.60708-1-yuehaibing@huawei.com>
In-Reply-To: <20191006105735.60708-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTOPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::35) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f17cd831-53ae-4536-937b-08d74b2f96ab
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0264:|CY4PR1201MB0264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB026442F423A041375F05274A8C9B0@CY4PR1201MB0264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:334;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(189003)(199004)(52116002)(8676002)(229853002)(6512007)(6436002)(8936002)(6116002)(478600001)(3846002)(6636002)(14454004)(58126008)(54906003)(110136005)(81166006)(66446008)(64756008)(66556008)(76176011)(2906002)(6486002)(99286004)(81156014)(25786009)(316002)(14444005)(256004)(6246003)(66476007)(66946007)(186003)(4326008)(386003)(71200400001)(71190400001)(305945005)(7736002)(6506007)(102836004)(26005)(36756003)(486006)(476003)(2616005)(11346002)(446003)(66066001)(31686004)(53546011)(5660300002)(2501003)(31696002)(65956001)(65806001)(2201001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0264;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c8X5g7SXLyJvseixgavmqWIrT7zAIHKO6mT3MelMz6AmhAN72dIpjKgH4QkJPQDusHadcwK+zd8U7Vz1Wjpp+EZ1SyKlU49Sag0goG8qPX9P8yWQxi2t1zukdl9zY1/ZKYHRrSUDhIZL2+2MwsR/3RIkwBvSSmHlxRHcnBrYwYbTlVxsGBET2+oxK6e0BEXJHhWtAoeGxKBRbW2esxN5epWPPy7cyiJaXttul4zft9/e4E8u8sNq1FSnagjW5PKPUQ3bMAWI5JzYFkA/Ape6XlZMe6Fm5NC0AxU6TowC/jYCjFOF2CRemEod330jJulM7YslICzMJG7brZuYb55FtHquUd5C5l/JESXkyL1npfIB8ZE7uPv4TvWpPrYSwx5n82n7ZD+tqHjiyjlL+avVCclje3N/J2xslmU0BvavKZM=
Content-ID: <ABB90FE0D76EB24289D707AB2965C821@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17cd831-53ae-4536-937b-08d74b2f96ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:06:46.2616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eD/0kJmL5R4i+oqrROUaz/RAXDmaxRqSipDECnlw517iWy6fWV4E1oKWZYWkhZWX42qBQicypGnl0nBpiMVtpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4D0QOxR1pMWnTI4vcK+H6omBMYJrVN4wbAIv7leQ28=;
 b=yWNaMagUnE8NAJzooEY6dsIpBnzbp7TCTTLYkh9PbqjHt7YfZg2KkggSXsxhjbs6xO6bDJtsvu4OnfHN23cCv78mdq9NVJy3hUxWX7tz8uqdKTyJmJa+xc1wPRa42zRXCHerZ0lbX8LCD+siQ+O1a6ySyYRskwULl1IH2G7H9ck=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNiA2OjU3IGEubS4sIFl1ZUhhaWJpbmcgd3JvdGU6DQo+IEZpeGVzIGdjYyAn
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoNCj4gDQo+IHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmM6DQo+ICBJ
biBmdW5jdGlvbiBtb2RfZnJlZXN5bmNfZ2V0X3NldHRpbmdzOg0KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYzo5ODQ6MjQ6
DQo+ICB3YXJuaW5nOiB2YXJpYWJsZSBjb3JlX2ZyZWVzeW5jIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdDQo+IA0KPiBJdCBpcyBub3QgdXNlZCBzaW5jZSBjb21t
aXQgOThlNjQzNmQzYWY1ICgiZHJtL2FtZC9kaXNwbGF5OiBSZWZhY3RvciBGcmVlU3luYyBtb2R1
bGUiKQ0KPiANCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+DQoNClJl
dmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFy
cnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVz
eW5jL2ZyZWVzeW5jLmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVz
L2ZyZWVzeW5jL2ZyZWVzeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxl
cy9mcmVlc3luYy9mcmVlc3luYy5jDQo+IGluZGV4IDljZTU2YTguLjIzN2RkYTcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVz
eW5jLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvZnJlZXN5
bmMvZnJlZXN5bmMuYw0KPiBAQCAtOTgxLDEzICs5ODEsOSBAQCB2b2lkIG1vZF9mcmVlc3luY19n
ZXRfc2V0dGluZ3Moc3RydWN0IG1vZF9mcmVlc3luYyAqbW9kX2ZyZWVzeW5jLA0KPiAgCQl1bnNp
Z25lZCBpbnQgKmluc2VydGVkX2ZyYW1lcywNCj4gIAkJdW5zaWduZWQgaW50ICppbnNlcnRlZF9k
dXJhdGlvbl9pbl91cykNCj4gIHsNCj4gLQlzdHJ1Y3QgY29yZV9mcmVlc3luYyAqY29yZV9mcmVl
c3luYyA9IE5VTEw7DQo+IC0NCj4gIAlpZiAobW9kX2ZyZWVzeW5jID09IE5VTEwpDQo+ICAJCXJl
dHVybjsNCj4gIA0KPiAtCWNvcmVfZnJlZXN5bmMgPSBNT0RfRlJFRVNZTkNfVE9fQ09SRShtb2Rf
ZnJlZXN5bmMpOw0KPiAtDQo+ICAJaWYgKHZyci0+c3VwcG9ydGVkKSB7DQo+ICAJCSp2X3RvdGFs
X21pbiA9IHZyci0+YWRqdXN0LnZfdG90YWxfbWluOw0KPiAgCQkqdl90b3RhbF9tYXggPSB2cnIt
PmFkanVzdC52X3RvdGFsX21heDsNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
