Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12885803ED
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 04:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F816E312;
	Sat,  3 Aug 2019 02:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC436E312
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 02:12:24 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y15so36889059pfn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 19:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0+Bh9KmnXViBMy75SYIrHK8KzqIb8xEh1Les/yPtYIU=;
 b=NCDH0HQaZizkKRpLvRAc8RuNwHudH5JSa0XJ9ABubL28giYPXt+21Y6c44mDrenBCh
 4peqKOJQKyNv4q1mqHOQ+tb6d0oHgINcOuZ6ykiGw83UBzmTw7damuA+ylnnVMqUmNK3
 eRfdy9/gAKdos6SOJt00YzfRoix76nk3V7r5aPHLuSGNj43l0+uzJtUJKt2o5oLFmuEq
 SJIRSpJ+skWHwz7JruX4YJMQAuok0d6oTaMAIXeTIfe1IF3z1ZtB8a+PVuMBpHATejD0
 WWu6fdh2fKpVoiR/k49HxsOR9KUQuc1JWo/vAvn2y8kGnaygD/M0ABT7OnBBsYDFn1V2
 eGvQ==
X-Gm-Message-State: APjAAAX6KvovJR7Xn3D7d4IcEAsFq5/4FcUcyFR7Io25Aj6FXykTGfhg
 hjmzJazSltI/DyfzAO9jrmrBQtNCsKM=
X-Google-Smtp-Source: APXvYqxFE10Abv2h+d0F63SfhCFmdx6AtEvxbdzGAwl9Ed1nqm194Q37CBphEcFBXWnGM1oKOcN5ww==
X-Received: by 2002:a62:1616:: with SMTP id 22mr63711224pfw.120.1564798343773; 
 Fri, 02 Aug 2019 19:12:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g4sm91419764pfo.93.2019.08.02.19.12.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Aug 2019 19:12:23 -0700 (PDT)
Date: Fri, 2 Aug 2019 19:12:22 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] video: fbdev: omapfb_main: Mark expected switch
 fall-throughs
Message-ID: <201908021912.0D14906FF9@keescook>
References: <20190802191542.GA32751@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802191542.GA32751@embeddedor>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0+Bh9KmnXViBMy75SYIrHK8KzqIb8xEh1Les/yPtYIU=;
 b=W1XDyd/eLmCYsL4iRwwQNmX8884q9VUr17ETlif8/CAA5qV8yN8Yxp8/uLiUKbEPNp
 vu2syS8+zGaNUypp+NYuHXzYTym6ux5nVs5SJnxyww8VukcpW0nBNSaaLSWxf7I1Dme+
 5a2tj/09h2LSKXtJKOVr6H1wa6ZWVaxHdDFgA=
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDI6MTU6NDJQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBNYXJrIHN3aXRjaCBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRv
IGZhbGwgdGhyb3VnaC4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2Fybmlu
ZyAoQnVpbGRpbmc6IG9tYXAxX2RlZmNvbmZpZyBhcm0pOgo+IAo+IGRyaXZlcnMvdmlkZW8vZmJk
ZXYvb21hcC9vbWFwZmJfbWFpbi5jOjQ0OToyMzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5
IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gZHJpdmVycy92aWRlby9m
YmRldi9vbWFwL29tYXBmYl9tYWluLmM6MTU0OTo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L29tYXAvb21hcGZiX21haW4uYzoxNTQ3OjM6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50
IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+IGRyaXZlcnMvdmlk
ZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jOjE1NDU6Mzogd2FybmluZzogdGhpcyBzdGF0ZW1l
bnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gZHJpdmVycy92
aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6MTU0MzozOiB3YXJuaW5nOiB0aGlzIHN0YXRl
bWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4uYzoxNTQwOjY6IHdhcm5pbmc6IHRoaXMgc3Rh
dGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+IGRyaXZl
cnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jOjE1Mzg6Mzogd2FybmluZzogdGhpcyBz
dGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gZHJp
dmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6MTUzNTozOiB3YXJuaW5nOiB0aGlz
IHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3Iu
Y29tPgoKUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoKLUtl
ZXMKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jIHwgOCAr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMKPiBpbmRleCA5MGVjYTY0ZTMxNDQuLjcwMmNjYTU5
YmRhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4u
Ywo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jCj4gQEAgLTQ0
Nyw2ICs0NDcsNyBAQCBzdGF0aWMgaW50IHNldF9jb2xvcl9tb2RlKHN0cnVjdCBvbWFwZmJfcGxh
bmVfc3RydWN0ICpwbGFuZSwKPiAgCQlyZXR1cm4gMDsKPiAgCWNhc2UgMTI6Cj4gIAkJdmFyLT5i
aXRzX3Blcl9waXhlbCA9IDE2Owo+ICsJCS8qIGZhbGwgdGhyb3VnaCAqLwo+ICAJY2FzZSAxNjoK
PiAgCQlpZiAocGxhbmUtPmZiZGV2LT5wYW5lbC0+YnBwID09IDEyKQo+ICAJCQlwbGFuZS0+Y29s
b3JfbW9kZSA9IE9NQVBGQl9DT0xPUl9SR0I0NDQ7Cj4gQEAgLTE1MzQsMjAgKzE1MzUsMjcgQEAg
c3RhdGljIHZvaWQgb21hcGZiX2ZyZWVfcmVzb3VyY2VzKHN0cnVjdCBvbWFwZmJfZGV2aWNlICpm
YmRldiwgaW50IHN0YXRlKQo+ICAJY2FzZSBPTUFQRkJfQUNUSVZFOgo+ICAJCWZvciAoaSA9IDA7
IGkgPCBmYmRldi0+bWVtX2Rlc2MucmVnaW9uX2NudDsgaSsrKQo+ICAJCQl1bnJlZ2lzdGVyX2Zy
YW1lYnVmZmVyKGZiZGV2LT5mYl9pbmZvW2ldKTsKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAg
CWNhc2UgNzoKPiAgCQlvbWFwZmJfdW5yZWdpc3Rlcl9zeXNmcyhmYmRldik7Cj4gKwkJLyogZmFs
bCB0aHJvdWdoICovCj4gIAljYXNlIDY6Cj4gIAkJaWYgKGZiZGV2LT5wYW5lbC0+ZGlzYWJsZSkK
PiAgCQkJZmJkZXYtPnBhbmVsLT5kaXNhYmxlKGZiZGV2LT5wYW5lbCk7Cj4gKwkJLyogZmFsbCB0
aHJvdWdoICovCj4gIAljYXNlIDU6Cj4gIAkJb21hcGZiX3NldF91cGRhdGVfbW9kZShmYmRldiwg
T01BUEZCX1VQREFURV9ESVNBQkxFRCk7Cj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4gIAljYXNl
IDQ6Cj4gIAkJcGxhbmVzX2NsZWFudXAoZmJkZXYpOwo+ICsJCS8qIGZhbGwgdGhyb3VnaCAqLwo+
ICAJY2FzZSAzOgo+ICAJCWN0cmxfY2xlYW51cChmYmRldik7Cj4gKwkJLyogZmFsbCB0aHJvdWdo
ICovCj4gIAljYXNlIDI6Cj4gIAkJaWYgKGZiZGV2LT5wYW5lbC0+Y2xlYW51cCkKPiAgCQkJZmJk
ZXYtPnBhbmVsLT5jbGVhbnVwKGZiZGV2LT5wYW5lbCk7Cj4gKwkJLyogZmFsbCB0aHJvdWdoICov
Cj4gIAljYXNlIDE6Cj4gIAkJZGV2X3NldF9kcnZkYXRhKGZiZGV2LT5kZXYsIE5VTEwpOwo+ICAJ
CWtmcmVlKGZiZGV2KTsKPiAtLSAKPiAyLjIyLjAKPiAKCi0tIApLZWVzIENvb2sKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
