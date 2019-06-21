Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7174E102
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F2B6E80A;
	Fri, 21 Jun 2019 07:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810057.outbound.protection.outlook.com [40.107.81.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3912D6E80A;
 Fri, 21 Jun 2019 07:12:17 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1210.namprd12.prod.outlook.com (10.168.237.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Fri, 21 Jun 2019 07:12:14 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 07:12:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAA==
Date: Fri, 21 Jun 2019 07:12:14 +0000
Message-ID: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
In-Reply-To: <20190620163012.GF1896@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::15) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d926e1d-fc39-4039-dfd4-08d6f617c927
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1210; 
x-ms-traffictypediagnostic: DM5PR12MB1210:
x-microsoft-antispam-prvs: <DM5PR12MB12108E21D1B10B09B6719FBD83E70@DM5PR12MB1210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(366004)(136003)(39860400002)(376002)(189003)(199004)(7736002)(65826007)(6486002)(52116002)(6116002)(72206003)(478600001)(229853002)(316002)(66946007)(58126008)(99286004)(6916009)(71200400001)(8676002)(73956011)(81156014)(71190400001)(31696002)(102836004)(305945005)(86362001)(81166006)(76176011)(386003)(186003)(2906002)(68736007)(6506007)(8936002)(54906003)(6436002)(66446008)(65956001)(36756003)(64756008)(65806001)(66476007)(66556008)(53936002)(46003)(14454004)(64126003)(6246003)(6512007)(446003)(486006)(5660300002)(2616005)(476003)(11346002)(31686004)(14444005)(256004)(25786009)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1210;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UDr+FWB0udWPt8AeveguQdV44tMmXULMF20p+qfVYh2gr5DOifr7dQznJ4V4zk6OG9F0S83PaETo/qjzTlndsBBNQmd27tNWX05r22sWkE/3XYpOJyXtCsreaoZfLWJWEcTiavBWA9DMrSVBL6nvO8+P6PjDreQZCLzIeUnceYDwj2sehWmGTF5KtCVf8VgRrWAMK/5G4QdAPyMcBWJ0+14lgrk7H+B17pUkFS2QHEx7fVyORogMqLFTh5dB0C8JMdZM3zfiKlffBh6dXbmCWAB1Mji1UAcfO50K0ha5v93vOHrS0Nm1uw5PGJKS0o392J46JEPZPE/pHlq5e92wTHwpleqeWIsryJknkFTPBxkh1VKvH5eOE/vX9AUW8G6WdSXVa3Txcd8+Jm/mhvGstx3alk7QMyxk/0MNtBnQgtg=
Content-ID: <A6A0C0E69539B74CA253AC64D800030C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d926e1d-fc39-4039-dfd4-08d6f617c927
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 07:12:14.2861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03l/YdDRfAbEbJ0aCFdkRp7HUXk3lWONAom8OxVqUh8=;
 b=U73W/sEGyTp9idjlgs/g25Zc02xWRLyJcFJvWx/KiWy3V7QaL+GfDqMDxFl37B/Tj9qVBB+OU2c1eL4SdAbp1G5TmxrmjpZAn8RqY7oc8/oAUuhVSZueuNHAWk7cZWR3Iya4QnK1JSGL9+uOYzZoC5sC28uKMIjTP7R8ZvxaKxk=
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDYuMTkgdW0gMTg6MzAgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDYv
MTQsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMTQuMDYuMTkgdW0gMTc6NTMgc2No
cmllYiBFbWlsIFZlbGlrb3Y6DQo+Pj4gT24gMjAxOS8wNi8xNCwgS29lbmlnLCBDaHJpc3RpYW4g
d3JvdGU6DQo+Pj4+IEFtIDE0LjA2LjE5IHVtIDE0OjA5IHNjaHJpZWIgRW1pbCBWZWxpa292Og0K
Pj4+Pj4gT24gMjAxOS8wNS8yNywgRW1pbCBWZWxpa292IHdyb3RlOg0KPj4+Pj4gW1NOSVBdDQo+
Pj4+PiBIaSBDaHJpc3RpYW4sDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IEluIHRoZSBmb2xsb3dpbmcs
IEkgd291bGQgbGlrZSB0byBzdW1tYXJpc2UgYW5kIGVtcGhhc2l6ZSB0aGUgbmVlZCBmb3INCj4+
Pj4+IERSTV9BVVRIIHJlbW92YWwuIEkgd291bGQga2luZGx5IGFzayB5b3UgdG8gc3BlbmQgYSBj
b3VwbGUgb2YgbWludXRlcw0KPj4+Pj4gZXh0cmEgcmVhZGluZyBpdC4NCj4+Pj4+DQo+Pj4+Pg0K
Pj4+Pj4gVG9kYXkgRFJNIGRyaXZlcnMqIGRvIG5vdCBtYWtlIGFueSBkaXN0aW5jdGlvbiBiZXR3
ZWVuIHByaW1hcnkgYW5kDQo+Pj4+PiByZW5kZXIgbm9kZSBjbGllbnRzLg0KPj4+PiBUaGF0IGlz
IGFjdHVhbGx5IG5vdCAxMDAlIGNvcnJlY3QuIFdlIGhhdmUgYSBzcGVjaWFsIGNhc2Ugd2hlcmUg
YSBEUk0NCj4+Pj4gbWFzdGVyIGlzIGFsbG93ZWQgdG8gY2hhbmdlIHRoZSBwcmlvcml0eSBvZiBy
ZW5kZXIgbm9kZSBjbGllbnRzLg0KPj4+Pg0KPj4+IENhbiB5b3UgcHJvdmlkZSBhIGxpbms/IEkg
Y2Fubm90IGZpbmQgdGhhdCBjb2RlLg0KPj4gU2VlIGFtZGdwdV9zY2hlZF9pb2N0bCgpLg0KPj4N
Cj4+Pj4+IFRodXMgZm9yIGEgcmVuZGVyIGNhcGFibGUgZHJpdmVyLCBhbnkgcHJlbWlzZSBvZg0K
Pj4+Pj4gc2VwYXJhdGlvbiwgc2VjdXJpdHkgb3Igb3RoZXJ3aXNlIGltcG9zZWQgdmlhIERSTV9B
VVRIIGlzIGEgZmFsbGFjeS4NCj4+Pj4gWWVhaCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBq
dXN0IGRvbid0IHRoaW5rIHRoYXQgcmVtb3ZpbmcgRFJNX0FVVEgNCj4+Pj4gbm93IGlzIHRoZSBy
aWdodCBkaXJlY3Rpb24gdG8gdGFrZS4NCj4+Pj4NCj4+PiBDb3VsZCBoYXZlIGJlZW4gY2xlYXJl
ciAtIEknbSB0YWxraW5nIGFib3V0IERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVw0KPj4+IGlv
Y3Rscy4NCj4+Pg0KPj4+IFRoYXQgYXNpZGUsIGNhbiB5b3UgcHJvcG9zZSBhbiBhbHRlcm5hdGl2
ZSBzb2x1dGlvbiB0aGF0IGFkZHJlc3NlcyB0aGlzDQo+Pj4gYW5kIHRoZSBzZWNvbmQgcG9pbnQg
anVzdCBiZWxvdz8NCj4+IEdpdmUgbWUgYSBmZXcgZGF5cyB0byB3b3JrIG9uIHRoaXMsIGl0J3Mg
YWxyZWFkeSBGcmlkYXkgNnBtIGhlcmUuDQo+Pg0KPiBIaSBDaHJpc3RpYW4sDQo+DQo+IEFueSBw
cm9ncmVzcz8gQXMgbWVudGlvbmVkIGVhcmxpZXIsIEknbSBPSyB3aXRoIHdyaXRpbmcgdGhlIHBh
dGNoZXMgYWx0aG91Z2gNCj4gSSB3b3VsZCBsb3ZlIHRvIGhlYXIgeW91ciBwbGFuLg0KDQpGaXJz
dCBvZiBhbGwgSSB0cmllZCB0byBkaXNhYmxlIERSTSBhdXRoZW50aWNhdGlvbiBjb21wbGV0ZWx5
IHdpdGggYSANCmtlcm5lbCBjb25maWcgb3B0aW9uLiBTdXJwcmlzaW5nbHkgdGhhdCBhY3R1YWxs
eSB3b3JrcyBvdXQgb2YgdGhlIGJveCBhdCANCmxlYXN0IG9uIHRoZSBBTURHUFUgc3RhY2suDQoN
ClRoaXMgZWZmZWN0aXZlbHkgYWxsb3dzIHVzIHRvIGdldCByaWQgb2YgRFJJMiBhbmQgdGhlIHJl
bGF0ZWQgc2VjdXJpdHkgDQpwcm9ibGVtcy4gT25seSB0aGluZyBsZWZ0IGZvciB0aGF0IGlzIHRo
YXQgSSdtIGp1c3Qgbm90IHN1cmUgaG93IHRvIA0Kc2lnbmFsIHRoaXMgdG8gdXNlcnNwYWNlIHNv
IHRoYXQgdGhlIEREWCB3b3VsZG4ndCBhZHZlcnRpc2UgRFJJMiBhdCBhbGwgDQphbnkgbW9yZS4N
Cg0KDQpBcyBhIG5leHQgc3RlcCBJIGxvb2tlZCBpbnRvIGlmIHdlIGNhbiBkaXNhYmxlIHRoZSBj
b21tYW5kIHN1Ym1pc3Npb24gDQpmb3IgRFJNIG1hc3Rlci4gVHVybmVkIG91dCB0aGF0IHRoaXMg
aXMgcmVsYXRpdmVseSBlYXN5IGFzIHdlbGwuDQoNCkFsbCB3ZSBoYXZlIHRvIGRvIGlzIHRvIGZp
eCB0aGUgYnVnIE1pY2hlbCBwb2ludGVkIG91dCBhYm91dCBLTVMgaGFuZGxlcyANCmZvciBkaXNw
bGF5IGFuZCBsZXQgdGhlIEREWCB1c2UgYSByZW5kZXIgbm9kZSBpbnN0ZWFkIG9mIHRoZSBEUk0g
bWFzdGVyIA0KZm9yIEdsYW1vci4gU3RpbGwgbmVlZCB0byBzeW5jIHVwIHdpdGggTWljaGVsIGFu
ZC9vciBNYXJlayB3aGF0cyB0aGUgDQpiZXN0IHdheSBvZiBkb2luZyB0aGlzLg0KDQoNClRoZSBs
YXN0IHN0ZXAgKGFuZCB0aGF0J3Mgd2hhdCBJIGhhdmVuJ3QgdHJpZWQgeWV0KSB3b3VsZCBiZSB0
byBkaXNhYmxlIA0KRFJNIGF1dGhlbnRpY2F0aW9uIGZvciBOYXZpIGV2ZW4gd2hlbiBpdCBpcyBz
dGlsbCBjb21waWxlZCBpbnRvIHRoZSANCmtlcm5lbC4gQnV0IHRoYXQgaXMgbW9yZSBvciBsZXNz
IGp1c3QgYSB0eXBpbmcgZXhlcmNpc2UuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4g
VGhhbmtzDQo+IEVtaWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
