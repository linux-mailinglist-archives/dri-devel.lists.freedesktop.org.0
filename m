Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E26C483B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A556B6E8C5;
	Wed,  2 Oct 2019 07:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E689F06;
 Tue,  1 Oct 2019 09:11:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 02:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="205029276"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 02:11:35 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 12:11:34 +0300
Date: Tue, 1 Oct 2019 12:11:34 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20191001091134.GD2714@lahna.fi.intel.com>
References: <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
 <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
 <20190930163001.GX2714@lahna.fi.intel.com>
 <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
 <20191001084651.GC2714@lahna.fi.intel.com>
 <CACO55ts9ommYbA5g4=G+f0G=v90qGM7EsurU7AL7bU=PFzQMnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55ts9ommYbA5g4=G+f0G=v90qGM7EsurU7AL7bU=PFzQMnw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTA6NTY6MzlBTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDEsIDIwMTkgYXQgMTA6NDcgQU0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
U2VwIDMwLCAyMDE5IGF0IDA2OjM2OjEyUE0gKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+
ID4gT24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgNjozMCBQTSBNaWthIFdlc3RlcmJlcmcKPiA+ID4g
PG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDY6MDU6MTRQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+ID4gPiA+ID4gc3RpbGwgaGFwcGVucyB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZC4gVGhl
IG1hY2hpbmUgc2ltcGx5IGdldHMgc2h1dCBkb3duLgo+ID4gPiA+ID4KPiA+ID4gPiA+IGRtZXNn
IGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gPiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250
ZW50LmNvbS9rYXJvbGhlcmJzdC80MGViMDkxYzdiN2IzM2VmOTkzNTI1ZGU2NjBmMWEzYi9yYXcv
MjM4MGUzMWY1NjZlOTNlNWJhN2M4N2VmNTQ1NDIwOTY1ZDRjNDkyYy9naXN0ZmlsZTEudHh0Cj4g
PiA+ID4KPiA+ID4gPiBMb29raW5nIHlvdXIgZG1lc2c6Cj4gPiA+ID4KPiA+ID4gPiBTZXAgMzAg
MTc6MjQ6Mjcga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0IgdmVyc2lvbiA0
LjEKPiA+ID4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDog
RFJNOiBNTTogdXNpbmcgQ09QWSBmb3IgYnVmZmVyIGNvcGllcwo+ID4gPiA+IFNlcCAzMCAxNzoy
NDoyNyBrZXJuZWw6IFtkcm1dIEluaXRpYWxpemVkIG5vdXZlYXUgMS4zLjEgMjAxMjA4MDEgZm9y
IDAwMDA6MDE6MDAuMCBvbiBtaW5vciAxCj4gPiA+ID4KPiA+ID4gPiBJIHdvdWxkIGFzc3VtZSBp
dCBydW50aW1lIHN1c3BlbmRzIGhlcmUuIFRoZW4gaXQgd2FrZXMgdXAgYmVjYXVzZSBvZiBQQ0kK
PiA+ID4gPiBhY2Nlc3MgZnJvbSB1c2Vyc3BhY2U6Cj4gPiA+ID4KPiA+ID4gPiBTZXAgMzAgMTc6
MjQ6NDIga2VybmVsOiBwY2lfcmF3X3NldF9wb3dlcl9zdGF0ZTogNTYgY2FsbGJhY2tzIHN1cHBy
ZXNzZWQKPiA+ID4gPgo+ID4gPiA+IGFuZCBmb3Igc29tZSByZWFzb24gaXQgZG9lcyBub3QgZ2V0
IHJlc3VtZWQgcHJvcGVybHkuIFRoZXJlIGFyZSBhbHNvIGZldwo+ID4gPiA+IHdhcm5pbmdzIGZy
b20gQUNQSSB0aGF0IG1pZ2h0IGJlIHJlbGV2YW50Ogo+ID4gPiA+Cj4gPiA+ID4gU2VwIDMwIDE3
OjI0OjI3IGtlcm5lbDogQUNQSSBXYXJuaW5nOiBcX1NCLlBDSTAuR0ZYMC5fRFNNOiBBcmd1bWVu
dCAjNCB0eXBlIG1pc21hdGNoIC0gRm91bmQgW0J1ZmZlcl0sIEFDUEkgcmVxdWlyZXMgW1BhY2th
Z2VdICgyMDE5MDUwOS9uc2FyZ3VtZW50cy01OSkKPiA+ID4gPiBTZXAgMzAgMTc6MjQ6Mjcga2Vy
bmVsOiBBQ1BJIFdhcm5pbmc6IFxfU0IuUENJMC5QRUcwLlBFR1AuX0RTTTogQXJndW1lbnQgIzQg
dHlwZSBtaXNtYXRjaCAtIEZvdW5kIFtCdWZmZXJdLCBBQ1BJIHJlcXVpcmVzIFtQYWNrYWdlXSAo
MjAxOTA1MDkvbnNhcmd1bWVudHMtNTkpCj4gPiA+ID4KPiA+ID4KPiA+ID4gYWZhaWsgdGhpcyBp
cyB0aGUgY2FzZSBmb3IgZXNzZW50aWFsbHkgZXZlcnkgbGFwdG9wIG91dCB0aGVyZS4KPiA+Cj4g
PiBPSywgc28gdGhleSBhcmUgaGFybWxlc3M/Cj4gPgo+IAo+IHllcwo+IAo+ID4gPiA+IFRoaXMg
c2VlbXMgdG8gYmUgRGVsbCBYUFMgOTU2MCB3aGljaCBJIHRoaW5rIGhhcyBiZWVuIGFyb3VuZCBz
b21lIHRpbWUKPiA+ID4gPiBhbHJlYWR5IHNvIEkgd29uZGVyIHdoeSB3ZSBvbmx5IHNlZSBpc3N1
ZXMgbm93LiBIYXMgaXQgZXZlciB3b3JrZWQgZm9yCj4gPiA+ID4geW91IG9yIG1heWJlIHRoZXJl
IGlzIGEgcmVncmVzc2lvbiB0aGF0IGNhdXNlcyBpdCB0byBoYXBwZW4gbm93Pwo+ID4gPgo+ID4g
PiBvaCwgaXQncyBicm9rZW4gc2luY2UgZm9yZXZlciwgd2UganVzdCB0cmllZCB0byBnZXQgbW9y
ZSBpbmZvcm1hdGlvbgo+ID4gPiBmcm9tIE52aWRpYSBpZiB0aGV5IGtub3cgd2hhdCB0aGlzIGlz
IGFsbCBhYm91dCwgYnV0IHdlIGdvdCBub3RoaW5nCj4gPiA+IHVzZWZ1bC4KPiA+ID4KPiA+ID4g
V2Ugd2VyZSBhbHNvIGhvcGluZyB0byBmaW5kIGEgcmVsaWFibGUgZml4IG9yIHdvcmthcm91bmQg
d2UgY291bGQgaGF2ZQo+ID4gPiBpbnNpZGUgbm91dmVhdSB0byBmaXggdGhhdCBhcyBJIHRoaW5r
IG5vdXZlYXUgaXMgdGhlIG9ubHkgZHJpdmVyCj4gPiA+IGFjdHVhbGx5IGhpdCBieSB0aGlzIGlz
c3VlLCBidXQgbm90aGluZyB0dXJuZWQgb3V0IHRvIGJlIHJlbGlhYmxlCj4gPiA+IGVub3VnaC4K
PiA+Cj4gPiBDYW4ndCB5b3UganVzdCBibG9jayBydW50aW1lIFBNIGZyb20gdGhlIG5vdXZlYXUg
ZHJpdmVyIHVudGlsIHRoaXMgaXMKPiA+IHVuZGVyc3Rvb2QgYmV0dGVyPyBUaGF0IGNhbiBiZSBk
b25lIGJ5IGNhbGxpbmcgcG1fcnVudGltZV9mb3JiaWQoKSAob3IKPiA+IG5vdCBjYWxsaW5nIHBt
X3J1bnRpbWVfYWxsb3coKSBpbiB0aGUgZHJpdmVyKS4gT3IgaW4gY2FzZSBvZiBQQ0kgZHJpdmVy
Cj4gPiB5b3UganVzdCBkb24ndCBkZWNyZWFzZSB0aGUgcmVmZXJlbmNlIGNvdW50IHdoZW4gcHJv
YmUoKSBlbmRzLgo+ID4KPiAKPiB0aGUgdGhpbmcgaXMsIGl0IGRvZXMgd29yayBmb3IgYSBsb3Qg
b2YgbGFwdG9wcy4gV2UgY291bGQgb25seSBvYnNlcnZlCj4gdGhpcyBvbiBrYWJ5IGxha2UgYW5k
IHNreWxha2Ugb25lcy4gRXZlbiBvbiBDYW5ub24gTGFrZXMgaXQgc2VlbXMgdG8KPiB3b3JrIGp1
c3QgZmluZS4KCkNhbid0IHlvdSB0aGVuIGxpbWl0IGl0IHRvIHRob3NlPwoKSSd2ZSBleHBlcmll
bmNlZCB0aGF0IEthYnlsYWtlIHJvb3QgcG9ydHMgY2FuIGVudGVyIGFuZCBleGl0IGluIEQzY29s
ZApqdXN0IGZpbmUgYmVjYXVzZSB3ZSBkbyB0aGF0IGZvciBUaHVuZGVyYm9sdCBmb3IgZXhhbXBs
ZS4gQnV0IHRoYXQKYWx3YXlzIHJlcXVpcmVzIGhlbHAgZnJvbSBBQ1BJLiBJZiB0aGUgc3lzdGVt
IGlzIHVzaW5nIG5vbi1zdGFuZGFyZCBBQ1BJCm1ldGhvZHMgZm9yIGV4YW1wbGUgdGhhdCBtYXkg
cmVxdWlyZSBzb21lIHRyaWNrcyBpbiB0aGUgZHJpdmVyIHNpZGUuCgo+ID4gSSB0aGluayB0aGF0
IHdvdWxkIGJlIG11Y2ggYmV0dGVyIHRoYW4gYmxvY2tpbmcgYW55IGRldmljZXMgYmVoaW5kCj4g
PiBLYWJ5bGFrZSBQQ0llIHJvb3QgcG9ydHMgZnJvbSBlbnRlcmluZyBEMyAoSSBkb24ndCByZWFs
bHkgdGhpbmsgdGhlCj4gPiBwcm9ibGVtIGlzIGluIHRoZSByb290IHBvcnRzIGl0c2VsZiBidXQg
dGhlcmUgaXMgc29tZXRoaW5nIHdlIGFyZQo+ID4gbWlzc2luZyB3aGVuIHRoZSBOVklESUEgR1BV
IGlzIHB1dCBpbnRvIEQzY29sZCBvciBiYWNrIGZyb20gdGhlcmUpLgo+IAo+IEkgaGlnaGx5IGRv
dWJ0IHRoZXJlIGlzIGFueXRoaW5nIHdyb25nIHdpdGggdGhlIEdQVSBhbG9uZSBhcyB3ZSBoYXZl
Cj4gdG9vIG1hbnkgaW5kaWNhdGlvbnMgd2hpY2ggdGVsbCB1cyBvdGhlcndpc2UuCj4gCj4gQW55
d2F5LCBhdCB0aGlzIHBvaW50IEkgZG9uJ3Qga25vdyB3aGVyZSB0byBsb29rIGZ1cnRoZXIgZm9y
IHdoYXQncwo+IGFjdHVhbGx5IHdyb25nLiBBbmQgYXBwYXJlbnRseSBpdCB3b3JrcyBvbiBXaW5k
b3dzLCBidXQgSSBkb24ndCBrbm93Cj4gd2h5IGFuZCBJIGhhdmUgbm8gaWRlYSB3aGF0IFdpbmRv
d3MgZG9lcyBvbiBzdWNoIHN5c3RlbXMgdG8gbWFrZSBpdAo+IHdvcmsgcmVsaWFibHkuCgpCeSB3
b3JrcyB5b3UgbWVhbiB0aGF0IFdpbmRvd3MgaXMgYWJsZSB0byBwdXQgaXQgaW50byBEM2NvbGQg
YW5kIGJhY2s/CklmIHRoYXQncyB0aGUgY2FzZSBpdCBtYXkgYmUgdGhhdCB0aGVyZSBpcyBzb21l
IEFDUEkgbWFnaWMgdGhhdCB0aGUKV2luZG93cyBkcml2ZXIgZG9lcyBhbmQgd2Ugb2YgY291cnNl
IGFyZSBtaXNzaW5nIGluIExpbnV4LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
