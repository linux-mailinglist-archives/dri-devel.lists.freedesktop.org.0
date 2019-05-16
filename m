Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48F72000F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDF58929B;
	Thu, 16 May 2019 07:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24468929B;
 Thu, 16 May 2019 07:16:50 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1594.namprd12.prod.outlook.com (10.172.39.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 07:16:48 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 07:16:48 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Kenny Ho <y2kenny@gmail.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Topic: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Index: AQHVC48rVkIxCCCoYECMKlqE0zp4P6ZtV34A
Date: Thu, 16 May 2019 07:16:48 +0000
Message-ID: <7db2caae-7eab-7c6a-fe90-89cb9cae30b4@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
In-Reply-To: <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P192CA0064.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::41) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bba9a4d5-c904-4ff5-fbbd-08d6d9ce758a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1594; 
x-ms-traffictypediagnostic: DM5PR12MB1594:
x-microsoft-antispam-prvs: <DM5PR12MB1594411FCCDAADAE0294C306830A0@DM5PR12MB1594.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(476003)(102836004)(65956001)(5660300002)(64126003)(53546011)(386003)(6506007)(11346002)(2616005)(65806001)(446003)(110136005)(54906003)(6116002)(2906002)(31696002)(14454004)(76176011)(6512007)(58126008)(316002)(478600001)(72206003)(486006)(186003)(46003)(86362001)(71190400001)(25786009)(71200400001)(66476007)(7736002)(64756008)(68736007)(66446008)(81166006)(53936002)(6246003)(8936002)(66946007)(6436002)(305945005)(81156014)(6486002)(36756003)(65826007)(99286004)(52116002)(4326008)(14444005)(256004)(229853002)(73956011)(8676002)(31686004)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1594;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdQSv59yw3DqE1aXKz8zyibBPvFeYembyrMoGH4dIT0rYC2KHvcmAOeckAeh3uwqKo/N3S/6jZlanZm1zxfUAZlnnh8CnqZNbkI+vvtm8+o88xhY0j3MzxeYK8yro2eMziunVlPgrs8lGKKmPx1grcu4jrxnejcvl8T4Cy/oaGnnUtbU7QgbcRDxtZJCP9PpNtabGIz998hHTCRkK976Izoc+TOlpHEaHncQsPE3M/Nyoeuw4AL5GmwzMmRG90bgd1EgOtSm1/mfrN5CYEX59l/dsQYQgykaVbF2jpbkCNt8r4dIkDvnkszKqH/k7mZTW0fb3axqlQ8aEPbvztrpX0sg+ytfNZcHoXf4nhOP4x1njR202EX56x2wKI0P4ni/hBvJlm8OPFRFxz5vKUQyuDFxZ8EyL1GhLa1ht9BTXL4=
Content-ID: <622421720930CA4F9D89C1B1175532DB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba9a4d5-c904-4ff5-fbbd-08d6d9ce758a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 07:16:48.1109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kf4YbEdaga6g3pkE+jc1pD/GBzPVW/3npeuVsmSaiUs=;
 b=vIUPKk9/IvpbpthLZerfU/miyMJv4FfcpCafzzDwpnoAmUcC+g1l1c8pE0fA8nDbArFoTLiVOD1mCdw5SCR99OHF7nhg8ikGVVHvlOv7dN6dC4pBljOO+dbJGPQz7bdyCjPCKW0zFGl2x115RVU9mtpBqgWBhTAv/8FnwOUxDe0=
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDUuMTkgdW0gMDQ6Mjkgc2NocmllYiBLZW5ueSBIbzoNCj4gW0NBVVRJT046IEV4dGVy
bmFsIEVtYWlsXQ0KPg0KPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCA1OjI2IFBNIFdlbHR5LCBC
cmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPiB3cm90ZToNCj4+IE9uIDUvOS8yMDE5IDI6MDQg
UE0sIEtlbm55IEhvIHdyb3RlOg0KPj4+IFRoZXJlIGFyZSBmb3VyIGNvbnRyb2wgZmlsZSB0eXBl
cywNCj4+PiBzdGF0cyAocm8pIC0gZGlzcGxheSBjdXJyZW50IG1lYXN1cmVkIHZhbHVlcyBmb3Ig
YSByZXNvdXJjZQ0KPj4+IG1heCAocncpIC0gbGltaXRzIGZvciBhIHJlc291cmNlDQo+Pj4gZGVm
YXVsdCAocm8sIHJvb3QgY2dyb3VwIG9ubHkpIC0gZGVmYXVsdCB2YWx1ZXMgZm9yIGEgcmVzb3Vy
Y2UNCj4+PiBoZWxwIChybywgcm9vdCBjZ3JvdXAgb25seSkgLSBoZWxwIHN0cmluZyBmb3IgYSBy
ZXNvdXJjZQ0KPj4+DQo+Pj4gRWFjaCBmaWxlIGlzIG11bHRpLWxpbmVkIHdpdGggb25lIGVudHJ5
L2xpbmUgcGVyIGRybSBkZXZpY2UuDQo+PiBNdWx0aS1saW5lIGlzIGNvcnJlY3QgZm9yIG11bHRp
cGxlIGRldmljZXMsIGJ1dCBJIGJlbGlldmUgeW91IG5lZWQNCj4+IHRvIHVzZSBhIEtFWSB0byBk
ZW5vdGUgZGV2aWNlIGZvciBib3RoIHlvdXIgc2V0IGFuZCBnZXQgcm91dGluZXMuDQo+PiBJIGRp
ZG4ndCBzZWUgeW91ciBzZXQgZnVuY3Rpb25zIHJlYWRpbmcgYSBrZXksIG9yIHRoZSBnZXQgZnVu
Y3Rpb25zDQo+PiBwcmludGluZyB0aGUga2V5IGluIG91dHB1dC4NCj4+IGNncm91cHMtdjIgY29u
dmVudGlvbnMgbWVudGlvbiB1c2luZyBLRVkgb2YgbWFqb3I6bWlub3IsIGJ1dCBJIHRoaW5rDQo+
PiB5b3UgY2FuIHVzZSBkcm1fbWlub3IgYXMga2V5Pw0KPiBHaXZlbiB0aGlzIGNvbnRyb2xsZXIg
aXMgc3BlY2lmaWMgdG8gdGhlIGRybSBrZXJuZWwgc3Vic3lzdGVtIHdoaWNoDQo+IHVzZXMgbWlu
b3IgdG8gaWRlbnRpZnkgZHJtIGRldmljZSwNCg0KV2FpdCBhIHNlY29uZCwgdXNpbmcgdGhlIERS
TSBtaW5vciBpcyBhIGdvb2QgaWRlYSBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNCkkgaGF2ZSBhIHRl
c3Qgc3lzdGVtIHdpdGggYSBWZWdhMTAgYW5kIGEgVmVnYTIwLiBXaGljaCBkZXZpY2UgZ2V0cyB3
aGljaCANCm1pbm9yIGlzIG5vdCBzdGFibGUsIGJ1dCByYXRoZXIgZGVmaW5lZCBieSB0aGUgc2Nh
biBvcmRlciBvZiB0aGUgUENJZSBidXMuDQoNCk5vcm1hbGx5IHRoZSBzY2FuIG9yZGVyIGlzIGFs
d2F5cyB0aGUgc2FtZSwgYnV0IGFkZGluZyBvciByZW1vdmluZyANCmRldmljZXMgb3IgZGVsYXlp
bmcgdGhpbmdzIGp1c3QgYSBsaXR0bGUgYml0IGR1cmluZyBpbml0IGlzIGVub3VnaCB0byANCmNo
YW5nZSB0aGlzLg0KDQpXZSBuZWVkIHNvbWV0aGluZyBsaWtlIHRoZSBMaW51eCBzeXNmcyBsb2Nh
dGlvbiBvciBzaW1pbGFyIHRvIGhhdmUgYSANCnN0YWJsZSBpbXBsZW1lbnRhdGlvbi4NCg0KUmVn
YXJkcywNCkNocmlzdGlhbi4NCg0KPiAgIEkgZG9uJ3Qgc2VlIGEgbmVlZCB0byBjb21wbGljYXRl
DQo+IHRoZSBpbnRlcmZhY2VzIG1vcmUgYnkgaGF2aW5nIG1ham9yIGFuZCBhIGtleS4gIEFzIHlv
dSBjYW4gc2VlIGluIHRoZQ0KPiBleGFtcGxlcyBiZWxvdywgdGhlIGRybSBkZXZpY2UgbWlub3Ig
Y29ycmVzcG9uZHMgdG8gdGhlIGxpbmUgbnVtYmVyLg0KPiBJIGFtIG5vdCBzdXJlIGhvdyBzdHJp
Y3QgY2dyb3VwIHVwc3RyZWFtIGlzIGFib3V0IHRoZSBjb252ZW50aW9uIGJ1dCBJDQo+IGFtIGhv
cGluZyB0aGVyZSBhcmUgZmxleGliaWxpdHkgaGVyZSB0byBhbGxvdyBmb3Igd2hhdCBJIGhhdmUN
Cj4gaW1wbGVtZW50ZWQuICBUaGVyZSBhcmUgYSBjb3VwbGUgb2Ygb3RoZXIgdGhpbmdzIEkgaGF2
ZSBkb25lIHRoYXQgaXMNCj4gbm90IGRlc2NyaWJlZCBpbiB0aGUgY29udmVudGlvbjogMSkgaW5j
bHVzaW9uIG9mIHJlYWQtb25seSAqLmhlbHAgZmlsZQ0KPiBhdCB0aGUgcm9vdCBjZ3JvdXAsIDIp
IHVzZSByZWFkLW9ubHkgKHdoaWNoIEkgY2FuIHBvdGVudGlhbGx5IG1ha2UgcncpDQo+ICouZGVm
YXVsdCBmaWxlIGluc3RlYWQgb2YgaGF2aW5nIGEgZGVmYXVsdCBlbnRyaWVzIChzaW5jZSB0aGUg
ZGVmYXVsdA0KPiBjYW4gYmUgZGlmZmVyZW50IGZvciBkaWZmZXJlbnQgZGV2aWNlcykgaW5zaWRl
IHRoZSBjb250cm9sIGZpbGVzICh0aGlzDQo+IHdheSwgdGhlIHJlc2V0dGluZyBvZiBjZ3JvdXAg
dmFsdWVzIGZvciBhbGwgdGhlIGRybSBkZXZpY2VzLCBjYW4gYmUNCj4gZG9uZSBieSBhIHNpbXBs
ZSAnY3AnLikNCj4NCj4+PiBVc2FnZSBleGFtcGxlczoNCj4+PiAvLyBzZXQgbGltaXQgZm9yIGNh
cmQxIHRvIDFHQg0KPj4+IHNlZCAtaSAnMnMvLiovMTA3Mzc0MTgyNC8nIC9zeXMvZnMvY2dyb3Vw
LzxjZ3JvdXA+L2RybS5idWZmZXIudG90YWwubWF4DQo+Pj4NCj4+PiAvLyBzZXQgbGltaXQgZm9y
IGNhcmQwIHRvIDUxMk1CDQo+Pj4gc2VkIC1pICcxcy8uKi81MzY4NzA5MTIvJyAvc3lzL2ZzL2Nn
cm91cC88Y2dyb3VwPi9kcm0uYnVmZmVyLnRvdGFsLm1heA0KPg0KPj4+ICAgLyoqIEBmaWxlIGRy
bV9nZW0uYw0KPj4+IEBAIC0xNTQsNiArMTU2LDkgQEAgdm9pZCBkcm1fZ2VtX3ByaXZhdGVfb2Jq
ZWN0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiAgICAgICAgb2JqLT5oYW5kbGVf
Y291bnQgPSAwOw0KPj4+ICAgICAgICBvYmotPnNpemUgPSBzaXplOw0KPj4+ICAgICAgICBkcm1f
dm1hX25vZGVfcmVzZXQoJm9iai0+dm1hX25vZGUpOw0KPj4+ICsNCj4+PiArICAgICBvYmotPmRy
bWNncnAgPSBnZXRfZHJtY2dycChjdXJyZW50KTsNCj4+PiArICAgICBkcm1jZ3JwX2NoZ19ib19h
bGxvYyhvYmotPmRybWNncnAsIGRldiwgc2l6ZSk7DQo+PiBXaHkgZG8gdGhlIGNoYXJnaW5nIGhl
cmU/DQo+PiBUaGVyZSBpcyBubyBiYWNraW5nIHN0b3JlIHlldCBmb3IgdGhlIGJ1ZmZlciwgc28g
dGhpcyBpcyByZWFsbHkgdHJhY2tpbmcgc29tZXRoaW5nIGFraW4gdG8gYWxsb3dlZCB2aXJ0dWFs
IG1lbW9yeSBmb3IgR0VNIG9iamVjdHM/DQo+PiBJcyB0aGlzIHJlYWxseSB1c2VmdWwgZm9yIGFu
IGFkbWluaXN0cmF0b3IgdG8gY29udHJvbD8NCj4+IElzbid0IHRoZSByZXNvdXJjZSB3ZSB3YW50
IHRvIGNvbnRyb2wgYWN0dWFsbHkgdGhlIHBoeXNpY2FsIGJhY2tpbmcgc3RvcmU/DQo+IFRoYXQn
cyBjb3JyZWN0LiAgVGhpcyBpcyBqdXN0IHRoZSBmaXJzdCBsZXZlbCBvZiBjb250cm9sIHNpbmNl
IHRoZQ0KPiBiYWNraW5nIHN0b3JlIGNhbiBiZSBiYWNrZWQgYnkgZGlmZmVyZW50IHR5cGUgb2Yg
bWVtb3J5LiAgSSBhbSBpbiB0aGUNCj4gcHJvY2VzcyBvZiBhZGRpbmcgYXQgbGVhc3QgdHdvIG1v
cmUgcmVzb3VyY2VzLiAgU3RheSB0dW5lZC4gIEkgYW0NCj4gZG9pbmcgdGhlIGNoYXJnZSBoZXJl
IHRvIGVuZm9yY2UgdGhlIGlkZWEgb2YgImNyZWF0b3IgaXMgZGVlbWVkIG93bmVyIg0KPiBhdCBh
IHBsYWNlIHdoZXJlIHRoZSBjb2RlIGlzIHNoYXJlZCBieSBhbGwgKHRoZSBpbml0IGZ1bmN0aW9u
LikNCj4NCj4+PiArICAgICB3aGlsZSAoaSA8PSBtYXhfbWlub3IgJiYgbGltaXRzICE9IE5VTEwp
IHsNCj4+PiArICAgICAgICAgICAgIHN2YWwgPSAgc3Ryc2VwKCZsaW1pdHMsICJcbiIpOw0KPj4+
ICsgICAgICAgICAgICAgcmMgPSBrc3RydG9sbChzdmFsLCAwLCAmdmFsKTsNCj4+IElucHV0IHNo
b3VsZCBiZSAiS0VZIFZBTFVFIiwgc28gS0VZIHdpbGwgZGV0ZXJtaW5lIGRldmljZSB0byBhcHBs
eSB0aGlzIHRvLg0KPj4gQWxzbywgcGVyIGNncm91cHMtdjIgZG9jdW1lbnRhdGlvbiBvZiBsaW1p
dHMsIEkgYmVsaWV2ZSBuZWVkIHRvIHBhcnNlIGFuZCBoYW5kbGUgdGhlIHNwZWNpYWwgIm1heCIg
aW5wdXQgdmFsdWUuDQo+Pg0KPj4gcGFyc2VfcmVzb3VyY2VzKCkgaW4gcmRtYSBjb250cm9sbGVy
IGlzIGV4YW1wbGUgZm9yIGJvdGggb2YgYWJvdmUuDQo+IFBsZWFzZSBzZWUgbXkgcHJldmlvdXMg
cmVwbHkgZm9yIHRoZSByYXRpb25hbGUgb2YgbXkgaG9wZSB0byBub3QgbmVlZA0KPiBhIGtleS4g
IEkgY2FuIGNlcnRhaW5seSBhZGQgaGFuZGxpbmcgb2YgIm1heCIgYW5kICJkZWZhdWx0Ii4NCj4N
Cj4NCj4+PiArdm9pZCBkcm1jZ3JwX2NoZ19ib19hbGxvYyhzdHJ1Y3QgZHJtY2dycCAqZHJtY2dy
cCwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiArICAgICAgICAgICAgIHNpemVfdCBzaXpl
KQ0KPj4gU2hvdWxkbid0IHRoaXMgcmV0dXJuIGFuIGVycm9yIGFuZCBiZSBpbXBsZW1lbnRlZCB3
aXRoIHNhbWUgc2VtYW50aWNzIGFzIHRoZQ0KPj4gdHJ5X2NoYXJnZSgpIGZ1bmN0aW9ucyBvZiBv
dGhlciBjb250cm9sbGVycz8NCj4+IEJlbG93IHdpbGwgYWxsb3cgc3RhdHNfdG90YWxfYWxsb2Nh
dGVkIHRvIG92ZXJydW4gbGltaXRzX3RvdGFsX2FsbG9jYXRlZC4NCj4gVGhpcyBpcyBiZWNhdXNl
IEkgYW0gY2hhcmdpbmcgdGhlIGJ1ZmZlciBhdCB0aGUgaW5pdCBvZiB0aGUgYnVmZmVyDQo+IHdo
aWNoIGRvZXMgbm90IGZhaWwgc28gdGhlICJ0cnkiIChkcm1jZ3JwX2JvX2Nhbl9hbGxvY2F0ZSkg
aXMgc2VwYXJhdGUNCj4gYW5kIHBsYWNlZCBlYXJsaWVyIGFuZCBuZWFyZXIgb3RoZXIgY29uZGl0
aW9uIHdoZXJlIGdlbSBvYmplY3QNCj4gYWxsb2NhdGlvbiBtYXkgZmFpbC4gIEluIG90aGVyIHdv
cmRzLCB0aGVyZSBhcmUgbXVsdGlwbGUgcG9zc2liaWxpdGllcw0KPiBmb3Igd2hpY2ggZ2VtIGFs
bG9jYXRpb24gbWF5IGZhaWwgKGNncm91cCBsaW1pdCBiZWluZyBvbmUgb2YgdGhlbSkgYW5kDQo+
IHNhdGlzZnlpbmcgY2dyb3VwIGxpbWl0IGRvZXMgbm90IG1lYW4gYSBjaGFyZ2UgaXMgbmVlZGVk
LiAgSSBjYW4NCj4gY2VydGFpbmx5IGNvbWJpbmUgdGhlIHR3byBmdW5jdGlvbnMgdG8gaGF2ZSBh
biBhZGRpdGlvbmFsIHRyeV9jaGFyZ2UNCj4gc2VtYW50aWMgYXMgd2VsbCBpZiB0aGF0IGlzIHJl
YWxseSBuZWVkZWQuDQo+DQo+IFJlZ2FyZHMsDQo+IEtlbm55DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
