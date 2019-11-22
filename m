Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83110766A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 18:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C1C6E42E;
	Fri, 22 Nov 2019 17:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ED56E128;
 Fri, 22 Nov 2019 17:25:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="219530153"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 22 Nov 2019 09:25:40 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2019 19:25:39 +0200
Date: Fri, 22 Nov 2019 19:25:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/rect: Keep the clipped dst rectangle
 in place
Message-ID: <20191122172539.GP1208@intel.com>
References: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
 <20191120162512.12484-2-ville.syrjala@linux.intel.com>
 <20191120164340.GS30416@phenom.ffwll.local>
 <20191120171138.GI1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120171138.GI1208@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDc6MTE6MzhQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA1OjQzOjQwUE0gKzAxMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAwNjoyNToxMlBNICsw
MjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+ID4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiAKPiA+ID4gTm93IHRoYXQgd2UndmUg
Y29uc3RyYWluZWQgdGhlIGNsaXBwZWQgc291cmNlIHJlY3RhbmdsZSBzdWNoCj4gPiA+IHRoYXQg
aXQgY2FuJ3QgaGF2ZSBuZWdhdGl2ZSBkaW1lbnNpb25zIGRvaW5nIHRoZSBzYW1lIGZvciB0aGUK
PiA+ID4gZHN0IHJlY3RhbmdsZSBzZWVtcyBhcHByb3ByaWF0ZS4gU2hvdWxkIGF0IGxlYXN0IHJl
c3VsdCBpbgo+ID4gPiB0aGUgY2xpcHBlZCBzcmMgYW5kIGRzdCByZWN0YW5nbGVzIGJlaW5nIGEg
Yml0IG1vcmUgY29uc2lzdGVudAo+ID4gPiB3aXRoIGVhY2ggb3RoZXIuCj4gPiA+IAo+ID4gPiBD
YzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiA+ID4gQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gPiAKPiA+IHNlbGZ0ZXN0cyBmb3IgdGhpcyBzdHVmZj8gTG9va3MgbGlrZSB0
aGUgcHJpbWUgZXhhbXBsZSwgd3JpdGUgdGVzdGNhc2UKPiA+IHByb3ZpbmcgY29kZSBpcyBidXN0
ZWQsIGZpeCBpdCwgZXZlcnlvbmUgY2VsZWJyYXRlPwo+IAo+IFllYWgsIHNlZW1zIGxpa2UgYSBn
b29kIGlkZWEuIFRob3VnaCBJJ2xsIGhhdmUgdG8gZmlndXJlIG91dCBpZiBpdCdzCj4gYWN0dWFs
bHkgYnJva2VuIG9yIG5vdCA7KQoKSSAqdGhpbmsqIHRoZSBvbmx5IHByb2JsZW0gaXMgdGhhdCB0
aGUgY2xpcCBjYW4gcmVzdWx0IGluIGEgdmlzaWJsZQpzb3VyY2UgcmVjdGFuZ2xlIHdoZW4gdGhp
cyBoYXBwZW5zLiBUaGUgZHN0IHJlY3RhbmdsZSB3aWxsIHN0aWxsCmJlIGNvcnJlY3RseSBpbnZp
c2libGUgc28gaG9wZWZ1bGx5IG5vdCBhIGJpZyBkZWFsLiBCdXQgSSBndWVzcyB3ZQptaWdodCBh
cyB3ZWxsIGZpeCBpdCwgYW5kIEkgY2FuIGRvIGEgc2VsZnRlc3Qgd2hpY2ggbWFrZXMgc3VyZQpi
b3RoIHNyYyBhbmQgZHN0IGNvbWUgb3V0IGludmlzaWJsZS4KCj4gCj4gSG1tLiBPdWNoLiBUaGVy
ZSdzIHNlZW1zIHRvIGJlIGEgZGl2IGJ5IHplcm8gbHVya2luZyBpbiB0aGVyZSBpZgo+IGRzdF93
L2ggPT0gMC4gSSB3b25kZXIgd2h5IG5vdGhpbmcgaGFzIGhpdCB0aGF0LgoKRGVmaW5pdGVseSBy
ZWFsLiBJJ2xsIGZpeCBpdCBhbmQgdG9zcyBpbiBhIHNlbGZ0ZXN0LgoKLS0gClZpbGxlIFN5cmrD
pGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
