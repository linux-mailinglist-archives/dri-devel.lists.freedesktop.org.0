Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0072AA0634
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C1689D67;
	Wed, 28 Aug 2019 15:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1CB89D67
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:22:59 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id m9so101265ybm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4/bQuA0olru6cBDNINiLhG7gYVsNwjKBQnNLgsaDVhU=;
 b=M22KL4RQ5e7lmVI0sJ3eALslsxrEfHFHuuDyxesVZe+0UHc49TfZTZTVqWk4i8OZTb
 dB4F0ZdKitNC/wEE7LHnegB7TWvyTXwSPG2IQotCMgZbSTxWGpVucqYPnIkl3U2EOVCU
 OughP7vcwwbkcWnppa5+FGBq6p+F7+9xYykLvItXR4xts/2wJnV8OSOeXw9n/4KymQbi
 WO4UaNnEBYEXBJ2EGOWiDU2iM0GwrICdoL9VBH4Fq8xL1uReUn1Pk2U2npH5FzH5qwUc
 TcUR40DE+sFvig/BaTt9J0YuvZKj0JDCEJGwtLeE8l/3nnsCBi4qQ8s4YabZc/ushrkl
 SV5g==
X-Gm-Message-State: APjAAAUT+BCLctf+DdYUFlO4CFFh0ilRiwUNf8mWpYlG18BLqTEoblQa
 /qV9gWgssm7nV6foi5uUmo0qmQ==
X-Google-Smtp-Source: APXvYqwK+gxl/4W47dbQl3Zw+vGHNpAwspkj3ZB9sIn/1RGcWWbEUyle0Mz+VFMcJjE9GrMT0sN+Qg==
X-Received: by 2002:a25:2b8a:: with SMTP id r132mr3207038ybr.247.1567005778565; 
 Wed, 28 Aug 2019 08:22:58 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id o3sm955011ywi.93.2019.08.28.08.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 08:22:58 -0700 (PDT)
Date: Wed, 28 Aug 2019 11:22:57 -0400
From: Sean Paul <sean@poorly.run>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 08/21] drm/msm: Use drm_attach_bridge() to attach a
 bridge to an encoder
Message-ID: <20190828152257.GB218215@art_vandelay>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-9-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826152649.13820-9-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4/bQuA0olru6cBDNINiLhG7gYVsNwjKBQnNLgsaDVhU=;
 b=IhET+zEX6x/aMiHl1JLvJUpOVNaynE03qcxaafsyxJHoN6O0TX30bM+RAgfAqfYqDv
 NuRv5Q/xAp0eMOnaNM8bCkei01OXedZNu4UHgQFRaGT9jGDSWwsW3LWnqV2n3lMSub1D
 snkfyd5z7qbYJEnNRfEG7Hg4R12nEqGifTFTDe6SjcoO+IlgY143y08H4ADb+7Ke/q0q
 rekZjeq93ru0+JvfQ+j4h9C2t5ezqgPouyOzmk/S5auy7yGuvfg+ZlFtpMGTWI9BgU61
 eQg11CJFC0JHfuAyTloTiIo4alCDP3q1u1wmpIXI7uAfjq+niZ18OMm0L8l29SrPSQdu
 hCww==
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <Chris.Healy@zii.aero>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDU6MjY6MzZQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IFRoaXMgaXMgcGFydCBvZiBvdXIgYXR0ZW1wdCB0byBtYWtlIHRoZSBicmlkZ2Ug
Y2hhaW4gYSBkb3VibGUtbGlua2VkCj4gbGlzdCBiYXNlZCBvbiB0aGUgZ2VuZXJpYyBsaXN0IGhl
bHBlcnMuIEluIG9yZGVyIHRvIGRvIHRoYXQsIHdlIG11c3QKPiBwYXRjaCBhbGwgZHJpdmVycyBt
YW5pcHVsYXRpbmcgdGhlIGVuY29kZXItPmJyaWRnZSBmaWVsZCBkaXJlY3RseS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
Pgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KCkRvIHlvdSB3YW50IHRvIHRha2UgdGhpcyB0aHJvdWdoIC1taXNjPwoKUmV2aWV3ZWQtYnk6
IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAq
IEFkZCBMYXVyZW50IGFuZCBTYW0gUi1iICh3YWl0aW5nIGZvciBhIFItYiBmcm9tIGEgZHJtL21z
bSBtYWludGFpbmVyCj4gICBub3cpCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2Vk
cC5jICAgfCA0ICsrKy0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWkuYyB8IDQgKysr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2VkcC9lZHAuYwo+IGluZGV4IGI1NDU1OWE3OWQzNi4uYWQ0ZTk2M2NjZDliIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9lZHAvZWRwLmMKPiBAQCAtMTc4LDcgKzE3OCw5IEBAIGludCBtc21fZWRw
X21vZGVzZXRfaW5pdChzdHJ1Y3QgbXNtX2VkcCAqZWRwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+ICAJCWdvdG8gZmFpbDsKPiAgCX0KPiAgCj4gLQllbmNvZGVyLT5icmlkZ2UubmV4dCA9IGVk
cC0+YnJpZGdlOwo+ICsJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgZWRwLT5icmlk
Z2UsIE5VTEwpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIGZhaWw7Cj4gIAo+ICAJcHJpdi0+YnJp
ZGdlc1twcml2LT5udW1fYnJpZGdlcysrXSAgICAgICA9IGVkcC0+YnJpZGdlOwo+ICAJcHJpdi0+
Y29ubmVjdG9yc1twcml2LT5udW1fY29ubmVjdG9ycysrXSA9IGVkcC0+Y29ubmVjdG9yOwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9oZG1pL2hkbWkuYwo+IGluZGV4IDlkOTRhODhkZDhkNi4uNTViOWE4YzgzMTJiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jCj4gQEAgLTMyNyw3ICszMjcsOSBAQCBpbnQgbXNt
X2hkbWlfbW9kZXNldF9pbml0KHN0cnVjdCBoZG1pICpoZG1pLAo+ICAJCWdvdG8gZmFpbDsKPiAg
CX0KPiAgCj4gLQllbmNvZGVyLT5icmlkZ2UubmV4dCA9IGhkbWktPmJyaWRnZTsKPiArCXJldCA9
IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGhkbWktPmJyaWRnZSwgTlVMTCk7Cj4gKwlpZiAo
cmV0KQo+ICsJCWdvdG8gZmFpbDsKPiAgCj4gIAlwcml2LT5icmlkZ2VzW3ByaXYtPm51bV9icmlk
Z2VzKytdICAgICAgID0gaGRtaS0+YnJpZGdlOwo+ICAJcHJpdi0+Y29ubmVjdG9yc1twcml2LT5u
dW1fY29ubmVjdG9ycysrXSA9IGhkbWktPmNvbm5lY3RvcjsKPiAtLSAKPiAyLjIxLjAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApT
ZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
