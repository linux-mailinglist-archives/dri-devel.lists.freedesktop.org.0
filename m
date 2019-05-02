Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D4123A9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE7689870;
	Thu,  2 May 2019 20:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126D89870
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:52:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so5202222wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1Oxk4UYdC4lygiC7PghTgnV7KW16QuABt+QpGWy6Ks=;
 b=Kt5h4Rv8BelyLZYX+CvjgGNSgz1KnNy0RF+MGjKV8fDwQkqyucTccZn87ImzV9gRqu
 cQujCKsxD7lLfVC7sg/LtKlrZAymdOCm6ISzDHKteeoQ5gGHk9A9mfCMC2RtUg5mfqx2
 iy1Zw+0lWo3Jt6fucYH7F6cFnjD2hVi5GwFlqOdHRitloREGNnAy5UAS0iD3hzA0T3Xe
 H5Y/tVsQWICqpvs/7wXvmuAtbmk76QFeyLjgaPaSVIF5Zn+oDYo1+8f8pJJQxbiJGYmb
 jMJ1hYOHn6Spp5pRX8GxWCfGqbbLlRBtL8ECfe4DdQYnnXW86cODXW6gKK8hBRWvHSjv
 Amsw==
X-Gm-Message-State: APjAAAXAN5yTxv8bchsAyu9bFK2dH8UWldGZFdY3zw2wloI8+rTWzKGO
 K6BiJCh9xiI4B4f+71yoy4fsG+IMjR4NX3YdO52PBw==
X-Google-Smtp-Source: APXvYqxE3EqFsaHEnprUyZaM4g6B4DVDzSbBMdE2ZY73wVD6Bim+KQa8z2P4Rv87Uw8/uVuVyXt0heOA/5Hr/9ZZC5E=
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4299080wrv.253.1556830365851; 
 Thu, 02 May 2019 13:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
In-Reply-To: <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 2 May 2019 13:52:33 -0700
Message-ID: <CALAqxLXQV4jJpcV5VgECXQR5rw288v7LvBjEvzKm5eJb7oqPjA@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: Greg Hartman <ghartman@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h1Oxk4UYdC4lygiC7PghTgnV7KW16QuABt+QpGWy6Ks=;
 b=rRwqaBTgCbQYerUN2DI69gUSpOfO1pZYUNilINzZVHxtrGbq8wUR9zUew26lzfTJRd
 ijzivptXe8DWswE527i0gKuiHrmLWK3px5rYzw00esyli5TohoytagOcUYrsJJPIKmNw
 WeB2wlvQaMxQn54qbTixNk0+orxqd3RDmfAPvIggcq+mzcJsOVQSCCMsFAXGkpFoB8yh
 KX5T8uvdttffh7QycG1TgxkFkiNQepoLOPH42eF1sryDYx7oH5cEbFT9du5CKdeZNzjf
 I9/1YTRsxrYrGgCDeVXursrMCa4x9kqhejdSx2QI+IbfSsWwpZGcxu77j7UGXirz/GIx
 bpXA==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Willemsen <dwillemsen@google.com>, Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAxOjIwIFBNIEdyZWcgSGFydG1hbiA8Z2hhcnRtYW5AZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiArIGR3aWxsZW1zZW5AZ29vZ2xlLmNvbSBiYWNrZ3JvdW5kIG9u
IHRoZSBidWlsZCBjaGFuZ2VzLgo+Cj4gVGhhbmtzIGZvciBkb2luZyB0aGlzLiBJdCB3aWxsIGJl
IGhlbHBmdWwgdG8gaGF2ZSBmaXhlcyB0byBtYWtlIHRoaXMgYnVpbGQgYWdhaW4uCj4KCldlJ3Jl
IHN0aWxsIGEgYml0IG91dCBmcm9tIGdldHRpbmcgbWFzdGVyIHRvIGJ1aWxkIHcvIHRoZSBjdXJy
ZW50IEFPU1AgdHJlZS4KCldlIG5lZWQgc29sdXRpb25zIGZvciB0aGUgeGdldHRleHQgYW5kIHRo
ZSBweXRob24tbWFrbyB1c2FnZS4gIFRoZQpjdXJyZW50IEFPU1AgdHJlZSBjaGVja3MgaW4gcHJl
YnVpbHQtaW50ZXJtZWRpYXRlcyB0aGF0IGFyZSBoYW5kCmdlbmVyYXRlZCAod2hpY2ggaXMgbWVz
c3kgdG8gcmUtY3JlYXRlKSwgc28gSSdtIHRoaW5raW5nIHdlIHNob3VsZApleHRlcm5hbGl6ZSB0
aGUgaW50ZXJtZWRpYXRlIHNvdXJjZSBnZW5lcmF0aW9uIGludG8gc29tZXRoaW5nIGxpa2UgYQpz
Y3JpcHQsIHdoaWNoIHRoZSBidWlsZCBzeXN0ZW0gY2FuIGNhbGwgaW4gdGhlIG5vcm1hbCBjYXNl
LCBvciB0aGF0IHdlCmNhbiBydW4gaW5kZXBlbmRlbnRseSBvbiBhIGhvc3QgdG8gZ2VuZXJhdGUg
cHJlYnVpbHQgaW50ZXJtZWRpYXRlCnNvdXJjZSBmaWxlcyB0aGF0IGNhbiBiZSBjaGVja2VkIGlu
dG8gdGhlIEFPU1AgdHJlZS4KCkJ1dCBJIHdhbnRlZCB0byBnZXQgdGhlc2UgYmFzaWMgZml4ZXMg
aW4gc28gaXRzIGVhc2llciB0byBoYXZlIHdvcmtpbmcKYmVmb3JlIGFuZCBhZnRlciB0cmVlcyB0
byBjb21wYXJlIGFueSBzdWNoIGJ1aWxkIGNoYW5nZXMuCgp0aGFua3MKLWpvaG4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
