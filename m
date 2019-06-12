Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0D41EE6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ADC89262;
	Wed, 12 Jun 2019 08:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810053.outbound.protection.outlook.com [40.107.81.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8803B89262
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:20:47 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1707.namprd12.prod.outlook.com (10.175.86.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 08:20:41 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 08:20:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Thread-Topic: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Thread-Index: AQHVIL1FUykFich2jk+2KmuqNh9/V6aXpCSAgAAEqwCAAAD9AIAAAtUAgAABTIA=
Date: Wed, 12 Jun 2019 08:20:41 +0000
Message-ID: <c5e04bf7-d07e-9e26-df65-d7382d6051ba@amd.com>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
 <20190612080214.GA8876@Asurada>
 <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
 <20190612081554.GB8876@Asurada>
In-Reply-To: <20190612081554.GB8876@Asurada>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:20b::40)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b6f6909-d3de-44a5-4719-08d6ef0edb64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1707; 
x-ms-traffictypediagnostic: DM5PR12MB1707:
x-microsoft-antispam-prvs: <DM5PR12MB1707FE39D9A2D26626971C2983EC0@DM5PR12MB1707.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(65806001)(46003)(102836004)(99286004)(52116002)(76176011)(86362001)(36756003)(186003)(31696002)(386003)(6506007)(5660300002)(31686004)(73956011)(66946007)(64756008)(66446008)(66556008)(66476007)(14454004)(478600001)(72206003)(2906002)(25786009)(4326008)(65956001)(6436002)(6486002)(54906003)(58126008)(316002)(6246003)(6916009)(229853002)(6512007)(65826007)(53936002)(2616005)(5024004)(68736007)(64126003)(1411001)(305945005)(7736002)(71190400001)(71200400001)(6116002)(256004)(81166006)(8936002)(81156014)(8676002)(486006)(476003)(446003)(11346002)(56590200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1707;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yfFbgsyRrFnM5pSlBnIW31FHv1WmaBPGQ+crt6XJQxbrP4wzB2qc7iqzqFXLhqAeZ75ZVXz2XzPpspbmVjvex7OuisfZZdVCgv5iXrqVE5kPH1xo96DtjIIkridbRb2pjC6B7xlJdQj9FN9h695KnM1L8zVxQDYp6YRFfsy157AvJhndf0TWomre0xZzr6LhBZKmmWWlEfnOA2E2WK+854yJwSuHqdF/N7t7qOyUaxFbXUwuiELUm6V5V15AWKX/nJl7JgOxpCJv0WQkCcH5WC+UF+d56/FUKKIokEEF6ztUGGQnKZa7d7/KG6k7b0LwJA51BY+6x3O3LyrQSfyTpx4wdg6uhy4bPkCSYB0HwmQoQMesAoEd0gkOhms18j3YpNSFKOanSBrXMT/67bAFNDog71b91NobYDZEOuRpIYE=
Content-ID: <10BD814C49D1534D8785E7E5D7E605A4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6f6909-d3de-44a5-4719-08d6ef0edb64
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 08:20:41.2289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VWXqP48nG9DcEfa26o6/7LluAgO5TmF+a+6o/neJHU=;
 b=l5td3RfTHAR9bq0Ca3J9z5++MXRF1L8MQpLsIsVtKfiiHQUsx3gcNsEDe3v5o4iZMelPUtLqiXA+yj3os+o3/q7ZZX1Ks+ym5KjPQz5ZYZKsZ80bikMNEkyOry1EvdQJNqqeTxQdRJhmUeHd8kKPLj3fBSDIUA8KXbSBCCgw/Go=
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDYuMTkgdW0gMTA6MTUgc2NocmllYiBOaWNvbGluIENoZW46DQo+IEhpIENocmlzdGlh
biwNCj4NCj4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDg6MDU6NTNBTSArMDAwMCwgS29lbmln
LCBDaHJpc3RpYW4gd3JvdGU6DQo+PiBBbSAxMi4wNi4xOSB1bSAxMDowMiBzY2hyaWViIE5pY29s
aW4gQ2hlbjoNCj4+IFtTTklQXQ0KPj4+IFdlIGhhdmVuJ3QgdXNlZCBEUk0vR1JNX1BSSU1FIHll
dCBidXQgSSBhbSBhbHNvIGN1cmlvdXMgd291bGQgaXQNCj4+PiBiZW5lZml0IERSTSBhbHNvIGlm
IHdlIHJlZHVjZSB0aGlzIG92ZXJoZWFkIGluIHRoZSBkbWFfYnVmPw0KPj4gTm8sIG5vdCBhdCBh
bGwuDQo+ICBGcm9tIHlvdSByZXBsaWVzLCBpbiBhIHN1bW1hcnksIGRvZXMgaXQgbWVhbnMgdGhh
dCB0aGVyZSB3b24ndCBiZSBhIGNhc2UNCj4gb2YgRFJNIGhhdmluZyBhIGRtYV9idWYgYXR0YWNo
aW5nIHRvIHRoZSBzYW1lIGRldmljZSwgaS5lLiBtdWx0aXBsZSBjYWxscw0KPiBvZiBkcm1fZ2Vt
X3ByaW1lX2ltcG9ydCgpIGZ1bmN0aW9uIHdpdGggc2FtZSBwYXJhbWV0ZXJzIG9mIGRldiArIGRt
YV9idWY/DQoNCldlbGwsIHRoZXJlIGFyZSBzb21lIGNhc2VzIHdoZXJlIHRoaXMgaGFwcGVucy4g
QnV0IGluIHRob3NlIGNhc2VzIHdlIA0KaW50ZW50aW9uYWxseSB3YW50IHRvIGdldCBhIG5ldyBh
dHRhY2htZW50IDopDQoNClNvIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQgeW91IHdvdWxkIGFjdHVh
bGx5IGJyZWFrIHRob3NlIGFuZCB0aGF0IGlzIG5vdCANCnNvbWV0aGluZyB3ZSBjYW4gZG8uDQoN
Cj4gSWYgc28sIHdlIGNhbiBqdXN0IGlnbm9yZS9kcm9wIHRoaXMgcGF0Y2guIFNvcnJ5IGZvciB0
aGUgbWlzdW5kZXJzdGFuZGluZy4NCg0KSXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcgZm9yIHRoaW5n
cyBsaWtlIFAyUCwgYnV0IGV2ZW4gdGhlbiBpdCBtaWdodCBiZSANCmJldHRlciB0byBqdXN0IGNh
Y2hlIHRoZSBQMlAgc2V0dGluZ3MgaW5zdGVhZCBvZiB0aGUgZnVsbCBhdHRhY2htZW50Lg0KDQpS
ZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRoYW5rcw0KPiBOaWNvbGluDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
