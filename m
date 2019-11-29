Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7310DDB8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D36E115;
	Sat, 30 Nov 2019 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC06E9BF;
 Fri, 29 Nov 2019 20:07:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 12:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,258,1571727600"; d="scan'208";a="411065291"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2019 12:07:40 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iamYF-0000um-KR; Fri, 29 Nov 2019 22:07:39 +0200
Date: Fri, 29 Nov 2019 22:07:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/2] drm/i915/vlv_dsi: Control panel and backlight enable
 GPIOs on BYT
Message-ID: <20191129200739.GB32742@smile.fi.intel.com>
References: <20191129185836.2789-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129185836.2789-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
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
Cc: linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDc6NTg6MzRQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSBBbGwsCj4gCj4gT24gQmF5IFRyYWlsIGRldmljZXMgdGhlIE1JUEkgcG93ZXIg
b24vb2ZmIHNlcXVlbmNlcyBmb3IgRFNJIExDRCBwYW5lbHMKPiBkbyBub3QgY29udHJvbCB0aGUg
TENEIHBhbmVsLSBhbmQgYmFja2xpZ2h0LWVuYWJsZSBHUElPcy4gU28gZmFyLCB3aGVuCj4gdGhl
IFZCVCBpbmRpY2F0ZXMgd2Ugc2hvdWxkIHVzZSB0aGUgU29DIGZvciBiYWNrbGlnaHQgY29udHJv
bCwgd2UgaGF2ZQo+IGJlZW4gcmVseWluZyBvbiB0aGVzZSBHUElPcyBiZWluZyBjb25maWd1cmVk
IGFzIG91dHB1dCBhbmQgZHJpdmVuIGhpZ2ggYnkKPiB0aGUgVmlkZW8gQklPUyAoR09QKSB3aGVu
IGl0IGluaXRpYWxpemVzIHRoZSBwYW5lbC4KPiAKPiBUaGlzIGRvZXMgbm90IHdvcmsgd2hlbiB0
aGUgZGV2aWNlIGlzIGJvb3RlZCB3aXRoIGEgSERNSSBtb25pdG9yIGNvbm5lY3RlZAo+IGFzIHRo
ZW4gdGhlIEdPUCB3aWxsIGluaXRpYWxpemUgdGhlIEhETUkgaW5zdGVhZCBvZiB0aGUgcGFuZWws
IGxlYXZpbmcgdGhlCj4gcGFuZWwgYmxhY2ssIGV2ZW4gdGhvdWdoIHRoZSBpOTE1IGRyaXZlciB0
cmllcyB0byBvdXRwdXQgYW4gaW1hZ2UgdG8gaXQuCj4gCj4gTGlrZXdpc2Ugb24gc29tZSBkZXZp
Y2UtbW9kZWxzIHdoZW4gdGhlIEdPUCBkb2VzIG5vdCBpbml0aWFsaXplIHRoZSBEU0kKPiBwYW5l
bCBpdCBhbHNvIGxlYXZlcyB0aGUgbXV4IG9mIHRoZSBQV00wIHBpbiBpbiBnZW5lcmljIEdQSU8g
bW9kZSBpbnN0ZWFkCj4gb2YgbXV4aW5nIGl0IHRvIHRoZSBQV00gY29udHJvbGxlci4KPiAKPiBU
aGlzIHNlcmllcyBjb250YWlucyAyIHBhdGNoZXMgd2hpY2ggdG9nZXRoZXIgZml4IHRoaXMuCj4g
Cj4gVG8gYXZvaWQgbmV3IGVycm9ycyBpbiB0aGUgaW50ZWwtZ2Z4IENJIChhc3N1bWluZyB0aGVy
ZSBpcyBhdGxlYXN0IDEKPiBCWVQgZGV2aWNlIHRoZXJlIHdpdGggYSBEU0kgcGFuZWwpLCB3ZSBu
ZWVkIGJvdGggb2YgdGhlc2UgcGF0Y2hlcyB0bwo+IGJlIG1lcmdlZCB0aHJvdWdoIHRoZSBkcm0t
aW50ZWwgdHJlZS4KPiAKPiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzIHNvbWUgY2h1cm4gY3VycmVu
dGx5IGdvaW5nIG9uIGluIHRoZQo+IHBpbmN0cmwtYmF5dHJhaWwuYyBjb2RlLCBidXQgbm90IGlu
IHRoZSBwYXJ0IG9mIHRoZSBmaWxlIHdoaWNoIHRoaXMKPiB0b3VjaGVzLCBzbyBtZXJnaW5nIHRo
ZSBwaW5jdHJsLWJheXRyYWlsLmMgY2hhbmdlcyB0aHJvdWdoIHRoZQo+IGRybS1pbnRlbCB0cmVl
IHNob3VsZCBub3QgbGVhZCB0byBjb25mbGljdHMgbGF0ZXIuCj4gCj4gQW5keSwgTWlrYSwgYXNz
dW1pbmcgeW91IGFyZSBoYXBweSB3aXRoIHRoZSBjaGFuZ2VzLCBjYW4gSSBnZXQgeW91ciBhY2sK
PiBmb3IgbWVyZ2luZyB0aGUgcGluY3RybC1iYXl0cmFpbCBwYXRjaCB0aHJvdWdodCB0aGUgZHJt
LWludGVvbCB0cmVlPwoKSSdtIG5vdCBva2F5IHdpdGggdGhpcy4gSSB3aWxsIHRlbGwgbW9yZSBu
ZXh0IHdlZWsgaG93IEkgc2VlIHRoaXMgdG8gYmUKaW1wbGVtZW50ZWQgaW4gYSBiZXR0ZXIgd2F5
LgoKSGFwcHkgQmxhY2sgRnJpZGF5ISA6LSkKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBT
aGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
