Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4D7DD5E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 16:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804946E621;
	Thu,  1 Aug 2019 14:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A436E621
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 14:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU06nwg/z1MQz2y3HUZ4kY+ZugqUnhNuQUOuu/svWNZeMXk7W6aY8IjZlaSAs2iMcQ1dqFWZfBEDu1vVXsLHqM7pl6oEN55rbAe3dLeTPaBeNVXtx1nLOJMnYkCeNAYKKF3S4MBQDRuEL5QmbDz4a0+wkh5gBAuhgO0LrQe7PIEBszwny6nxqHGRt5Ghxiims0+fLvvvNTDxHAhdw1Fv16RtD+SU5Fj4UNWJlXOV/U2oItERtR6vCG4OslXcfYj7rOeMbn/Yl/PsCgyLeOtbnGYcPrnS31Vd6Wbmb8txUNk5tZKoRwQ5lnofB0N9FPY1MJeoBRPoVCk2+ZY7F4GMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kvhn00qGeljK48p9LnRJIGOC7iyyjh7h8zPBQnXRRus=;
 b=LQhIpUXe50AjtFP1QFDYfQ8L4oXxABUtiH734EsZ/KP2uZmXeHSmPmJnAU44WQCI+jSY90/btan9cSrwEY0LV4/+APMH3JhdKMoShj7eXgZqG1MrqTIzAuvJZzisQXI9B8VEIniaZjKMQiMNDk7pXXH40bSav9iDRsJ10R1oJWJCaWA0zghL5NPuamfH2wpG7IWiyx4HxoxJFAhY7xW0itwRWVyo+JLZa5LjgdfZrfcWtk2cScT/85MPLsrMvlVU7aF1tv4Hp3NGJUkSbenJzhcvftQ0rX4/iLqUUzyrsxIQS01sanswrBGUCGRInPPkDXiCwchXxWUtU3Kc8uXOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1419.namprd12.prod.outlook.com (10.168.238.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 14:05:53 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 14:05:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/syncobj: remove boring message
Thread-Topic: [PATCH] drm/syncobj: remove boring message
Thread-Index: AQHVSG9hHRgNav3AAEik5hAw46CxMKbmU5EA
Date: Thu, 1 Aug 2019 14:05:53 +0000
Message-ID: <f67940b4-82a9-987e-1fb7-6960bd93426a@amd.com>
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <9c4f887f-b561-f751-cdcf-d773a9fd7e91@intel.com>
In-Reply-To: <9c4f887f-b561-f751-cdcf-d773a9fd7e91@intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0174.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7002dfce-fa06-42dd-8cc4-08d716895d57
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1419; 
x-ms-traffictypediagnostic: DM5PR12MB1419:
x-microsoft-antispam-prvs: <DM5PR12MB1419EBD4EC52B102C91207B683DE0@DM5PR12MB1419.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(71190400001)(64756008)(65806001)(65956001)(2501003)(86362001)(31686004)(6486002)(58126008)(229853002)(478600001)(6512007)(386003)(65826007)(110136005)(81166006)(6506007)(8936002)(81156014)(53546011)(53936002)(31696002)(6116002)(186003)(8676002)(14454004)(68736007)(2616005)(256004)(14444005)(102836004)(99286004)(305945005)(476003)(76176011)(7736002)(52116002)(486006)(5660300002)(66556008)(25786009)(446003)(316002)(66476007)(2906002)(64126003)(66946007)(46003)(6436002)(11346002)(6246003)(66446008)(36756003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1419;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RrYv7Y3Thr29hRg+spcUS730znQ83SOtO3h6DiINWO6PwVF087zIoQBIBHU7gUb6h/B1eDCZAd7bwQmC18njuWKM9FEQK2RtoD5ZOUitTkIrd1pkyhVU9y6QraXbBngqWj4qjeruPj35ocwAV/nqh5gNs6mz5+qEBWGJHIhuXk9g2ylufHaPiJB/jf2FMKPxYGm1xdttXBtFLyPEpVB0NiKI6rxjpWebb1Bdm3RALvYi1exw/fWQUC0swTzD51uG36OqyFe/+ZfZdiPMoSQMBvQhm+UNtChPfqecxJ/KdbkYRf+tgkUgge+2rBAStz4MaMpP1LKeaPiwibTiGFLB4zC/t/qU3VJoF9wOVyRSMxurnnL9VX7Ck8Cta9lXqZty6WDxAn6PJwB5C1RxzMxawfoeuk0pW32QaXI0naicpVc=
Content-ID: <CF86C4F59003114D93D1DEA81B2045C8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7002dfce-fa06-42dd-8cc4-08d716895d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 14:05:53.0785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kvhn00qGeljK48p9LnRJIGOC7iyyjh7h8zPBQnXRRus=;
 b=cvJnxFQ2iX+5/f020fAEs1PXljNJnGy59FZ6UYdtpzqj1zeeapa804ibi7oPgTcMNi9hbyTeSaD10D4dOFA7LWf3/uJWsYF08SSoHLSG/eWin4BL/KsmZTHJe3s6qXtTuAS3THW+79Rx5LXSEazf9YAkFyw/HFfz8IFn641GRs8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMDguMTkgdW0gMTU6NDUgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoNCj4gSnVzdCBo
YWQgYSBmZXcgZXhjaGFuZ2VzIHdpdGggQ2hyaXMgYWJvdXQgdGhpcy4NCj4gQ2hyaXMgc3VnZ2Vz
dHMgdGhhdCBpZiB3ZSdyZSBhYm91dCB0byBhZGQgYSBwb2ludCB0byB0aGUgdGltZWxpbmUgaW4g
DQo+IGFuIHVub3JkZXJlZCBmYXNoaW9uLCBhY3R1YWxseSBiZXR0ZXIgbm90IGFkZCBpdCBhdCBh
bGwuDQo+DQo+IFdoYXQncyB5b3VyIHRha2Ugb24gdGhpcz8NCg0KVGhhdCBpcyBhIGNsZWFyIE5B
Sy4gU2VlIG5vdCBhZGRpbmcgYSBwb2ludCBhdCBhbGwgbWVhbnMgd2UgbG9zZSBzb21lIA0Kc3lu
Y2hyb25pemF0aW9uIGFuZCB0aGF0IGlzIG5vdCBzb21ldGhpbmcgd2UgY2FuIGRvIGhlcmUuDQoN
CkluIG90aGVyIHdvcmRzIHN5bmNpbmcgdG8gbXVjaCBpZiB1c2Vyc3BhY2UgZG9lcyBzb21ldGhp
bmcgbmFzdHkgaXMgb2sgDQphbmQgZGVmZW5zaXZlIHByb2dyYW1tZWQsIGJ1dCBub3Qgc3luY2lu
ZyBhdCBhbGwgY291bGQgaGF2ZSB1bmZvcmVzZWVuIA0KY29uc2VxdWVuY2VzLg0KDQpBbm90aGVy
IGlkZWEgd291bGQgYmUgdG8gYWRkIHRoZSBmZW5jZSwgYnV0IGFsc28gc2V0IGFuIGVycm9yIGZs
YWcgYW5kIA0KZGVueSBhbnkgZnVydGhlciBzaWduYWxpbmcgb24gdGhhdCBzeW5jb2JqLg0KDQpS
ZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+IEknbSBmaW5lIHdpdGggdGhpcywgYnV0IHJhdGhlciB0
aGFuIGFkZCBhbm90aGVyIHZhcmlhbnQgb2YgYWRkX3BvaW50KCkgDQo+IG1heWJlIHdlIGNoYW5n
ZSBjaGFuZ2UgdGhlIGV4aXN0aW5nLg0KPg0KPiBUaGFua3MsDQo+DQo+IC1MaW9uZWwNCj4NCj4g
T24gMjkvMDcvMjAxOSAxMToyMCwgQ2h1bm1pbmcgWmhvdSB3cm90ZToNCj4+IEl0IGlzIG5vcm1h
bCB0aGF0IGJpbmFyeSBzeW5jb2JqIHJlcGxhY2VzIHRoZSB1bmRlcmx5aW5nIGZlbmNlLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+DQo+
PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMyAtLS0NCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMNCj4+IGluZGV4IDkyOWY3YzY0ZjlhMi4uYmM3ZWMxNjc5ZTRkIDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3luY29iai5jDQo+PiBAQCAtMTUxLDkgKzE1MSw2IEBAIHZvaWQgZHJtX3N5bmNvYmpf
YWRkX3BvaW50KHN0cnVjdCBkcm1fc3luY29iaiANCj4+ICpzeW5jb2JqLA0KPj4gwqDCoMKgwqDC
oCBzcGluX2xvY2soJnN5bmNvYmotPmxvY2spOw0KPj4gwqAgwqDCoMKgwqDCoCBwcmV2ID0gZHJt
X3N5bmNvYmpfZmVuY2VfZ2V0KHN5bmNvYmopOw0KPj4gLcKgwqDCoCAvKiBZb3UgYXJlIGFkZGlu
ZyBhbiB1bm9yZGVyIHBvaW50IHRvIHRpbWVsaW5lLCB3aGljaCBjb3VsZCANCj4+IGNhdXNlIHBh
eWxvYWQgcmV0dXJuZWQgZnJvbSBxdWVyeV9pb2N0bCBpcyAwISAqLw0KPj4gLcKgwqDCoCBpZiAo
cHJldiAmJiBwcmV2LT5zZXFubyA+PSBwb2ludCkNCj4+IC3CoMKgwqDCoMKgwqDCoCBEUk1fRVJS
T1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4iKTsNCj4+
IMKgwqDCoMKgwqAgZG1hX2ZlbmNlX2NoYWluX2luaXQoY2hhaW4sIHByZXYsIGZlbmNlLCBwb2lu
dCk7DQo+PiDCoMKgwqDCoMKgIHJjdV9hc3NpZ25fcG9pbnRlcihzeW5jb2JqLT5mZW5jZSwgJmNo
YWluLT5iYXNlKTsNCj4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
