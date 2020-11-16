Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8432B5295
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4006EA7F;
	Mon, 16 Nov 2020 20:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B476EA7C;
 Mon, 16 Nov 2020 20:31:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so3068750wrg.7;
 Mon, 16 Nov 2020 12:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xnbe336qAl1HOJVIYfBWlWuziNJAww4qOMA3InuqGFk=;
 b=V/JIjm11uut0dFL4p808EYs0bYzl3vVF01X1OKJqXTw8R+MooZH5wcEmUSoEoQxv/g
 V+PZ8mDTZKZ0MJoifd+8TReeHC7XIhz7qiAdNYJMYTFs1yeOQYSS+RK5cS7BgcZ6lmw7
 K18u0l6OWXslGSTbwkWL68etAhFhFdDHil9zqdlkZ5UwV0TC9r5GlK+KqFlWR+VnsDMa
 +EbasTX7ubHNqCSrA38luMRwDk8FwNAAZZ4gQdcPzsyuKkFrEQW/jYuAFN1s5v8ZbGtF
 1o6D9TFSocAsEd8Zue53CtxmlrC/qPQsLlGNd1uOfjsaEqSqkGNbSAg31M2Jdp7FEYzT
 Kn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xnbe336qAl1HOJVIYfBWlWuziNJAww4qOMA3InuqGFk=;
 b=R6pktLYEkJaHGRmck5VWkxG8vNT0vj5ycnzp2H162+ytDzqH0OnHBZ851i5QdIet/4
 GivQTCOEKF2zB0C0ptbhKGWQaysKhh2tC0cQVvLRYYDJ1Yd/CmZc2OSIHEyn391tWvU1
 T3RhEqssIVPxlL3wdkfwH268pl9PFxkttD6GqvjH6IV9wPfo8jENXJ7nQ0yyM/SkMSyf
 sZBv9Ozy30RbRTQScsKqnNMVqpySBJwRtp9m9Ouij2RGCl45DPe5dmsHCZaJrEC/1PRf
 0mzdvIW9MwoEg3LfwuQN2yA15UeZFrDW7aoAHS0FY7EIZK3NgquVJ/kOYB9Oiy9xNscs
 Ei3Q==
X-Gm-Message-State: AOAM532SuWZhpQf3Gt66VulRyqBBhMlKJzuYWjaKSUr19EeR19+0yc0I
 vL9o2pBdVcEt6rHKrxPUe44IVTubm9/6GzB7c8E=
X-Google-Smtp-Source: ABdhPJzYXz/iBnS6QhUwm9yBllNVV8cFfoQCFMJim5YSyBNlT2ZaDbvsXWY5xqwHC83ZyWmnd8xgWV0HmfBSqt8DKig=
X-Received: by 2002:adf:9144:: with SMTP id j62mr4588978wrj.419.1605558708505; 
 Mon, 16 Nov 2020 12:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-36-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-36-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:31:37 -0500
Message-ID: <CADnq5_N06T3FT0jufTJR87X0LT8Xoc9mquD1KaiEk2Zf4EpgEQ@mail.gmail.com>
Subject: Re: [PATCH 35/43] drm/radeon/cik_sdma: Move
 'amdgpu_cik_gpu_check_soft_reset()'s prototype to shared header
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOjQ4NDU6NTogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtfZ3B1X2NoZWNrX3NvZnRfcmVz
ZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICA0ODQ1IHwgdTMyIGNpa19ncHVfY2hlY2tf
c29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKPiAgfCBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaCAgICAgIHwgMSArCj4gIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYyB8IDMgKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vY2lrLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCj4gaW5kZXgg
Mjk3YjNjMWZmODA0Zi4uNjYzMGI5ZGE5ZTdhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2Npay5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaAo+IEBA
IC0yOSw1ICsyOSw2IEBAIHZvaWQgY2lrX2VudGVyX3JsY19zYWZlX21vZGUoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYpOwo+ICB2b2lkIGNpa19leGl0X3JsY19zYWZlX21vZGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICBpbnQgY2lfbWNfbG9hZF9taWNyb2NvZGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICB2b2lkIGNpa191cGRhdGVfY2coc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJkZXYsIHUzMiBibG9jaywgYm9vbCBlbmFibGUpOwo+ICt1MzIgY2lrX2dwdV9jaGVj
a19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPgo+ICAjZW5kaWYgICAg
ICAgICAgICAgICAgICAgICAgICAgLyogX19DSUtfSF9fICovCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lr
X3NkbWEuYwo+IGluZGV4IDNjNzA5ZWJlOGQxYWIuLjkxOWIxNDg0NWMzYzcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9jaWtfc2RtYS5jCj4gQEAgLTI3LDE0ICsyNywxMyBAQAo+ICAjaW5jbHVkZSAi
cmFkZW9uX3Vjb2RlLmgiCj4gICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgo+ICAjaW5jbHVkZSAi
cmFkZW9uX3RyYWNlLmgiCj4gKyNpbmNsdWRlICJjaWsuaCIKPiAgI2luY2x1ZGUgImNpa2QuaCIK
Pgo+ICAvKiBzZG1hICovCj4gICNkZWZpbmUgQ0lLX1NETUFfVUNPREVfU0laRSAxMDUwCj4gICNk
ZWZpbmUgQ0lLX1NETUFfVUNPREVfVkVSU0lPTiA2NAo+Cj4gLXUzMiBjaWtfZ3B1X2NoZWNrX3Nv
ZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+IC0KPiAgLyoKPiAgICogc0RN
QSAtIFN5c3RlbSBETUEKPiAgICogU3RhcnRpbmcgd2l0aCBDSUssIHRoZSBHUFUgaGFzIG5ldyBh
c3luY2hyb25vdXMKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
