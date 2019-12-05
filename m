Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7312A114102
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 13:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16226E0B7;
	Thu,  5 Dec 2019 12:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEAB6E0B7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 12:51:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id n12so2412413lfe.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 04:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNr/KxIe6ENF9v0/2qqeMhGVvzEjeiQLhULKB85aAz0=;
 b=iGf01F6gPrLid48577tGhrnQAY2PDyMctCmlHIgo5A0tA1D7dY8IxaifELiYbszNQ1
 TxO0y7dag20PF8gsbPmbXv9W+MWYj4Ycg8IrpiWqWmR/zg3+uHII0iu7UE1qBoJveBT8
 uAW3kCirB/AgvA5sh9rGGwWMg5lQaSepOYGZ6X/AJuRsuerFohV4jZEEDy3PCd9vznP2
 cMaZVKgKsF8VRSoXuvfygnUtLvy6LI2IIQa0lASuB4ujdCxAS329Jgul11hIym8KHTGJ
 xFZ1enbIezDlCw2YD5Fvk+2WQ4DEdc3kJ7SbBX9owo/vzrXJnTIQz9r4W0T9hRDTQhNp
 ZWPQ==
X-Gm-Message-State: APjAAAV7jnECzrqAb5Qd8RHGqsZ7Ecwn3WSFxuTAYGRMfEvGrBfdDIfh
 J92bp4nfrWv0Q+rW0FYaj1Zs+i0RQBmrYEelsbk=
X-Google-Smtp-Source: APXvYqzCQBqvPfpeeCaahPK/O5wSKUvd9XjCzjN24vwJ8XOQe/PnUbfWVe3uIUV6zmjAaSlB7laOvWXirIUiRbCQl+Y=
X-Received: by 2002:ac2:51a6:: with SMTP id f6mr5062077lfk.174.1575550274408; 
 Thu, 05 Dec 2019 04:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20191204184617.22201-1-tzimmermann@suse.de>
In-Reply-To: <20191204184617.22201-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 5 Dec 2019 13:51:03 +0100
Message-ID: <CAMeQTsaEhfbKyVeryx1cW8J=VZ+7ByTj6VRy1gmRP19X3avNJA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Call psb_driver_{load,unload}() before
 registering device
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mNr/KxIe6ENF9v0/2qqeMhGVvzEjeiQLhULKB85aAz0=;
 b=lXC15jc+CO8YQ3BHHjaYf2tNAxelTbVz+xszN8CTfcLqTr3+oUV89CV1j03IG1thHj
 ojM+O6JK5m4uMtEGtBuU4kjhGVN2orun/JSzjm01WCHOO3QYJn3rsgU1eia8cF30lOqG
 Pz4ljqEn1z+iWuv8DStYdJSD9hb0NcCQDwsX36EAlIxOMIplj3lbk5i5XlnBm+73Hq0x
 9wvf67LSvpnUPHGX4CrQu84WZFbUtouWk0zJHOhHmASDU11wgsk863swbPYDj8n0LWP/
 U1K7Ony/1Uqk2TYIlQt2MyGvj9C3UfWTv9/0qvrftnswkSdR/Uvgxc10B4fVf/YjMFIF
 NJig==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgNCwgMjAxOSBhdCA3OjQ2IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IFRoZSBsb2FkL3VubG9hZCBjYWxsYmFja3MgaW4gc3Ry
dWN0IGRybV9kcml2ZXIgYXJlIGRlcHJlY2F0ZWQuIFJlbW92ZQo+IHRoZW0gYW5kIGNhbGwgZnVu
Y3Rpb25zIGV4cGxpY2l0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KCkFja2VkLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsu
ci5qYWtvYnNzb25AZ21haWwuY29tPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2guCgotUGF0cmlrCgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMgfCA0MyArKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L3BzYl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jCj4gaW5kZXggMTky
YTM5ZTUyNjE3Li41MjU5MTQxNmY4ZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9wc2JfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYwo+
IEBAIC0yMyw3ICsyMyw2IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiAgI2luY2x1
ZGUgPGRybS9kcm1faW9jdGwuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gLSNpbmNs
dWRlIDxkcm0vZHJtX3BjaS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+Cj4KPiBAQCAtNDI3LDE0ICs0MjYsNDggQEAgc3RhdGlj
IGxvbmcgcHNiX3VubG9ja2VkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBpbnQg
Y21kLAo+Cj4gIHN0YXRpYyBpbnQgcHNiX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKPiAgewo+IC0gICAgICAgcmV0dXJuIGRy
bV9nZXRfcGNpX2RldihwZGV2LCBlbnQsICZkcml2ZXIpOwo+IC19Cj4gKyAgICAgICBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2Owo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICByZXQgPSBw
Y2lfZW5hYmxlX2RldmljZShwZGV2KTsKPiArICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gKwo+ICsgICAgICAgZGV2ID0gZHJtX2Rldl9hbGxvYygmZHJpdmVy
LCAmcGRldi0+ZGV2KTsKPiArICAgICAgIGlmIChJU19FUlIoZGV2KSkgewo+ICsgICAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKGRldik7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX3BjaV9k
aXNhYmxlX2RldmljZTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBkZXYtPnBkZXYgPSBwZGV2
Owo+ICsgICAgICAgcGNpX3NldF9kcnZkYXRhKHBkZXYsIGRldik7Cj4gKwo+ICsgICAgICAgcmV0
ID0gcHNiX2RyaXZlcl9sb2FkKGRldiwgZW50LT5kcml2ZXJfZGF0YSk7Cj4gKyAgICAgICBpZiAo
cmV0KQo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9kcm1fZGV2X3B1dDsKPgo+ICsgICAgICAg
cmV0ID0gZHJtX2Rldl9yZWdpc3RlcihkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOwo+ICsgICAgICAg
aWYgKHJldCkKPiArICAgICAgICAgICAgICAgZ290byBlcnJfcHNiX2RyaXZlcl91bmxvYWQ7Cj4g
Kwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICtlcnJfcHNiX2RyaXZlcl91bmxvYWQ6Cj4gKyAg
ICAgICBwc2JfZHJpdmVyX3VubG9hZChkZXYpOwo+ICtlcnJfZHJtX2Rldl9wdXQ6Cj4gKyAgICAg
ICBkcm1fZGV2X3B1dChkZXYpOwo+ICtlcnJfcGNpX2Rpc2FibGVfZGV2aWNlOgo+ICsgICAgICAg
cGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+ICsgICAgICAgcmV0dXJuIHJldDsKPiArfQo+Cj4g
IHN0YXRpYyB2b2lkIHBzYl9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICB7Cj4g
ICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+
IC0gICAgICAgZHJtX3B1dF9kZXYoZGV2KTsKPiArCj4gKyAgICAgICBkcm1fZGV2X3VucmVnaXN0
ZXIoZGV2KTsKPiArICAgICAgIHBzYl9kcml2ZXJfdW5sb2FkKGRldik7Cj4gKyAgICAgICBkcm1f
ZGV2X3B1dChkZXYpOwo+ICB9Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHBz
Yl9wbV9vcHMgPSB7Cj4gQEAgLTQ2Nyw4ICs1MDAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZp
bGVfb3BlcmF0aW9ucyBwc2JfZ2VtX2ZvcHMgPSB7Cj4KPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJp
dmVyIGRyaXZlciA9IHsKPiAgICAgICAgIC5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfTU9ERVNF
VCB8IERSSVZFUl9HRU0sCj4gLSAgICAgICAubG9hZCA9IHBzYl9kcml2ZXJfbG9hZCwKPiAtICAg
ICAgIC51bmxvYWQgPSBwc2JfZHJpdmVyX3VubG9hZCwKPiAgICAgICAgIC5sYXN0Y2xvc2UgPSBk
cm1fZmJfaGVscGVyX2xhc3RjbG9zZSwKPgo+ICAgICAgICAgLm51bV9pb2N0bHMgPSBBUlJBWV9T
SVpFKHBzYl9pb2N0bHMpLAo+IC0tCj4gMi4yMy4wCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
