Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8321172A9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 18:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D656E500;
	Mon,  9 Dec 2019 17:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778896E4FE;
 Mon,  9 Dec 2019 17:22:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 09:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,296,1571727600"; d="scan'208";a="210171453"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 09 Dec 2019 09:22:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Dec 2019 19:22:25 +0200
Date: Mon, 9 Dec 2019 19:22:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 04/11] drm/i915: Don't WARN on HDCP toggle if
 get_hw_state returns false
Message-ID: <20191209172225.GW1208@intel.com>
References: <20191203173638.94919-1-sean@poorly.run>
 <20191203173638.94919-5-sean@poorly.run>
 <20191205193935.GL1208@intel.com>
 <20191206135233.GD162979@art_vandelay>
 <20191209152124.GR1208@intel.com>
 <CAMavQKLROAneH7P+jXUUtdcSSvGjYyz_SE-zeFzYzoZokZFBrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMavQKLROAneH7P+jXUUtdcSSvGjYyz_SE-zeFzYzoZokZFBrQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ramalingm.c@intel.com,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMTE6MTY6MjdBTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIE1vbiwgRGVjIDksIDIwMTkgYXQgMTA6MjEgQU0gVmlsbGUgU3lyasOkbMOkCj4gPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIERlYyAw
NiwgMjAxOSBhdCAwODo1MjozM0FNIC0wNTAwLCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiA+IE9uIFRo
dSwgRGVjIDA1LCAyMDE5IGF0IDA5OjM5OjM1UE0gKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90
ZToKPiA+ID4gPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAxMjozNjoyN1BNIC0wNTAwLCBTZWFu
IFBhdWwgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVt
Lm9yZz4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBOb3cgdGhhdCB3ZSBjYW4gcmVseSBvbiB0cmFuc2Nv
ZGVyIGRpc2FibGUgdG8gdG9nZ2xlIHNpZ25hbGxpbmcgb2ZmLAo+ID4gPiA+ID4gaXQncyBsZXNz
IG9mIGEgY2F0YXN0cm9waGUgaWYgZ2V0X2h3X3N0YXRlKCkgcmV0dXJucyBmYWxzZS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBPbmNlIHdlIGVuYWJsZSBNU1QsIHRoaXMgd2lsbCBiZSBhIHZhbGlkIGV4
aXQgcGF0aCBhbmQgd2Ugd2FudCB0byBtYWtlCj4gPiA+ID4gPiBzdXJlIHdlJ3JlIG5vdCBzcGFt
bWluZyB0aGUgbG9ncyBuZWVkbGVzc2x5Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDIgKy0KPiA+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMK
PiA+ID4gPiA+IGluZGV4IGU4YWM5OGE4ZWU3Zi4uY2EyODkxM2E0YzlmIDEwMDY0NAo+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+ID4gPiA+
ID4gQEAgLTE5ODMsNyArMTk4Myw3IEBAIGludCBpbnRlbF9kZGlfdG9nZ2xlX2hkY3Bfc2lnbmFs
bGluZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciwKPiA+ID4gPiA+ICAgaWYg
KFdBUk5fT04oIXdha2VyZWYpKQo+ID4gPiA+ID4gICAgICAgICAgIHJldHVybiAtRU5YSU87Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gLSBpZiAoV0FSTl9PTighaW50ZWxfZW5jb2Rlci0+Z2V0X2h3X3N0
YXRlKGludGVsX2VuY29kZXIsICZwaXBlKSkpIHsKPiA+ID4gPiA+ICsgaWYgKCFpbnRlbF9lbmNv
ZGVyLT5nZXRfaHdfc3RhdGUoaW50ZWxfZW5jb2RlciwgJnBpcGUpKSB7Cj4gPiA+ID4KPiA+ID4g
PiBIb3cgY2FuIHRoaXMgZ2V0IGNhbGxlZCB3aGVuIHRoZSBlbmNvZGVyIGlzIG5vdCBlbmFibGVk
Pwo+ID4gPiA+IEZlZWxzIGxpa2UgdGhpcyB3aG9sZSB0aGluZyBpcyB0cnlpbmcgdG8gcGFwZXIg
b3ZlciBzb21lCj4gPiA+ID4gYmlnZ2VyIGJ1ZyBpbiB0aGUgaGRjcCBjb2RlLgo+ID4gPgo+ID4g
PiBJbiB0aGUgTVNUIHBhdGNoLCBJJ3ZlIGFkZGVkIGEgY2FsbCB0byBpbnRlbF9oZGNwX2Rpc2Fi
bGUoKSBpbiB0aGUgY29ubmVjdG9yCj4gPiA+IGRlc3Ryb3kgcGF0aC4gVXN1YWxseSB0b2dnbGlu
ZyB3aWxsIGJlIGRpc2FibGVkIGFzIHBhcnQgb2YgdGhlIGNoZWNrX2xpbmsgY2FsbAo+ID4gPiB0
aGF0IGlzIGluaXRpYXRlZCBvbiB1bnBsdWcsIHNvIGluIHRoZSBkZXN0cm95IHBhdGggaXQncyBu
b24tZXNzZW50aWFsIHRvIGRvCj4gPiA+IHRoaXMgYWdhaW4uCj4gPgo+ID4gQ2FuJ3Qgd2UganVz
dCBsZWF2ZSB0aGluZ3MgYmUgdW50aWwgdXNlcnNwYWNlIGRpc2FibGVzIHRoZSB0aGluZz8KPiAK
PiBUaGUgY29ubmVjdG9yIGRpc2FwcGVhcnMsIHNvIHVzZXJzcGFjZSB3b24ndCBiZSBhYmxlIHRv
IGRpc2FibGUgaXQuCgpUaGF0IHdvdWxkIG1ha2UgZXZlcnl0aGluZyBicm9rZW4uIFRoZSBjb25u
ZWN0b3Igc2hvdWxkIGhhbmcgYXJvdW5kCmFzIGEgem9tYmllIHVudGlsIHRoZSBsYXN0IHVzZXIg
ZGlzYXBwZWFycy4KCj4gCj4gPiBJZiBub3QsIHRoZW4gd2Ugc2hvdWxkIGtub3cgd2hldGhlciBo
ZGNwIGlzIHN0aWxsIGVuYWJsZWQuIEFuZCBpZgo+ID4gaGRjcCBpcyBlbmFibGVkIHNvIGlzIHRo
ZSBlbmNvZGVyLCB0aHVzIHdlIGRvbid0IG5lZWQgc3VjaCBzaWxseQo+ID4gY2hlY2tzLgo+IAo+
IEFscmlnaHQsIEknbGwgbG9vayBhdCB0YWtpbmcgdGhpcyBhbmdsZS4KPiAKPiBTZWFuCj4gCj4g
Pgo+ID4gLS0KPiA+IFZpbGxlIFN5cmrDpGzDpAo+ID4gSW50ZWwKCi0tIApWaWxsZSBTeXJqw6Rs
w6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
