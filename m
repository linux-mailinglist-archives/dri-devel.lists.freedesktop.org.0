Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E0102853
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5AB6E982;
	Tue, 19 Nov 2019 15:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EED6E4D4;
 Tue, 19 Nov 2019 15:43:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 07:43:15 -0800
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; d="scan'208";a="200388766"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 07:43:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Rafael J .
 Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Lee Jones
 <lee.jones@linaro.org>
Subject: Re: [PATCH 0/3] drm/i915 / LPSS / mfd: Select correct PWM controller
 to use based on VBT
In-Reply-To: <20191119151818.67531-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191119151818.67531-1-hdegoede@redhat.com>
Date: Tue, 19 Nov 2019 17:43:07 +0200
Message-ID: <87pnhnyir8.fsf@intel.com>
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
Cc: linux-acpi@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gSGkgQWxsLAo+Cj4gVGhpcyBzZXJpZXMgbmVlZHMgdG8gYmUgbWVyZ2VkIHRocm91
Z2ggYSBzaW5nbGUgdHJlZSwgdG8ga2VlcCB0aGluZ3MKPiBiaXNlY3RhYmxlLiBJIGhhdmUgZXZl
biBjb25zaWRlcmVkIGp1c3Qgc3F1YXNoaW5nIGFsbCAzIHBhdGNoZXMgaW50byAxLAo+IGJ1dCBo
YXZpbmcgc2VwYXJhdGUgY29tbWl0cyBzZWVtcyBiZXR0ZXIsIGJ1dCB0aGF0IGRvZXMgbGVhZCB0
byBhbgo+IGludGVybWVkaWF0ZSBzdGF0ZSB3aGVyZSB0aGUgYmFja2xpZ2h0IHN5c2ZzIGludGVy
ZmFjZSB3aWxsIGJlIGJyb2tlbgo+IChhbmQgZml4ZWQgMiBjb21taXRzIGxhdGVyKS4gU2VlIGJl
bG93IGZvciBzb21lIGJhY2tncm91bmQgaW5mby4KPgo+IFRoZSBjaGFuZ2VzIHRvIGRyaXZlcnMv
YWNwaS9hY3BpX2xwc3MuYyBhbmQgZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNfY29yZS5jCj4g
YXJlIHF1aXRlIHNtYWxsIGFuZCBzaG91bGQgbm90IGxlYWQgdG8gYW55IGNvbmZsaWN0cywgc28g
SSBiZWxpZXZlIHRoYXQKPiBpdCB3b3VsZCBiZSBiZXN0IHRvIG1lcmdlIHRoaXMgZW50aXJlIHNl
cmllcyB0aHJvdWdoIHRoZSBkcm0taW50ZWwgdHJlZS4KPgo+IExlZSwgbWF5IEkgaGF2ZSB5b3Vy
IEFja2VkLWJ5IGZvciBtZXJnaW5nIHRoZSBtZmQgY2hhbmdlIHRocm91Z2ggdGhlCj4gZHJtLWlu
dGVsIHRyZWU/Cj4KPiBSYWZhZWwsIG1heSBJIGhhdmUgeW91ciBBY2tlZC1ieSBmb3IgbWVyZ2lu
ZyB0aGUgYWNwaV9scHNzIGNoYW5nZSB0aHJvdWdoIHRoZQo+IGRybS1pbnRlbCB0cmVlPwo+Cj4g
UmVnYXJkcywKPgo+IEhhbnMKPgo+IHAucy4KPgo+IFRoZSBwcm9taXNlZCBiYWNrZ3JvdW5kIGlu
Zm86Cj4KPiBXZSBoYXZlIHRoaXMgbG9uZyBzdGFuZGluZyBpc3N1ZSB3aGVyZSBpbnN0ZWFkIG9m
IGxvb2tpbmcgaW4gdGhlIGk5MTUKPiBWQlQgKFZpZGVvIEJJT1MgVGFibGUpIHRvIHNlZSBpZiB3
ZSBzaG91bGQgdXNlIHRoZSBQV00gYmxvY2sgb2YgdGhlIFNvQwo+IG9yIG9mIHRoZSBQTUlDIHRv
IGNvbnRyb2wgdGhlIGJhY2tsaWdodCBvZiBhIERTSSBwYW5lbCwgd2UgcmVseSBvbgo+IGRyaXZl
cnMvYWNwaS9hY3BpX2xwc3MuYyBhbmQvb3IgZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNfY29y
ZS5jCj4gcmVnaXN0ZXJpbmcgYSBwd20gd2l0aCB0aGUgZ2VuZXJpYyBuYW1lIG9mICJwd21fYmFj
a2xpZ2h0IiBhbmQgdGhlbiB0aGUKPiBpOTE1IHBhbmVsIGNvZGUgZG9lcyBhIHB3bV9nZXQoZGV2
LCAicHdtX2JhY2tsaWdodCIpLgo+Cj4gV2UgaGF2ZSBzb21lIGhldXJpc3RpY3MgaW4gZHJpdmVy
cy9hY3BpL2FjcGlfbHBzcy5jIHRvIG5vdCByZWdpc3RlciB0aGUKPiBsb29rdXAgaWYgYSBDcnlz
dGFsIENvdmUgUE1JQyBpcyBwcmVzZW5kIGFuZCB0aGUgbWZkL2ludGVsX3NvY19wbWljX2NvcmUu
Ywo+IGNvZGUgc2ltcGx5IGFzc3VtZXMgdGhhdCBzaW5jZSB0aGVyZSBpcyBhIFBNSUMgdGhlIFBN
SUMgUFdNIGJsb2NrIHdpbGwKPiBiZSB1c2VkLiBCYXNpY2FsbHkgd2UgYXJlIHdpbmdpbmcgaXQu
Cj4KPiBSZWNlbnRseSBJJ3ZlIGxlYXJuZWQgYWJvdXQgMiBkaWZmZXJlbnQgQllUIGRldmljZXM6
Cj4gUG9pbnQgb2YgVmlldyBNT0JJSSBUQUItUDgwMFcKPiBBY2VyIFN3aXRjaCAxMCBTVzUtMDEy
Cj4KPiBXaGljaCB1c2UgYSBDcnlzdGFsIENvdmUgUE1JQywgeWV0IHRoZSBMQ0QgaXMgY29ubmVj
dGVkIHRvIHRoZSBTb0MvTFBTUwo+IFBXTSBjb250cm9sbGVyIChhbmQgdGhlIFZCVCBjb3JyZWN0
bHkgaW5kaWNhdGVzIHRoaXMpLCBzbyBoZXJlIG91ciBvbGQKPiBoZXVyaXN0aWNzIGZhaWwuCj4K
PiBUaGlzIHNlcmllcyByZW5hbXMgdGhlIFBXTSBsb29rdXBzIHJlZ2lzdGVyZWQgYnkgdGhlIExQ
U1MgLwo+IGludGVsX3NvY19wbWljX2NvcmUuYyBjb2RlIGZyb20gInB3bV9iYWNrbGlnaHQiIHRv
ICJwd21fc29jX2JhY2tsaWdodCIgcmVzcC4KPiAicHdtX3BtaWNfYmFja2xpZ2h0IiBhbmQgaW4g
dGhlIExQU1MgY2FzZSBhbHNvIGRyb3BwaW5nIHRoZSBoZXVyaXN0aWNzIHdoZW4KPiB0byByZWdp
c3RlciB0aGUgbG9va3VwLiBUaGlzIGNvbWJpbmVkIHdpdGggdGVhY2hpbmcgdGhlIGk5MTUgcGFu
ZWwgdG8gY2FsbAo+IHB3bV9nZXQgZm9yIHRoZSByaWdodCBsb29rdXAtbmFtZSBkZXBlbmRpbmcg
b24gdGhlIFZCVCBiaXRzIHJlc29sdmVzIHRoaXMuCgpIYW5zLCB0aGFua3MgZm9yIHlvdXIgY29u
dGludWVkIGVmZm9ydHMgaW4gZGlnZ2luZyBpbnRvIHRoZSBib3R0b20gb2YKdGhpcyEKCkknbSBz
dXJlIHRoZXJlIGFyZSBhIG51bWJlciBvZiByZWxhdGVkIGJ1Z3Mgc3RpbGwgb3BlbiBhdCBmZG8g
YnVnemlsbGEuCgpJdCBhbGwgbWFrZXMgc2Vuc2UsCgpBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KCmZvciBtZXJnaW5nIHRocm91Z2ggd2hpY2hldmVyIHRyZWUu
CgoKVGhhbmtzLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3Jh
cGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
