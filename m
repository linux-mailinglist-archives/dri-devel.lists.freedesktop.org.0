Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE96DE1EE9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F556EB02;
	Wed, 23 Oct 2019 15:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7956EB00;
 Wed, 23 Oct 2019 15:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKdZaFiUXDI5OAoVUicNR7Bz0iqDrW+g0kjK9PJRn1JnMgsIFb0Bi7UNxefdkpgGJ0ZviRBXufQIEeH/92haABRyx1AtnYp476v7OZmoKtWnDteUuh3vR7irtbMJorzJAaHO0/2ogqpmiAy//q06x+kCE4mcdTHIY/02OJJddjokrL3MAfwZAeyVkXssIqn72Qtob0H3TFl+0nzqjrk9v0hQvLq62MgqYhQy4vKocgX9PXBl5FMALxNDP3tCssKU2iyML4Ck3Nb9mkBOkBPyFl3dzEdMn2jEP01CMW/iR6d1h2SX7knSEBveb0rz9+TWRA0X+1r8JOszGHn5bCHRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCnhIUVzMGcsPJXOAuWP66Vcw/fVbfhmNdyag6Ckgn8=;
 b=lBfZxxjmLFbw+M8RhzPpZI6jxlR8fD7RtLBEMHGUdGWwe1WfxuKpyV+tsJPWc/l9KsFQgQmgAnzLs3e4t+0AHcG2pfmWI1ly/Gs+hFPPkYawy5w5Rp9VahEV4mMUD2iSWQ6B2uCc/a6RAPBRBR/zjvDcLfIogMyPkP1BHm0e9O3vJ5f832BjMmc/2VWpiYf4W8dlmcSvOdX+iD41p/cU9S2mb7Fp2oGO/EXkalexek534w6N2gUmyMnJI4nvD/65r6wQaG0YiKdc8j7myNxBL9fpG+W5wEgMPSrerC6jP5jcUiJvAejJCDjGEZqvtWnEHRDArIEt3s4xsxrL/aAH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2503.namprd12.prod.outlook.com (10.172.116.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 15:09:40 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 15:09:40 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Wambui Karuga <wambui@karuga.xyz>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/radeon: remove assignment for return value
Thread-Topic: [PATCH] drm/radeon: remove assignment for return value
Thread-Index: AQHVhtpVI7Za6Y3hgUObDSSJ2llK9adoWhCA
Date: Wed, 23 Oct 2019 15:09:40 +0000
Message-ID: <2bed3fab-e84d-226d-b552-1ac088fc5d9c@amd.com>
References: <20191019073242.21652-1-wambui@karuga.xyz>
In-Reply-To: <20191019073242.21652-1-wambui@karuga.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-clientproxiedby: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc7d57a9-bb4f-4a72-8068-08d757cb06b6
x-ms-traffictypediagnostic: CY4PR1201MB2503:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB250318DBA5C9852DCD22C5628C6B0@CY4PR1201MB2503.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(305945005)(110136005)(3846002)(2906002)(7736002)(4326008)(6246003)(6116002)(52116002)(6486002)(71190400001)(76176011)(54906003)(4001150100001)(71200400001)(316002)(36756003)(229853002)(99286004)(6436002)(58126008)(6512007)(31696002)(478600001)(81156014)(8936002)(81166006)(446003)(14454004)(8676002)(186003)(11346002)(476003)(31686004)(386003)(5660300002)(53546011)(256004)(102836004)(6506007)(26005)(2616005)(25786009)(66446008)(66946007)(486006)(66476007)(65806001)(66556008)(2501003)(66066001)(65956001)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2503;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K3EDtX/sOL1kFqbk78Ilb9AjHuw+dEqQZqCQsPOxDMx8ozKRCYGc4J1nO7i9uY4baJ5afvBkIhYP7rLLx5q9uBNYGJgEokJTixxiB6VL/tlXcso0Ra3IPFydz1knckkCQdik5/toyNC+36eHt2pj7Oes/kmYqEDfzeRPNW8oX+C0irIaqTTMyWDJ9kBBFs7HXni/KFZLh0ByGHsB8qoXy6/a53HhCotsJxe9h1JJeAVN9EKdPik/UopnB/rnGfSrXZJhWIXjuBEfZfmC+KD8wDHnc4wSLHNbaSnaqTXZwxZhbZo70fGKZnsPzu928+93MdFPsxbEOVROaPn3xgdxFq3cATo+8Bne5jrtzE94dFJprGb+iOzZeIFEoA8JsMHPVFDy4pSPjycY7x4heqv+PaTx5j4Mcn8ih5C9qLO0zeDpk5POOaM4NQvIydFHIpl9
Content-ID: <02F5B14052661E4FAD9585FB77B7C616@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7d57a9-bb4f-4a72-8068-08d757cb06b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 15:09:40.1734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APw0BRkEeZD6y6aICHG2WYezWrsDR0GPYaxdTrbij/u4FYB38VNnyoJA9bgPseyYz92Mtqg12VAv+6tEkMZ7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2503
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCnhIUVzMGcsPJXOAuWP66Vcw/fVbfhmNdyag6Ckgn8=;
 b=xtnaKHonNZaYKsbTFvDO+dS4kPPZrpSyp17/z+8b8svzwVGIzUCcsO1QyUrUgnqZQ0q+MWZUgsTyMssaOYCMFIq3OpcBQrSOahf6sXnsDC/nqixgUObr2VHgRmKCshtK+WUuFy38yrJICImAXJluGhiLqIrCAk6XIj/59RFBzpM=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "outreachy-kernel@googlegroups.com" <outreachy-kernel@googlegroups.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xOSAzOjMyIGEubS4sIFdhbWJ1aSBLYXJ1Z2Egd3JvdGU6DQo+IFJlbW92ZSB1
bm5lY2Vzc2FyeSBhc3NpZ25tZW50IGZvciByZXR1cm4gdmFsdWUgYW5kIGhhdmUgdGhlDQo+IGZ1
bmN0aW9uIHJldHVybiB0aGUgcmVxdWlyZWQgdmFsdWUgZGlyZWN0bHkuDQo+IElzc3VlIGZvdW5k
IGJ5IGNvY2NpbmVsbGU6DQo+IEBADQo+IGxvY2FsIGlkZXhwcmVzc2lvbiByZXQ7DQo+IGV4cHJl
c3Npb24gZTsNCj4gQEANCj4gDQo+IC1yZXQgPQ0KPiArcmV0dXJuDQo+ICAgICAgZTsNCj4gLXJl
dHVybiByZXQ7DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdhIDx3YW1idWlAa2Fy
dWdhLnh5ej4NCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KDQpSZXZpZXdlZC1ieTogSGFycnkg
V2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoNCg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgfCA4ICsrLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
ay5jDQo+IGluZGV4IDYyZWFiODJhNjRmOS4uZGFmZjlhMmFmM2JlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2lrLmMNCj4gQEAgLTIyMSw5ICsyMjEsNyBAQCBpbnQgY2lfZ2V0X3RlbXAoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpDQo+ICAJZWxzZQ0KPiAgCQlhY3R1YWxfdGVtcCA9IHRlbXAgJiAw
eDFmZjsNCj4gIA0KPiAtCWFjdHVhbF90ZW1wID0gYWN0dWFsX3RlbXAgKiAxMDAwOw0KPiAtDQo+
IC0JcmV0dXJuIGFjdHVhbF90ZW1wOw0KPiArCXJldHVybiBhY3R1YWxfdGVtcCAqIDEwMDA7DQo+
ICB9DQo+ICANCj4gIC8qIGdldCB0ZW1wZXJhdHVyZSBpbiBtaWxsaWRlZ3JlZXMgKi8NCj4gQEAg
LTIzOSw5ICsyMzcsNyBAQCBpbnQga3ZfZ2V0X3RlbXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYpDQo+ICAJZWxzZQ0KPiAgCQlhY3R1YWxfdGVtcCA9IDA7DQo+ICANCj4gLQlhY3R1YWxfdGVt
cCA9IGFjdHVhbF90ZW1wICogMTAwMDsNCj4gLQ0KPiAtCXJldHVybiBhY3R1YWxfdGVtcDsNCj4g
KwlyZXR1cm4gYWN0dWFsX3RlbXAgKiAxMDAwOw0KPiAgfQ0KPiAgDQo+ICAvKg0KPiANCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
