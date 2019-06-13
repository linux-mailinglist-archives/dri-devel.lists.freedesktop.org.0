Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7106D4472A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9739189402;
	Thu, 13 Jun 2019 16:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253C789402
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:57:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x15so10974489wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dTTO7zlU48dQaMT0UfUehKAW8Upqk/+G5Ghmu7LRMdA=;
 b=qItSV2cmZQIrIUPf0hsTgPWjjwTiE8OuPSRMf03sjE+h1EtkeIYr1gHvu5ErOd1TAV
 HURbL/RVbpMhOuKTzf63wtzro6/M8Sffz9hvYnesc3w+Olssruz4T8XDb0jWTvDmE6aP
 GskNThFWFH/16C3za9teStcW0rjjSANOWfGVUnO8ptMSsLTlF4FOHremjgJlnoupzBXG
 CnXwLs5deYMEltr1MbAENy+Ye+Siom7IsPbDtERYFd4IIHTc3U6FZlg7Fum2igSmsqde
 Bzrucz1W2OlcQE4x6eKy4uxDHOF7V4tHsQ2B1PwkhkWrYBK3xE9hAEmJ8d+c9aB3GeyV
 Bb+Q==
X-Gm-Message-State: APjAAAXWOZ0WI5ZFQXO3De1KCaa2FpIvIGJfVmfT4mmn+n+IL6wLgw8j
 YBz4VqoC1pcHa9LuRryTK5n/GFJzv1eOOoK+xuk=
X-Google-Smtp-Source: APXvYqz5zGzI2NFbyliDi2xFmHxdpgIrtMjjIaRGg/GnzMmnFTwCuZW4fyzqr8XUCYuHnxI9TbdWspAcJAriToTyy0Q=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr4297923wmc.34.1560445061762; 
 Thu, 13 Jun 2019 09:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190613151727.133696-1-sean@poorly.run>
In-Reply-To: <20190613151727.133696-1-sean@poorly.run>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Jun 2019 12:57:29 -0400
Message-ID: <CADnq5_NFNtcgM2HaxEnZi_VcKB=FhxTH7pg0wrWzJcw4YaPzOw@mail.gmail.com>
Subject: Re: [PATCH] drm/connector: Fix kerneldoc warning in
 HDR_OUTPUT_METADATA description
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dTTO7zlU48dQaMT0UfUehKAW8Upqk/+G5Ghmu7LRMdA=;
 b=VQp4PpzBQyfeG6pMyK0fSn0qnlFqWcipP6bQbGMzwhMuZgRoUjKej6xOA3+cX6Ceyx
 3ouPUJzlhAHzY9PLvHmDF2b7J2/G3dBiFZJR1nb0t1l5T2M5zKoD7N4ZPKl25AQyHOc5
 VASOx9tH8M31Nd3KWy0busaCNm274ygVE2sQzo15wSxr99XZhe6Sczd1YypqJ51nD2wn
 a37ACoDpSfdL+X70k1mugzHRvhJJbmBnWiipp1x4s47ttXLYVFVJmsC5QMAwo61+exx2
 u1Rn9alWiCE1XnQA1m5SCDzqy8vKi6mkmPkm0jCgkmAIuHNvAKl2sNtTn+eRFNhDiai3
 37nA==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hansverk@cisco.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6MTcgQU0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+IHdyb3RlOgo+Cj4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4K
PiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYzo5ODE6IFdBUk5JTkc6IERlZmluaXRpb24gbGlzdCBlbmRzIHdpdGhvdXQgYSBi
bGFuayBsaW5lOyB1bmV4cGVjdGVkIHVuaW5kZW50Lgo+Cj4gRml4ZXM6IGEwOWRiODgzZTVkOSAo
ImRybTogRml4IGRvY2Jvb2sgd2FybmluZ3MgaW4gaGRyIG1ldGFkYXRhIGhlbHBlciBzdHJ1Y3R1
cmVzIikKPiBDYzogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+
IENjOiBWaWxsZSBTeXJqw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENj
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogIlZpbGxlIFN5
cmrDpCIgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBIYW5zIFZlcmt1aWwg
PGhhbnN2ZXJrQGNpc2NvLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+ICh2MSkKPiBDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNv
bT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogIlZp
bGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiBpbmRleCBhNTk4YTVlYjQ4ZDIxLi4z
Y2NkY2YzZGZjZGUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9y
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gQEAgLTk3OCw2ICs5
NzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9wX2VudW1fbGlzdCBoZG1pX2NvbG9y
c3BhY2VzW10gPSB7Cj4gICAqICAgICBVc2Vyc3BhY2Ugd2lsbCBiZSByZXNwb25zaWJsZSB0byBk
byBUb25lIG1hcHBpbmcgb3BlcmF0aW9uIGluIGNhc2U6Cj4gICAqICAgICAgICAgICAgIC0gU29t
ZSBsYXllcnMgYXJlIEhEUiBhbmQgb3RoZXJzIGFyZSBTRFIKPiAgICogICAgICAgICAgICAgLSBI
RFIgbGF5ZXJzIGx1bWluYW5jZSBpcyBub3Qgc2FtZSBhcyBzaW5rCj4gKyAqCj4gICAqICAgICBJ
dCB3aWxsIGV2ZW4gbmVlZCB0byBkbyBjb2xvcnNwYWNlIGNvbnZlcnNpb24gYW5kIGdldCBhbGwg
bGF5ZXJzCj4gICAqICAgICB0byBvbmUgY29tbW9uIGNvbG9yc3BhY2UgZm9yIGJsZW5kaW5nLiBJ
dCBjYW4gdXNlIGVpdGhlciBHTCwgTWVkaWEKPiAgICogICAgIG9yIGRpc3BsYXkgZW5naW5lIHRv
IGdldCB0aGlzIGRvbmUgYmFzZWQgb24gdGhlIGNhcGFiaWx0aWVzIG9mIHRoZQo+IC0tCj4gU2Vh
biBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
