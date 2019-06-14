Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089C45D35
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FAC89294;
	Fri, 14 Jun 2019 12:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBF389294;
 Fri, 14 Jun 2019 12:55:36 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1755.namprd12.prod.outlook.com (10.175.85.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 14 Jun 2019 12:55:35 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.013; Fri, 14 Jun 2019
 12:55:35 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YA=
Date: Fri, 14 Jun 2019 12:55:34 +0000
Message-ID: <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
In-Reply-To: <20190614120927.GA32412@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0232.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::28) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9d8e0fb-d17f-4181-bd86-08d6f0c7973c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1755; 
x-ms-traffictypediagnostic: DM5PR12MB1755:
x-microsoft-antispam-prvs: <DM5PR12MB1755E7688E2A8741A27CAF9C83EE0@DM5PR12MB1755.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(366004)(376002)(39860400002)(189003)(199004)(46003)(6116002)(102836004)(229853002)(6436002)(316002)(99286004)(58126008)(256004)(14444005)(71190400001)(31696002)(71200400001)(186003)(6506007)(386003)(11346002)(446003)(476003)(2616005)(68736007)(86362001)(5660300002)(486006)(6486002)(65956001)(65806001)(2501003)(6512007)(65826007)(73956011)(66946007)(25786009)(36756003)(14454004)(52116002)(7736002)(305945005)(66476007)(76176011)(64126003)(4326008)(53936002)(2906002)(54906003)(110136005)(8936002)(6246003)(31686004)(66446008)(64756008)(66556008)(8676002)(561944003)(72206003)(81156014)(81166006)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1755;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mrfXt82Jeo0d/1C8DYGGFQzPgLChSw5ljhl5UKP6w/moD3uclvL37URnXaepo84IJWP3n7YdC84iiFVtXnsh5yXoOi8lk5Sh+xhD6+ES4szuRl3Gno9eAfb0ng6hKZLqC7hEJWb5dxtxqW/A0/SutKGkGy6sqY5CNagWYMijwbbMqqcxgA/OxaSTSv1Ngn5p49kcOboSYqK57Nria6/cTDw8FMSvNRDRz2O6TiY7iL0e7MglCQULxGMdgdL1INgBK1D/r+SH898wDVsQKZxdnS+wWd3sniICHEcuZNbmhfRBxisebKwtTsCpftbXBU2tAKFweOXks8DpTiPmkyKYq+5iQ+rBZsuEzmaFR7kyk+V0B313hnWPPzxQMaM9KrLtv5MnQaCr7wrUJWSsEYDaVeingJ3If0Ad5CVsLV+o+Vk=
Content-ID: <C5B6A6E61C7FBA42B1DD89C547EBC258@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d8e0fb-d17f-4181-bd86-08d6f0c7973c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 12:55:34.9875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1755
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyvTOEfdmyKuqAoO7gydoWP6uwz0QfIWRN4yJrvW8j0=;
 b=rZ/Guj/CkzQ0V85gZSAkJ+lzqKZeqsf7MehOKfA0bp3s9hz0Stx1Vx94cAaUGLsHM6ISzVci30TCZ+wBmd9u72PSlpz/ZBWgV7xrEjT3ZqiAxea3Qpje0ueFyvE9a7Fh828LivF/+367ZYZbYJdtbPguDBUgvEqpu3hkWblC2Yw=
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
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDYuMTkgdW0gMTQ6MDkgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDUv
MjcsIEVtaWwgVmVsaWtvdiB3cm90ZToNCj4gW1NOSVBdDQo+IEhpIENocmlzdGlhbiwNCj4NCj4N
Cj4gSW4gdGhlIGZvbGxvd2luZywgSSB3b3VsZCBsaWtlIHRvIHN1bW1hcmlzZSBhbmQgZW1waGFz
aXplIHRoZSBuZWVkIGZvcg0KPiBEUk1fQVVUSCByZW1vdmFsLiBJIHdvdWxkIGtpbmRseSBhc2sg
eW91IHRvIHNwZW5kIGEgY291cGxlIG9mIG1pbnV0ZXMNCj4gZXh0cmEgcmVhZGluZyBpdC4NCj4N
Cj4NCj4gVG9kYXkgRFJNIGRyaXZlcnMqIGRvIG5vdCBtYWtlIGFueSBkaXN0aW5jdGlvbiBiZXR3
ZWVuIHByaW1hcnkgYW5kDQo+IHJlbmRlciBub2RlIGNsaWVudHMuDQoNClRoYXQgaXMgYWN0dWFs
bHkgbm90IDEwMCUgY29ycmVjdC4gV2UgaGF2ZSBhIHNwZWNpYWwgY2FzZSB3aGVyZSBhIERSTSAN
Cm1hc3RlciBpcyBhbGxvd2VkIHRvIGNoYW5nZSB0aGUgcHJpb3JpdHkgb2YgcmVuZGVyIG5vZGUg
Y2xpZW50cy4NCg0KPiBUaHVzIGZvciBhIHJlbmRlciBjYXBhYmxlIGRyaXZlciwgYW55IHByZW1p
c2Ugb2YNCj4gc2VwYXJhdGlvbiwgc2VjdXJpdHkgb3Igb3RoZXJ3aXNlIGltcG9zZWQgdmlhIERS
TV9BVVRIIGlzIGEgZmFsbGFjeS4NCg0KWWVhaCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBq
dXN0IGRvbid0IHRoaW5rIHRoYXQgcmVtb3ZpbmcgRFJNX0FVVEggDQpub3cgaXMgdGhlIHJpZ2h0
IGRpcmVjdGlvbiB0byB0YWtlLg0KDQo+IENvbnNpZGVyaW5nIHRoZSBleGFtcGxlcyBvZiBmbGFr
eSBvciBvdXRyaWdodCBtaXNzaW5nIGRybUF1dGggaW4gcHJpbWUNCj4gb3Blbi1zb3VyY2UgcHJv
amVjdHMgKG1lc2EsIGttc2N1YmUsIGxpYnZhKSB3ZSBjYW4gcmVhc29uYWJseSBhc3N1bWUNCj4g
b3RoZXIgcHJvamVjdHMgZXhiaWJpdCB0aGUgc2FtZSBwcm9ibGVtLg0KPg0KPiBGb3IgdGhlc2Ug
YW5kL29yIG90aGVyIHJlYXNvbnMsIHR3byBEUk0gZHJpdmVycyBoYXZlIGRyb3BwZWQgRFJNX0FV
VEgNCj4gc2luY2UgZGF5IG9uZS4NCj4NCj4gU2luY2Ugd2UgYXJlIGludGVyZXN0ZWQgaW4gcHJv
dmlkaW5nIGNvbnNpc3RlbnQgYW5kIHByZWRpY3RhYmxlDQo+IGJlaGF2aW91ciB0byB1c2VyLXNw
YWNlLCBkcm9wcGluZyBEUk1fQVVUSCBzZWVtcyB0byBiZSB0aGUgbW9zdA0KPiBlZmZlY3RpdmUg
d2F5IGZvcndhcmQuDQoNCldlbGwgYW5kIHdoYXQgZG8geW91IGRvIHdpdGggZHJpdmVycyB3aGlj
aCBkb2Vzbid0IGltcGxlbWVudCByZW5kZXIgbm9kZXM/DQoNCj4gT2YgY291cnNlLCBJJ2QgYmUg
bW9yZSB0aGFuIGhhcHB5IHRvIGhlYXIgZm9yIGFueSBvdGhlciB3YXkgdG8gYWNoaWV2ZQ0KPiB0
aGUgZ29hbCBvdXRsaW5lZC4NCj4NCj4gQmFzZWQgb24gdGhlIHNlcmllcywgb3RoZXIgbWFpbnRh
aW5lcnMgYWdyZWUgd2l0aCB0aGUgaWRlYS9nb2FsIGhlcmUuDQo+IEFtZGdwdSBub3QgZm9sbG93
aW5nIHRoZSBzYW1lIHBhdHRlcm4gd291bGQgY29tcHJvbWlzZSBwcmVkaWN0YWJpbGl0eQ0KPiBh
Y3Jvc3MgZHJpdmVycyBhbmQgY29tcGxpY2F0ZSB1c2Vyc3BhY2UsIHNvIEkgd291bGQga2luZGx5
IGFzayB5b3UgdG8NCj4gcmVjb25zaWRlci4NCj4NCj4gQWx0ZXJuYXRpdmVseSwgSSBzZWUgdHdv
IHdheXMgdG8gc3BlY2lhbCBjYXNlOg0KPiAgIC0gTmV3IGZsYWcgYW5ub3RhdGluZyBhbWRncHUv
cmFkZW9uIC0gYWtpbiB0byB0aGUgb25lIHByb3Bvc2VkIGVhcmxpZXINCj4gICAtIENoZWNrIGZv
ciBhbWRncHUvcmFkZW9uIGluIGNvcmUgRFJNDQoNCkkgcGVyZmVjdGx5IGFncmVlIHRoYXQgSSBk
b24ndCB3YW50IGFueSBzcGVjaWFsIGhhbmRsaW5nIGZvciBhbWRncHUvcmFkZW9uLg0KDQpNeSBr
ZXkgcG9pbnQgaXMgdGhhdCB3aXRoIERSTV9BVVRIIHdlIGNyZWF0ZWQgYW4gYXV0aG9yaXphdGlv
biBhbmQgDQphdXRoZW50aWNhdGlvbiBtZXNzIGluIERSTSB3aGljaCBpcyBmdW5jdGlvbmFsaXR5
IHdoaWNoIGRvZXNuJ3QgYmVsb25nIA0KaW50byB0aGUgRFJNIHN1YnN5c3RlbSBpbiB0aGUgZmly
c3QgcGxhY2UuDQoNCj4gTm93IG9uIHlvdXIgcGFpbiBwb2ludCAtIG5vdCBhbGxvd2luZyByZW5k
ZXIgaW9jdHMgdmlhIHRoZSBwcmltYXJ5IG5vZGUsDQo+IGFuZCBob3cgdGhpcyBwYXRjaCBjb3Vs
ZCBtYWtlIGl0IGhhcmRlciB0byBhY2hpZXZlIHRoYXQgZ29hbC4NCj4NCj4gV2hpbGUgSSBsb3Zl
IHRoZSBpZGVhLCB0aGVyZSBhcmUgbnVtYmVyIG9mIG9ic3RhY2xlcyB0aGF0IHByZXZlbnQgdXMN
Cj4gZnJvbSBkb2luZyBzbyBhdCB0aGlzIHRpbWU6DQo+ICAgLSBFbnN1cmluZyBib3RoIG9sZCBh
bmQgbmV3IHVzZXJzcGFjZSBkb2VzIG5vdCByZWdyZXNzDQoNClllYWgsIGFncmVlIHRvdGFsbHku
IFRoYXQncyB3aHkgSSBzYWlkIHdlIHNob3VsZCBwcm9iYWJseSBzdGFydCBkb2luZyANCnRoaXMg
Zm9yIG9ubHkgZm9yIHVwY29taW5nIGhhcmR3YXJlIGdlbmVyYXRpb25zLg0KDQo+ICAgLSBEcml2
ZXJzIChRWEwsIG90aGVycz8pIGRvIG5vdCBleHBvc2UgYSByZW5kZXIgbm9kZQ0KDQpXZWxsIGlz
bid0IHRoYXQgaXMgYSByYXRoZXIgYmlnIHByb2JsZW0gZm9yIHRoZSByZW1vdmFsIG9mIERSTV9B
VVRIIGluIA0KZ2VuZXJhbD8NCg0KRS5nLiBhdCBsZWFzdCBRWEwgd291bGQgdGhlbiBleHBvc2Ug
ZnVuY3Rpb25hbGl0eSBvbiB0aGUgcHJpbWFyeSBub2RlIA0Kd2l0aG91dCBhdXRoZW50aWNhdGlv
bi4NCg0KPiAgIC0gV2Ugd2FudCB0byBhdm9pZCBkcml2ZXIgc3BlY2lmaWMgYmVoYXZpb3VyDQo+
DQo+IFRoZSBvbmx5IHdheSBmb3J3YXJkIHRoYXQgSSBjYW4gc2VlIGlzOg0KPiAgIC0gQWRkcmVz
cyBRWEwvb3RoZXJzIHRvIGV4cG9zZSByZW5kZXIgbm9kZXMNCj4gICAtIEFkZCBhIEtjb25maWcg
dG9nZ2xlIHRvIGRpc2FibGUgIUtNUyBpb2N0bHMgdmlhIHRoZSBwcmltYXJ5IG5vZGUNCj4gICAt
IEp1bXAtc3RhcnQgXl4gd2l0aCBkaXN0cmlidXRpb24gWA0KPiAgIC0gRml4IHVzZXItc3BhY2Ug
ZmFsbG91dHMNCj4gICAtIFggbW9udGhzIGRvd24gdGhlIGxpbmUsIGZsaXAgdGhlIEtjb25maWcN
Cj4gICAtIEluIGNhc2Ugb2YgcmVncmVzc2lvbnMgLSByZXZlcnQgdGhlIEtDb25maWcsIGdvdG8g
Rml4IHVzZXItc3BhY2UuLi4NCg0KV2VsbCB0aGF0IGF0IGxlYXN0IHNvdW5kcyBsaWtlIGEgcGxh
biA6KSBMZXQncyB0byB0aGlzIQ0KDQo+IFRoYXQgc2FpZCwgdGhlIHByb3Bvc2FsIHdpbGwgbm90
IGNvbmZsaWN0IHdpdGggdGhlIERSTV9BVVRIIHJlbW92YWwuIElmDQo+IGFueXRoaW5nIGl0IGlz
IHN0ZXAgMC41IG9mIHRoZSBncmFuZCBtYXN0ZXIgcGxhbi4NCg0KVGhhdCdzIHRoZSBwb2ludCBJ
IHN0cm9uZ2x5IGRpc2FncmVlIG9uLg0KDQpCeSBsb3dlcmluZyB0aGUgRFJNX0FVVEggcmVzdHJp
Y3Rpb24geW91IGFyZSBlbmNvdXJhZ2luZyB1c2Vyc3BhY2UgdG8gDQp1c2UgdGhlIHNob3J0Y3V0
IGFuZCB1c2UgdGhlIHByaW1hcnkgbm9kZSBmb3IgcmVuZGVyaW5nIGluc3RlYWQgb2YgDQpmaXhp
bmcgdGhlIGNvZGUgYW5kIHVzaW5nIHRoZSByZW5kZXIgbm9kZS4NCg0KU28gYXQgdGhlIGVuZCBv
ZiB0aGUgZGF5IHVzZXJzcGFjZSB3aWxsIG1vc3QgbGlrZWx5IGNvbXBsZXRlbHkgZHJvcCANCnN1
cHBvcnQgZm9yIHRoZSByZW5kZXIgbm9kZSwgc2ltcGx5IGZvciB0aGUgcmVhc29uIHRoYXQgaXQg
YmVjYW1lIA0Kc3VwZXJmbHVvdXMuIFlvdSBjYW4ganVzdCBvcGVuIHVwIHRoZSBwcmltYXJ5IG5v
ZGUgYW5kIGdldCB0aGUgc2FtZSANCmZ1bmN0aW9uYWxpdHkuDQoNCkkgYWJzb2x1dGVseSBjYW4n
dCB1bmRlcnN0YW5kIGhvdyB5b3UgY2FuIGFyZ3VlIHRoYXQgdGhpcyB3b24ndCBtYWtlIGl0IA0K
aGFyZGVyIHRvIGNsZWFubHkgc2VwYXJhdGUgcmVuZGVyaW5nIGFuZCBwcmltYXJ5IG5vZGUgZnVu
Y3Rpb25hbGl0eS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPg0KPiBUbDtEcjogUmVt
b3ZpbmcgRFJNX0FVVEggaXMgb3J0aG9nb25hbCB0byBub3QgYWxsb3dpbmcgcmVuZGVyIGlvY3Rz
IHZpYQ0KPiB0aGUgcHJpbWFyeSBub2RlLiBIZXJlJ3MgYW4gaWRlYSBob3cgdG8gYWNoaWV2ZSB0
aGUgbGF0dGVyLg0KPg0KPg0KPiBUaGFua3MNCj4gRW1pbA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
