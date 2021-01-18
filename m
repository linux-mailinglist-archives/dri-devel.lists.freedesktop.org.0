Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9AC2F9AC7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 08:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBAF6E0F4;
	Mon, 18 Jan 2021 07:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D584F6E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 07:46:25 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d189so16817856oig.11
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 23:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l+LSWdfCYn1btsVCSU91NdRUd3kcTfJ/C+5NiKfK6SI=;
 b=W0cnYh/jL15j51JJaDQSLKs4Fw3EBt1PqoGtgqfgQc4uMMbvLVH5MOGTqhXJvtMqe0
 y7UcWh3NJCHn3lEaLBn78RWuaiCU2kEegm49FfX2h0wMjfl9S6/gW5MnkKpjZgF+z9Pa
 uMYWfZClKmvC6eBfO8HLDJOnGgjw4YwZFgvPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l+LSWdfCYn1btsVCSU91NdRUd3kcTfJ/C+5NiKfK6SI=;
 b=K/LWcGUQKKK/+GUWpT3Uzl/mk7jmmTOcDax+CECECtO5zmHXQQLuYOAQnIQGlFvFnY
 jHgVcTvR6F2tcML39GcTpogWdx7hMO8eMSjb/uXZFxbSIzWW06aUFgTeF3sPK5HP3ePU
 jCEQkeU6gxByGqq/vsg0ynu+E3skfIJDE0H7x6dWCx5IwyKmS4CuiP1f6nU5fcxpx9Jt
 kh3NsfOV3P5rU8wIgKJ0ZcayYsZyI5M5MqGfOgsCfwU8ZAvKbz5UtTnHzJiq+LJcitgs
 bChH/GUKIlOJCMDF32XgRz90pSrhTJ/zrIpOfrxoBowdlaQM9S+xAj4tEvK9vpELFVXI
 KUGg==
X-Gm-Message-State: AOAM533hagE5/lo+SHdb3epz341qKDb5nv520tSSA3MGRoYvDl37lJqN
 VFWVX++N8NvtHq8JWek7sgMyQQZLQuVBcUbCkDwcKw==
X-Google-Smtp-Source: ABdhPJwNF8zbOxc9vhWr1zvlpelmYS7pUhb2t2qRoI5vRhVEntkQXVrg8oZGjA2VthlKaMTEowMZinUyAzwxHEoLrt4=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr1117924oie.128.1610955985196; 
 Sun, 17 Jan 2021 23:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20210118012246.1858892-1-zhangzhijie@loongson.cn>
 <fd296f78-86df-e933-78ff-4b66e978e730@suse.de>
In-Reply-To: <fd296f78-86df-e933-78ff-4b66e978e730@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 18 Jan 2021 08:46:14 +0100
Message-ID: <CAKMK7uHsRS3e2CSnHMw=LKyxVBuL88i7a677F_zPwOLyJ76Org@mail.gmail.com>
Subject: Re: [PATCH v3] drm: Improve the output_poll_changed description
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgNzo1MyBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMTguMDEuMjEgdW0gMDI6MjIgc2No
cmllYiBaaGlKaWUuWmhhbmc6Cj4gPiBGcm9tOiB6aGFuZ3poaWppZSA8emhhbmd6aGlqaWVAbG9v
bmdzb24uY24+Cj4gPgo+ID4gdGhpcyBjYWxsYmFjayB3YXMgdXNlZCBieSBkcm1fa21zX2hlbHBl
cl9ob3RwbHVnX2V2ZW50KCkKPiA+Cj4gPiBWMjogKFRoYW5rcyBmb3IgRGFuaWVsJ3Mgc3VnZ2Vz
dGlvbnMpCj4gPiAtIHJlbW92ZSB0aGUgRklYTUUgYmVsb3cuc2luY2Ugd2l0aCB0aGUgZHJtX2Ns
aWVudAo+ID4gLSBpbmZyYXN0cnVjdHVyZSBhbmQgdGhlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9u
IHdlJ3ZlCj4gPiAtIHJlc29sdmVkIHRoaXMgYWxsIHZlcnkgbmVhdGx5IG5vdy4KPiA+Cj4gPiBW
MzogQWRkIGNvbW1lbnRzIHRoYXQgVGhpcyBob29rIGlzIGRlcHJlY2F0ZWQKPiA+IC0gbmV3IGlt
cGxlbWVudGF0aW9uIG1ldGhvZHMgaW5zdGVhZCBvZiB0aGlzIGhvb2sKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiB6aGFuZ3poaWppZSA8emhhbmd6aGlqaWVAbG9vbmdzb24uY24+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBaaGlKaWUuWmhhbmcgPHpoYW5nemhpamllQGxvb25nc29uLmNuPgo+ID4gLS0tCj4g
PiAgIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIHwgMTIgKysrKysrLS0tLS0tCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGIvaW5jbHVkZS9kcm0v
ZHJtX21vZGVfY29uZmlnLmgKPiA+IGluZGV4IGFiNDI0ZGRkNzY2NS4uYTA4NDQ4MmQ1NzlhIDEw
MDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPiA+ICsrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oCj4gPiBAQCAtMTAzLDE0ICsxMDMsMTQgQEAgc3Ry
dWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB7Cj4gPiAgICAgICAgKiBDYWxsYmFjayB1c2VkIGJ5
IGhlbHBlcnMgdG8gaW5mb3JtIHRoZSBkcml2ZXIgb2Ygb3V0cHV0IGNvbmZpZ3VyYXRpb24KPiA+
ICAgICAgICAqIGNoYW5nZXMuCj4gPiAgICAgICAgKgo+ID4gLSAgICAgICogRHJpdmVycyBpbXBs
ZW1lbnRpbmcgZmJkZXYgZW11bGF0aW9uIHdpdGggdGhlIGhlbHBlcnMgY2FuIGNhbGwKPiA+IC0g
ICAgICAqIGRybV9mYl9oZWxwZXJfaG90cGx1Z19jaGFuZ2VkIGZyb20gdGhpcyBob29rIHRvIGlu
Zm9ybSB0aGUgZmJkZXYKPiA+ICsgICAgICAqIERyaXZlcnMgaW1wbGVtZW50aW5nIGZiZGV2IGVt
dWxhdGlvbiB3aXRoIHRoZSBoZWxwZXJzLiBEcml2ZXJzIHVzZQo+ID4gKyAgICAgICogZHJtX2tt
c19oZWxwZXJfaG90cGx1Z19ldmVudCgpIHRvIGNhbGwgdGhpcyBob29rIHRvIGluZm9ybSB0aGUg
ZmJkZXYKPgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLiBNYXliZSBpdCdzICJEcml2ZXJzIGlt
cGxlbWVudGluZyBmYmRldgo+IGVtdWxhdGlvbiB1c2UgZHJtX2ttc19oZWxwZXJfaG90cGx1Z19l
dmVudCgpIHRvIGNhbGwgLi4uIiA/CgpZZWFoIHRoaXMganVzdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ug
bm93LCB0aGlzIGlzIG5vdCB0aGUgaW50ZXJlc3RpbmcKaW5mb3JtYXRpb24uIFJlbW92aW5nIHRo
ZSBoaW50IHRoYXQgdGhpcyBzaG91bGQgYmUgaW1wbGVtZW50ZWQgdXNpbmcKZHJtX2ZiX2hlbHBl
cl9ob3RwbHVnX2NoYW5nZWQgaXMgcmVhbGx5IG5vdCBnb29kLgotRGFuaWVsCgo+Cj4gQmVzdCBy
ZWdhcmRzCj4gVGhvbWFzCj4KPiA+ICAgICAgICAqIGhlbHBlciBvZiBvdXRwdXQgY2hhbmdlcy4K
PiA+ICAgICAgICAqCj4gPiAtICAgICAgKiBGSVhNRToKPiA+IC0gICAgICAqCj4gPiAtICAgICAg
KiBFeGNlcHQgdGhhdCB0aGVyZSdzIG5vIHZ0YWJsZSBmb3IgZGV2aWNlLWxldmVsIGhlbHBlciBj
YWxsYmFja3MKPiA+IC0gICAgICAqIHRoZXJlJ3Mgbm8gcmVhc29uIHRoaXMgaXMgYSBjb3JlIGZ1
bmN0aW9uLgo+ID4gKyAgICAgICogVGhpcyBob29rIGlzIGRlcHJlY2F0ZWQsIGRyaXZlcnMgc2hv
dWxkIGluc3RlYWQgdXNlCj4gPiArICAgICAgKiBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpIHdo
aWNoIHRha2VzIGNhcmUgb2YgYW55IG5lY2Vzc2FyeQo+ID4gKyAgICAgICogaG90cGx1ZyBldmVu
dCBmb3J3YXJkaW5nIGFscmVhZHkgd2l0aG91dCBmdXJ0aGVyIGludm9sdmVtZW50IGJ5Cj4gPiAr
ICAgICAgKiB0aGUgZHJpdmVyLgo+ID4gICAgICAgICovCj4gPiAgICAgICB2b2lkICgqb3V0cHV0
X3BvbGxfY2hhbmdlZCkoc3RydWN0IGRybV9kZXZpY2UgKmRldik7Cj4gPgo+ID4KPgo+IC0tCj4g
VGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xo
cmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
