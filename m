Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A053B85B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 17:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6BF89168;
	Mon, 10 Jun 2019 15:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D4589168
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:32:33 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B252206C3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:32:33 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id x2so10130773qtr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 08:32:33 -0700 (PDT)
X-Gm-Message-State: APjAAAWp34HEn3MJEYjtobMU99eekmkfMM6AJ0+/d5/YbCa01E78HLms
 lOFHNQcPVqLV4d/wlVRKU7WAdTSyHrLI4tVEiA==
X-Google-Smtp-Source: APXvYqxjQ9TA1P6Ht2O8PeZTg3hYlAVEIhT9z5mseSWLsLwT91zte6uFHs4ic4RwYx8Bgh9rqK7DRDD2uwxyTJ9b5SE=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr59457131qtb.224.1560180752527; 
 Mon, 10 Jun 2019 08:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190605150233.32722-1-narmstrong@baylibre.com>
In-Reply-To: <20190605150233.32722-1-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Jun 2019 09:32:21 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+kpbhwxR5BOLrTHOUMmrKWE-UTjEzJ3TBgENGpf9+XLA@mail.gmail.com>
Message-ID: <CAL_Jsq+kpbhwxR5BOLrTHOUMmrKWE-UTjEzJ3TBgENGpf9+XLA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: make devfreq optional again
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560180753;
 bh=WoFQnsK38pkAutiLQw16ODFBHsYo1F18GWMiy9ZPhpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vzncL7X9uiD9Wir/aAFBTXxy0XnXgdDmseMos/03WD0k1OrbGIj88m0T8PhJC/x3p
 9viR4CslM96a7844Gcsd0C433vPG76I5z5X5wgSYipb+co4oKOKI6kUczhbucSWsrL
 WWQWlP62R7jES7KBo0tpV4L/VWV2aZ0tBBt0ZFl8=
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
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCA5OjAyIEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBEZXZmcmVxIHJ1bnRpbWUgdXNhZ2Ugd2FzIG1hZGUg
bWFuZGF0b3J5LCB0aHVzIG1ha2luZyBwYW5mcm9zdCBmYWlsIHRvIHByb2JlCj4gb24gQW1sb2dp
YyBTOTEyIFNvQ3MgbWlzc2luZyB0aGUgIm9wZXJhdGluZy1wb2ludHMtdjIiIHByb3BlcnR5Lgo+
IE1ha2UgaXQgb3B0aW9uYWwgYWdhaW4sIGxlYXZpbmcgUE1fREVWRlJFUSBzZWxlY3RlZCBieSBk
ZWZhdWx0Lgo+Cj4gRml4ZXM6IGYzNjE3YjQ0OWQgKCJkcm0vcGFuZnJvc3Q6IFNlbGVjdCBkZXZm
cmVxIikKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIGZpeGVkIGVsc2UvaWYgbG9naWMg
aW4gcGFuZnJvc3RfZGV2ZnJlcV9pbml0Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmZyZXEuYyB8IDEzICsrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
