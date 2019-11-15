Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30FFE593
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC1A6EA4D;
	Fri, 15 Nov 2019 19:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78376EA4D;
 Fri, 15 Nov 2019 19:27:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="203661058"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 15 Nov 2019 11:27:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:27:05 +0200
Date: Fri, 15 Nov 2019 21:27:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH] drm/amdgpu/dm: Do not throw an error for a
 display with no audio
Message-ID: <20191115192705.GN1208@intel.com>
References: <20191114204413.457504-1-chris@chris-wilson.co.uk>
 <20191115100421.22fe2c1a@endymion>
 <CAKMK7uHp0LnTVD-_+ZktEkzxqgTUtXvCy+SbneGnnKOqYV+Udg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHp0LnTVD-_+ZktEkzxqgTUtXvCy+SbneGnnKOqYV+Udg@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MTg6MjZBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE5vdiAxNSwgMjAxOSBhdCAxMDowNCBBTSBKZWFuIERlbHZhcmUgPGpk
ZWx2YXJlQHN1c2UuZGU+IHdyb3RlOgo+ID4KPiA+IEhpIENocmlzLAo+ID4KPiA+IE9uIFRodSwg
MTQgTm92IDIwMTkgMjA6NDQ6MTMgKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+ID4gQW4g
b2xkIGRpc3BsYXkgd2l0aCBubyBhdWRpbyBtYXkgbm90IGhhdmUgYW4gRURJRCB3aXRoIGEgQ0VB
IGJsb2NrLCBvcgo+ID4gPiBpdCBtYXkgc2ltcGx5IGJlIHRvbyBvbGQgdG8gc3VwcG9ydCBhdWRp
by4gVGhpcyBpcyBub3QgYSBkcml2ZXIgZXJyb3IsCj4gPiA+IHNvIGRvbid0IGZsYWcgaXQgYXMg
c3VjaC4KPiA+ID4KPiA+ID4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcv
c2hvd19idWcuY2dpP2lkPTExMjE0MAo+ID4gPiBSZWZlcmVuY2VzOiBhZTJhMzQ5NTk3M2UgKCJk
cm0vYW1kOiBiZSBxdWlldCB3aGVuIG5vIFNBRCBibG9jayBpcyBmb3VuZCIpCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gPiBD
YzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gPiA+IENjOiBKZWFu
IERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuZGU+Cj4gPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgMiAtLQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMK
PiA+ID4gaW5kZXggMTFlNTc4NGFhNjJhLi4wNDgwOGRiZWNhYjMgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMu
Ywo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMKPiA+ID4gQEAgLTk3LDggKzk3LDYgQEAgZW51bSBkY19lZGlkX3N0YXR1
cyBkbV9oZWxwZXJzX3BhcnNlX2VkaWRfY2FwcygKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
IChzdHJ1Y3QgZWRpZCAqKSBlZGlkLT5yYXdfZWRpZCk7Cj4gPiA+Cj4gPiA+ICAgICAgIHNhZF9j
b3VudCA9IGRybV9lZGlkX3RvX3NhZCgoc3RydWN0IGVkaWQgKikgZWRpZC0+cmF3X2VkaWQsICZz
YWRzKTsKPiA+ID4gLSAgICAgaWYgKHNhZF9jb3VudCA8IDApCj4gPiA+IC0gICAgICAgICAgICAg
RFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNBRHM6ICVkXG4iLCBzYWRfY291bnQpOwo+ID4gPiAg
ICAgICBpZiAoc2FkX2NvdW50IDw9IDApCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJlc3Vs
dDsKPiA+ID4KPiA+Cj4gPiBJIHN0aWxsIGJlbGlldmUgdGhhdCBteSBhcHByb2FjaCB3YXMgYSBi
ZXR0ZXIgd2F5IHRvIHNvbHZlIHRoaXMgcHJvYmxlbToKPiA+Cj4gPiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzI5MDY2Lwo+ID4KPiA+IFlvdXIgYXBwcm9hY2ggd291
bGQgaGF2ZSB0byBiZSBhcHBsaWVkIHRvIGFsbCBpbmRpdmlkdWFsIGRyaXZlcnMgKGFsbAo+ID4g
Y2FsbGVycyBvZiBkcm1fZWRpZF90b19zYWQpLiBJdCBhbHNvIHByZXZlbnRzIHJlcG9ydGluZyBh
Y3R1YWwgZXJyb3JzLgo+ID4KPiA+IFNob3VsZCBJIHJlc2VuZCBteSBwYXRjaD8KPiAKPiBJIHRo
aW5rIHdlIGNhbiBkbyBib3RoLCBqdXN0IGFzayBWaWxsZSB0byBhcHBseSB0aGUgcGF0Y2ggZm9y
IHlvdSAoaGUKPiBoYXMgY29tbWl0IHJpZ2h0cyB0byBkcm0tbWlzYykuIE9yIHJlc2VuZCBhbmQg
dGhlbiBwaW5nIFZpbGxlIG9uIGlyYy4KCklkZWFsbHkgd291bGQgaGF2ZSBiZWVuIHNvbWV0aGlu
ZyBmb3IgQU1EIGZvbGtzIHNpbmNlIHRoZXkncmUgdGhlCm9ubHkgdXNlciBvZiB0aG9zZSBmdW5j
dGlvbnMgQUZBSUNTLiBCdXQgSSBqdXN0IHB1c2hlZCBpdCBhbnl3YXkuClRoYW5rcyBmb3IgdGhl
IHBhdGNoLgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
