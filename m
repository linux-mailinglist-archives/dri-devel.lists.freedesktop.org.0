Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB312AC0AA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 17:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAEE89A9A;
	Mon,  9 Nov 2020 16:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5D89A9A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 16:20:19 +0000 (UTC)
IronPort-SDR: BeKqzOwLkajTRaWaOCzusGVHNlVQXWVLKo0lAA+QiL9vRuiwHRIKwWcBrv/qYdsAIbqlXqH4e7
 2zzeAvLvEg7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="157609796"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="157609796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 08:20:18 -0800
IronPort-SDR: GwinHz9zQYCLfxj+x/8+Pr11FTI1Jj1KjSjys4NQBZiiB9vjfmjrTWMamlxUopJPmwc0Yy8o5t
 j9BMr+U6maaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="365118251"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 09 Nov 2020 08:20:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 18:20:15 +0200
Date: Mon, 9 Nov 2020 18:20:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109162015.GH6112@intel.com>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <20201109151937.GF6112@intel.com> <20201109161258.GX2063125@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109161258.GX2063125@dell>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDQ6MTI6NThQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMDkgTm92IDIwMjAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiAKPiA+IE9u
IFRodSwgTm92IDA1LCAyMDIwIGF0IDAyOjQ1OjEyUE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToK
PiA+ID4gVGhlIHN0YWNrIGlzIHRvbyBmdWxsLgo+ID4gPiAKPiA+ID4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiA+IAo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKA
mHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZeKAmToKPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jOjE2MToxOiB3YXJuaW5nOiB0aGUg
ZnJhbWUgc2l6ZSBvZiAxMTc2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZnJh
bWUtbGFyZ2VyLXRoYW49XQo+ID4gPiAKPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4g
Q2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiA+IENjOiBEYXZpZCBGcmFuY2lz
IDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0
X2hlbHBlci5jICAgIHwgMjkgKysrKysrKysrKysrLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiA+
ID4gaW5kZXggMWQ2OTZlYzAwMWNmZi4uMGE1Mzk0NTZmNjg2NCAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMK
PiA+ID4gQEAgLTEyMCw0NCArMTIwLDUxIEBAIHNpZGViYW5kX21zZ19yZXFfZXF1YWwoY29uc3Qg
c3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgKmluLAo+ID4gPiAgc3RhdGljIGJv
b2wKPiA+ID4gIHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3Np
ZGViYW5kX21zZ19yZXFfYm9keSAqaW4pCj4gPiA+ICB7Cj4gPiA+IC0Jc3RydWN0IGRybV9kcF9z
aWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ID4gPiArCXN0cnVjdCBkcm1fZHBfc2lk
ZWJhbmRfbXNnX3JlcV9ib2R5ICpvdXQ7Cj4gPiAKPiA+IEhvdyBiaWcgaXMgaXQ/IEFuZCB3aHkg
aXMgaXQgdGhhdCBiaWc/Cj4gCj4gSXQncyBhIHN0cnVjdCBvZiBhIHVuaW9uIG9mIHN0cnVjdHMu
Cj4gCj4gQW5kIGl0J3MgYWxsIGFsbG9jYXRlZCBvbiB0aGUgc3RhY2suICBCYWQgbmV3cyEKClRo
YXQgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb25zLgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
