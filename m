Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D485371276
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB33896E5;
	Tue, 23 Jul 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7DC89BD2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:06:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 09:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="174264795"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga006.jf.intel.com with ESMTP; 22 Jul 2019 09:06:03 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hpap9-00072x-7M; Mon, 22 Jul 2019 19:06:03 +0300
Date: Mon, 22 Jul 2019 19:06:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data
 handling
Message-ID: <20190722160603.GY9224@smile.fi.intel.com>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-3-brgl@bgdev.pl>
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDI6NTdQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IE5vdyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0gZGF0YSAo
c2ggZWNvdmVjMjQpIGRlZmluZXMgYSBwcm9wZXIKPiBHUElPIGxvb2t1cCBhbmQgc2V0cyB0aGUg
J2RlZmF1bHQtb24nIGRldmljZSBwcm9wZXJ0eSwgd2UgY2FuIGRyb3AgdGhlCj4gcGxhdGZvcm1f
ZGF0YS1zcGVjaWZpYyBHUElPIGhhbmRsaW5nIGFuZCB1bmlmeSBhIGJpZyBjaHVuayBvZiBjb2Rl
Lgo+IAo+IFRoZSBvbmx5IGZpZWxkIHVzZWQgZnJvbSB0aGUgcGxhdGZvcm0gZGF0YSBpcyBub3cg
dGhlIGZiZGV2IHBvaW50ZXIuCgo+IC1zdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlX2R0
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gLQkJCQkgICBzdHJ1Y3QgZ3Bpb19iYWNr
bGlnaHQgKmdibCkKPiAtewo+IC0Jc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiAt
CWVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7Cj4gLQlpbnQgcmV0Owo+IC0KPiAtCWdibC0+ZGVmX3Zh
bHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7Cj4gLQlm
bGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwo+
IC0KPiAtCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEwsIGZsYWdzKTsKPiAt
CWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKPiAtCQlyZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2Qp
Owo+IC0KPiAtCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKPiAtCQkJZGV2X2VycihkZXYs
Cj4gLQkJCQkiRXJyb3I6IFRoZSBncGlvcyBwYXJhbWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlk
LlxuIik7Cj4gLQkJfQo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuIDA7Cj4g
LX0KCldoeSBub3QgbGVhdmUgdGhpcyBmdW5jdGlvbiAocGVyaGFwcyB3aXRoIGRpZmZlcmVudCBu
YW1lKT8KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
