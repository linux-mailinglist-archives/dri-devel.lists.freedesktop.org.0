Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB322C1C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 08:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941D891C5;
	Mon, 20 May 2019 06:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2D891C0;
 Mon, 20 May 2019 06:32:13 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1820.namprd12.prod.outlook.com (10.175.88.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 06:31:56 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 06:31:56 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, Erico Nunes
 <nunes.erico@gmail.com>
Subject: Re: lima_bo memory leak after drm_sched job destruction rework
Thread-Topic: lima_bo memory leak after drm_sched job destruction rework
Thread-Index: AQHVDOetqFY6fRnpX0iF/Yr/5gn+6KZvyH2AgAAQpACAACOwAIADlMOA
Date: Mon, 20 May 2019 06:31:55 +0000
Message-ID: <703771df-f086-06e1-f774-592e20e2c625@amd.com>
References: <CAK4VdL2wa=UrpRqfML-ymkEX7LkE6FP3ykgNUQonLdjmaydq_Q@mail.gmail.com>
 <3f1a556e-dd4c-3dc7-b966-a63baf1e7c52@amd.com>
 <CAK4VdL26tEkW+6fU4DaXa8pGAfpQ5TfgiwNhyHXq=EJh72ak=Q@mail.gmail.com>
 <MWHPR12MB145383922FD0BDF21AFFCCB5EA0B0@MWHPR12MB1453.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB145383922FD0BDF21AFFCCB5EA0B0@MWHPR12MB1453.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::25) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd29455a-01bf-467c-121c-08d6dcecd9f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1820; 
x-ms-traffictypediagnostic: DM5PR12MB1820:
x-microsoft-antispam-prvs: <DM5PR12MB18202009A7E94609A982085983060@DM5PR12MB1820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(52314003)(6512007)(102836004)(229853002)(476003)(6246003)(72206003)(11346002)(46003)(53936002)(2616005)(14454004)(6436002)(486006)(316002)(186003)(478600001)(25786009)(6506007)(386003)(8936002)(53546011)(58126008)(66476007)(64756008)(73956011)(4326008)(66446008)(66946007)(66556008)(52116002)(99286004)(54906003)(8676002)(81156014)(81166006)(6486002)(110136005)(31686004)(76176011)(7736002)(65826007)(305945005)(6116002)(2906002)(5660300002)(36756003)(7416002)(65806001)(65956001)(68736007)(256004)(71190400001)(71200400001)(14444005)(31696002)(86362001)(64126003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1820;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PbRCEvF5gJIFjlneJuDGgcFo2YL450Utsa9HBNW7N0yb2lBiTsrkxvFx/9FtC4NW/Q9ZKAuNk3OGKeBriArcG3y02qooWgRFaiLY6o7fD2xJyYQeGoZVNk60I2w38mTG8yQklX4oGa5f0JKLhxM4Rel+c1CtMjvJrxzzv+psscEUtoJ96EeMe1Ctak1jbUU90ICvjrSH60llzooxRKzBossEFCdRmFdyvsEnDEx5/U/6HKV9c/foqq7UTS9vtss7QzQpRSNFpLTMYPUSsdsAzTeJQdAE8UDN4V5VHS1sf/mDBhjACueJcf7klLQSjh4/XOCYsk4Wm8K5NaPAS8STSbgyktCqa0t1Icsb0HE/eFMDt9BAwf6YmDV1OO/7+Tduv1up9CWMpxBab6QHoG++M3j/JNZmpuCKzRckxdPA1tQ=
Content-ID: <59C75C35FB99D7459F8633A0043E1975@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd29455a-01bf-467c-121c-08d6dcecd9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 06:31:55.9527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO1k2kbGU0Y/imrG88pV0wPRO62MAoK5NTANntZcge0=;
 b=wPMA3pSrbGDj+nMhUumLcrPXZ6Cg/I9mm3i6vYDhaluniuuOjp4vY7QQcDTb7q7OsZC6n+fHUV7fcH65Npj+ompysMBdd2jJJThHGhY7Y6ApFnP1QuThId/J5Ttu3SeErcIePmyrdztv90G7A2jj91YgsRqKbGpgd/THHdtbPDE=
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByb2JsZW0gaXMgc2ltcGx5IHRoYXQgd2Ugb25seSBkZWxldGUgdGhlIGpvYnMgd2hlbiB3
ZSB3ZXJlIGFibGUgdG8gDQpjYW5jZWwgdGhlIHRpbWVvdXQgaGFuZGxlci4NCg0KTm93IHdoYXQg
aGFwcGVucyBpcyB0aGF0IHRoZSB0aW1lb3V0IGhhbmRsZXIgd2FzIG5ldmVyIHN0YXJ0ZWQgaW4g
dGhlIA0KZmlyc3QgcGxhY2UsIHNvIHdlIGNhbid0IGNhbmNlbCBpdC4gSnVzdCBhZGRpbmcgYSBz
aW1wbGUgImlmIA0KKHNjaGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUICYmLi4u
LiIgc2hvdWxkIGRvIHRoZSB0cmljay4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMTgu
MDUuMTkgdW0gMDE6NTAgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6DQo+IERvbid0IGhhdmUg
dGhlIGNvZGUgaW4gZnJvbnQgb2YgbWUgbm93IGJ1dCBhcyBmYXIgYXMgSSByZW1lbWJlciBpdCB3
aWxsIG9ubHkgcHJlbWF0dXJlbHkgdGVybWluYXRlIGluIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMg
aWYgdGhlcmUgaXMgdGltZW91dCB3b3JrIGluIHByb2dyZXNzIHdoaWNoIHdvdWxkIG5vdCBiZSB0
aGUgY2FzZSBpZiBub3RoaW5nIGhhbmdzLg0KPg0KPiBBbmRyZXkNCj4NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBGcm9tOiBFcmljbyBOdW5lcyA8bnVuZXMu
ZXJpY29AZ21haWwuY29tPg0KPiBTZW50OiAxNyBNYXkgMjAxOSAxNzo0Mjo0OA0KPiBUbzogR3Jv
ZHpvdnNreSwgQW5kcmV5DQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0
aWFuOyBaaG91LCBEYXZpZChDaHVuTWluZyk7IERhdmlkIEFpcmxpZTsgRGFuaWVsIFZldHRlcjsg
THVjYXMgU3RhY2g7IFJ1c3NlbGwgS2luZzsgQ2hyaXN0aWFuIEdtZWluZXI7IFFpYW5nIFl1OyBS
b2IgSGVycmluZzsgVG9tZXUgVml6b3NvOyBFcmljIEFuaG9sdDsgUmV4IFpodTsgSHVhbmcsIFJh
eTsgRGVuZywgRW1pbHk7IE5heWFuIERlc2htdWtoOyBTaGFyYXQgTWFzZXR0eTsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxp
bWFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBsaW1hX2JvIG1lbW9yeSBs
ZWFrIGFmdGVyIGRybV9zY2hlZCBqb2IgZGVzdHJ1Y3Rpb24gcmV3b3JrDQo+DQo+IFtDQVVUSU9O
OiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6NDMgUE0g
R3JvZHpvdnNreSwgQW5kcmV5DQo+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPiB3cm90ZToN
Cj4+IE9uIDUvMTcvMTkgMzozNSBQTSwgRXJpY28gTnVuZXMgd3JvdGU6DQo+Pj4gTGltYSBjdXJy
ZW50bHkgZGVmYXVsdHMgdG8gYW4gImluZmluaXRlIiB0aW1lb3V0LiBTZXR0aW5nIGEgNTAwbXMN
Cj4+PiBkZWZhdWx0IHRpbWVvdXQgbGlrZSBtb3N0IG90aGVyIGRybV9zY2hlZCB1c2VycyBkbyBm
aXhlZCB0aGUgbGVhayBmb3INCj4+PiBtZS4NCj4+IEkgYW0gbm90IHZlcnkgY2xlYXIgYWJvdXQg
dGhlIHByb2JsZW0gLSBzbyB5b3UgYmFzaWNhbGx5IG5ldmVyIGFsbG93IGENCj4+IHRpbWUgb3V0
IGhhbmRsZXIgdG8gcnVuID8gQW5kIHRoZW4gd2hlbiB0aGUgam9iIGhhbmdzIGZvciBldmVyIHlv
dSBnZXQNCj4+IHRoaXMgbWVtb3J5IGxlYWsgPyBIb3cgaXQgd29ya2VkIGZvciB5b3UgYmVmb3Jl
IHRoaXMgcmVmYWN0b3JpbmcgPyBBcw0KPj4gZmFyIGFzIEkgcmVtZW1iZXIgIHNjaGVkLT5vcHMt
PmZyZWVfam9iIGJlZm9yZSB0aGlzIGNoYW5nZSB3YXMgY2FsbGVkDQo+PiBmcm9tIGRybV9zY2hl
ZF9qb2JfZmluaXNoIHdoaWNoIGlzIHRoZSB3b3JrIHNjaGVkdWxlZCBmcm9tIEhXIGZlbmNlDQo+
PiBzaWduYWxlZCBjYWxsYmFjayAtIGRybV9zY2hlZF9wcm9jZXNzX2pvYiBzbyBpZiB5b3VyIGpv
YiBoYW5ncyBmb3IgZXZlcg0KPj4gYW55d2F5IGFuZCB0aGlzIHdvcmsgaXMgbmV2ZXIgc2NoZWR1
bGVkICB3aGVuIHlvdXIgZnJlZV9qb2IgY2FsbGJhY2sgd2FzDQo+PiBjYWxsZWQgPw0KPiBJbiB0
aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGpvYnMgcnVuIHN1Y2Nlc3NmdWxseSwgbm90aGluZyBo
YW5ncy4NCj4gTGltYSBjdXJyZW50bHkgc3BlY2lmaWVzIGFuICJpbmZpbml0ZSIgdGltZW91dCB0
byB0aGUgZHJtIHNjaGVkdWxlciwNCj4gc28gaWYgYSBqb2IgZGlkIGRpZCBoYW5nLCBpdCB3b3Vs
ZCBoYW5nIGZvcmV2ZXIsIEkgc3VwcG9zZS4gQnV0IHRoaXMNCj4gaXMgbm90IHRoZSBpc3N1ZS4N
Cj4NCj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSBpdCB3b3JrZWQgd2VsbCBiZWZvcmUgdGhl
IHJld29yayBiZWNhdXNlIHRoZQ0KPiBjbGVhbnVwIHdhcyB0cmlnZ2VyZWQgYXQgdGhlIGVuZCBv
ZiBkcm1fc2NoZWRfcHJvY2Vzc19qb2INCj4gaW5kZXBlbmRlbnRseSBvbiB0aGUgdGltZW91dC4N
Cj4NCj4gV2hhdCBJJ20gb2JzZXJ2aW5nIG5vdyBpcyB0aGF0IGV2ZW4gd2hlbiBqb2JzIHJ1biBz
dWNjZXNzZnVsbHksIHRoZXkNCj4gYXJlIG5vdCBjbGVhbmVkIGJ5IHRoZSBkcm0gc2NoZWR1bGVy
IGJlY2F1c2UgZHJtX3NjaGVkX2NsZWFudXBfam9icw0KPiBzZWVtcyB0byBnaXZlIHVwIGJhc2Vk
IG9uIHRoZSBzdGF0dXMgb2YgYSB0aW1lb3V0IHdvcmtlci4NCj4gSSB3b3VsZCBleHBlY3QgdGhl
IHRpbWVvdXQgdmFsdWUgdG8gb25seSBiZSByZWxldmFudCBpbiBlcnJvci9odW5nIGpvYiBjYXNl
cy4NCj4NCj4gSSB3aWxsIHByb2JhYmx5IHNldCB0aGUgdGltZW91dCB0byBhIHJlYXNvbmFibGUg
dmFsdWUgYW55d2F5LCBJIGp1c3QNCj4gcG9zdGVkIGhlcmUgdG8gcmVwb3J0IHRoYXQgdGhpcyBj
YW4gcG9zc2libHkgYmUgYSBidWcgaW4gdGhlIGRybQ0KPiBzY2hlZHVsZXIgYWZ0ZXIgdGhhdCBy
ZXdvcmsuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
