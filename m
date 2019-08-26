Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D320E9D659
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220689DD2;
	Mon, 26 Aug 2019 19:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADEA89DD2;
 Mon, 26 Aug 2019 19:19:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 12:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="380644951"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2019 12:19:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 12:19:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 12:19:50 -0700
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 12:19:49 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.143]) with mapi id 14.03.0439.000;
 Tue, 27 Aug 2019 00:49:47 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 4/6] drm/i915/dp: Attach colorspace property
Thread-Topic: [PATCH v2 4/6] drm/i915/dp: Attach colorspace property
Thread-Index: AQHVWZiIIwojtwHdUUeyg3Jtf3ufTKcN0xKQ
Date: Mon, 26 Aug 2019 19:19:47 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F821D1DD8@BGSMSX104.gar.corp.intel.com>
References: <20190823095232.28908-1-gwan-gyeong.mun@intel.com>
 <20190823095232.28908-5-gwan-gyeong.mun@intel.com>
In-Reply-To: <20190823095232.28908-5-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTZjM2I1ZmEtMzZmMi00NTczLWE3Y2YtMzkyNDRhMmQ0MTY2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ0VmK0tBbTl0M1RTcUxFUUd6c24zOWE4THhNeE5FMnh3amM1N1E5dlV3XC95VmZaSGZ4dSszbXltODg1TlwveFMrIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IE11biwgR3dhbi1neWVvbmcKPlNl
bnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDE5IDM6MjMgUE0KPlRvOiBpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hh
bmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+Owo+U2hhcm1hLCBTaGFzaGFuayA8c2hh
c2hhbmsuc2hhcm1hQGludGVsLmNvbT4KPlN1YmplY3Q6IFtQQVRDSCB2MiA0LzZdIGRybS9pOTE1
L2RwOiBBdHRhY2ggY29sb3JzcGFjZSBwcm9wZXJ0eQo+Cj5JdCBhdHRhY2hlcyB0aGUgY29sb3Jz
cGFjZSBjb25uZWN0b3IgcHJvcGVydHkgdG8gYSBEaXNwbGF5UG9ydCBjb25uZWN0b3IuCj5CYXNl
ZCBvbiBjb2xvcnNwYWNlIGNoYW5nZSwgbW9kZXNldCB3aWxsIGJlIHRyaWdnZXJlZCB0byBzd2l0
Y2ggdG8gYSBuZXcKPmNvbG9yc3BhY2UuCj4KPkJhc2VkIG9uIGNvbG9yc3BhY2UgcHJvcGVydHkg
dmFsdWUgY3JlYXRlIGEgVlNDIFNEUCBwYWNrZXQgd2l0aCBhcHByb3ByaWF0ZQo+Y29sb3JzcGFj
ZS4gVGhpcyB3b3VsZCBoZWxwIHRvIGVuYWJsZSB3aWRlciBjb2xvciBnYW11dCBsaWtlIEJUMjAy
MCBvbiBhIHNpbmsgZGV2aWNlLgoKVGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lLgpSZXZpZXdl
ZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KCj5TaWduZWQtb2ZmLWJ5
OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Cj4tLS0KPiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAyICsrCj4gMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jCj5iL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYwo+aW5kZXggMjk1ZDVlZDJiZTk2Li43MjE4ZTE1OWY1NWQgMTAwNjQ0Cj4tLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+QEAgLTY0MDIsNiArNjQwMiw4IEBAIGludGVsX2Rw
X2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHN0cnVjdAo+ZHJtX2Nv
bm5lY3RvciAqY29ubmVjdAo+IAllbHNlIGlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDUpCj4g
CQlkcm1fY29ubmVjdG9yX2F0dGFjaF9tYXhfYnBjX3Byb3BlcnR5KGNvbm5lY3RvciwgNiwgMTIp
Owo+Cj4rCWludGVsX2F0dGFjaF9jb2xvcnNwYWNlX3Byb3BlcnR5KGNvbm5lY3Rvcik7Cj4rCj4g
CWlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKSB7Cj4gCQl1MzIgYWxsb3dlZF9zY2FsZXJz
Owo+Cj4tLQo+Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
