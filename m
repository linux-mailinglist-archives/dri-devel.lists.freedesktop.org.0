Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE5D2CA8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8866E372;
	Thu, 10 Oct 2019 14:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720089.outbound.protection.outlook.com [40.107.72.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58CF6E372;
 Thu, 10 Oct 2019 14:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ/af05otW2RPQbVhELKa3m3WSkVhXSLppKEGqYAJGjSHiCT6DXMVms3gQ50louQYTyqVf2lTg8j9+J8iUz2jeIAZ1l7ou+XsyYSJiMn9CowPQbsCa7wMEF+1JuYCT4RUlsuGj6US4NcwnG2bi7a2GEKMNgTklx38kio/OhNrYcIgWlEvryAmNhGjZuddiUFfvakb4xMabM38lvRVkL6DLpKYB2MavggwqD62JWQM0k7tEvhipiPhWItkWcJ3bNao0UaWPA6DnJT1E/sM7V8TOFBfGyXeAtosVtIev8UG4eoqVXwdwcbejviOujNdI7yRMfLGQ4z+whZDPsZJKZEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6HgRwY2Nuwh9/5lItOvwGFrYl3LRZHMyitRQrAfBW4=;
 b=B/re5vlx1dcsa/soYz4vC6hJD5l6/BE14l1XjDXr94Na8DNu4xPC/k+FZ8hN4xtIZorFQdGlC6pbIFZExwEB8mjrmoThND0CVsBCtL/dQrQ+FutLEZDRF87fRv6Llsy1Yu+2nxZkEut6kY4F3ji6/pZHEnOUpYt0J9Tzl6v9Ln5U0hMfu+7EfmvPzS6OY7fYHzcM/6+7pmBNSSDhLOwC53UyNNl5LYtgXAoQd8/2DDIzQWWhtihqzpVBrE4+LWCgQtvJ7bLEBTSGTeHAPRdMsbNZipT6ozFT4hZJY9clQYcn3xl+x9G+6M+HrnQfmKfXUV45nDtwXtolDaCEDZCmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2422.namprd12.prod.outlook.com (52.132.143.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 10 Oct 2019 14:37:34 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.026; Thu, 10 Oct
 2019 14:37:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: [pull] amdgpu/kfd, radeon, ttm drm-next-5.5
Thread-Topic: [pull] amdgpu/kfd, radeon, ttm drm-next-5.5
Thread-Index: AQHVfyGh+vBdQ1wUhEOrmr2kG1IuhKdToxIAgABOQwCAAADhgA==
Date: Thu, 10 Oct 2019 14:37:34 +0000
Message-ID: <974fad60-126e-3876-fa6c-f1a9bbbdd59e@amd.com>
References: <20191010041713.3412-1-alexander.deucher@amd.com>
 <CAKMK7uHA_ffw=wDrzu76LXsbRCMVZXhmYogaTPb77u0MqzT7fg@mail.gmail.com>
 <CADnq5_O8q7FEG-GyJxK_jK22rAUnzd1KYcWSbXh=DzKeSNHxhA@mail.gmail.com>
In-Reply-To: <CADnq5_O8q7FEG-GyJxK_jK22rAUnzd1KYcWSbXh=DzKeSNHxhA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 820def19-b6d7-4b28-d758-08d74d8f6376
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2422:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2422A40930171F25E964E65483940@DM5PR12MB2422.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(66574012)(58126008)(71200400001)(52116002)(81156014)(81166006)(6436002)(5660300002)(71190400001)(6512007)(6306002)(66946007)(31686004)(478600001)(110136005)(54906003)(8936002)(36756003)(102836004)(316002)(6506007)(53546011)(46003)(386003)(8676002)(6116002)(229853002)(186003)(2906002)(256004)(446003)(11346002)(66476007)(486006)(6486002)(66556008)(64756008)(2616005)(66446008)(4326008)(31696002)(65956001)(65806001)(99286004)(966005)(6246003)(14454004)(7736002)(25786009)(305945005)(76176011)(476003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2422;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mg6tYv8vkFYpBdPNWfjAKLNBjnMjuQmZohts8XkkBg3uab0PV3BYHVw8WzAFpxEwQFUktafIynng1KI+ypOkGkDewrGmDbLhpu3FKo3dZWTbEkG4wekwAMcdcM2IIb3QLUCQLP4Mh8004DEV7JvMNtIqF3eCVvZfZ0zQoJAquQYnpiK3d05+xzFGXiSQ2JAKESAfe7fT24iNRB6PBzHtjMhhH2p6H3iSe4SJOWUndUTZtzVgpi6ETZ3fXv48qkPMtDDZueunHEhOCBd0lrIyF7LAsQdGd7S4OqhxgR7xEtGS31WiR1rUOAyqwlHkPcC24CFPv6a1M+Ov9Nhmv7NchqNYhtRyQSgK/Qmn2aNTdVB6fghTvulMDYJ9Pm4tS2oWgv2+R1eMzv6+HmGGqDdvxaEUu1ZdM/JlRbfrYbeR8k2KjQkjT/vcbLbrwG+7AYpM8IYgnV5bAIPMPy3ySVN/jg==
Content-ID: <79D00389BB78F443998EF327AF5EEC24@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820def19-b6d7-4b28-d758-08d74d8f6376
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 14:37:34.2608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrxxN2FvNF2OBeFRkqAx690go2x5iRSIwhGMslatSFs6nLAzUUSnWDz2nKe1l8aq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6HgRwY2Nuwh9/5lItOvwGFrYl3LRZHMyitRQrAfBW4=;
 b=Xan/5Lz+HCYchi+EB9J4bgTxHhD8LvAKgLYiuNxTl51OfbkXgK6HFL6TwIZsV6myEY/T5x2oJrVumzvIQPtu/K4s1czHN3w9teYkD3UPP9/f/bwn7kJc8wZ5xNfAlKrpgYmqXXFq57BLVarpfKWTjjw0ntbN2IutElYPwE+Qo80=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTAuMTkgdW0gMTY6MzQgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IEFPbiBUaHUsIE9j
dCAxMCwgMjAxOSBhdCA1OjU0IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+IHdyb3RlOg0KPj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNjoxNyBBTSBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gW1NOSVBdDQo+Pj4gQ2hyaXN0
aWFuIEvDtm5pZyAoMjIpOg0KPj4+ICAgICAgICBkcm0vYW1kZ3B1OiB1c2UgbW92aW5nIGZlbmNl
IGluc3RlYWQgb2YgZXhjbHVzaXZlIGZvciBWTSB1cGRhdGVzDQo+Pj4gICAgICAgIGRybS9hbWRn
cHU6IHJlc2VydmUgYXQgbGVhc3QgNE1CIG9mIFZSQU0gZm9yIHBhZ2UgdGFibGVzIHYyDQo+Pj4g
ICAgICAgIGRybS9hbWRncHU6IHJlbW92ZSBhbWRncHVfY3NfdHJ5X2V2aWN0DQo+PiBQYXRjaCBu
byBoYW5keSBmb3IgYSBkaXJlY3QgcmVwbHksIHNvIGFza2luZyBoZXJlIChidXQgdGhpcyBpcyB0
b3RhbGx5DQo+PiB1bnJlbGF0ZWQgdG8gdGhlIHB1bGwpOg0KPj4NCj4+IERvIHlvdSBoYXZlIG90
aGVyIHN0dWZmIHRoYW4gc2Nhbm91dCBhbmQgcGFnZXRhYmxlcyB0aGF0IG5lZWQgdG8gYmUgaW4N
Cj4+IHZyYW0/IEkgd2FzIGtpbmRhIGFzc3VtZSB0aGlzIGlzIG5lZWRlZCBmb3IgYmlnIHZyYW0t
b25seSBvYmplY3RzIHRvDQo+PiBmaXQsIG1ha2luZyBzcGFjZSBieSB0aHJvd2luZyBzdHVmZiBv
dXQgdGhhdCBjb3VsZCBhbHNvIGJlIHB1dCBpbnRvDQo+PiBzeXN0ZW0gbWVtb3J5LiBCdXQgc291
bmRzIGxpa2UgaXQgd2FzIG9ubHkgZm9yIG1ha2luZyBwYWdldGFibGVzIGZpdC4NCj4gWWVzLCBi
YXNpY2FsbHkgbWFraW5nIHBhZ2UgdGFibGVzIGZpdC4gIElmIHlvdSBwdXNoIGEgYnVuY2ggb2Yg
c3R1ZmYNCj4gdG8gc3lzdGVtIHJhbSwgeW91ciBwYWdlIHRhYmxlIHJlcXVpcmVtZW50cyBnbyB1
cCB0b28uICBTZWUgdGhlDQo+IGRpc2N1c3Npb24gaGVyZToNCj4gaHR0cHM6Ly93d3cuc3Bpbmlj
cy5uZXQvbGlzdHMvYW1kLWdmeC9tc2czODY0MC5odG1sDQoNClllYWgsIHR5cGljYWwgY2hpY2tl
biBhbmQgZWdnIHByb2JsZW0uDQoNCldoZW4geW91IGV2aWN0IHRoaW5ncyB0byBzeXN0ZW0gbWVt
b3J5IGJlY2F1c2UgeW91IGRvbid0IGhhdmUgZW5vdWdoIA0KVlJBTSB5b3UgbmVlZCBtb3JlIFZS
QU0gZm9yIHBhZ2UgdGFibGVzIHNvIHlvdSBuZWVkIHRvIGV2aWN0IGV2ZW4gbW9yZSANCnRoaW5n
cyB0byBzeXN0ZW0gbWVtb3J5Li4uLg0KDQpBZGRpdGlvbmFsIHRvIHRoYXQgd2UgaGF2ZSBhIGZl
dyBvdGhlciBjYXNlcyB3aGVyZSB3ZSByZWFsbHkgbmVlZCBWUkFNIA0KZm9yIGNvcnJlY3Qgb3Bl
cmF0aW9uIChmaXJtd2FyZSwgb2xkIE1NIGVuZ2luZXMgZXRjLi4uKSwgYnV0IG5vdGhpbmcgDQpt
YWpvciBsaWtlIHBhZ2UgdGFibGVzLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IEFs
ZXgNCj4NCj4+IC1EYW5pZWwNCj4+DQo+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
