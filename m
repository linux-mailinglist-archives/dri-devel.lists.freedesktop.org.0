Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C243A675EB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C776E395;
	Fri, 12 Jul 2019 20:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C12A89BFB;
 Fri, 12 Jul 2019 20:30:32 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h21so9446613qtn.13;
 Fri, 12 Jul 2019 13:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Jxwo9pjmGUKQ0uHToCiY3Wz26c1dotpxquQLKWEEI4=;
 b=cQXvKCSMPzno7OZ4m5GND2Y5wW7QYmJ9WwzTA/XTCy/XHtYHwMArDwnuhXMCvX0exa
 1uAVJ+BS3aSJsmN3oxnPw3evaqq2jskMwsV5DEBuD1Fo0UMoe/G/dl4MuFlzUX+wce+2
 e39rmAWy0mIE90c92W6yke20XMx0MbqAgCUJe1eAhJP6VdEt9N4m7li+DBgp0MeM4/kh
 zUQDcBjktgV7WskxXK+x5OpGobyy1L6DWTnjebqm/xvtVo9wSCZMsBL8uzqBTkwR6DBV
 fLsMfooEPcTAh7zYTi0Dzd8TAIi4I9I1TniwarhVhDyS6yOiryuj7ueV9qHCek9fgGtq
 cXLw==
X-Gm-Message-State: APjAAAVEEx4Q4yTlf2R2bEXP7uK7LJ0bng9vBpHx/EcJ6qNZGojNudyc
 dM+JBACG0U6ju/Rs5FBmYctErdzZp4HQaoyPtGU=
X-Google-Smtp-Source: APXvYqw/HRQPv+zrvR1ZBQyClQoN6ydkstV5/Wy0XOB5yS7boQcdKYnFigC2K+BswfrrWijZn61LUT0XF3ZF2POzlZo=
X-Received: by 2002:a0c:b758:: with SMTP id q24mr7462464qve.45.1562963431425; 
 Fri, 12 Jul 2019 13:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190712093720.1461418-1-arnd@arndb.de>
 <CAKwvOd=Xdp_=G3UU9ubayeTvkKCJ9hak0a-7yK90-RPUBQKrpw@mail.gmail.com>
In-Reply-To: <CAKwvOd=Xdp_=G3UU9ubayeTvkKCJ9hak0a-7yK90-RPUBQKrpw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 12 Jul 2019 22:30:14 +0200
Message-ID: <CAK8P3a0vTwtDtxDhfmhzOViUp+DPzuJ_qsQsnVFw4B7oBaudTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Support clang option for stack alignment
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: Duke Du <Duke.Du@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Matthias Kaehlcke <mka@google.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgODo0OSBQTSAnTmljayBEZXNhdWxuaWVycycgdmlhIENs
YW5nIEJ1aWx0CkxpbnV4IDxjbGFuZy1idWlsdC1saW51eEBnb29nbGVncm91cHMuY29tPiB3cm90
ZToKPgo+IE9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDI6MzcgQU0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPgo+ID4gQXMgcHJldmlvdXNseSBmaXhlZCBmb3IgZG1sIGlu
IGNvbW1pdCA0NzY5Mjc4ZTVjN2YgKCJhbWRncHUvZGMvZG1sOgo+ID4gU3VwcG9ydCBjbGFuZyBv
cHRpb24gZm9yIHN0YWNrIGFsaWdubWVudCIpIGFuZCBjYWxjcyBpbiBjb21taXQKPiA+IGNjMzJh
ZDhmNTU5YyAoImFtZGdwdS9kYy9jYWxjczogU3VwcG9ydCBjbGFuZyBvcHRpb24gZm9yIHN0YWNr
Cj4gPiBhbGlnbm1lbnQiKSwgZGNuMjAgdXNlcyBhbiBvcHRpb24gdGhhdCBpcyBub3QgYXZhaWxh
YmxlIHdpdGggY2xhbmc6Cj4gPgo+ID4gY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3VtZW50OiAn
LW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NCcKPiA+IHNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MjgxOiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5vJyBmYWlsZWQKPiA+Cj4gPiBVc2UgdGhlIHNh
bWUgdHJpY2sgdGhhdCB3ZSBoYXZlIGluIHRoZSBvdGhlciB0d28gZmlsZXMuCj4KPiBNYXliZSB0
aW1lIGZvciBhIG1hY3JvIGluIEtidWlsZC5pbmNsdWRlIG9yIHNvbWUgc3VjaCwgaWYgd2Ugc2Vl
IHRoaXMKPiBwYXR0ZXJuIGJlaW5nIHJlcGVhdGVkPwoKSSdtIG5vdCBhY3R1YWxseSBjb252aW5j
ZWQgdGhhdCB0aGUgYXJndW1lbnQgZG9lcyBhbnl0aGluZyB1c2VmdWwKYXQgYWxsLCBpZiB0aGUg
a2VybmVsIHN0YWNrIGlzIG5vcm1hbGx5IG5vdCAxNi1ieXRlIGFsaWduZWQKd2hlbiB3ZSBlbnRl
ciB0aGUgZHJpdmVyLCBhbmQgaXQgY2xlYXJseSBpcyBub3QgbmVlZGVkIGlmIHRoZSBzdGFjawpp
cyBhbHJlYWR5IGFsaWduZWQuCgpVbmxlc3MgYW55IGNvZGUgY2FsbGluZyBpbnRvIHRoZSBwb3J0
aW9ucyB0aGF0IHdhbnQgdGhlIGFsaWdubWVudAptYW51YWxseSBhbGlnbnMgdGhlIGtlcm5lbCBz
dGFjayBwb2ludGVyLCB3ZSBjb3VsZCBqdXN0IGFzIHdlbGwKbGVhdmUgaXQgb3V0LiBUaGUgZ2l0
IGhpc3RvcnkgZG9lcyBub3QgZXhwbGFpbiB3aHkgaXQgd2FzIGFkZGVkIGluIHRoZQpmaXJzdCBw
bGFjZSB0aG91Z2gsIHNvIEkgcmVhbGx5IGhhdmUgbm8gaWRlYS4KCkkgc2VlIGluIHRoZSBhcmNo
aXRlY3R1cmUgbWFrZWZpbGVzIHRoYXQgaTM4NiBrZXJuZWxzIGFyZSBidWlsdCB3aXRoCnRoZSBz
YW1lIGZsYWcgZ2xvYmFsbHksIGJ1dCBvdGhlciBhcmNoaXRlY3R1cmVzIChpbmNsdWRpbmcgeDg2
XzY0KQp1c2UgdGhlIGRlZmF1bHQgc3RhY2sgYWxpZ25tZW50LCB3aGljaCBtYXkgYmUgZGlmZmVy
ZW50LgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
