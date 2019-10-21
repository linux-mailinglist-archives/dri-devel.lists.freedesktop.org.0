Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0223DF7E9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F686E293;
	Mon, 21 Oct 2019 22:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3366889EAE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 12:21:33 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id l12so11779146ilq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 05:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wnGtB4lj7QZakI4bXBl4LOnjDVuoS6i9juH0AaPHUsI=;
 b=JgPOrO3xCQlyksKFhKrDFplnV7l9UQJ9q+JYv5cx9ea2NZ4ezgumfsCc2ZvTxEBtX2
 1v0mEq841xvhoQ9VNCCuvAKW9vGizCzUU8L6O2Rp8KbhiDuhr/Hh2tSi9hWePUiX4Ttt
 z4pgCP87D+ch/wyepFVHSTBsjLhy633zSXxyXYdIlqSKCqcFL0B7XXgJ0k/aEXXltKN5
 Vu49juvW8Vt/klOcbv/Q16FHxTgNZjNiMLTjsJrZFxo/6ed2L3IzT9mbf9bHHWwo3/Am
 DzOowqDGJv2oZgruxOtGmZdWWPkw6jEXleKt2gy2Fv14aLTzYRSVzm4t7r65RrW1yhi0
 corA==
X-Gm-Message-State: APjAAAWGP7VbXO8w8SmMXymTaYGEMs4SXo9bepxqc/flFLzqox5OncKx
 LgBKFQ04Vot2d/j6G93lMFzMrLpf7Hk3rbuSBYPbmw==
X-Google-Smtp-Source: APXvYqxYqbLQZbfxUfYl5IZ0yaJHH03rYbBNlFarkoXOb5pIu+StSQSkslvJykiuWugAbTzjBnKJwDiNY2bcVyEpgSA=
X-Received: by 2002:a92:410c:: with SMTP id o12mr25941800ila.287.1571660492888; 
 Mon, 21 Oct 2019 05:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191019083556.19466-1-brgl@bgdev.pl>
 <20191019083556.19466-4-brgl@bgdev.pl>
 <20191021104509.p2bsll3rwe7ica6t@holly.lan>
In-Reply-To: <20191021104509.p2bsll3rwe7ica6t@holly.lan>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Oct 2019 14:21:21 +0200
Message-ID: <CAMRc=Md99q+67FAduiixQQs6BVtLXNrC=KbicsuBsB2Jp4O7dw@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] backlight: gpio: explicitly set the direction of
 the GPIO
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wnGtB4lj7QZakI4bXBl4LOnjDVuoS6i9juH0AaPHUsI=;
 b=yqzJO5yrEuZ0AujBs35LlMVgp6QrGyJjIObeyazkPjRn1j5wQVKWq6ySSs5n6N4uiw
 w7AvSYJxB4dwHnN4Ik35WPXIfmBuhe7CsdcgDCSBhAMZJYWjhfy5dXSqH5XFQGMRCiL7
 IDZuf7KHDhV7oNVgFuYj4nLiL3qZQdEK4nrMHqRbpO0nMszqcZGhHNGy/GBtrkmkYzAL
 yXeyd+jUgvOFi1sZvsBGEwDj2CQv2SACk7Dp90Yp6dxMObXcSZ58Nk2OSFEIQIPF4hSy
 Xtzxus/dbLmFmsv9pIP40s+WzRnsGXN55Dx17Z3AwLupEnMqRwCTVQozron87CbKuu/n
 mb5Q==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG9uLiwgMjEgcGHFuiAyMDE5IG8gMTI6NDUgRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KbmFwaXNhxYIoYSk6Cj4KPiBPbiBTYXQsIE9jdCAxOSwgMjAxOSBhdCAx
MDozNTo1MEFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+Cj4gPiBUaGUg
R1BJTyBiYWNrbGlnaHQgZHJpdmVyIGN1cnJlbnRseSByZXF1ZXN0cyB0aGUgbGluZSAnYXMgaXMn
LCB3aXRob3V0Cj4gPiBhY2l2ZWx5IHNldHRpbmcgaXRzIGRpcmVjdGlvbi4gVGhpcyBjYW4gbGVh
ZCB0byBwcm9ibGVtczogaWYgdGhlIGxpbmUKPiA+IGlzIGluIGlucHV0IG1vZGUgYnkgZGVmYXVs
dCwgd2Ugd29uJ3QgYmUgYWJsZSB0byBkcml2ZSBpdCBsYXRlciB3aGVuCj4gPiB1cGRhdGluZyB0
aGUgc3RhdHVzIGFuZCBhbHNvIHJlYWRpbmcgaXRzIGluaXRpYWwgdmFsdWUgZG9lc24ndCBtYWtl
Cj4gPiBzZW5zZSBmb3IgYmFja2xpZ2h0IHNldHRpbmcuCj4gPgo+ID4gUmVxdWVzdCB0aGUgbGlu
ZSAnYXMgaXMnIGluaXRpYWxseSwgc28gdGhhdCB3ZSBjYW4gcmVhZCBpdHMgdmFsdWUKPiA+IHdp
dGhvdXQgYWZmZWN0aW5nIGl0IGJ1dCB0aGVuIGNoYW5nZSB0aGUgZGlyZWN0aW9uIHRvIG91dHB1
dCBleHBsaWNpdGx5Cj4gPiB3aGVuIHNldHRpbmcgdGhlIGluaXRpYWwgYnJpZ2h0bmVzcy4KPiA+
Cj4gPiBBbHNvOiBjaGVjayB0aGUgY3VycmVudCBkaXJlY3Rpb24gYW5kIG9ubHkgcmVhZCB0aGUg
dmFsdWUgaWYgaXQncyBvdXRwdXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPgo+IEludGVudCBsb29rcyBnb29k
IHRvIG1lIGJ1dC4uLgo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlv
X2JhY2tsaWdodC5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiA+IGluZGV4IDM5NTViNTEzZjJmOC4uYTM2
YWMzYTQ1YjgxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYwo+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGln
aHQuYwo+ID4gQEAgLTI1LDkgKzI1LDggQEAgc3RydWN0IGdwaW9fYmFja2xpZ2h0IHsKPiA+ICAg
ICAgIGludCBkZWZfdmFsdWU7Cj4gPiAgfTsKPiA+Cj4gPiAtc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF91cGRhdGVfc3RhdHVzKHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibCkKPiA+ICtzdGF0
aWMgaW50IGdwaW9fYmFja2xpZ2h0X2dldF9jdXJyX2JyaWdodG5lc3Moc3RydWN0IGJhY2tsaWdo
dF9kZXZpY2UgKmJsKQo+Cj4gVGhpcyBmdW5jdGlvbiBkb2VzIG5vdCBnZXQgdGhlIGN1cnJlbnQg
YnJpZ2h0bmVzcyAoZS5nLiB3aGF0IHRoZQo+IGhhcmR3YXJlIGlzIGN1cnJlbnRseSBkb2luZyku
IEdpdmVuIHdlJ3ZlIGp1c3QgbnVrZWQgdGhlIGZ1bmN0aW9uIHRoYXQKPiAqZGlkKiBnZXQgdGhl
IGN1cnJlbnQgYnJpZ2h0bmVzcyBmcm9tIHRoZSBoYXJkd2FyZSB0aGlzIGlzbid0IGFuCj4gYWNj
ZXB0YWJsZSBuYW1lLgo+Cj4gV291bGQgbGlrZSBzb21ldGhpbmcgbGlrZSBjYWxjX2JyaWdodG5l
c3MoKSBvciBnZXRfbmV4dF9icmlnaHRuZXNzKCkuCj4KCkZhaXIgZW5vdWdoLCB0aGUgbGF0dGVy
IHNvdW5kcyBnb29kIGluIHRoaXMgY2FzZS4KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
