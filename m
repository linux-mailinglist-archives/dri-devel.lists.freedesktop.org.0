Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E224E869
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8422D6E8AA;
	Fri, 21 Jun 2019 13:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720062.outbound.protection.outlook.com [40.107.72.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6B6E440;
 Fri, 21 Jun 2019 13:00:18 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1609.namprd12.prod.outlook.com (10.172.40.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 21 Jun 2019 13:00:17 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 13:00:17 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAIAAIOaAgAAEQoCAAALHAIAADKCAgAADNICAAAYrgIAAA7EAgAAOdoCAAAQ0AIAACYOAgAADcQA=
Date: Fri, 21 Jun 2019 13:00:17 +0000
Message-ID: <7d6f5ea5-bf36-3a68-ef1e-2d1b5d12178e@amd.com>
References: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
 <338bb519-05f1-cb76-d965-81237f432937@amd.com>
 <20190621115845.GC21486@arch-x1c3>
 <76158d1f-676d-2afa-244b-934967a9cb75@amd.com>
 <20190621124751.GE21486@arch-x1c3>
In-Reply-To: <20190621124751.GE21486@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1650a98-1cb8-4810-36b4-08d6f648684e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1609; 
x-ms-traffictypediagnostic: DM5PR12MB1609:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB160987256071F2333809FD6083E70@DM5PR12MB1609.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(39860400002)(396003)(136003)(189003)(199004)(66446008)(25786009)(54906003)(6116002)(5660300002)(65806001)(2616005)(7736002)(14454004)(76176011)(966005)(65956001)(305945005)(11346002)(446003)(52116002)(476003)(478600001)(72206003)(99286004)(6246003)(66556008)(66476007)(6916009)(66946007)(64756008)(58126008)(65826007)(46003)(36756003)(316002)(73956011)(2906002)(31696002)(86362001)(64126003)(4326008)(53936002)(71190400001)(256004)(6436002)(8936002)(6306002)(6512007)(386003)(186003)(68736007)(6506007)(71200400001)(102836004)(31686004)(486006)(81166006)(81156014)(6486002)(8676002)(14444005)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1609;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dZsphvonWIKZRemFFnaovmFASkEH1zustelXbswHGKosIGVwVewjb+3hw8gSVf5tJK5sAl4yxxbQ3ByHUS+iooSdfMxaqYVYVNuU5Rhi6vLstJh9G8O9yDJf9ISh3CP8rS8pVTMVgg4br89WQvaKnpzsWHp80SaTiMPQSm/ArlY2+sfIDURvqO80ZLB0kJIcNL3CHBzOxDWGqUoUXQSiTDkN62sqUdN3EKKniv5zaBstrvbZHYdAYxefiVr3+dkZNDyqwZgiIj/9xiPOucTguWVreERPiGY3P3IYcDiVO4Z2EyDYCqpTYJ/988yhYEMzkQpl7Pk0jaGJ/QPT2pXynA1IWjSAULID4bfjGvxzsAt28sRkoXroFoLcir7kqFy3gsKfS4cDZiNk2MZ+75UNHSZS+LOfbHYGCqauOr57gko=
Content-ID: <F03A92CBCBB71042A9221CB7D0468866@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1650a98-1cb8-4810-36b4-08d6f648684e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 13:00:17.0701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1609
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guYHnScRtPxj1f5x0eQtPdJCtRJQ9tG5jekKvYjpeuE=;
 b=rWzrwyonWMTr5L5uaIrMPhlwJ2Z1/s3uf/oDU6DeWSh/JKFFATR7HqLm93DRBhq1qORgqS4njt817O2VWlX+UNSXue3pB3J3DIFSnKM5JXsds1SfBjjFSwmWp64CBL5QoHmUNeGnDuLjyhsN2UTV7AU9H5vvkHPJlVhXYVdMqIA=
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

QW0gMjEuMDYuMTkgdW0gMTQ6NDcgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDYv
MjEsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjEuMDYuMTkgdW0gMTM6NTggc2No
cmllYiBFbWlsIFZlbGlrb3Y6DQo+Pj4gT24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4g
d3JvdGU6DQo+Pj4+IEFtIDIxLjA2LjE5IHVtIDEyOjUzIHNjaHJpZWIgRW1pbCBWZWxpa292Og0K
Pj4+Pj4gT24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4+Pj4gW1NO
SVBdDQo+Pj4+Pj4gV2VsbCBwYXJ0aWFsbHkuIFRoYXQgUkFEViBicm9rZSBpcyB1bmZvcnR1bmF0
ZSwgYnV0IHdlIGhhdmUgZG9uZSBzbyBtYW55DQo+Pj4+Pj4gY3VzdG9taXplZCB1c2Vyc3BhY2Ug
c3R1ZmYgYm90aCBiYXNlZCBvbiBNZXNhL0REWCBhcyB3ZWxsIGFzIGNsb3NlZA0KPj4+Pj4+IHNv
dXJjZSBjb21wb25lbnRzIHRoYXQgaXQgaXMganVzdCBoaWdobHkgbGlrZWx5IHRoYXQgd2Ugd291
bGQgYnJlYWsNCj4+Pj4+PiBzb21ldGhpbmcgZWxzZSBhcyB3ZWxsLg0KPj4+Pj4+DQo+Pj4+PiBB
cyBhbiBlbmdpbmVlciBJIGxpa2UgdG8gd29yayB3aXRoIHRhbmdpYmxlcy4gVGhlIGhpZ2hseSBs
aWtlbHkgcGFydCBpcw0KPj4+Pj4gcHJvYmFibGUsIGJ1dCBhcyBtZW50aW9uZWQgbXVsdGlwbGUg
dGltZXMgdGhlIHNlcmllcyBhbGxvd3MgZm9yIGEgX2RlYWRfDQo+Pj4+PiB0cml2aWFsIHdheSB0
byBhZGRyZXNzIGFueSBzdWNoIHByb2JsZW1zLg0KPj4+PiBXZWxsIHRvIGNsYXJpZnkgbXkgY29u
Y2VybiBpcyB0aGF0IHRoaXMgd29uJ3QgYmUgc28gdHJpdmlhbC4NCj4+Pj4NCj4+Pj4gWW91IGlt
cGxlbWVudGVkIG9uIHdvcmthcm91bmQgZm9yIG9uZSBzcGVjaWZpYyBjYXNlIGFuZCBpdCBpcyBw
ZXJmZWN0bHkNCj4+Pj4gcG9zc2libGUgdGhhdCBmb3Igb3RoZXIgY2FzZXMgd2Ugd291bGQgaGF2
ZSB0byBjb21wbGV0ZWx5IHJldmVydCB0aGUNCj4+Pj4gcmVtb3ZhbCBvZiBEUk1fQVVUSC4NCj4+
Pj4NCj4+PiBJIHdvdWxkIGVuY291cmFnZSB5b3UgdG8gdGFrZSBhIGNsb3NlciBsb29rIGF0IG15
IHBhdGNoIGFuZCBwb2ludCBvdXQNCj4+PiBob3cgcGFyY2ljdWxhciBjYXNlcyBjYW5ub3QgYmUg
aGFuZGxlZC4NCj4+IFdlbGwgdGhlIGxhc3QgdGltZSBJIGxvb2tlZCBpdCBvbmx5IGJsb2NrZWQg
dGhlIGZpcnN0IGNhbGwgdG8gdGhlIElPQ1RMLg0KPj4NCj4gSG1tIGludGVyZXN0aW5nLCB5b3Un
cmUgcmVwbGllZCB0byBteSBwYXRjaCB3aXRob3V0IGV2ZW4gcmVhZGluZyBpdCA6Jy0oDQoNCldl
bGwgSSd2ZSBOQUtlZCB0aGUgc2VyaWVzIGJlY2F1c2Ugb2YgdGhlIGV4cG9zdXJlIG9mIHRoZSBy
ZW5kZXIgbm9kZSANCmZ1bmN0aW9uYWxpdHkNCg0KPiBDYW4geW91IHBsZWFzZSBnaXZlIGl0IGEg
Y2xvc2UgbG9vayBhbmQgcmVwbHkgaW5saW5lPw0KPg0KPiBbMV0gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktTWF5LzIxOTIzOC5odG1sDQoNClNv
IHRoZSB3b3JrYXJvdW5kIG5vIGxvbmdlciBqdXN0IGJsb2NrcyB0aGUgZmlyc3QgSU9DVEwuDQoN
CkJ1dCB0aGVuIHRoZSBxdWVzdGlvbiBpcyB3aHkgZG9uJ3QgeW91IGp1c3Qga2VlcCB0aGUgRFJN
X0FVVEggZmxhZyANCmluc3RlYWQgb2YgYWRkaW5nIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgd2l0
aCBhIG5ldyBvbmU/DQoNCj4+PiAgIEZyb20geW91ciBleHBlcmllbnNlLCBkbyB1c2VyLXNwYWNl
IGRldmVsb3BlcnMgY2FyZSBhYm91dCBkb2luZyAob3INCj4+PiBnZW5lcmFsbHkgZG8pIHRoZSBy
aWdodCB0aGluZz8NCj4+IE5vLCBub3QgYXQgYWxsLiBFeGNlcHQgZm9yIE1hcmVrIGFuZCBNaWNo
ZWwgdGhleSBqdXN0IHRha2Ugd2hhdCB3b3Jrcw0KPj4gYW5kIGV2ZW4gTWFyZWsgaXMgb2Z0ZW4g
c2hvcnQtY3V0dGluZyBvbiB0aGlzLg0KPj4NCj4gSW50ZXJlc3RpbmcsIGd1ZXNzIEkgc2hvdWxk
IGhhdmUgYXNrZWQgdGhpcyBxdWVzdGlvbiBmcm9tIHRoZSBzdGFydC4NCg0KV2VsbCBzb3VuZHMg
bGlrZSB5b3UgZG9uJ3QgaGF2ZSB0byB3b3JrIHdpdGggYSBjbG9zZWQgc291cmNlIGRyaXZlciAN
CnRlYW0uIEJ1dCBhcyBJIHNhaWQgSSBob25lc3RseSB3b3VsZCBkbyB0aGUgc2FtZSBhcyB1c2Vy
IHNwYWNlIGRldmVsb3Blci4NCg0KSSBtZWFuIGl0J3MgcmVhbGx5IGEgYnVuY2ggb2YgbW9yZSBj
b2RlIHRvIG1haW50YWluLCBhbmQgZ2V0dGluZyByaWQgb2YgDQpjb2RlIGlzIGFsd2F5cyBsZXNz
IHdvcmsgaW4gdGhlIGxvbmcgdGVybSB0aGVuIGtlZXBpbmcgaXQuDQoNClRoYXQga2VybmVsIGRl
dmVsb3BlcnMgc2NyZWFtOiBObyBubywgcGxlYXNlIGRvbid0IGRvIHRoYXQgd2Ugd2FudCB0byAN
CmtlZXAgdXNpbmcgaXQgaXMgY29tcGxldGVseSBpcnJlbGV2YW50IGZvciB0aGlzLg0KDQpDaHJp
c3RpYW4uDQoNCj4NCj4gVGhhbmtzDQo+IEVtaWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
