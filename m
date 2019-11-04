Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80DEE91B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 21:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCD6E81C;
	Mon,  4 Nov 2019 20:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0446E81C;
 Mon,  4 Nov 2019 20:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe6j7m0p9FP6pLoshMPKMEzfGcTNBTA0+83a+Nh9su30KIojUilBSun3S3xW7DAoZoNSYEcImGsxRiTEKUQ12yp8wumd4zgrt8w++xMTNQTqMh3WWhCsMpEQx1f9Dd2bk9dBYFupCGFD9KK/5M3jEm6/G2nnSAjryocNSVpKBaRqvmDQ5XsBleJw+TLcqfnn1CT6SMhKfZfFl7DM/gpFmR8mB69mOafI0Q7/oHCFSYmDFO6FJMTcSqtPDmipSZns8M09YMSJP/5KewdjWv8vIxW4gWFJm2tcCev9tkJX5AuD4ueMOtSzcJdgxPSxfnROYdOxxi1q0S/PfYkEUYTRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB9KCFmmfB9yFHX5BhfRn32C7Fi/hrmQivAbe0xK0bQ=;
 b=ltoFvNRAk1tkhKT+jpajzkyykHmo0WEODJ/L072uC0NNic7C1M3qaJ6CRFK3AOTZCcmxlaO0b5PoJ0hgB51yc8ZO91JnJ02vJOEjXWR8u77/H7Fv8u5qIDdjX7GvNlXDn1IhgR6HpVgNqgJNz768GOslYUGBj5kDYuBZIq0a6S2bRSUEPsmBJXuRVI6v/DSqlMlzbB8IzfyLarFYG9fXt+n0EdclL/xjZEi8hLleFlUOOREGXNBu8eAWGY9N/Ez0yDkS91CQuL8MuRLsU9ujC8P6++mL7kBVbpZcijaLy0KTJyT6tbgcd+2iZQJnp63oujmeIqMtKXu2Hutx/E9dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1497.namprd12.prod.outlook.com (10.172.38.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 20:01:09 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 20:01:09 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
Thread-Topic: [PATCH 1/3] dma_resv: prime lockdep annotations
Thread-Index: AQHVkzahaK7j7MEr5kC0JsAjKZuzM6d7bryA
Date: Mon, 4 Nov 2019 20:01:09 +0000
Message-ID: <9ac2616a-8ff2-c16f-fa0f-49b89bdacd9b@amd.com>
References: <20191104173801.2972-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191104173801.2972-1-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0097.eurprd02.prod.outlook.com
 (2603:10a6:208:154::38) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: adc2b4a6-f297-4bbb-6de8-08d76161bc27
x-ms-traffictypediagnostic: DM5PR12MB1497:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1497E937CE8E1AEA9D7AE1E5837F0@DM5PR12MB1497.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(65956001)(65806001)(7416002)(8936002)(186003)(31696002)(102836004)(14444005)(36756003)(86362001)(256004)(110136005)(46003)(2616005)(476003)(6506007)(76176011)(386003)(52116002)(31686004)(54906003)(58126008)(486006)(66476007)(66556008)(66446008)(66946007)(6512007)(99286004)(6246003)(316002)(64756008)(4326008)(478600001)(7736002)(81156014)(305945005)(81166006)(6436002)(6486002)(446003)(11346002)(229853002)(66574012)(8676002)(5660300002)(2906002)(6116002)(25786009)(71190400001)(14454004)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1497;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dEMILXA7arzYAFZzAHK2NVK2XZl3DU62GUU+DVG0SJv/Fo8uUbXUCisQyR4UuBrZ8ukR1dPCqtRaWvCttHs9fy0H1nfjqTGtm5tXCiPBPs/pIMqCc3GBLEXbu1MqgiBTbh0m6jhfMmsmCLfvsvQwci30I1kln+HE9D9zHzVft9a5PzRJwursZISru/LzXUD7dwqEkmMnH+tkcQnlR419WZG9D7+d6NnNH0BynuAAq6AbX8t8vgbb5X+QGiFd0Wnskg8NDWo8GoziwZPIiAmlEFQ56OJ1oHbOqBGfgKjLfvpQTwM9jn9wBUKH+ShvRPZOHEulAtcNwVzwjqVk9y4nIFh541XQjtnvfSkE+ZJENK92cQoTJd8o7hnywZS0ndYb9rtDIh5N+GTjpmGyh7No0xGNYQ/RmW8J9TVppOFYdwo/+llNaEY57msq0Hjqq+bs
Content-ID: <9DE56B44AB70CD47A33D3870105AC7A6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc2b4a6-f297-4bbb-6de8-08d76161bc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 20:01:09.5945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Opo0pQ2JhNeietZudhAOuoIhsi+4Gq88CPHtZPu6dxNwdFJCsj6c4AZuFd7GrSE6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1497
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB9KCFmmfB9yFHX5BhfRn32C7Fi/hrmQivAbe0xK0bQ=;
 b=VxBPZOV8xisz5PX6SwLITJw1wTam/5OEEo+qxShFDqiDqHAMyOvZLU1L8ysWL+vhMzWfvWnMyCknXRZ14uHMggcNWntnYUFFbJqGA/OFViG6fSAa1xwnIzEgfUsnrUuE27cAfRCbiXfMQKOG43+/S3ueZxNmLgJUicjCZy0jnRs=
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

QW0gMDQuMTEuMTkgdW0gMTg6Mzcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBGdWxsIGF1ZGl0
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
DQo+IHYyOiBUaG9tYXMgcG9pbnRlZCBhdCB0aGF0IHZtd2dmeCBjYWxscyBkbWFfcmVzdl9pbml0
IHdoaWxlIGl0IGhvbGRzIGENCj4gZG1hX3Jlc3YgbG9jayBvZiBhIGRpZmZlcmVudCBvYmplY3Qg
YWxyZWFkeS4gQ2hyaXN0aWFuIG1lbnRpb25lZCB0aGF0DQo+IHR0bSBjb3JlIGRvZXMgdGhpcyB0
b28gZm9yIGdob3N0IG9iamVjdHMuIGludGVsLWdmeC1jaSBoaWdobGlnaHRlZA0KPiB0aGF0IGk5
MTUgaGFzIHNpbWlsYXIgaXNzdWVzLg0KPg0KPiBVbmZvcnR1bmF0ZWx5IHdlIGNhbid0IGRvIHRo
aXMgaW4gdGhlIHVzdWFsIG1vZHVsZSBpbml0IGZ1bmN0aW9ucywNCj4gYmVjYXVzZSBrZXJuZWwg
dGhyZWFkcyBkb24ndCBoYXZlIGFuIC0+bW0gLSB3ZSBoYXZlIHRvIHdhaXQgYXJvdW5kIGZvcg0K
PiBzb21lIHVzZXIgdGhyZWFkIHRvIGRvIHRoaXMuDQo+DQo+IFNvbHV0aW9uIGlzIHRvIHNwYXdu
IGEgd29ya2VyIChidXQgb25seSBvbmNlKS4gSXQncyBob3JyaWJsZSwgYnV0IGl0DQo+IHdvcmtz
Lg0KPg0KPiB2MzogV2UgY2FuIGFsbG9jYXRlIG1tISAoQ2hyaXMpLiBIb3JyaWJsZSB3b3JrZXIg
aGFjayBvdXQsIGNsZWFuDQo+IGluaXRjYWxsIHNvbHV0aW9uIGluLg0KPg0KPiB2NDogQW5ub3Rh
dGUgd2l0aCBfX2luaXQgKFJvYiBIZXJyaW5nKQ0KPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4g
Q2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPiBDYzogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IENjOiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPg0KPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3Jh
LmNvbT4NCj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+DQo+IENjOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPg0KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+DQo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+DQo+IENjOiAi
Vk13YXJlIEdyYXBoaWNzIiA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPg0K
PiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPiBSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBSZXZp
ZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IFRlc3Rl
ZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KDQpXaGF0J3Mg
aG9sZGluZyB5b3UgYmFjayB0byBjb21taXQgdGhhdD8NCg0KQ2hyaXN0aWFuLg0KDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2
LmMNCj4gaW5kZXggNzA5MDAyNTE1NTUwLi5hMDVmZjU0MmJlMjIgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jDQo+IEBAIC0zNCw2ICszNCw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1y
ZXN2Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L3NjaGVkL21tLmg+DQo+ICAgDQo+ICAgLyoqDQo+ICAgICogRE9DOiBSZXNlcnZhdGlvbiBPYmpl
Y3QgT3ZlcnZpZXcNCj4gQEAgLTk1LDYgKzk2LDI5IEBAIHN0YXRpYyB2b2lkIGRtYV9yZXN2X2xp
c3RfZnJlZShzdHJ1Y3QgZG1hX3Jlc3ZfbGlzdCAqbGlzdCkNCj4gICAJa2ZyZWVfcmN1KGxpc3Qs
IHJjdSk7DQo+ICAgfQ0KPiAgIA0KPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0xPQ0tERVApDQo+
ICtzdGF0aWMgdm9pZCBfX2luaXQgZG1hX3Jlc3ZfbG9ja2RlcCh2b2lkKQ0KPiArew0KPiArCXN0
cnVjdCBtbV9zdHJ1Y3QgKm1tID0gbW1fYWxsb2MoKTsNCj4gKwlzdHJ1Y3QgZG1hX3Jlc3Ygb2Jq
Ow0KPiArDQo+ICsJaWYgKCFtbSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJZG1hX3Jlc3ZfaW5p
dCgmb2JqKTsNCj4gKw0KPiArCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsNCj4gKwl3d19tdXRl
eF9sb2NrKCZvYmoubG9jaywgTlVMTCk7DQo+ICsJZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJO
RUwpOw0KPiArCWZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsNCj4gKwl3d19tdXRleF91
bmxvY2soJm9iai5sb2NrKTsNCj4gKwl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KPiArCQ0KPiAr
CW1tcHV0KG1tKTsNCj4gK30NCj4gK3N1YnN5c19pbml0Y2FsbChkbWFfcmVzdl9sb2NrZGVwKTsN
Cj4gKyNlbmRpZg0KPiArDQo+ICAgLyoqDQo+ICAgICogZG1hX3Jlc3ZfaW5pdCAtIGluaXRpYWxp
emUgYSByZXNlcnZhdGlvbiBvYmplY3QNCj4gICAgKiBAb2JqOiB0aGUgcmVzZXJ2YXRpb24gb2Jq
ZWN0DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
