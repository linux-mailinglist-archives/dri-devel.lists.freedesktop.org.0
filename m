Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9DF9E88A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 15:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EF28979E;
	Tue, 27 Aug 2019 13:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC578979E;
 Tue, 27 Aug 2019 13:02:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 06:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="182772462"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 27 Aug 2019 06:02:17 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 27 Aug 2019 06:02:17 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Aug 2019 06:02:17 -0700
Received: from lcsmsx154.ger.corp.intel.com (10.186.165.229) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Aug 2019 06:02:16 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 LCSMSX154.ger.corp.intel.com ([169.254.7.131]) with mapi id 14.03.0439.000;
 Tue, 27 Aug 2019 16:02:14 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v10 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Topic: [PATCH v10 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Index: AQHVXMVRSsOGlv6880mVspSOZAq5YKcO9YPw
Date: Tue, 27 Aug 2019 13:02:13 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DCA4E9E@hasmsx108.ger.corp.intel.com>
References: <20190827105014.14181-1-ramalingam.c@intel.com>
In-Reply-To: <20190827105014.14181-1-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjgxZmQ4MzMtY2IzZS00ZjMyLTkyYjYtNTUwOTRlYzcwNDE3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOVJyaFNrTEV4VlZraUlBUzV2SCtLUW1wR2FVSVkya2pBT21FTHpVZGxzbHlHcnI0ZE9CVHlWeFhOREZoU01HSyJ9
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

Cj4gRW5hYmxpbmcgdGhlIEhEQ1AxLjQgYW5kIDIuMiBvbiBUR0wgYnkgc3VwcG9ydGluZyB0aGUg
SFcgYmxvY2sgbW92ZW1lbnQKPiBmcm9tIERESSBpbnRvIHRyYW5zY29kZXIuCgpJbiBzb21lIGZp
bGVzIG5lZWRzIHRvIGJ1bXAgdGhlIGNvcHlyaWdodCB0byAyMDE5LiAKCj4gCj4gdjEwOgo+ICAg
UmV2aWV3IGNvbW1lbnRzIGZyb20gc2hhc2hhbmsgYWRkcmVzc2VkCj4gCj4gUmFtYWxpbmdhbSBD
ICg2KToKPiAgIGRybS9pOTE1OiBtZWlfaGRjcDogSTkxNSBzZW5kcyBkZGkgaW5kZXggYXMgcGVy
IE1FIEZXCj4gICBkcm06IE1vdmUgcG9ydCBkZWZpbml0aW9uIGJhY2sgdG8gaTkxNSBoZWFkZXIK
PiAgIGRybTogRXh0ZW5kIEk5MTUgbWVpIGludGVyZmFjZSBmb3IgdHJhbnNjb2RlciBpbmZvCj4g
ICBtaXNjL21laS9oZGNwOiBGaWxsIHRyYW5zY29kZXIgaW5kZXggaW4gcG9ydCBpbmZvCj4gICBk
cm0vaTkxNS9oZGNwOiB1cGRhdGUgY3VycmVudCB0cmFuc2NvZGVyIGludG8gaW50ZWxfaGRjcAo+
ICAgZHJtL2k5MTUvaGRjcDogRW5hYmxlIEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrCj4gCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5oICAgICB8ICAgMSArCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oICB8ICAxOCArKwo+
ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICAgfCAgIDcgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgIDMgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICAgfCAgIDEgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3AuYyAgICAgfCAyMTIgKysr
KysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRj
cC5oICAgICB8ICAgNCArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRt
aS5jICAgICB8ICAxMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hk
bWkuaCAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hv
dHBsdWcuaCAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nk
dm8uaCAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAg
ICAgICAgICAgfCAxMjQgKysrKysrKysrLQo+ICBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVpX2hk
Y3AuYyAgICAgICAgICAgICAgfCAgNDUgKystLQo+ICBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVp
X2hkY3AuaCAgICAgICAgICAgICAgfCAgMTYgKy0KPiAgaW5jbHVkZS9kcm0vaTkxNV9kcm0uaCAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDE4IC0tCj4gIGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hk
Y3BfaW50ZXJmYWNlLmggICAgICAgICB8ICAyOSArKy0KPiAgMTYgZmlsZXMgY2hhbmdlZCwgMzcy
IGluc2VydGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
