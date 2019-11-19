Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33E103034
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C1D6EA1B;
	Tue, 19 Nov 2019 23:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA446E8B5;
 Tue, 19 Nov 2019 16:32:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 08:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,218,1571727600"; d="scan'208";a="381065906"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 19 Nov 2019 08:32:17 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iX6QK-0007p2-7T; Tue, 19 Nov 2019 18:32:16 +0200
Date: Tue, 19 Nov 2019 18:32:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/3] drm/i915 / LPSS / mfd: Select correct PWM controller
 to use based on VBT
Message-ID: <20191119163216.GI32742@smile.fi.intel.com>
References: <20191119151818.67531-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119151818.67531-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDQ6MTg6MTVQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSBBbGwsCj4gCj4gVGhpcyBzZXJpZXMgbmVlZHMgdG8gYmUgbWVyZ2VkIHRocm91
Z2ggYSBzaW5nbGUgdHJlZSwgdG8ga2VlcCB0aGluZ3MKPiBiaXNlY3RhYmxlLiBJIGhhdmUgZXZl
biBjb25zaWRlcmVkIGp1c3Qgc3F1YXNoaW5nIGFsbCAzIHBhdGNoZXMgaW50byAxLAo+IGJ1dCBo
YXZpbmcgc2VwYXJhdGUgY29tbWl0cyBzZWVtcyBiZXR0ZXIsIGJ1dCB0aGF0IGRvZXMgbGVhZCB0
byBhbgo+IGludGVybWVkaWF0ZSBzdGF0ZSB3aGVyZSB0aGUgYmFja2xpZ2h0IHN5c2ZzIGludGVy
ZmFjZSB3aWxsIGJlIGJyb2tlbgo+IChhbmQgZml4ZWQgMiBjb21taXRzIGxhdGVyKS4gU2VlIGJl
bG93IGZvciBzb21lIGJhY2tncm91bmQgaW5mby4KPiAKPiBUaGUgY2hhbmdlcyB0byBkcml2ZXJz
L2FjcGkvYWNwaV9scHNzLmMgYW5kIGRyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2NvcmUuYwo+
IGFyZSBxdWl0ZSBzbWFsbCBhbmQgc2hvdWxkIG5vdCBsZWFkIHRvIGFueSBjb25mbGljdHMsIHNv
IEkgYmVsaWV2ZSB0aGF0Cj4gaXQgd291bGQgYmUgYmVzdCB0byBtZXJnZSB0aGlzIGVudGlyZSBz
ZXJpZXMgdGhyb3VnaCB0aGUgZHJtLWludGVsIHRyZWUuCj4gCj4gTGVlLCBtYXkgSSBoYXZlIHlv
dXIgQWNrZWQtYnkgZm9yIG1lcmdpbmcgdGhlIG1mZCBjaGFuZ2UgdGhyb3VnaCB0aGUKPiBkcm0t
aW50ZWwgdHJlZT8KPiAKPiBSYWZhZWwsIG1heSBJIGhhdmUgeW91ciBBY2tlZC1ieSBmb3IgbWVy
Z2luZyB0aGUgYWNwaV9scHNzIGNoYW5nZSB0aHJvdWdoIHRoZQo+IGRybS1pbnRlbCB0cmVlPwo+
IAoKRW50aXJlIHNlcmllcyAob3IgYSBzaW5nbGUgcGF0Y2gpIG1ha2VzIHNlbnNlIHRvIG1lLgpU
aGFua3MgZm9yIGZpeGluZyB0aGlzIG9sZCBoYXJkd2FyZSEKCkZXSVcsClJldmlld2VkLWJ5OiBB
bmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KCj4gUmVn
YXJkcywKPiAKPiBIYW5zCj4gCj4gcC5zLgo+IAo+IFRoZSBwcm9taXNlZCBiYWNrZ3JvdW5kIGlu
Zm86Cj4gCj4gV2UgaGF2ZSB0aGlzIGxvbmcgc3RhbmRpbmcgaXNzdWUgd2hlcmUgaW5zdGVhZCBv
ZiBsb29raW5nIGluIHRoZSBpOTE1Cj4gVkJUIChWaWRlbyBCSU9TIFRhYmxlKSB0byBzZWUgaWYg
d2Ugc2hvdWxkIHVzZSB0aGUgUFdNIGJsb2NrIG9mIHRoZSBTb0MKPiBvciBvZiB0aGUgUE1JQyB0
byBjb250cm9sIHRoZSBiYWNrbGlnaHQgb2YgYSBEU0kgcGFuZWwsIHdlIHJlbHkgb24KPiBkcml2
ZXJzL2FjcGkvYWNwaV9scHNzLmMgYW5kL29yIGRyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2Nv
cmUuYwo+IHJlZ2lzdGVyaW5nIGEgcHdtIHdpdGggdGhlIGdlbmVyaWMgbmFtZSBvZiAicHdtX2Jh
Y2tsaWdodCIgYW5kIHRoZW4gdGhlCj4gaTkxNSBwYW5lbCBjb2RlIGRvZXMgYSBwd21fZ2V0KGRl
diwgInB3bV9iYWNrbGlnaHQiKS4KPiAKPiBXZSBoYXZlIHNvbWUgaGV1cmlzdGljcyBpbiBkcml2
ZXJzL2FjcGkvYWNwaV9scHNzLmMgdG8gbm90IHJlZ2lzdGVyIHRoZQo+IGxvb2t1cCBpZiBhIENy
eXN0YWwgQ292ZSBQTUlDIGlzIHByZXNlbmQgYW5kIHRoZSBtZmQvaW50ZWxfc29jX3BtaWNfY29y
ZS5jCj4gY29kZSBzaW1wbHkgYXNzdW1lcyB0aGF0IHNpbmNlIHRoZXJlIGlzIGEgUE1JQyB0aGUg
UE1JQyBQV00gYmxvY2sgd2lsbAo+IGJlIHVzZWQuIEJhc2ljYWxseSB3ZSBhcmUgd2luZ2luZyBp
dC4KPiAKPiBSZWNlbnRseSBJJ3ZlIGxlYXJuZWQgYWJvdXQgMiBkaWZmZXJlbnQgQllUIGRldmlj
ZXM6Cj4gUG9pbnQgb2YgVmlldyBNT0JJSSBUQUItUDgwMFcKPiBBY2VyIFN3aXRjaCAxMCBTVzUt
MDEyCj4gCj4gV2hpY2ggdXNlIGEgQ3J5c3RhbCBDb3ZlIFBNSUMsIHlldCB0aGUgTENEIGlzIGNv
bm5lY3RlZCB0byB0aGUgU29DL0xQU1MKPiBQV00gY29udHJvbGxlciAoYW5kIHRoZSBWQlQgY29y
cmVjdGx5IGluZGljYXRlcyB0aGlzKSwgc28gaGVyZSBvdXIgb2xkCj4gaGV1cmlzdGljcyBmYWls
Lgo+IAo+IFRoaXMgc2VyaWVzIHJlbmFtcyB0aGUgUFdNIGxvb2t1cHMgcmVnaXN0ZXJlZCBieSB0
aGUgTFBTUyAvCj4gaW50ZWxfc29jX3BtaWNfY29yZS5jIGNvZGUgZnJvbSAicHdtX2JhY2tsaWdo
dCIgdG8gInB3bV9zb2NfYmFja2xpZ2h0IiByZXNwLgo+ICJwd21fcG1pY19iYWNrbGlnaHQiIGFu
ZCBpbiB0aGUgTFBTUyBjYXNlIGFsc28gZHJvcHBpbmcgdGhlIGhldXJpc3RpY3Mgd2hlbgo+IHRv
IHJlZ2lzdGVyIHRoZSBsb29rdXAuIFRoaXMgY29tYmluZWQgd2l0aCB0ZWFjaGluZyB0aGUgaTkx
NSBwYW5lbCB0byBjYWxsCj4gcHdtX2dldCBmb3IgdGhlIHJpZ2h0IGxvb2t1cC1uYW1lIGRlcGVu
ZGluZyBvbiB0aGUgVkJUIGJpdHMgcmVzb2x2ZXMgdGhpcy4KPiAKCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
