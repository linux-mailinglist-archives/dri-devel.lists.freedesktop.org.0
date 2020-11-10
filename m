Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B4D2AE276
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5CD89CBE;
	Tue, 10 Nov 2020 22:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761BD89CBE;
 Tue, 10 Nov 2020 22:05:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h2so4733042wmm.0;
 Tue, 10 Nov 2020 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qZToJzWvZIM70EuRiQ7NoVEKN6DZ5AQGlu/l0sYJbdo=;
 b=XjyOicW3O9YNxvhwetYYen8NIUXx6DtxhfHeM3eeS7dRqHQTVCI2YXrvlAXna8ubw4
 91hNbvU5rvEipK0xYxRb+aAFeCVhGN3sXSmKvT9uMnvyRjKZK0MVQZsLsUW0y1NuThB+
 qpIQUWf4Q0V6cxCuoEiAk5gvoYEqve6tboDkF4bzKsMEEGMaDqknFVAuHon1tPSxft88
 V067xL1LNtenmB1IGjhefnjnAd+OSJwQqSxSxYntaqlXt+tfZN5Xbu9/CPyqNV+M53Nd
 jgI1xhFvjcpsQuqb3xpH/SxHFKAFKgfzkzozf2vYODBsdHbjTBxXZ59zgeTdlvW9/9y6
 K9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qZToJzWvZIM70EuRiQ7NoVEKN6DZ5AQGlu/l0sYJbdo=;
 b=bASratxfo+poyQnCjc7JAZFNye4YDLYwUtEDblfaQlMhIIl3iuWpqQajk219qJE+Gj
 cdbBnsU+A4ruRScrBRYhR6EZry8kPqBKoWemrjXwDnATTzQ8HSSX/HculjxFSsbah3HD
 8pJ/c81l4jcPko8SznBmy9dPZ3N3sDjcdFwevM3QBDTaZtGLVq0mg6ijtyCbxDGI8pHB
 ftIok2JqVPXU6bS8VwZJwdTxPTVHzlIDqYX1X2jIvVFbdckzUzs3DNZffR0e74Jbpo20
 K9jVYZzHCerCw9pK7N8DeY3Lkwkjl+mvtcw5Yp2oSd19ws4CPwTMYLnxDZlvQDyrVXoK
 dVEA==
X-Gm-Message-State: AOAM530gE+h1RTjrD/Z6d/8JlVCQWSNMx99rxTjqsZCYIfNstnVK6gf0
 gBoR0iAijcdvkpCmqpJY4xXT4PqvEDh3b5iNoBs=
X-Google-Smtp-Source: ABdhPJwWqoDTPUmRVpXmlstCWEAP5RO5KfmAgKzuWQagXCBAiZ6FokJKfpjc7Kx5J2AQT9MwV7S2Guk+ZWnb/gt8JoM=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr246689wmi.70.1605045920104;
 Tue, 10 Nov 2020 14:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-2-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:05:07 -0500
Message-ID: <CADnq5_O2w0D3WcZjWUajYJyGfDXrt90z2PYrxuUcxGwsuwEVqw@mail.gmail.com>
Subject: Re: [PATCH 01/20] drm/radeon/radeon_ttm: Place declaration of 'rdev'
 in same clause as its use
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmM6IEluIGZ1
bmN0aW9uIOKAmHJhZGVvbl90dG1fdHRfY3JlYXRl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl90dG0uYzo2MTE6MjQ6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJkZXbigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogSmVy
b21lIEdsaXNzZSA8Z2xpc3NlQGZyZWVkZXNrdG9wLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAg
VGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBpbmRleCA5NTAz
OGFjMzM4MmUyLi5hOGM5MTU5MjAwNzBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dHRtLmMKPiBAQCAtNjA4LDIxICs2MDgsMjEgQEAgc3RhdGljIHZvaWQgcmFkZW9uX3R0bV9iYWNr
ZW5kX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQKPiAg
c3RhdGljIHN0cnVjdCB0dG1fdHQgKnJhZGVvbl90dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IHBhZ2VfZmxhZ3MpCj4gIHsKPiAtICAgICAgIHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2Owo+ICAgICAgICAgc3RydWN0IHJhZGVvbl90dG1fdHQgKmd0dDsKPiAgICAgICAg
IGVudW0gdHRtX2NhY2hpbmcgY2FjaGluZzsKPiAgICAgICAgIHN0cnVjdCByYWRlb25fYm8gKnJi
bzsKPiAtCj4gLSAgICAgICByYm8gPSBjb250YWluZXJfb2YoYm8sIHN0cnVjdCByYWRlb25fYm8s
IHRibyk7Cj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCj4gKyAgICAgICBzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldjsKPgo+ICAgICAgICAgcmRldiA9IHJhZGVvbl9nZXRfcmRldihiby0+
YmRldik7Cj4gLSNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCj4gICAgICAgICBpZiAocmRldi0+
ZmxhZ3MgJiBSQURFT05fSVNfQUdQKSB7Cj4gICAgICAgICAgICAgICAgIHJldHVybiB0dG1fYWdw
X3R0X2NyZWF0ZShibywgcmRldi0+ZGRldi0+YWdwLT5icmlkZ2UsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX2ZsYWdzKTsKPiAgICAgICAgIH0KPiAgI2Vu
ZGlmCj4KPiArICAgICAgIHJibyA9IGNvbnRhaW5lcl9vZihibywgc3RydWN0IHJhZGVvbl9ibywg
dGJvKTsKPiArCj4gICAgICAgICBndHQgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgcmFkZW9uX3R0
bV90dCksIEdGUF9LRVJORUwpOwo+ICAgICAgICAgaWYgKGd0dCA9PSBOVUxMKSB7Cj4gICAgICAg
ICAgICAgICAgIHJldHVybiBOVUxMOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
