Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51A98CA5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 09:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F946EA6D;
	Thu, 22 Aug 2019 07:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730075.outbound.protection.outlook.com [40.107.73.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00BB6EA6E;
 Thu, 22 Aug 2019 07:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1e72ohAfGrcV944aUWg5/uEdyXE3iaP3qWRWpQ77JBRAoxaOAKXQ+21SUyQE8gvdaXEVtDuGFU7SFRoQrmy4h9766kq5MSvjLj5P2197ubNQYRIFGizQXLkUBceFYOqOEL/Sd3Ci9nGTVfB0YBRl36e84RP9t6WHPxXCdLIqa8raJlCTyU56OcaNXES23XUxt9sDjg6U0n6aH+j9HWwg646GDPma/p50xzO0Tasi1gFz22zyVc47FWeuNsypWJW5T8TaJjbZEXmwgp/pqbZ0x4ulP4DTccNSPW9+t+62NnvjJ5gGAZ9pJ7nF7l5qEZApjhbCUaPyeuKQRe2CrnLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68NuyxdYpjFPg2MIpZjheSpIYd3cedZbQbq110ble5U=;
 b=BamELPbwGJ1Tc+uDyVS65PXw7h4cKmc6Fuo1ekhG9Y7T1e99myW9pmLZTiEFwCFt6TF7fUGBMYo+ky0Vnx5DW3iP59Il6N8n+djbAnOvMXpyb/xi33BDJO+VUo9nwDujH1hmLkZvyfqZuNcPQ54DGzS9bpKymKABaGhYZMqPELvmj5EEip2mmtrBr6n++dQbrZn4pww8kiTSDCWiGvdctHnkHULvQ1raeRtbcdbmcckrjWr9xGYSa2BWU91/Bh0aA8oloQl4Ywapc/ihjHhiiZ5Ko9vWML0D1f3zP3f1qeFTiyl5kyLhhCSNNNo8nJy4BiTynnGbRnEMUWM5JTWxJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1484.namprd12.prod.outlook.com (10.172.40.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 07:53:53 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 07:53:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma_resv: prime lockdep annotations
Thread-Topic: [PATCH] dma_resv: prime lockdep annotations
Thread-Index: AQHVWLaKAMp4gYtYokidaZBq3wxXlacGzAKA
Date: Thu, 22 Aug 2019 07:53:53 +0000
Message-ID: <82b6c2e2-22fa-7896-2018-0d0551f5af31@amd.com>
References: <20190821215030.31660-1-daniel.vetter@ffwll.ch>
 <20190822065457.2830-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190822065457.2830-1-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::24) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 269c0382-d79f-4626-cf2a-08d726d5e08f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1484; 
x-ms-traffictypediagnostic: DM5PR12MB1484:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1484E5D93896EB21B01663E883A50@DM5PR12MB1484.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(6436002)(476003)(66946007)(66574012)(46003)(6246003)(486006)(31696002)(446003)(11346002)(66446008)(66556008)(64756008)(99286004)(66476007)(2616005)(186003)(7736002)(305945005)(7416002)(81156014)(8676002)(81166006)(5660300002)(6506007)(386003)(53936002)(8936002)(102836004)(25786009)(86362001)(110136005)(2906002)(6116002)(4326008)(229853002)(316002)(58126008)(54906003)(6512007)(31686004)(256004)(71190400001)(71200400001)(14454004)(14444005)(65956001)(76176011)(52116002)(6486002)(65806001)(478600001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1484;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2+mKCyfhdbnRnDpsQT4AqH/parFVeyWicE15Y+DCtAUPWLtTsjQTPK9FQQ8s0wQyjMLMyckm009jwO952nzmjQxCnEClRoghFn1LzrPUz/X1JLq12xOoaXl6TVLIpi+t2SSfxskhEcrH7ZDv0BjbwhnfHvTpmwkHfGdjx8BxyIQBM+F0rvhVjgWbs15wKzWwhNLsOfTlG3VjQDWJivZJ+1lMsw242JOx0DSBLEYdSCBR/U3KIUmJwlaaUMbpya3bmzdQxQ+wWbXWpHpCN0IYAiFh5JmKwmxuXKX8eZL3RxD8B78RCwN0+HFEkMBys3LzwwXVZ661GwTuLt0teTdGok8JTKdOO/8SXapi0B/vUdlz/yp81/2nKwfp4mbc4HZdAgrfzxRRcVFpcB9hLqkb4F2+bWj7pCLaj40MqclOFxA=
Content-ID: <D7234810EA17AD4694033DAA0D1904F8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269c0382-d79f-4626-cf2a-08d726d5e08f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 07:53:53.5634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DtKqnjp/8IrenKFtysocJXS9hsVuvxcs1mnUJtOGp1M5CyR8GxQzmOcuzIBf0G1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68NuyxdYpjFPg2MIpZjheSpIYd3cedZbQbq110ble5U=;
 b=QYbmqWbidbS8USBT4R+lcV9IHyf2ZLRanUb983ft3zDYmKoYHKHZLWPjOikYX5xUNaRySjmaEM6ZMZH9FuQbWkvWtIeSP6voDjuxmsnBkLxSfImyJ+wSwtd+glsnpWXUXJDKvS3n71WWtcphIK7eyRODCUXKdH3N67BojS7YHVs=
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

QW0gMjIuMDguMTkgdW0gMDg6NTQgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBGdWxsIGF1ZGl0
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
aGFjayBvdXQsIGNsZWFuDQo+IGluaXRjYWxsIHNvbHV0aW9uIGluLg0KPg0KPiBDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+DQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IENjOiBUb21l
dSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPg0KPiBDYzogRXJpYyBBbmhvbHQg
PGVyaWNAYW5ob2x0Lm5ldD4NCj4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+
DQo+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCj4gQ2M6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4NCj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1n
cmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0
aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9k
bWEtcmVzdi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtcmVzdi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMNCj4gaW5kZXggNDJhOGYzZjEx
NjgxLi5kMjMzZWY0Y2YwZDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jDQo+IEBAIC0zNCw2ICszNCw3
IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+DQo+ICAgI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+DQo+ICAgDQo+
ICAgLyoqDQo+ICAgICogRE9DOiBSZXNlcnZhdGlvbiBPYmplY3QgT3ZlcnZpZXcNCj4gQEAgLTk1
LDYgKzk2LDI5IEBAIHN0YXRpYyB2b2lkIGRtYV9yZXN2X2xpc3RfZnJlZShzdHJ1Y3QgZG1hX3Jl
c3ZfbGlzdCAqbGlzdCkNCj4gICAJa2ZyZWVfcmN1KGxpc3QsIHJjdSk7DQo+ICAgfQ0KPiAgIA0K
PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0xPQ0tERVApDQo+ICtzdGF0aWMgdm9pZCBkbWFfcmVz
dl9sb2NrZGVwKHZvaWQpDQo+ICt7DQo+ICsJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBtbV9hbGxv
YygpOw0KPiArCXN0cnVjdCBkbWFfcmVzdiBvYmo7DQo+ICsNCj4gKwlpZiAoIW1tKQ0KPiArCQly
ZXR1cm47DQo+ICsNCj4gKwlkbWFfcmVzdl9pbml0KCZvYmopOw0KPiArDQo+ICsJZG93bl9yZWFk
KCZtbS0+bW1hcF9zZW0pOw0KPiArCXd3X211dGV4X2xvY2soJm9iai5sb2NrLCBOVUxMKTsNCj4g
Kwlmc19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5FTCk7DQo+ICsJZnNfcmVjbGFpbV9yZWxlYXNl
KEdGUF9LRVJORUwpOw0KPiArCXd3X211dGV4X3VubG9jaygmb2JqLmxvY2spOw0KPiArCXVwX3Jl
YWQoJm1tLT5tbWFwX3NlbSk7DQo+ICsJDQo+ICsJbW1wdXQobW0pOw0KPiArfQ0KPiArc3Vic3lz
X2luaXRjYWxsKGRtYV9yZXN2X2xvY2tkZXApOw0KPiArI2VuZGlmDQo+ICsNCj4gICAvKioNCj4g
ICAgKiBkbWFfcmVzdl9pbml0IC0gaW5pdGlhbGl6ZSBhIHJlc2VydmF0aW9uIG9iamVjdA0KPiAg
ICAqIEBvYmo6IHRoZSByZXNlcnZhdGlvbiBvYmplY3QNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
