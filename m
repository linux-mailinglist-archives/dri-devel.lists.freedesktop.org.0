Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6C2CBD40
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 13:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8A06E58E;
	Wed,  2 Dec 2020 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E906E58E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 12:46:25 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id i13so317021oou.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 04:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pV9ftpQ958woxShpES/uiCgfpgzUt6IWswu1CxIBbug=;
 b=hqEXNjQscMUnwNnu0Ip/q4SHyToUOD1k9Ztd1vI4quyuWysDkYtzTWQhpLuZ0VckGM
 IbV45w7XV9sUKZc9klqSq8SVqiDm7aiXiVemcScN87/rriml/3PrR52Yk8JO5aT7H6V+
 txiWzZIdIY8bOBj7FXDtAABK4XaIk9XCTC+1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pV9ftpQ958woxShpES/uiCgfpgzUt6IWswu1CxIBbug=;
 b=mI05eb4UdLqIoJpnrsvqiwlP7i+r5youNh7R1fZ3ryLeJHxtsEOC6/v1+KyPS8tfM6
 D4kyuHy8xKKl3IzMO1UjXvYaTWkrNkYc60q/H2dHQY+n72pC5ixKa3bJ2CHr6RiCI4ZN
 PKUBhXkoLxUP/jqWgG6iztcWAluYZV+LWkCGAS7eJhZrnk4792QsRCkczhe9ccoXYejN
 sK836Vh3EnKexyP9bZxQ0Wggs+Narqju7WN+hjREVtgzvx27CE2uaz3eQtpBGV13CDtE
 fXEX+elfX16XMD0cJGBJMrLvzZM9l0ohaJqlbP7PDOb6UGC723Ecc7/RbyD/kC4oxvme
 AE5w==
X-Gm-Message-State: AOAM5331Eqva0IML/GId8AFBlGwsEp8a3P0bbpb59moWk+u6bltjOVOh
 PmSZGmvjaHUs335+lm1Nfodb3sh/e47TFDzE5NpZC3EF4n8=
X-Google-Smtp-Source: ABdhPJzPpRupSs4a/sGX1VfncZnGdVhtkNTpOllSCc71OQLlNL4ZJuHDCnV2jh+VQEcEqUdKOxHLOI0drl9P9Eq8cnw=
X-Received: by 2002:a4a:84c9:: with SMTP id o9mr1480986oog.28.1606913184790;
 Wed, 02 Dec 2020 04:46:24 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
In-Reply-To: <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Dec 2020 13:46:13 +0100
Message-ID: <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMiwgMjAyMCBhdCAxMjo0MyBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMTItMDEgMTE6MDEgYS5tLiwgSmFtZXMgUGFy
ayB3cm90ZToKPiA+IFRoaXMgd2lsbCBhbGxvdyBNZXNhIHRvIHBvcnQgY29kZSB0byBXaW5kb3dz
IG1vcmUgZWFzaWx5Lgo+Cj4gQXMgZGlzY3Vzc2VkIGluCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzYxNjIjbm90ZV83MTI3NzkKPiAs
IGluY2x1ZGluZyBkcm0uaCBtYWtlcyBubyBzZW5zZSB3aGVuIGJ1aWxkaW5nIGZvciBXaW5kb3dz
LgoKWWVhaCBJIHRoaW5rIGl0J2QgYmUgY2xlYW5lc3QgaWYgd2UgY2FuIGF2b2lkIHRoaXMuIElm
IG5vdCBJIHRoaW5rIHRoZQpyaWdodCBmaXggd291bGQgYmUgdG8gc3BsaXQgb3V0IHRoZSBhY3R1
YWxseSBuZWVkZWQgcGFydHMgZnJvbSBkcm0uaAppbnRvIGEgbmV3IGhlYWRlciAoc3RpbGwgaW5j
bHVkZWQgYnkgZHJtLmggZm9yIGJhY2t3YXJkcyBjb21wYXQKcmVhc29ucykgd2hpY2ggbWVzYSBj
YW4gdXNlLiBTaW5jZSBpdCBsb29rcyBsaWtlIHRoZSBwcm9ibGVtYXRpYyBwYXJ0cwphcmUgdGhl
IGxlZ2FjeSBndW5rLCBhbmQgbm90IHRoZSBuZXcgaW9jdGwgc3RydWN0dXJlcy4gUHVsbGluZyBv
dXQKZHJtX3JlbmRlci5oIGZvciBhbGwgdGhlIHJlbmRlciBzdHVmZiBhbmQgbWFiZSBkcm1fdmJs
YW5rLmggZm9yIHRoZQp2Ymxhbmsgc3R1ZmYgKHdoaWNoIHdvdWxkIGZpdCBiZXR0ZXIgaW4gZHJt
X21vZGUuaCBidXQgbWlzdGFrZXMgd2VyZQptYWRlLCBvb3BzKS4KLURhbmllbAoKPgo+IC0tCj4g
RWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0
dHBzOi8vcmVkaGF0LmNvbQo+IExpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAg
fCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Blcgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
