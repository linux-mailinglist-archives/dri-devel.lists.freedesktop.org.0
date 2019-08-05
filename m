Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FEC8269F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 23:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8236E157;
	Mon,  5 Aug 2019 21:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FBF6E157
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:12:24 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x3so5385621lfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 14:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52Df7UYy5EhBLL4bv/P+/OnUf70c8jTeH6mJgj5Nc6s=;
 b=kfnHIAIFh2XEvZVcbjMhf5TVvxl8Xa6kuGpTy34mMOQ1yOBt1qWS+FbQi1CHtf5t8p
 q45whciQlf+BpupcTyXgObmdYviDIfsUkMZn7JlRKt4d3cZ/+ooO+f/OG+W++TAi8tOz
 nkYtp8RhTI5ew1qa6byvinKPKwC2q+JV2lN2vJrjSBEw8042dj5HExg5rkgYK+yNStmC
 nLUP+UrpUVfkyL0VOn7I0W4MUOZc6MOdJL9KJ2D6VlXGqOM+I4TmZ7hdLXaFJ9YhYecS
 FCNnll9uN9q/rhHkcme+PnevNw4WE+imp4sPMiB2Ho4Wjx3F8iZv4nOLeYL2hdwT+iEH
 SJvw==
X-Gm-Message-State: APjAAAU4PgvQKFDUk3t7+U1CNZgkAd7S+Dap901YRxmYgI4UsTzXTY6g
 JQtcgfD1s8GolRQn89x4lNQBqIrjZj71f00n+UvGWQ==
X-Google-Smtp-Source: APXvYqyKCE9i41W7XXqJZ+YQ19WTxKlx1r3Tj3XoIOE9+3G2LGoa7zZV9WsUtd9BV0if5aOUW/6qAi6Sf9CuvXhzjNg=
X-Received: by 2002:a19:e006:: with SMTP id x6mr71138714lfg.165.1565039542766; 
 Mon, 05 Aug 2019 14:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 23:12:10 +0200
Message-ID: <CACRpkdZBqxBKrLi+QskNpC8LPxY9OFOVL0K0pVBOkc61+ZXzGg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=52Df7UYy5EhBLL4bv/P+/OnUf70c8jTeH6mJgj5Nc6s=;
 b=HvwClAPwJG3Pi3R4ysSHdSnZra19G+8lxf4u1AX3bm8UTIL32r5/3r4AQDUUnJ/o3L
 dpaHikb4ucEdmircjNP99G70agmxOPDPQMJwswRiDJ0anTMpviFli3+46wzjbxWNr1qH
 dghsq9SmMx3LQM+G8BVjUzYIiqSKOMRrvkiKT79W6AoIWk+5Pip47CWTOVU0kk2YNmU+
 0Izo3RTcKcBjeZveVRbI9DDa6X/mc1vAauC8y3m2avmDY+FIHe/0IazV0HkXFcr81ler
 t8S7rjmV2wXa1V+9Jsr6Shx95cI1Kl0lZoh/K5dH9RDgTkaryuZnjn+7/Z/NwST+Y+HQ
 WbKA==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjUgQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
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
ZGV2IGxvY2FsIHZhcnMKClRoZSBzZXJpZXM6ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
