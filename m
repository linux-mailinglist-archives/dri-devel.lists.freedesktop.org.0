Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9462AC1A8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D167D89AAE;
	Mon,  9 Nov 2020 17:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D34889AAE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:03:30 +0000 (UTC)
IronPort-SDR: SyemdH0cxXHsJkJvMmHkb62lRgRbA9aO5KZ0wCrSB+H6hBXCrCS8AvZ6JbO3SVvYa88+d6SNDc
 yrN/UaGwwpvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="234001181"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="234001181"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 09:03:29 -0800
IronPort-SDR: YUB9rDe1NwP0iYMkD/1klmnf7j8zbUufpdzd8PIdfkSOXE+YFzbqWx8As7cJa337ZnDbYe564X
 BObVE0/JZwsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="365535760"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 09 Nov 2020 09:03:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 19:03:24 +0200
Date: Mon, 9 Nov 2020 19:03:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109170324.GJ6112@intel.com>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <20201109151937.GF6112@intel.com> <20201109161258.GX2063125@dell>
 <20201109162015.GH6112@intel.com> <20201109164004.GZ2063125@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109164004.GZ2063125@dell>
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

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDQ6NDA6MDRQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMDkgTm92IDIwMjAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiAKPiA+IE9u
IE1vbiwgTm92IDA5LCAyMDIwIGF0IDA0OjEyOjU4UE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToK
PiA+ID4gT24gTW9uLCAwOSBOb3YgMjAyMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+ID4gPiAK
PiA+ID4gPiBPbiBUaHUsIE5vdiAwNSwgMjAyMCBhdCAwMjo0NToxMlBNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gPiA+ID4gPiBUaGUgc3RhY2sgaXMgdG9vIGZ1bGwuCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9k
cF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2Rl
Y29kZeKAmToKPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2Rw
X21zdF9oZWxwZXIuYzoxNjE6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTE3NiBieXRl
cyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4g
PiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4gPiBDYzogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+ID4gPiA+IENjOiBEYXZpZCBGcmFuY2lzIDxE
YXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gPiA+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIC4uLi9kcm0vc2VsZnRlc3RzL3Rl
c3QtZHJtX2RwX21zdF9oZWxwZXIuYyAgICB8IDI5ICsrKysrKysrKysrKy0tLS0tLS0KPiA+ID4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gPiA+ID4gPiBpbmRleCAxZDY5NmVjMDAxY2ZmLi4wYTUz
OTQ1NmY2ODY0IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0
cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gPiA+ID4gPiBAQCAtMTIwLDQ0
ICsxMjAsNTEgQEAgc2lkZWJhbmRfbXNnX3JlcV9lcXVhbChjb25zdCBzdHJ1Y3QgZHJtX2RwX3Np
ZGViYW5kX21zZ19yZXFfYm9keSAqaW4sCj4gPiA+ID4gPiAgc3RhdGljIGJvb2wKPiA+ID4gPiA+
ICBzaWRlYmFuZF9tc2dfcmVxX2VuY29kZV9kZWNvZGUoc3RydWN0IGRybV9kcF9zaWRlYmFuZF9t
c2dfcmVxX2JvZHkgKmluKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+IC0Jc3RydWN0IGRybV9kcF9z
aWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ID4gPiA+ID4gKwlzdHJ1Y3QgZHJtX2Rw
X3NpZGViYW5kX21zZ19yZXFfYm9keSAqb3V0Owo+ID4gPiA+IAo+ID4gPiA+IEhvdyBiaWcgaXMg
aXQ/IEFuZCB3aHkgaXMgaXQgdGhhdCBiaWc/Cj4gPiA+IAo+ID4gPiBJdCdzIGEgc3RydWN0IG9m
IGEgdW5pb24gb2Ygc3RydWN0cy4KPiA+ID4gCj4gPiA+IEFuZCBpdCdzIGFsbCBhbGxvY2F0ZWQg
b24gdGhlIHN0YWNrLiAgQmFkIG5ld3MhCj4gPiAKPiA+IFRoYXQgZG9lc24ndCBhbnN3ZXIgbXkg
cXVlc3Rpb25zLgo+IAo+IEl0IGFuc3dlcnMgdGhlIHNlY29uZCBxdWVzdGlvbi4KCk5vdCByZWFs
bHkuIEEgY29tYmluYXRpb24gb2Ygc3RydWN0cyBhbmQgdW5pb25zIGNvdWxkIGJlCnByZXR0eSBt
dWNoIGFueSBzaXplLgoKPiAKPiBUaGUgYW5zd2VyIHRvIHRoZSBmaXJzdCBxdWVzdGlvbiB5b3Ug
Y2FuIGBncmVwYCBmb3IgeW91cnNlbGYuIDspCgpJIHdvdWxkIHJhdGhlciBydW4gcGFob2xlIG9u
IGl0LiBCdXQgd2h5IHdvdWxkIHlvdSByZXF1aXJlCnJldmlld2VycyB0byBqdW1wIHRocm91Z2gg
c3VjaCBleHRyYSBob29wcyB3aGVuIHlvdSBjb3VsZApqdXN0IHB1dCB0aGF0IGluZm9ybWF0aW9u
IGludG8gdGhlIGNvbW1pdCBtZXNzYWdlPyBXaXRoIHRoYXQKYW55b25lIGNvdWxkIHJldmlldyB0
aGlzIHdpdGhvdXQgaGF2aW5nIHRvIGRvIGEgbG90IG9mIGV4dHJhCndvcmsuCgotLSAKVmlsbGUg
U3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
