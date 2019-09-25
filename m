Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B8BD9C4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43332892E4;
	Wed, 25 Sep 2019 08:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2589244;
 Wed, 25 Sep 2019 08:24:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 01:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="364256679"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 25 Sep 2019 01:24:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 01:24:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Sep 2019 01:24:41 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 25 Sep 2019 01:24:41 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.92]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 16:24:38 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "Bie, Tiwei"
 <tiwei.bie@intel.com>
Subject: RE: [PATCH V2 0/8] mdev based hardware virtio offloading support
Thread-Topic: [PATCH V2 0/8] mdev based hardware virtio offloading support
Thread-Index: AQHVct+eQdtHh3CM1kSintZ5w217Z6c8D0tg
Date: Wed, 25 Sep 2019 08:24:38 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F68D@SHSMSX104.ccr.corp.intel.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
In-Reply-To: <20190924135332.14160-1-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzNlNTRhOTItZmM2My00ZDE0LWI1MjgtY2VmOWFlNDZkMWJhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaERhd1cxSkkrS1Y5NEZRdThqNm9jSFJJNHZmRU1SUStsRnp4WnpwMkYzVU5RNGducjNJTThkRHhlUkpXMng4bCJ9
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBKYXNvbiBXYW5nIFttYWlsdG86amFzb3dhbmdAcmVkaGF0LmNvbV0KPiBTZW50OiBU
dWVzZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMTkgOTo1MyBQTQo+IAo+IEhpIGFsbDoKPiAKPiBUaGVy
ZSBhcmUgaGFyZHdhcmUgdGhhdCBjYW4gZG8gdmlydGlvIGRhdGFwYXRoIG9mZmxvYWRpbmcgd2hp
bGUgaGF2aW5nCj4gaXRzIG93biBjb250cm9sIHBhdGguIFRoaXMgcGF0aCB0cmllcyB0byBpbXBs
ZW1lbnQgYSBtZGV2IGJhc2VkCj4gdW5pZmllZCBBUEkgdG8gc3VwcG9ydCB1c2luZyBrZXJuZWwg
dmlydGlvIGRyaXZlciB0byBkcml2ZSB0aG9zZQo+IGRldmljZXMuIFRoaXMgaXMgZG9uZSBieSBp
bnRyb2R1Y2luZyBhIG5ldyBtZGV2IHRyYW5zcG9ydCBmb3IgdmlydGlvCj4gKHZpcnRpb19tZGV2
KSBhbmQgcmVnaXN0ZXIgaXRzZWxmIGFzIGEgbmV3IGtpbmQgb2YgbWRldiBkcml2ZXIuIFRoZW4K
PiBpdCBwcm92aWRlcyBhIHVuaWZpZWQgd2F5IGZvciBrZXJuZWwgdmlydGlvIGRyaXZlciB0byB0
YWxrIHdpdGggbWRldgo+IGRldmljZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBUaG91Z2ggdGhlIHNl
cmllcyBvbmx5IGNvbnRhaW5zIGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMgdG8K
PiBtYWtlIHRoZSB0cmFuc3BvcnQgZ2VuZXJpYyBlbm91Z2ggdG8gc3VwcG9ydCB1c2Vyc3BhY2Ug
ZHJpdmVycy4gVGhpcwo+IG1lYW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24gdG9w
IGFzIHdlbGwgYnkgcmVzdWluZyB0aGUKPiB0cmFuc3BvcnQuCj4gCj4gQSBzYW1wbGUgZHJpdmVy
IGlzIGFsc28gaW1wbGVtZW50ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cj4gbG9vcGJh
Y2sgZXRoZXJuZXQgZGV2aWNlIG9uIHRvcCBvZiB2cmluZ2ggKyB3b3JrcXVldWUuIFRoaXMgY291
bGQgYmUKPiB1c2VkIGFzIGEgcmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGZvciByZWFsIGhhcmR3
YXJlIGRyaXZlci4KPiAKPiBDb25zaWRlciBtZGV2IGZyYW1ld29yayBvbmx5IHN1cHBvcnQgVkZJ
TyBkZXZpY2UgYW5kIGRyaXZlciByaWdodCBub3csCj4gdGhpcyBzZXJpZXMgYWxzbyBleHRlbmQg
aXQgdG8gc3VwcG9ydCBvdGhlciB0eXBlcy4gVGhpcyBpcyBkb25lCj4gdGhyb3VnaCBpbnRyb2R1
Y2luZyBjbGFzcyBpZCB0byB0aGUgZGV2aWNlIGFuZCBwYWlyaW5nIGl0IHdpdGgKPiBpZF90YWxi
ZSBjbGFpbWVkIGJ5IHRoZSBkcml2ZXIuIE9uIHRvcCwgdGhpcyBzZXJpcyBhbHNvIGRlY291cGxl
CgppZF90YWJsZSBjbGFpbWVkIC4uLiB0aGlzIHNlcmllcyAuLi4KCj4gZGV2aWNlIHNwZWNpZmlj
IHBhcmVudHMgb3BzIG91dCBvZiB0aGUgY29tbW9uIG9uZXMuCj4gCj4gUGt0Z2VuIHRlc3Qgd2Fz
IGRvbmUgd2l0aCB2aXJpdG8tbmV0ICsgbXZuZXQgbG9vcCBiYWNrIGRldmljZS4KPiAKPiBQbGVh
c2UgcmV2aWV3Lgo+IAo+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS85LzE2Lzg2OQo+
IAo+IENoYW5nZXMgZnJvbSBWMToKPiAKPiAtIG1vdmUgdmlydGlvX21kZXYuYyB0byBkcml2ZXJz
L3ZpcnRpbwo+IC0gc3RvcmUgY2xhc3NfaWQgaW4gbWRldl9kZXZpY2UgaW5zdGVhZCBvZiBtZGV2
X3BhcmVudAo+IC0gc3RvcmUgZGV2aWNlX29wcyBpbiBtZGV2X2RldmljZSBpbnN0ZWFkIG9mIG1k
ZXZfcGFyZW50Cj4gLSByZW9yZGVyIHRoZSBwYXRjaCwgdnJpbmdoIGZpeCBjb21lcyBmaXJzdAo+
IC0gcmVhbGx5IHNpbGVudCBjb21waWxpbmcgd2FybmluZ3MKPiAtIHJlYWxseSBzd2l0Y2ggdG8g
dXNlIHUxNiBmb3IgY2xhc3NfaWQKPiAtIHVldmVudCBhbmQgbW9kcG9zdCBzdXBwb3J0IGZvciBt
ZGV2IGNsYXNzX2lkCj4gLSB2cmFpb3VzIHR3ZWFrcyBwZXIgY29tbWVudHMgZnJvbSBQYXJhdgo+
IAo+IENoYW5nZXMgZnJvbSBSRkMtVjI6Cj4gCj4gLSBzaWxlbnQgY29tcGlsZSB3YXJuaW5ncyBv
biBzb21lIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24KPiAtIHVzZSB1MTYgaW5zdGVhZCB1OCBmb3Ig
Y2xhc3MgaWQKPiAtIHJlc2V2ZSBNREVWX0lEX1ZIT1NUIGZvciBmdXR1cmUgdmhvc3QtbWRldiB3
b3JrCj4gLSBpbnRyb2R1Y2UgInZpcnRpbyIgdHlwZSBmb3IgbXZuZXQgYW5kIG1ha2UgInZob3N0
IiB0eXBlIGZvciBmdXR1cmUKPiAgIHdvcmsKPiAtIGFkZCBlbnRyaWVzIGluIE1BSU5UQUlORVIK
PiAtIHR3ZWFrIGFuZCB0eXBvcyBmaXhlcyBpbiBjb21taXQgbG9nCj4gCj4gQ2hhbmdlcyBmcm9t
IFJGQy1WMToKPiAKPiAtIHJlbmFtZSBkZXZpY2UgaWQgdG8gY2xhc3MgaWQKPiAtIGFkZCBkb2Nz
IGZvciBjbGFzcyBpZCBhbmQgZGV2aWNlIHNwZWNpZmljIG9wcyAoZGV2aWNlX29wcykKPiAtIHNw
bGl0IGRldmljZV9vcHMgaW50byBzZXBlcmF0ZSBoZWFkZXJzCj4gLSBkcm9wIHRoZSBtZGV2X3Nl
dF9kbWFfb3BzKCkKPiAtIHVzZSBkZXZpY2Vfb3BzIHRvIGltcGxlbWVudCB0aGUgdHJhbnNwb3J0
IEFQSSwgdGhlbiBpdCdzIG5vdCBhIHBhcnQKPiAgIG9mIFVBUEkgYW55IG1vcmUKPiAtIHVzZSBH
RlBfQVRPTUlDIGluIG12bmV0IHNhbXBsZSBkZXZpY2UgYW5kIG90aGVyIHR3ZWFrcwo+IC0gc2V0
X3ZyaW5nX2Jhc2UvZ2V0X3ZyaW5nX2Jhc2Ugc3VwcG9ydCBmb3IgbXZuZXQgZGV2aWNlCj4gCj4g
SmFzb24gV2FuZyAoOCk6Cj4gICB2cmluZ2g6IGZpeCBjb3B5IGRpcmVjdGlvbiBvZiB2cmluZ2hf
aW92X3B1c2hfa2VybigpCj4gICBtZGV2OiBjbGFzcyBpZCBzdXBwb3J0Cj4gICBtZGV2OiBidXMg
dWV2ZW50IHN1cHBvcnQKPiAgIG1vZHBvc3Q6IGFkZCBzdXBwb3J0IGZvciBtZGV2IGNsYXNzIGlk
Cj4gICBtZGV2OiBpbnRyb2R1Y2UgZGV2aWNlIHNwZWNpZmljIG9wcwo+ICAgbWRldjogaW50cm9k
dWNlIHZpcnRpbyBkZXZpY2UgYW5kIGl0cyBkZXZpY2Ugb3BzCj4gICB2aXJ0aW86IGludHJvZHVj
ZSBhIG1kZXYgYmFzZWQgdHJhbnNwb3J0Cj4gICBkb2NzOiBzYW1wbGUgZHJpdmVyIHRvIGRlbW9u
c3RyYXRlIGhvdyB0byBpbXBsZW1lbnQgdmlydGlvLW1kZXYKPiAgICAgZnJhbWV3b3JrCj4gCj4g
IC4uLi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCAgICAgICB8ICAgNyArLQo+
ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgfCAgMTggKy0K
PiAgZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYyAgICAgICAgICAgICAgIHwgIDE4ICst
Cj4gIGRyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYyAgICAgICAgICAgICB8ICAxNCAr
LQo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyAgICAgICAgICAgICAgICAgfCAgMTkg
Kwo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgICAgICAgICAgICAgfCAgMjIg
Kwo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAgfCAgIDIg
Kwo+ICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgfCAgNDUg
Ky0KPiAgZHJpdmVycy92aG9zdC92cmluZ2guYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4
ICstCj4gIGRyaXZlcnMvdmlydGlvL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
NyArCj4gIGRyaXZlcnMvdmlydGlvL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCj4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMgICAgICAgICAgICAgICAgICB8IDQx
NyArKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNTIgKy0KPiAgaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAgICAg
ICAgICAgIHwgICA4ICsKPiAgaW5jbHVkZS9saW51eC92ZmlvX21kZXYuaCAgICAgICAgICAgICAg
ICAgICAgIHwgIDUyICsrCj4gIGluY2x1ZGUvbGludXgvdmlydGlvX21kZXYuaCAgICAgICAgICAg
ICAgICAgICB8IDE0NSArKysrCj4gIHNhbXBsZXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNyArCj4gIHNhbXBsZXMvdmZpby1tZGV2L01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCj4gIHNhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jICAgICAgICAg
ICAgICAgICAgICB8ICAyMCArLQo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgMjAgKy0KPiAgc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAg
ICAgICAgICAgICAgIHwgIDE4ICstCj4gIHNhbXBsZXMvdmZpby1tZGV2L212bmV0LmMgICAgICAg
ICAgICAgICAgICAgICB8IDY5MiArKysrKysrKysrKysrKysrKysKPiAgc2NyaXB0cy9tb2QvZGV2
aWNldGFibGUtb2Zmc2V0cy5jICAgICAgICAgICAgIHwgICAzICsKPiAgc2NyaXB0cy9tb2QvZmls
ZTJhbGlhcy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKPiAgMjUgZmlsZXMgY2hhbmdl
ZCwgMTUyNCBpbnNlcnRpb25zKCspLCA4NCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvbGludXgvdmZpb19tZGV2LmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGlu
dXgvdmlydGlvX21kZXYuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2FtcGxlcy92ZmlvLW1kZXYv
bXZuZXQuYwo+IAo+IC0tCj4gMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
