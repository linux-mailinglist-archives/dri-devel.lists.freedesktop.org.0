Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2109EA41
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782B389B22;
	Tue, 27 Aug 2019 14:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A1F89B22;
 Tue, 27 Aug 2019 14:00:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="182787086"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 27 Aug 2019 07:00:27 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 27 Aug 2019 07:00:26 -0700
Received: from hasmsx112.ger.corp.intel.com (10.184.198.40) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 27 Aug 2019 07:00:26 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 HASMSX112.ger.corp.intel.com ([169.254.11.117]) with mapi id 14.03.0439.000;
 Tue, 27 Aug 2019 17:00:24 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v10 3/6] drm: Extend I915 mei interface for transcoder info
Thread-Topic: [PATCH v10 3/6] drm: Extend I915 mei interface for transcoder
 info
Thread-Index: AQHVXMVZLeQGKxweKESSq3BtOigEqqcPBGyw
Date: Tue, 27 Aug 2019 14:00:23 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DCA4F64@hasmsx108.ger.corp.intel.com>
References: <20190827105014.14181-1-ramalingam.c@intel.com>
 <20190827105014.14181-4-ramalingam.c@intel.com>
In-Reply-To: <20190827105014.14181-4-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2VmZGUwMTEtNzllYi00OTkzLWE5ODAtOWU1M2I0M2M4OWQyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUTdGdlhKdmxmK0JHUUV3VWZaQnJYakRLR3RlWHQrbmFHYTRhUzhLTjNaaEg2aXJ4TGRhQzAwclRiOHRXelFBQSJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.184.70.10]
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAKPiBJOTE1IG5lZWRzIHRvIHNlbmQgdGhlIGluZGV4IG9mIHRoZSB0cmFuc2NvZGVyIGFzIHBl
ciBNRSBGVy4KPiAKPiBUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md190YyBhbmQg
YWRkIGFzIGEgbWVtYmVyIGludG8gdGhlIHN0cnVjdAo+IGhkY3BfcG9ydF9kYXRhLgo+IAo+IHYy
Ogo+ICAgVHlwbyBpbiBjb21taXQgbXNnIGlzIGZpeGVkIFtTaGFzaGFua10KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gQWNrZWQtYnk6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJt
L2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggfCAxMyArKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5
MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiBiL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50
ZXJmYWNlLmgKPiBpbmRleCBhOTdhY2YxYzk3MTAuLjBkZTYyOWJmMmY2MiAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oCj4gKysrIGIvaW5jbHVkZS9k
cm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAo+IEBAIC01NCw5ICs1NCwyMSBAQCBlbnVtIG1l
aV9md19kZGkgewo+ICAJTUVJX0RESV9SQU5HRV9FTkQgPSBNRUlfRERJX0EsCj4gIH07Cj4gCj4g
K2VudW0gbWVpX2Z3X3RjIHsKPiArCU1FSV9JTlZBTElEX1RSQU5TQ09ERVIgPSAweDAwLAkvKiBJ
bnZhbGlkIHRyYW5zY29kZXIgdHlwZSAqLwo+ICsJTUVJX1RDX0VEUCwJCQkvKiBUcmFuc2NvZGVy
IGZvciBlRFAgKi8KPiArCU1FSV9UQ19EU0kwLAkJCS8qIFRyYW5zY29kZXIgZm9yIERTSTAgKi8K
PiArCU1FSV9UQ19EU0kxLAkJCS8qIFRyYW5zY29kZXIgZm9yIERTSTEgKi8KPiArCU1FSV9UQ19B
ID0gMHgxMCwJCS8qIFRyYW5zY29kZXIgVENBICovCj4gKwlNRUlfVENfQiwJCQkvKiBUcmFuc2Nv
ZGVyIFRDQiAqLwo+ICsJTUVJX1RDX0MsCQkJLyogVHJhbnNjb2RlciBUQ0MgKi8KPiArCU1FSV9U
Q19ECQkJLyogVHJhbnNjb2RlciBUQ0QgKi8KPiArfTsKCllvdSBzaG91bGQgdXNlIGtkb2MgZm9y
bWF0IGhlcmUsIHBsZWFzZS4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4yL2Rv
Yy1ndWlkZS9rZXJuZWwtZG9jLmh0bWwgCkFsc28gVENBIGp1c3QgbWVhbnMgVHJhbnNjb2RlciBB
ICBvciBUQyBoYXMgb3RoZXIgbWVhbmluZz8gCgo+ICsKPiAgLyoqCj4gICAqIHN0cnVjdCBoZGNw
X3BvcnRfZGF0YSAtIGludGVsIHNwZWNpZmljIEhEQ1AgcG9ydCBkYXRhCj4gICAqIEBmd19kZGk6
IGRkaSBpbmRleCBhcyBwZXIgTUUgRlcKPiArICogQGZ3X3RjOiB0cmFuc2NvZGVyIGluZGV4IGFz
IHBlciBNRSBGVwo+ICAgKiBAcG9ydF90eXBlOiBIRENQIHBvcnQgdHlwZSBhcyBwZXIgTUUgRlcg
Y2xhc3NpZmljYXRpb24KPiAgICogQHByb3RvY29sOiBIRENQIGFkYXB0YXRpb24gYXMgcGVyIE1F
IEZXCj4gICAqIEBrOiBObyBvZiBzdHJlYW1zIHRyYW5zbWl0dGVkIG9uIGEgcG9ydC4gT25seSBv
biBEUCBNU1QgdGhpcyBpcyAhPSAxIEBAIC0KPiA2OSw2ICs4MSw3IEBAIGVudW0gbWVpX2Z3X2Rk
aSB7Cj4gICAqLwo+ICBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEgewo+ICAJZW51bSBtZWlfZndfZGRp
IGZ3X2RkaTsKPiArCWVudW0gbWVpX2Z3X3RjIGZ3X3RjOwo+ICAJdTggcG9ydF90eXBlOwo+ICAJ
dTggcHJvdG9jb2w7Cj4gIAl1MTYgazsKPiAtLQo+IDIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
