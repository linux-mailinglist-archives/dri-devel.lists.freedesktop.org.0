Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D768F317
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 11:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA82888EF3;
	Tue, 30 Apr 2019 09:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E2988EF3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 09:35:36 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2488.namprd12.prod.outlook.com (52.132.141.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 09:35:33 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1835.010; Tue, 30 Apr
 2019 09:35:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Thread-Topic: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
Thread-Index: AQHU/pojWq8imvWZyUydqtyEboEK56ZTjr6AgADg3NuAAANEAA==
Date: Tue, 30 Apr 2019 09:35:33 +0000
Message-ID: <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
 <20190430092327.GA13757@ravnborg.org>
In-Reply-To: <20190430092327.GA13757@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0402CA0017.eurprd04.prod.outlook.com
 (2603:10a6:203:90::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a821454-2eca-4dc6-0345-08d6cd4f30dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2488; 
x-ms-traffictypediagnostic: DM5PR12MB2488:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR12MB24880369350CDD56C4BCF4D7833A0@DM5PR12MB2488.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(366004)(39860400002)(136003)(51914003)(199004)(189003)(6436002)(65806001)(5660300002)(65956001)(99286004)(81166006)(229853002)(97736004)(8676002)(81156014)(31696002)(6512007)(66556008)(316002)(52116002)(58126008)(6486002)(68736007)(8936002)(110136005)(76176011)(6116002)(86362001)(66476007)(66446008)(64756008)(54906003)(73956011)(66946007)(102836004)(386003)(93886005)(53936002)(6506007)(186003)(71190400001)(2906002)(7736002)(305945005)(4326008)(486006)(7416002)(65826007)(256004)(14444005)(64126003)(31686004)(478600001)(72206003)(2616005)(446003)(46003)(11346002)(6246003)(71200400001)(25786009)(14454004)(476003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2488;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C2xc1/Q2y2iE0UJfDSS4mVspyxbSdS0Xebn2Y9pFvw+fXf+BlbE1ueBW3ID+fHT8DFLUYgrvxqWVRx/jTMcPgP2/xqi91TDiJCt5Hd0L6uVLhAZxFZxwZGTyGBT2Ix9CrqPW6DBHcwfGVx0NIqiTu7O4etJfUPfIirWlfyiM59CIHbfSMkd5ucvlaqdmGjsfW52snLa51UOiRDMl2qlqgaB+L3v/OFiSFVwr0a4q1vOoEryKJgaiv2Ox+/+NiqVfRbVDIhKZrtyfTbeXPOxLQlo9BPnjsJCPigdmn2ZR4ZXPOdzOkX65dVJQ6m9/o0NBmDnaOOsqzbMcTpPHsw3ZuEdmMPqkhXHhbcWLZN3+0MWbAn2j9ghkjkmDvaW/vQfgAhpU/Ca7149lJg0RRYGBPNaTXIQBJXSvJrfNcM1vk0k=
Content-ID: <FFF87B914E479B42AFD5434C88750B98@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a821454-2eca-4dc6-0345-08d6cd4f30dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 09:35:33.1069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2488
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cATgUx86Z/EC0vDHwPkl+ucT41YI9hKO0qZkRTAJ38=;
 b=tX+2BLP3Oi6JqGYQlMlL9PtchdU395nES7dUXi/8UdC7ARmQqOibFGvnz2fpjprn5IMIY37Q5SWATGJGpKMZn020Sy2xFiVb+XeAN1+Ff27pfg0Y5CFq8W8b1Vu+GwJTlV7R0X/x/QPiaZ3GZW30ycX9TDujhNOFGf0UVgLkWJA=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>, "Zhang,
 Jerry" <Jerry.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTE6MjMgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IFtDQVVUSU9OOiBF
eHRlcm5hbCBFbWFpbF0NCj4NCj4gSGkgVGhvbWFzLg0KPg0KPj4+PiArDQo+Pj4+ICsvKioNCj4+
Pj4gKyAqIFJldHVybnMgdGhlIGNvbnRhaW5lciBvZiB0eXBlICZzdHJ1Y3QgZHJtX2dlbV92cmFt
X29iamVjdA0KPj4+PiArICogZm9yIGZpZWxkIGJvLg0KPj4+PiArICogQGJvOiAgICAgICAgICAg
dGhlIFZSQU0gYnVmZmVyIG9iamVjdA0KPj4+PiArICogUmV0dXJuczogICAgICAgVGhlIGNvbnRh
aW5pbmcgR0VNIFZSQU0gb2JqZWN0DQo+Pj4+ICsgKi8NCj4+Pj4gK3N0YXRpYyBpbmxpbmUgc3Ry
dWN0IGRybV9nZW1fdnJhbV9vYmplY3QqIGRybV9nZW1fdnJhbV9vZl9ibygNCj4+Pj4gKyAgc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykNCj4+Pj4gK3sNCj4+Pj4gKyAgcmV0dXJuIGNvbnRh
aW5lcl9vZihibywgc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QsIGJvKTsNCj4+Pj4gK30NCj4+
PiBJbmRlbnQgZnVubnkuIFVTZSBzYW1lIGluZGVudCBhcyB1c2VkIGluIG90aGVyIHBhcnRzIG9m
IGZpbGUgZm9yDQo+Pj4gZnVuY3Rpb24gYXJndW1lbnRzLg0KPj4gSWYgSSBwdXQgdGhlIGFyZ3Vt
ZW50IG5leHQgdG8gdGhlIGZ1bmN0aW9uJ3MgbmFtZSwgaXQgd2lsbCBleGNlZWQgdGhlDQo+PiA4
MC1jaGFyYWN0ZXIgbGltaXQuIEZyb20gdGhlIGNvZGluZy1zdHlsZSBkb2N1bWVudCwgSSBjb3Vs
ZCBub3Qgc2VlIHdoYXQNCj4+IHRvIGRvIGluIHRoaXMgY2FzZS4gT25lIHNvbHV0aW9uIHdvdWxk
IG1vdmUgdGhlIHJldHVybiB0eXBlIHRvIGENCj4+IHNlcGFyYXRlIGxpbmUgYmVmb3JlIHRoZSBm
dW5jdGlvbiBuYW1lLiBJJ3ZlIG5vdCBzZWVuIHRoYXQgYW55d2hlcmUgaW4NCj4+IHRoZSBzb3Vy
Y2UgY29kZSwgc28gbW92aW5nIHRoZSBhcmd1bWVudCBvbnRvIGEgc2VwYXJhdGUgbGluZSBhbmQN
Cj4+IGluZGVudGluZyBieSBvbmUgdGFiIGFwcGVhcnMgdG8gYmUgdGhlIG5leHQgYmVzdCBzb2x1
dGlvbi4gUGxlYXNlIGxldCBtZQ0KPj4ga25vdyBpZiB0aGVyZSdzIGlmIHRoZXJlJ3MgYSBwcmVm
ZXJyZWQgc3R5bGUgZm9yIGNhc2VzIGxpa2UgdGhpcyBvbmUuDQo+IFJlYWRhYmlsaXR5IGhhcyBJ
TU8gaGlnaGVyIHByaW9yaXR5IHRoYW4gc29tZSBsaW1pdCBvZiA4MCBjaGFycy4NCj4gQW5kIGl0
IGh1cnRzIHJlYWRhYmlsaXR5IChhdCBsZWFzdCBteSBPQ0QpIHdoZW4gc3R5bGUgY2hhbmdlcw0K
PiBhcyB5b3UgZG8gd2l0aCBpbmRlbnQgaGVyZS4gU28gbXkgcGVyc29uYWwgcHJlZmVyZW5jZSBp
cyB0byBmaXgNCj4gaW5kZW50IGFuZCBhY2NlY3QgbG9uZ2VyIGxpbmVzLg0KDQpJbiB0aGlzIGNh
c2UgdGhlIGFuIG9mdGVuIHVzZWQgY29udmVudGlvbiAod2hpY2ggaXMgYWxzbyBraW5kIG9mIA0K
cmVhZGFibGUpIGlzIHRvIGFkZCBhIG5ld2xpbmUgYWZ0ZXIgdGhlIHJldHVybiB2YWx1ZXMsIGJ1
dCBiZWZvcmUgdGhlIA0KZnVuY3Rpb24gbmFtZS4gRS5nLiBzb21ldGhpbmcgbGlrZSB0aGlzOg0K
DQpzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0Kg0KZHJtX2dlbV92cmFt
X29mX2JvKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pDQoNClJlZ2FyZHMsDQpDaHJpc3Rp
YW4uDQoNCj4NCj4gQnV0IHlvdSBhc2sgZm9yIGEgcHJlZmVycmVkIHN0eWxlIC0gd2hpY2ggSSBk
byBub3QgdGhpbmsgd2UgaGF2ZSBpbiB0aGlzDQo+IGNhc2UuIFNvIGl0IGJvaWxzIGRvd24gdG8g
d2hhdCB5b3UgcHJlZmVyLg0KPg0KPiBFbm91Z2ggYmlrZXNoZWRkaW5nLCB0aGFua3MgZm9yIHRo
ZSBxdWljayByZXNwb25zZS4NCj4NCj4gICAgICAgICAgU2FtDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
