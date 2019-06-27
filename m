Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794BA58D2D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 23:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFE86E841;
	Thu, 27 Jun 2019 21:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1410B6E841
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 21:35:32 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so8541078eds.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=z97Q4/dPPEZVULQCHeK9Jwk8nEp0usx/tIRiKgg3S/o=;
 b=Y/3KWMqNF2dyjbRIeLp5/XtC4gNq8IK7y+O91/b/2+FXREEswVb5KTJ9fvxUU8FENO
 3mxHEgLfGQ+X2oem+6vyS9pIjkMZfEtOma1jAgsRykQpljLYyqRwHnzhUcrg74imkysh
 OJRPKzy2WyJUpN5lhBOsHq17YExMlFgrIQ74py5dYrOh4mG+0RRU5haON3fj+f+N2nP/
 z5HFUxM3TXSMSjqu7IzvCyMrAHClroDC4WQyXeRBPxjFtlCTw3NbjvSoy+xD8bKnbvGH
 63wuTG3JteSZgMzu0SlugXb4/Ts0V0PDPva2cn5QNnrFPPIIQiE4oQYYTYb1bLyXiKaK
 AobA==
X-Gm-Message-State: APjAAAVoGLWknLraW3x/xpMQSJkGbEXXAApLSMpbv7hWVkjN/VLOOnbN
 XAHDION0iZmOL1KkXMTGU0NJ1w==
X-Google-Smtp-Source: APXvYqxUl2o9fIUhCbc0U24E3jiq6RImW+9Bw0yC9BiTGXIfS3t2VkxKjlHXyVAo6I7HdYeYTsNPFg==
X-Received: by 2002:a17:906:944f:: with SMTP id
 z15mr5371429ejx.137.1561671330715; 
 Thu, 27 Jun 2019 14:35:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z9sm44187edd.53.2019.06.27.14.35.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 14:35:29 -0700 (PDT)
Date: Thu, 27 Jun 2019 23:35:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] drm/gem: Rename drm_gem_dumb_map_offset() to
 drm_gem_map_offset()
Message-ID: <20190627213527.GQ12905@phenom.ffwll.local>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190627155318.38053-1-steven.price@arm.com>
 <20190627155318.38053-2-steven.price@arm.com>
 <CAL_JsqJ5ebyrvapvOSvg1ejgkbqEZyYh2AWAbO0UE=DssKtW1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ5ebyrvapvOSvg1ejgkbqEZyYh2AWAbO0UE=DssKtW1Q@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=z97Q4/dPPEZVULQCHeK9Jwk8nEp0usx/tIRiKgg3S/o=;
 b=fHtdK+0Iz5BpxJTNhE0M6EeK8ymj5N+P4i2+okX37sxS/JuGr3t1WawA7o74mrLsaO
 0HtUGIJnR3GNf+OYA0GVQyPcyPbNBPq7vWJX71IEaBigp2VA7eWMsiAq9JK7eZVffPRE
 Hg3dz7Cs/L7TKp6bHuiovXEs+WNSkiWnGJJ2w=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6NTc6MzRBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgOTo1MyBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZl
bi5wcmljZUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBkcm1fZ2VtX2R1bWJfbWFwX29mZnNldCgp
IGlzIGEgdXNlZnVsIGhlbHBlciBmb3Igbm9uLWR1bWIgY2xpZW50cywgc28KPiA+IHJlbmFtZSBp
dCB0byByZW1vdmUgdGhlIF9kdW1iIGFuZCBhZGQgYSBjb21tZW50IHRoYXQgaXQgY2FuIGJlIHVz
ZWQgYnkKPiA+IHNobWVtIGNsaWVudHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFBy
aWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHVtYl9idWZmZXJzLmMgICAgICB8IDQgKystLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtLmMgICAgICAgICAgICAgICB8IDkgKysrKysrLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2dlbS5jIHwgMyArLS0KPiA+ICBpbmNsdWRlL2RybS9kcm1fZ2VtLmgg
ICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVy
cy5jCj4gPiBpbmRleCBkMThhNzQwZmUwZjEuLmI1NWNmYzllODc3MiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKPiA+IEBAIC00OCw3ICs0OCw3IEBACj4gPiAgICogVG8g
c3VwcG9ydCBkdW1iIG9iamVjdHMgZHJpdmVycyBtdXN0IGltcGxlbWVudCB0aGUgJmRybV9kcml2
ZXIuZHVtYl9jcmVhdGUKPiA+ICAgKiBvcGVyYXRpb24uICZkcm1fZHJpdmVyLmR1bWJfZGVzdHJv
eSBkZWZhdWx0cyB0byBkcm1fZ2VtX2R1bWJfZGVzdHJveSgpIGlmCj4gPiAgICogbm90IHNldCBh
bmQgJmRybV9kcml2ZXIuZHVtYl9tYXBfb2Zmc2V0IGRlZmF1bHRzIHRvCj4gPiAtICogZHJtX2dl
bV9kdW1iX21hcF9vZmZzZXQoKS4gU2VlIHRoZSBjYWxsYmFja3MgZm9yIGZ1cnRoZXIgZGV0YWls
cy4KPiA+ICsgKiBkcm1fZ2VtX21hcF9vZmZzZXQoKS4gU2VlIHRoZSBjYWxsYmFja3MgZm9yIGZ1
cnRoZXIgZGV0YWlscy4KPiA+ICAgKgo+ID4gICAqIE5vdGUgdGhhdCBkdW1iIG9iamVjdHMgbWF5
IG5vdCBiZSB1c2VkIGZvciBncHUgYWNjZWxlcmF0aW9uLCBhcyBoYXMgYmVlbgo+ID4gICAqIGF0
dGVtcHRlZCBvbiBzb21lIEFSTSBlbWJlZGRlZCBwbGF0Zm9ybXMuIFN1Y2ggZHJpdmVycyByZWFs
bHkgbXVzdCBoYXZlCj4gPiBAQCAtMTI3LDcgKzEyNyw3IEBAIGludCBkcm1fbW9kZV9tbWFwX2R1
bWJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmdzLT5oYW5kbGUsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFyZ3MtPm9mZnNl
dCk7Cj4gPiAgICAgICAgIGVsc2UKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gZHJtX2dlbV9k
dW1iX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gZHJtX2dlbV9tYXBfb2Zmc2V0KGZpbGVfcHJpdiwgZGV2LCBhcmdzLT5o
YW5kbGUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZhcmdzLT5vZmZzZXQpOwo+ID4gIH0KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiA+IGluZGV4IGE4YzQ0
NjhmMDNkOS4uNjI4NDJiNzcwMWJiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ID4gQEAgLTI5OCw3
ICsyOTgsNyBAQCBkcm1fZ2VtX2hhbmRsZV9kZWxldGUoc3RydWN0IGRybV9maWxlICpmaWxwLCB1
MzIgaGFuZGxlKQo+ID4gIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9oYW5kbGVfZGVsZXRlKTsKPiA+
Cj4gPiAgLyoqCj4gPiAtICogZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQgLSByZXR1cm4gdGhlIGZh
a2UgbW1hcCBvZmZzZXQgZm9yIGEgZ2VtIG9iamVjdAo+ID4gKyAqIGRybV9nZW1fbWFwX29mZnNl
dCAtIHJldHVybiB0aGUgZmFrZSBtbWFwIG9mZnNldCBmb3IgYSBnZW0gb2JqZWN0Cj4gPiAgICog
QGZpbGU6IGRybSBmaWxlLXByaXZhdGUgc3RydWN0dXJlIGNvbnRhaW5pbmcgdGhlIGdlbSBvYmpl
Y3QKPiA+ICAgKiBAZGV2OiBjb3JyZXNwb25kaW5nIGRybV9kZXZpY2UKPiA+ICAgKiBAaGFuZGxl
OiBnZW0gb2JqZWN0IGhhbmRsZQo+ID4gQEAgLTMwNywxMCArMzA3LDEzIEBAIEVYUE9SVF9TWU1C
T0woZHJtX2dlbV9oYW5kbGVfZGVsZXRlKTsKPiA+ICAgKiBUaGlzIGltcGxlbWVudHMgdGhlICZk
cm1fZHJpdmVyLmR1bWJfbWFwX29mZnNldCBrbXMgZHJpdmVyIGNhbGxiYWNrIGZvcgo+ID4gICAq
IGRyaXZlcnMgd2hpY2ggdXNlIGdlbSB0byBtYW5hZ2UgdGhlaXIgYmFja2luZyBzdG9yYWdlLgo+
ID4gICAqCj4gPiArICogSXQgY2FuIGFsc28gYmUgdXNlZCBieSBkcml2ZXJzIHVzaW5nIHRoZSBz
aG1lbSBiYWNrZW5kIGFzIHRoZXkgaGF2ZSB0aGUKPiA+ICsgKiBzYW1lIHJlc3RyaWN0aW9uIHRo
YXQgaW1wb3J0ZWQgb2JqZWN0cyBjYW5ub3QgYmUgbWFwcGVkLgo+IAo+IE1heWJlIGJldHRlciBu
b3QgdG8gc2F5ICdzaG1lbScgZXhwbGljaXRseSBvciBqdXN0IG1lbnRpb24gaXQgYXMgYW4KPiBl
eGFtcGxlIHNvIHdoZW4gd2UgaGF2ZSBhIDJuZCBjYXNlIHdlIGRvbid0IGhhdmUgdG8gdXBkYXRl
IHRoZQo+IGNvbW1lbnQuCj4gCj4gLi4uZHJpdmVycyB3aXRoIEdFTSBCTyBpbXBsZW1lbnRhdGlv
bnMgd2hpY2ggaGF2ZSB0aGUgc2FtZS4uLgo+IAo+IEkgY2FuIGZpeCB1cCBhbmQgYXBwbHkuIFNv
bWUgb3RoZXIgYWNrcyB3b3VsZCBiZSBuaWNlIGZpcnN0LgoKWWVhaCBrZXJuZWxkb2MgaXMgYSBi
aXQgc3Vib3B0aW1hbCwgd2l0aCB0aGF0IHBvbGlzaGVkLCBhLWI6IG1lLiBZb3VycwpzaG91bGQg
YmUgZ29vZCBlbm91Z2ggdGhvdWdoLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
