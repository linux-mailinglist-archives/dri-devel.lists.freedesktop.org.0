Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6CD9D6F2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850B96E2ED;
	Mon, 26 Aug 2019 19:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724426E2ED;
 Mon, 26 Aug 2019 19:45:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 12:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="181479356"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga007.fm.intel.com with ESMTP; 26 Aug 2019 12:45:26 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 12:45:25 -0700
Received: from bgsmsx103.gar.corp.intel.com (10.223.4.130) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 12:45:25 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX103.gar.corp.intel.com ([169.254.4.129]) with mapi id 14.03.0439.000;
 Tue, 27 Aug 2019 01:15:23 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 6/6] drm/i915/dp: Attach HDR metadata property to DP
 connector
Thread-Topic: [PATCH v2 6/6] drm/i915/dp: Attach HDR metadata property to DP
 connector
Thread-Index: AQHVWZiJL31rlW/vrEao9mSq6g8uUacN2lHw
Date: Mon, 26 Aug 2019 19:45:22 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F821D1E8D@BGSMSX104.gar.corp.intel.com>
References: <20190823095232.28908-1-gwan-gyeong.mun@intel.com>
 <20190823095232.28908-7-gwan-gyeong.mun@intel.com>
In-Reply-To: <20190823095232.28908-7-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDY1MzczM2QtMjlmMy00NjU3LTgyNjctNDZkNDdlNjM1NjMzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoia1daUkdhbkpsQm5NUWtPd1hYZ21lNlwveXp6TXdxOE5oSjJsbWVPQkVpK2N5NTkxNVVTRW9POVI4ZjhvK255YnYifQ==
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
c2hhbmsuc2hhcm1hQGludGVsLmNvbT4KPlN1YmplY3Q6IFtQQVRDSCB2MiA2LzZdIGRybS9pOTE1
L2RwOiBBdHRhY2ggSERSIG1ldGFkYXRhIHByb3BlcnR5IHRvIERQIGNvbm5lY3Rvcgo+Cj5JdCBh
dHRhY2hlcyBIRFIgbWV0YWRhdGEgcHJvcGVydHkgdG8gRFAgY29ubmVjdG9yIG9uIEdMSysuCj5J
dCBlbmFibGVzIEhEUiBtZXRhZGF0YSBpbmZvZnJhbWUgc2RwIG9uIEdMSysgdG8gYmUgdXNlZCB0
byBzZW5kIEhEUiBtZXRhZGF0YSB0bwo+RFAgc2luay4KPgo+djI6IE1pbm9yIHN0eWxlIGZpeAoK
VGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lLgpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4KCj5TaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3
YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmMgfCA1ICsrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5j
Cj5iL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+aW5kZXggMDBkYTgy
MjFlYWJhLi44OTk5MjNlY2QxYzkgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYwo+QEAgLTY0OTUsNiArNjQ5NSwxMSBAQCBpbnRlbF9kcF9hZGRfcHJvcGVydGllcyhz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCBzdHJ1Y3QKPmRybV9jb25uZWN0b3IgKmNvbm5lY3QK
Pgo+IAlpbnRlbF9hdHRhY2hfY29sb3JzcGFjZV9wcm9wZXJ0eShjb25uZWN0b3IpOwo+Cj4rCWlm
IChJU19HRU1JTklMQUtFKGRldl9wcml2KSB8fCBJTlRFTF9HRU4oZGV2X3ByaXYpID49IDExKQo+
KwkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmNvbm5lY3Rvci0+YmFzZSwKPisJCQkJCSAg
IGNvbm5lY3Rvci0+ZGV2LQo+Pm1vZGVfY29uZmlnLmhkcl9vdXRwdXRfbWV0YWRhdGFfcHJvcGVy
dHksCj4rCQkJCQkgICAwKTsKPisKPiAJaWYgKGludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkpIHsK
PiAJCXUzMiBhbGxvd2VkX3NjYWxlcnM7Cj4KPi0tCj4yLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
