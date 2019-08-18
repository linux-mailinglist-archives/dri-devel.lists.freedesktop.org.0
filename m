Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FDA92113
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55E889944;
	Mon, 19 Aug 2019 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2116F897E7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 16:59:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j17so7282481lfp.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 09:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1XLrmrHnxtun5E7MsD/TIJ4RWoKU+eFXlhCg4SB19I=;
 b=krZ2pZCFdJxEuPxxTnTD0NpnW6BzS4v+75OKW0j32wE9CtgbBUUD4M20BqFuWqugPN
 ttmctLsBnvItNMraQ7ZDaiyUxQq50FqzllKw1gJddH6Od/frs2fiFtcKEVw7syM67jgZ
 SJrhscncQhAjZ7DJnq4/GT0mxH9DFcflhKFR3ZwFjiF6gjSuHexvCjgFhQDNFrmV+n53
 UhjOMNOnLP2Rtt8v3Ol4hFBmPzvGUlY/6IG7quAAn4xAx8HCHNSfBH0gj0Pefdsg3pmW
 6srHLBCvQiovDrZ0XiMJk+VNWeiMLbXgnfrTVgw/1hNpncOnQZZ+x2Ibsgoq36YE/5NM
 Y0Gg==
X-Gm-Message-State: APjAAAXWYhxV6MBQ0urH+THImworPBVE8y0U8N2O4dfhKo6rsEo51u+b
 dgA98gQMjUA35yBTf4S3P8zqgqx2exaK548yxaA=
X-Google-Smtp-Source: APXvYqwokMINd0UH74GIpnd7io2ObKo5H7IBPFeCJ0QR+2t7jvX04nrJBuQQCcAlAVBzKURgEstM9cKCJfuNVAKHFNo=
X-Received: by 2002:ac2:484e:: with SMTP id 14mr9995204lfy.50.1566147590405;
 Sun, 18 Aug 2019 09:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <1564515200-5020-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zb5ySDbkHVpPkOKHTrF8jFuNh=dXtnwPKO6TuEHBCkYgg@mail.gmail.com>
 <CAFqt6zYsA_0YpZcZ8+LrMEjeWDJ5mwUDJNvqOW1H4ewgKbp+aQ@mail.gmail.com>
In-Reply-To: <CAFqt6zYsA_0YpZcZ8+LrMEjeWDJ5mwUDJNvqOW1H4ewgKbp+aQ@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 18 Aug 2019 22:29:38 +0530
Message-ID: <CAFqt6zYrX-5d8yYVwesYBPWQZK4iXPPv=2w7dqBtHvF9c1WJHA@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev:via: Remove dead code
To: FlorianSchandinat@gmx.de, b.zolnierkie@samsung.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=V1XLrmrHnxtun5E7MsD/TIJ4RWoKU+eFXlhCg4SB19I=;
 b=rhnqbmSuOY+3ZUyzlxvqIAPQ1XFULeoa/WbnYJFklorm8v700suEGO7RolfnDsPu0j
 0sVcYqTlNxP6GIcJigTatwt/g2ces8dcLQZJoZyO4grYu9m4TdhvYOIpZ4kd7KMtW0OR
 JRrgrKRO61SLRaACmkHAfRujvGQOpqeio/GD+vRfSdVsqqr0FZDEWmhXrP6WUzeBWj17
 wi/JKS2nekHQTnjdpktZ//KtAKa2QVmU0gvkwAle+NZSOoq/7+4/B6llPitWvk24UmTx
 YIGjzdzYj3s5xu5+2FB/tLFTfBlRNXS7qifdvOV2G7jNt602TzRGwvIETkne1JYutvwF
 yoJw==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNTozNyBQTSBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyA3LCAyMDE5IGF0IDI6MTEgUE0g
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9u
IFdlZCwgSnVsIDMxLCAyMDE5IGF0IDEyOjU5IEFNIFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGlu
dXhAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBpcyBkZWFkIGNvZGUgc2luY2Ug
My4xNS4gSWYgdGhlcmUgaXMgbm8gcGxhbiB0byB1c2UKPiA+ID4gaXQgZnVydGhlciwgdGhpcyBj
YW4gYmUgcmVtb3ZlZCBmb3JldmVyLgo+ID4gPgo+ID4KPiA+IEFueSBjb21tZW50IG9uIHRoaXMg
cGF0Y2ggPwo+Cj4gQW55IGNvbW1lbnQgb24gdGhpcyBwYXRjaCA/CgpJZiBubyBjb21tZW50IGNh
biB3ZSBnZXQgdGhpcyBpbiBxdWV1ZSBmb3IgNS40ID8KCj4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYS1jb3JlLmMgfCA0MyAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQzIGRlbGV0
aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi92aWEv
dmlhLWNvcmUuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYS1jb3JlLmMKPiA+ID4gaW5k
ZXggZTJiMjA2Mi4uZmZhMmNhMiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di92aWEvdmlhLWNvcmUuYwo+ID4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWEt
Y29yZS5jCj4gPiA+IEBAIC0yMjEsNDkgKzIyMSw2IEBAIHZvaWQgdmlhZmJfcmVsZWFzZV9kbWEo
dm9pZCkKPiA+ID4gIH0KPiA+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKHZpYWZiX3JlbGVhc2VfZG1h
KTsKPiA+ID4KPiA+ID4gLQo+ID4gPiAtI2lmIDAKPiA+ID4gLS8qCj4gPiA+IC0gKiBDb3B5IGEg
c2luZ2xlIGJ1ZmZlciBmcm9tIEZCIG1lbW9yeSwgc3luY2hyb25vdXNseS4gIFRoaXMgY29kZSB3
b3Jrcwo+ID4gPiAtICogYnV0IGlzIG5vdCBjdXJyZW50bHkgdXNlZC4KPiA+ID4gLSAqLwo+ID4g
PiAtdm9pZCB2aWFmYl9kbWFfY29weV9vdXQodW5zaWduZWQgaW50IG9mZnNldCwgZG1hX2FkZHJf
dCBwYWRkciwgaW50IGxlbikKPiA+ID4gLXsKPiA+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOwo+ID4gPiAtICAgICAgIGludCBjc3I7Cj4gPiA+IC0KPiA+ID4gLSAgICAgICBtdXRleF9s
b2NrKCZ2aWFmYl9kbWFfbG9jayk7Cj4gPiA+IC0gICAgICAgaW5pdF9jb21wbGV0aW9uKCZ2aWFm
Yl9kbWFfY29tcGxldGlvbik7Cj4gPiA+IC0gICAgICAgLyoKPiA+ID4gLSAgICAgICAgKiBQcm9n
cmFtIHRoZSBjb250cm9sbGVyLgo+ID4gPiAtICAgICAgICAqLwo+ID4gPiAtICAgICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZnbG9iYWxfZGV2LnJlZ19sb2NrLCBmbGFncyk7Cj4gPiA+IC0gICAgICAg
dmlhZmJfbW1pb193cml0ZShWRE1BX0NTUjAsIFZETUFfQ19FTkFCTEV8VkRNQV9DX0RPTkUpOwo+
ID4gPiAtICAgICAgIC8qIEVuYWJsZSBpbnRzOyBtdXN0IGhhcHBlbiBhZnRlciBDU1IwIHdyaXRl
ISAqLwo+ID4gPiAtICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9NUjAsIFZETUFfTVJfVERJ
RSk7Cj4gPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX01BUkwwLCAoaW50KSAocGFk
ZHIgJiAweGZmZmZmZmYwKSk7Cj4gPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX01B
UkgwLCAoaW50KSAoKHBhZGRyID4+IDI4KSAmIDB4ZmZmKSk7Cj4gPiA+IC0gICAgICAgLyogRGF0
YSBzaGVldCBzdWdnZXN0cyBEQVIwIHNob3VsZCBiZSA8PDQsIGJ1dCBpdCBsaWVzICovCj4gPiA+
IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX0RBUjAsIG9mZnNldCk7Cj4gPiA+IC0gICAg
ICAgdmlhZmJfbW1pb193cml0ZShWRE1BX0RRV0NSMCwgbGVuID4+IDQpOwo+ID4gPiAtICAgICAg
IHZpYWZiX21taW9fd3JpdGUoVkRNQV9UTVIwLCAwKTsKPiA+ID4gLSAgICAgICB2aWFmYl9tbWlv
X3dyaXRlKFZETUFfRFBSTDAsIDApOwo+ID4gPiAtICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRN
QV9EUFJIMCwgMCk7Cj4gPiA+IC0gICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX1BNUjAsIDAp
Owo+ID4gPiAtICAgICAgIGNzciA9IHZpYWZiX21taW9fcmVhZChWRE1BX0NTUjApOwo+ID4gPiAt
ICAgICAgIHZpYWZiX21taW9fd3JpdGUoVkRNQV9DU1IwLCBWRE1BX0NfRU5BQkxFfFZETUFfQ19T
VEFSVCk7Cj4gPiA+IC0gICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZ2xvYmFsX2Rldi5y
ZWdfbG9jaywgZmxhZ3MpOwo+ID4gPiAtICAgICAgIC8qCj4gPiA+IC0gICAgICAgICogTm93IHdl
IGp1c3Qgd2FpdCB1bnRpbCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc2F5cwo+ID4gPiAtICAgICAg
ICAqIHdlJ3JlIGRvbmUuCj4gPiA+IC0gICAgICAgICovCj4gPiA+IC0gICAgICAgd2FpdF9mb3Jf
Y29tcGxldGlvbl9pbnRlcnJ1cHRpYmxlKCZ2aWFmYl9kbWFfY29tcGxldGlvbik7Cj4gPiA+IC0g
ICAgICAgdmlhZmJfbW1pb193cml0ZShWRE1BX01SMCwgMCk7IC8qIFJlc2V0IGludCBlbmFibGUg
Ki8KPiA+ID4gLSAgICAgICBtdXRleF91bmxvY2soJnZpYWZiX2RtYV9sb2NrKTsKPiA+ID4gLX0K
PiA+ID4gLUVYUE9SVF9TWU1CT0xfR1BMKHZpYWZiX2RtYV9jb3B5X291dCk7Cj4gPiA+IC0jZW5k
aWYKPiA+ID4gLQo+ID4gPiAgLyoKPiA+ID4gICAqIERvIGEgc2NhdHRlci9nYXRoZXIgRE1BIGNv
cHkgZnJvbSBGQiBtZW1vcnkuICBZb3UgbXVzdCBoYXZlIGRvbmUKPiA+ID4gICAqIGEgc3VjY2Vz
c2Z1bCBjYWxsIHRvIHZpYWZiX3JlcXVlc3RfZG1hKCkgZmlyc3QuCj4gPiA+IC0tCj4gPiA+IDEu
OS4xCj4gPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
