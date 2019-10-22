Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E9E13A9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CADA6E98C;
	Wed, 23 Oct 2019 08:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B7F6E478
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:30:05 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id s75so5011256ilc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gRw/ujH5u+b+betdi1nevIIXphQLiCiSZDxUemHbO5Y=;
 b=oOM8xEK7x+iL1OhSaOU1x39XABrTlSh3ndNI/cDeLm/LMBP2owf1WQatuW7VbGf+gb
 Yy+Uth0g/aSmCAaFPQPB47CQeL7ODC+aDQ9Nbw5z3NRX3gf95Ox2yi8WewtCeSchn2Do
 iK37zxqeHWXR/BB9zpehNUo9C4tw5ExkX65qlT+N0UDfqOSR8kLfAC+pfXqJUetM0iff
 kMw9kwBrfaVK4ySRInc8Pu65PmQUSb/TmAtOado97cG9tXvxoJO3DWYVIeuV7Ia0iHLt
 DVy5SQQQeaVnY9Tio2yjPPME2OO9fe3jdXpWch7uRka/rM0CIta3j/b9E4yBQuOGh/uV
 51Cg==
X-Gm-Message-State: APjAAAU57OrfvsRhzUybW+R3ZbldgF0Z3JnDeVu6dMa3jBO1h46+VtgR
 vuGFnKPzQPA+/j6qe+eHC+mv9KW0/ZZqBnWIq6CgKw==
X-Google-Smtp-Source: APXvYqwTEhbQMpuSFs84r7ugo4qVLnztGVLVZqVacNzBI0++y9xiHUd6bZtP+cs8fky9bkg68mB86FgAHUkM9Po/7lo=
X-Received: by 2002:a92:c80b:: with SMTP id v11mr31495749iln.6.1571736605168; 
 Tue, 22 Oct 2019 02:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191022083630.28175-1-brgl@bgdev.pl>
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Oct 2019 11:29:54 +0200
Message-ID: <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gRw/ujH5u+b+betdi1nevIIXphQLiCiSZDxUemHbO5Y=;
 b=LdOpa9KudKtIQ1kwtW9TBTIbnrBV/5NDwJYnFxW9fcRQouTABSwSE8KioMNdgsfG7N
 2PyMKz5c0JbgWMRUMjjnlK4ymZOGwR6QmDjnd+V/uOaVR0FN03WxSx4BcRDaEtUm3Hv9
 qlgI2ZOPms0DaZl5N9iumojS7tf8rYqvYTJh5+cE9cif3yFh9mG4aQNEH38it05RMUZk
 5VYiZP94/rSancG4fLtvR0W6zoO/dNeEjIo2xkxkte2BfBwWOs71csXFypYSQ5KCfgYD
 hT0Cm2eTZfzJuVaA7tBpcmz1V9OgffOifH5VOzcFYPkWpXVww1Qr2IiJBIbZNYOj5JYF
 mINA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

d3QuLCAyMiBwYcW6IDIwMTkgbyAxMDozNiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPiBuYXBpc2HFgihhKToKPgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
d3NraUBiYXlsaWJyZS5jb20+Cj4KPiBXaGlsZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyBy
ZWxhdGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFdIEkgbm90aWNlZAo+IHRoYXQgd2UgY291bGQgc2lt
cGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRlIHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KPiBk
YXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRldmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0
cmllcyB0byBkbwo+IHRoYXQuCj4KPiBGaXJzdCB0d28gcGF0Y2hlcyBjb250YWluIG1pbm9yIGZp
eGVzLiBUaGlyZCBwYXRjaCBtYWtlcyB0aGUgZHJpdmVyCj4gZXhwbGljaXRseSBkcml2ZSB0aGUg
R1BJTyBsaW5lLiBGb3VydGggcGF0Y2ggYWRkcyBhbGwgbmVjZXNzYXJ5IGRhdGEKPiBzdHJ1Y3R1
cmVzIHRvIGVjb3ZlYzI0LiBQYXRjaCA1LzkgdW5pZmllcyBtdWNoIG9mIHRoZSBjb2RlIGZvciBi
b3RoCj4gcGRhdGEgYW5kIG5vbi1wZGF0YSBjYXNlcy4gUGF0Y2hlcyA2LTcvOSByZW1vdmUgdW51
c2VkIHBsYXRmb3JtIGRhdGEKPiBmaWVsZHMuIExhc3QgdHdvIHBhdGNoZXMgY29udGFpbiBhZGRp
dGlvbmFsIGltcHJvdmVtZW50cyBmb3IgdGhlIEdQSU8KPiBiYWNrbGlnaHQgZHJpdmVyIHdoaWxl
IHdlJ3JlIGFscmVhZHkgbW9kaWZ5aW5nIGl0Lgo+Cj4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0
aGlzIEhXIGJ1dCBob3BlZnVsbHkgdGhpcyB3b3Jrcy4gT25seSBjb21waWxlCj4gdGVzdGVkLgo+
Cj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYvMjUvOTAwCj4KPiB2MSAtPiB2MjoK
PiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50
IGNoYW5nZXMgZnJvbSBBbmR5Cj4gLSBhZGRlZCBhZGRpdGlvbmFsIHR3byBwYXRjaGVzIHdpdGgg
bWlub3IgaW1wcm92ZW1lbnRzCj4KPiB2MiAtPiB2MzoKPiAtIGluIHBhdGNoIDcvNzogdXNlZCBp
bml0aWFsaXplcnMgdG8gc2V0IHZhbHVlcyBmb3IgcGRhdGEgYW5kIGRldiBsb2NhbCB2YXJzCj4K
PiB2MyAtPiB2NDoKPiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1LjQtcmMxCj4gLSByZW1vdmVkIGNo
YW5nZXMgdGhhdCBhcmUgbm8gbG9uZ2VyIHJlbGV2YW50IGFmdGVyIGNvbW1pdCBlYzY2NWI3NTZl
NmYKPiAgICgiYmFja2xpZ2h0OiBncGlvLWJhY2tsaWdodDogQ29ycmVjdCBpbml0aWFsIHBvd2Vy
IHN0YXRlIGhhbmRsaW5nIikKPiAtIGFkZGVkIHBhdGNoIDcvNwo+Cj4gdjQgLT4gdjU6Cj4gLSBp
biBwYXRjaCA3Lzc6IGFkZGVkIGEgY29tbWVudCByZXBsYWNpbmcgdGhlIG5hbWUgb2YgdGhlIGZ1
bmN0aW9uIGJlaW5nCj4gICBwdWxsZWQgaW50byBwcm9iZSgpCj4KPiB2NSAtPiB2NjoKPiAtIGFk
ZGVkIGEgcGF0Y2ggbWFraW5nIHRoZSBkcml2ZXIgZXhwbGljaXRseSBzZXQgdGhlIGRpcmVjdGlv
biBvZiB0aGUgR1BJTwo+ICAgdG8gb3V0cHV0Cj4gLSBhZGRlZCBhIHBhdGNoIHJlbW92aW5nIGEg
cmVkdW5kYW50IG5ld2xpbmUKPgo+IHY2IC0+IHY3Ogo+IC0gcmVuYW1lZCB0aGUgZnVuY3Rpb24g
Y2FsY3VsYXRpbmcgdGhlIG5ldyBHUElPIHZhbHVlIGZvciBzdGF0dXMgdXBkYXRlCj4gLSBjb2xs
ZWN0ZWQgbW9yZSB0YWdzCj4KPiBCYXJ0b3N6IEdvbGFzemV3c2tpICg5KToKPiAgIGJhY2tsaWdo
dDogZ3BpbzogcmVtb3ZlIHVubmVlZGVkIGluY2x1ZGUKPiAgIGJhY2tsaWdodDogZ3BpbzogcmVt
b3ZlIHN0cmF5IG5ld2xpbmUKPiAgIGJhY2tsaWdodDogZ3BpbzogZXhwbGljaXRseSBzZXQgdGhl
IGRpcmVjdGlvbiBvZiB0aGUgR1BJTwo+ICAgc2g6IGVjb3ZlYzI0OiBhZGQgYWRkaXRpb25hbCBw
cm9wZXJ0aWVzIHRvIHRoZSBiYWNrbGlnaHQgZGV2aWNlCj4gICBiYWNrbGlnaHQ6IGdwaW86IHNp
bXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCj4gICBzaDogZWNvdmVjMjQ6IGRvbid0
IHNldCB1bnVzZWQgZmllbGRzIGluIHBsYXRmb3JtIGRhdGEKPiAgIGJhY2tsaWdodDogZ3Bpbzog
cmVtb3ZlIHVudXNlZCBmaWVsZHMgZnJvbSBwbGF0Zm9ybSBkYXRhCj4gICBiYWNrbGlnaHQ6IGdw
aW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgo+ICAgYmFja2xpZ2h0OiBn
cGlvOiBwdWxsIGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoKSBpbnRvIHByb2Jl
Cj4KPiAgYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jICAgICAgICAgfCAgMzMg
KysrLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyAgICAgfCAx
MjggKysrKysrKy0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bp
b19iYWNrbGlnaHQuaCB8ICAgMyAtCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygr
KSwgOTUgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjMuMAo+CgpMZWUsIERhbmllbCwgSmluZ29v
LAoKSmFjb3BvIGlzIHRyYXZlbGxpbmcgdW50aWwgTm92ZW1iZXIgMXN0IGFuZCB3b24ndCBiZSBh
YmxlIHRvIHRlc3QgdGhpcwphZ2FpbiBiZWZvcmUgdGhpcyBkYXRlLiBEbyB5b3UgdGhpbmsgeW91
IGNhbiBwaWNrIGl0IHVwIGFuZCBpbiBjYXNlCmFueXRoaW5nJ3MgYnJva2VuIG9uIFNILCB3ZSBj
YW4gZml4IGl0IGFmdGVyIHY1LjUtcmMxLCBzbyB0aGF0IGl0CmRvZXNuJ3QgbWlzcyBhbm90aGVy
IG1lcmdlIHdpbmRvdz8KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
