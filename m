Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76536545C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633F76E47A;
	Tue, 20 Apr 2021 08:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2A89CBC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:41:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s15so44052017edd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kTvIrhd5T0TmCSro7OLiMHWa1HxRfzT9Q0+pVpW/bYk=;
 b=DSigTbIsYkqSL3KITeBAXN/N0hP3Ld+165PN23dIeZJXGLdonEiXwLRfVPmWBp1go5
 FCrjItUox6HVivFasOP0JdWtU+i6ljo4CQQd6ILT0zdcdEAyW/ADSXxoKOwqOB2pxPGi
 zrM3Px+4JKJyk5BoGWJTlyOXmMvELNvZBsbxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kTvIrhd5T0TmCSro7OLiMHWa1HxRfzT9Q0+pVpW/bYk=;
 b=tZAFOC92qpCxO1rWg+cj0TZe5YsAa9N8ROozcwz8R8RoqIPzDBQsSf7x6kSnkRR9mB
 EO1lYQ8m2nyno9edoxqMCgkOXP3+1gohP5JLuLSOmuAifwfjGlVSZqZ93YE+JbZDgXhG
 Zg8KAoQHCjTSokZtqb0pFHu+EW8VswSk3sSZKMszbLALM7ejHqn6yRdmjPwwIxplu0/p
 wS75RW+rHu8uQZBF4lo+8PSGyX2ngF63erj9WXDtMOygnWah/PVTuiT7YxbM1YmM1I/b
 TtaiV757XKxsL+NC/6DVbwxizdDEMto+jeMfQWTfWsWpr5LLJXlDXNtitf06mfmc9Zi8
 OO4A==
X-Gm-Message-State: AOAM532SkxSVrU3iO9ZN7UlAQVEnUp2DNgjYOh5H+9j9JDXxdP2ydFdA
 aAf9AHT1phqnMAj6pBom+GwyOg==
X-Google-Smtp-Source: ABdhPJx2ryokP8VgMHZsZx3rV56DrXASKZhZO9f8TLrCQaNIsfP8YRMpAEE06MpiBvJ1iiDmKkZNzA==
X-Received: by 2002:a05:6402:42c9:: with SMTP id
 i9mr31162294edc.35.1618908100756; 
 Tue, 20 Apr 2021 01:41:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a21sm12068247ejk.15.2021.04.20.01.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:41:40 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:41:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 03/12] drm/exynos: Don't set allow_fb_modifiers explicitly
Message-ID: <YH6TwgrVIUlQwH2g@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <CGME20210413094922epcas1p47e75ce008a78971af7a923aadc0b9d3b@epcas1p4.samsung.com>
 <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
 <df4acc12-27da-3a81-6e2b-eee197107341@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df4acc12-27da-3a81-6e2b-eee197107341@samsung.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjAsIDIwMjEgYXQgMDM6MzE6MjdQTSArMDkwMCwgSW5raSBEYWUgd3JvdGU6
Cj4gCj4gCj4gMjEuIDQuIDEzLiDsmKTtm4QgNjo0OOyXkCBEYW5pZWwgVmV0dGVyIOydtCjqsIAp
IOyTtCDquIA6Cj4gPiBTaW5jZQo+ID4gCj4gPiBjb21taXQgODkwODgwZGRmZGJlMjU2MDgzMTcw
ODY2ZTQ5Yzg3NjE4YjcwNmFjNwo+ID4gQXV0aG9yOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5r
b2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gPiBEYXRlOiAgIEZyaSBKYW4gNCAwOTo1NjoxMCAy
MDE5ICswMTAwCj4gPiAKPiA+ICAgICBkcm06IEF1dG8tc2V0IGFsbG93X2ZiX21vZGlmaWVycyB3
aGVuIGdpdmVuIG1vZGlmaWVycyBhdCBwbGFuZSBpbml0Cj4gPiAKPiA+IHRoaXMgaXMgZG9uZSBh
dXRvbWF0aWNhbGx5IGFzIHBhcnQgb2YgcGxhbmUgaW5pdCwgaWYgZHJpdmVycyBzZXQgdGhlCj4g
PiBtb2RpZmllciBsaXN0IGNvcnJlY3RseS4gV2hpY2ggaXMgdGhlIGNhc2UgaGVyZS4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gCj4gQWNrZWQtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KClRoYW5rcyBm
b3IgdGFraW5nIGEgbG9vaywgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCi1EYW5pZWwKCj4gCj4g
VGhhbmtzLAo+IElua2kgRGFlCj4gCj4gPiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcu
Y29tPgo+ID4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KPiA+
IENjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgo+ID4gQ2M6IEt5dW5n
bWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gPiBDYzogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+ID4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwo+
ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiLmMgfCAyIC0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9mYi5jCj4gPiBpbmRleCA2NDM3MGI2MzRjY2EuLjc5ZmEzNjQ5
MTg1YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9m
Yi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmIuYwo+ID4g
QEAgLTE3Nyw3ICsxNzcsNSBAQCB2b2lkIGV4eW5vc19kcm1fbW9kZV9jb25maWdfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+ID4gIAlkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmV4eW5v
c19kcm1fbW9kZV9jb25maWdfZnVuY3M7Cj4gPiAgCWRldi0+bW9kZV9jb25maWcuaGVscGVyX3By
aXZhdGUgPSAmZXh5bm9zX2RybV9tb2RlX2NvbmZpZ19oZWxwZXJzOwo+ID4gIAo+ID4gLQlkZXYt
Pm1vZGVfY29uZmlnLmFsbG93X2ZiX21vZGlmaWVycyA9IHRydWU7Cj4gPiAtCj4gPiAgCWRldi0+
bW9kZV9jb25maWcubm9ybWFsaXplX3pwb3MgPSB0cnVlOwo+ID4gIH0KPiA+IAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
