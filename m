Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8025357E0C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFC86E20A;
	Thu,  8 Apr 2021 08:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0283E6E20A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:30:32 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id y32so882573pga.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bLnLt1IJMnpnYn973wEDhDqSaKlKmayBaQfbYqGVhRw=;
 b=wFbbzr4H2Ar+FEVgpPeNLqwIsKX7UG61OSn7q8DEv9VROH3hE/yquH+XzegXnJ2YyP
 xdLLTb9w5v3i29T6NMXC/HJL2ZUtJseFJGpkIpkdnOSv3Sh2WUtiLThNLd0v8a5HE44V
 6NNs8Vv11yid1Lm+ZxhuJdSR8URtf7O53rDpJczTBpKeObRZ9cZzDIKIKLZkJFXBsikH
 ftoNZrNLyxjmLAFnwLKVvBXArfu31RDCEXTMiwhqpIGxT+hSceb4b8U74jwgqIa5QcQs
 UxfVz7hzx9Fq042gWV1icJYdL61bfA0uhrXl16AorNm0eAL6u9IDspnXu/IcWvmLV1ux
 Hk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bLnLt1IJMnpnYn973wEDhDqSaKlKmayBaQfbYqGVhRw=;
 b=CxCce57kCMMpUQuUjLRP2h5cIdju8B1F1YUwHxT/8BoNiM54yZ6cSc6R5HePiyHtcq
 CXThPsMK/z5HMi19B6fP+OEO+JxtnxyjP8+PHJABWkwO42ivmnQ+fVy2rKwddKcTk3j1
 Zh0EXXCgjcKryvLPGy++GLDzlT+aJWZDsuJkIiz7QAs+9pnpOC48wjk4bwSH1NREfq8Q
 j2gpXBQOvtbCck+iC3c31cvACZBVNbt8gadqwxp5fbtgYkKZ0udTmfyYwm8oA9207feH
 Ga1BkboKs9Vx+DAfxTyZJEEmLoOtGR9OI0fbajhFiQEgBRsNarZibpaAtFs1MNn/P9yW
 mCxA==
X-Gm-Message-State: AOAM533XCIUKNRE82bGyyzGNKETJPAfAf+Yek4dXCMAJX++8mbLxrRmm
 oSLe9GReAsEjJ+sOk/tEKG3sccfbiOSXxyZn2mfEHQ==
X-Google-Smtp-Source: ABdhPJzYw/mE3G7ZIWzSNBZcklmudNeVOBZ3n/jzdfPTPDxZY8eypMcr1oGleFtGj/YOCNyDSWyEqmjS0EhwpklcDy8=
X-Received: by 2002:aa7:980a:0:b029:20c:5402:5de9 with SMTP id
 e10-20020aa7980a0000b029020c54025de9mr6468874pfl.18.1617870632432; Thu, 08
 Apr 2021 01:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210408035435.250677-1-zhangjianhua18@huawei.com>
In-Reply-To: <20210408035435.250677-1-zhangjianhua18@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 8 Apr 2021 10:30:21 +0200
Message-ID: <CAG3jFysgEC9N1CE1UT4fAgp=ad_89cD7r0=7tD8vF9GvyXCS0A@mail.gmail.com>
Subject: Re: [PATCH -next v2] drm/bridge: lt8912b: Add header file
 <linux/gpio/consumer.h>
To: Zhang Jianhua <zhangjianhua18@huawei.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com, Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IFpoYW5nLAoKCk9uIFRodSwgOCBBcHIgMjAyMSBhdCAwNTo1NCwgWmhhbmcgSmlhbmh1YSA8
emhhbmdqaWFuaHVhMThAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBJZiBDT05GSUdfRFJNX0xPTlRJ
VU1fTFQ4OTEyQj1tLCB0aGUgZm9sbG93aW5nIGVycm9ycyB3aWxsIGJlIHNlZW4gd2hpbGUKPiBj
b21waWxpbmcgbG9udGl1bS1sdDg5MTJiLmMKPgo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9u
dGl1bS1sdDg5MTJiLmM6IEluIGZ1bmN0aW9uCj4g4oCYbHQ4OTEyX2hhcmRfcG93ZXJfb27igJk6
Cj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYzoyNTI6MjogZXJyb3I6
IGltcGxpY2l0Cj4gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZ3Bpb2Rfc2V0X3ZhbHVlX2Nh
bnNsZWVw4oCZOyBkaWQgeW91IG1lYW4KPiDigJhncGlvX3NldF92YWx1ZV9jYW5zbGVlcOKAmT8g
Wy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICBncGlvZF9zZXRfdmFs
dWVfY2Fuc2xlZXAobHQtPmdwX3Jlc2V0LCAwKTsKPiAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+ICAgZ3Bpb19zZXRfdmFsdWVfY2Fuc2xlZXAKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xv
bnRpdW0tbHQ4OTEyYi5jOiBJbiBmdW5jdGlvbiDigJhsdDg5MTJfcGFyc2VfZHTigJk6Cj4gZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYzo2Mjg6MTM6IGVycm9yOiBpbXBs
aWNpdAo+IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFs
4oCZOyBkaWQgeW91IG1lYW4KPiDigJhkZXZtX2dwaW9fcmVxdWVzdF9vbmXigJk/IFstV2Vycm9y
PWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgZ3BfcmVzZXQgPSBkZXZtX2dwaW9k
X2dldF9vcHRpb25hbChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKPiAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgICAgZGV2bV9ncGlvX3JlcXVl
c3Rfb25lCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYzo2Mjg6NTE6
IGVycm9yOiDigJhHUElPRF9PVVRfSElHSOKAmQo+IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmEdQSU9GX0lOSVRfSElHSOKAmT8KPiAgIGdw
X3Jlc2V0ID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRf
SElHSCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBHUElPRl9JTklUX0hJR0gKPgo+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIEpp
YW5odWEgPHpoYW5namlhbmh1YTE4QGh1YXdlaS5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBhZGQgaGVh
ZGVyIGZpbGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4gZm9yIGxvbnRpdW0tbHQ4OTEyYi5jIGlu
c3RlYWQKPiAgIG9mIGFkZCBjb25maWcgZGVwZW5kZW5jZSBmb3IgQ09ORklHX0RSTV9MT05USVVN
X0xUODkxMkIKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIu
YyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYwo+IGluZGV4IDYxNDkxNjE1YmFkMC4uNzk4NDVi
M2IxOWUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5
MTJiLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jCj4g
QEAgLTMsNiArMyw3IEBACj4gICAqIENvcHlyaWdodCAoYykgMjAxOCwgVGhlIExpbnV4IEZvdW5k
YXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gICAqLwo+Cj4gKyNpbmNsdWRlIDxsaW51eC9n
cGlvL2NvbnN1bWVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KCkFkZCB0aGlzICNpbmNs
dWRlIGluIGFscGhhYmV0aWNhbCBvcmRlci4gV2l0aCB0aGlzIGNoYW5nZSwgZmVlbCBmcmVlCnRv
IGFkZCBteSByLWIuCgpSZXZpZXdlZC1ieTogUm9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGxpbmFy
by5vcmc+Cgo+IC0tCj4gMi4xNy4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
