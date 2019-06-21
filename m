Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EA4E6BC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38FB6E86D;
	Fri, 21 Jun 2019 11:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810073.outbound.protection.outlook.com [40.107.81.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6618A6E86D;
 Fri, 21 Jun 2019 11:07:14 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1594.namprd12.prod.outlook.com (10.172.39.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 11:07:12 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 11:07:12 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAIAAIOaAgAAEQoCAAALHAIAADKCAgAADNICAAAYrgIAAA7EA
Date: Fri, 21 Jun 2019 11:07:12 +0000
Message-ID: <338bb519-05f1-cb76-d965-81237f432937@amd.com>
References: <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
In-Reply-To: <20190621105347.GB21486@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6638f5ca-ebd4-4682-c0a4-08d6f6389c71
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1594; 
x-ms-traffictypediagnostic: DM5PR12MB1594:
x-microsoft-antispam-prvs: <DM5PR12MB1594C203614FCE72E85B0EC783E70@DM5PR12MB1594.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39850400004)(396003)(136003)(346002)(189003)(199004)(86362001)(68736007)(476003)(2906002)(256004)(6436002)(486006)(6116002)(31696002)(6486002)(31686004)(25786009)(229853002)(478600001)(6512007)(64126003)(54906003)(81156014)(8936002)(6916009)(102836004)(99286004)(65806001)(7736002)(53936002)(446003)(305945005)(65956001)(5660300002)(4326008)(186003)(52116002)(8676002)(76176011)(66946007)(46003)(14454004)(72206003)(58126008)(386003)(6506007)(6246003)(81166006)(11346002)(36756003)(71190400001)(316002)(71200400001)(2616005)(66446008)(65826007)(66556008)(66476007)(64756008)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1594;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kSKp0c/N5auoeGhgJVa0VMynoI0o5zX1cIEAhjYq05pS8Yw9mKvaf7rcdrkPMEFrmknPGvPwnU5XlaYFBiqvxPWF5hOyogt93YIVAwi6Dc3gfIh4HNXzYIZSjfPu886ZEz8HHRN7XxQF3uyZpLI2mz5KfXat4n3ZeldOA/5g8H39sYE2OpvgIXtcd0tXDLCkPWfznh09LHk+1S/U9WHC0ZBsvpX3li6Pv6TWBp8HY74gxPDrKplhnvLmkhROAbEUbQKZg5OW9ux6J2U3a3HgBrjMVrHyFihK8Qw3UM0L0LDTZ0PJOLbXZPyt0M1XpkzL67A7/tmMRvGYIQLQf9NGMqtXeaNyauoxj+mIAYYYYivV4Qv1djHWZ7Zt/e4EOBR5p7kH7XxXezrf+HFATLRnMwpapffbioqzPbyZa/OtqLc=
Content-ID: <7ACD6811E1668143A8B2BE929ECD3C9D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6638f5ca-ebd4-4682-c0a4-08d6f6389c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 11:07:12.7749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUYMXm/Crrk+9Gkt/7aRFcB2Kg6s3sOKL4IJhEBvHNM=;
 b=uBau//ILaqEyh4J4yYqaQ29KtMtyeSMrujJ3BwstdCoh+66pEwnIaO1SObwhHAAp3hnmIIrfhUjj8OQsMAR9PNF1ARc8HJiz8zIaYyCao5UZRvgJAwHCECFq6rCJUGQRpKy/kLh1JJPSE9EfIknGewoQY9UeCsITHIMLS2/uE74=
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

QW0gMjEuMDYuMTkgdW0gMTI6NTMgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDYv
MjEsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gW1NOSVBdDQo+PiBXZWxsIHBhcnRpYWxs
eS4gVGhhdCBSQURWIGJyb2tlIGlzIHVuZm9ydHVuYXRlLCBidXQgd2UgaGF2ZSBkb25lIHNvIG1h
bnkNCj4+IGN1c3RvbWl6ZWQgdXNlcnNwYWNlIHN0dWZmIGJvdGggYmFzZWQgb24gTWVzYS9ERFgg
YXMgd2VsbCBhcyBjbG9zZWQNCj4+IHNvdXJjZSBjb21wb25lbnRzIHRoYXQgaXQgaXMganVzdCBo
aWdobHkgbGlrZWx5IHRoYXQgd2Ugd291bGQgYnJlYWsNCj4+IHNvbWV0aGluZyBlbHNlIGFzIHdl
bGwuDQo+Pg0KPiBBcyBhbiBlbmdpbmVlciBJIGxpa2UgdG8gd29yayB3aXRoIHRhbmdpYmxlcy4g
VGhlIGhpZ2hseSBsaWtlbHkgcGFydCBpcw0KPiBwcm9iYWJsZSwgYnV0IGFzIG1lbnRpb25lZCBt
dWx0aXBsZSB0aW1lcyB0aGUgc2VyaWVzIGFsbG93cyBmb3IgYSBfZGVhZF8NCj4gdHJpdmlhbCB3
YXkgdG8gYWRkcmVzcyBhbnkgc3VjaCBwcm9ibGVtcy4NCg0KV2VsbCB0byBjbGFyaWZ5IG15IGNv
bmNlcm4gaXMgdGhhdCB0aGlzIHdvbid0IGJlIHNvIHRyaXZpYWwuDQoNCllvdSBpbXBsZW1lbnRl
ZCBvbiB3b3JrYXJvdW5kIGZvciBvbmUgc3BlY2lmaWMgY2FzZSBhbmQgaXQgaXMgcGVyZmVjdGx5
IA0KcG9zc2libGUgdGhhdCBmb3Igb3RoZXIgY2FzZXMgd2Ugd291bGQgaGF2ZSB0byBjb21wbGV0
ZWx5IHJldmVydCB0aGUgDQpyZW1vdmFsIG9mIERSTV9BVVRILg0KDQo+Pj4gSW4gcGFydGljdWxh
ciwgdGhhdCB1c2VyLXNwYWNlIHdpbGwgInJlbW92ZSIgcmVuZGVyIG5vZGVzLg0KPj4gWWVzLCB0
aGF0IGlzIG15IG1haW4gY29uY2VybiBoZXJlLiBZb3UgYmFzaWNhbGx5IG1ha2UgcmVuZGVyIG5v
ZGVzDQo+PiBzdXBlcmZsdW91c2x5LiBUaGF0IGdpdmVzIHVzZXJzcGFjZSBhbGwgbGVnaXRpbWl6
YXRpb24gdG8gYWxzbyByZW1vdmUNCj4+IHN1cHBvcnQgZm9yIHRoZW0uIFRoYXQgaXMgbm90IHN0
dXBpZCBvciBldmlsIG9yIHdoYXRldmVyLCB1c2Vyc3BhY2UNCj4+IHdvdWxkIGp1c3QgZm9sbG93
IHRoZSBrZXJuZWwgZGVzaWduLg0KPj4NCj4gRG8geW91IGhhdmUgYW4gZXhhbXBsZSBvZiB1c2Vy
c3BhY2UgZG9pbmcgc3VjaCBhbiBleHRyZW1lbHkgc2lsbHkgdGhpbmc/DQo+IEl0IGRvZXMgc2Vl
bSBsaWtlIHN1c3BlY3QgeW91J3JlIGEgY291cGxlIG9mIHN0ZXBzIGJleW9uZCBvdmVyY2F1dGlv
dXMsDQo+IHBlcmhhcHMgcmlnaHRmdWxseSBzby4gTWF5YmUgeW91J3ZlIHNlZW4gc29tZSBjbG9z
ZWQtc291cmNlIHVzZXItc3BhY2UNCj4gZ29pbmcgY3Jhenk/IE9yIGFueSBvdGhlciBwcm9qZWN0
cz8NCg0KVGhlIGtleSBwb2ludCBpcyB0aGF0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzaWxseSBv
ciBzdHJhbmdlIG9yIGNyYXp5IGF0IA0KYWxsLiBTZWUgdGhlIGtlcm5lbCBkZWZpbmVzIHRoZSBp
bnRlcmZhY2UgdXNlcnNwYWNlIGNhbiBhbmQgc2hvdWxkIHVzZS4NCg0KV2hlbiB0aGUga2VybmVs
IGRlZmluZXMgdGhhdCBldmVyeXRoaW5nIHdpbGwgd29yayB3aXRoIHRoZSBwcmltYXJ5IG5vZGUg
DQppdCBpcyBwZXJmZWN0bHkgdmFsaWQgZm9yIHVzZXJzcGFjZSB0byBkcm9wIHN1cHBvcnQgZm9y
IHRoZSByZW5kZXIgbm9kZS4NCg0KSSBtZWFuIHdoeSBzaG91bGQgdGhleSBrZWVwIHRoaXM/IEp1
c3QgYmVjYXVzZSB3ZSB0ZWxsIHRoZW0gbm90IHRvIGRvIHRoaXM/DQoNCj4gSW4gb3RoZXIgd29y
ZHMsIGJlaW5nIGNhdXRpb3VzIGlzIGdyZWF0LCBidXQgd2l0aG91dCByZWZlcmVuY2VzIG9mDQo+
IG1pc3VzZSBpdCdzIHZlcnkgaGFyZCBmb3Igb3RoZXJzIHRvIGRyYXcgdGhlIGZ1bGwgcGljdHVy
ZS4NCj4NCj4+PiBJJ20gcmVhbGx5IHNhZCB0aGF0IGFtZGdwdSBpbnNpc3RzIG9uIHN0YW5kaW5n
IG91dCwgaG9wZSBvbmUgZGF5IGl0IHdpbGwNCj4+PiBjb252ZXJnZS4gWWV0IHNpbmNlIGFsbCBv
dGhlciBtYWludGFpbmVycyBhcmUgb2sgd2l0aCB0aGUgc2VyaWVzLCBJJ2xsDQo+Pj4gc3RhcnQg
bWVyZ2luZyBwYXRjaGVzIGluIGEgZmV3IGhvdXJzLiBJJ20gcmVhbGx5IHNhZCB0aGF0IGFtZGdw
dSB3YW50cw0KPj4+IHRvIHN0YW5kIG91dCwgaG9wZSBpdCB3aWxsIGNvbnZlcmdlIHNvb25lciBy
YXRoZXIgdGhhbiBsYXRlci4NCj4+Pg0KPj4+IENocmlzdGlhbiwgaG93IHdvdWxkIHlvdSBsaWtl
IGFtZGdwdSBoYW5kbGVkIC0gd2l0aCBhIHNlcGFyYXRlIGZsYWcgaW4NCj4+PiB0aGUgZHJpdmVy
IG9yIHNoYWxsIHdlIHNwZWNpYWwgY2FzZSBhbWRncHUgd2l0aGluIGNvcmUgZHJtPw0KPj4gTm8s
IEkgYXNrIHlvdSB0byBwbGVhc2Ugc3RpY2sgYXJvdW5kIERSTV9BVVRIIGZvciBhdCBsZWFzdCBh
bWRncHUgYW5kDQo+PiByYWRlb24uIEFuZCBOT1QgZW5hYmxlIGFueSByZW5kZXIgbm9kZSBmdW5j
dGlvbmFsaXR5IGZvciB0aGVtIG9uIHRoZQ0KPj4gcHJpbWFyeSBub2RlLg0KPj4NCj4gTXkgcXVl
c3Rpb24gaXMgaG93IGRvIHlvdSB3YW50IHRoaXMgaGFuZGxlZDoNCj4gICAtIERSTV9QTEVBU0Vf
Rk9SQ0VfQVVUSCAtIGFkZGVkIHRvIEFNREdQVS9SQURFT04sIG9yDQo+ICAgLSBkcml2ZXJfbmFt
ZSA9PSBhbWRncHUsIGluIGNvcmUgRFJNLg0KDQpJIHdhbnQgdG8ga2VlcCBEUk1fQVVUSCBpbiBh
bWRncHUgYW5kIHJhZGVvbiBmb3IgYXQgbGVhc3QgdGhlIG5leHQgNS0xMCANCnllYXJzLg0KDQpB
dCBsZWFzdCB1bnRpbCB3ZSBoYXZlIGVzdGFibGlzaGVkIHRoYXQgbm9ib2R5IGlzIHVzaW5nIHRo
ZSBwcmltYXJ5IG5vZGUgDQpmb3IgY29tbWFuZCBzdWJtaXNzaW9uIGFueSBtb3JlLiBQbHVzIHNv
bWUgZ3JhY2UgdGltZSB0byBtYWtlIHN1cmUgdGhhdCANCnRoaXMgaGFzIGJlZW4gc3ByZWFkIGVu
b3VnaC4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPg0KPiBUaGFua3MNCj4gRW1pbA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
