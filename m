Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F62273F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 02:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970D689D7C;
	Tue, 21 Jul 2020 00:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BBF89D7C;
 Tue, 21 Jul 2020 00:40:13 +0000 (UTC)
IronPort-SDR: EGBWkTK8KkgtR/5FEMhfksnnBJ3ZyMZs+J7etHa0Ka5KoQQQmzhx/OL/Mw4liRQP2J9pNyv38G
 qn8E0iUgz4pA==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="147540837"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="147540837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 17:40:13 -0700
IronPort-SDR: 9LYunyvs67LGRsSEe+mMkMVKOJ3g8j3ze/JcW7AwIGZp8AiiUqD99VXsSvL/e9Q6hVIhsv9Y4f
 MeBQjv7zEImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="301441299"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga002.jf.intel.com with ESMTP; 20 Jul 2020 17:40:12 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jul 2020 17:40:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Jul 2020 17:40:12 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Jul 2020 17:40:12 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.58) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 20 Jul 2020 17:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNInq1XdM4RI4C6PrZY5uz/VML1zXofrN1QR15VemjouiziwDaHPI8ddItD4uKYMYYteP9MWwXZVEAU/Bsr7HeLdVx2nEbYK3vc0N3tLuLx40kE6QP5G9DPM8Tmz9ct0r51w8WNCIrHlihux0+ECVgQTHhP38GBGF80sOiML1PaJNDrcasTt3Wf2yi85OAR/uxTRBbrBraRJuwI/hP1Sawbe1erzpCydcnooyO9izmL6I1DrQGMOG7ytyPpPShTvmo/+KY1HbmUy3QM+AOUNnk2AGdjcKCzD7VkqcO1QvTQDvjln/6GC6VeLjMICHy8qusd4edjF2+z4DQ0ngldsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXa/6/kAXBf7i/ASOBHYIW9j8lBMZftWV+e9LoEpaY8=;
 b=dIpiOsIIVbiBsKs2VXLxFte6wgCOk/2WsJbpAtNnTgI8V1Tk6/R0MyvaKJ/50ehuVwte2iXWDYILq3cXqGigbHGMTyxXQqk7R/Oc/1++p5G/hkOlL11yF+451iC5QDDO2grIDJiI+4dYQrF2ThpqC1HqcF9owvWWAZWz/Q90uRpHz3MmLhq+5UlT07DkUl3bcC5G0PkiUuaa8vwc1o6lsnB83845n57OnffLKuTlXvfBlee2LESVAA+Nh3iMwxwFYgHBsbuHGB6LQwzC2g8SoHobDM5ww3YfQU/+PjmQCFsmmout8TWTFbP2+gzmWZOpGWO6F0SpVLf6RugVN3EIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXa/6/kAXBf7i/ASOBHYIW9j8lBMZftWV+e9LoEpaY8=;
 b=qeIwz//hrJvDA58bhATOWedfHorRD9zc6LqsnCpvEzLVeD1lY6p343RQ4iycuxg/oV8QsYbZ5q+Nyjb1M7DapC/ZZMAHMhXd07obzerY2utIcD2C65+2ZwvORFpc9yRIK1G+aSWjHtc8L7pkFFP9RGjChRZGzDDtFNyY4nzGjFU=
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 00:40:10 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::b840:82ba:a83a:d8c3]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::b840:82ba:a83a:d8c3%7]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 00:40:10 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>
Subject: Re: [PATCH 1/2] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Thread-Topic: [PATCH 1/2] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Thread-Index: AQHWXu9ZasiKydr32U+36Y1fPSyudakRKACAgAAJGYA=
Date: Tue, 21 Jul 2020 00:40:10 +0000
Message-ID: <696350283535930fc6d4a62194c24207db95d4cf.camel@intel.com>
References: <20200720234126.11853-1-khaled.almahallawy@intel.com>
 <20200721000734.GA14395@intel.com>
In-Reply-To: <20200721000734.GA14395@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63bd1c56-487e-4193-3e8e-08d82d0e9fd6
x-ms-traffictypediagnostic: MW3PR11MB4555:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4555CDEC1C37ED2F907A5DE489780@MW3PR11MB4555.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ndKbEYyzsCfNNmakdaxH4tyOyt2iuUwpqwTIMCl1WvO1zhsNV9ytOTBZd3xLjBgErUuMZ2T8Lr5nStBKiqb/ykQ+2pcRT+TrwceA8kQAJtvvBeqZPf9+5QSHy6bMEcONX1w+0/bXfBTHfXp3yKRZtERaBq6JwmF9Tt5Q33LnMcF3zVQRJRCqQrWWTPAx3k9xm0qB4mHxYjg14GQNUsnxkPZ55zpiB8AEWXCza05t9MmyD1QpMn4PK3YqP6opUWWiQ4fZl9vgUgVtBf9w/XO1fIXTueXrzzDe3OW747LO4dwvl6q/a/MxGiluD1i9/42bUK2NqiWZuUidxgdzFV9yrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(478600001)(37006003)(2616005)(8676002)(186003)(6506007)(6512007)(64756008)(66556008)(66476007)(86362001)(450100002)(4326008)(66446008)(26005)(6862004)(83380400001)(71200400001)(6486002)(66946007)(76116006)(316002)(5660300002)(36756003)(54906003)(6636002)(2906002)(107886003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: iZdpxiQaTO+obweSzc1kvjajt/GB7ShVzH/TPE0HDt196QPjpCMEAt3S03K4p6SyYw4WDLkK11ow2sJ1TLl/xJtzPnGdNe0MtgKrj195ohuECS5owM6XfTz6mhGl2G9MUwwDHgLPfemb2q4/U2q1cpGUP/5vufxf5tSV0sTZgvdoJd2HnOhI3MddRlRbtiq8FjWTsV6MultgGbMft8xLPleFnUOu8j/9wZYmXl0g+a7kzsB+hcoha4mQgomvzYlUF4BlmYgehUGnzxco0UZ0aZxm+nTtckyxqJ5WvDzX4ETxfjeQkCUqH5ZtATV2UxrD3u9lcn+pcOX6EvS3mqPDsuZVb6vMiA0mOIWyKojHQwk6n5aXb0vGfC7PuH6gzzdZk9bAdq7ZYJcUMe1JMXBuuysVspkNKtDPi/k+IFfMNxHASP+fJHIDNlRHL8gXtz7YuziHQPrBu9KbVM3WA5dv5HkhurqAwkw1vFf66u38V0Dq9Kdxu+YsezDAWcH4VBSn
Content-ID: <856CACECF3183B44B9A9250569D6A3E1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bd1c56-487e-4193-3e8e-08d82d0e9fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 00:40:10.5274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +H7mMC+oS2dCw2m585JKs/lCayxdb17N807tFR13OBFiON8t1GqpS9F63smOBo1VogdTowzOE+eXXfzTesv7X7B6PKKawkOHuxUrkDNs9YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Manna,
 Animesh" <animesh.manna@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTA3LTIwIGF0IDE3OjA3IC0wNzAwLCBNYW5hc2kgTmF2YXJlIHdyb3RlOg0K
PiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCAwNDo0MToyNVBNIC0wNzAwLCBLaGFsZWQgQWxtYWhh
bGxhd3kgd3JvdGU6DQo+ID4gQWRkIHRoZSBtaXNzaW5nIENQMjUyMCBwYXR0ZXJuIDIgYW5kIDMg
cGh5IGNvbXBsaWFuY2UgcGF0dGVybnMNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLaGFsZWQg
QWxtYWhhbGxhd3kgPGtoYWxlZC5hbG1haGFsbGF3eUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAyICstDQo+ID4gIGluY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCAgICAgfCA0ICsrKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
aGVscGVyLmMNCj4gPiBpbmRleCBhM2M4MmU3MjYwNTcuLmQwZmI3OGM2YWNhNiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYw0KPiA+IEBAIC0xNTgzLDcgKzE1ODMsNyBAQCBpbnQg
ZHJtX2RwX2dldF9waHlfdGVzdF9wYXR0ZXJuKHN0cnVjdA0KPiA+IGRybV9kcF9hdXggKmF1eCwN
Cj4gPiAgCQkJcmV0dXJuIGVycjsNCj4gPiAgDQo+ID4gIAkJYnJlYWs7DQo+ID4gLQljYXNlIERQ
X1BIWV9URVNUX1BBVFRFUk5fQ1AyNTIwOg0KPiA+ICsJY2FzZSBEUF9QSFlfVEVTVF9QQVRURVJO
X0NQMjUyMF9QQVQxOg0KPiA+ICAJCWVyciA9IGRybV9kcF9kcGNkX3JlYWQoYXV4LA0KPiA+IERQ
X1RFU1RfSEJSMl9TQ1JBTUJMRVJfUkVTRVQsDQo+ID4gIAkJCQkgICAgICAgJmRhdGEtPmhicjJf
cmVzZXQsDQo+ID4gIAkJCQkgICAgICAgc2l6ZW9mKGRhdGEtPmhicjJfcmVzZXQpKTsNCj4gDQo+
IFdoZXJlIGRvIHdlIHJlYWQgUEFUMiBhbmQgUEFUMywgSSBzZWUgeW91IGRlZmluZWQgdGhvc2Ug
bmV3bHkgYW5kDQo+IHBhdGNoIDIvMiBoYXMgdGhlbQ0KPiBpbiB0ZWggc3dpdGNoIGNhc2UgYnV0
IHRoZSBkcm1fZHBfZ2V0X3BoeV90ZXN0X3BhdHRlcm4gZnVuY3Rpb24NCj4gZG9lc250IHJlYWQg
dGhlbT8NCj4gDQoNClBlciBteSB1bmRlcnN0YW5kaW5nIGZyb20gdGhlIHNwZWNzLCBvbmx5IEhC
UjIgKENQMjUyMCBQQVQxKSByZXF1aXJlcw0KcmVhZGluZyBkcGNkIGFkZHJlc3MgMDAyNEFoIHRv
IHNldCBIQlIyX0NPTVBMSUFOQ1RfU0NSQU1CTEVSX1JFU0VULg0KVFBTNCAoQ1AyNTIwIFBBVDMp
IGRvZXNu4oCZdCByZXF1aXJlIHRoYXQuIA0KSeKAmW0gbm90IHN1cmUgYWJvdXQgQ1AyNTIwIFBB
VDIgaWYgaXQgaGFzIHVzZSBvciBub3QuIEluIHRoZSB0ZXN0IHNjb3BlDQp3ZSBjYW4gc2VsZWN0
IDYgcGF0dGVybnMuIFBBVDIgaXMgbm90IG9uZSBvZiB0aGVtLiANCg0KVGhhbmtzDQp+S2hhbGVk
DQoNCj4gTWFuYXNpDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgNCj4gPiBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPiA+IGluZGV4IGU0N2Rj
MjJlYmY1MC4uNjVkZDZjZDcxZjFlIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPiA+IEBA
IC03MDgsNyArNzA4LDkgQEANCj4gPiAgIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl9FUlJP
Ul9DT1VOVCAgICAweDINCj4gPiAgIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl9QUkJTNyAg
ICAgICAgICAweDMNCj4gPiAgIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl84MEJJVF9DVVNU
T00gICAweDQNCj4gPiAtIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl9DUDI1MjAgICAgICAg
ICAweDUNCj4gPiArIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl9DUDI1MjBfUEFUMQkweDUN
Cj4gPiArIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl9DUDI1MjBfUEFUMgkweDYNCj4gPiAr
IyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFUVEVSTl9DUDI1MjBfUEFUMwkweDcNCj4gPiAgDQo+ID4g
ICNkZWZpbmUgRFBfVEVTVF9IQlIyX1NDUkFNQkxFUl9SRVNFVCAgICAgICAgMHgyNEENCj4gPiAg
I2RlZmluZSBEUF9URVNUXzgwQklUX0NVU1RPTV9QQVRURVJOXzdfMCAgICAweDI1MA0KPiA+IC0t
IA0KPiA+IDIuMTcuMQ0KPiA+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
