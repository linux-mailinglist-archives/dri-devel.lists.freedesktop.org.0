Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61D275876
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 15:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25456E0BE;
	Wed, 23 Sep 2020 13:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2CA6E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 13:13:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e17so7138729wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6IqVkNIHaeQrr2W7CSnbF5wual+dyS7CT61lBn9svUs=;
 b=AJXtHSRlktbbO2b6KQ6ldIzMmeUtPlde1afiP85l0pc4RgEEZfMEYbe+UC5GEz8gqT
 Fzt6HEaxrR762K+h5Me89di3TQZLNJy1Tm6jQODhQVMlrzVt1n6N/OGlcr7d4MrNcEq9
 7LJrMSUZQ57ZFkWFFATgYP8TDyyxvEtXiqrijifTGJBY6hkKTerm2Zxpc5tuYV8hOBo1
 x59jlRh5Rd/cErcPZp4mq7zvJoe51K9hPGnaC9dEZ0sYGK/NseQn3thj0GDB2IPg5z87
 qheQAZDe9NVk6y41hsoQHQrJPrN90aNxa6Vim9k6+8Yj06F2VeabvrPaa5IfZQWbY4dU
 FwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6IqVkNIHaeQrr2W7CSnbF5wual+dyS7CT61lBn9svUs=;
 b=EQ6pAcRutHcaLRc0ooxYlMi78o3gXKR3+8f+uH9EvqKT9aoycgFFKy62HYLH2F8wy3
 9D2LoixdoC0nRqztsH/LO7xVR7Xz3zhEMKzbvW9lKfkJ+nD9BVVbRbu1YUbTKRH6p4Vj
 Gcx8jxTvyLJWoL+upYz49LPrQ0wztZBoA4wJqJhBiVoldiJIfaNuuc+HLfQJvRBCLE8r
 yp/PWeJZ3tAHFpw6Dg3S0zqSKFvVgyBPPZ/caRkofy+RPY8FUx4jdYMIB8FWh/oXBpyL
 JKqHr699FNLRjcSqZMc2kYnsQhbl8iiqH4Iy8KolDJ26UZoYKMuj9RwmRdLJsOtCQiI2
 8H5Q==
X-Gm-Message-State: AOAM533hvKCtnOjFu7cXPGs+gXgK+iRTB64GjuUL2R62lIjjvM7lOt95
 4j/GyZMqh4C4FE3uQNHYuKvJfSyRnZ5gkQvIFOyYZg==
X-Google-Smtp-Source: ABdhPJyJF0t/rtDU7WOxjawXwvOPvE8EaBqSOUoW4aN3E9Lyo3zvndxSVjWXB6hPgTLtg17jFdU3KkFRL3KMW7jVQ9Y=
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr6394174wmj.116.1600866805441; 
 Wed, 23 Sep 2020 06:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <1600774764-50332-1-git-send-email-liheng40@huawei.com>
In-Reply-To: <1600774764-50332-1-git-send-email-liheng40@huawei.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Sep 2020 14:13:07 +0100
Message-ID: <CAPY8ntCnsD=LfqxSG-HrkY1ZjUPSaXbGKC=nc4Xkc7a+a7jF3w@mail.gmail.com>
Subject: Re: [PATCH -next] drm/v3d: Remove set but not used variable
To: Li Heng <liheng40@huawei.com>
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
Cc: airlied@linux.ie, DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIFdlZCwgMjMgU2VwIDIwMjAgYXQgMDg6NTMsIExpIEhlbmcgPGxpaGVuZzQwQGh1YXdl
aS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2Fybmlu
ZyB3aXRoICJtYWtlIFc9MSI6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYzo3Mzoz
Mjogd2FybmluZzoKPiDigJh2M2RfdjNkX3BtX29wc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1
bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpIEhlbmcgPGxpaGVuZzQwQGh1YXdl
aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jIHwgNCAtLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92M2QvdjNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMKPiBp
bmRleCA5ZjdjMjYxLi4wNTE0MGRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92M2Qv
djNkX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMKPiBAQCAtNzAs
MTAgKzcwLDYgQEAgc3RhdGljIGludCB2M2RfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICB9Cj4gICNlbmRpZgo+Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB2
M2RfdjNkX3BtX29wcyA9IHsKPiAtICAgICAgIFNFVF9SVU5USU1FX1BNX09QUyh2M2RfcnVudGlt
ZV9zdXNwZW5kLCB2M2RfcnVudGltZV9yZXN1bWUsIE5VTEwpCj4gLX07Cj4gLQoKVGhpcyBsb29r
cyB0byBiZSB0aGUgd3JvbmcgYXBwcm9hY2gsIGFuZCBJIHRoaW5rIGEgcGF0Y2ggaGFzIGdvdApk
cm9wcGVkIHNvbWV3aGVyZS4KCk9uIG91ciBSYXNwYmVycnkgUGkgZG93bnN0cmVhbSB2ZW5kb3Ig
dHJlZSB3ZSBoYXZlIGEgcGF0Y2ggWzFdIGZyb20KRXJpYyB0aGF0IHJlbmFtZXMgdjNkX3YzZF9w
bV9vcHMgdG8gdjNkX3BtX29wcyAoZG9uJ3QgbmVlZCB0aGUKZHVwbGljYXRlZCBzdWZmaXgpLCBh
bmQgYWRkcyBpdCB0byB2M2RfcGxhdGZvcm1fZHJpdmVyLiBXaHkgdGhhdCBuZXZlcgptYWRlIGl0
IHRocm91Z2ggdGhlIG1haW5saW5lIHRyZWVzIEkgZG9uJ3Qga25vdy4KCkVyaWM6IEhvdyBnb29k
J3MgeW91ciBtZW1vcnkgb24gdGhpcyBvbmU/CgpUaGFua3MKICBEYXZlCgpbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2NvbW1pdC9mZGRmYjI2ZjY1MDM4MzVhM2M2Zjdj
YTAxNzVjZTIyNjBmNjBmNjdjCgo+ICBzdGF0aWMgaW50IHYzZF9nZXRfcGFyYW1faW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpCj4gIHsKPiAtLQo+IDIuNy40Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
