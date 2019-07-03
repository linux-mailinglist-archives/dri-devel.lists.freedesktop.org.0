Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6275DCD5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 05:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C6C6E0CB;
	Wed,  3 Jul 2019 03:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5356E0CB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 03:21:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id x21so762177otq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 20:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2v82hF0K9CTpbDqrcICgoQLpytap/DsJqT9Ptu9mJ/4=;
 b=WyIwyl+1x7b4VgHYIFZY7dXb5qAQOVjcmTU3uyZAzSKX0tGwkGvS6VBT1dRQxA4lei
 WRX4sSZxdfcSVcyQP3eq56MlPnBI4/pCqBX7JwWn2XoEE1T5pgEIwXbhpb0xE1XYy+q+
 gltsrYOjo0wT5K2KHfhyfJxxiSey1r9c5hgNBBkSQyruUY5I/C/hzg4j6sY/RoZTm2Y2
 6r0mq6miGQZKwTZkj2gqrg+YEb6K/ZDgclpgh0quIYKetA8LiI1c7jQDCKQm9kieEHO0
 dwZubZfhhz0q1spH5OnNug0hYXK7veRUzMFn8AOxHn9G28hMtztlXHM/xozCekC1F1ay
 RNng==
X-Gm-Message-State: APjAAAXPAF5cTg715h9AAwViILvIjH92gg+woitZg45/dxxVxydKNIR7
 0KZN+vCYGWr48OcCeuU65DYeLwr/YfT6XQsUmMKT/A==
X-Google-Smtp-Source: APXvYqzymuIVl6C8g3xmXip0+WpmJHoLIcPPM2zFPiI2vELjFFIyc70wVOeNqkxujAdbUlnieB3TniADdoU4SMKuFqo=
X-Received: by 2002:a9d:6c17:: with SMTP id f23mr16907531otq.174.1562124067647; 
 Tue, 02 Jul 2019 20:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190703032023.22232-1-imirkin@alum.mit.edu>
In-Reply-To: <20190703032023.22232-1-imirkin@alum.mit.edu>
From: David Airlie <airlied@redhat.com>
Date: Wed, 3 Jul 2019 13:20:56 +1000
Message-ID: <CAMwc25qhXcBKJuZnbipcuRMzGdMfgxuKhTgxuJKKEBehJZ1xVA@mail.gmail.com>
Subject: Re: [PATCH libdrm] tests/util: fix incorrect memset argument order
To: Ilia Mirkin <imirkin@alum.mit.edu>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpPbiBXZWQsIEp1
bCAzLCAyMDE5IGF0IDE6MjAgUE0gSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PiB3
cm90ZToKPgo+IE1ha2UgaXQgYWN0dWFsbHkgY2xlYXIgdGhlIExVVC4KPgo+IFJlcG9ydGVkLWJ5
OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IElsaWEg
TWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KPiAtLS0KPiAgdGVzdHMvdXRpbC9wYXR0ZXJu
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3V0aWwvcGF0dGVybi5jIGIvdGVzdHMvdXRpbC9wYXR0
ZXJuLmMKPiBpbmRleCA0MmEwZTVjNy4uYmYxNzk3ZDQgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvdXRp
bC9wYXR0ZXJuLmMKPiArKysgYi90ZXN0cy91dGlsL3BhdHRlcm4uYwo+IEBAIC02NDMsNyArNjQz
LDcgQEAgdm9pZCB1dGlsX3NtcHRlX2M4X2dhbW1hKHVuc2lnbmVkIHNpemUsIHN0cnVjdCBkcm1f
Y29sb3JfbHV0ICpsdXQpCj4gICAgICAgICAgICAgICAgIHByaW50ZigiRXJyb3I6IGdhbW1hIHRv
byBzbWFsbDogJWQgPCAlZFxuIiwgc2l6ZSwgNyArIDcgKyA4KTsKPiAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+ICAgICAgICAgfQo+IC0gICAgICAgbWVtc2V0KGx1dCwgc2l6ZSAqIHNpemVvZihz
dHJ1Y3QgZHJtX2NvbG9yX2x1dCksIDApOwo+ICsgICAgICAgbWVtc2V0KGx1dCwgMCwgc2l6ZSAq
IHNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2x1dCkpOwo+Cj4gICNkZWZpbmUgRklMTF9DT0xPUihp
ZHgsIHIsIGcsIGIpIFwKPiAgICAgICAgIGx1dFtpZHhdLnJlZCA9IChyKSA8PCA4OyBcCj4gLS0K
PiAyLjIxLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
