Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23121F29
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 22:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0213899A7;
	Fri, 17 May 2019 20:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC93899A3;
 Fri, 17 May 2019 20:43:17 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHSPR00MB254.namprd12.prod.outlook.com (10.169.207.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 20:43:15 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47%2]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 20:43:15 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Erico Nunes <nunes.erico@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu <yuq825@gmail.com>, 
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Eric Anholt <eric@anholt.net>, Rex Zhu <Rex.Zhu@amd.com>, "Huang, Ray"
 <Ray.Huang@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, Nayan Deshmukh
 <nayan26deshmukh@gmail.com>, Sharat Masetty <smasetty@codeaurora.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>
Subject: Re: lima_bo memory leak after drm_sched job destruction rework
Thread-Topic: lima_bo memory leak after drm_sched job destruction rework
Thread-Index: AQHVDOetX+QTnVZgAECwos4LEdEqcqZvyHiA
Date: Fri, 17 May 2019 20:43:15 +0000
Message-ID: <3f1a556e-dd4c-3dc7-b966-a63baf1e7c52@amd.com>
References: <CAK4VdL2wa=UrpRqfML-ymkEX7LkE6FP3ykgNUQonLdjmaydq_Q@mail.gmail.com>
In-Reply-To: <CAK4VdL2wa=UrpRqfML-ymkEX7LkE6FP3ykgNUQonLdjmaydq_Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::40) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e0edbf0-a788-4cac-92ff-08d6db0848ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHSPR00MB254; 
x-ms-traffictypediagnostic: MWHSPR00MB254:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHSPR00MB254DCB2C6AAA0BBDD15A688EA0B0@MWHSPR00MB254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(136003)(366004)(346002)(199004)(189003)(53546011)(52116002)(386003)(7416002)(8676002)(31686004)(6506007)(81156014)(2906002)(81166006)(6116002)(8936002)(110136005)(68736007)(305945005)(14454004)(186003)(7736002)(99286004)(25786009)(3846002)(76176011)(316002)(486006)(11346002)(36756003)(476003)(6486002)(446003)(478600001)(2616005)(26005)(86362001)(966005)(6512007)(72206003)(6246003)(256004)(14444005)(5660300002)(229853002)(102836004)(66066001)(2501003)(31696002)(6436002)(53936002)(6306002)(66556008)(64756008)(66446008)(66476007)(66946007)(73956011)(2201001)(71190400001)(71200400001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHSPR00MB254;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zhGqGQiEx2AUhQA4I9Myd0zX3d+9P9rPA4RcDKIByuyo2nDAOIyP6l7DfDw3BZnZkG37ZQAy2/RM9Ff60ggudrCH1+yYPKQ4m6XLgvC00wah1RH+r503s6RH8SAHWdXTNkQnqXV5Wnvib1LPEXh0cEUtvqkOQ4Vaka+PlAwzezcm655OwilCeniaO1EjMITtZIu8Xw4f/+pFTfPQvpfEXRzNTIjfcfPMUxwGifP4MODTa5NGRJovnTf0xdXIltrdLFGCp2HMnRwuUpuaVEzrLBfpCd9hcnBlIbC8UuggG70fF0eQNb33CXujyW+W7mmTDGbLNIDf8Y5Q4Z+azgrSQCNjSEg7Bp/dxuBGQOzq2xNlHCzzOw5bGqPWDKcI8EaYZ/0OkwhfEUPoA7K0KMHqqoX37m5bUvy7J8WdkTm/cxs=
Content-ID: <FF854D2EE3A696459B054A3FE83A90BE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0edbf0-a788-4cac-92ff-08d6db0848ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 20:43:15.3893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHSPR00MB254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0FBx9AycN7rTI7SfLsETWG1aJhfGL+VPMveq3u90y0=;
 b=uWr+oLZxBg61FtkDCmXixbSSWnZNN4Yh/eAsxZqxc+JswHabQYRFmyPCQxyyyrBruSrK5K+/43lkFfQ6O6TnqmipdytDboYfgq2SPgR3t4ZOOXSFwHFNZXwsIgFcd5Wyr9epVYqBFz+V+b7A9p50CziLsSRo+w+1QMg5RTPsiq0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA1LzE3LzE5IDM6MzUgUE0sIEVyaWNvIE51bmVzIHdyb3RlOg0KPiBbQ0FVVElPTjogRXh0
ZXJuYWwgRW1haWxdDQo+DQo+IEhlbGxvLA0KPg0KPiBJIGhhdmUgcmVjZW50bHkgb2JzZXJ2ZWQg
YSBtZW1vcnkgbGVhayBpc3N1ZSB3aXRoIGxpbWEgdXNpbmcNCj4gZHJtLW1pc2MtbmV4dCwgd2hp
Y2ggSSBpbml0aWFsbHkgcmVwb3J0ZWQgaGVyZToNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2xpbWEvbGludXgvaXNzdWVzLzI0DQo+IEl0IGlzIGFuIGVhc2lseSByZXByb2R1Y2Vh
YmxlIG1lbW9yeSBsZWFrIHdoaWNoIEkgd2FzIGFibGUgdG8gYmlzZWN0IHRvIGNvbW1pdDoNCj4N
Cj4gNTkxODA0NWM0ZWQ0IGRybS9zY2hlZHVsZXI6IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24NCj4N
Cj4gQWZ0ZXIgc29tZSBpbnZlc3RpZ2F0aW9uLCBpdCBzZWVtcyB0aGF0IGFmdGVyIHRoZSByZWZh
Y3RvciwNCj4gc2NoZWQtPm9wcy0+ZnJlZV9qb2IgKGluIGxpbWE6IGxpbWFfc2NoZWRfZnJlZV9q
b2IpIGlzIG5vIGxvbmdlcg0KPiBjYWxsZWQuDQo+IFdpdGggc29tZSBtb3JlIGRlYnVnZ2luZyBJ
IGZvdW5kIHRoYXQgaXQgaXMgbm90IGJlaW5nIGNhbGxlZCBiZWNhdXNlDQo+IHRoZSBqb2IgZnJl
ZWluZyBpcyBub3cgaW4gZHJtX3NjaGVkX2NsZWFudXBfam9icywgd2hpY2ggZm9yIGxpbWENCj4g
YWx3YXlzIGFib3J0cyBpbiB0aGUgaW5pdGlhbCAiRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRo
ZSB0aW1lb3V0DQo+IHdvcmtlciBpcyBydW5uaW5nIiBjb25kaXRpb24uDQo+DQo+IExpbWEgY3Vy
cmVudGx5IGRlZmF1bHRzIHRvIGFuICJpbmZpbml0ZSIgdGltZW91dC4gU2V0dGluZyBhIDUwMG1z
DQo+IGRlZmF1bHQgdGltZW91dCBsaWtlIG1vc3Qgb3RoZXIgZHJtX3NjaGVkIHVzZXJzIGRvIGZp
eGVkIHRoZSBsZWFrIGZvcg0KPiBtZS4NCg0KDQpJIGFtIG5vdCB2ZXJ5IGNsZWFyIGFib3V0IHRo
ZSBwcm9ibGVtIC0gc28geW91IGJhc2ljYWxseSBuZXZlciBhbGxvdyBhIA0KdGltZSBvdXQgaGFu
ZGxlciB0byBydW4gPyBBbmQgdGhlbiB3aGVuIHRoZSBqb2IgaGFuZ3MgZm9yIGV2ZXIgeW91IGdl
dCANCnRoaXMgbWVtb3J5IGxlYWsgPyBIb3cgaXQgd29ya2VkIGZvciB5b3UgYmVmb3JlIHRoaXMg
cmVmYWN0b3JpbmcgPyBBcyANCmZhciBhcyBJIHJlbWVtYmVywqAgc2NoZWQtPm9wcy0+ZnJlZV9q
b2IgYmVmb3JlIHRoaXMgY2hhbmdlIHdhcyBjYWxsZWQgDQpmcm9tIGRybV9zY2hlZF9qb2JfZmlu
aXNoIHdoaWNoIGlzIHRoZSB3b3JrIHNjaGVkdWxlZCBmcm9tIEhXIGZlbmNlIA0Kc2lnbmFsZWQg
Y2FsbGJhY2sgLSBkcm1fc2NoZWRfcHJvY2Vzc19qb2Igc28gaWYgeW91ciBqb2IgaGFuZ3MgZm9y
IGV2ZXIgDQphbnl3YXkgYW5kIHRoaXMgd29yayBpcyBuZXZlciBzY2hlZHVsZWTCoCB3aGVuIHlv
dXIgZnJlZV9qb2IgY2FsbGJhY2sgd2FzIA0KY2FsbGVkID8NCg0KDQo+DQo+IEkgY2FuIHNlbmQg
YSBwYXRjaCB0byBzZXQgYSA1MDBtcyB0aW1lb3V0IGFuZCBoYXZlIGl0IHByb2JhYmx5IHdvcmtp
bmcNCj4gYWdhaW4sIGJ1dCBJIGFtIHdvbmRlcmluZyBub3cgaWYgdGhpcyBpcyBleHBlY3RlZCBi
ZWhhdmlvdXIgZm9yDQo+IGRybV9zY2hlZCBhZnRlciB0aGUgcmVmYWN0b3IuDQo+IEluIHBhcnRp
Y3VsYXIgSSBhbHNvIG5vdGljZWQgdGhhdCBkcm1fc2NoZWRfc3VzcGVuZF90aW1lb3V0IGlzIG5v
dA0KPiBjYWxsZWQgYW55d2hlcmUuIElzIGl0IGV4cGVjdGVkIHRoYXQgd2Ugbm93IHJlbHkgb24g
YSB0aW1lb3V0DQo+IHBhcmFtZXRlciB0byBjbGVhbnVwIGpvYnMgdGhhdCByYW4gc3VjY2Vzc2Z1
bGx5Pw0KDQoNCkFGQUlLIHRoZSBkcm1fc2NoZWRfc3VzcGVuZF90aW1lb3V0IGlzIHVzZWQgYnkg
YSBkcml2ZXIgaW4gYSBzdGFnaW5nIA0KYnJhbmNoLCBDaHJpc3RpYW4gY2FuIGdpdmUgbW9yZSBk
ZXRhaWwuDQoNCkFuZHJleQ0KDQoNCj4NCj4gRXJpY28NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
