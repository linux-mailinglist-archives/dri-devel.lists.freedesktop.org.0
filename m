Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC858739D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9FF6ED13;
	Fri,  9 Aug 2019 08:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066186E7E3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 08:17:12 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id s20so49746884otp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 01:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dNM5N57Ioc8DGeTZqQ0rAIXdhWsFh5H0j1dVFwmVmb4=;
 b=kLKpmEqS+IBhFAKc6e9R61T/LXScS/YsFV/Pxs9qlNKfDrl4NzJJACQHA+cZ+crlek
 obh/2sl3MI8bkuj/69/6KVQ0c37RtkfslSOEzb+5F6xpdXMouxHcY88iOdI9XqZVj80y
 zVQO6pUXw0S79/m1HNs7Ozi2EOrIOyxUeP5Wo5blT6d/3mtHpIOXXUuT2BlBGPitRsWS
 K/c1jPlsZVwAQPbiGHMe6leTWGknqhXX+cYz8IsL1FX92xut7s2IFdJ660zkVYNlx0ML
 psFXr9dpn7Kdq1YISIKdxProXO9SUwMdihxDs4G7Vqo1kocnvjjtdE6a72vqESROvXm2
 /gow==
X-Gm-Message-State: APjAAAX+hO0h1eCKvKhq2W8HbKcEENrw03nbZHGwig7HTIpqzxeMw5+k
 tdnyqZqhXxjeHF7NJ2cZUQh+vF2CSSGe4et4UYQpUw==
X-Google-Smtp-Source: APXvYqwRT6RNZjkYIS7Txd9d/bJwV7lSsUOLdoji98fPLPn7Ri1bmULRrvDu/Ajv9YIyI8JGyUg6MQO3Oo7ThI1tBJc=
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr13530588ioh.40.1565252231701; 
 Thu, 08 Aug 2019 01:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 8 Aug 2019 10:17:00 +0200
Message-ID: <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dNM5N57Ioc8DGeTZqQ0rAIXdhWsFh5H0j1dVFwmVmb4=;
 b=gtTvn2IndIxQCjjyBbjHq+P0txQocLhuW0xeMXqj5eVcDPoq6BuVqI7IpQwk2ignJU
 8DyRLC//uN/6s4e1rWXVDWevrneTBo4+Q9LtC2vL7AMkKhAOJx/zCw92RkkPUkwDWzSg
 Z6NT0FKxGa9xWPFOpGlnTaPTBu2ViA8/jlzJ2yIIPPoicWJH3Z0vbjMwPgB7EacgrSfH
 bY5qy+QwCAe8+Cb4SG0+Ennjuw3jVUeJKC/t8B+QMcMwMz8hVDhbiATUYO+l5pkzllhX
 iA98x/+0bobd6W0fdIaTCHrNOytdTCvT5jvTWdGy1E0GmN3OM+5b5NAV4IwZjrFZhUek
 SK6w==
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
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
NDQgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjEuMAo+CgpIaSBS
aWNoLCBZb3NoaW5vcmksCgpjYW4geW91IGFjayB0aGUgc2ggcGF0Y2hlcyBpbiB0aGlzIHNlcmll
cz8KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
