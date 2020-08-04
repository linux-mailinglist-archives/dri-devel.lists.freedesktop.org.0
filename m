Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F123B2BD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E0889C97;
	Tue,  4 Aug 2020 02:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A095E89C53
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:28:16 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so11716059edx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 19:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3VaUA85YIwK/GFoT+TFnVv7zZIvZQuC2vI63sNZnp0E=;
 b=N91Zg4h6esEcBjNkVrvfo2G8ux/IS/w/Ax31jELoe1VEp0GoSGYkCEZvM9QBRSBl+T
 zoW01Otb/elNeDDZU5jOR2lazUcx12XhDg2Y8W/T5gJzj6gFHLFeZ9AtBbguaBGb9A13
 LeMTXP9Mjw3qyhFmSJ2+nVzoqMZ7uvNeXOzUkLWRPpv3u03x2PBy7dSYFG91gciuEwmW
 T6JjITFoyU/VEClNDQwmoKuOfXashQ2/QQH1jChcLPUq9wZfP+xNBMnle8l5miRcUZId
 yqpVbAoplkVhuhS34op0eHpKmPRFvHQ9+RM7Tru9+C94PZRbfklwBJwASRGzNnJkjpy1
 cggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3VaUA85YIwK/GFoT+TFnVv7zZIvZQuC2vI63sNZnp0E=;
 b=orzc+sGIOllP7RL6NwR2H8oX+dkbYdIjsKney+2dzopARAKN/p2S+63+VhEhB8zrru
 5TUoizLFJA1Oh+no9jHUhjxdh2eWuP8QfusFf0lPYDwutLeCsjC7T08a+BH89JZr1vLx
 pTgH3HEgvHeyaXCklfl3bCZsdJ1FG15mEZsiQf+2JuLWtx4UXyLmd49h1+NTcBqkAh3+
 NW3Gqg4d/W0lBaIHsvOef3LZaKuGCsuGviYX4k5lhRJrddsK38ESth6ibU6c8ywonNdX
 BUYMPDBV6qqtDsfNNzri2LUh1BWgKIO1RwTlz94RNRLx7bVNyz+7nzz088NwSPPg2Zuz
 6FGQ==
X-Gm-Message-State: AOAM533s7Kijk04N64dTpP8ZZcL0OQ4IL1NgS4nqiKqZ+HvdytzJ6sQ7
 QJ1WSlH2I9rSF2feJPERvzYstABnDzsyRbOxUHg=
X-Google-Smtp-Source: ABdhPJytFYhg+JGkMbPnRrxM40zeaGqJYo/JjSUkSqaoDCSr83krIug7RwbaxygZ1LajEah/Vv1njYAgkUSJ3egWSkI=
X-Received: by 2002:aa7:c792:: with SMTP id n18mr4800434eds.113.1596508095169; 
 Mon, 03 Aug 2020 19:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-16-airlied@gmail.com>
 <5915aff0-573b-06b6-4eba-5f60b83539d4@amd.com>
In-Reply-To: <5915aff0-573b-06b6-4eba-5f60b83539d4@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 4 Aug 2020 12:28:04 +1000
Message-ID: <CAPM=9tyPja+oNOTLXBMpuU2kquUT7sdbvU3EenvPGMcZwv_A7w@mail.gmail.com>
Subject: Re: [PATCH 15/49] drm/ttm: make some inline helper functions for
 cleanup paths.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMSBKdWwgMjAyMCBhdCAyMzowNywgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDMxLjA3LjIwIHVtIDA2OjA0IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
PiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8ICA2ICsrLS0tLQo+
ID4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgMTIgKysrKysrKysrKysrCj4g
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPiA+IGluZGV4IDg0ZTM5OTM5NWU0Zi4uZjU4NGU1ZTk0Mzgz
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ID4gQEAgLTE0NjIsOCArMTQ2Miw3IEBAIGlu
dCB0dG1fYm9fY2xlYW5fbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIG1l
bV90eXBlKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gICAgICAgfQo+ID4KPiA+
IC0gICAgIG1hbi0+dXNlX3R5cGUgPSBmYWxzZTsKPiA+IC0gICAgIG1hbi0+aGFzX3R5cGUgPSBm
YWxzZTsKPiA+ICsgICAgIHR0bV9ib19kaXNhYmxlX21tKG1hbik7Cj4gPgo+ID4gICAgICAgcmV0
ID0gMDsKPiA+ICAgICAgIGlmIChtZW1fdHlwZSA+IDApIHsKPiA+IEBAIC0xNDc2LDggKzE0NzUs
NyBAQCBpbnQgdHRtX2JvX2NsZWFuX21tKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1bnNp
Z25lZCBtZW1fdHlwZSkKPiA+ICAgICAgICAgICAgICAgcmV0ID0gKCptYW4tPmZ1bmMtPnRha2Vk
b3duKShtYW4pOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIGRtYV9mZW5jZV9wdXQobWFuLT5t
b3ZlKTsKPiA+IC0gICAgIG1hbi0+bW92ZSA9IE5VTEw7Cj4gPiArICAgICB0dG1fYm9fbWFuX2Ns
ZWFudXAobWFuKTsKPiA+Cj4gPiAgICAgICByZXR1cm4gcmV0Owo+ID4gICB9Cj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90
dG1fYm9fZHJpdmVyLmgKPiA+IGluZGV4IGQwZjFhNmNkZmJhNy4uOTJiYjU0Y2NlNjMzIDEwMDY0
NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+ID4gKysrIGIvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+ID4gQEAgLTY3MSw2ICs2NzEsMTggQEAgc3Rh
dGljIGlubGluZSB2b2lkIHR0bV9ib191c2VfbW0oc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2Vy
ICptYW4pCj4gPiAgICAgICBtYW4tPnVzZV90eXBlID0gdHJ1ZTsKPiA+ICAgfQo+ID4KPiA+ICtz
dGF0aWMgaW5saW5lIHZvaWQgdHRtX2JvX2Rpc2FibGVfbW0oc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4pCj4gPiArewo+ID4gKyAgICAgbWFuLT5oYXNfdHlwZSA9IGZhbHNlOwo+ID4g
KyAgICAgbWFuLT51c2VfdHlwZSA9IGZhbHNlOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgdHRtX2JvX21hbl9jbGVhbnVwKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
bWFuKQo+ID4gK3sKPiA+ICsgICAgIGRtYV9mZW5jZV9wdXQobWFuLT5tb3ZlKTsKPiA+ICsgICAg
IG1hbi0+bW92ZSA9IE5VTEw7Cj4gPiArfQo+ID4gKwo+Cj4gV2hhdCdzIHRoZSB2YWx1ZSBpbiBt
YWtpbmcgdGhvc2UgaW5saW5lPyBUaGlzIGlzIG5vdCBwZXJmb3JtYW5jZQo+IGNyaXRpY2FsIGF0
IGFsbC4KPgoKTm90IGZvciBwZXJmb3JtYW5jZSwgYnV0IHRoZXkgd2VyZSB0b28gdHJpdmlhbCB0
byBib3RoZXIgcHV0dGluZyBpbgpyZWFsIGZ1bmN0aW9ucywgaWYgdGhlcmUgd2FzIG1vcmUgZ29p
bmcgb24gSSdkIHByb2JhYmx5IGhhdmUgcHV0IHRoZW0KaW50byBmdW5jdGlvbnMsIGJ1dCBzZXR0
aW5nIHR3byBiaXRzLCBhbmQgcHV0dGluZyBhIGZlbmNlIGRpZG4ndCBzZWVtCndvcnRoIGFkZGlu
ZyBmdW5jdGlvbiBjYWxsIG92ZXJoZWFkIHdoZXJlIHRoZXJlIHdhcyBub25lIGJlZm9yZS4KCkRh
dmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
