Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B361F734D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 12:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C4B6E8BE;
	Mon, 11 Nov 2019 11:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9936E8BE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 11:41:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b11so12927394wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 03:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QrjCfBQcJwKIUUDAjSOiaKTYkFf5ndTaGfgn7ED2v/8=;
 b=l+hpdwl9HxGgy+i0e5UtUdxJI/fALFvngqif/Aq5dEBPwWiY4CdCK4LhhCsCyVZrTb
 ot2kIVX+7FsE2HPUz9Xt/qLo1/xofqfXRFyXJai/UqxGwSke4E6QGz62ESkf+GIulriR
 TrvWWRD1EMMNLCYr2EfwaWmbiiKihII1pzpbsaY4Vav2vgTLFwrtL38xf0pmP1Mt+Kta
 m6tjw8ZNR3Ot6OsUU8PLhxNOwP4v3ynwUhjKGv2YG7tHFfX2u9Ry4K+fLbPCQuJEkNIy
 PRZTAQZlsWSpvjmz31EhWnqp5kf/wExuBk6YJLWUHXjqC9yGuEQRKUAlUPBQTlMx7Vvt
 iU9g==
X-Gm-Message-State: APjAAAVuTJr9G6fg6Q/cLnEDZDniv1zjI/xO9ikRoqQDHhA1Mlz1pO2k
 o8gCEY5s88TbhB1H4Zn0VocStw==
X-Google-Smtp-Source: APXvYqzVlKEucZs/sDv+ll++yan1K7OhNmoAUm0WJEXWNZIj5Q9haqGMCwNCLqw05ElIJj46eF9uUw==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr9278569wmc.164.1573472498674; 
 Mon, 11 Nov 2019 03:41:38 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id g8sm15865768wmk.23.2019.11.11.03.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 03:41:38 -0800 (PST)
Date: Mon, 11 Nov 2019 11:41:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191111114130.GL3218@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=QrjCfBQcJwKIUUDAjSOiaKTYkFf5ndTaGfgn7ED2v/8=;
 b=xR/rfmwJkeoO0nfTViXcVfHVxtjQPIw+/g/mwtDyiWl0xvZzkju6l8kehaXwzlh2hE
 N1caFwcFkMVVjG7mM4hS1Blyhb6dQzMq3+L4kUjJL7APe9OhT789Q95imMdQbJBfa0pQ
 vSqM98PXFHwYP30Pq63EGCZNqrne1AYiDuqsb+LDO5ixEeUtq3iWulMX0I0BfR1te1hR
 Am4LMzfA9QgqbhrIfmXKSTmNE5mYxbuQVgCl78YPyliG86quWG85iMrVE6FPq8mHZZWB
 sux1xYxifK6ex8Q9BAODwMIaAlOmKV8P9Sc/tZOdcAfUTD3EagSv9YO0fIxUmlGiDJfy
 8isA==
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBPY3QgMjAxOSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKCj4gRnJvbTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiAKPiBXaGls
ZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyByZWxhdGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFd
IEkgbm90aWNlZAo+IHRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRl
IHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KPiBkYXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRl
dmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0cmllcyB0byBkbwo+IHRoYXQuCj4gCj4gRmly
c3QgdHdvIHBhdGNoZXMgY29udGFpbiBtaW5vciBmaXhlcy4gVGhpcmQgcGF0Y2ggbWFrZXMgdGhl
IGRyaXZlcgo+IGV4cGxpY2l0bHkgZHJpdmUgdGhlIEdQSU8gbGluZS4gRm91cnRoIHBhdGNoIGFk
ZHMgYWxsIG5lY2Vzc2FyeSBkYXRhCj4gc3RydWN0dXJlcyB0byBlY292ZWMyNC4gUGF0Y2ggNS85
IHVuaWZpZXMgbXVjaCBvZiB0aGUgY29kZSBmb3IgYm90aAo+IHBkYXRhIGFuZCBub24tcGRhdGEg
Y2FzZXMuIFBhdGNoZXMgNi03LzkgcmVtb3ZlIHVudXNlZCBwbGF0Zm9ybSBkYXRhCj4gZmllbGRz
LiBMYXN0IHR3byBwYXRjaGVzIGNvbnRhaW4gYWRkaXRpb25hbCBpbXByb3ZlbWVudHMgZm9yIHRo
ZSBHUElPCj4gYmFja2xpZ2h0IGRyaXZlciB3aGlsZSB3ZSdyZSBhbHJlYWR5IG1vZGlmeWluZyBp
dC4KCkFsbCBhcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFy
byBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
