Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652342AE92
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3689834;
	Mon, 27 May 2019 06:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD478981D;
 Mon, 27 May 2019 06:24:57 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id d128so9856739vsc.10;
 Sun, 26 May 2019 23:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=96linObTvpMDD3DT2H83EiWEt1V/vjlCCIeI/doDaBE=;
 b=aAdRJz8uGeL1fioXhqTdp6i5/7eIWTNjFJMO6XkKWX2kTi1aE3CMngMu2wBbVR1pdF
 pTwEntyqvyqZcerb4SkrBOj6hUhsfaMjDPhH4ZO3duQrPgfZI3SdlKO4RuyuPtlqlf+X
 eSJsi4P/YR8spHD93NrBIamJwoDhsifXkTe3fX4ATEeh4heClx1p5ioOaXlYqH3OEjcj
 zi/pgmi5QenPvQwYoJPyT7YpTU0Z1BtLQ1rCSAGh41yVu6sli1GJ2yA0sYZshtq8AlLo
 UVFdzG1OsdrdMxze27qoKOWK0wUkCJWSyu9KKcrFxyYtx6+muz1c29+HAup0PKYA/ZL/
 MepA==
X-Gm-Message-State: APjAAAX+mM3EmEU0e+cW946hYC67UsMecKSVJMLYDJwNBQvJsMHjO8V5
 KgnpOmshI7/jNQmlkckVWkpDrhFQLqveOAQPBjmhXA==
X-Google-Smtp-Source: APXvYqx+usWPvmIG7jxaUP3T/9xlTIjhtYL0wb9jK35lRawpzmD1rSpsCRMo2khRZG9o8ZWUNfQELSihAaBuYVDqr00=
X-Received: by 2002:a67:ce96:: with SMTP id c22mr58769950vse.204.1558938296857; 
 Sun, 26 May 2019 23:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190525224149.4652-1-imirkin@alum.mit.edu>
In-Reply-To: <20190525224149.4652-1-imirkin@alum.mit.edu>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 27 May 2019 16:24:45 +1000
Message-ID: <CACAvsv76NmgiMtx+NrtbMrLo2EDU8nazgSvTmK19_Wz-XDVn8Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/disp/nv50-: force scaler for
 any non-default LVDS/eDP modes
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=96linObTvpMDD3DT2H83EiWEt1V/vjlCCIeI/doDaBE=;
 b=Ewdc/aYVnYTqyWFR8VuV9bQt9+p97pl2zSh4bH8KuUqZ0W/nE0wnkBw0A07EspwGi9
 pKocspz0e3DKwC2jC+47cDw0KF7DS+TYIC9HbJCvQkKy1MUUwRXMlEtxqGl7VyUmZPZO
 Tuub6wOEDRQLp+ahMYxKoLl+oZdreEAIJl8wFoX73RPKHhJtcRAhYxmQ3lUSXhFOUJon
 sTTIoe1vrhvH15IuqJ9rULTow6hwYuArUcXHZdQi4Oe1nOIWAYLVVswsiCGA27ESGR8O
 zTBlYxEcnFOjuceLYPbMKxzPDn4Y8Tul11ly50BHMzS+2wNBM01LiSAuU2qgVa2cbuS2
 HBxA==
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNiBNYXkgMjAxOSBhdCAwODo0MSwgSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5t
aXQuZWR1PiB3cm90ZToKPgo+IEhpZ2hlciBsYXllcnMgdGVuZCB0byBhZGQgYSBsb3Qgb2YgbW9k
ZXMgbm90IGFjdHVhbGx5IGluIHRoZSBFRElELCBzdWNoCj4gYXMgdGhlIHN0YW5kYXJkIERNVCBt
b2Rlcy4gQ2hhbmdpbmcgdGhpcyB3b3VsZCBiZSBleHRyZW1lbHkgaW50cnVzaXZlIHRvCj4gZXZl
cnlvbmUsIHNvIGp1c3QgZm9yY2UgdGhlIHNjYWxlciBtb3JlIG9mdGVuLiBUaGVyZSBhcmUgbm8g
cHJhY3RpY2FsCj4gY2FzZXMgd2UncmUgYXdhcmUgb2Ygd2hlcmUgYSBMVkRTL2VEUCBwYW5lbCBo
YXMgbXVsdGlwbGUgcmVzb2x1dGlvbnMKPiBleHBvc2VkLCBhbmQgaTkxNSBhbHJlYWR5IGRvZXMg
aXQgdGhpcyB3YXkuCj4KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTEwNjYwCj4gU2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJr
aW5AYWx1bS5taXQuZWR1PgpUaGFua3MgSWxpYSwgZ3JhYmJlZCBib3RoIHBhdGNoZXMuCgo+IC0t
LQo+Cj4gVW50ZXN0ZWQgZm9yIG5vdywgaG9waW5nIHRoYXQgdGhlIGJ1Z3ppbGxhIGZpbGVyIHdp
bGwgdGVzdCBpdCBvdXQuIFNlZW1zCj4gb2J2aW91cyB0aG91Z2guCj4KPiAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgOSArKysrKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBpbmRleCAxMzQ3MDFhODM3YzguLmVmOGQ3YTcxNTY0YSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBAQCAtMzIyLDgg
KzMyMiwxMyBAQCBudjUwX291dHBfYXRvbWljX2NoZWNrX3ZpZXcoc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyLAo+ICAgICAgICAgICAgICAgICBzd2l0Y2ggKGNvbm5lY3Rvci0+Y29ubmVjdG9y
X3R5cGUpIHsKPiAgICAgICAgICAgICAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUzoK
PiAgICAgICAgICAgICAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOgo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIC8qIEZvcmNlIHVzZSBvZiBzY2FsZXIgZm9yIG5vbi1FRElEIG1vZGVz
LiAqLwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChhZGp1c3RlZF9tb2RlLT50eXBlICYg
RFJNX01PREVfVFlQRV9EUklWRVIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogRG9uJ3Qg
Zm9yY2Ugc2NhbGVyIGZvciBFRElEIG1vZGVzIHdpdGgKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgKiBzYW1lIHNpemUgYXMgdGhlIG5hdGl2ZSBvbmUgKGUuZy4gZGlmZmVyZW50Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICogcmVmcmVzaCByYXRlKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChhZGp1c3RlZF9tb2RlLT5oZGlz
cGxheSA9PSBuYXRpdmVfbW9kZS0+aGRpc3BsYXkgJiYKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYWRqdXN0ZWRfbW9kZS0+dmRpc3BsYXkgPT0gbmF0aXZlX21vZGUtPnZkaXNwbGF5ICYm
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkanVzdGVkX21vZGUtPnR5cGUgJiBEUk1f
TU9ERV9UWVBFX0RSSVZFUikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIG1vZGUgPSBuYXRpdmVfbW9kZTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBhc3ljLT5zY2FsZXIuZnVsbCA9IHRydWU7Cj4gLS0KPiAyLjIxLjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91
dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
