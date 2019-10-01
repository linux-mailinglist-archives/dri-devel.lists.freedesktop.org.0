Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67AFC4839
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE216E8BA;
	Wed,  2 Oct 2019 07:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F56E59D;
 Tue,  1 Oct 2019 08:46:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 01:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="205026256"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 01:46:52 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 11:46:51 +0300
Date: Tue, 1 Oct 2019 11:46:51 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20191001084651.GC2714@lahna.fi.intel.com>
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
 <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
 <20190930163001.GX2714@lahna.fi.intel.com>
 <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
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

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDY6MzY6MTJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDY6MzAgUE0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
U2VwIDMwLCAyMDE5IGF0IDA2OjA1OjE0UE0gKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+
ID4gc3RpbGwgaGFwcGVucyB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZC4gVGhlIG1hY2hpbmUgc2lt
cGx5IGdldHMgc2h1dCBkb3duLgo+ID4gPgo+ID4gPiBkbWVzZyBjYW4gYmUgZm91bmQgaGVyZToK
PiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC80MGVi
MDkxYzdiN2IzM2VmOTkzNTI1ZGU2NjBmMWEzYi9yYXcvMjM4MGUzMWY1NjZlOTNlNWJhN2M4N2Vm
NTQ1NDIwOTY1ZDRjNDkyYy9naXN0ZmlsZTEudHh0Cj4gPgo+ID4gTG9va2luZyB5b3VyIGRtZXNn
Ogo+ID4KPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBE
Uk06IERDQiB2ZXJzaW9uIDQuMQo+ID4gU2VwIDMwIDE3OjI0OjI3IGtlcm5lbDogbm91dmVhdSAw
MDAwOjAxOjAwLjA6IERSTTogTU06IHVzaW5nIENPUFkgZm9yIGJ1ZmZlciBjb3BpZXMKPiA+IFNl
cCAzMCAxNzoyNDoyNyBrZXJuZWw6IFtkcm1dIEluaXRpYWxpemVkIG5vdXZlYXUgMS4zLjEgMjAx
MjA4MDEgZm9yIDAwMDA6MDE6MDAuMCBvbiBtaW5vciAxCj4gPgo+ID4gSSB3b3VsZCBhc3N1bWUg
aXQgcnVudGltZSBzdXNwZW5kcyBoZXJlLiBUaGVuIGl0IHdha2VzIHVwIGJlY2F1c2Ugb2YgUENJ
Cj4gPiBhY2Nlc3MgZnJvbSB1c2Vyc3BhY2U6Cj4gPgo+ID4gU2VwIDMwIDE3OjI0OjQyIGtlcm5l
bDogcGNpX3Jhd19zZXRfcG93ZXJfc3RhdGU6IDU2IGNhbGxiYWNrcyBzdXBwcmVzc2VkCj4gPgo+
ID4gYW5kIGZvciBzb21lIHJlYXNvbiBpdCBkb2VzIG5vdCBnZXQgcmVzdW1lZCBwcm9wZXJseS4g
VGhlcmUgYXJlIGFsc28gZmV3Cj4gPiB3YXJuaW5ncyBmcm9tIEFDUEkgdGhhdCBtaWdodCBiZSBy
ZWxldmFudDoKPiA+Cj4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBBQ1BJIFdhcm5pbmc6IFxf
U0IuUENJMC5HRlgwLl9EU006IEFyZ3VtZW50ICM0IHR5cGUgbWlzbWF0Y2ggLSBGb3VuZCBbQnVm
ZmVyXSwgQUNQSSByZXF1aXJlcyBbUGFja2FnZV0gKDIwMTkwNTA5L25zYXJndW1lbnRzLTU5KQo+
ID4gU2VwIDMwIDE3OjI0OjI3IGtlcm5lbDogQUNQSSBXYXJuaW5nOiBcX1NCLlBDSTAuUEVHMC5Q
RUdQLl9EU006IEFyZ3VtZW50ICM0IHR5cGUgbWlzbWF0Y2ggLSBGb3VuZCBbQnVmZmVyXSwgQUNQ
SSByZXF1aXJlcyBbUGFja2FnZV0gKDIwMTkwNTA5L25zYXJndW1lbnRzLTU5KQo+ID4KPiAKPiBh
ZmFpayB0aGlzIGlzIHRoZSBjYXNlIGZvciBlc3NlbnRpYWxseSBldmVyeSBsYXB0b3Agb3V0IHRo
ZXJlLgoKT0ssIHNvIHRoZXkgYXJlIGhhcm1sZXNzPwoKPiA+IFRoaXMgc2VlbXMgdG8gYmUgRGVs
bCBYUFMgOTU2MCB3aGljaCBJIHRoaW5rIGhhcyBiZWVuIGFyb3VuZCBzb21lIHRpbWUKPiA+IGFs
cmVhZHkgc28gSSB3b25kZXIgd2h5IHdlIG9ubHkgc2VlIGlzc3VlcyBub3cuIEhhcyBpdCBldmVy
IHdvcmtlZCBmb3IKPiA+IHlvdSBvciBtYXliZSB0aGVyZSBpcyBhIHJlZ3Jlc3Npb24gdGhhdCBj
YXVzZXMgaXQgdG8gaGFwcGVuIG5vdz8KPiAKPiBvaCwgaXQncyBicm9rZW4gc2luY2UgZm9yZXZl
ciwgd2UganVzdCB0cmllZCB0byBnZXQgbW9yZSBpbmZvcm1hdGlvbgo+IGZyb20gTnZpZGlhIGlm
IHRoZXkga25vdyB3aGF0IHRoaXMgaXMgYWxsIGFib3V0LCBidXQgd2UgZ290IG5vdGhpbmcKPiB1
c2VmdWwuCj4gCj4gV2Ugd2VyZSBhbHNvIGhvcGluZyB0byBmaW5kIGEgcmVsaWFibGUgZml4IG9y
IHdvcmthcm91bmQgd2UgY291bGQgaGF2ZQo+IGluc2lkZSBub3V2ZWF1IHRvIGZpeCB0aGF0IGFz
IEkgdGhpbmsgbm91dmVhdSBpcyB0aGUgb25seSBkcml2ZXIKPiBhY3R1YWxseSBoaXQgYnkgdGhp
cyBpc3N1ZSwgYnV0IG5vdGhpbmcgdHVybmVkIG91dCB0byBiZSByZWxpYWJsZQo+IGVub3VnaC4K
CkNhbid0IHlvdSBqdXN0IGJsb2NrIHJ1bnRpbWUgUE0gZnJvbSB0aGUgbm91dmVhdSBkcml2ZXIg
dW50aWwgdGhpcyBpcwp1bmRlcnN0b29kIGJldHRlcj8gVGhhdCBjYW4gYmUgZG9uZSBieSBjYWxs
aW5nIHBtX3J1bnRpbWVfZm9yYmlkKCkgKG9yCm5vdCBjYWxsaW5nIHBtX3J1bnRpbWVfYWxsb3co
KSBpbiB0aGUgZHJpdmVyKS4gT3IgaW4gY2FzZSBvZiBQQ0kgZHJpdmVyCnlvdSBqdXN0IGRvbid0
IGRlY3JlYXNlIHRoZSByZWZlcmVuY2UgY291bnQgd2hlbiBwcm9iZSgpIGVuZHMuCgpJIHRoaW5r
IHRoYXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgdGhhbiBibG9ja2luZyBhbnkgZGV2aWNlcyBiZWhp
bmQKS2FieWxha2UgUENJZSByb290IHBvcnRzIGZyb20gZW50ZXJpbmcgRDMgKEkgZG9uJ3QgcmVh
bGx5IHRoaW5rIHRoZQpwcm9ibGVtIGlzIGluIHRoZSByb290IHBvcnRzIGl0c2VsZiBidXQgdGhl
cmUgaXMgc29tZXRoaW5nIHdlIGFyZQptaXNzaW5nIHdoZW4gdGhlIE5WSURJQSBHUFUgaXMgcHV0
IGludG8gRDNjb2xkIG9yIGJhY2sgZnJvbSB0aGVyZSkuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
