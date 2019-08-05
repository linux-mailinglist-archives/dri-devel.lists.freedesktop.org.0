Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5982072
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35D289C03;
	Mon,  5 Aug 2019 15:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B44189C03
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:39:49 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id c15so6950906oic.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 08:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9YqrzOkexsTIH9KFvF7Lw8BpJCjSUbNYa4/O5Hc/BA=;
 b=iL1Qxm/5Gpnx8o8tv13qFykaKdnuCBVw2W3r/SA/fDQFuZty16yMe12r6uhn2H4j9n
 DGWPdbtjlUr8kdzoQBQyuza527xmiuPNjgTiD1fiC6iJrlNpBA9a0vXt/f12wr3D9QfD
 I6Pe6in6JxyPM3gGupskL6b3tPtYKNnIX5+c+KwLTKAfBXPkMmwe5COuL+Gvz6iNEJ7m
 2clAwYpB4Xm/AYQo2xuGuOTPp4IOMiGND+Ve8UagvoJNfMvhKEAZmgkXf0QIxnGmy05H
 +W/v6iehRsgrR4vN3eJnI1KQx6B+AHLSxJmf+NoulOVpeepTBb3vGfZnmCnDbkoRz49W
 P0pw==
X-Gm-Message-State: APjAAAVozxwnqt42ybDUSv34tA7roXECgzFR2QoBgzpoMO2l9cOVb0b2
 fRX8wRjjHDAiMxgHm5mTjHav2PNIspqBlhtWf0U=
X-Google-Smtp-Source: APXvYqz8mmOtkdMX2K6SDfo6yTMg3Fawb7gpGYTb6NKK4HyqB+cLFl9/mt11UOhG7BPFTHgvo+CJrA+e5YE9CsPYTDw=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr12414770oiy.110.1565019588203; 
 Mon, 05 Aug 2019 08:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190708112803.12432-1-linus.walleij@linaro.org>
 <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
In-Reply-To: <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 5 Aug 2019 17:39:36 +0200
Message-ID: <CAKMK7uHxuGYxQnDDGs6YHBjXmxeMwRPOJhyEn9tzqu3HyxqvwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/megachips: Drop GPIO header
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=F9YqrzOkexsTIH9KFvF7Lw8BpJCjSUbNYa4/O5Hc/BA=;
 b=A3wM83zHAulOjvEexy9ahe7XjlXsVx3ugzlEF9VPGPWLoSOIW9TJpOl3RIdA7rFQ7O
 vZevYoyyfujoGINI1shRHRFCv08cqp+b7vq/WDRezlizrS02HAqcsglqKAiXotzwxi+U
 nw805f/S12uqfKtbfdsAxvwlXzU+RWY3jARBA=
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAxMTowNiBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxOjI4IFBN
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+IFRo
aXMgZmlsZSBpc24ndCB1c2luZyBhbnkgaW50ZXJmYWNlcyBmcm9tIDxsaW51eC9ncGlvLmg+IHNv
Cj4gPiBqdXN0IGRyb3AgdGhlIGluY2x1ZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+Cj4gU28gd2hhdCBkbyBJIGRvIHdp
dGggdGhlc2Ugc2ltcGxlIHBhdGNoZXMgYXMgbm9vbmUgc2VlbXMgdG8KPiBBQ0sgb3IgcmV2aWV3
IHRoZW0gZm9yIGEgbW9udGg/CgpQaW5nIHBlb3BsZSBleHBsaWNpdGx5IGZvciByZXZpZXcvYWNr
cywgZWl0aGVyIGhlcmUgb3Igb24gaXJjLiBLZWVwIGEKcmVjb3JkIG9mIHdobyBvd2VzIHlvdSwg
dG8gbWFrZSB5b3VyIHBpbmcgY29udmluY2luZyA6LSkKCj4gSSBndWVzcyBhcyBsYXN0IHJlc29y
dCBzaW1wbHkgYXBwbHkgdGhlbSB0byB0aGUgR1BJTyB0cmVlLCBidXQKPiBoZXkuCgpUaGUgdHJv
dWJsZSBpcyB0aGF0IHdpdGggbWFpbGluZyBsaXN0cyBpdCdzIGVzc2VudGlhbGx5IGltcG9zc2li
bGUgdG8KdHJhY2sgcGF0Y2hlcyBpbiBuZWVkIG9mIHJldmlldy4gRXhjZXB0IGlmIGV2ZXJ5b25l
IHdvdWxkIGtlZXAgdGhlaXIKb3duIHN0dWZmIHVwIHRvIGRhdGUsIHdoaWNoIGFsbW9zdCBub29u
ZSBkb2VzIChwbHVzIHlvdSdkIG5lZWQgdG8gZG8KaXQgb24gYWxsIHRoZSBkaXNqb2ludCBwYXRj
aHdvcmsgaW5zdGFuY2VzIGlmIHlvdSBjYyBtdWx0aXBsZSBsaXN0KS4KU28gZGVmYWN0byBzdHVm
ZiBqdXN0IGdldHMgbG9zdCBhZnRlciBhYm91dCBhIHdlZWsgb3Igc28sIGFuZCB5b3UgbmVlZAp0
byBraWNrIGl0IGFnYWluLiAiTWFpbnRhaW5lciB1cGRhdGVzIHBhdGNod29yayBhbGwgdGhlIHRp
bWUiIGRvZXNuJ3QKc2NhbGUgYW5kIGxlYWRzIHRvIGJ1cm5vdXQuIEl0IHN1Y2tzLCBidXQgaXQg
aXMgd2hhdCBpdCBpcy4gV2FpdGluZyBhCmZ1bGwgbW9udGggaXMgZGVmaW5pdGVseSB0b28gbXVj
aCB3YWl0aW5nLCBlc3BlY2lhbGx5IGZvciBhIHNpbXBsZQpwYXRjaCBsaWtlIHRoaXMgb25lLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
