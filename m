Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F730FCED
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06D86EE4E;
	Thu,  4 Feb 2021 19:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3D66E98B;
 Thu,  4 Feb 2021 18:52:04 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id l11so2243281qvt.1;
 Thu, 04 Feb 2021 10:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8ZgAvEajl8OUNniz+1itXG7C5l6k2fF6JkJiBsO4nok=;
 b=nhMmLKArS2xb9cFp5MMKn5zJt2CZdTGK2ypgPa6MYMSt8duhxNfT5BFkLKjDiJAMXe
 wj6pNooIJSgf1MhhpBgtcavRJwxmF+xeTFBWe/YiQA5+B10FF4Yqv7dbpsZHSzdPzYYr
 vUgA3osoftu5awaOEuKhB3pAPpuRtJINsCondAWAr9QcdNXoV9azZWYVjdCMKl50r5AG
 zhIV9TjRDdVlHyrCbid0aZxIw2GmkSOfQGNWDFarSx2gq9dD/R4gUz5J1X6XVJ+IvvWz
 y6M3dda45nlYqZ05dheJD89SuSr/3wFCsVTJM3TaA7ZQNg/56Hyfc/1dVPGFufSQrsPw
 HCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8ZgAvEajl8OUNniz+1itXG7C5l6k2fF6JkJiBsO4nok=;
 b=dfFcoK2iEN0HhdA54vRm9Eh40U1NaWGQ8OtAnP5UX2cEYrkN8pheq5kIHIBXz3OYVf
 bZjqUUPrAPrT2Xto0vv4SOJkOuQRU7WIFq2XVq7D2EAnA3xT6ak8eeYNP5jAiFx1PRvO
 Fg8atSie2Y8V0b4/LTwNfAzVu6kHD8HSesPdknY12/EFJ2Osh3uJXHdOfmSXXQyjfgjQ
 mIAKJeawIjV5rS9hLaY2u8+4wHGCs2e3AU2QS6XthJLSghhGcRsskrs3evXo6iOgsctg
 Ghd00S4EV/utAnqpZvQb1Kbj7dOZihuflP9vPGKQFRuG209CjGqUMCrebid/IOOoE6Uh
 hjLQ==
X-Gm-Message-State: AOAM530z1VrctkgC+QWBnFHJPQRmKPDGAU33LuqbBjK/kAFjoMZrNPqu
 8jjwP5i8ckfbL5TI4u9m7FE=
X-Google-Smtp-Source: ABdhPJyJvT/YDmhSIb/x8r7uRaFvl000p8edHD/mRjYqlce+22wUNtkbzecqkR/f+Bcr9lN5Wu7enA==
X-Received: by 2002:a0c:fe0b:: with SMTP id x11mr656852qvr.18.1612464723755;
 Thu, 04 Feb 2021 10:52:03 -0800 (PST)
Received: from ?IPv6:2601:5c0:c200:27c6:cd86:137:1075:f377?
 ([2601:5c0:c200:27c6:cd86:137:1075:f377])
 by smtp.gmail.com with ESMTPSA id 186sm6052286qkh.30.2021.02.04.10.52.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 10:52:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 02/10] Revert "drm/qxl: do not run release if qxl
 failed to init"
From: Tong Zhang <ztong0001@gmail.com>
In-Reply-To: <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
Date: Thu, 4 Feb 2021 13:52:02 -0500
Message-Id: <60B8023C-78C9-441D-AA21-A13C4445F666@gmail.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-3-kraxel@redhat.com>
 <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:49 +0000
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKVGhlIG9yaWdpbmFsIHByb2JsZW0gd2FzIHF4bF9kZXZpY2VfaW5pdCgpIGNh
biBmYWlsLAp3aGVuIGl0IGZhaWxzIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2FsbCAKCXF4bF9tb2Rl
c2V0X2ZpbmkocWRldik7CglxeGxfZGV2aWNlX2ZpbmkocWRldik7CkJ1dCB0aG9zZSB0d28gZnVu
Y3Rpb25zIGFyZSBvdGhlcndpc2UgY2FsbGVkIGluIHRoZSBxeGxfZHJtX3JlbGVhc2UoKSAtCgpJ
IGhhdmUgcG9zdGVkIGFuIHVwZGF0ZWQgcGF0Y2guClRoZSBuZXcgcGF0Y2ggdXNlIHRoZSBmb2xs
b3dpbmcgbG9naWMKCisJaWYgKCFxZGV2LT5kZGV2Lm1vZGVfY29uZmlnLmZ1bmNzKQorCSAgcmV0
dXJuOwoJcXhsX21vZGVzZXRfZmluaShxZGV2KTsKCXF4bF9kZXZpY2VfZmluaShxZGV2KTsKClRo
YW5rcywKLSBUb25nCgoKPiBPbiBGZWIgNCwgMjAyMSwgYXQgMTozNCBQTSwgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IAo+IEhpCj4gCj4gQW0gMDQuMDIu
MjEgdW0gMTU6NTcgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+PiBUaGlzIHJldmVydHMgY29tbWl0
IGI5MTkwN2E2MjQxMTkzNDY1Y2E5MmUzNTdhZGYxNjgyMjI0MjI5NmQuCj4gCj4gVGhpcyBzaG91
bGQgYmUgaW4gdGhlIGNvcnJlY3QgZm9ybWF0LCBhcyBnaXZlbiBieSAnZGltIGNpdGUnLgo+IAo+
IGRpbSBjaXRlIGI5MTkwN2E2MjQxMTkzNDY1Y2E5MmUzNTdhZGYxNjgyMjI0MjI5NmQKPiBiOTE5
MDdhNjI0MTEgKCJkcm0vcXhsOiBkbyBub3QgcnVuIHJlbGVhc2UgaWYgcXhsIGZhaWxlZCB0byBp
bml0IikKPiAKPj4gUGF0Y2ggaXMgYnJva2VuLCBpdCBlZmZlY3RpdmVseSBtYWtlcyBxeGxfZHJt
X3JlbGVhc2UoKSBhIG5vcAo+PiBiZWNhdXNlIG9uIG5vcm1hbCBkcml2ZXIgc2h1dGRvd24gcXhs
X2RybV9yZWxlYXNlKCkgaXMgY2FsbGVkCj4+ICphZnRlciogZHJtX2Rldl91bnJlZ2lzdGVyKCku
Cj4+IENjOiBUb25nIFpoYW5nIDx6dG9uZzAwMDFAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuYyB8IDIgLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+PiBpbmRleCAzNGM4YjI1YjU3ODAuLmZiNWY2YTVl
ODFkNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKPj4gQEAgLTE0NCw4ICsxNDQsNiBAQCBz
dGF0aWMgdm9pZCBxeGxfZHJtX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4gIAkg
KiByZW9kZXJpbmcgcXhsX21vZGVzZXRfZmluaSgpICsgcXhsX2RldmljZV9maW5pKCkgY2FsbHMg
aXMKPj4gIAkgKiBub24tdHJpdmlhbCB0aG91Z2guCj4+ICAJICovCj4+IC0JaWYgKCFkZXYtPnJl
Z2lzdGVyZWQpCj4+IC0JCXJldHVybjsKPiAKPiBJJ20gbm90IHN1cmUgd2hhdCB0aGUgb3JpZ2lu
YWwgcHJvYmxlbSB3YXMsIGJ1dCBJJ20gc3VyZSB0aGF0IHRoaXMgaXNuJ3QgdGhlIGZpeCBmb3Ig
aXQuIElmIHRoZXJlJ3MgYSBwcm9ibGVtIHdpdGggc2h1dGRvd24sIHRoZSBvcGVyYXRpb25zIHJh
dGhlciBoYXZlIHRvIGJlIHJlb3JkZXJlZCBjb3JyZWN0bHkuCj4gCj4gV2l0aCB0aGUgY2l0YXRp
b24gc3R5bGUgYWRkcmVzczoKPiAKPiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4gCj4+ICAJcXhsX21vZGVzZXRfZmluaShxZGV2KTsKPj4gIAlxeGxf
ZGV2aWNlX2ZpbmkocWRldik7Cj4+ICB9Cj4gCj4gLS0gCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZm
ZXIKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
