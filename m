Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F527034D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD3C89CA0;
	Mon, 22 Jul 2019 15:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0034D89C9D;
 Mon, 22 Jul 2019 15:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWMpBuRAh9mT3QBoyyw8KFGZxq5sVhpVFlx02GjvAPHmGE+LNYe+QaiPiKpnNpfbVyVFIaSlPmFIMfqVQY5FNj/8fUd0vCGn/WkUvB2VS+LHDsjQGGxyEKozZl8AYwzuh+JAtfgUZKIAED1Q/vaukuLaoEccwg0LRDG2YxLpSDV7OI189uWW2S5KjuzUQljTYgjff3qkaOeUPW2B+vjKxz28QR2P8vxU1ErAOKheQs+w5Kgx2mG3ST3YHqq9hBB1Dr9O2pe/Zz+2qVG/BDD1gkdA8qzgYSF/QwqQHdrXa9TGke9eVEVUfsEJRzmeCbqOmthYLR2ecDoobdrjFSRw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAGAkhT9RuHcZlDpb+c3OrX5xbz57dFRw03Y7++xGBA=;
 b=VAOF2DCKvMaUtJ0RqcjIZI5SEz9klyYrzmeWfhcQ8IgbLUf/CXMV3k39ajglvEgfxp1hA/0YzzVJu/VA1qBdIE+bz9xhOGivZpMW4HbV107D94uj9/mMRDnFvOl50+3IlCc+VSLYq/Gp0fQbmdXQQGgKAHi1Urs7XDsNk3k9tJu05u87M1DOZCde9tMXqX98aFHAlMOCij9Bw9krNoE2c+GXwhoBr08+qEaFCFX2AXNFN//9j0A5wKC7U+YPuvX2tA0i2/Z32AUm4nxIKuijj5EEVKZZXa7niHOKo89bxBzYsAR+npnWBG6gWqeiLBkX2Un+v2M8k3N160cLcUkWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB2953.namprd12.prod.outlook.com (20.179.104.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 15:14:04 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::2532:fffd:e1e1:3bdc]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::2532:fffd:e1e1:3bdc%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 15:14:04 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Cox, Philip"
 <Philip.Cox@amd.com>, Oded Gabbay <oded.gabbay@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
Thread-Topic: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Fix missing break in
 switch statement
Thread-Index: AQHVQFzD0k60V1DuYEWlKWHlkB78W6bWv3YA
Date: Mon, 22 Jul 2019 15:14:04 +0000
Message-ID: <c735a1cc-a545-50fb-44e7-c0ad93ee8ee7@amd.com>
References: <20190721225920.GA18099@embeddedor>
In-Reply-To: <20190721225920.GA18099@embeddedor>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ac84dee-ad7e-46d2-5b11-08d70eb73bca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2953; 
x-ms-traffictypediagnostic: DM6PR12MB2953:
x-microsoft-antispam-prvs: <DM6PR12MB295324DE9FB007FD8B7A8685F4C40@DM6PR12MB2953.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(189003)(199004)(54906003)(31686004)(486006)(110136005)(58126008)(71190400001)(14454004)(71200400001)(81166006)(81156014)(8676002)(99286004)(68736007)(66066001)(65806001)(6436002)(6512007)(65956001)(31696002)(6486002)(316002)(2616005)(256004)(7736002)(14444005)(305945005)(446003)(11346002)(6116002)(3846002)(86362001)(229853002)(476003)(53936002)(4326008)(25786009)(65826007)(478600001)(186003)(6246003)(36756003)(66476007)(64756008)(66446008)(66556008)(66946007)(8936002)(53546011)(6506007)(386003)(102836004)(64126003)(52116002)(2906002)(76176011)(26005)(5660300002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2953;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pqgE0mKTBGO3RemRmO5o0RFVb8vu+h/IgbXRMMf5jl+Jp+dmWQrblX5ZmLgYdcmXEscGYYftbvoWeC5Y5GN+sfWFj8xOIlrwR+Z7aORUV3S6hK5+epVDjnaYBJvFhmGZiP3gflqBNt5Jez65mKRD4EcbFlOZ+z0j1L9gHDW4FHV+PPCezZOf1e/+2+FRSR9OfBi3QXJoqGssUPLmehTvfdBlCma712VdRjm2E1wFOrGBQaqlhsvxl9EtO1Hyj3yf3Vsz7gu9sjxiCBElIAQindsqvBuQQjusCsbdCtQYGyADLOfFzcIeKgNFcNhiTPjTZL0MGk+cXRgcB/H5zjlGxa7bjiBx0xF+iv+dLra5WfE6YTNgJ/pmrUgv+C3D4rxKCxbRtyCbcTon+aHnDlza3KmqWaVliWGXzkRlz8vQilk=
Content-ID: <EF7AB8BDCFF06A40AF540B3EE9D7DA4C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac84dee-ad7e-46d2-5b11-08d70eb73bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 15:14:04.3744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShaoyunL@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAGAkhT9RuHcZlDpb+c3OrX5xbz57dFRw03Y7++xGBA=;
 b=N+T99F4uaWxqYzy99W7cESJvzgjGqQjuaZGbELIpUyrKChJ7o+V1y7Eom5MunbUNMqFb7hX2T+wc7GSfy71vWhq+WttmTj+umxMpb8fPCVw91nwKS6Qfo8Il1BZB7SseVp/UUwVif3qO/3K5s2WAGZdoflBjIsSBqBdWKaRxlZ8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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

VGhpcyBvbmUgcHJvcGVybHkgaW4gcHVycG9zZSAsIFRoZSBtcWQgaW5pdCBmb3IgQ1AgYW5kwqAg
Q09NUFVURSB3aWxsIA0KaGF2ZSB0aGUgc2FtZcKgIHJvdXRpbmUgLg0KDQpSZWdhcmQNCg0Kc3No
YW95dW4ubGl1DQoNCk9uIDIwMTktMDctMjEgNjo1OSBwLm0uLCBHdXN0YXZvIEEuIFIuIFNpbHZh
IHdyb3RlOg0KPiBBZGQgbWlzc2luZyBicmVhayBzdGF0ZW1lbnQgaW4gb3JkZXIgdG8gcHJldmVu
dCB0aGUgY29kZSBmcm9tIGZhbGxpbmcNCj4gdGhyb3VnaCB0byBjYXNlIEtGRF9NUURfVFlQRV9D
T01QVVRFLg0KPg0KPiBUaGlzIGJ1ZyB3YXMgZm91bmQgdGhhbmtzIHRvIHRoZSBvbmdvaW5nIGVm
Zm9ydHMgdG8gZW5hYmxlDQo+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guDQo+DQo+IEZpeGVzOiAx
NDMyOGFhNThjZTUgKCJkcm0vYW1ka2ZkOiBBZGQgbmF2aTEwIHN1cHBvcnQgdG8gYW1ka2ZkLiAo
djMpIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogR3Vz
dGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4NCj4gLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jIHwgMSArDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMNCj4gaW5kZXggNGY4YTZmZmM1Nzc1
Li4xZDhiMTNhZDQ2ZjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9tcWRfbWFuYWdlcl92MTAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMNCj4gQEAgLTQzMCw2ICs0MzAsNyBAQCBzdHJ1Y3QgbXFk
X21hbmFnZXIgKm1xZF9tYW5hZ2VyX2luaXRfdjEwKGVudW0gS0ZEX01RRF9UWVBFIHR5cGUsDQo+
ICAgCXN3aXRjaCAodHlwZSkgew0KPiAgIAljYXNlIEtGRF9NUURfVFlQRV9DUDoNCj4gICAJCXBy
X2RlYnVnKCIlc0AlaVxuIiwgX19mdW5jX18sIF9fTElORV9fKTsNCj4gKwkJYnJlYWs7DQo+ICAg
CWNhc2UgS0ZEX01RRF9UWVBFX0NPTVBVVEU6DQo+ICAgCQlwcl9kZWJ1ZygiJXNAJWlcbiIsIF9f
ZnVuY19fLCBfX0xJTkVfXyk7DQo+ICAgCQltcWQtPmFsbG9jYXRlX21xZCA9IGFsbG9jYXRlX21x
ZDsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
