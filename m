Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39C5C245E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 17:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5326E47B;
	Mon, 30 Sep 2019 15:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B66D6E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:34:23 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d26so2135269pgl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5F08F4HtlDPyvY4r3+PCuN7SNxQH64MKcXi/kd7HCrE=;
 b=HXgwLLr+11snXfKrUYQREzdLRzBm0R2xmoFm6jv9t7N9dk5HQyMCFdPhpci+KKqk/2
 EcxfwUFmuxLLjznRcp3ihUIy1Ci3k/9w79jETLUorrcaHaDJux9PVshCeLjof96IbJQN
 xrbQhQCxNYyOAGY9KCEdosFxLqiSLtpNw+k/2riZxjXdBYCQr8Nctzy492T5TUvTW8T/
 I9aot2nXIyY57GkBOTSlrA3Zz6DT5lWalrA+SI9U63qsCpjTk8Y2n4h5bo1iWtclsF/v
 DqG1N2s2qLSe4vI+ZSHZF6x8SmInP9m6XMGrq5O4AO4fnz+VK6w5wnZ4KTwSa8xuxMKQ
 AXZA==
X-Gm-Message-State: APjAAAWybh5vlO9vmPhOF2wtUoMfhoX4s+TmFRau/ioHhESCffplIbwl
 KoMxbs38nSNvS8RGQJ2mBMJv9A==
X-Google-Smtp-Source: APXvYqyOvb4d+aPS0cQERmHhssgzbMyfskBVAlx/Xeu3fPMFfwDEFTsiAILnSnwHN3omJUS1nvUcwA==
X-Received: by 2002:a63:5652:: with SMTP id g18mr5896531pgm.283.1569857662965; 
 Mon, 30 Sep 2019 08:34:22 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d4sm12397930pjs.9.2019.09.30.08.34.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Sep 2019 08:34:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: enable runtime PM
In-Reply-To: <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
References: <20190925193154.20732-1-khilman@kernel.org>
 <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
Date: Mon, 30 Sep 2019 08:34:21 -0700
Message-ID: <7ho8z1g5mq.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=5F08F4HtlDPyvY4r3+PCuN7SNxQH64MKcXi/kd7HCrE=;
 b=ZOM/o25sxvjMLKRKC3Zd9rAx0hvP1hljMPVRkriGdckO5c1A91PHJh2aCVswAY0hfm
 Z9d2+3JPNT3jJ++Tc/HA3L7SyJH4D0r0sfgBjqWhP5zpt+8otwCtBg5sX4vlJBmS/SuZ
 5YNNFJzir4g9iS35zxDhQYo8JdrSR8dNmcjHW2Idowx7dqtnwQ5Sz1PEy251eYdg+d99
 6lthotV8WxDf8zkxx1iEUo9ZoRY36KTswzYimcZUG5CAJ5wqrq03USkkzxteBV0gWX4i
 WInmhy7mc4CXiohXjvMKqi7zldss7UX2rYu/7RCCQXiIRF+Uc3tF77p2ySjypJKTIMGT
 9HuQ==
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IEhpIEtl
dmluLAo+Cj4gT24gMjUvMDkvMjAxOSAyMTozMSwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+PiBGcm9t
OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+PiAKPj4gT24gc29tZSBTb0Nz
LCB0aGUgVlBVIGlzIGluIGEgcG93ZXItZG9tYWluIGFuZCBuZWVkcyBydW50aW1lIFBNCj4+IGVu
YWJsZWQgYW5kIHVzZWQgaW4gb3JkZXIgdG8ga2VlcCB0aGUgcG93ZXIgZG9tYWluIG9uLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPj4g
LS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgfCA0ICsrKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHJ2LmMKPj4gaW5kZXggMjMxMGM5NmZmZjQ2Li4yNTZiNmEwZTljNmIgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZHJ2LmMKPj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4gICNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4K
Pj4gICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4KPj4gIAo+PiAgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4+ICAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWMuaD4KPj4gQEAgLTI3NCw2ICsyNzUsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Ry
dl9iaW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4+
ICAKPj4gIAkvKiBIYXJkd2FyZSBJbml0aWFsaXphdGlvbiAqLwo+PiAgCj4+ICsJcG1fcnVudGlt
ZV9nZXRfc3luYyhkZXYpOwo+PiAgCW1lc29uX3ZwdV9pbml0KHByaXYpOwo+PiAgCW1lc29uX3Zl
bmNfaW5pdChwcml2KTsKPj4gIAltZXNvbl92cHBfaW5pdChwcml2KTsKPj4gQEAgLTQxNiw2ICs0
MTgsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+PiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZXAsICpyZW1vdGU7Cj4+ICAJaW50IGNv
dW50ID0gMDsKPj4gIAo+PiArCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOwo+PiAgCWZv
cl9lYWNoX2VuZHBvaW50X29mX25vZGUobnAsIGVwKSB7Cj4+ICAJCXJlbW90ZSA9IG9mX2dyYXBo
X2dldF9yZW1vdGVfcG9ydF9wYXJlbnQoZXApOwo+PiAgCQlpZiAoIXJlbW90ZSB8fCAhb2ZfZGV2
aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7Cj4+IEBAIC00NDAsNiArNDQzLDcgQEAgc3RhdGlj
IGludCBtZXNvbl9kcnZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gIAl9
Cj4+ICAKPj4gIAkvKiBJZiBubyBvdXRwdXQgZW5kcG9pbnRzIHdlcmUgYXZhaWxhYmxlLCBzaW1w
bHkgYmFpbCBvdXQgKi8KPj4gKwlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4+ICAJ
cmV0dXJuIDA7Cj4+ICB9Owo+PiAgCj4+IAo+Cj4gSSdsbCByYXRoZXIgaW1wbGVtZW50IHRydWUg
cnVudGltZSBQTSBpbnN0ZWFkLAoKV2hpbGUgdGhpcyBpcyBhIG1pbmltdW0gaW1wbGVtZW50YXRp
b24sIGNhbiB5b3UgZXhwbGFpbiB3aGF0IHlvdSBtZWFuIGJ5CiJ0cnVlIiBydW50aW1lIFBNPwoK
S2V2aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
