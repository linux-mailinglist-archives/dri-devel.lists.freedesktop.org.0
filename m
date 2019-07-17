Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3676B826
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 10:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD76E073;
	Wed, 17 Jul 2019 08:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCFF6E073;
 Wed, 17 Jul 2019 08:26:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3qfW5VFZ2V3estBgSIeMODvkzsCbbW5t5SQsNO6AQaoyf0aOoUs5iRdrvCUnkOlsFS8890Ae3eUb5M7ek7H07n7zSMeldcaytG4Fb/6Zw3+G5V9IqGeizdxmgC4ZkYa0O73OfMNNkDCdIoWA3c1e35tGKvNlJ5VSlu1FOLWTSnIvTAX4lPGcVZ06Io8VXCAdfGBO9F38+OIytDW3PWbhcujfqWLlCBvbBPkdu3tB+GcgoF3ipUhbchQ5oXwWSfVYaUKTZZZRHaiZM/7Axenv0HCSAuTjJJQdNHKi4IXN5k0a6R0sPrRvRGtED7hjQZZuYyA4DmTmLcGxSfc5fUAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n39A5SiouBztA2S4niXFPSK1RkTjHWiMR3m1a0wdh3o=;
 b=IHcYSk/BlKaPY3ZLr8iWLm3l5wwl+VGzhKghIJl5rz7ihr8wCi0X7ljkjAjwQu+1xygPLZ+FUvixBe+UkX92Xuxt+uskvod1iH/lsHGLVH3WU7phPLjuL/g+ANodms6KbcDRF/bC2fQb7fJF88DYNkoALM3qKyBnoda9w0HlBIhhYBF8nki2Q7QDcuo2FNazbWS2QAul87eXWV4Oz7Ai19Q+duipTQ/riOhwqokF2LhnK1T3xYz4KAtJVxc4W4GRHRwCgqpUHFLCiBKrkjAzcu31d4ilOO+fidYZoX9EA+M9aqsLiJgqhpo9DwMXn9MIu5xSyL1DFrEy19rxI49HQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1539.namprd12.prod.outlook.com (10.172.19.9) by
 BN6PR12MB1490.namprd12.prod.outlook.com (10.172.23.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 08:26:11 +0000
Received: from BN6PR12MB1539.namprd12.prod.outlook.com
 ([fe80::c9db:2d12:2826:8cf3]) by BN6PR12MB1539.namprd12.prod.outlook.com
 ([fe80::c9db:2d12:2826:8cf3%11]) with mapi id 15.20.2073.012; Wed, 17 Jul
 2019 08:26:11 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Topic: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
Thread-Index: AQHVMa+5D4JQAZoizUi8c/qNyeh4o6a5ALiAgBWOdgA=
Date: Wed, 17 Jul 2019 08:26:11 +0000
Message-ID: <4362a379-6f74-d7b4-c512-0c827d8fff2e@amd.com>
References: <0bc184ea-bcc3-48cb-9b28-42e8fc037303@email.android.com>
 <CACvgo52y50bV90+7JeABvKCNCwT_E7r7CXTw98bOgyiDDzG2Pg@mail.gmail.com>
In-Reply-To: <CACvgo52y50bV90+7JeABvKCNCwT_E7r7CXTw98bOgyiDDzG2Pg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::33) To BN6PR12MB1539.namprd12.prod.outlook.com
 (2603:10b6:405:6::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3b64653-2682-4d36-9809-08d70a906c7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1490; 
x-ms-traffictypediagnostic: BN6PR12MB1490:
x-microsoft-antispam-prvs: <BN6PR12MB1490649CA73B9B7BBC8927B183C90@BN6PR12MB1490.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(189003)(199004)(6506007)(6486002)(386003)(4326008)(66946007)(64756008)(66446008)(5660300002)(6436002)(66476007)(6512007)(66556008)(2616005)(31686004)(46003)(476003)(53936002)(6246003)(186003)(86362001)(36756003)(64126003)(25786009)(256004)(14454004)(31696002)(102836004)(54906003)(316002)(229853002)(58126008)(52116002)(6916009)(76176011)(2906002)(71190400001)(71200400001)(6116002)(65806001)(486006)(7736002)(305945005)(446003)(11346002)(65956001)(8676002)(8936002)(81156014)(81166006)(478600001)(68736007)(65826007)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1490;
 H:BN6PR12MB1539.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dA0AQf1hwTGYgUxXvKgXzT/ZQO7wLpQPlLbLeGuOepPeb9GWItCRVytNWyej5sIf6P+PFEdFED+HmJiFmdOnPzxf3uqxzCP7Sw0qdG2X/ds5zaWkXdup7OvHAOJv10WqLDiGYeIev2/KSUdXPOmy3ouhnPv2gl9RtwNUigIH4+EFRqNYcSG2WmGUIIDTcNr27cyhH16dE+vMGGsVBgAAaPa777rih73WgcXOVvlMOwcJODShcrgi3kTJdJ+YEH/l2djnqJNj10Rg1g2nlLBnaMTciWCzzLPV7MfhabUL8toaS2SyVayR25CInUPzuVCBR9Vq9f0yXxt6qVZ/MUp34QyZa9ixy2GJdUdEdeGNVbHp38VmO7tsK+CIMHmqlod5zy6n7OBWS5WGU/lVf7VH2DwXTAXyOUvAReAcivHbBN8=
Content-ID: <2CA5D596283AB84B82F9A3B98589ED98@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b64653-2682-4d36-9809-08d70a906c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 08:26:11.1650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1490
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n39A5SiouBztA2S4niXFPSK1RkTjHWiMR3m1a0wdh3o=;
 b=zndxOKIAHdokpSeSsf0JEPcPYLHWh0PvMaEaj3fGc5WbqBBH/XUo9tf/0Mn1fV9b+clP3BotPflmVeJ2zLVSocAiturtKZ2/Jg0vf/Hm7eqpAhJN1Dxmb0pPLnrdLQmMhKq4/LyqkBRpZSPVMCR3vdbydT0bVeNhl108mU0QoZE=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwNCg0KU29ycnkgZm9yIHRoZSBkZWxheSwgZmluYWxseSBjb21pbmcgYmFjayB0byB0
aGlzIGFmdGVyIG15IHZhY2F0aW9uLg0KDQpBbSAwMy4wNy4xOSB1bSAxNzoxNCBzY2hyaWViIEVt
aWwgVmVsaWtvdjoNCj4gT24gV2VkLCAzIEp1bCAyMDE5IGF0IDE1OjU4LCBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+IEFtIDAzLjA3LjIwMTkg
MTY6NTEgc2NocmllYiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT46DQo+
Pg0KPj4gT24gV2VkLCAzIEp1bCAyMDE5IGF0IDE1OjMzLCBLb2VuaWcsIENocmlzdGlhbiA8Q2hy
aXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+PiBBbSAwMy4wNy4yMDE5IDE2OjAwIHNj
aHJpZWIgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Og0KPj4+DQo+Pj4g
T24gV2VkLCAzIEp1bCAyMDE5IGF0IDE0OjQ4LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+Pj4gV2VsbCB0aGlzIGlzIHN0aWxsIGEgTkFLLg0K
Pj4+Pg0KPj4+PiBBcyBzdGF0ZWQgcHJldmlvdXNseSBwbGVhc2UganVzdCBkb24ndCByZW1vdmUg
RFJNX0FVVEggYW5kIGtlZXAgdGhlIGZ1bmN0aW9uYWxpdHkgYXMgaXQgaXMuDQo+Pj4+DQo+Pj4g
QUZBSUNUIG5vYm9keSB3YXMgaW4gZmF2b3VyIG9mIHlvdXIgc3VnZ2VzdGlvbiB0byByZW1vdmUg
RFJNX0FVVEggZnJvbQ0KPj4+IHRoZSBoYW5kbGUgdG8vZnJvbSBmZCBpb2NsdHMuDQo+Pj4gVGh1
cyB0aGlzIHNlZW1zIGxpa2UgdGhlIHNlY29uZCBiZXN0IG9wdGlvbi4NCj4+Pg0KPj4+DQo+Pj4g
V2VsbCBqdXN0IGtlZXAgaXQuIEFzIEkgc2FpZCBwbGVhc2UgZG9uJ3QgY2hhbmdlIGFueXRoaW5n
IGhlcmUuDQo+Pj4NCj4+PiBEcm9wcGluZyBEUk1fQVVUSCBmcm9tIHRoZSBkcml2ZXIgSU9DVExz
IHdhcyBzdWZmaWNpZW50IHRvIHdvcmsgYXJvdW5kIHRoZSBwcm9ibGVtcyBhdCBoYW5kIGZhciBh
cyBJIGtub3cuDQo+Pj4NCj4+IFdlIGFsc28gbmVlZCB0aGUgRFJNX0FVVEggZm9yIGhhbmRsZSB0
by9mcm9tIGZkIG9uZXMuIE1lc2EgZHJpdmVycyB1c2UNCj4+IHRob3NlIGlvY3Rscy4NCj4+DQo+
Pg0KPj4gWWVhaCwgYnV0IG9ubHkgZm9yIGltcG9ydGluZy9leHBvcnRpbmcgdGhpbmdzLg0KPj4N
Cj4+IEFuZCBpbiB0aG9zZSBjYXNlcyB3ZSBlaXRoZXIgYWxyZWFkeSBnYXZlIHJlbmRlciBub2Rl
cyBvciBjb3JyZWN0bHkgYXV0aGVudGljYXRlZCBwcmltYXJ5IG5vZGVzLg0KPj4NCj4+IFNvIG5v
IG5lZWQgdG8gY2hhbmdlIGFueXRoaW5nIGhlcmUgYXMgZmFyIGFzIEkgc2VlLg0KPj4NCj4gTm90
IHF1aXRlLiBXaGVuIHdvcmtpbmcgd2l0aCB0aGUgcHJpbWFyeSBub2RlIHdlIGhhdmUgdGhlIGZv
bGxvd2luZyBzY2VuYXJpb3M6DQo+ICAgLSBoYW5kbGUgdG8gZmQgLT4gcGFzcyBmZCB0byBvdGhl
ciBBUElzIC0gZ2JtLCBvcGVuY2wsIHZkcGF1LCBldGMNCj4gICAtIGhhbmRsZSB0byBmZCAtPiBm
ZCB0byBoYW5kbGUgLSB1c2UgaXQgaW50ZXJuYWxseQ0KDQpZZWFoLCBidXQgdGhpcyB3b3VsZCBv
bmNlIG1vcmUgbWVhbiB0aGF0IHdlIGV4cG9zZSB0aGUgc2FtZSANCmZ1bmN0aW9uYWxpdHkgb24g
dGhlIHByaW1hcnkgbm9kZSB3ZSBkbyBvbiB0aGUgcmVuZGVyIG5vZGUuDQoNCkFuZCB0aGF0IGlz
IGV4YWN0bHkgd2hhdCBJIHdhbnQgdG8gcHJldmVudCwgYmVjYXVzZSBJIHRoaW5rIGl0IGlzIGEg
dmVyeSANCmJhZCBpZGVhIGFuZCB3aWxsIHJlc3VsdCBpbiBiYXNpY2FsbHkgZGVwcmVjYXRpbmcg
dGhlIHJlbmRlciBub2RlLg0KDQpGb3IgdGhlIHByb2JsZW0gYXQgaGFuZCBpdCB3YXMgc3VmZmlj
aWVudCB0byBkcm9wIHRoZSBEUk1fQVVUSCBmbGFnIGZyb20gDQp0aGUgZHJpdmVyIElPQ1RMcyBh
bmQgSSBkb24ndCBzZWUgYSByZWFzb24gd2h5IHdlIHNob3VsZCBnbyBmdXJ0aGVyIHRoYW4gDQp0
aGlzLg0KDQpQbGVhc2UganVzdCBjb21wbGV0ZWx5IGRyb3AgdGhpcyB3aG9sZSBhcHByb2FjaCwN
CkNocmlzdGlhbi4NCg0KPg0KPiAtRW1pbA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
