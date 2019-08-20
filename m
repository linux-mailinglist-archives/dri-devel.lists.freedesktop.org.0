Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248496340
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 16:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20CE6E402;
	Tue, 20 Aug 2019 14:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CEA6E40E;
 Tue, 20 Aug 2019 14:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhDpIqV364nLrWufnwUf5Oceb1upbHqWRErduiFzc9OTNFqqhCwesdJ7Km98sb44gnaH6rcq4jEV7h58O2vEhB3zGVSVUpDrlUITSOM/WBFvGpt9o6BryAPs4TJ97HUZQpJznBYJmIrSJ18k1slm1ADbSsl8NMiOZCmDsa9XPaIJjso+A3RyQ5L2SUj9JiVIYB2zqc0BK3Gx+YJRS7dL+UzlNvUUuTWllfd3ZcQphnQ2Z1Hem9r5nvo4QsshE9LVy/XSdnsyT2p0M0wVDjo5jYmnF4KC8pgN7OXlRJLMos3KumPHTV+ZWNYnObd10Uq6EewHEKnlLRgQNJgyrQu0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNOKAGnpT2bUcyzR1SNHtvqwN9sHf4LINzSZaHKTDfY=;
 b=QhATqqtYJL+bC8Xnjv1QZCEMioeCOf1n1ZG53YZCmr+8Hip2lGQwlm01KWRv4Iu0R2j5v7h27tWSX/FkxmdsqqjN/knMB47LFn1gBNWYMOr0QluoBGbi51wKYmndFVjvceevAGBZe4WeJA2lKTP9Q3/Bhvk0eqtsU6FpF3JeCvkTpC6LPhHvQbm+gXzb9v09ek2AWy1NoggrYCQ1s8+PBMv/dt2KWSUjlMxl3KaGpAoUl6qdliL7lLQXtTk4owf2oIkSkUcRgd8Z+7uidhUoFOBXMmY2CD+/RwRUBQ6gpvp78w2e+BjyE4O/vOJTDneLgHIKCLSJzI490ThuQfvyEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5SPR00MB111.namprd12.prod.outlook.com (10.174.247.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 14:56:36 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 14:56:36 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
Thread-Topic: [PATCH 1/3] dma_resv: prime lockdep annotations
Thread-Index: AQHVV2cVroPUEXyGA0eKKd1xRtAyH6cIlASA
Date: Tue, 20 Aug 2019 14:56:36 +0000
Message-ID: <e1e8702b-a849-c8cb-3f41-16ce21a823b7@amd.com>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190820145336.15649-2-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::13)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f84193b0-e994-476c-cf64-08d7257e9956
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5SPR00MB111; 
x-ms-traffictypediagnostic: DM5SPR00MB111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5SPR00MB11179905BB5C6C2A5E5FF1283AB0@DM5SPR00MB111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(7416002)(46003)(6512007)(256004)(14444005)(486006)(6486002)(229853002)(6436002)(53936002)(6246003)(65826007)(14454004)(446003)(71200400001)(71190400001)(25786009)(31696002)(8676002)(305945005)(8936002)(476003)(2616005)(11346002)(36756003)(2906002)(81166006)(81156014)(7736002)(478600001)(86362001)(6116002)(4326008)(31686004)(52116002)(99286004)(5660300002)(54906003)(110136005)(316002)(65806001)(65956001)(58126008)(66476007)(66574012)(64126003)(186003)(66946007)(64756008)(66556008)(66446008)(102836004)(6506007)(386003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR00MB111;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qNvmWL/glBV2oqcCINMbEwhlS5HWDP8JySZUHJkYCJieKL+KjniR4y4AI9xABO19b8sjmyqPr3/hp+rQ9Ii8w+I/YoiLupOZM+P0FeDaxBpECf/BABhgMYdCiZV3x22FekRS9p23tWV4Lkll71c7gv9Ci0zK+MkM3OWR+RPxIb7uon1sI3AQxHoI0dlH73oYrdlHqdarcN+1f2A+XhCXxrPcMZGW5l1ruQvKatmFzIPgXiuxrqaIc0dCgF0gkH5thdlzzMYxbpubESUxs2D7EGDFSY9qkJodthA+TRTO0y3y5n0nX4K/d81TGeRZmd1l8je2e164celo21w3TowU76Bn9hRvkhKpqKfYnKBtXUEaZyHJ7Ako4YU/mBvRwp7CAg5Tcn/qaP3HW7sDbX2fIP6mYrpvnxkKWNB4i+AdwtE=
Content-ID: <CE932896A53DD946A42C8D6B9835D450@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84193b0-e994-476c-cf64-08d7257e9956
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 14:56:36.6454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1VUKwOoS4ILt+RymGMVFfOgFD6SqD9xoN8rrFd6kXrMlWRwwYORXBDZVNqO0Ohz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNOKAGnpT2bUcyzR1SNHtvqwN9sHf4LINzSZaHKTDfY=;
 b=pYis7sUkQV4C6cWdmNuU/WS79ljNaOJy4syVuqORMopra3j5Nvaaj1on6JIkj2LjR0xDLOzIvVnBusxUbhP4J+tmG1s0aMAbKlb8rlzenen22XnDO5MdyOUwG1X/Y4fd0npxWZ9z9z1b+PWz+atuDGm2C258Rp7yGeKcRvZwR7A=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDguMTkgdW0gMTY6NTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBGdWxsIGF1ZGl0
IG9mIGV2ZXJ5b25lOg0KPg0KPiAtIGk5MTUsIHJhZGVvbiwgYW1kZ3B1IHNob3VsZCBiZSBjbGVh
biBwZXIgdGhlaXIgbWFpbnRhaW5lcnMuDQo+DQo+IC0gdnJhbSBoZWxwZXJzIHNob3VsZCBiZSBm
aW5lLCB0aGV5IGRvbid0IGRvIGNvbW1hbmQgc3VibWlzc2lvbiwgc28NCj4gICAgcmVhbGx5IG5v
IGJ1c2luZXNzIGhvbGRpbmcgc3RydWN0X211dGV4IHdoaWxlIGRvaW5nIGNvcHlfKl91c2VyLiBC
dXQNCj4gICAgSSBoYXZlbid0IGNoZWNrZWQgdGhlbSBhbGwuDQo+DQo+IC0gcGFuZnJvc3Qgc2Vl
bXMgdG8gZG1hX3Jlc3ZfbG9jayBvbmx5IGluIHBhbmZyb3N0X2pvYl9wdXNoLCB3aGljaA0KPiAg
ICBsb29rcyBjbGVhbi4NCj4NCj4gLSB2M2QgaG9sZHMgZG1hX3Jlc3YgbG9ja3MgaW4gdGhlIHRh
aWwgb2YgaXRzIHYzZF9zdWJtaXRfY2xfaW9jdGwoKSwNCj4gICAgY29weWluZyBmcm9tL3RvIHVz
ZXJzcGFjZSBoYXBwZW5zIGFsbCBpbiB2M2RfbG9va3VwX2JvcyB3aGljaCBpcw0KPiAgICBvdXRz
aWRlIG9mIHRoZSBjcml0aWNhbCBzZWN0aW9uLg0KPg0KPiAtIHZtd2dmeCBoYXMgYSBidW5jaCBv
ZiBpb2N0bHMgdGhhdCBkbyB0aGVpciBvd24gY29weV8qX3VzZXI6DQo+ICAgIC0gdm13X2V4ZWNi
dWZfcHJvY2VzczogRmlyc3QgdGhpcyBkb2VzIHNvbWUgY29waWVzIGluDQo+ICAgICAgdm13X2V4
ZWNidWZfY21kYnVmKCkgYW5kIGFsc28gaW4gdGhlIHZtd19leGVjYnVmX3Byb2Nlc3MoKSBpdHNl
bGYuDQo+ICAgICAgVGhlbiBjb21lcyB0aGUgdXN1YWwgdHRtIHJlc2VydmUvdmFsaWRhdGUgc2Vx
dWVuY2UsIHRoZW4gYWN0dWFsDQo+ICAgICAgc3VibWlzc2lvbi9mZW5jaW5nLCB0aGVuIHVucmVz
ZXJ2aW5nLCBhbmQgZmluYWxseSBzb21lIG1vcmUNCj4gICAgICBjb3B5X3RvX3VzZXIgaW4gdm13
X2V4ZWNidWZfY29weV9mZW5jZV91c2VyLiBHbG9zc2luZyBvdmVyIHRvbnMgb2YNCj4gICAgICBk
ZXRhaWxzLCBidXQgbG9va3MgYWxsIHNhZmUuDQo+ICAgIC0gdm13X2ZlbmNlX2V2ZW50X2lvY3Rs
OiBObyB0dG1fcmVzZXJ2ZS9kbWFfcmVzdl9sb2NrIGFueXdoZXJlIHRvIGJlDQo+ICAgICAgc2Vl
biwgc2VlbXMgdG8gb25seSBjcmVhdGUgYSBmZW5jZSBhbmQgY29weSBpdCBvdXQuDQo+ICAgIC0g
YSBwaWxlIG9mIHNtYWxsZXIgaW9jdGwgaW4gdm13Z2Z4X2lvY3RsLmMsIG5vIHJlc2VydmF0aW9u
cyB0byBiZQ0KPiAgICAgIGZvdW5kIHRoZXJlLg0KPiAgICBTdW1tYXJ5OiB2bXdnZnggc2VlbXMg
dG8gYmUgZmluZSB0b28uDQo+DQo+IC0gdmlydGlvOiBUaGVyZSdzIHZpcnRpb19ncHVfZXhlY2J1
ZmZlcl9pb2N0bCwgd2hpY2ggZG9lcyBhbGwgdGhlDQo+ICAgIGNvcHlpbmcgZnJvbSB1c2Vyc3Bh
Y2UgYmVmb3JlIGV2ZW4gbG9va2luZyB1cCBvYmplY3RzIHRocm91Z2ggdGhlaXINCj4gICAgaGFu
ZGxlcywgc28gc2FmZS4gUGx1cyB0aGUgZ2V0cGFyYW0vZ2V0Y2FwcyBpb2N0bCwgYWxzbyBib3Ro
IHNhZmUuDQo+DQo+IC0gcXhsIG9ubHkgaGFzIHF4bF9leGVjYnVmZmVyX2lvY3RsLCB3aGljaCBj
YWxscyBpbnRvDQo+ICAgIHF4bF9wcm9jZXNzX3NpbmdsZV9jb21tYW5kLiBUaGVyZSdzIGEgbG92
ZWx5IGNvbW1lbnQgYmVmb3JlIHRoZQ0KPiAgICBfX2NvcHlfZnJvbV91c2VyX2luYXRvbWljIHRo
YXQgdGhlIHNsb3dwYXRoIHNob3VsZCBiZSBjb3BpZWQgZnJvbQ0KPiAgICBpOTE1LCBidXQgSSBn
dWVzcyB0aGF0IG5ldmVyIGhhcHBlbmVkLiBUcnkgbm90IHRvIGJlIHVubHVja3kgYW5kIGdldA0K
PiAgICB5b3VyIENTIGRhdGEgZXZpY3RlZCBiZXR3ZWVuIHdoZW4gaXQncyB3cml0dGVuIGFuZCB0
aGUga2VybmVsIHRyaWVzDQo+ICAgIHRvIHJlYWQgaXQuIFRoZSBvbmx5IG90aGVyIGNvcHlfZnJv
bV91c2VyIGlzIGZvciByZWxvY3MsIGJ1dCB0aG9zZQ0KPiAgICBhcmUgZG9uZSBiZWZvcmUgcXhs
X3JlbGVhc2VfcmVzZXJ2ZV9saXN0KCksIHdoaWNoIHNlZW1zIHRvIGJlIHRoZQ0KPiAgICBvbmx5
IHRoaW5nIHJlc2VydmluZyBidWZmZXJzIChpbiB0aGUgdHRtL2RtYV9yZXN2IHNlbnNlKSBpbiB0
aGF0DQo+ICAgIGNvZGUuIFNvIGxvb2tzIHNhZmUuDQo+DQo+IC0gQSBkZWJ1Z2ZzIGZpbGUgaW4g
bm91dmVhdV9kZWJ1Z2ZzX3BzdGF0ZV9zZXQoKSBhbmQgdGhlIHVzaWYgaW9jdGwgaW4NCj4gICAg
dXNpZl9pb2N0bCgpIGxvb2sgc2FmZS4gbm91dmVhdV9nZW1faW9jdGxfcHVzaGJ1ZigpIG90b2gg
YnJlYWtzIHRoaXMNCj4gICAgZXZlcnl3aGVyZSBhbmQgbmVlZHMgdG8gYmUgZml4ZWQgdXAuDQo+
DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IENjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENjOiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4NCj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+DQo+IENj
OiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pg0KPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxp
ZWRAcmVkaGF0LmNvbT4NCj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPg0K
PiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPg0KPiBDYzogIlZNd2FyZSBHcmFw
aGljcyIgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4NCj4gQ2M6IFRob21h
cyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNCj4gLS0tDQo+ICAgZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCAxMiArKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1yZXN2LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYw0KPiBpbmRleCA0MmE4ZjNm
MTE2ODEuLjNlZGNhMTBkM2ZhZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1y
ZXN2LmMNCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMNCj4gQEAgLTM0LDYgKzM0
LDcgQEANCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvZG1hLXJlc3YuaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgvZXhwb3J0Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4NCj4gICAN
Cj4gICAvKioNCj4gICAgKiBET0M6IFJlc2VydmF0aW9uIE9iamVjdCBPdmVydmlldw0KPiBAQCAt
MTA3LDYgKzEwOCwxNyBAQCB2b2lkIGRtYV9yZXN2X2luaXQoc3RydWN0IGRtYV9yZXN2ICpvYmop
DQo+ICAgCQkJJnJlc2VydmF0aW9uX3NlcWNvdW50X2NsYXNzKTsNCj4gICAJUkNVX0lOSVRfUE9J
TlRFUihvYmotPmZlbmNlLCBOVUxMKTsNCj4gICAJUkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNl
X2V4Y2wsIE5VTEwpOw0KPiArDQo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX0xPQ0tERVApKSB7
DQo+ICsJCWlmIChjdXJyZW50LT5tbSkNCj4gKwkJCWRvd25fcmVhZCgmY3VycmVudC0+bW0tPm1t
YXBfc2VtKTsNCj4gKwkJd3dfbXV0ZXhfbG9jaygmb2JqLT5sb2NrLCBOVUxMKTsNCj4gKwkJZnNf
cmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJORUwpOw0KPiArCQlmc19yZWNsYWltX3JlbGVhc2UoR0ZQ
X0tFUk5FTCk7DQo+ICsJCXd3X211dGV4X3VubG9jaygmb2JqLT5sb2NrKTsNCj4gKwkJaWYgKGN1
cnJlbnQtPm1tKQ0KPiArCQkJdXBfcmVhZCgmY3VycmVudC0+bW0tPm1tYXBfc2VtKTsNCj4gKwl9
DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZG1hX3Jlc3ZfaW5pdCk7DQo+ICAgDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
