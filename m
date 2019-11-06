Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D60F1C06
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A456EDF6;
	Wed,  6 Nov 2019 17:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6D56E9C7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:03:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 09:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="200766728"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 06 Nov 2019 09:03:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Nov 2019 19:03:17 +0200
Date: Wed, 6 Nov 2019 19:03:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Limit to INT_MAX in create_blob ioctl
Message-ID: <20191106170317.GU1208@intel.com>
References: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com,
 Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDU6NDc6NTVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGUgaGFyZGVuZWQgdXNlcmNweSBjb2RlIGlzIHRvbyBwYXJhbm9pZCBldmVyIHNp
bmNlOgo+IAo+IGNvbW1pdCA2YTMwYWZhOGMxZmJkZTVmMTBmOWM1ODRjMjk5MmFhM2M3ZjdhOGZl
Cj4gQXV0aG9yOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBEYXRlOiAgIFdl
ZCBOb3YgNiAxNjowNzowMSAyMDE5ICsxMTAwCj4gCj4gICAgIHVhY2Nlc3M6IGRpc2FsbG93ID4g
SU5UX01BWCBjb3B5IHNpemVzCj4gCj4gQ29kZSBpdHNlbGYgc2hvdWxkIGhhdmUgYmVlbiBmaW5l
IGFzLWlzLgo+IAo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrZmI3N2U5N2ViZjA2MTJlZTY5MTRAc3l6
a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IEZpeGVzOiA2YTMwYWZhOGMxZmIgKCJ1YWNjZXNzOiBk
aXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcyIpCj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgo+IENjOiBBbGV4YW5kZXIgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcu
dWs+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6
IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tCj4gS2Vlcy9BbmRy
ZXcsCj4gCj4gU2luY2UgdGhpcyBpcyAtbW0gY2FuIEkgaGF2ZSBhIHN0YWJsZSBzaGExIG9yIHNv
bWV0aGluZyBmb3IKPiByZWZlcmVuY2luZz8gT3IgZG8geW91IHdhbnQgdG8gaW5jbHVkZSB0aGlz
IGluIHRoZSAtbW0gcGF0Y2ggYm9tYiBmb3IKPiB0aGUgbWVyZ2Ugd2luZG93Pwo+IC1EYW5pZWwK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9w
ZXJ0eS5jCj4gaW5kZXggODkyY2U2MzZlZjcyLi42ZWUwNDgwM2MzNjIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcm9wZXJ0eS5jCj4gQEAgLTU2MSw3ICs1NjEsNyBAQCBkcm1fcHJvcGVydHlfY3JlYXRlX2Js
b2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IGxlbmd0aCwKPiAgCXN0cnVjdCBkcm1f
cHJvcGVydHlfYmxvYiAqYmxvYjsKPiAgCWludCByZXQ7Cj4gIAo+IC0JaWYgKCFsZW5ndGggfHwg
bGVuZ3RoID4gVUxPTkdfTUFYIC0gc2l6ZW9mKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYikpCj4g
KwlpZiAoIWxlbmd0aCB8fCBsZW5ndGggPiBJTlRfTUFYIC0gc2l6ZW9mKHN0cnVjdCBkcm1fcHJv
cGVydHlfYmxvYikpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CgpJTlRfTUFYIHNob3Vs
ZCBiZSBtb3JlIHRoYW4gZW5vdWdoLgoKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+ICAKPiAgCWJsb2IgPSBrdnphbGxvYyhzaXpl
b2Yoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iKStsZW5ndGgsIEdGUF9LRVJORUwpOwo+IC0tIAo+
IDIuMjQuMC5yYzIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
