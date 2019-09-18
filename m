Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86832B5EA4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 10:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430EA6EE42;
	Wed, 18 Sep 2019 08:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6526EE42
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:07:06 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p2so5729225edx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=m5LYvwyAkm+aQvtlpoOJefbVBy9j/nj11/gbHrhKdFU=;
 b=nAKxsB54Qp2jSPUipmN+XBxOMnn98Pb7Q1mwwY6lQ1lxVA80MxSG4D4BUOgDu5SZ76
 z6RWAdt6vV+jP6OdY+7YWt1t6S4JA1MC3VYUguf7Ku4kupcKtr4GNol3fUQL/Exr0/1M
 7lcGuSo1X8cB6vjzRyzV64mI7WwB1y6fnOnl49VMew+Gmj9gxu83FmP+rB8GY32DS2kQ
 55uS5pkml+vrAK3xA9YBaLgilb/1nRlYUpNK4Ek93xFZbrDDltLQbg9LUdaY2kjDc2Pb
 hchVPkTqaEReEGWXQRA+kznyKJF1kII5VjCg7wFzi7KLF9CZUvM6p/kz76O/1Zyh6JKq
 xUUA==
X-Gm-Message-State: APjAAAUU7uy5jz6k9mQScn+hjmw6YBZyWtSmO7qKoL6ZqoGeXfOPWSj1
 A72lqaFpCzULyCl/eHp8xFPs4g==
X-Google-Smtp-Source: APXvYqyFqDWQL/7Opk7OwtQkrJiBoVFmOP/yl15MdagZXeIcFHv2fYkVuB7H1FmCcjw/2fiUJgg7lg==
X-Received: by 2002:a50:d949:: with SMTP id u9mr8847510edj.142.1568794025086; 
 Wed, 18 Sep 2019 01:07:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t18sm897387eds.63.2019.09.18.01.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 01:07:04 -0700 (PDT)
Date: Wed, 18 Sep 2019 10:07:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/2] drm: Fix kerneldoc and remove unused struct member
 in self_refresh helper
Message-ID: <20190918080702.GA3958@phenom.ffwll.local>
References: <20190917200443.64481-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917200443.64481-1-sean@poorly.run>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m5LYvwyAkm+aQvtlpoOJefbVBy9j/nj11/gbHrhKdFU=;
 b=Gqm//9PwsXOjvUdDf9VNOqWzC4I39p+VL82ifSndkBboVSurb4HiK2itTBo4Zdk4LJ
 fUYS3ZqgWZGdxBGoG6pTfzDhxMvYNmWQXkiciKR22W3RmFZtKcoB/VJ6SVKFMctpySya
 k3n+4enkgg18sgnovOaXAKX79BKXdA8i1LWiE=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 jekarl@iki.fi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDQ6MDQ6MzJQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEFydGlmYWN0
cyBvZiBwcmV2aW91cyByZXZpc2lvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxz
ZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZy
ZXNoX2hlbHBlci5jIHwgMSAtCj4gIGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgICAg
ICAgICAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVz
aF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCj4g
aW5kZXggNGI5NDI0YThmMWYxLi45MDk1Y2ViZjIxNDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYwo+IEBAIC01Myw3ICs1Myw2IEBACj4gIHN0cnVjdCBk
cm1fc2VsZl9yZWZyZXNoX2RhdGEgewo+ICAJc3RydWN0IGRybV9jcnRjICpjcnRjOwo+ICAJc3Ry
dWN0IGRlbGF5ZWRfd29yayBlbnRyeV93b3JrOwo+IC0Jc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnNhdmVfc3RhdGU7Cj4gIAl1bnNpZ25lZCBpbnQgZW50cnlfZGVsYXlfbXM7Cj4gIH07Cj4gIAo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oIGIvaW5jbHVkZS9kcm0vZHJtX2Ny
dGMuaAo+IGluZGV4IDdlMjk2M2NhZDU0My4uNzQyYjMxMDQzODk4IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9jcnRjLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gQEAg
LTExMDcsNyArMTEwNyw3IEBAIHN0cnVjdCBkcm1fY3J0YyB7Cj4gIAkvKioKPiAgCSAqIEBzZWxm
X3JlZnJlc2hfZGF0YTogSG9sZHMgdGhlIHN0YXRlIGZvciB0aGUgc2VsZiByZWZyZXNoIGhlbHBl
cnMKPiAgCSAqCj4gLQkgKiBJbml0aWFsaXplZCB2aWEgZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXJf
cmVnaXN0ZXIoKS4KPiArCSAqIEluaXRpYWxpemVkIHZpYSBkcm1fc2VsZl9yZWZyZXNoX2hlbHBl
cl9pbml0KCkuCj4gIAkgKi8KPiAgCXN0cnVjdCBkcm1fc2VsZl9yZWZyZXNoX2RhdGEgKnNlbGZf
cmVmcmVzaF9kYXRhOwo+ICB9Owo+IC0tIAo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
