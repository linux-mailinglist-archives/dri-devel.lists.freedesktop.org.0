Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26E103CBA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3A6EA49;
	Wed, 20 Nov 2019 13:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88B6EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:57:36 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f16so1157994lfm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 05:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIt+T4RGX3J5+jpCiRZEdtC5eL9k3jrRQHCSNzrFISM=;
 b=Vf85p2PiNVJaQpQJK3DPNe6Fy1QDV9jy2Y+BPxSLIDkkBKO83rELQtDYqd5WH0j5u6
 tAA+LvgtUOMdk9093HTlSec7cQbS4NBz7PWXfGIObKYYQB0AM8v+3C1tzn8SF5AqdSwV
 8+1OSVk4UhsWu7xpygxZrRzZpgD5VB7sFPry8IEG5k08VG4bItAYAa+LuuEouiZWjPry
 usJOvqkObO7VLBa6Pg7wQoewRYMdm4sEzqSuANxgxRdzVLFgePxDNITTyKylYK3+EgG4
 9K6WZdAZcLYUF4QG9IJspm9pMsdnZOYDg9YwxBfg+Gpa+i7I2GnQMxKIaP/xDnbdlBdY
 /WOA==
X-Gm-Message-State: APjAAAWTjXtsmVtIuC5R/3HBIbl0w+pS6RqwtNf4uIRIMDD0WVymLd6c
 5p9kTHwI7r03/Q9F39142briTrtNKRsXtdtQU2v/Ow==
X-Google-Smtp-Source: APXvYqwSPgpvKGgdMLr05/69ePVAbSBTECopKTVzQv8OmgSL4dfTfHuJs9ldLXG01mJ+a/wp/KDjK8w7mavfjxxyjwk=
X-Received: by 2002:a19:651b:: with SMTP id z27mr2938442lfb.117.1574258254989; 
 Wed, 20 Nov 2019 05:57:34 -0800 (PST)
MIME-Version: 1.0
References: <1408349495-25568-1-git-send-email-inki.dae@samsung.com>
 <1408349495-25568-2-git-send-email-inki.dae@samsung.com>
In-Reply-To: <1408349495-25568-2-git-send-email-inki.dae@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Nov 2019 14:57:23 +0100
Message-ID: <CACRpkdZDHOBCWOaUjb7EcwAELW5Pk_aeDDFpUrc3rL9N-8wUDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: consider low power transmission
To: Inki Dae <inki.dae@samsung.com>, Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DIt+T4RGX3J5+jpCiRZEdtC5eL9k3jrRQHCSNzrFISM=;
 b=KFPK91Q3UCt8vTEyugHPpWVQ7CK0QQH99jwqzPOUF3bOITx64OX3jv1IhbfpOMsjE+
 wn+V/07jemNdnAwyVs2vyaRsWZhuCcWeX0/1p/tbH9+7zXsxycJiU4K9Ak1OWmuuzAka
 WzUorahDKK83YaGeCkL84gBUdY8rIXtvigPWI/wlGiRUwvnQZKGQ8j23EFIK/2klH30R
 FLXbCfpCIduvUIS64ryShCrA3fL4ibRtpx+T+evNniBBYhWREWrW0n4Em3d2zjElLWde
 Sts4sBKMIp1s9FnGJSD/5cofENhp9SrVH6xo9BJBOT4+ZSlrufxsnAUtmsn74KBjhMoM
 nl+Q==
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTgsIDIwMTQgYXQgMTA6MTEgQU0gSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1
bmcuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGZsYWcsIE1JUElfRFNJLU1P
REVfTFBNLCB0byB0cmFuc21pdCBkYXRhCj4gaW4gbG93IHBvd2VyLiBXaXRoIHRoaXMgZmxhZywg
bXNnLmZsYWdzIGhhcyBNSVBJX0RTSV9NU0dfVVNFX0xQTQo+IHNvIHRoYXQgaG9zdCBkcml2ZXIg
b2YgZWFjaCBTb0MgY2FuIGNsZWFyIG9yIHNldCByZWxldmFudCByZWdpc3Rlcgo+IGJpdCBmb3Ig
bG93IHBvd2VyIHRyYW5zbWlzc2lvbi4KPgo+IEFsbCBob3N0IGRyaXZlcnMgc2hhbGwgc3VwcG9y
dCBjb250aW51b3VzIGNsb2NrIGJlaGF2aW9yIG9uIHRoZQo+IENsb2NrIExhbmUsIGFuZCBvcHRp
b25hbGx5IG1heSBzdXBwb3J0IG5vbi1jb250aW51b3VzIGNsb2NrIGJlaGF2aW9yLgo+IEJvdGgg
b2YgdGhlbSBjYW4gdHJhbnNtaXQgZGF0YSBpbiBoaWdoIHNwZWVkIG9mIGxvdyBwb3dlci4KPgo+
IFdpdGggZWFjaCBjbG9jayBiZWhhdmlvciwgbm9uLWNvbnRpbnVvdXMgb3IgY29udGludW91cyBj
bG9jayBtb2RlLAo+IGhvc3QgY29udHJvbGxlciB3aWxsIHRyYW5zbWl0IGRhdGEgaW4gaGlnaCBz
cGVlZCBieSBkZWZhdWx0IHNvIGlmCj4gcGVyaXBoZXJhbCB3YW50cyB0byByZWNlaXZlIGRhdGEg
aW4gbG93IHBvd2VyLCB0aGUgcGVyaXBoZXJhbCBkcml2ZXIKPiBzaG91bGQgc2V0IE1JUElfRFNJ
X01PREVfTFBNIGZsYWcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ft
c3VuZy5jb20+CgpIaSBJbmtpIERhZSwKCkkgcmVjZW50bHkgdXNlZCB0aGlzIGZsYWcgaW4gYSBk
cml2ZXIgdG8gdGhlIGVmZmVjdCB0aGF0IGFsbCB3cml0ZXMgYmVjb21lCkxQTSwgaW5jbHVkaW5n
IHVwZGF0ZXMgdG8gYSBjb21tYW5kIG1vZGUtb25seSBwYW5lbCwgc28gdGhlIHBpeGVscwp3aWxs
IGRyYXcgdmVyeSBzbG93bHkgb24gdGhlIHNjcmVlbi4gSW4gdGhpcyBjYXNlIEkgYWRkZWQgdGhl
CmZlYXR1cmUgZm9yIGRlYnVnZ2luZyAobXkgZGlzcGxheSB3b3JrcyBmaW5lIGluIExQIGJ1dCBu
b3QgeWV0CmluIEhTIG1vZGUpLgoKVGhpcyBpcyBub3QgYSBwcm9ibGVtIHdpdGggYSB2aWRlbyBt
b2RlIHBhbmVsIHNpbmNlIHRoZXNlIGFyZSBieQp0aGUgc3BlY2lmaWNhdGlvbiByZXF1aXJlZCB0
byBvcGVyYXRlIGluIEhTIG1vZGUsIHNvIHdlIGtub3cgdGhleQphcmUgYWx3YXlzIEhTLgoKQnV0
IGluIGNvbW1hbmQgbW9kZSwgYWxsIGNvbW1hbmRzIGFyZSBlcXVhbCwgZXZlbiBpZiB0aGV5IGFy
ZQpzY3JlZW4gdXBkYXRlcy4gSSBwcm9ncmFtIG15IGhhcmR3YXJlIHRvIHVwZGF0ZSB0aGUgZGlz
cGxheQp3aXRoIGEgc3RyZWFtIG9mIGNvbW1hbmRzLCBhbmQgd2l0aCB0aGlzIGZsYWcgc2V0LCB0
aGF0IHN0cmVhbQp3aWxsIGdvIHNsb3cuCgpJcyB0aGlzIGhvdyBpdCBpcyBpbnRlbmRlZD8KClVz
aW5nIHRoZSBmbGFnIGxpa2UgdGhpcyBpcyBraW5kIG9mIGludGVyZXN0aW5nIGJlY2F1c2UgaXQg
aXMgZ29vZCBmb3IKZGVidWdnaW5nIGJ1dCBJIGRvbid0IGtub3cgaWYgdGhpcyBpcyBob3cgaXQg
d2FzIGludGVuZGVkLgoKSWYgdGhlIGZsYWcgaXMgb25seSBzdXBwb3NlZCB0byBiZSBmb3IgRENT
IHdyaXRlIGNvbW1hbmRzLCBzbyB0aGF0CmJvdGggd3JpdGUgYW5kIHJlYWQgaGFwcGVuIGluIExQ
IG1vZGUsIHRoZW4gd2UKc2hvdWxkIHByb2JhYmx5IHJlbmFtZSBpdCBhY2NvcmRpbmdseSBJIHRo
aW5rPwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
