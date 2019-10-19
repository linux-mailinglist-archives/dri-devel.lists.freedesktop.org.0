Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC0FDD84A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 13:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265CE89C9A;
	Sat, 19 Oct 2019 11:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C706C89C9A
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 11:02:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d22so4126156pll.7
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 04:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5vfy+N0HJhkAd61mrrTJP7hxadvxbbC71f+cce+TmuA=;
 b=udZjD9vUdn7SmbkIz5yn+ihbrFHZujXvs/jgM3QhngTvXdUK1/9dFzGOwEODZ2ld4O
 zp3nUA0KzC5Axd2RBbivuREwxTwHVUeUp2jlygaGzVQ+03AiTRcG/aucBqRhvScw7c6p
 WhvQ0gatLLwM6A0fMlk9Qu4Zy/PCikb5GsxmoWsZr2Y+oIiMJHau3cxOysAnsVGVifaG
 wLx4mwMWT4GGQQECN8+IiQebSDz6yU6sUjFjYNhAsl8JIxJgYgAh3em2ywtkXpCdIAi/
 Ifb1dg3bgBID7Wc6GkpQVrRnTKnEC3qwrGkxg3YU7/9eys79KDHyD2LGfQlsRaodZhWE
 9d0A==
X-Gm-Message-State: APjAAAVUJaFoEjpem65LLsyypD4f7UnIOkaVXIIfaabE0tqrisbJLGFy
 S2hzgldx72Q1UugsQIIEsFzt4r8HZ2KBvpzNFZc=
X-Google-Smtp-Source: APXvYqy0jhNhM7VCGYDN6zC4fxv2N1BdCAnSObzuZ5kjaQlx8tPwUMTzmZr/2ccoou/lgJfv6KsGWPIZ4irbf5K8gIc=
X-Received: by 2002:a17:902:b110:: with SMTP id
 q16mr14373482plr.262.1571482957267; 
 Sat, 19 Oct 2019 04:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191019083556.19466-1-brgl@bgdev.pl>
 <20191019083556.19466-3-brgl@bgdev.pl>
In-Reply-To: <20191019083556.19466-3-brgl@bgdev.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 19 Oct 2019 14:02:25 +0300
Message-ID: <CAHp75VcBWk6xiFKejuN7qq8yAcubxbfW6GfvL7hOdQWxfoDBzg@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] backlight: gpio: remove stray newline
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5vfy+N0HJhkAd61mrrTJP7hxadvxbbC71f+cce+TmuA=;
 b=W7n+E/u3skiQ69pm1r7wfiQo/HU+SGSsoYnyphLGGuj6GbMoTchFaWcEpzR3XaUslW
 MQ/wldf9yirYieBFgywlacB++8Wj6XtB6uyxw2LlKlyimR18FN4wEAAb7ZoLnYzgKhL6
 ySdCN3KsUrxZxMTlKYyg3lF/XLb1eMyxb5qSOMofJ8rPVlIuEthqo+NOTdljo+lkyW18
 jlJjRgr8wU1caPZaZXulDnRJLkqZ9egUyYT93tfOQL/LH2VYcDO++R5QKAwC2zMNRhbE
 ew2orPElf9jVtnaWC3t50Q2A/K+m8NSMC2Eg6eagicT1HAtgOdKVP5VFwbkEe8T+oxkK
 g9bA==
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
 Jingoo Han <jingoohan1@gmail.com>, Linux-SH <linux-sh@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTksIDIwMTkgYXQgMTI6NTggUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6
ZXdza2lAYmF5bGlicmUuY29tPgo+Cj4gUmVtb3ZlIGEgZG91YmxlIG5ld2xpbmUgZnJvbSB0aGUg
ZHJpdmVyLgo+CgpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29A
Z21haWwuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6
ZXdza2lAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlv
X2JhY2tsaWdodC5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBpbmRleCA3ZTE5OTAxOTlm
YWUuLjM5NTViNTEzZjJmOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYwo+IEBAIC05MSw3ICs5MSw2IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5p
dGlhbF9wb3dlcl9zdGF0ZShzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKPiAgICAgICAgIHJl
dHVybiBGQl9CTEFOS19VTkJMQU5LOwo+ICB9Cj4KPiAtCj4gIHN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICAgICAgICAg
c3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KPiAtLQo+IDIuMjMu
MAo+CgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
