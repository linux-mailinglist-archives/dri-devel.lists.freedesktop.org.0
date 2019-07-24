Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41172EA9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24466E4F9;
	Wed, 24 Jul 2019 12:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1616E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:27:45 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z3so87846766iog.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kb7eArCilWdKUvwfohxdII2qALNxjvAYl3lvEVMZ9qk=;
 b=CP+VxyVv3macR6smSubdmfujHNf+ur8pUMgiLrGDsNCPpkSeTNTV5RSgquANwf4W3M
 fyuRicNelObhDjSWcnZXhhauCk+kojNpMmfKYgo15bDYabHDP7xza7oVdPiG5J1M3wUe
 KKrO3i8voY6goT8Tex9tAQ1BlaPYp/Yp0kXJf9V8X4NgXJfGhcXJhQdBCSyIUcSAlAGd
 NwWyupYrLsPX6RHW7S7bA2eNa5opSvLnRKkICEYFtd5lr9tzReEQ58M09aZMvxGqrpNH
 pxr4NOfpTepT1vqr4MBFTsycIadA2FDP+z6NXb+rmmhhEbtaws2bg6Uptlg1JGeclG8N
 QfcA==
X-Gm-Message-State: APjAAAW6uDkKK7FN63ZfHJjmAhUpCS5c6lYzkNq49R0FjPY4DgzboUss
 1sRn46QJaXZC4fEsZjnZPRKUHqvbM+cVMm0NtKI=
X-Google-Smtp-Source: APXvYqzmN8vTeN4s5nOB+z3DmGITO+L5EC/Bb721+2hfW+hjZ6SuHLtd/pdIteqzcHzLZ3ZRwY+7/cfpmfZpM96HxeM=
X-Received: by 2002:a02:5b05:: with SMTP id g5mr81387107jab.114.1563956865306; 
 Wed, 24 Jul 2019 01:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jul 2019 10:27:34 +0200
Message-ID: <CAMRc=McfheXWjbvV=JeBz4hxHGb5XFqsKtun6+BfrSodH4tn_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kb7eArCilWdKUvwfohxdII2qALNxjvAYl3lvEVMZ9qk=;
 b=FNblimKx+rjoA1V3WXfUR4m6Iq3+TaxbTyU8mFKUXhELDK113890IrYfRO78n7UzKF
 1IEunSPuEZujSa5rreTEM/xTlEMYSAVaMZqmwYBfDw91Ixz1Xp+yhvDaIqA3tiNwnxdF
 9Cum8d7sFfluFaXFg5oazn+AGC9YF5zBQFKnlZOpgiSfMMCtrddzl1msoCzMazJV2dQB
 cbK/Mx2WmOr9yNYJvdNsbE37QqsbDlQgSaICPcdWK08ZFUTfEH1mPxOGNI7Rq4gZwry8
 SKEKAQRBKTJQlarxH0y+ncGoVQxWWEEq0s0rhJuTpMSbjweV2/KlRsrEokct1G/ymvEx
 fUwg==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

xZtyLiwgMjQgbGlwIDIwMTkgbyAxMDoyNSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPiBuYXBpc2HFgihhKToKPgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
d3NraUBiYXlsaWJyZS5jb20+Cj4KPiBXaGlsZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyBy
ZWxhdGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFdIEkgbm90aWNlZAo+IHRoYXQgd2UgY291bGQgc2lt
cGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRlIHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KPiBk
YXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRldmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0
cmllcyB0byBkbwo+IHRoYXQuCj4KPiBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBhbGwgbmVjZXNzYXJ5
IGRhdGEgc3RydWN0dXJlcyB0byBlY292ZWMyNC4gUGF0Y2gKPiAyLzcgdW5pZmllcyBtdWNoIG9m
IHRoZSBjb2RlIGZvciBib3RoIHBkYXRhIGFuZCBub24tcGRhdGEgY2FzZXMuIFBhdGNoZXMKPiAz
LTQvNyByZW1vdmUgdW51c2VkIHBsYXRmb3JtIGRhdGEgZmllbGRzLiBMYXN0IHRocmVlIHBhdGNo
ZXMgY29udGFpbgo+IGFkZGl0aW9uYWwgaW1wcm92ZW1lbnRzIGZvciB0aGUgR1BJTyBiYWNrbGln
aHQgZHJpdmVyIHdoaWxlIHdlJ3JlIGFscmVhZHkKPiBtb2RpZnlpbmcgaXQuCj4KPiBJIGRvbid0
IGhhdmUgYWNjZXNzIHRvIHRoaXMgSFcgYnV0IGhvcGVmdWxseSB0aGlzIHdvcmtzLiBPbmx5IGNv
bXBpbGUKPiB0ZXN0ZWQuCj4KPiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8yNS85
MDAKPgo+IHYxIC0+IHYyOgo+IC0gcmViYXNlZCBvbiB0b3Agb2YgdjUuMy1yYzEgYW5kIGFkanVz
dGVkIHRvIHRoZSByZWNlbnQgY2hhbmdlcyBmcm9tIEFuZHkKPiAtIGFkZGVkIGFkZGl0aW9uYWwg
dHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVudHMKPgo+IHYyIC0+IHYzOgo+IC0gaW4g
cGF0Y2ggNy83OiB1c2VkIGluaXRpYWxpemVycyB0byBzZXQgdmFsdWVzIGZvciBwZGF0YSBhbmQg
ZGV2IGxvY2FsIHZhcnMKPgo+IEJhcnRvc3ogR29sYXN6ZXdza2kgKDcpOgo+ICAgc2g6IGVjb3Zl
YzI0OiBhZGQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIHRvIHRoZSBiYWNrbGlnaHQgZGV2aWNlCj4g
ICBiYWNrbGlnaHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCj4g
ICBzaDogZWNvdmVjMjQ6IGRvbid0IHNldCB1bnVzZWQgZmllbGRzIGluIHBsYXRmb3JtIGRhdGEK
PiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVudXNlZCBmaWVsZHMgZnJvbSBwbGF0Zm9ybSBk
YXRhCj4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBkZXYgZnJvbSBzdHJ1Y3QgZ3Bpb19iYWNr
bGlnaHQKPiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIGRlZl92YWx1ZSBmcm9tIHN0cnVjdCBn
cGlvX2JhY2tsaWdodAo+ICAgYmFja2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFibGUg
Zm9yICZwZGV2LT5kZXYKPgo+ICBhcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMg
ICAgICAgICB8IDMzICsrKysrKy0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMgICAgIHwgODIgKysrKystLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9w
bGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAgMyAtCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjEuMAo+CgpEYW5p
ZWwsCgpJIG1pc3NlZCB5b3VyIHJldmlldyB0YWdzIC0gY291bGQgeW91IGFkZCB0aGVtIGFnYWlu
PwoKVGhhbmtzLApCYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
