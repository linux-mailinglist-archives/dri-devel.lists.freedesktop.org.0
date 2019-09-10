Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E2DAE4C6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 09:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085676E83C;
	Tue, 10 Sep 2019 07:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0206E83C;
 Tue, 10 Sep 2019 07:42:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 00:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="189262102"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 10 Sep 2019 00:42:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Sep 2019 10:42:53 +0300
Date: Tue, 10 Sep 2019 10:42:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Message-ID: <20190910074253.GZ7482@intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
 <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
 <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
 <CAKb7UviqX5G2s-YJeXULe1Cg0oO1+auQZpONUbbm0JsQccfwHQ@mail.gmail.com>
 <7f4e42bdaaf50390314ee8e9c4f94183df1bd0a1.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f4e42bdaaf50390314ee8e9c4f94183df1bd0a1.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDc6MzQ6MzFBTSArMDAwMCwgTXVuLCBHd2FuLWd5ZW9u
ZyB3cm90ZToKPiBPbiBTYXQsIDIwMTktMDktMDcgYXQgMjE6NDMgLTA0MDAsIElsaWEgTWlya2lu
IHdyb3RlOgo+ID4gT24gU2F0LCBTZXAgNywgMjAxOSBhdCA3OjIwIFBNIE11biwgR3dhbi1neWVv
bmcKPiA+IDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gT24gRnJpLCAy
MDE5LTA5LTA2IGF0IDA5OjI0IC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+ID4gPiBPbiBG
cmksIFNlcCA2LCAyMDE5IGF0IDc6NDMgQU0gVmlsbGUgU3lyasOkbMOkCj4gPiA+ID4gPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSwgU2VwIDA2
LCAyMDE5IGF0IDExOjMxOjU1QU0gKzAwMDAsIFNoYW5rYXIsIFVtYSB3cm90ZToKPiA+ID4gPiA+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gPiA+IEZyb206IElsaWEg
TWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KPiA+ID4gPiA+ID4gPiBTZW50OiBUdWVzZGF5
LCBTZXB0ZW1iZXIgMywgMjAxOSA2OjEyIFBNCj4gPiA+ID4gPiA+ID4gVG86IE11biwgR3dhbi1n
eWVvbmcgPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Cj4gPiA+ID4gPiA+ID4gQ2M6IEludGVs
IEdyYXBoaWNzIERldmVsb3BtZW50IDwKPiA+ID4gPiA+ID4gPiBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiA+ID4gPiA7IFNoYW5rYXIsIFVtYQo+ID4gPiA+ID4gPiA+
IDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBkcmktZGV2ZWwgPAo+ID4gPiA+ID4gPiA+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Cj4gPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCAzLzddIGRybTogQWRkIERpc3BsYXlQb3J0IGNvbG9yc3BhY2UKPiA+ID4gPiA+ID4g
PiBwcm9wZXJ0eQo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFNvIGhvdyB3b3VsZCB0aGlz
IHdvcmsgd2l0aCBhIERQKysgY29ubmVjdG9yPyBTaG91bGQgaXQKPiA+ID4gPiA+ID4gPiBsaXN0
Cj4gPiA+ID4gPiA+ID4gdGhlIEhETUkgb3IgRFAKPiA+ID4gPiA+ID4gPiBwcm9wZXJ0aWVzPyBP
ciBkbyB3ZSBuZWVkIGEgY3VzdG9tIHByb3BlcnR5IGNoZWNrZXIgd2hpY2gKPiA+ID4gPiA+ID4g
PiBpcwo+ID4gPiA+ID4gPiA+IGF3YXJlIG9mIHdoYXQgaXMKPiA+ID4gPiA+ID4gPiBjdXJyZW50
bHkgcGx1Z2dlZCBpbiB0byB2YWxpZGF0ZSB0aGUgdmFsdWVzPwo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gQUZBSVUgRm9yIERQKysgY2FzZXMsIHdlIGRldGVjdCB3aGF0IGtpbmQgb2Ygc2luayBp
dHMgZHJpdmluZwo+ID4gPiA+ID4gPiBEUAo+ID4gPiA+ID4gPiBvciBIRE1JICh3aXRoIGEgcGFz
c2l2ZSBkb25nbGUpLgo+ID4gPiA+ID4gPiBCYXNlZCBvbiB0aGUgdHlwZSBvZiBzaW5rIGRldGVj
dGVkLCB3ZSBzaG91bGQgZXhwb3NlIERQIG9yCj4gPiA+ID4gPiA+IEhETUkKPiA+ID4gPiA+ID4g
Y29sb3JzcGFjZXMgdG8gdXNlcnNwYWNlLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGb3IgaTkxNSBE
UCBjb25uZWN0b3IgYWx3YXlzIGRyaXZlcyBEUCBtb2RlLCBIRE1JIGNvbm5lY3Rvcgo+ID4gPiA+
ID4gYWx3YXlzCj4gPiA+ID4gPiBkcml2ZXMKPiA+ID4gPiA+IEhETUkgbW9kZSwgZXZlbiB3aGVu
IHRoZSBwaHlzaWNhbCBjb25uZWN0b3IgaXMgRFArKy4KPiA+ID4gPiAKPiA+ID4gPiBSaWdodCwg
aTkxNSBjcmVhdGVzIDIgY29ubmVjdG9ycywgd2hpbGUgbm91dmVhdSwgcmFkZW9uLCBhbmQKPiA+
ID4gPiBhbWRncHUKPiA+ID4gPiBjcmVhdGUgMSBjb25uZWN0b3IgKG5vdCBzdXJlIGFib3V0IG90
aGVyIGRyaXZlcnMpIGZvciBhIHNpbmdsZQo+ID4gPiA+IHBoeXNpY2FsIERQKysgc29ja2V0LiBT
aW5jZSB3ZSBzdXBwbHkgdGhlIGxpc3Qgb2YgdmFsaWQgdmFsdWVzIGF0Cj4gPiA+ID4gdGhlCj4g
PiA+ID4gdGltZSBvZiBjcmVhdGluZyB0aGUgY29ubmVjdG9yLCB3ZSBjYW4ndCBrbm93IGF0IHRo
YXQgcG9pbnQKPiA+ID4gPiB3aGV0aGVyCj4gPiA+ID4gaW4KPiA+ID4gPiB0aGUgZnV0dXJlIGEg
SERNSSBvciBEUCB3aWxsIGJlIHBsdWdnZWQgaW50byBpdC4KPiA+ID4gPiAKPiA+ID4gPiAgIC1p
bGlhCj4gPiA+IElsaWEsIGRvZXMgaXQgbWVhbiB0aGF0IHRoZSBkcm1fY29ubmVjdG9yIHR5cGUg
aXMKPiA+ID4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IGFuZCBwcm90b2NvbCBpcyBE
UCsrIG1vZGU/Cj4gPiAKPiA+IFRoYXQgaXMgY29ycmVjdC4gVGhlIGNvbm5lY3RvciB0eXBlIGlz
ICJEaXNwbGF5UG9ydCIgaW4gc3VjaCBhIGNhc2UuCj4gPiAKPiA+IENoZWVycywKPiA+IAo+ID4g
ICAtaWxpYQo+IAo+IEZvciBub3cgZHJtX21vZGVfY3JlYXRlX2NvbG9yc3BhY2VfcHJvcGVydHko
KSBpcyBvbmx5IHVzZWQgZm9yIGk5MTUuCj4gSU1ITywgd2hlbiBvdGhlciBkcml2ZXJzICggbm91
dmVhdSwgcmFkZW9uLCBhbmQgYW1kZ3B1ICkgYXJlIHJlYWR5IGZvcgo+IHVzaW5nIG9mIGRybV9t
b2RlX2NyZWF0ZV9jb2xvcnNwYWNlX3Byb3BlcnR5KCksCj4gd2hhdCBhYm91dCBkbyB3ZSBhZGQg
YSB2YXJpYWJsZSB3aGljaCBjYW4gaWRlbnRpZnkgRFArKyBhbmQgRFAgdG8KPiBkcm1fY29ubmVj
dG9yPwo+IEFuZCB3aGVuIHRoZSBkcml2ZXJzIChub3V2ZWF1LCByYWRlb24sIGFuZCBhbWRncHUp
IGRldGVjdCB0aGUgY3VycmVudAo+IHByb3RvY29sLCB0aGUgZHJpdmVycyB3aWxsIHNldCB0aGUg
dmFyaWFibGUuCgpJTU8gYmV0dGVyIHRvIGp1c3QgaGF2ZSB0d28gZnVuY3Rpb25zIGluIHRoYXQg
Y2FzZTogb25lIGZvciBEUCwgYW5vdGhlcgpmb3IgSERNSS4KCi0tIApWaWxsZSBTeXJqw6Rsw6QK
SW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
