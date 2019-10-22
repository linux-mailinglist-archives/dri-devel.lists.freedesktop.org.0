Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E1E08B7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 18:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAFC6E870;
	Tue, 22 Oct 2019 16:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2802A6E870
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 16:23:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 09:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,216,1569308400"; d="scan'208";a="209738246"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 22 Oct 2019 09:23:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Oct 2019 19:23:52 +0300
Date: Tue, 22 Oct 2019 19:23:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/vc4: Use drm_hdmi_avi_infoframe_bars()
Message-ID: <20191022162352.GO1208@intel.com>
References: <20191008164814.5894-1-ville.syrjala@linux.intel.com>
 <20191008164814.5894-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008164814.5894-2-ville.syrjala@linux.intel.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDc6NDg6MTRQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFVzZSB0aGUgbmV3IGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfYmFycygpIGhlbHBl
ciBpbnN0ZWFkCj4gb2YgaGFuZCByb2xsaW5nIGl0Lgo+IAo+IENjOiBFcmljIEFuaG9sdCA8ZXJp
Y0BhbmhvbHQubmV0Pgo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290
bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgoKU2VyaWVzIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0IHdpdGggQm9y
aXMncyBpcmMgcmI6CgoxOTowMyA8IHZzeXJqYWxhPiBhbmhvbHQ6IGJicmV6aWxsb246IHRob3Vn
aHRzIG9uIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjc3NDIvID8K
MTk6MDUgPCBiYnJlemlsbG9uPiB2c3lyamFsYTogUi1iCgpUaGFua3MuCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCA1ICstLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCj4g
aW5kZXggMDg1M2I5ODBiY2IzLi4xYzYyYzZjOTI0NGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRt
aS5jCj4gQEAgLTM5OCwxMCArMzk4LDcgQEAgc3RhdGljIHZvaWQgdmM0X2hkbWlfc2V0X2F2aV9p
bmZvZnJhbWUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ICAJCQkJCSAgIEhETUlfUVVB
TlRJWkFUSU9OX1JBTkdFX0xJTUlURUQgOgo+ICAJCQkJCSAgIEhETUlfUVVBTlRJWkFUSU9OX1JB
TkdFX0ZVTEwpOwo+ICAKPiAtCWZyYW1lLmF2aS5yaWdodF9iYXIgPSBjc3RhdGUtPnR2Lm1hcmdp
bnMucmlnaHQ7Cj4gLQlmcmFtZS5hdmkubGVmdF9iYXIgPSBjc3RhdGUtPnR2Lm1hcmdpbnMubGVm
dDsKPiAtCWZyYW1lLmF2aS50b3BfYmFyID0gY3N0YXRlLT50di5tYXJnaW5zLnRvcDsKPiAtCWZy
YW1lLmF2aS5ib3R0b21fYmFyID0gY3N0YXRlLT50di5tYXJnaW5zLmJvdHRvbTsKPiArCWRybV9o
ZG1pX2F2aV9pbmZvZnJhbWVfYmFycygmZnJhbWUuYXZpLCBjc3RhdGUpOwo+ICAKPiAgCXZjNF9o
ZG1pX3dyaXRlX2luZm9mcmFtZShlbmNvZGVyLCAmZnJhbWUpOwo+ICB9Cj4gLS0gCj4gMi4yMS4w
CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
