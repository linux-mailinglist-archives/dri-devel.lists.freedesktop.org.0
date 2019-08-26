Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876839D934
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3641C6E321;
	Mon, 26 Aug 2019 22:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927126E321
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:35:08 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id e20so41348006iob.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR73dOPLV+Pq/EfAvMPvdl9VXPIGVXlmHtutdowbA8w=;
 b=K5p2myFwmXxCxDzyk1IoBjEvwceAFcoF7WSAbKRj+0W4aPGjguOkN0E+/Oray9JRkW
 L88rrQsKbWsrKNyI2F42Aws2KGGujy8y61PEN6/RPyVjK3QisiookeXml0uu0YakUav6
 BRyRw/6fTeflsxutVkmLcrHUYN28BBYXxY1TmnxhzCu/MW7rWJnCb89BuVpXA0QPjoi/
 G3+pJvYHgEJzaJjz5ULYf+XtuBZvg0DMx9LVYmwiW8oicLvS4DVlhS4893y4zG2gEo1f
 ow/tpcghiCbo03gCmL6RJsDpYGcrTo2it/J7EqSj2PaN/eq+pPjou4DAhkL7LVabtm5W
 yjnA==
X-Gm-Message-State: APjAAAWEaArZhHM8h15MemgwhNnhEQ5hdBDNkFIerHbJrW+LNcNBX6CK
 y4Bf8B91DtM5SsC5eMin8Gegs2oBQtc2T8TyQPNkXn85
X-Google-Smtp-Source: APXvYqxHblq6gKSwiBmBchpFPLh6rchETDLBs9SBgl/hgzpq8F2KDv3i9uyZVGR4IejBJ9fgI7IYrCeXxX5X4YjwbF4=
X-Received: by 2002:a6b:720e:: with SMTP id n14mr22961192ioc.139.1566858907770; 
 Mon, 26 Aug 2019 15:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190822094657.27483-1-kraxel@redhat.com>
In-Reply-To: <20190822094657.27483-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 26 Aug 2019 15:34:56 -0700
Message-ID: <CAPaKu7S_He9RYsxDi0Qco4u=Xnc3FjB5nvFT_Zh+o7pvFzCvRQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: add plane check
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TR73dOPLV+Pq/EfAvMPvdl9VXPIGVXlmHtutdowbA8w=;
 b=irvfEg+oBy3K9i5ph445YDh5/r39NmczOzUV8ARAEH39xs2pKuazZRoL8IZJP565KB
 GOc/68k8QyEfdgqvdqmMItaEkV1dgxRCAfUZkNHxZkvl/ct2uS7VhGvFTnW+UWomp5u0
 yQobZ63b6IegbwLLQ8bKDU49irtHmXs5q8J8a79OwT1acMhB+JPQ6dNfEHDzIFXG1jQy
 inTQiWt+m2Dw2FoBr1U3SZ/bVEWatEX7vus22wc8y/7MF8Zt1Y65+OpffB5hHZFXZZJL
 mMNcx/fwG3BubuSFgvditqHsYEXMaFQhPXp1TgX0RhrYG40tLkIrSziEej9egv5J833i
 /EYQ==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMjo0NyBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBVc2UgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3Rh
dGUoKQo+IHRvIHNhbml0eSBjaGVjayB0aGUgcGxhbmUgc3RhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgfCAxNyArKysrKysrKysrKysrKysrLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKPiBpbmRleCBhNDkyYWMzZjRhN2UuLmZlNWVmYjJk
ZTkwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCj4gQEAgLTg0
LDcgKzg0LDIyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIHZpcnRpb19n
cHVfcGxhbmVfZnVuY3MgPSB7Cj4gIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9wbGFuZV9hdG9taWNf
Y2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkKPiAgewo+IC0g
ICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICBib29sIGlzX2N1cnNvciA9IHBsYW5lLT50eXBlID09
IERSTV9QTEFORV9UWVBFX0NVUlNPUjsKPiArICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZTsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsgICAgICAgaWYgKCFzdGF0ZS0+
ZmIgfHwgIXN0YXRlLT5jcnRjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAg
ICAgICBjcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZS0+c3RhdGUs
IHN0YXRlLT5jcnRjKTsKPiArICAgICAgIGlmIChJU19FUlIoY3J0Y19zdGF0ZSkpCj4gKyAgICAg
ICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKSXMgZHJtX2F0b21pY19nZXRf
bmV3X2NydGNfc3RhdGUgYmV0dGVyIGhlcmU/Cgo+ICsKPiArICAgICAgIHJldCA9IGRybV9hdG9t
aWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKHN0YXRlLCBjcnRjX3N0YXRlLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX1BMQU5FX0hFTFBF
Ul9OT19TQ0FMSU5HLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRFJNX1BMQU5FX0hFTFBFUl9OT19TQ0FMSU5HLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNfY3Vyc29yLCB0cnVlKTsKPiArICAg
ICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3ByaW1hcnlf
cGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+IC0tCj4gMi4xOC4xCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
