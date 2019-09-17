Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B58B4817
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072066EB01;
	Tue, 17 Sep 2019 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A681A6EAC8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 03:42:40 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id w3so430424vkm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 20:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7jFRh2n+jc8CB66SFHbbHRXtVEUNkro/yk+H2kFkL4=;
 b=TuHsmGZxCuTe0FerJ0ksSwE9mmI16k23R9jvAcFU015xfsZrmcvOouAF3oaB4zuMpm
 6z3ZBEYlhaFmH6JUETwHh0KtseOzQd2aOfa6JtZLrxS980ndyD0tB3AsU/RDQC3Roar/
 3XyQ6+/jXDkIo0rB6zMyx6Zs9VlO76uQjfQc4juqJj/CWfc9oTVibMlTI55qJX9lb1pb
 zrCuksvBPFcNCE/rEyJ2Z4iprCVF0DN+qbTL96nTZvyQtniIq2ryAIu+RAoeqhcjTGBA
 akaEkjP+uLGP/WeoQkuHqEZD1zoUP/01N2IsX2RX5rn201TCzY6GICYb+rZFDH5s0H++
 +VlQ==
X-Gm-Message-State: APjAAAXcnrbdfA6mHsX1+VAvgJJ//CTDf9MFzqqeIsmxgzyEw0ScQ0da
 x1HeuhQQ2wHFfHfs9bPF1ZJoCTa0vJ/B46mjRUoAdQ==
X-Google-Smtp-Source: APXvYqylyJkjns/aN+8l0EI9DIfbxa4N2MWKAfj7VPQ17LXO9wcipYNM8IikzhhUzIM4gFvBiWj5HLVhWZUDnoz6tN0=
X-Received: by 2002:a1f:1897:: with SMTP id 145mr495407vky.53.1568691759340;
 Mon, 16 Sep 2019 20:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190904233443.3f73c46b@canb.auug.org.au>
 <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
In-Reply-To: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
From: Kees Cook <keescook@google.com>
Date: Mon, 16 Sep 2019 20:42:27 -0700
Message-ID: <CAGXu5jJ-LzJx1Fr8b2b4xv9i9yG99CPc8SUoT3eF44kO0G7tYg@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7jFRh2n+jc8CB66SFHbbHRXtVEUNkro/yk+H2kFkL4=;
 b=FUcGfGtxkTlmSxmt5gQwEX7SA6xUHQX+bNPBzuYYzbxnau/esg+roqjPy12H12HyBR
 Zc8gHZ2vuWx3B14ue9hSTmXh7uTeYFFAinndbphpJ1tr39kAeihR/QQEuhgY3XRMvRY/
 1RoauBexXXia0w/m0sYWz9+GIXZxrbFb1BtQQiK/t6TjW8X7T4P4pRdxvomxNUBnxZAf
 4qstLG2jC3T0Gaj8ixNDXWhmW6qG4zpoimTr2cgIdksAirPMHKnisLEpFIEem9L5ikRR
 w0+lH6l71m+9WcIFlwhye0t8OP6AcQUUoEEcvK7PHMATLHnZcNC2jV2Nj2Aj5QCW23xa
 C/Sw==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Leo Li <sunpeng.li@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxOjU4IFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIDkvNC8xOSA2OjM0IEFNLCBTdGVwaGVuIFJvdGh3ZWxs
IHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IE5ld3M6IHRoaXMgd2lsbCBiZSB0aGUgbGFzdCBs
aW51eC1uZXh0IEkgd2lsbCByZWxlYXNlIHVudGlsIFNlcHQgMzAuCj4gPgo+ID4gQ2hhbmdlcyBz
aW5jZSAyMDE5MDkwMzoKPiA+Cj4KPiBvbiB4ODZfNjQ6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvZGNuMjAv
ZGlzcGxheV9ycV9kbGdfY2FsY18yMHYyLmM6Nzc6MDoKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9kY24yMC8uLi9kbWxfaW5saW5lX2RlZnMuaDogSW4g
ZnVuY3Rpb24g4oCYZG1sX21pbuKAmToKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2RtbC9kY24yMC8uLi9kbWxfaW5saW5lX2RlZnMuaDozNDoxOiBlcnJvcjog
U1NFIHJlZ2lzdGVyIHJldHVybiB3aXRoIFNTRSBkaXNhYmxlZAoKSSdtIHN0aWxsIHRyaXBwaW5n
IG92ZXIgdGhpcyB0b28uIFdoYXQgY29tcGlsZXJzIGFyZSBwZW9wbGUgYnVpbGRpbmcKd2l0aCB3
aGVyZSB0aGlzIGlzIE5PVCBoYXBwZW5pbmcgZm9yIGFuIGFsbG1vZGNvbmZpZz8KCkknbSB1c2lu
ZzoKZ2NjIChVYnVudHUgNy40LjAtMXVidW50dTF+MTguMDQuMSkgNy40LjAKCkJ1dCBpdCBoYXBw
ZW5zIG9uIG5ld2VyIGNvbXBpbGVycyB0b28uCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
