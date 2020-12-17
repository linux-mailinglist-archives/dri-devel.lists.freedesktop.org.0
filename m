Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF172DD91F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 20:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E89893EC;
	Thu, 17 Dec 2020 19:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BBD893EB;
 Thu, 17 Dec 2020 19:11:20 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l207so84517oib.4;
 Thu, 17 Dec 2020 11:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Vpy8und16YG5kHXiiOYrwoZq3FNeGVHx8N9X0+uvAM=;
 b=lmN4I2EIt0Gnd0J3obscwCi00gLebvq0dmDIi2aPoc+Ect6lH8KCm2ofprVz7qVq0k
 j0TD2igiZSmut8VQPFIXwjjcycvNS/K01U8fcT52QWI7jgj3o867Z+7dFprr8mZjZLzK
 tTv8KmgigVHEAc0EdDbiGsGI5sGQEYF8GHdTHwsDUD0TSWy7rbLOviXq2fQO9CzjlXUY
 F0PF14Ouy/5wLUDVgIETeUZEl4wiNTt81kG7bUu/RRRVpaGVw1KT14zLBZgSrGWB/LLB
 z+HUmcvO93pURMx5AxmRJDX4S9WcT6rkVcEbSv1yR4l8UxcRo1NbzEuCA64uvBvxr+Zt
 LsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Vpy8und16YG5kHXiiOYrwoZq3FNeGVHx8N9X0+uvAM=;
 b=VEPUhsZTU2zLS8CzZDTET4V07KLSUpZY8CeBncBWQCJY46GOpZWIkTnAt90grsnqVf
 gJ+NrUh20J/I7FfmuTaDUaorhrSWJUEZudYcDuHFqGbaJ4rnE7Bs03qfIhZeDBRIAqet
 QdFYN9cbdPDzuBfmKOLeNGaPHFsJDFV8mW/rxTEvfB5qV9NwTI23f21H1Fq8LsT9B/ED
 V1pJ3QfYpNB3dOZUYC2igEVX8A8Euzhi9vBUcjgb7x23itRhV1x/LLh2dTD3ol1SDETs
 1Ea0RbHJRrx4lH/DOQWh2ToYyKI/b1gPvvLvQtSBks8KYa8QYn2mAc/J4WKRuhn+EUcL
 ppLg==
X-Gm-Message-State: AOAM533ytbgjI1EM99PgvTFtMVzAluRsazM6Jbh91RTOa68RchT0Mqps
 8YTcKa0LvZE00bu4Uxgwiy2GjWk9wkMiYzQKZmKYWn7MhYg=
X-Google-Smtp-Source: ABdhPJy/ZVWFlLUpg+fKUqIZtoODfHlC3OcBU1KMh7eZC1t9AJmya7BwxTUe3DH+dgt6AhVzMLv0CXNjGrVAEmviGy0=
X-Received: by 2002:a54:4083:: with SMTP id i3mr464253oii.120.1608232279997;
 Thu, 17 Dec 2020 11:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20201214222036.561352-1-aurabindo.pillai@amd.com>
 <20201214222036.561352-2-aurabindo.pillai@amd.com>
In-Reply-To: <20201214222036.561352-2-aurabindo.pillai@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Dec 2020 14:11:09 -0500
Message-ID: <CADnq5_M6HJ97gdHDU+gm8XnGpoaGB+eUwtrrqG3-235uO19dmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for freesync
 video mode
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMTQsIDIwMjAgYXQgNToyMSBQTSBBdXJhYmluZG8gUGlsbGFpCjxhdXJhYmlu
ZG8ucGlsbGFpQGFtZC5jb20+IHdyb3RlOgo+Cj4gW1doeSZIb3ddCj4gQWRkcyBhIG1vZHVsZSBw
YXJhbWV0ZXIgdG8gZW5hYmxlIGV4cGVyaW1lbnRhbCBmcmVlc3luYyB2aWRlbyBtb2RlIG1vZGVz
ZXQKPiBvcHRpbWl6YXRpb24uIEVuYWJsaW5nIHRoaXMgbW9kZSBhbGxvd3MgdGhlIGRyaXZlciB0
byBza2lwIGEgZnVsbCBtb2Rlc2V0IHdoZW4KPiBmcmVlc3luYyBjb21wYXRpYmxlIG1vZGVzIGFy
ZSByZXF1ZXN0ZWQgYnkgdGhlIHVzZXJzcGFjZS4gVGhpcyBwYXJhbXRlcnMgYWxzbwo+IGFkZHMg
c29tZSBzdGFuZGFyZCBtb2RlcyBiYXNlZCBvbiB0aGUgY29ubmVjdGVkIG1vbml0b3IncyBWUlIg
cmFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdXJhYmluZG8gUGlsbGFpIDxhdXJhYmluZG8ucGls
bGFpQGFtZC5jb20+Cj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWcgYXQgYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5z
aGFybWFAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmggICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
fCAxMiArKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IGluZGV4IGVlZDU0MTA5NDdlOS4uZTA5
NDIxODRlZmRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKPiBAQCAtMTc3
LDYgKzE3Nyw3IEBAIGV4dGVybiBpbnQgYW1kZ3B1X2dwdV9yZWNvdmVyeTsKPiAgZXh0ZXJuIGlu
dCBhbWRncHVfZW11X21vZGU7Cj4gIGV4dGVybiB1aW50IGFtZGdwdV9zbXVfbWVtb3J5X3Bvb2xf
c2l6ZTsKPiAgZXh0ZXJuIHVpbnQgYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzazsKPiArZXh0ZXJuIHVp
bnQgYW1kZ3B1X2V4cF9mcmVlc3luY192aWRfbW9kZTsKPiAgZXh0ZXJuIHVpbnQgYW1kZ3B1X2Rj
X2RlYnVnX21hc2s7Cj4gIGV4dGVybiB1aW50IGFtZGdwdV9kbV9hYm1fbGV2ZWw7Cj4gIGV4dGVy
biBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm87Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IGIyYTFkZDc1ODFiZi4uZWNlNTFlY2Q1M2QxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC0xNTgsNiAr
MTU4LDcgQEAgaW50IGFtZGdwdV9tZXM7Cj4gIGludCBhbWRncHVfbm9yZXRyeSA9IC0xOwo+ICBp
bnQgYW1kZ3B1X2ZvcmNlX2FzaWNfdHlwZSA9IC0xOwo+ICBpbnQgYW1kZ3B1X3RtejsKPiArdWlu
dCBhbWRncHVfZXhwX2ZyZWVzeW5jX3ZpZF9tb2RlOwo+ICBpbnQgYW1kZ3B1X3Jlc2V0X21ldGhv
ZCA9IC0xOyAvKiBhdXRvICovCj4gIGludCBhbWRncHVfbnVtX2tjcSA9IC0xOwo+Cj4gQEAgLTc4
Niw2ICs3ODcsMTcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGFibWxldmVsLCBhbWRncHVfZG1fYWJt
X2xldmVsLCB1aW50LCAwNDQ0KTsKPiAgTU9EVUxFX1BBUk1fREVTQyh0bXosICJFbmFibGUgVE1a
IGZlYXR1cmUgKC0xID0gYXV0bywgMCA9IG9mZiAoZGVmYXVsdCksIDEgPSBvbikiKTsKPiAgbW9k
dWxlX3BhcmFtX25hbWVkKHRteiwgYW1kZ3B1X3RteiwgaW50LCAwNDQ0KTsKPgo+ICsvKioKPiAr
ICogRE9DOiBleHBlcmltZW50YWxfZnJlZXN5bmNfdmlkZW8gKHVpbnQpCj4gKyAqIEVuYWJsZWQg
dGhlIG9wdGltaXphdGlvbiB0byBhZGp1c3QgZnJvbnQgcG9yY2ggdGltaW5nIHRvIGFjaGlldmUg
c2VhbWxlc3MgbW9kZSBjaGFuZ2UgZXhwZXJpZW5jZQo+ICsgKiB3aGVuIHNldHRpbmcgYSBmcmVl
c3luYyBzdXBwb3J0ZWQgbW9kZSBmb3Igd2hpY2ggZnVsbCBtb2Rlc2V0IGlzIG5vdCBuZWVkZWQu
Cj4gKyAqIFRoZSBkZWZhdWx0IHZhbHVlOiAwIChvZmYpLgo+ICsgKi8KPiArTU9EVUxFX1BBUk1f
REVTQygKPiArICAgICAgIGV4cGVyaW1lbnRhbF9mcmVlc3luY192aWRlbywKPiArICAgICAgICJF
bmFibGUgZnJlZXN5bmMgbW9kZXNldHRpbmcgb3B0aW1pemF0aW9uIGZlYXR1cmUgKDAgPSBvZmYg
KGRlZmF1bHQpLCAxID0gb24pIik7CgpNYXliZSBqdXN0IGNhbGwgdGhpcyBmcmVlc3luY192aWRl
byBzbyB0aGF0IHdlIGNhbiBjaGFuZ2UgdGhlIGRlZmF1bHQKaWYgd2UgZGVjaWRlIHRvIGF0IHNv
bWUgcG9pbnQuCgpBbGV4Cgo+ICttb2R1bGVfcGFyYW1fbmFtZWQoZXhwZXJpbWVudGFsX2ZyZWVz
eW5jX3ZpZGVvLCBhbWRncHVfZXhwX2ZyZWVzeW5jX3ZpZF9tb2RlLCB1aW50LCAwNDQ0KTsKPiAr
Cj4gIC8qKgo+ICAgKiBET0M6IHJlc2V0X21ldGhvZCAoaW50KQo+ICAgKiBHUFUgcmVzZXQgbWV0
aG9kICgtMSA9IGF1dG8gKGRlZmF1bHQpLCAwID0gbGVnYWN5LCAxID0gbW9kZTAsIDIgPSBtb2Rl
MSwgMyA9IG1vZGUyLCA0ID0gYmFjbykKPiAtLQo+IDIuMjkuMgo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
