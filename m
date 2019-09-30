Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C563C238C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5356E461;
	Mon, 30 Sep 2019 14:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A526E056;
 Mon, 30 Sep 2019 09:29:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 02:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; d="scan'208";a="204793408"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 30 Sep 2019 02:29:35 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 30 Sep 2019 12:29:34 +0300
Date: Mon, 30 Sep 2019 12:29:34 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20190930092934.GT2714@lahna.fi.intel.com>
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 30 Sep 2019 14:43:56 +0000
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MTU6NDhBTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDEwOjA1IEFNIE1pa2EgV2VzdGVyYmVyZwo+
IDxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBLYXJv
bCwKPiA+Cj4gPiBPbiBGcmksIFNlcCAyNywgMjAxOSBhdCAxMTo1Mzo0OFBNICswMjAwLCBLYXJv
bCBIZXJic3Qgd3JvdGU6Cj4gPiA+ID4gV2hhdCBleGFjdGx5IGlzIHRoZSBzZXJpb3VzIGlzc3Vl
PyAgSSBndWVzcyBpdCdzIHRoYXQgdGhlIHJlc2Nhbgo+ID4gPiA+IGRvZXNuJ3QgZGV0ZWN0IHRo
ZSBHUFUsIHdoaWNoIG1lYW5zIGl0J3Mgbm90IHJlc3BvbmRpbmcgdG8gY29uZmlnCj4gPiA+ID4g
YWNjZXNzZXM/ICBJcyB0aGVyZSBhbnkgdGltaW5nIGNvbXBvbmVudCBoZXJlLCBlLmcuLCBtYXli
ZSB3ZSdyZQo+ID4gPiA+IG1pc3Npbmcgc29tZSBkZWxheSBsaWtlIHRoZSBvbmVzIE1pa2EgaXMg
YWRkaW5nIHRvIHRoZSByZXNldCBwYXRocz8KPiA+ID4KPiA+ID4gV2hlbiBJIHdhcyBjaGVja2lu
ZyB1cCBvbiBzb21lIG9mIHRoZSBQQ0kgcmVnaXN0ZXJzIG9mIHRoZSBicmlkZ2UKPiA+ID4gY29u
dHJvbGxlciwgdGhlIHNsb3QgZGV0ZWN0aW9uIHRvbGQgbWUgdGhhdCB0aGVyZSBpcyBubyBkZXZp
Y2UKPiA+ID4gcmVjb2duaXplZCBhbnltb3JlLiBJIGRvbid0IGtub3cgd2hpY2ggcmVnaXN0ZXIg
aXQgd2FzIGFueW1vcmUsIHRob3VnaAo+ID4gPiBJIGd1ZXNzIG9uZSBjb3VsZCByZWFkIGl0IHVw
IGluIHRoZSBTb0Mgc3BlYyBkb2N1bWVudCBieSBJbnRlbC4KPiA+ID4KPiA+ID4gTXkgZ3Vlc3Mg
aXMsIHRoYXQgdGhlIGJyaWRnZSBjb250cm9sbGVyIGZhaWxzIHRvIGRldGVjdCB0aGUgR1BVIGJl
aW5nCj4gPiA+IGhlcmUgb3IgYWN0aXZlbHkgdGhyZXcgaXQgb2YgdGhlIGJ1cyBvciBzb21ldGhp
bmcuIEJ1dCBhIG5vcm1hbCBzeXN0ZW0KPiA+ID4gc3VzcGVuZC9yZXN1bWUgY3ljbGUgYnJpbmdz
IHRoZSBHUFUgYmFjayBvbmxpbmUgKGRvaW5nIGEgcmVzY2FuIHZpYQo+ID4gPiBzeXNmcyBnZXRz
IHRoZSBkZXZpY2UgZGV0ZWN0ZWQgYWdhaW4pCj4gPgo+ID4gQ2FuIHlvdSBlbGFib3JhdGUgYSBi
aXQgd2hhdCBraW5kIG9mIHNjZW5hcmlvIHRoZSBpc3N1ZSBoYXBwZW5zIChlLmcKPiA+IHN0ZXBz
IGhvdyBpdCByZXByb2R1Y2VzKT8gSXQgd2FzIG5vdCAxMDAlIGNsZWFyIGZyb20gdGhlIGNoYW5n
ZWxvZy4gQWxzbwo+ID4gd2hhdCB0aGUgcmVzdWx0IHdoZW4gdGhlIGZhaWx1cmUgaGFwcGVucz8K
PiA+Cj4gCj4geWVhaCwgSSBhbHJlYWR5IGhhdmUgYW4gdXBkYXRlZCBwYXRjaCBpbiB0aGUgd29y
a3Mgd2hpY2ggYWxzbyBkb2VzIHRoZQo+IHJld29yayBCam9ybiBzdWdnZXN0ZWQuIEhhZCBubyB0
aW1lIHlldCB0byB0ZXN0IGlmIEkgZGlkbid0IG1lc3MgaXQKPiB1cC4KPiAKPiBJIGFtIGFsc28g
dGhpbmtpbmcgb2YgYWRkaW5nIGEga2VybmVsIHBhcmFtZXRlciB0byBlbmFibGUgdGhpcwo+IHdv
cmthcm91bmQgb24gZGVtYW5kLCBidXQgbm90IHF1aXRlIHN1cmUgb24gdGhhdCBvbmUgeWV0LgoK
UmlnaHQsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBmaWd1cmUgb3V0IHRoZSByb290IGNh
dXNlIGJlZm9yZQphZGRpbmcgYW55IHdvcmthcm91bmRzIDstKSBJdCBtaWdodCB2ZXJ5IHdlbGwg
YmUgdGhhdCB3ZSBhcmUganVzdAptaXNzaW5nIHNvbWV0aGluZyB0aGUgUENJZSBzcGVjIHJlcXVp
cmVzIGJ1dCBub3QgaW1wbGVtZW50ZWQgaW4gTGludXguCgo+ID4gSSBzZWUgdGhlcmUgaXMgYSBz
Y3JpcHQgdGhhdCBkb2VzIHNvbWV0aGluZyBidXQgdW5mb3J0dW5hdGVseSBJJ20gbm90Cj4gPiBm
bHVlbnQgaW4gUHl0aG9uIHNvIGNhbid0IGV4dHJhY3QgdGhlIHN0ZXBzIGhvdyB0aGUgaXNzdWUg
Y2FuIGJlCj4gPiByZXByb2R1Y2VkIDstKQo+ID4KPiA+IE9uZSB0aGluZyB0aGF0IEknbSB3b3Jr
aW5nIG9uIGlzIHRoYXQgTGludXggUENJIHN1YnN5c3RlbSBtaXNzZXMgY2VydGFpbgo+ID4gZGVs
YXlzIHRoYXQgYXJlIG5lZWRlZCBhZnRlciBEM2NvbGQgLT4gRDAgdHJhbnNpdGlvbiwgb3RoZXJ3
aXNlIHRoZQo+ID4gZGV2aWNlIGFuZC9vciBsaW5rIG1heSBub3QgYmUgcmVhZHkgYmVmb3JlIHdl
IGFjY2VzcyBpdC4gV2hhdCB5b3UgYXJlCj4gPiBleHBlcmllbmNpbmcgc291bmRzIHNpbWlsYXIu
IEkgd29uZGVyIGlmIHlvdSBjb3VsZCB0cnkgdGhlIGZvbGxvd2luZwo+ID4gcGF0Y2ggYW5kIHNl
ZSBpZiBpdCBtYWtlcyBhbnkgZGlmZmVyZW5jZT8KPiA+Cj4gPiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExMTA2NjExLwo+IAo+IEkgdGhpbmsgSSBhbHJlYWR5IHRyaWVkIHRo
aXMgcGF0aC4gVGhlIHByb2JsZW0gaXNuJ3QgdGhhdCB0aGUgZGV2aWNlCj4gaXNuJ3QgYWNjZXNz
aWJsZSB0b28gbGF0ZSwgYnV0IHRoYXQgaXQgc2VlbXMgdGhhdCB0aGUgZGV2aWNlCj4gY29tcGxl
dGVseSBmYWxscyBvZmYgdGhlIGJ1cy4gQnV0IEkgY2FuIHJldGVzdCBhZ2FpbiBqdXN0IHRvIGJl
IHN1cmUuCgpZZXMsIHBsZWFzZSB0cnkgaXQgYW5kIHNoYXJlIGZ1bGwgZG1lc2cgaWYvd2hlbiB0
aGUgZmFpbHVyZSBzdGlsbCBoYXBwZW5zLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
