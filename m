Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45439F5039
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 16:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439966F9DD;
	Fri,  8 Nov 2019 15:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A580F6F9DD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 15:52:37 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id y23so4109729vso.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 07:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YXITSGLnneLKKdtVpM2UNV6rrznDz/ekZ9r9rBO9SI=;
 b=K40CQqZLqHNzmSBOpmCtZM0xmW2qxK5/6RdJNcWc9HYKljIxxG6h5s/XLNBexj1i4V
 X2xGmQE6L0aAzO65V+JyfK4cBZPlqxJE/V+EA4esU3ZezLbHrC4zBEQZTV4SPxb627+4
 ai4odCwDfgni3c6SdZnC9QaqoY5CqG81JT84FFDaqy3cIu/Nh6igbff1O+twJSGE69c8
 2gAr2xCSohgNWFRIfQ564zoNUUwag3xMWbSA5usJsT85Qv4LJPv7Qrmz9HTVU9udK68+
 VAgUzddUnPXB5dMkf8mv8EuBFO6ufa9T6izp0BdG9U6yat3WbnvHWCbtWZltLzLdYJ1i
 G8LQ==
X-Gm-Message-State: APjAAAV9qYBFzZnCJfBtomKEj2txF5ScSU+YEfGdv5+FnVCT4o+SbBBU
 qMICicWQVLUcovnJ8y56Eb2hs3XH5lU1wT6lbBg3eA==
X-Google-Smtp-Source: APXvYqyJwBX4nWIKSR4Vg+1DGbqzLNbIfIhzYdSqam6Gp5jSPrm/x1ZeX7CMad1CA6Abk9HXdJsBIUWpk9690aRO0qA=
X-Received: by 2002:a67:db9a:: with SMTP id f26mr8325450vsk.84.1573228356636; 
 Fri, 08 Nov 2019 07:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20191106165835.2863-1-stephan@gerhold.net>
In-Reply-To: <20191106165835.2863-1-stephan@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2019 16:52:25 +0100
Message-ID: <CACRpkdarNDhZvks4AWOX_=rcjprd_tCiaYZ90_+krRwGpKgTtw@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/mcde: DSI video mode fixes
To: Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+YXITSGLnneLKKdtVpM2UNV6rrznDz/ekZ9r9rBO9SI=;
 b=UtdbS5YypN2YH6FLlGOHdLiFf7VGVzCal+HYQyJOEHc1TplZS9lq7HNVcpCkHCgAfc
 pixK196haQ111JSUOpuODK4zRvu904VpaoLrIHPyPx9pZBjtchnP+VeUyg04oEayZVCK
 0ejE2kydJzubnSrnLLlLHh5mvDDBISkzJrdjwJCkbvtJxolKConD0YFyYU6eZQIm+F6o
 4y/kT4KIUjKOp6DOVgCump9suG6aURCPiDsr/sAIZ7BB84VivayAJIL/2G5bgDFixvub
 pWURjxrp2ud/QeUSUXh2QM0K8mJtO9bAQkdRpWxyvSS9zzEQGEY+9UGf74xRDNhEHudH
 8/gA==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA2OjAxIFBNIFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBn
ZXJob2xkLm5ldD4gd3JvdGU6Cgo+IFRoaXMgaXMgYSBjb2xsZWN0aW9uIG9mIGZpeGVzIHRvIG1h
a2UgRFNJIHZpZGVvIG1vZGUgd29yayBiZXR0ZXIKPiB1c2luZyB0aGUgTUNERSBkcml2ZXIuIFdp
dGggdGhlc2UgY2hhbmdlcywgTUNERSBhcHBlYXJzIHRvIHdvcmsKPiBwcm9wZXJseSBmb3IgdGhl
IHZpZGVvIG1vZGUgcGFuZWwgSSBoYXZlIGJlZW4gdGVzdGluZyB3aXRoLgo+Cj4gTm90ZTogVGhl
IHBhdGNoIHRoYXQgZml4ZXMgdGhlIERTSSBsaW5rIHJlZ2lzdGVyIHNldHVwIGZvcgo+IHZpZGVv
IG1vZGUgWzFdIGlzIHN0aWxsIG5lY2Vzc2FyeTsgYnV0IHdlIHN0aWxsIG5lZWQgdG8gZmluaXNo
IGl0Cj4gYW5kIGFjdHVhbGx5IG1ha2UgaXQgaW5pdGlhbGl6ZSBhIHBhbmVsIGNvcnJlY3RseS4K
Pgo+IFRoaXMgc2VyaWVzIGNvbnRhaW5zIG9ubHkgcGF0Y2hlcyBmb3IgdGhlIG90aGVyIHBhcnRz
IGluIE1DREUuCj4gSSBoYXZlIHRlc3RlZCBpdCBieSBkaXNhYmxpbmcgbW9zdCBvZiB0aGUgcmVn
aXN0ZXIgc2V0dXAgaW4gdGhlCj4gRFNJIGRyaXZlciwgd2hpY2ggbWFrZXMgaXQgcmUtdXNlIHRo
ZSBwcm9wZXJseSB3b3JraW5nIERTSSByZWdpc3Rlcgo+IHNldCBieSB0aGUgYm9vdGxvYWRlci4K
Pgo+IFsxXTogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVs
LzIwMTktT2N0b2Jlci8yMzgxNzUuaHRtbAo+Cj4gU3RlcGhhbiBHZXJob2xkICg3KToKPiAgIGRy
bS9tY2RlOiBQcm92aWRlIHZibGFuayBoYW5kbGluZyB1bmNvbmRpdGlvbmFsbHkKPiAgIGRybS9t
Y2RlOiBGaXggZnJhbWUgc3luYyBzZXR1cCBmb3IgdmlkZW8gbW9kZSBwYW5lbHMKPiAgIGRybS9t
Y2RlOiBkc2k6IE1ha2UgdmlkZW8gbW9kZSBlcnJvcnMgbW9yZSB2ZXJib3NlCj4gICBkcm0vbWNk
ZTogZHNpOiBEZWxheSBzdGFydCBvZiB2aWRlbyBzdHJlYW0gZ2VuZXJhdG9yCj4gICBkcm0vbWNk
ZTogZHNpOiBGaXggZHVwbGljYXRlZCBEU0kgY29ubmVjdG9yCj4gICBkcm0vbWNkZTogZHNpOiBF
bmFibGUgY2xvY2tzIGluIHByZV9lbmFibGUoKSBpbnN0ZWFkIG9mIG1vZGVfc2V0KCkKPiAgIGRy
bS9tY2RlOiBIYW5kbGUgcGVuZGluZyB2Ymxhbmsgd2hpbGUgZGlzYWJsaW5nIGRpc3BsYXkKClRl
c3RlZCBhbGwgNyBvbiB0aGUgVXg1MDAgSFJFRnY2MHBsdXMgd2l0aCB0aGUgY29tbWFuZCBtb2Rl
CnBhbmVsIHdpdGhvdXQgcHJvYmxlbXMuClRlc3RlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgoKSSB3aWxsIGFwcGx5IGFuZCBwdXNoIHRvIERSTSBtaXNjIGZv
ci1uZXh0IHdpdGggbXkgVGVzdGVkLWJ5IHRhZy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
