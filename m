Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426489A9C9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666976EBF3;
	Fri, 23 Aug 2019 08:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415E86EBF1;
 Fri, 23 Aug 2019 08:12:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 04:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="196228012"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2019 04:42:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 2/6] drm: port definition is moved back into i915 header
In-Reply-To: <20190822111445.29350-3-ramalingam.c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190822111445.29350-1-ramalingam.c@intel.com>
 <20190822111445.29350-3-ramalingam.c@intel.com>
Date: Thu, 22 Aug 2019 14:42:39 +0300
Message-ID: <87imqpctow.fsf@intel.com>
MIME-Version: 1.0
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
Cc: tomas.winkler@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMiBBdWcgMjAxOSwgUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29t
PiB3cm90ZToKPiBIYW5kbGVkIHRoZSBuZWVkIGZvciBleHBvc2luZyBlbnVtIHBvcnQgdG8gbWVp
X2hkY3AgZHJpdmVyLCBieQo+IGNvbnZlcnRpbmcgdGhlIHBvcnQgaW50byBkZGkgaW5kZXggYXMg
cGVyIE1FIEZXLgo+Cj4gSGVuY2UgZW51bSBwb3J0IGRlZmluaXRpb24gbW92ZWQgaW50byBJOTE1
IGRyaXZlciBpdHNlbGYuCgpGb3IgZnV0dXJlIHJlZmVyZW5jZSwgcGxlYXNlIGNvbnNpZGVyIHVz
aW5nIHRoZSBpbXBlcmF0aXZlIHN0eWxlIGluIHRoZQpjb21taXQgbWVzc2FnZS4gRm9yIGV4YW1w
bGUsICJtb3ZlIHBvcnQgZGVmaW5pdGlvbiBiYWNrIHRvIGk5MTUgaGVhZGVyIiwKIkhlbmNlIG1v
dmUgZW51bSBwb3J0IGRlZmluaXRpb24gaW50byBpOTE1IGRyaXZlciBpdHNlbGYiLCBldGMuCgpU
aGVyZSB3ZXJlIHNvbWUgY29tcGxhaW50cyBmcm9tIENJLCBwbGVhc2UgbWFrZSBzdXJlIHRoaXMg
YnVpbGRzIHdpdGgKQ09ORklHX0RSTV9JOTE1X1dFUlJPUj15LgoKUmV2aWV3ZWQtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFtYWxp
bmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuaCAgICB8ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oIHwgMTggKysrKysrKysrKysrKysrKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaCAgICAgIHwgIDEgKwo+ICBpbmNs
dWRlL2RybS9pOTE1X2RybS5oICAgICAgICAgICAgICAgICAgICAgICB8IDE4IC0tLS0tLS0tLS0t
LS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Ymlvcy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmgKPiBpbmRl
eCA0OTY5MTg5ZTYyMGYuLjk0MTVlMjI0MzViYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYmlvcy5oCj4gQEAgLTM0LDYgKzM0LDggQEAKPiAgCj4gICNpbmNsdWRl
IDxkcm0vaTkxNV9kcm0uaD4KPiAgCj4gKyNpbmNsdWRlICJpbnRlbF9kaXNwbGF5LmgiCj4gKwo+
ICBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZTsKPiAgCj4gIGVudW0gaW50ZWxfYmFja2xpZ2h0X3R5
cGUgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oCj4g
aW5kZXggZTU3ZTY5NjkwNTFkLi40MDYxMGQ1MTMyN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaAo+IEBAIC0xODIsNiArMTgyLDI0IEBAIGVu
dW0gcGxhbmVfaWQgewo+ICAJZm9yICgoX19wKSA9IFBMQU5FX1BSSU1BUlk7IChfX3ApIDwgSTkx
NV9NQVhfUExBTkVTOyAoX19wKSsrKSBcCj4gIAkJZm9yX2VhY2hfaWYoKF9fY3J0YyktPnBsYW5l
X2lkc19tYXNrICYgQklUKF9fcCkpCj4gIAo+ICtlbnVtIHBvcnQgewo+ICsJUE9SVF9OT05FID0g
LTEsCj4gKwo+ICsJUE9SVF9BID0gMCwKPiArCVBPUlRfQiwKPiArCVBPUlRfQywKPiArCVBPUlRf
RCwKPiArCVBPUlRfRSwKPiArCVBPUlRfRiwKPiArCVBPUlRfRywKPiArCVBPUlRfSCwKPiArCVBP
UlRfSSwKPiArCj4gKwlJOTE1X01BWF9QT1JUUwo+ICt9Owo+ICsKPiArI2RlZmluZSBwb3J0X25h
bWUocCkgKChwKSArICdBJykKPiArCj4gIC8qCj4gICAqIFBvcnRzIGlkZW50aWZpZXIgcmVmZXJl
bmNlZCBmcm9tIG90aGVyIGRyaXZlcnMuCj4gICAqIEV4cGVjdGVkIHRvIHJlbWFpbiBzdGFibGUg
b3ZlciB0aW1lCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaAo+IGluZGV4
IDY1N2JiYjFmNWVkMC4uY2EwNWFlNzk5ZDZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuaAo+IEBAIC0xMSw2ICsxMSw3IEBACj4gICNpbmNsdWRlIDxkcm0vaTkx
NV9kcm0uaD4KPiAgCj4gICNpbmNsdWRlICJpOTE1X3JlZy5oIgo+ICsjaW5jbHVkZSAiaW50ZWxf
ZGlzcGxheS5oIgo+ICAKPiAgZW51bSBwaXBlOwo+ICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0
ZTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vaTkxNV9kcm0uaCBiL2luY2x1ZGUvZHJtL2k5
MTVfZHJtLmgKPiBpbmRleCAyMzI3NGNmOTI3MTIuLjY3MjIwMDU4ODRkYiAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2RybS9pOTE1X2RybS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vaTkxNV9kcm0uaAo+
IEBAIC0xMDAsMjIgKzEwMCw0IEBAIGV4dGVybiBzdHJ1Y3QgcmVzb3VyY2UgaW50ZWxfZ3JhcGhp
Y3Nfc3RvbGVuX3JlczsKPiAgI2RlZmluZSBJTlRFTF9HRU4xMV9CU01fRFcxCTB4YzQKPiAgI2Rl
ZmluZSAgIElOVEVMX0JTTV9NQVNLCSgtKDF1IDw8IDIwKSkKPiAgCj4gLWVudW0gcG9ydCB7Cj4g
LQlQT1JUX05PTkUgPSAtMSwKPiAtCj4gLQlQT1JUX0EgPSAwLAo+IC0JUE9SVF9CLAo+IC0JUE9S
VF9DLAo+IC0JUE9SVF9ELAo+IC0JUE9SVF9FLAo+IC0JUE9SVF9GLAo+IC0JUE9SVF9HLAo+IC0J
UE9SVF9ILAo+IC0JUE9SVF9JLAo+IC0KPiAtCUk5MTVfTUFYX1BPUlRTCj4gLX07Cj4gLQo+IC0j
ZGVmaW5lIHBvcnRfbmFtZShwKSAoKHApICsgJ0EnKQo+IC0KPiAgI2VuZGlmCQkJCS8qIF9JOTE1
X0RSTV9IXyAqLwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
