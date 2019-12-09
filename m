Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440F11703F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A216E4A5;
	Mon,  9 Dec 2019 15:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CDA6E4A5;
 Mon,  9 Dec 2019 15:21:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 07:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,296,1571727600"; d="scan'208";a="202860936"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 09 Dec 2019 07:21:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Dec 2019 17:21:24 +0200
Date: Mon, 9 Dec 2019 17:21:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 04/11] drm/i915: Don't WARN on HDCP toggle if
 get_hw_state returns false
Message-ID: <20191209152124.GR1208@intel.com>
References: <20191203173638.94919-1-sean@poorly.run>
 <20191203173638.94919-5-sean@poorly.run>
 <20191205193935.GL1208@intel.com>
 <20191206135233.GD162979@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206135233.GD162979@art_vandelay>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ramalingm.c@intel.com,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMDYsIDIwMTkgYXQgMDg6NTI6MzNBTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDA5OjM5OjM1UE0gKzAyMDAsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToKPiA+IE9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDEyOjM2OjI3UE0gLTA1MDAs
IFNlYW4gUGF1bCB3cm90ZToKPiA+ID4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+Cj4gPiA+IAo+ID4gPiBOb3cgdGhhdCB3ZSBjYW4gcmVseSBvbiB0cmFuc2NvZGVyIGRp
c2FibGUgdG8gdG9nZ2xlIHNpZ25hbGxpbmcgb2ZmLAo+ID4gPiBpdCdzIGxlc3Mgb2YgYSBjYXRh
c3Ryb3BoZSBpZiBnZXRfaHdfc3RhdGUoKSByZXR1cm5zIGZhbHNlLgo+ID4gPiAKPiA+ID4gT25j
ZSB3ZSBlbmFibGUgTVNULCB0aGlzIHdpbGwgYmUgYSB2YWxpZCBleGl0IHBhdGggYW5kIHdlIHdh
bnQgdG8gbWFrZQo+ID4gPiBzdXJlIHdlJ3JlIG5vdCBzcGFtbWluZyB0aGUgbG9ncyBuZWVkbGVz
c2x5Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kZGkuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RkaS5jCj4gPiA+IGluZGV4IGU4YWM5OGE4ZWU3Zi4uY2EyODkxM2E0YzlmIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPiA+ID4gQEAg
LTE5ODMsNyArMTk4Myw3IEBAIGludCBpbnRlbF9kZGlfdG9nZ2xlX2hkY3Bfc2lnbmFsbGluZyhz
dHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciwKPiA+ID4gIAlpZiAoV0FSTl9PTigh
d2FrZXJlZikpCj4gPiA+ICAJCXJldHVybiAtRU5YSU87Cj4gPiA+ICAKPiA+ID4gLQlpZiAoV0FS
Tl9PTighaW50ZWxfZW5jb2Rlci0+Z2V0X2h3X3N0YXRlKGludGVsX2VuY29kZXIsICZwaXBlKSkp
IHsKPiA+ID4gKwlpZiAoIWludGVsX2VuY29kZXItPmdldF9od19zdGF0ZShpbnRlbF9lbmNvZGVy
LCAmcGlwZSkpIHsKPiA+IAo+ID4gSG93IGNhbiB0aGlzIGdldCBjYWxsZWQgd2hlbiB0aGUgZW5j
b2RlciBpcyBub3QgZW5hYmxlZD8KPiA+IEZlZWxzIGxpa2UgdGhpcyB3aG9sZSB0aGluZyBpcyB0
cnlpbmcgdG8gcGFwZXIgb3ZlciBzb21lCj4gPiBiaWdnZXIgYnVnIGluIHRoZSBoZGNwIGNvZGUu
Cj4gCj4gSW4gdGhlIE1TVCBwYXRjaCwgSSd2ZSBhZGRlZCBhIGNhbGwgdG8gaW50ZWxfaGRjcF9k
aXNhYmxlKCkgaW4gdGhlIGNvbm5lY3Rvcgo+IGRlc3Ryb3kgcGF0aC4gVXN1YWxseSB0b2dnbGlu
ZyB3aWxsIGJlIGRpc2FibGVkIGFzIHBhcnQgb2YgdGhlIGNoZWNrX2xpbmsgY2FsbAo+IHRoYXQg
aXMgaW5pdGlhdGVkIG9uIHVucGx1Zywgc28gaW4gdGhlIGRlc3Ryb3kgcGF0aCBpdCdzIG5vbi1l
c3NlbnRpYWwgdG8gZG8KPiB0aGlzIGFnYWluLgoKQ2FuJ3Qgd2UganVzdCBsZWF2ZSB0aGluZ3Mg
YmUgdW50aWwgdXNlcnNwYWNlIGRpc2FibGVzIHRoZSB0aGluZz8KSWYgbm90LCB0aGVuIHdlIHNo
b3VsZCBrbm93IHdoZXRoZXIgaGRjcCBpcyBzdGlsbCBlbmFibGVkLiBBbmQgaWYKaGRjcCBpcyBl
bmFibGVkIHNvIGlzIHRoZSBlbmNvZGVyLCB0aHVzIHdlIGRvbid0IG5lZWQgc3VjaCBzaWxseQpj
aGVja3MuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
