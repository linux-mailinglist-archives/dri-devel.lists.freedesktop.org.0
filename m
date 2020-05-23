Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A400E1DF581
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C296EA35;
	Sat, 23 May 2020 07:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21FE6EA35
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 07:23:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x13so6229933pfn.11
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=rkQjo00JjFI2fAC/o/2WCC1p0oPD9CQpCRaJecUJgjw=;
 b=b98PVWiNaivm9ZiyZan+DVPHGPcXBj6ewOabjJD+9e81ibdAoRXx4l1oTj7FbChlUo
 4vPZhqxfy3UFwAkN8iNMTU7mFc+4fqlw8LHjxRBRdJdZFHnf7zqxGgFEi2T5SBcbb9AM
 iAyhRHC8v2NHCBOlf79Ml00dVLBUmD7oBCb7hrXdBea8jfX+T2jJLOi+5pdD2raTJR+2
 t7u09a29UrI7myl6xPmDuhz3VyNhSXP3TYJRsYgsM28p76SyQLE3Pm4A+K2XJ5kI6/OK
 fPvX3fMuFpy9kYRIupb4Y7HO/CUxtfxZ6+SKnOhjUiAHsuUyiDudOxjjns4AT8Yd9yex
 UHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rkQjo00JjFI2fAC/o/2WCC1p0oPD9CQpCRaJecUJgjw=;
 b=c6wEAl+RXobWceZaLhPOChABrs6Z6ABvLcvtxaiBfDzB3UqHr65zl8i7XTfRjrW/BF
 /yMaGG4bU7ghppyCH7lPAkZcHYsXrh5zupSZsA339uk0Wkdv7UwbxH87kXXs9kCpjC8h
 zWMsmX8b94sDT1FenTT/LKeeFnIou4P5yQ+6xw5CkA6qqfS7XkSos5fYfSBiohRMfYb2
 bppXGDLxFyucbJgo9mGr+Zmr/N2x9/xjphgrqTFl/Gy/BbUlHizaQ7iefq1aPpMNxZH1
 yW+eSok2DImAWRjhA2b6JK/EkpzUz27bllD+VQrHrG4l2GLcM05eyVhldzpzb42n4S/X
 zeAw==
X-Gm-Message-State: AOAM530lFvy2DotxjBpcDyKcunJd3S12oB3847c8AqAvHytBilXwQSX6
 PFEeH3wUPNj9saeTcs1Qng2LiQ==
X-Google-Smtp-Source: ABdhPJwBXAYthcc94MlJNYar0cK8NQ0m6fDRrV1047IEGn1lJ7oVpxn+yl5bbg5BfOkLu2OAiW8nvA==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr17010704pgq.272.1590218604234; 
 Sat, 23 May 2020 00:23:24 -0700 (PDT)
Received: from dragon ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id h4sm9368364pje.29.2020.05.23.00.23.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 May 2020 00:23:23 -0700 (PDT)
Date: Sat, 23 May 2020 15:23:02 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v1 1/3] drm/msm: Attach the IOMMU device during
 initialization
Message-ID: <20200523072300.GB28198@dragon>
References: <20200522220316.23772-1-jcrouse@codeaurora.org>
 <20200522220316.23772-2-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522220316.23772-2-jcrouse@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tongtiangen <tongtiangen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Georgi Djakov <georgi.djakov@linaro.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMDQ6MDM6MTRQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1bW11LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHVtbXUuYwo+IGluZGV4IDM0OTgwZDhlYjdhZC4uMGFk
MGY4NDg1NjBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdW1tdS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1bW11LmMKPiBAQCAtMjEsMTEgKzIx
LDYgQEAgc3RydWN0IG1zbV9ncHVtbXUgewo+ICAjZGVmaW5lIEdQVU1NVV9QQUdFX1NJWkUgU1pf
NEsKPiAgI2RlZmluZSBUQUJMRV9TSVpFIChzaXplb2YodWludDMyX3QpICogR1BVTU1VX1ZBX1JB
TkdFIC8gR1BVTU1VX1BBR0VfU0laRSkKPiAgCj4gLXN0YXRpYyBpbnQgbXNtX2dwdW1tdV9hdHRh
Y2goc3RydWN0IG1zbV9tbXUgKm1tdSkKPiAtewo+IC0JcmV0dXJuIDA7Cj4gLX0KPiAtCj4gIHN0
YXRpYyB2b2lkIG1zbV9ncHVtbXVfZGV0YWNoKHN0cnVjdCBtc21fbW11ICptbXUpCj4gIHsKPiAg
fQo+IEBAIC04NSw3ICs4MCw2IEBAIHN0YXRpYyB2b2lkIG1zbV9ncHVtbXVfZGVzdHJveShzdHJ1
Y3QgbXNtX21tdSAqbW11KQo+ICB9Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9tbXVf
ZnVuY3MgZnVuY3MgPSB7Cj4gLQkJLmF0dGFjaCA9IG1zbV9ncHVtbXVfYXR0YWNoLAo+ICAJCS5k
ZXRhY2ggPSBtc21fZ3B1bW11X2RldGFjaCwKPiAgCQkubWFwID0gbXNtX2dwdW1tdV9tYXAsCj4g
IAkJLnVubWFwID0gbXNtX2dwdW1tdV91bm1hcCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21faW9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2lvbW11LmMKPiBp
bmRleCBhZDU4Y2ZlNTk5OGUuLmUzNWRhYjU3OTJjZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9pb21tdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9t
bXUuYwo+IEBAIC02Niw3ICs2Niw2IEBAIHN0YXRpYyB2b2lkIG1zbV9pb21tdV9kZXN0cm95KHN0
cnVjdCBtc21fbW11ICptbXUpCj4gIH0KPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX21t
dV9mdW5jcyBmdW5jcyA9IHsKPiAtCQkuYXR0YWNoID0gbXNtX2lvbW11X2F0dGFjaCwKCkl0IGNh
dXNlcyBhbiB1bnVzZWQgZnVuY3Rpb24gd2FybmluZyBhcyBiZWxvdy4KCmRyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2lvbW11LmM6MjY6MTI6IHdhcm5pbmc6IOKAmG1zbV9pb21tdV9hdHRhY2jigJkg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQogc3RhdGljIGludCBtc21f
aW9tbXVfYXR0YWNoKHN0cnVjdCBtc21fbW11ICptbXUpCiAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn4KCk5vdCBzdXJlIGlmIHlvdSB3aWxsIHVzZSBpdCBhZ2FpbiBpbiBmdXR1cmUgcGF0Y2hl
cyB0aG91Z2guCgpTaGF3bgoKPiAgCQkuZGV0YWNoID0gbXNtX2lvbW11X2RldGFjaCwKPiAgCQku
bWFwID0gbXNtX2lvbW11X21hcCwKPiAgCQkudW5tYXAgPSBtc21faW9tbXVfdW5tYXAsCj4gQEAg
LTc2LDYgKzc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fbW11X2Z1bmNzIGZ1bmNzID0g
ewo+ICBzdHJ1Y3QgbXNtX21tdSAqbXNtX2lvbW11X25ldyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbikKPiAgewo+ICAJc3RydWN0IG1zbV9pb21tdSAqaW9t
bXU7Cj4gKwlpbnQgcmV0Owo+ICAKPiAgCWlvbW11ID0ga3phbGxvYyhzaXplb2YoKmlvbW11KSwg
R0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIWlvbW11KQo+IEBAIC04NSw1ICs4NSwxMSBAQCBzdHJ1Y3Qg
bXNtX21tdSAqbXNtX2lvbW11X25ldyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBpb21tdV9k
b21haW4gKmRvbWFpbikKPiAgCW1zbV9tbXVfaW5pdCgmaW9tbXUtPmJhc2UsIGRldiwgJmZ1bmNz
KTsKPiAgCWlvbW11X3NldF9mYXVsdF9oYW5kbGVyKGRvbWFpbiwgbXNtX2ZhdWx0X2hhbmRsZXIs
IGlvbW11KTsKPiAgCj4gKwlyZXQgPSBpb21tdV9hdHRhY2hfZGV2aWNlKGlvbW11LT5kb21haW4s
IGRldik7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJa2ZyZWUoaW9tbXUpOwo+ICsJCXJldHVybiBFUlJf
UFRSKHJldCk7Cj4gKwl9Cj4gKwo+ICAJcmV0dXJuICZpb21tdS0+YmFzZTsKPiAgfQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9tbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX21tdS5oCj4gaW5kZXggNjdhNjIzZjE0MzE5Li5iYWU5ZThlNjdlYzEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fbW11LmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9tbXUuaAo+IEBAIC0xMCw3ICsxMCw2IEBACj4gICNpbmNsdWRlIDxsaW51eC9p
b21tdS5oPgo+ICAKPiAgc3RydWN0IG1zbV9tbXVfZnVuY3Mgewo+IC0JaW50ICgqYXR0YWNoKShz
dHJ1Y3QgbXNtX21tdSAqbW11KTsKPiAgCXZvaWQgKCpkZXRhY2gpKHN0cnVjdCBtc21fbW11ICpt
bXUpOwo+ICAJaW50ICgqbWFwKShzdHJ1Y3QgbXNtX21tdSAqbW11LCB1aW50NjRfdCBpb3ZhLCBz
dHJ1Y3Qgc2dfdGFibGUgKnNndCwKPiAgCQkJdW5zaWduZWQgbGVuLCBpbnQgcHJvdCk7Cj4gLS0g
Cj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
