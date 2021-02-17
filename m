Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AEA31D43F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 04:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ED36E4AB;
	Wed, 17 Feb 2021 03:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0066E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 03:30:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a22so14411044ljp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 19:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=90upSJkSBaDE94xLVKm4FyJgU7j3Yg9CERdZQjvg9pk=;
 b=xTQH0eT02RBCDqlx4bxESwjBElyyy/ItDV/JxYf/gTxWA6A/GjmR+wYABOFlFwPggP
 q4KMHg40Ghc/1QZXiHUo8W4fxm2Uur/NQBp8LxDgDX9HrMIScIR8VDXkqBHlLAhvC1Rg
 AcJJ5MHkNJwDfUH5XK1op++bPtdYi5fyeq06QKkZuYRzdIAKDhSRvoueMdoC6qfn1qXO
 92rCmedXnhGJhOcyZ4ka8eRb6cvCpXIBb+6P2fR9x7zp35+3UiNXWolQ5JWwXzesCW1q
 qi1BobVt7v8Trq1J4GjxcRb2q6P587ZgifJc52/3IB0z/Z/Zegv3kzVFHQblhQ8QsmL7
 hHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=90upSJkSBaDE94xLVKm4FyJgU7j3Yg9CERdZQjvg9pk=;
 b=V/O0uUDR3r+XXMEx1nWNovTUN3ZDAyXX7NdwIPX2wgZRMJhTeYsdG45dCsxQrKdkU0
 +AmvWg8S+9HVS1KTEIh6sKgK0mXSiaoDET6O0ynXHk8tbVMpiWXWNguniTP2geQ54Ukb
 QyyYBGBe6gBzlG51P3W/PI30sVR4VCvn6oAyeXuminWRuicvN2qjUdO9e+WoRURo66tM
 lhhDACXNAvL3h3ShyMZ47QNSDaWs2WNt1EuIpA9+DJKza974Ur0P3kb+XXQ/bvq76fs/
 cpMMApa200832KUv5jbcmI/F81sMcaL2iETRiPRDfm6uyRqElRp8P+A9BdqH4uszDHuY
 RBgA==
X-Gm-Message-State: AOAM530ccES+DFgmG1XDT4CZ2GN/UQEZrlYXC4suGfvdjHcBMwjhoXGy
 /9u7Et0TAa+dz84pfYutryd9zl87tqmVwifNKfu9cg==
X-Google-Smtp-Source: ABdhPJzv2bDGbeQ9djCtCiGwF7qL6JmCTWoZF/qHKXTj2cfs/nJVH6vMAR95/8KdPBQwsJ0jWK+uDckhngls20ZhHCc=
X-Received: by 2002:a2e:5356:: with SMTP id t22mr13942820ljd.257.1613532646388; 
 Tue, 16 Feb 2021 19:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 16 Feb 2021 19:30:34 -0800
Message-ID: <CALAqxLWqgLXxry8FhVSK9xC2geiPOA+fTdC-oRENS9iG5AJz=A@mail.gmail.com>
Subject: Re: [PATCH] drm-buf: Add debug option
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgNjowNiBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IFdlIGhhdmUgdG9vIG1hbnkgcGVvcGxlIGFidXNpbmcg
dGhlIHN0cnVjdCBwYWdlIHRoZXkgY2FuIGdldCBhdCBidXQKPiByZWFsbHkgc2hvdWxkbid0IGlu
IGltcG9ydGVycy4gQXNpZGUgZnJvbSB0aGF0IHRoZSBiYWNraW5nIHBhZ2UgbWlnaHQKPiBzaW1w
bHkgbm90IGV4aXN0IChmb3IgZHluYW1pYyBwMnAgbWFwcGluZ3MpIGxvb2tpbmcgYXQgaXQgYW5k
IHVzaW5nIGl0Cj4gZS5nLiBmb3IgbW1hcCBjYW4gYWxzbyB3cmVhayB0aGUgcGFnZSBoYW5kbGlu
ZyBvZiB0aGUgZXhwb3J0ZXIKPiBjb21wbGV0ZWx5LiBJbXBvcnRlcnMgcmVhbGx5IG11c3QgZ28g
dGhyb3VnaCB0aGUgcHJvcGVyIGludGVyZmFjZSBsaWtlCj4gZG1hX2J1Zl9tbWFwIGZvciBldmVy
eXRoaW5nLgo+Cj4gSnVzdCBhbiBSRkMgdG8gc2VlIHdoZXRoZXIgdGhpcyBpZGVhIGhhcyBzb21l
IHN0aWNraW5lc3MuIGRlZmF1bHQgeQo+IGZvciBub3cgdG8gbWFrZSBzdXJlIGludGVsLWdmeC1j
aSBwaWNrcyBpdCB1cCB0b28uCj4KPiBJJ20gc2VtaS10ZW1wdGVkIHRvIGVuZm9yY2UgdGhpcyBm
b3IgZHluYW1pYyBpbXBvcnRlcnMgc2luY2UgdGhvc2UKPiByZWFsbHkgaGF2ZSBubyBleGN1c2Ug
YXQgYWxsIHRvIGJyZWFrIHRoZSBydWxlcy4KPgo+IFVuZm9ydHVhbnRlbHkgd2UgY2FuJ3Qgc3Rv
cmUgdGhlIHJpZ2h0IHBvaW50ZXJzIHNvbWV3aGVyZSBzYWZlIHRvIG1ha2UKPiBzdXJlIHdlIG9v
cHMgb24gc29tZXRoaW5nIHJlY29nbml6YWJsZSwgc28gYmVzdCBpcyB0byBqdXN0IHdyYW5nbGUK
PiB0aGVtIGEgYml0IGJ5IGZsaXBwaW5nIGFsbCB0aGUgYml0cy4gQXQgbGVhc3Qgb24geDg2IGtl
cm5lbCBhZGRyZXNzZXMKPiBoYXZlIGFsbCB0aGVpciBoaWdoIGJpdHMgc2V0cyBhbmQgdGhlIHN0
cnVjdCBwYWdlIGFycmF5IGlzIGZhaXJseSBsb3cKPiBpbiB0aGUga2VybmVsIG1hcHBpbmcsIHNv
IGZsaXBwaW5nIGFsbCB0aGUgYml0cyBnaXZlcyB1cyBhIHZlcnkgaGlnaAo+IHBvaW50ZXIgaW4g
dXNlcnNwYWNlIGFuZCBoZW5jZSBleGNlbGxlbnQgY2hhbmNlcyBmb3IgYW4gaW52YWxpZAo+IGRl
cmVmZXJlbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+
Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENj
OiBEYXZpZCBTdGV2ZW5zIDxzdGV2ZW5zZEBjaHJvbWl1bS5vcmc+Cj4gQ2M6IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiAt
LS0KPiAgZHJpdmVycy9kbWEtYnVmL0tjb25maWcgICB8ICA4ICsrKysrKysKPiAgZHJpdmVycy9k
bWEtYnVmL2RtYS1idWYuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL0tjb25maWcgYi9kcml2ZXJzL2RtYS1i
dWYvS2NvbmZpZwo+IGluZGV4IDRmODIyNGE2YWM5NS4uY2RkYjU0OWU1ZTU5IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL0tjb25m
aWcKPiBAQCAtNTAsNiArNTAsMTQgQEAgY29uZmlnIERNQUJVRl9NT1ZFX05PVElGWQo+ICAgICAg
ICAgICBUaGlzIGlzIG1hcmtlZCBleHBlcmltZW50YWwgYmVjYXVzZSB3ZSBkb24ndCB5ZXQgaGF2
ZSBhIGNvbnNpc3RlbnQKPiAgICAgICAgICAgZXhlY3V0aW9uIGNvbnRleHQgYW5kIG1lbW9yeSBt
YW5hZ2VtZW50IGJldHdlZW4gZHJpdmVycy4KPgo+ICtjb25maWcgRE1BQlVGX0RFQlVHCj4gKyAg
ICAgICBib29sICJETUEtQlVGIGRlYnVnIGNoZWNrcyIKPiArICAgICAgIGRlZmF1bHQgeQo+ICsg
ICAgICAgaGVscAo+ICsgICAgICAgICBUaGlzIG9wdGlvbiBlbmFibGVzIGFkZGl0aW9uYWwgY2hl
Y2tzIGZvciBETUEtQlVGIGltcG9ydGVycyBhbmQKPiArICAgICAgICAgZXhwb3J0ZXJzLiBTcGVj
aWZpY2FsbHkgaXQgdmFsaWRhdGVzIHRoYXQgaW1wb3J0ZXJzIGRvIG5vdCBwZWVrIGF0IHRoZQo+
ICsgICAgICAgICB1bmRlcmx5aW5nIHN0cnVjdCBwYWdlIHdoZW4gdGhleSBpbXBvcnQgYSBidWZm
ZXIuCj4gKwo+ICBjb25maWcgRE1BQlVGX1NFTEZURVNUUwo+ICAgICAgICAgdHJpc3RhdGUgIlNl
bGZ0ZXN0cyBmb3IgdGhlIGRtYS1idWYgaW50ZXJmYWNlcyIKPiAgICAgICAgIGRlZmF1bHQgbgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYwo+IGluZGV4IDFjOWJkNTFkYjExMC4uNmU0NzI1ZjdkZmRlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jCj4gQEAgLTY2Niw2ICs2NjYsMzAgQEAgdm9pZCBkbWFfYnVmX3B1dChzdHJ1Y3QgZG1h
X2J1ZiAqZG1hYnVmKQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfcHV0KTsKPgo+
ICtzdGF0aWMgc3RydWN0IHNnX3RhYmxlICogX19tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9h
dHRhY2htZW50ICphdHRhY2gsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3Qgc2dfdGFibGUgKnNnX3RhYmxlOwo+ICsKPiArICAgICAgIHNnX3RhYmxlID0gYXR0YWNoLT5k
bWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLCBkaXJlY3Rpb24pOwo+ICsKPiArI2lmIENP
TkZJR19ETUFCVUZfREVCVUcKCgpIZXkgRGFuaWVsLAogIEkganVzdCBub3RpY2VkIGEgYnVpbGQg
d2FybmluZyBpbiBhIHRyZWUgSSBwdWxsZWQgdGhpcyBwYXRjaCBpbnRvLgpZb3UgcHJvYmFibHkg
d2FudCB0byB1c2UgI2lmZGVmIGhlcmUsIGFzIGlmIGl0cyBub3QgZGVmaW5lZCB3ZSBzZWU6CmRy
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmM6ODEzOjU6IHdhcm5pbmc6ICJDT05GSUdfRE1BQlVGX0RF
QlVHIiBpcyBub3QKZGVmaW5lZCwgZXZhbHVhdGVzIHRvIDAgWy1XdW5kZWZdCgp0aGFua3MKLWpv
aG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
