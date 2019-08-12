Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B910C8E6CC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881FA6E92F;
	Thu, 15 Aug 2019 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99AF6E506
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:41 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j17so20019766lfp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qOdEFC2M11gWaSPmcjDghbM0bbwUm04RK0v5uO2apg=;
 b=LSelsItQcdPrudiTJTjKP022/VroqTdwp7yernX6xKVYchAhaUMnxP6xYComCVpF2i
 F2K4kRmpMY6ZwbXio2Tz6d5MRaZZe3Q2GotuPByfe/OqbG8qoEPWna0MicNxFKqwefUJ
 mDmgUYhQ5B5bEI/fn8tn8gYQ2Ntv9AzyuizVCMiPiSb89VTAoayAbg3NwuhWJDi+8q3L
 eynJv2gFgeQmxHB732q392DblNlgryFn9KNdwP3q3wenUvS97FxPjf9IJuvsNx2dbREv
 5vTtNYXVEUQP0h4I41hqlGQh5tapokdDQxAg3UUFsd0UDZKEq2FtFQOHMZSUzH47V2P6
 F/Gg==
X-Gm-Message-State: APjAAAXMs+K5dNcyTiUTA/awztrJq0QWDlAVGnSF28s4W83z47yGxI5u
 Qmo6vnKYXcA/7LjC+W6moL4NhHZLz5Ukh7SS98c=
X-Google-Smtp-Source: APXvYqz3B/76maiN8iU2SHYGuDc8LbEmLoZtKd5InqL2eR3IO1G+3shPVco9MXX/jUMEsG+IcnjuF7rHRLMod6Vfdq4=
X-Received: by 2002:ac2:484e:: with SMTP id 14mr19367643lfy.50.1565611659997; 
 Mon, 12 Aug 2019 05:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <1564515200-5020-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zb5ySDbkHVpPkOKHTrF8jFuNh=dXtnwPKO6TuEHBCkYgg@mail.gmail.com>
In-Reply-To: <CAFqt6zb5ySDbkHVpPkOKHTrF8jFuNh=dXtnwPKO6TuEHBCkYgg@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 12 Aug 2019 17:37:28 +0530
Message-ID: <CAFqt6zYsA_0YpZcZ8+LrMEjeWDJ5mwUDJNvqOW1H4ewgKbp+aQ@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev:via: Remove dead code
To: FlorianSchandinat@gmx.de, b.zolnierkie@samsung.com
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4qOdEFC2M11gWaSPmcjDghbM0bbwUm04RK0v5uO2apg=;
 b=bm6JFeaJrLhrdxvwrgL87KoQHBHCewBcUoT2U/byVHVE3ObbAAy6bppBP1Nqiz4YWx
 PVT3ypwO0OkqNOcD5zyOeig2OqXTGd5gPHpwB+zawhlvxf5Or9WyAvnfeyPUOUtk7bGM
 3FtpbcGVEaSca+wwR7PRR0ZR7n1a82+rJl2EAVaPQaJRxJs9AffhXzO9UQGoWge/o9jh
 DhnJH2brcwMuBHEZObqjDOtHMb4ilsbmt6DkRoJYS25kZd9Fbc3JGSveoVNZ0750p8mm
 T0lShpIinpgE8k0zgEE9/+Bn7xgnnFf5qoKooFWRigATHI93FlUhCn9fp8Zkik4Q/+n6
 GgrA==
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

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAyOjExIFBNIFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGlu
dXhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDEyOjU5IEFN
IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBU
aGlzIGlzIGRlYWQgY29kZSBzaW5jZSAzLjE1LiBJZiB0aGVyZSBpcyBubyBwbGFuIHRvIHVzZQo+
ID4gaXQgZnVydGhlciwgdGhpcyBjYW4gYmUgcmVtb3ZlZCBmb3JldmVyLgo+ID4KPgo+IEFueSBj
b21tZW50IG9uIHRoaXMgcGF0Y2ggPwoKQW55IGNvbW1lbnQgb24gdGhpcyBwYXRjaCA/Cgo+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYS1jb3JlLmMgfCA0MyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
MyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi92
aWEvdmlhLWNvcmUuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYS1jb3JlLmMKPiA+IGlu
ZGV4IGUyYjIwNjIuLmZmYTJjYTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3ZpYS92aWEtY29yZS5jCj4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWEtY29y
ZS5jCj4gPiBAQCAtMjIxLDQ5ICsyMjEsNiBAQCB2b2lkIHZpYWZiX3JlbGVhc2VfZG1hKHZvaWQp
Cj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKHZpYWZiX3JlbGVhc2VfZG1hKTsKPiA+Cj4g
PiAtCj4gPiAtI2lmIDAKPiA+IC0vKgo+ID4gLSAqIENvcHkgYSBzaW5nbGUgYnVmZmVyIGZyb20g
RkIgbWVtb3J5LCBzeW5jaHJvbm91c2x5LiAgVGhpcyBjb2RlIHdvcmtzCj4gPiAtICogYnV0IGlz
IG5vdCBjdXJyZW50bHkgdXNlZC4KPiA+IC0gKi8KPiA+IC12b2lkIHZpYWZiX2RtYV9jb3B5X291
dCh1bnNpZ25lZCBpbnQgb2Zmc2V0LCBkbWFfYWRkcl90IHBhZGRyLCBpbnQgbGVuKQo+ID4gLXsK
PiA+IC0gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+IC0gICAgICAgaW50IGNzcjsKPiA+
IC0KPiA+IC0gICAgICAgbXV0ZXhfbG9jaygmdmlhZmJfZG1hX2xvY2spOwo+ID4gLSAgICAgICBp
bml0X2NvbXBsZXRpb24oJnZpYWZiX2RtYV9jb21wbGV0aW9uKTsKPiA+IC0gICAgICAgLyoKPiA+
IC0gICAgICAgICogUHJvZ3JhbSB0aGUgY29udHJvbGxlci4KPiA+IC0gICAgICAgICovCj4gPiAt
ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZnbG9iYWxfZGV2LnJlZ19sb2NrLCBmbGFncyk7Cj4g
PiAtICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9DU1IwLCBWRE1BX0NfRU5BQkxFfFZETUFf
Q19ET05FKTsKPiA+IC0gICAgICAgLyogRW5hYmxlIGludHM7IG11c3QgaGFwcGVuIGFmdGVyIENT
UjAgd3JpdGUhICovCj4gPiAtICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9NUjAsIFZETUFf
TVJfVERJRSk7Cj4gPiAtICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9NQVJMMCwgKGludCkg
KHBhZGRyICYgMHhmZmZmZmZmMCkpOwo+ID4gLSAgICAgICB2aWFmYl9tbWlvX3dyaXRlKFZETUFf
TUFSSDAsIChpbnQpICgocGFkZHIgPj4gMjgpICYgMHhmZmYpKTsKPiA+IC0gICAgICAgLyogRGF0
YSBzaGVldCBzdWdnZXN0cyBEQVIwIHNob3VsZCBiZSA8PDQsIGJ1dCBpdCBsaWVzICovCj4gPiAt
ICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9EQVIwLCBvZmZzZXQpOwo+ID4gLSAgICAgICB2
aWFmYl9tbWlvX3dyaXRlKFZETUFfRFFXQ1IwLCBsZW4gPj4gNCk7Cj4gPiAtICAgICAgIHZpYWZi
X21taW9fd3JpdGUoVkRNQV9UTVIwLCAwKTsKPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShW
RE1BX0RQUkwwLCAwKTsKPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX0RQUkgwLCAw
KTsKPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX1BNUjAsIDApOwo+ID4gLSAgICAg
ICBjc3IgPSB2aWFmYl9tbWlvX3JlYWQoVkRNQV9DU1IwKTsKPiA+IC0gICAgICAgdmlhZmJfbW1p
b193cml0ZShWRE1BX0NTUjAsIFZETUFfQ19FTkFCTEV8VkRNQV9DX1NUQVJUKTsKPiA+IC0gICAg
ICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZ2xvYmFsX2Rldi5yZWdfbG9jaywgZmxhZ3MpOwo+
ID4gLSAgICAgICAvKgo+ID4gLSAgICAgICAgKiBOb3cgd2UganVzdCB3YWl0IHVudGlsIHRoZSBp
bnRlcnJ1cHQgaGFuZGxlciBzYXlzCj4gPiAtICAgICAgICAqIHdlJ3JlIGRvbmUuCj4gPiAtICAg
ICAgICAqLwo+ID4gLSAgICAgICB3YWl0X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUoJnZp
YWZiX2RtYV9jb21wbGV0aW9uKTsKPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX01S
MCwgMCk7IC8qIFJlc2V0IGludCBlbmFibGUgKi8KPiA+IC0gICAgICAgbXV0ZXhfdW5sb2NrKCZ2
aWFmYl9kbWFfbG9jayk7Cj4gPiAtfQo+ID4gLUVYUE9SVF9TWU1CT0xfR1BMKHZpYWZiX2RtYV9j
b3B5X291dCk7Cj4gPiAtI2VuZGlmCj4gPiAtCj4gPiAgLyoKPiA+ICAgKiBEbyBhIHNjYXR0ZXIv
Z2F0aGVyIERNQSBjb3B5IGZyb20gRkIgbWVtb3J5LiAgWW91IG11c3QgaGF2ZSBkb25lCj4gPiAg
ICogYSBzdWNjZXNzZnVsIGNhbGwgdG8gdmlhZmJfcmVxdWVzdF9kbWEoKSBmaXJzdC4KPiA+IC0t
Cj4gPiAxLjkuMQo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
