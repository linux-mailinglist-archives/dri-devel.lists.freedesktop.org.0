Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C496D1147B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 20:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EEE6E99F;
	Thu,  5 Dec 2019 19:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692296E99D;
 Thu,  5 Dec 2019 19:33:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 11:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="214219966"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 05 Dec 2019 11:33:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Dec 2019 21:33:19 +0200
Date: Thu, 5 Dec 2019 21:33:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/i915: Disable HDCP signalling on
 transcoder disable
Message-ID: <20191205193319.GK1208@intel.com>
References: <20191203173638.94919-1-sean@poorly.run>
 <20191203173638.94919-4-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203173638.94919-4-sean@poorly.run>
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
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 ramalingm.c@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMTI6MzY6MjZQTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEN1cnJlbnRs
eSB3ZSByZWx5IG9uIGludGVsX2hkY3BfZGlzYWJsZSgpIHRvIGRpc2FibGUgSERDUCBzaWduYWxs
aW5nIGluCj4gdGhlIERESSBGdW5jdGlvbiBDb250cm9sIHJlZ2lzdGVyLiBUaGlzIHBhdGNoIGFk
ZHMgYSBzYWZldHkgbmV0IGJ5IGFsc28KPiBjbGVhcmluZyB0aGUgYml0IHdoZW4gd2UgZGlzYWJs
ZSB0aGUgdHJhbnNjb2Rlci4KPiAKPiBPbmNlIHdlIGhhdmUgSERDUCBvdmVyIE1TVCBhbmQgZGlz
YXBwZWFyaW5nIGNvbm5lY3RvcnMsIHdlIHdhbnQgdG8gbWFrZQo+IHN1cmUgdGhhdCB0aGUgc2ln
bmFsbGluZyBpcyB0cnVseSBkaXNhYmxlZCBldmVuIGlmIEhEQ1AgdGVhcmRvd24gZG9lc24ndAo+
IGdvIGFzIHBsYW5uZWQuCgpXaHkgd291bGRuJ3QgaXQgZ28gYXMgcGxhbm5lZD8KCj4gCj4gU2ln
bmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgfCAxMyArKysrKystLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCj4gaW5kZXggYjUxZjI0NGFk
N2E1Li5lOGFjOThhOGVlN2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kZGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMKPiBAQCAtMTk1MiwxMyArMTk1MiwxMiBAQCB2b2lkIGludGVsX2RkaV9kaXNhYmxl
X3RyYW5zY29kZXJfZnVuYyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZQo+ICAJaTkxNV9yZWdfdCByZWcgPSBUUkFOU19ERElfRlVOQ19DVEwoY3B1X3RyYW5zY29kZXIp
Owo+ICAJdTMyIHZhbCA9IEk5MTVfUkVBRChyZWcpOwo+ICAKPiAtCWlmIChJTlRFTF9HRU4oZGV2
X3ByaXYpID49IDEyKSB7Cj4gLQkJdmFsICY9IH4oVFJBTlNfRERJX0ZVTkNfRU5BQkxFIHwgVEdM
X1RSQU5TX0RESV9QT1JUX01BU0sgfAo+IC0JCQkgVFJBTlNfRERJX0RQX1ZDX1BBWUxPQURfQUxM
T0MpOwo+IC0JfSBlbHNlIHsKPiAtCQl2YWwgJj0gfihUUkFOU19ERElfRlVOQ19FTkFCTEUgfCBU
UkFOU19ERElfUE9SVF9NQVNLIHwKPiAtCQkJIFRSQU5TX0RESV9EUF9WQ19QQVlMT0FEX0FMTE9D
KTsKPiAtCX0KPiArCXZhbCAmPSB+KFRSQU5TX0RESV9GVU5DX0VOQUJMRSB8IFRSQU5TX0RESV9E
UF9WQ19QQVlMT0FEX0FMTE9DIHwKPiArCQkgVFJBTlNfRERJX0hEQ1BfU0lHTkFMTElORyk7Cj4g
KwlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMikKPiArCQl2YWwgJj0gflRHTF9UUkFOU19E
RElfUE9SVF9NQVNLOwo+ICsJZWxzZQo+ICsJCXZhbCAmPSB+VFJBTlNfRERJX1BPUlRfTUFTSzsK
PiAgCUk5MTVfV1JJVEUocmVnLCB2YWwpOwo+ICAKPiAgCWlmIChkZXZfcHJpdi0+cXVpcmtzICYg
UVVJUktfSU5DUkVBU0VfRERJX0RJU0FCTEVEX1RJTUUgJiYKPiAtLSAKPiBTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gClZpbGxlIFN5cmrDpGzD
pApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
