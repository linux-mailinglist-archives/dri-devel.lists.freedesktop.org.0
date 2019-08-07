Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1DB85BD0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83036E796;
	Thu,  8 Aug 2019 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AC089AC0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 08:41:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so84623428ljh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 01:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYs/hQ3Y9LNfDGfBwcEVi7jKWGv89xUHBEJ8ouLAv+k=;
 b=Lm0wdyprFNdQJ4Ooo9yTtJvE1AiglDWN5TFactfV8j/YT0Ng0x6RYzcrTtmYOhYKOA
 MWe4ueAsEUS9zBU9y3Pp629pwGqLop+som1zp4zseUnFR/GO+nJqt27rcLj47e1StuoJ
 CCiovlHNhSJPDbylktIsU0TcKEqQERlI2T6JoqYEbUf/M1EKUaxlPH/m9qkMC+2/v05C
 /7xcWErsIMYlkkqikkTFqxpqlo1WwtP3k1kUf10PQ85DAciPJSEElI6tlQEUEjK3BGrO
 3z1A7E/qOmHTEzCwF9I4wti67QYBHJMDopZOGYhHvY95sblWUKjRdj3n9LBgVbVp52yf
 FDaw==
X-Gm-Message-State: APjAAAXsRsxnjpBX+RgID48Ssw/t5E2wi6o45kvzdrXdCOJVHgOWG2VR
 DWfWh/zavSuSHQH5O2gb5f13LUlFhVjvU2QIHXE=
X-Google-Smtp-Source: APXvYqyVOVGtiZzZb0C8zEOAb896AFsHxLnvz2H4GMAhBW2sjDWWEslMf/XyRcI9iSzv92vqZUIs05pv6SdtEdUML4I=
X-Received: by 2002:a2e:93cc:: with SMTP id p12mr4278994ljh.11.1565167299490; 
 Wed, 07 Aug 2019 01:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <1564515200-5020-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1564515200-5020-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 7 Aug 2019 14:11:27 +0530
Message-ID: <CAFqt6zb5ySDbkHVpPkOKHTrF8jFuNh=dXtnwPKO6TuEHBCkYgg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev:via: Remove dead code
To: FlorianSchandinat@gmx.de, b.zolnierkie@samsung.com
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eYs/hQ3Y9LNfDGfBwcEVi7jKWGv89xUHBEJ8ouLAv+k=;
 b=kQ0RgEnpAFC5CMzVJfhYi9nPHrh0w5+cXUjSBBYDhgTZ8497vE2tCTzV/bQ4HlC8LS
 vHu8ar8KSPjGI3fz819BSYQjXu9sLeuNcK1JCyLfeNOEEl5gUo3uq4l9Spc3SZ0qNLWX
 RRKcRRPsHVI8ZrWf6KgQ49/PH6BslLzpM8MEUWsM7IyrAMHmXOcwIJ+k4Vp8x1A6q4db
 wjnA9URJbuaAhiO93dKv6xhmv2gI73DPxoJG2a11fDNkS8YzmV+6ihxCHs1s6F/RUKy6
 pPtVh3AyTgL5MzM9xqRJv6KlPtsQdJQmPOEmoJjPro5Zf1h9wziybDyGzc/1y49nqCZG
 Ay6Q==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTI6NTkgQU0gU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyBkZWFkIGNvZGUgc2luY2UgMy4xNS4g
SWYgdGhlcmUgaXMgbm8gcGxhbiB0byB1c2UKPiBpdCBmdXJ0aGVyLCB0aGlzIGNhbiBiZSByZW1v
dmVkIGZvcmV2ZXIuCj4KCkFueSBjb21tZW50IG9uIHRoaXMgcGF0Y2ggPwoKPiBTaWduZWQtb2Zm
LWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy92aWRlby9mYmRldi92aWEvdmlhLWNvcmUuYyB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWEtY29yZS5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi92aWEvdmlhLWNvcmUuYwo+IGluZGV4IGUyYjIwNjIuLmZmYTJjYTIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi92aWEvdmlhLWNvcmUuYwo+ICsrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYS1jb3JlLmMKPiBAQCAtMjIxLDQ5ICsyMjEsNiBAQCB2
b2lkIHZpYWZiX3JlbGVhc2VfZG1hKHZvaWQpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwodmlh
ZmJfcmVsZWFzZV9kbWEpOwo+Cj4gLQo+IC0jaWYgMAo+IC0vKgo+IC0gKiBDb3B5IGEgc2luZ2xl
IGJ1ZmZlciBmcm9tIEZCIG1lbW9yeSwgc3luY2hyb25vdXNseS4gIFRoaXMgY29kZSB3b3Jrcwo+
IC0gKiBidXQgaXMgbm90IGN1cnJlbnRseSB1c2VkLgo+IC0gKi8KPiAtdm9pZCB2aWFmYl9kbWFf
Y29weV9vdXQodW5zaWduZWQgaW50IG9mZnNldCwgZG1hX2FkZHJfdCBwYWRkciwgaW50IGxlbikK
PiAtewo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAtICAgICAgIGludCBjc3I7Cj4g
LQo+IC0gICAgICAgbXV0ZXhfbG9jaygmdmlhZmJfZG1hX2xvY2spOwo+IC0gICAgICAgaW5pdF9j
b21wbGV0aW9uKCZ2aWFmYl9kbWFfY29tcGxldGlvbik7Cj4gLSAgICAgICAvKgo+IC0gICAgICAg
ICogUHJvZ3JhbSB0aGUgY29udHJvbGxlci4KPiAtICAgICAgICAqLwo+IC0gICAgICAgc3Bpbl9s
b2NrX2lycXNhdmUoJmdsb2JhbF9kZXYucmVnX2xvY2ssIGZsYWdzKTsKPiAtICAgICAgIHZpYWZi
X21taW9fd3JpdGUoVkRNQV9DU1IwLCBWRE1BX0NfRU5BQkxFfFZETUFfQ19ET05FKTsKPiAtICAg
ICAgIC8qIEVuYWJsZSBpbnRzOyBtdXN0IGhhcHBlbiBhZnRlciBDU1IwIHdyaXRlISAqLwo+IC0g
ICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX01SMCwgVkRNQV9NUl9URElFKTsKPiAtICAgICAg
IHZpYWZiX21taW9fd3JpdGUoVkRNQV9NQVJMMCwgKGludCkgKHBhZGRyICYgMHhmZmZmZmZmMCkp
Owo+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX01BUkgwLCAoaW50KSAoKHBhZGRyID4+
IDI4KSAmIDB4ZmZmKSk7Cj4gLSAgICAgICAvKiBEYXRhIHNoZWV0IHN1Z2dlc3RzIERBUjAgc2hv
dWxkIGJlIDw8NCwgYnV0IGl0IGxpZXMgKi8KPiAtICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRN
QV9EQVIwLCBvZmZzZXQpOwo+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX0RRV0NSMCwg
bGVuID4+IDQpOwo+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX1RNUjAsIDApOwo+IC0g
ICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX0RQUkwwLCAwKTsKPiAtICAgICAgIHZpYWZiX21t
aW9fd3JpdGUoVkRNQV9EUFJIMCwgMCk7Cj4gLSAgICAgICB2aWFmYl9tbWlvX3dyaXRlKFZETUFf
UE1SMCwgMCk7Cj4gLSAgICAgICBjc3IgPSB2aWFmYl9tbWlvX3JlYWQoVkRNQV9DU1IwKTsKPiAt
ICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9DU1IwLCBWRE1BX0NfRU5BQkxFfFZETUFfQ19T
VEFSVCk7Cj4gLSAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZnbG9iYWxfZGV2LnJlZ19s
b2NrLCBmbGFncyk7Cj4gLSAgICAgICAvKgo+IC0gICAgICAgICogTm93IHdlIGp1c3Qgd2FpdCB1
bnRpbCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc2F5cwo+IC0gICAgICAgICogd2UncmUgZG9uZS4K
PiAtICAgICAgICAqLwo+IC0gICAgICAgd2FpdF9mb3JfY29tcGxldGlvbl9pbnRlcnJ1cHRpYmxl
KCZ2aWFmYl9kbWFfY29tcGxldGlvbik7Cj4gLSAgICAgICB2aWFmYl9tbWlvX3dyaXRlKFZETUFf
TVIwLCAwKTsgLyogUmVzZXQgaW50IGVuYWJsZSAqLwo+IC0gICAgICAgbXV0ZXhfdW5sb2NrKCZ2
aWFmYl9kbWFfbG9jayk7Cj4gLX0KPiAtRVhQT1JUX1NZTUJPTF9HUEwodmlhZmJfZG1hX2NvcHlf
b3V0KTsKPiAtI2VuZGlmCj4gLQo+ICAvKgo+ICAgKiBEbyBhIHNjYXR0ZXIvZ2F0aGVyIERNQSBj
b3B5IGZyb20gRkIgbWVtb3J5LiAgWW91IG11c3QgaGF2ZSBkb25lCj4gICAqIGEgc3VjY2Vzc2Z1
bCBjYWxsIHRvIHZpYWZiX3JlcXVlc3RfZG1hKCkgZmlyc3QuCj4gLS0KPiAxLjkuMQo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
