Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E86B5972
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 03:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438296EDB9;
	Wed, 18 Sep 2019 01:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1EA6EDB4;
 Wed, 18 Sep 2019 01:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 18:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,519,1559545200"; d="scan'208";a="387759468"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2019 18:54:46 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 17 Sep 2019 18:54:46 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 17 Sep 2019 18:54:46 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.195]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 09:54:43 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Jason Wang
 <jasowang@redhat.com>
Subject: RE: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Thread-Topic: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Thread-Index: AQHVaU4oWR0pdyTYXkSIYprDpminDacvor2AgAER7xA=
Date: Wed, 18 Sep 2019 01:54:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D57B260@SHSMSX104.ccr.corp.intel.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
 <20190917113125.6b2970e5@x1.home>
In-Reply-To: <20190917113125.6b2970e5@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjIzYjdjYjctNGRjNS00NjVkLWI1NjYtNmMzYjQ3NWFkZGVmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOEtscnZOZHpwQlFVR2ZuQlowRGFUOXpKQmc3YzBGTVF1UGptQlFFYTRLWlhTYThac0hjRk55MTZGZDFXQ05KMiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Wang, 
 Zhihong" <zhihong.wang@intel.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgs
IDIwMTkgMTozMSBBTQ0KPiANCj4gW2NjICtQYXJhdl0NCj4gDQo+IE9uIFRodSwgMTIgU2VwIDIw
MTkgMTc6NDA6MTAgKzA4MDANCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3Jv
dGU6DQo+IA0KPiA+IEhpIGFsbDoNCj4gPg0KPiA+IER1cmluZyB0aGUgZGV2ZWxvcG1lbnQgb2Yg
dmlydGlvLW1kZXZbMV0uIEkgZmluZCB0aGF0IG1kZXYgbmVlZHMgdG8gYmUNCj4gPiBleHRlbmRl
ZCB0byBzdXBwb3J0IGRldmljZXMgb3RoZXIgdGhhbiB2ZmlvIG1kZXYgZGV2aWNlLiBTbyB0aGlz
DQo+ID4gc2VyaWVzIHRyaWVzIHRvIGV4dGVuZCB0aGUgbWRldiB0byBiZSBhYmxlIHRvIGRpZmZl
ciBmcm9tIGRpZmZlcmVudA0KPiA+IGRldmljZXMgYnk6DQo+ID4NCj4gPiAtIGRldmljZSBpZCBh
bmQgbWF0Y2hpbmcgZm9yIG1kZXYgYnVzDQo+ID4gLSBkZXZpY2Ugc3BlaWNmaWMgY2FsbGJhY2tz
IGFuZCBtb3ZlIHZmaW8gY2FsbGJhY2tzIHRoZXJlDQo+ID4NCj4gPiBTZW50IGZvciBlYXJseSBy
ZWl2ZXcsIGNvbXBpbGUgdGVzdCBvbmx5IQ0KPiA+DQo+ID4gVGhhbmtzDQo+ID4NCj4gPiBbMV0g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xMC8xMzUNCj4gDQo+IEkgZXhwZWN0IFBhcmF2
IG11c3QgaGF2ZSBzb21ldGhpbmcgc2ltaWxhciBpbiB0aGUgd29ya3MgZm9yIHRoZWlyDQo+IGlu
LWtlcm5lbCBuZXR3b3JraW5nIG1kZXYgc3VwcG9ydC4gIExpbmsgdG8gZGlzY3Vzc2lvbiBzbyBm
YXI6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAxOTA5MTIwOTQwMTIuMjk2
NTMtMS0NCj4gamFzb3dhbmdAcmVkaGF0LmNvbS9ULyN0DQo+IA0KDQpJdCBsaW5rcyB0byB0aGUg
Y3VycmVudCB0aHJlYWQuIElzIGl0IGludGVuZGVkIG9yIGRvIHlvdSB3YW50DQpwZW9wbGUgdG8g
bG9vayBhdCBhbm90aGVyIHRocmVhZCBkcml2ZW4gYnkgUGFyYXY/IDotKQ0KDQpUaGFua3MNCktl
dmluDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
