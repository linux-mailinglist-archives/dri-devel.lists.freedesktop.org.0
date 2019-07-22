Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB467128B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC556E030;
	Tue, 23 Jul 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2E589D1D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:16:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 09:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="252950881"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga001.jf.intel.com with ESMTP; 22 Jul 2019 09:09:52 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hpaso-00075z-Qx; Mon, 22 Jul 2019 19:09:50 +0300
Date: Mon, 22 Jul 2019 19:09:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/7] backlight: gpio: simplify the driver
Message-ID: <20190722160950.GA9224@smile.fi.intel.com>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDI6NTVQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFdoaWxlIHdvcmtpbmcgb24gbXkgb3RoZXIgc2VyaWVzIHJlbGF0ZWQg
dG8gZ3Bpby1iYWNrbGlnaHRbMV0gSSBub3RpY2VkCj4gdGhhdCB3ZSBjb3VsZCBzaW1wbGlmeSB0
aGUgZHJpdmVyIGlmIHdlIG1hZGUgdGhlIG9ubHkgdXNlciBvZiBwbGF0Zm9ybQo+IGRhdGEgdXNl
IEdQSU8gbG9va3VwcyBhbmQgZGV2aWNlIHByb3BlcnRpZXMuIFRoaXMgc2VyaWVzIHRyaWVzIHRv
IGRvCj4gdGhhdC4KPiAKPiBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBhbGwgbmVjZXNzYXJ5IGRhdGEg
c3RydWN0dXJlcyB0byBlY292ZWMyNC4gUGF0Y2gKPiAyLzcgdW5pZmllcyBtdWNoIG9mIHRoZSBj
b2RlIGZvciBib3RoIHBkYXRhIGFuZCBub24tcGRhdGEgY2FzZXMuIFBhdGNoZXMKPiAzLTQvNyBy
ZW1vdmUgdW51c2VkIHBsYXRmb3JtIGRhdGEgZmllbGRzLiBMYXN0IHRocmVlIHBhdGNoZXMgY29u
dGFpbgo+IGFkZGl0aW9uYWwgaW1wcm92ZW1lbnRzIGZvciB0aGUgR1BJTyBiYWNrbGlnaHQgZHJp
dmVyIHdoaWxlIHdlJ3JlIGFscmVhZHkKPiBtb2RpZnlpbmcgaXQuCj4gCj4gSSBkb24ndCBoYXZl
IGFjY2VzcyB0byB0aGlzIEhXIGJ1dCBob3BlZnVsbHkgdGhpcyB3b3Jrcy4gT25seSBjb21waWxl
Cj4gdGVzdGVkLgo+IAo+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82LzI1LzkwMAoK
Rm9yIHVuY29tbWVudGVkIG9uZXMKUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgoKPiAKPiB2MSAtPiB2MjoKPiAtIHJlYmFzZWQg
b24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50IGNoYW5nZXMgZnJv
bSBBbmR5Cj4gLSBhZGRlZCBhZGRpdGlvbmFsIHR3byBwYXRjaGVzIHdpdGggbWlub3IgaW1wcm92
ZW1lbnRzCj4gCj4gQmFydG9zeiBHb2xhc3pld3NraSAoNyk6Cj4gICBzaDogZWNvdmVjMjQ6IGFk
ZCBhZGRpdGlvbmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKPiAgIGJhY2ts
aWdodDogZ3Bpbzogc2ltcGxpZnkgdGhlIHBsYXRmb3JtIGRhdGEgaGFuZGxpbmcKPiAgIHNoOiBl
Y292ZWMyNDogZG9uJ3Qgc2V0IHVudXNlZCBmaWVsZHMgaW4gcGxhdGZvcm0gZGF0YQo+ICAgYmFj
a2xpZ2h0OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKPiAg
IGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIGRldiBmcm9tIHN0cnVjdCBncGlvX2JhY2tsaWdodAo+
ICAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgZGVmX3ZhbHVlIGZyb20gc3RydWN0IGdwaW9fYmFj
a2xpZ2h0Cj4gICBiYWNrbGlnaHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBk
ZXYtPmRldgo+IAo+ICBhcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMgICAgICAg
ICB8IDMzICsrKysrKy0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMgICAgIHwgODcgKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9y
bV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAgMyAtCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5z
ZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKV2l0
aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
