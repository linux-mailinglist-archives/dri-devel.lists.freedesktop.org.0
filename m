Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB52B21DD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4826E591;
	Fri, 13 Nov 2020 17:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2A56E580;
 Fri, 13 Nov 2020 17:18:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so10770825wrx.2;
 Fri, 13 Nov 2020 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MGDV1m39Q0RpjWz9porpS9WltATtsX2nbsrGwBakBoI=;
 b=cNu+U8JzWYov9+pOuR15lmt9jJN7mU15Fct9ujeB8OBZYHXJijUkou+Rbp9bEgJkzg
 vxa9qAnS4Grf/3uzQvgJqQIbo1wvji0mABrMYjia8ZfwxiKoEiEPiKdH7c6W9LrEysK2
 h8fzkxnD/3UbZD6iqHYdBRwFk9NwubRM9VFsCPkqbg4pl7oRssQ6VIcGdRr1qvcQxrvM
 fsuUgOEWDejY9NGe7DO1reHM/rt5qlrUu0k5P7I85l/LLpEh8SbKiak4YWKRCHXie5cg
 955XfNbnmsskkY8HF1eXKAChkyaWiZsRqy5E3lNLEq/bkG+IGAW4WaGHFFDuEBxRBt6V
 ssbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MGDV1m39Q0RpjWz9porpS9WltATtsX2nbsrGwBakBoI=;
 b=mhYYnzW/zy5OqsTEGY9Ux4hbziVzAi88jpPbmKxrssHzLpU5zPy2AF28rcuwvFTczG
 /hXvKZGKnFc7ZcCWRA3i86UxoZbhwBQ/yEq4MzHSUJ4owWsefRVDDid02ClP3Y/F0q5E
 I45oujMy5CQpVAXqBVD0a8+UiFgQGbdYx2C75Wwgjykpe/qo74BIx8ESgb5PubXljSDl
 TI+T0zckFX5LJQcfHHPhtmGFcJ3vlLn78SHyw/YpvfyOwxgFFI8Jivk5M01kCv+f15PB
 ctppNJKHxQ/tnoOMx+JzVGdmctTzSqWAtO5fPoS9rjOeuwJ+1L7wil4eKiFS7Rhry64e
 z0+Q==
X-Gm-Message-State: AOAM531116sue380vGRslwrjsDAB+W4Q3YrCE5hfRRByLX0/K3u9M2NQ
 9iBy/eE2+a/lDlwCcLxygDp9AjEW968JJQIBmcM=
X-Google-Smtp-Source: ABdhPJyc+LFP+psa3kZ9XXFFTBsO7MMYF0HBYfo22CWlrebU7Zt7G1eB3hJqkmoT0bo6m/ImkA8fBnM1ja1uK8dwDkk=
X-Received: by 2002:adf:8028:: with SMTP id 37mr4635256wrk.111.1605287884168; 
 Fri, 13 Nov 2020 09:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-12-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:17:52 -0500
Message-ID: <CADnq5_NuaUM7Ch==-ZkjzdsSeUL9uw6h9Amp10F4Ncoiwku3ZQ@mail.gmail.com>
Subject: Re: [PATCH 11/40] drm/amd/amdgpu/amdgpu_pll: Fix kernel-doc
 formatting, missing and extra params
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbGwuYzox
MjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZyZXEnIG5vdCBkZXNj
cmliZWQgaW4gJ2FtZGdwdV9wbGxfY29tcHV0ZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BsbC5jOjEyMTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnZmJfZGl2X3AnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9wbGxfY29tcHV0ZScKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BsbC5jOjEyMTogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZnJhY19mYl9kaXZfcCcgbm90IGRlc2NyaWJlZCBpbiAn
YW1kZ3B1X3BsbF9jb21wdXRlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cGxsLmM6MTIxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdyZWZfZGl2
X3AnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9wbGxfY29tcHV0ZScKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BsbC5jOjEyMTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAncG9zdF9kaXZfcCcgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3BsbF9j
b21wdXRlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcGxsLmM6MzE3OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdlbmNvZGVyJyBkZXNjcmlwdGlvbiBp
biAnYW1kZ3B1X3BsbF9nZXRfc2hhcmVkX25vbmRwX3BwbGwnCj4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBw
bGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wbGwuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcGxsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcGxsLmMKPiBpbmRleCAxZjIzMDViN2JkMTM1Li5mMmUyMDY2NmM5YzFiIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbGwuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbGwuYwo+IEBAIC0xMDIsMTEgKzEwMiwxMiBA
QCBzdGF0aWMgdm9pZCBhbWRncHVfcGxsX2dldF9mYl9yZWZfZGl2KHVuc2lnbmVkIG5vbSwgdW5z
aWduZWQgZGVuLCB1bnNpZ25lZCBwb3N0Xwo+ICAgKiBhbWRncHVfcGxsX2NvbXB1dGUgLSBjb21w
dXRlIFBMTCBwYXJhbWF0ZXJzCj4gICAqCj4gICAqIEBwbGw6IGluZm9ybWF0aW9uIGFib3V0IHRo
ZSBQTEwKPiArICogQGZyZXE6IHJlcXVlc3RlZCBmcmVxdWVuY3kKPiAgICogQGRvdF9jbG9ja19w
OiByZXN1bHRpbmcgcGl4ZWwgY2xvY2sKPiAtICogZmJfZGl2X3A6IHJlc3VsdGluZyBmZWVkYmFj
ayBkaXZpZGVyCj4gLSAqIGZyYWNfZmJfZGl2X3A6IGZyYWN0aW9uYWwgcGFydCBvZiB0aGUgZmVl
ZGJhY2sgZGl2aWRlcgo+IC0gKiByZWZfZGl2X3A6IHJlc3VsdGluZyByZWZlcmVuY2UgZGl2aWRl
cgo+IC0gKiBwb3N0X2Rpdl9wOiByZXN1bHRpbmcgcmVmZXJlbmNlIGRpdmlkZXIKPiArICogQGZi
X2Rpdl9wOiByZXN1bHRpbmcgZmVlZGJhY2sgZGl2aWRlcgo+ICsgKiBAZnJhY19mYl9kaXZfcDog
ZnJhY3Rpb25hbCBwYXJ0IG9mIHRoZSBmZWVkYmFjayBkaXZpZGVyCj4gKyAqIEByZWZfZGl2X3A6
IHJlc3VsdGluZyByZWZlcmVuY2UgZGl2aWRlcgo+ICsgKiBAcG9zdF9kaXZfcDogcmVzdWx0aW5n
IHJlZmVyZW5jZSBkaXZpZGVyCj4gICAqCj4gICAqIFRyeSB0byBjYWxjdWxhdGUgdGhlIFBMTCBw
YXJhbWV0ZXJzIHRvIGdlbmVyYXRlIHRoZSBnaXZlbiBmcmVxdWVuY3k6Cj4gICAqIGRvdF9jbG9j
ayA9IChyZWZfZnJlcSAqIGZlZWRiYWNrX2RpdikgLyAocmVmX2RpdiAqIHBvc3RfZGl2KQo+IEBA
IC0zMDgsNyArMzA5LDYgQEAgaW50IGFtZGdwdV9wbGxfZ2V0X3NoYXJlZF9kcF9wcGxsKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YykKPiAgICogYW1kZ3B1X3BsbF9nZXRfc2hhcmVkX25vbmRwX3BwbGwg
LSByZXR1cm4gdGhlIFBQTEwgdXNlZCBieSBhbm90aGVyIG5vbi1EUCBjcnRjCj4gICAqCj4gICAq
IEBjcnRjOiBkcm0gY3J0Ywo+IC0gKiBAZW5jb2RlcjogZHJtIGVuY29kZXIKPiAgICoKPiAgICog
UmV0dXJucyB0aGUgUFBMTCAoUGl4ZWwgUExMKSB1c2VkIGJ5IGFub3RoZXIgbm9uLURQIGNydGMv
ZW5jb2RlciB3aGljaCBjYW4KPiAgICogYmUgc2hhcmVkIChpLmUuLCBzYW1lIGNsb2NrKS4KPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
