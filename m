Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF57CBADA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1916EB6D;
	Fri,  4 Oct 2019 12:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2ACC6EB6B;
 Fri,  4 Oct 2019 12:52:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v17so5735444wml.4;
 Fri, 04 Oct 2019 05:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCg6iF9T28OthRHdbbkutcgUBowVHhAcngSopXfFrWo=;
 b=gexyzcN0HIniuuIrt7YcRSQe9SUibFoGi/laBDWnNqsBRQbvWxnO1s7v1q3cc1dI57
 Pfi4yFUzmS0x6Uur7ozAr0ablrhAsRH3/Aw3O2tBsjLPT7Ke84tPU/2NLgCc9Np0Db22
 3xJV6mDkY5t9cdNzv/TaFze4BHQ3OCiNov61UqXNGaeXJoVWzhBT5+Ixv+zP7WUSAl8G
 2vVpMmb2z4MNt34KL3Z21DkO+CTirLhTrrhTGHv9IdSaN0rJ/8FmvUbAGHraucAHHuym
 EkNd51ldeP7N3G73iWRam567Ct68zaMfpeHm94UoQlv7QTfWZ2JWjX58zUhKgM8Gi10s
 w/CQ==
X-Gm-Message-State: APjAAAWHsRGOa7N6H+D6J0HMvCX6UnvldJz+Gijq4s5F2KSuf0JlIgYr
 XrXcm+C7+VycjJPy0sQ1gZ+TBGSZec+m6trA4Z0=
X-Google-Smtp-Source: APXvYqzjIHQJvBWMghIt9hR7KV15bfMSXz9k5BT4OLyiLIez3HmRpbYs4TlKoYXSdKkbMlZnIOmTykQc+TAYtAGqVzA=
X-Received: by 2002:a1c:3281:: with SMTP id y123mr10181887wmy.34.1570193558191; 
 Fri, 04 Oct 2019 05:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <1570181860-135298-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1570181860-135298-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 08:52:26 -0400
Message-ID: <CADnq5_P1cb58LRY+_su0cLxY4_wQJVKcZ7zYV73xdeNCw8GFng@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Make some functions static
To: zhengbin <zhengbin13@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kCg6iF9T28OthRHdbbkutcgUBowVHhAcngSopXfFrWo=;
 b=UFVeEgsRXP/YON8FZYBEcg1i2I08sbP29GHahTffOyljn1jfkuLP5+s+Y7Bl7AUEL7
 6p809/MKNO0yrjresrmnKabk/XsZxBPzRrGFZ3A8oNz04Yf54kH0qScJBkb+raLUm/4i
 AX+VJcUqpEOJpE1OPI5zD2g9Hnp8oYqSGirIg0ZZcKFLmaBTB1CSBKaN4lSABKjgujHI
 xIv4+Ob3M7FRpXvsAWQ2PI5T1Htjre+DcjI4TzjIxNJIt2gopKBp5NBE3NqJMEzuGBr0
 Gp3BDgsaPtNrB8GEdjKlWVrPmi8unvQhwyA1ENWCMHucoD/guGzJvOmmqImBXwMAphmi
 WM0g==
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
Cc: Dave Airlie <airlied@linux.ie>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA4OjI1IEFNIHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdl
aS5jb20+IHdyb3RlOgo+Cj4gRml4IHNwYXJzZSB3YXJuaW5nczoKPgo+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmM6MzI6Njog
d2FybmluZzogc3ltYm9sICdscF93cml0ZV9pMmMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBp
dCBiZSBzdGF0aWM/Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX2hkY3AuYzo0Mjo2OiB3YXJuaW5nOiBzeW1ib2wgJ2xwX3JlYWRfaTJj
JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmM6NTI6Njog
d2FybmluZzogc3ltYm9sICdscF93cml0ZV9kcGNkJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQg
aXQgYmUgc3RhdGljPwo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZGNwLmM6NTk6Njogd2FybmluZzogc3ltYm9sICdscF9yZWFkX2Rw
Y2QnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4KPiBSZXBvcnRlZC1i
eTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogemhlbmdi
aW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KCkFwcGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNw
LmMgfCAxMiArKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKPiBpbmRleCAyNDQzYzIzLi43NzE4MWRkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2hkY3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2hkY3AuYwo+IEBAIC0yOSw3ICsyOSw4IEBACj4gICNpbmNsdWRlICJkbV9oZWxw
ZXJzLmgiCj4gICNpbmNsdWRlIDxkcm0vZHJtX2hkY3AuaD4KPgo+IC1ib29sIGxwX3dyaXRlX2ky
Yyh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIGNvbnN0IHVpbnQ4X3QgKmRhdGEsIHVp
bnQzMl90IHNpemUpCj4gK3N0YXRpYyBib29sCj4gK2xwX3dyaXRlX2kyYyh2b2lkICpoYW5kbGUs
IHVpbnQzMl90IGFkZHJlc3MsIGNvbnN0IHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCj4g
IHsKPgo+ICAgICAgICAgc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBoYW5kbGU7Cj4gQEAgLTM5LDcg
KzQwLDggQEAgYm9vbCBscF93cml0ZV9pMmModm9pZCAqaGFuZGxlLCB1aW50MzJfdCBhZGRyZXNz
LCBjb25zdCB1aW50OF90ICpkYXRhLCB1aW50MzJfdAo+ICAgICAgICAgcmV0dXJuIGRtX2hlbHBl
cnNfc3VibWl0X2kyYyhsaW5rLT5jdHgsIGxpbmssICZjbWQpOwo+ICB9Cj4KPiAtYm9vbCBscF9y
ZWFkX2kyYyh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4X3Qgb2Zmc2V0LCB1
aW50OF90ICpkYXRhLCB1aW50MzJfdCBzaXplKQo+ICtzdGF0aWMgYm9vbAo+ICtscF9yZWFkX2ky
Yyh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4X3Qgb2Zmc2V0LCB1aW50OF90
ICpkYXRhLCB1aW50MzJfdCBzaXplKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZGNfbGluayAqbGlu
ayA9IGhhbmRsZTsKPgo+IEBAIC00OSwxNCArNTEsMTYgQEAgYm9vbCBscF9yZWFkX2kyYyh2b2lk
ICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4X3Qgb2Zmc2V0LCB1aW50OF90ICpkYXRh
LAo+ICAgICAgICAgcmV0dXJuIGRtX2hlbHBlcnNfc3VibWl0X2kyYyhsaW5rLT5jdHgsIGxpbmss
ICZjbWQpOwo+ICB9Cj4KPiAtYm9vbCBscF93cml0ZV9kcGNkKHZvaWQgKmhhbmRsZSwgdWludDMy
X3QgYWRkcmVzcywgY29uc3QgdWludDhfdCAqZGF0YSwgdWludDMyX3Qgc2l6ZSkKPiArc3RhdGlj
IGJvb2wKPiArbHBfd3JpdGVfZHBjZCh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIGNv
bnN0IHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBk
Y19saW5rICpsaW5rID0gaGFuZGxlOwo+Cj4gICAgICAgICByZXR1cm4gZG1faGVscGVyc19kcF93
cml0ZV9kcGNkKGxpbmstPmN0eCwgbGluaywgYWRkcmVzcywgZGF0YSwgc2l6ZSk7Cj4gIH0KPgo+
IC1ib29sIGxwX3JlYWRfZHBjZCh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4
X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCj4gK3N0YXRpYyBib29sCj4gK2xwX3JlYWRfZHBjZCh2
b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNp
emUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkY19saW5rICpsaW5rID0gaGFuZGxlOwo+Cj4gLS0K
PiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
