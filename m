Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B32ABFB5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 16:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DED389312;
	Mon,  9 Nov 2020 15:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129C789312
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 15:19:41 +0000 (UTC)
IronPort-SDR: l8Vtcdcezapry/rkOXzv4APUrpRnH/Xlzij9hhYDcIY1ZD0iBMqU6YJDpUVirEeQEXag+BXRGt
 c1eemFMfM7Ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="149669011"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="149669011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 07:19:40 -0800
IronPort-SDR: OCyFFHZMq2JFX08oDvfCI6sCxFj0j6Yf9l62oeSJVmxd/jzVADMD007L35+3roxB9OHfLhm5Ci
 i3YLdPYzDy8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="365507779"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 09 Nov 2020 07:19:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 17:19:37 +0200
Date: Mon, 9 Nov 2020 17:19:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109151937.GF6112@intel.com>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-15-lee.jones@linaro.org>
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

T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDI6NDU6MTJQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IFRoZSBzdGFjayBpcyB0b28gZnVsbC4KPiAKPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBr
ZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNpZGViYW5kX21zZ19yZXFf
ZW5jb2RlX2RlY29kZeKAmToKPiAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9k
cF9tc3RfaGVscGVyLmM6MTYxOjE6IHdhcm5pbmc6IHRoZSBmcmFtZSBzaXplIG9mIDExNzYgYnl0
ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcyBbLVdmcmFtZS1sYXJnZXItdGhhbj1dCj4gCj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IENj
OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3Rf
aGVscGVyLmMgICAgfCAyOSArKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+IGluZGV4IDFkNjk2ZWMw
MDFjZmYuLjBhNTM5NDU2ZjY4NjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0
ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2Vs
ZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+IEBAIC0xMjAsNDQgKzEyMCw1MSBAQCBz
aWRlYmFuZF9tc2dfcmVxX2VxdWFsKGNvbnN0IHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3Jl
cV9ib2R5ICppbiwKPiAgc3RhdGljIGJvb2wKPiAgc2lkZWJhbmRfbXNnX3JlcV9lbmNvZGVfZGVj
b2RlKHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5ICppbikKPiAgewo+IC0Jc3Ry
dWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ICsJc3RydWN0IGRy
bV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgKm91dDsKCkhvdyBiaWcgaXMgaXQ/IEFuZCB3aHkg
aXMgaXQgdGhhdCBiaWc/CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
