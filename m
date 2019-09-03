Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3BA649B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 11:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639A3893EF;
	Tue,  3 Sep 2019 09:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700074.outbound.protection.outlook.com [40.107.70.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357BF893D0;
 Tue,  3 Sep 2019 09:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB6VvT2hRSYBdjiT/6BCnnIZXBeIL5csocLk2CcwDVXL6w5rkcEs+WoY33xHl4Hcuj0mWz6u1XEV2ylTsYEHy3I2LdIAhfbzDmng5uik2ykRmhBnqBU5PK0KnFhluyPGAV09rnLCWYw3mTFqiv0l3WOxu2+gXjx3ZJPZtaR4wQuuNpmz+oLKtCFnIHfdL/MNz4I8VBbynJ/9/B1Wk+4rRo03SxZI4h7VYzYHrztOybQQC33+M9zJkq0+zVzqki62pvetraF8UriaKSCY/21/cmFuBBplCMQe75ASDCkeVXtC40psrXhTV5Am+bXpb5JYfPVK94gIhnAhspSfOFI1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BPzX16O52ub7ELHNx5L30nl0xTMQ3WVNLe+akP0QYk=;
 b=UuoXQeMvB8XjwQ83QZM+7NMa7gUtTauwNSj4qTjblxDMAO+cCHnLqPELm/Wq48NaCx90TOnges6fK7rMCZPYulYY5wOps9OLheG6Mqi8VjYX3QWEhtV2Lh/eVw2tmXWresBf4xgzfjBD/IVcEZQ2MJH9DvV8CWber0HUakRT4KdWgUKQmFP2Um9ZmV3uVCIoYXo5qFuHPjkINBW9XLJXpk2fylig5P4yp4Nrd895cyEdMlcdtRTcd6GI6pcpeyPjUVPjLXpxb0UJ5/JP44a7nva2VRgx0weaNLtaNJYXbAtDH0baFP3m8ChmYtdKKm6FzaQBkyaW35HhVMmnTe/3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2567.namprd12.prod.outlook.com (52.132.141.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Tue, 3 Sep 2019 09:02:46 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 09:02:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] dma_resv: prime lockdep annotations
Thread-Topic: [PATCH] dma_resv: prime lockdep annotations
Thread-Index: AQHVWLaKAMp4gYtYokidaZBq3wxXlacGzAKAgBLiTYCAAAztgA==
Date: Tue, 3 Sep 2019 09:02:45 +0000
Message-ID: <3ce3d1c6-46c2-8886-5f20-daf3cfdd3ad1@amd.com>
References: <20190821215030.31660-1-daniel.vetter@ffwll.ch>
 <20190822065457.2830-1-daniel.vetter@ffwll.ch>
 <82b6c2e2-22fa-7896-2018-0d0551f5af31@amd.com>
 <20190903081621.GN2112@phenom.ffwll.local>
In-Reply-To: <20190903081621.GN2112@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6365c3a-5ca4-41b0-4396-08d7304d7ca1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2567; 
x-ms-traffictypediagnostic: DM5PR12MB2567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB25672838C0A57B314B18CC7183B90@DM5PR12MB2567.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(189003)(199004)(7736002)(5660300002)(66574012)(486006)(446003)(11346002)(6486002)(305945005)(2906002)(52116002)(31696002)(6512007)(2616005)(476003)(86362001)(14454004)(36756003)(6506007)(4326008)(102836004)(65806001)(65956001)(186003)(386003)(66446008)(66946007)(64756008)(66556008)(66476007)(99286004)(53936002)(6916009)(7416002)(46003)(316002)(6246003)(25786009)(478600001)(31686004)(58126008)(8936002)(6116002)(81156014)(8676002)(71200400001)(256004)(14444005)(6436002)(71190400001)(81166006)(54906003)(76176011)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2567;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5+39TVtveXhD1ngAl9jArLimDrzqeOg5XwTGESH+AjAitklpawaiLxZy8ntmIbE8PHqz1Hmx/K99RQM+z6rJ5kCYm8gG/8jfeuHuZKIcFurce2rvLWIYtW29f7xlesIFqpb/dIEIhBLZ3HU/TI3sm+pzKXoPL54Hmx4aoHQLJ66Bf84QG3P2awC+IuLkDPgH7bTH8KIzLB8jThPCRSYCvTgsRTESJeHUDXSYbjDATY2S08/R6w0sQQlHQtZ0j8fQJkgld3XLdCOu6YDAZNwkWjz5LoGl54d3zqZZHTj3Qjs2IEpdXGwwABY5Cvsx9eLHbHiLRYjDpFIej1p7+5Sl+gOhmuirdzbDrSokVAxMKcN/BdIQkhyVG9T1iIWRHoxUdG1BtVfeJ7SQzYE0lDOa0q55UXQjcsBDy6tF9zfLBHI=
Content-ID: <68EF028CF7C25C428FE8E11B0FC5B8C6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6365c3a-5ca4-41b0-4396-08d7304d7ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 09:02:45.9592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBZfP5/VZBTXl5MeZ0eLLgi0sBjcdQvvJuicA5itodpDN9a2IkXNp6rz2o5+N+21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2567
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BPzX16O52ub7ELHNx5L30nl0xTMQ3WVNLe+akP0QYk=;
 b=MlK/q+64NLW9GHJy6wOCkwG/jhMSKeAeyemTlRx/L1n9lLKSzlClh30KzQ/bgjNBLonpJSrAFoDh19zduCn19/r5VcHK2lSl3xFNaqKcu2pXPKwyFDh4OgRQiR5MUuknfA03BT/PQ2mSREIDis0q1Gjj/O+yJvz8ed1vHUkdtfE=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDkuMTkgdW0gMTA6MTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUaHUsIEF1
ZyAyMiwgMjAxOSBhdCAwNzo1Mzo1M0FNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4+IEFtIDIyLjA4LjE5IHVtIDA4OjU0IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4+PiBGdWxs
IGF1ZGl0IG9mIGV2ZXJ5b25lOg0KPj4+DQo+Pj4gLSBpOTE1LCByYWRlb24sIGFtZGdwdSBzaG91
bGQgYmUgY2xlYW4gcGVyIHRoZWlyIG1haW50YWluZXJzLg0KPj4+DQo+Pj4gLSB2cmFtIGhlbHBl
cnMgc2hvdWxkIGJlIGZpbmUsIHRoZXkgZG9uJ3QgZG8gY29tbWFuZCBzdWJtaXNzaW9uLCBzbw0K
Pj4+ICAgICByZWFsbHkgbm8gYnVzaW5lc3MgaG9sZGluZyBzdHJ1Y3RfbXV0ZXggd2hpbGUgZG9p
bmcgY29weV8qX3VzZXIuIEJ1dA0KPj4+ICAgICBJIGhhdmVuJ3QgY2hlY2tlZCB0aGVtIGFsbC4N
Cj4+Pg0KPj4+IC0gcGFuZnJvc3Qgc2VlbXMgdG8gZG1hX3Jlc3ZfbG9jayBvbmx5IGluIHBhbmZy
b3N0X2pvYl9wdXNoLCB3aGljaA0KPj4+ICAgICBsb29rcyBjbGVhbi4NCj4+Pg0KPj4+IC0gdjNk
IGhvbGRzIGRtYV9yZXN2IGxvY2tzIGluIHRoZSB0YWlsIG9mIGl0cyB2M2Rfc3VibWl0X2NsX2lv
Y3RsKCksDQo+Pj4gICAgIGNvcHlpbmcgZnJvbS90byB1c2Vyc3BhY2UgaGFwcGVucyBhbGwgaW4g
djNkX2xvb2t1cF9ib3Mgd2hpY2ggaXMNCj4+PiAgICAgb3V0c2lkZSBvZiB0aGUgY3JpdGljYWwg
c2VjdGlvbi4NCj4+Pg0KPj4+IC0gdm13Z2Z4IGhhcyBhIGJ1bmNoIG9mIGlvY3RscyB0aGF0IGRv
IHRoZWlyIG93biBjb3B5XypfdXNlcjoNCj4+PiAgICAgLSB2bXdfZXhlY2J1Zl9wcm9jZXNzOiBG
aXJzdCB0aGlzIGRvZXMgc29tZSBjb3BpZXMgaW4NCj4+PiAgICAgICB2bXdfZXhlY2J1Zl9jbWRi
dWYoKSBhbmQgYWxzbyBpbiB0aGUgdm13X2V4ZWNidWZfcHJvY2VzcygpIGl0c2VsZi4NCj4+PiAg
ICAgICBUaGVuIGNvbWVzIHRoZSB1c3VhbCB0dG0gcmVzZXJ2ZS92YWxpZGF0ZSBzZXF1ZW5jZSwg
dGhlbiBhY3R1YWwNCj4+PiAgICAgICBzdWJtaXNzaW9uL2ZlbmNpbmcsIHRoZW4gdW5yZXNlcnZp
bmcsIGFuZCBmaW5hbGx5IHNvbWUgbW9yZQ0KPj4+ICAgICAgIGNvcHlfdG9fdXNlciBpbiB2bXdf
ZXhlY2J1Zl9jb3B5X2ZlbmNlX3VzZXIuIEdsb3NzaW5nIG92ZXIgdG9ucyBvZg0KPj4+ICAgICAg
IGRldGFpbHMsIGJ1dCBsb29rcyBhbGwgc2FmZS4NCj4+PiAgICAgLSB2bXdfZmVuY2VfZXZlbnRf
aW9jdGw6IE5vIHR0bV9yZXNlcnZlL2RtYV9yZXN2X2xvY2sgYW55d2hlcmUgdG8gYmUNCj4+PiAg
ICAgICBzZWVuLCBzZWVtcyB0byBvbmx5IGNyZWF0ZSBhIGZlbmNlIGFuZCBjb3B5IGl0IG91dC4N
Cj4+PiAgICAgLSBhIHBpbGUgb2Ygc21hbGxlciBpb2N0bCBpbiB2bXdnZnhfaW9jdGwuYywgbm8g
cmVzZXJ2YXRpb25zIHRvIGJlDQo+Pj4gICAgICAgZm91bmQgdGhlcmUuDQo+Pj4gICAgIFN1bW1h
cnk6IHZtd2dmeCBzZWVtcyB0byBiZSBmaW5lIHRvby4NCj4+Pg0KPj4+IC0gdmlydGlvOiBUaGVy
ZSdzIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCwgd2hpY2ggZG9lcyBhbGwgdGhlDQo+Pj4g
ICAgIGNvcHlpbmcgZnJvbSB1c2Vyc3BhY2UgYmVmb3JlIGV2ZW4gbG9va2luZyB1cCBvYmplY3Rz
IHRocm91Z2ggdGhlaXINCj4+PiAgICAgaGFuZGxlcywgc28gc2FmZS4gUGx1cyB0aGUgZ2V0cGFy
YW0vZ2V0Y2FwcyBpb2N0bCwgYWxzbyBib3RoIHNhZmUuDQo+Pj4NCj4+PiAtIHF4bCBvbmx5IGhh
cyBxeGxfZXhlY2J1ZmZlcl9pb2N0bCwgd2hpY2ggY2FsbHMgaW50bw0KPj4+ICAgICBxeGxfcHJv
Y2Vzc19zaW5nbGVfY29tbWFuZC4gVGhlcmUncyBhIGxvdmVseSBjb21tZW50IGJlZm9yZSB0aGUN
Cj4+PiAgICAgX19jb3B5X2Zyb21fdXNlcl9pbmF0b21pYyB0aGF0IHRoZSBzbG93cGF0aCBzaG91
bGQgYmUgY29waWVkIGZyb20NCj4+PiAgICAgaTkxNSwgYnV0IEkgZ3Vlc3MgdGhhdCBuZXZlciBo
YXBwZW5lZC4gVHJ5IG5vdCB0byBiZSB1bmx1Y2t5IGFuZCBnZXQNCj4+PiAgICAgeW91ciBDUyBk
YXRhIGV2aWN0ZWQgYmV0d2VlbiB3aGVuIGl0J3Mgd3JpdHRlbiBhbmQgdGhlIGtlcm5lbCB0cmll
cw0KPj4+ICAgICB0byByZWFkIGl0LiBUaGUgb25seSBvdGhlciBjb3B5X2Zyb21fdXNlciBpcyBm
b3IgcmVsb2NzLCBidXQgdGhvc2UNCj4+PiAgICAgYXJlIGRvbmUgYmVmb3JlIHF4bF9yZWxlYXNl
X3Jlc2VydmVfbGlzdCgpLCB3aGljaCBzZWVtcyB0byBiZSB0aGUNCj4+PiAgICAgb25seSB0aGlu
ZyByZXNlcnZpbmcgYnVmZmVycyAoaW4gdGhlIHR0bS9kbWFfcmVzdiBzZW5zZSkgaW4gdGhhdA0K
Pj4+ICAgICBjb2RlLiBTbyBsb29rcyBzYWZlLg0KPj4+DQo+Pj4gLSBBIGRlYnVnZnMgZmlsZSBp
biBub3V2ZWF1X2RlYnVnZnNfcHN0YXRlX3NldCgpIGFuZCB0aGUgdXNpZiBpb2N0bCBpbg0KPj4+
ICAgICB1c2lmX2lvY3RsKCkgbG9vayBzYWZlLiBub3V2ZWF1X2dlbV9pb2N0bF9wdXNoYnVmKCkg
b3RvaCBicmVha3MgdGhpcw0KPj4+ICAgICBldmVyeXdoZXJlIGFuZCBuZWVkcyB0byBiZSBmaXhl
ZCB1cC4NCj4+Pg0KPj4+IHYyOiBUaG9tYXMgcG9pbnRlZCBhdCB0aGF0IHZtd2dmeCBjYWxscyBk
bWFfcmVzdl9pbml0IHdoaWxlIGl0IGhvbGRzIGENCj4+PiBkbWFfcmVzdiBsb2NrIG9mIGEgZGlm
ZmVyZW50IG9iamVjdCBhbHJlYWR5LiBDaHJpc3RpYW4gbWVudGlvbmVkIHRoYXQNCj4+PiB0dG0g
Y29yZSBkb2VzIHRoaXMgdG9vIGZvciBnaG9zdCBvYmplY3RzLiBpbnRlbC1nZngtY2kgaGlnaGxp
Z2h0ZWQNCj4+PiB0aGF0IGk5MTUgaGFzIHNpbWlsYXIgaXNzdWVzLg0KPj4+DQo+Pj4gVW5mb3J0
dW5hdGVseSB3ZSBjYW4ndCBkbyB0aGlzIGluIHRoZSB1c3VhbCBtb2R1bGUgaW5pdCBmdW5jdGlv
bnMsDQo+Pj4gYmVjYXVzZSBrZXJuZWwgdGhyZWFkcyBkb24ndCBoYXZlIGFuIC0+bW0gLSB3ZSBo
YXZlIHRvIHdhaXQgYXJvdW5kIGZvcg0KPj4+IHNvbWUgdXNlciB0aHJlYWQgdG8gZG8gdGhpcy4N
Cj4+Pg0KPj4+IFNvbHV0aW9uIGlzIHRvIHNwYXduIGEgd29ya2VyIChidXQgb25seSBvbmNlKS4g
SXQncyBob3JyaWJsZSwgYnV0IGl0DQo+Pj4gd29ya3MuDQo+Pj4NCj4+PiB2MzogV2UgY2FuIGFs
bG9jYXRlIG1tISAoQ2hyaXMpLiBIb3JyaWJsZSB3b3JrZXIgaGFjayBvdXQsIGNsZWFuDQo+Pj4g
aW5pdGNhbGwgc29sdXRpb24gaW4uDQo+Pj4NCj4+PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+DQo+Pj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPg0KPj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+PiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4+PiBDYzogVG9tZXUgVml6
b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4NCj4+PiBDYzogRXJpYyBBbmhvbHQgPGVy
aWNAYW5ob2x0Lm5ldD4NCj4+PiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4N
Cj4+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+Pj4gQ2M6IEJlbiBT
a2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4NCj4+PiBDYzogIlZNd2FyZSBHcmFwaGljcyIgPGxp
bnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4NCj4+PiBDYzogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gRGlkIHlvdSBnZXQgYSBjaGFu
Y2UgdG8gZ2l2ZSB0aGlzIGEgc3BpbiBvbiB0aGUgYW1kIENJPw0KDQpObyBhbmQgc29ycnkgdG90
YWxseSBmb3Jnb3QgdG8gYXNrIGFib3V0IHRoYXQuDQoNCkdvaW5nIHRvIHRyeSB0byBicmluZyB0
aGlzIHVwIHRvbW9ycm93IG9uY2UgbW9yZSwgYnV0IGRvbid0IGV4cGVjdCB0aGF0IA0KSSBjYW4g
Z2V0IHRoaXMgdGVzdGVkIGFueXRpbWUgc29vbi4NCg0KQ2hyaXN0aWFuLg0KDQo+IC1EYW5pZWwN
Cj4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyB8IDI0ICsrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYw0KPj4+IGluZGV4IDQyYThmM2YxMTY4MS4uZDIzM2Vm
NGNmMGQ3IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jDQo+Pj4g
KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMNCj4+PiBAQCAtMzQsNiArMzQsNyBAQA0K
Pj4+ICAgIA0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9kbWEtcmVzdi5oPg0KPj4+ICAgICNpbmNs
dWRlIDxsaW51eC9leHBvcnQuaD4NCj4+PiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+DQo+
Pj4gICAgDQo+Pj4gICAgLyoqDQo+Pj4gICAgICogRE9DOiBSZXNlcnZhdGlvbiBPYmplY3QgT3Zl
cnZpZXcNCj4+PiBAQCAtOTUsNiArOTYsMjkgQEAgc3RhdGljIHZvaWQgZG1hX3Jlc3ZfbGlzdF9m
cmVlKHN0cnVjdCBkbWFfcmVzdl9saXN0ICpsaXN0KQ0KPj4+ICAgIAlrZnJlZV9yY3UobGlzdCwg
cmN1KTsNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19MT0NL
REVQKQ0KPj4+ICtzdGF0aWMgdm9pZCBkbWFfcmVzdl9sb2NrZGVwKHZvaWQpDQo+Pj4gK3sNCj4+
PiArCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gbW1fYWxsb2MoKTsNCj4+PiArCXN0cnVjdCBkbWFf
cmVzdiBvYmo7DQo+Pj4gKw0KPj4+ICsJaWYgKCFtbSkNCj4+PiArCQlyZXR1cm47DQo+Pj4gKw0K
Pj4+ICsJZG1hX3Jlc3ZfaW5pdCgmb2JqKTsNCj4+PiArDQo+Pj4gKwlkb3duX3JlYWQoJm1tLT5t
bWFwX3NlbSk7DQo+Pj4gKwl3d19tdXRleF9sb2NrKCZvYmoubG9jaywgTlVMTCk7DQo+Pj4gKwlm
c19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5FTCk7DQo+Pj4gKwlmc19yZWNsYWltX3JlbGVhc2Uo
R0ZQX0tFUk5FTCk7DQo+Pj4gKwl3d19tdXRleF91bmxvY2soJm9iai5sb2NrKTsNCj4+PiArCXVw
X3JlYWQoJm1tLT5tbWFwX3NlbSk7DQo+Pj4gKwkNCj4+PiArCW1tcHV0KG1tKTsNCj4+PiArfQ0K
Pj4+ICtzdWJzeXNfaW5pdGNhbGwoZG1hX3Jlc3ZfbG9ja2RlcCk7DQo+Pj4gKyNlbmRpZg0KPj4+
ICsNCj4+PiAgICAvKioNCj4+PiAgICAgKiBkbWFfcmVzdl9pbml0IC0gaW5pdGlhbGl6ZSBhIHJl
c2VydmF0aW9uIG9iamVjdA0KPj4+ICAgICAqIEBvYmo6IHRoZSByZXNlcnZhdGlvbiBvYmplY3QN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
