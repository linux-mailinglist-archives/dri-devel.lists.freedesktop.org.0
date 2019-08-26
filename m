Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE8B9D654
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06F76E2AB;
	Mon, 26 Aug 2019 19:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7B6E2A8;
 Mon, 26 Aug 2019 19:18:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 12:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="174305411"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 26 Aug 2019 12:18:13 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 12:18:13 -0700
Received: from bgsmsx110.gar.corp.intel.com (10.223.4.212) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 12:18:13 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX110.gar.corp.intel.com ([169.254.11.152]) with mapi id 14.03.0439.000;
 Tue, 27 Aug 2019 00:48:10 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/6] drm: Add DisplayPort colorspace property
Thread-Topic: [PATCH v2 3/6] drm: Add DisplayPort colorspace property
Thread-Index: AQHVWZiJcilefE1DtUK27WGcqhrx+acN0pTg
Date: Mon, 26 Aug 2019 19:18:09 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F821D1DA8@BGSMSX104.gar.corp.intel.com>
References: <20190823095232.28908-1-gwan-gyeong.mun@intel.com>
 <20190823095232.28908-4-gwan-gyeong.mun@intel.com>
In-Reply-To: <20190823095232.28908-4-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjJjOGIzZjYtZmUxOC00NjUzLWI0OGEtNmRiMWMwODBlOTk2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib0FvdlQ3OFB5K25XVWdZdXBvVWhpVG9DRnBnZlQ3SjZ0THNcL0pGT2FmMnFMK3lWSGhZQmdsQ0VTYklOdlRJRjcifQ==
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
bnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDE5IDM6MjIgUE0KPlRvOiBpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hh
bmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+Owo+U2hhcm1hLCBTaGFzaGFuayA8c2hh
c2hhbmsuc2hhcm1hQGludGVsLmNvbT4KPlN1YmplY3Q6IFtQQVRDSCB2MiAzLzZdIGRybTogQWRk
IERpc3BsYXlQb3J0IGNvbG9yc3BhY2UgcHJvcGVydHkKPgo+SW4gb3JkZXIgdG8gdXNlIGNvbG9y
c3BhY2UgcHJvcGVydHkgdG8gRGlzcGxheSBQb3J0IGNvbm5lY3RvcnMsIGl0IGV4dGVuZHMKPkRS
TV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCBjb25uZWN0b3JfdHlwZSBvbgo+ZHJtX21vZGVf
Y3JlYXRlX2NvbG9yc3BhY2VfcHJvcGVydHkgZnVuY3Rpb24uCgpUaGUgY2hhbmdlcyBsb29rIGdv
b2QgdG8gbWUuClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PgoKPlNpZ25lZC1vZmYtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVs
LmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA0ICsrKy0KPiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYwo+aW5kZXggNGM3NjY2MjRiMjBkLi42NTVhZGE5ZDRjMTYgMTAwNjQ0Cj4t
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4rKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Nvbm5lY3Rvci5jCj5AQCAtMTcwMyw3ICsxNzAzLDkgQEAgaW50IGRybV9tb2RlX2Ny
ZWF0ZV9jb2xvcnNwYWNlX3Byb3BlcnR5KHN0cnVjdAo+ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQo+IAlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wOwo+Cj4gCWlmIChjb25uZWN0b3ItPmNvbm5l
Y3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSB8fAo+LQkgICAgY29ubmVjdG9y
LT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUIpIHsKPisJICAgIGNv
bm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlCIHx8Cj4r
CSAgICBjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNw
bGF5UG9ydCB8fAo+KwkgICAgY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9D
T05ORUNUT1JfZURQKSB7Cj4gCQlwcm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9lbnVtKGRldiwg
RFJNX01PREVfUFJPUF9FTlVNLAo+IAkJCQkJCSJDb2xvcnNwYWNlIiwKPiAJCQkJCQloZG1pX2Nv
bG9yc3BhY2VzLAo+LS0KPjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
