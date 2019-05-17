Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE467265D7
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97CC89AC0;
	Wed, 22 May 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437038999E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 22:08:35 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id w21so3323638ywd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 15:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jft35/5eu7LfpLWAoZ01uRn8po613JLoj7AyHoG1GXA=;
 b=hY3ip0mf57hgnAvAVBRXDLdDDo15XoRuBwzkzf964jyCu+D+rflDxojfbqxgAy6UXt
 zax92sHafn5t6AMGwYUg6a++dPOj5R4q+oPSpMSwzJZJk2q4023bOhhQzNM65ddExUVY
 SEnJcvTrRiPCq4p22fzixZpj5gKaT2Oa+RwfL+A5D5Suemqvq9bPveYhWM1TBTYanJCB
 +ZSDi1giJy+HFzqiAd0l3NfaP+Gcp2NBuOVmwc1105A9L24aYVnCW3zEfySMDIaIO8O8
 0sitdpcvnsj2LkHXdoBFnmsxJ2ajAPH6AgFhM4MuEXk8lJJSbfjwlM7HLSI4gn7lOfNe
 ZEMg==
X-Gm-Message-State: APjAAAWzmsK4xdFrzsdQOiB+MpJGKY0d3g5zbwVujRXi8KYu/pomPLRc
 +9uEpP/pGv3flISKFEwqVcxP9rE3+tRKWBlSLqTE+T3ka12NPA==
X-Google-Smtp-Source: APXvYqxcSNmzU/oyHvSUYVr+deObwpxqKqFM5P2fsb0esZnQS0M5F0CXJpjeTYUlAVM4uj0CwId57+uwvLalM45wrhw=
X-Received: by 2002:a81:9a4b:: with SMTP id r72mr5190935ywg.422.1558130914303; 
 Fri, 17 May 2019 15:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190517184659.18828-1-peron.clem@gmail.com>
 <20190517184659.18828-2-peron.clem@gmail.com>
 <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
In-Reply-To: <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 18 May 2019 00:08:22 +0200
Message-ID: <CAJiuCcdMxXAXYk=QpRwsvBUW0tvBVMqXvgx0Y7fAKP=ouyBnKQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jft35/5eu7LfpLWAoZ01uRn8po613JLoj7AyHoG1GXA=;
 b=NYUgiQf/XO3wfHvPfBK9JqBrKKj3Wmowkwt6/vjOgQkCDK/v6jvW0oo1OZnPmZfOd6
 gXIM2YU1dxM65gHmFxomQBCOUKQV3zVEh6vSfVBe+5Nw1XhNUuyzAv724hOrXXhgW8Cn
 VQkWNIdZVzet1VOC/zC6hyJHTH5bUEGREk5GN72T5tLuAz7M2PAc55Z2kxM6tQ5SMraJ
 VZtkn8qK6YLUjTu/4tr0kcNDMPH4zIjSprh5Iy1oYW+ZozjdEZzHGQPDCltQ3I55Bt0/
 elMkVF9psPDUj7MHeBzCfsRcjwvVTi/HiUpy5OLdflq0g+ead+zvm2UIv6NzBHoYmvym
 E5XA==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gRnJpLCAxNyBNYXkgMjAxOSBhdCAyMjowNywgUm9iIEhlcnJpbmcgPHJvYmgr
ZHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAxOjQ3IFBN
IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEFs
bHdpbm5lciBINiBoYXMgYW4gQVJNIE1hbGktVDcyMCBNUDIgd2hpY2ggcmVxdWlyZWQgYSBidXNf
Y2xvY2suCj4gPgo+ID4gQWRkIGFuIG9wdGlvbmFsIGJ1c19jbG9jayBhdCB0aGUgaW5pdCBvZiB0
aGUgcGFuZnJvc3QgZHJpdmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJv
biA8cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKystCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgIDEgKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKPiA+IGluZGV4IDNiMmJj
ZWQxYjAxNS4uOGRhNmU2MTJkMzg0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmMKPiA+IEBAIC00NCw3ICs0NCw4IEBAIHN0YXRpYyBpbnQgcGFu
ZnJvc3RfY2xrX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gPgo+ID4gICAg
ICAgICBwZmRldi0+Y2xvY2sgPSBkZXZtX2Nsa19nZXQocGZkZXYtPmRldiwgTlVMTCk7Cj4gPiAg
ICAgICAgIGlmIChJU19FUlIocGZkZXYtPmNsb2NrKSkgewo+ID4gLSAgICAgICAgICAgICAgIGRl
dl9lcnIocGZkZXYtPmRldiwgImdldCBjbG9jayBmYWlsZWQgJWxkXG4iLCBQVFJfRVJSKHBmZGV2
LT5jbG9jaykpOwo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIocGZkZXYtPmRldiwgImdldCBj
bG9jayBmYWlsZWQgJWxkXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgUFRSX0VSUihw
ZmRldi0+Y2xvY2spKTsKPgo+IFBsZWFzZSBkcm9wIHRoaXMgd2hpdGVzcGFjZSBjaGFuZ2UuCgpT
b3JyeSwgSSB0aG91Z2h0IGl0IHdhcyBvbmx5IGEgbWlzdGFrZSBoZXJlLCBJIHdpbGwgZHJvcCBp
dC4KV2h5IGFyZSB0aGV5IHNvIG1hbnkgbGluZXMgb3ZlciA4MCBjaGFyYWN0ZXJzPwpJcyB0aGVy
ZSBhIHNwZWNpZmljIGNvZGluZyBzdHlsZSB0byBmb2xsb3cgPwoKVGhhbmtzLApDbGVtZW50Cgo+
Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocGZkZXYtPmNsb2NrKTsKPiA+ICAg
ICAgICAgfQo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
