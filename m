Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260010A0F5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369306E135;
	Tue, 26 Nov 2019 15:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A06E135
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:10:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 07:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="291740124"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 26 Nov 2019 07:10:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Nov 2019 17:10:14 +0200
Date: Tue, 26 Nov 2019 17:10:14 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/rect: update kerneldoc for drm_rect_clip_scaled()
Message-ID: <20191126151014.GB1208@intel.com>
References: <20191126145213.380079-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126145213.380079-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6NTI6MTNQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGlzIHdhcyBmb3Jnb3R0ZW4gaW4gZjk2YmRmNTY0ZjNlICgiZHJtL3JlY3Q6IEhh
bmRsZSByb3VuZGluZyBlcnJvcnMKPiBpbiBkcm1fcmVjdF9jbGlwX3NjYWxlZCwgdjMuIikKPiAK
PiBTcG90dGVkIHdoaWxlIHJldmlld2luZyBwYXRjaGVzIGZyb20gVmlsbGUgdG91Y2hpbmcgdGhp
cyBhcmVhLgo+IAo+IEZpeGVzOiBmOTZiZGY1NjRmM2UgKCJkcm0vcmVjdDogSGFuZGxlIHJvdW5k
aW5nIGVycm9ycyBpbiBkcm1fcmVjdF9jbGlwX3NjYWxlZCwgdjMuIikKPiBDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiBDYzogVmlsbGUgU3lyamFs
YSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fcmVjdC5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9yZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+IGluZGV4IGI4MzYzYWFh
OTAzMi4uZTZlNjQwZjJkNWUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVj
dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiBAQCAtNzMsMTEgKzczLDEz
IEBAIHN0YXRpYyB1MzIgY2xpcF9zY2FsZWQodTMyIHNyYywgdTMyIGRzdCwgdTMyIGNsaXApCj4g
ICAqIEBjbGlwOiBjbGlwIHJlY3RhbmdsZQo+ICAgKgo+ICAgKiBDbGlwIHJlY3RhbmdsZSBAZHN0
IGJ5IHJlY3RhbmdsZSBAY2xpcC4gQ2xpcCByZWN0YW5nbGUgQHNyYyBieSB0aGUKPiAtICogc2Ft
ZSBhbW91bnRzIG11bHRpcGxpZWQgYnkgQGhzY2FsZSBhbmQgQHZzY2FsZS4KPiArICogdGhlIGNv
cnJlc3BvbmRpbmcgYW1vdW50cywgcmV0YWluaW5nIHRoZSB2ZXJ0aWNhbCBhbmQgaG9yaXpvbnRh
bCBzY2FsaW5nCj4gKyAqIGZhY3RvcnMgZnJvbSBAc3JjIHRvIEBkc3QuCj4gICAqCj4gICAqIFJF
VFVSTlM6Cj4gKyAqCj4gICAqICV0cnVlIGlmIHJlY3RhbmdsZSBAZHN0IGlzIHN0aWxsIHZpc2li
bGUgYWZ0ZXIgYmVpbmcgY2xpcHBlZCwKPiAtICogJWZhbHNlIG90aGVyd2lzZQo+ICsgKiAlZmFs
c2Ugb3RoZXJ3aXNlLgo+ICAgKi8KPiAgYm9vbCBkcm1fcmVjdF9jbGlwX3NjYWxlZChzdHJ1Y3Qg
ZHJtX3JlY3QgKnNyYywgc3RydWN0IGRybV9yZWN0ICpkc3QsCj4gIAkJCSAgY29uc3Qgc3RydWN0
IGRybV9yZWN0ICpjbGlwKQo+IC0tIAo+IDIuMjQuMAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
