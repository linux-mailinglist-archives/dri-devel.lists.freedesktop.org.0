Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA0320F96
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 22:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0AD894EB;
	Thu, 16 May 2019 20:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2664E894EB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 20:25:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b8so6996691edm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=FbM6kYK8qDaSCxjbjwvaLEEjjuUd6lpMuLuY5LCU8A4=;
 b=bC7xUwzIJVKA969UrFappEF1fIVz18aWXtcvr+5LnJ/DkAj+dilQijHszfN6YSdDbh
 1Dg/cEHUGG6iSXeQ0r7NEhmszjMvdlA0BTLu0qmI/pIAlz+Apa4gtV0+0uAlpIVvkNjo
 eOZsLowjwAa79oWXRnWqskZehf83Dde7e+MNJPDi8wkJIAvH1cCc1rnHGQMOklD59jPR
 cm6nXism7QlkpzAACJWEZh8/HUtMlqwz+Fx0OYvd+TKIiTk1e5Z2Z5B318rI4ZGG3TrM
 OzspRvzkvTebugqlSR4GN0JOk9Yt61RtyKs9/JjUh1MYvIZtH0IwTODUGRi/Gdcxlhw+
 j4Yw==
X-Gm-Message-State: APjAAAXNDkeMy7WUk/bvXmadPH423VNE5JvDL36zpq+ROepDn+nJHTNh
 LvfbX04lsNMObasiCoMEuYZrsA==
X-Google-Smtp-Source: APXvYqwTczkD8DcRJoKp1ZAqpJVbATvhi2sCWZ/XQSH6S3eyrp3ivY4YlfBGDArwAsjCfxGNJJU5Ww==
X-Received: by 2002:a50:ec87:: with SMTP id e7mr52647119edr.126.1558038340813; 
 Thu, 16 May 2019 13:25:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y21sm2093670eds.31.2019.05.16.13.25.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 13:25:40 -0700 (PDT)
Date: Thu, 16 May 2019 22:25:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 1/3] drm/gem: Rename drm_gem_dumb_map_offset() to
 drm_gem_map_offset()
Message-ID: <20190516202537.GD3851@phenom.ffwll.local>
Mail-Followup-To: Steven Price <steven.price@arm.com>,
 Rob Herring <robh@kernel.org>,
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190516141447.46839-1-steven.price@arm.com>
 <20190516141447.46839-2-steven.price@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516141447.46839-2-steven.price@arm.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FbM6kYK8qDaSCxjbjwvaLEEjjuUd6lpMuLuY5LCU8A4=;
 b=gzNlisoZx8O9l4eiCtdEJCzWLHjt15TW/rhGY61RezCA1ZTIg1/HkJcWHHh1Dg+0Uk
 amiORah2jqE2/rLBg7atfVqDx62WQZOzmJdJTW3J4tucOrnZVvIk97W7o+cKyoGhgs33
 rWCb0m7Z0aBT2Mzb1X+yxc8a+3nrtNgZi8pCk=
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
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDM6MTQ6NDVQTSArMDEwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkgaXMgYSB1c2VmdWwgaGVscGVyIGZvciBu
b24tZHVtYiBjbGllbnRzLCBzbwo+IHJlbmFtZSBpdCB0byByZW1vdmUgdGhlIF9kdW1iLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+CgpSZXZp
ZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgICAgICB8IDQgKystLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgfCAzICstLQo+ICBpbmNsdWRlL2RybS9k
cm1fZ2VtLmggICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVm
ZmVycy5jCj4gaW5kZXggODFkZmRkMzM3NTNhLi45NTY2NjU0NjQyOTYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHVtYl9idWZmZXJzLmMKPiBAQCAtNDYsNyArNDYsNyBAQAo+ICAgKiBUbyBzdXBwb3J0
IGR1bWIgb2JqZWN0cyBkcml2ZXJzIG11c3QgaW1wbGVtZW50IHRoZSAmZHJtX2RyaXZlci5kdW1i
X2NyZWF0ZQo+ICAgKiBvcGVyYXRpb24uICZkcm1fZHJpdmVyLmR1bWJfZGVzdHJveSBkZWZhdWx0
cyB0byBkcm1fZ2VtX2R1bWJfZGVzdHJveSgpIGlmCj4gICAqIG5vdCBzZXQgYW5kICZkcm1fZHJp
dmVyLmR1bWJfbWFwX29mZnNldCBkZWZhdWx0cyB0bwo+IC0gKiBkcm1fZ2VtX2R1bWJfbWFwX29m
ZnNldCgpLiBTZWUgdGhlIGNhbGxiYWNrcyBmb3IgZnVydGhlciBkZXRhaWxzLgo+ICsgKiBkcm1f
Z2VtX21hcF9vZmZzZXQoKS4gU2VlIHRoZSBjYWxsYmFja3MgZm9yIGZ1cnRoZXIgZGV0YWlscy4K
PiAgICoKPiAgICogTm90ZSB0aGF0IGR1bWIgb2JqZWN0cyBtYXkgbm90IGJlIHVzZWQgZm9yIGdw
dSBhY2NlbGVyYXRpb24sIGFzIGhhcyBiZWVuCj4gICAqIGF0dGVtcHRlZCBvbiBzb21lIEFSTSBl
bWJlZGRlZCBwbGF0Zm9ybXMuIFN1Y2ggZHJpdmVycyByZWFsbHkgbXVzdCBoYXZlCj4gQEAgLTEy
NSw3ICsxMjUsNyBAQCBpbnQgZHJtX21vZGVfbW1hcF9kdW1iX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCj4gIAkJCQkJCSAgICBhcmdzLT5oYW5kbGUsCj4gIAkJCQkJCSAgICAmYXJncy0+
b2Zmc2V0KTsKPiAgCWVsc2UKPiAtCQlyZXR1cm4gZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoZmls
ZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKPiArCQlyZXR1cm4gZHJtX2dlbV9tYXBfb2Zmc2V0
KGZpbGVfcHJpdiwgZGV2LCBhcmdzLT5oYW5kbGUsCj4gIAkJCQkJICAgICAgICZhcmdzLT5vZmZz
ZXQpOwo+ICB9Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+IGluZGV4IDUwZGUxMzhjODllMC4uOTliYjdmNzlh
NzBiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gQEAgLTI5NCw3ICsyOTQsNyBAQCBkcm1fZ2VtX2hhbmRs
ZV9kZWxldGUoc3RydWN0IGRybV9maWxlICpmaWxwLCB1MzIgaGFuZGxlKQo+ICBFWFBPUlRfU1lN
Qk9MKGRybV9nZW1faGFuZGxlX2RlbGV0ZSk7Cj4gIAo+ICAvKioKPiAtICogZHJtX2dlbV9kdW1i
X21hcF9vZmZzZXQgLSByZXR1cm4gdGhlIGZha2UgbW1hcCBvZmZzZXQgZm9yIGEgZ2VtIG9iamVj
dAo+ICsgKiBkcm1fZ2VtX21hcF9vZmZzZXQgLSByZXR1cm4gdGhlIGZha2UgbW1hcCBvZmZzZXQg
Zm9yIGEgZ2VtIG9iamVjdAo+ICAgKiBAZmlsZTogZHJtIGZpbGUtcHJpdmF0ZSBzdHJ1Y3R1cmUg
Y29udGFpbmluZyB0aGUgZ2VtIG9iamVjdAo+ICAgKiBAZGV2OiBjb3JyZXNwb25kaW5nIGRybV9k
ZXZpY2UKPiAgICogQGhhbmRsZTogZ2VtIG9iamVjdCBoYW5kbGUKPiBAQCAtMzA2LDcgKzMwNiw3
IEBAIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9oYW5kbGVfZGVsZXRlKTsKPiAgICogUmV0dXJuczoK
PiAgICogMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+
ICAgKi8KPiAtaW50IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAqZmls
ZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAraW50IGRybV9nZW1fbWFwX29mZnNldChzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCSAgICB1MzIg
aGFuZGxlLCB1NjQgKm9mZnNldCkKPiAgewo+ICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7
Cj4gQEAgLTMzMiw3ICszMzIsNyBAQCBpbnQgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoc3RydWN0
IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAKPiAgCXJldHVybiBy
ZXQ7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTF9HUEwoZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQpOwo+
ICtFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX21hcF9vZmZzZXQpOwo+ICAKPiAgLyoqCj4gICAq
IGRybV9nZW1fZHVtYl9kZXN0cm95IC0gZHVtYiBmYiBjYWxsYmFjayBoZWxwZXIgZm9yIGdlbSBi
YXNlZCBkcml2ZXJzCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+IGlu
ZGV4IGE1NWY1YWM0MWJmMy4uNWUzYWE5ZTRhMDk2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9nZW0uYwo+IEBAIC0yNzYsOCArMjc2LDcgQEAgaW50IGV4eW5vc19kcm1f
Z2VtX21hcF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICB7Cj4g
IAlzdHJ1Y3QgZHJtX2V4eW5vc19nZW1fbWFwICphcmdzID0gZGF0YTsKPiAgCj4gLQlyZXR1cm4g
ZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKPiAt
CQkJCSAgICAgICAmYXJncy0+b2Zmc2V0KTsKPiArCXJldHVybiBkcm1fZ2VtX21hcF9vZmZzZXQo
ZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwgJmFyZ3MtPm9mZnNldCk7Cj4gIH0KPiAgCj4g
IHN0cnVjdCBleHlub3NfZHJtX2dlbSAqZXh5bm9zX2RybV9nZW1fZ2V0KHN0cnVjdCBkcm1fZmls
ZSAqZmlscCwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVkZS9k
cm0vZHJtX2dlbS5oCj4gaW5kZXggNTA0N2M3ZWUyNWY1Li45MWIwN2MyMzI1ZTkgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5o
Cj4gQEAgLTM5NSw4ICszOTUsOCBAQCBpbnQgZHJtX2dlbV9mZW5jZV9hcnJheV9hZGQoc3RydWN0
IHhhcnJheSAqZmVuY2VfYXJyYXksCj4gIGludCBkcm1fZ2VtX2ZlbmNlX2FycmF5X2FkZF9pbXBs
aWNpdChzdHJ1Y3QgeGFycmF5ICpmZW5jZV9hcnJheSwKPiAgCQkJCSAgICAgc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmosCj4gIAkJCQkgICAgIGJvb2wgd3JpdGUpOwo+IC1pbnQgZHJtX2dlbV9k
dW1iX21hcF9vZmZzZXQoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+IC0JCQkgICAgdTMyIGhhbmRsZSwgdTY0ICpvZmZzZXQpOwo+ICtpbnQgZHJtX2dlbV9t
YXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiArCQkgICAgICAgdTMyIGhhbmRsZSwgdTY0ICpvZmZzZXQpOwo+ICBpbnQgZHJtX2dlbV9kdW1i
X2Rlc3Ryb3koc3RydWN0IGRybV9maWxlICpmaWxlLAo+ICAJCQkgc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKPiAgCQkJIHVpbnQzMl90IGhhbmRsZSk7Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
