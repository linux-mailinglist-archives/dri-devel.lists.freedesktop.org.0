Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F32AE280
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8958893E8;
	Tue, 10 Nov 2020 22:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11989CBE;
 Tue, 10 Nov 2020 22:06:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c17so14379086wrc.11;
 Tue, 10 Nov 2020 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fOBPjcNpz91mCMYtlgOYiEJnJpHJJ7wowgArIUAKBpQ=;
 b=pyUOxBordCoypUr4bkRWCoKGbKwBgSPl6xu5gaWatHcfXzWftuuua4v/W9oleoPJhQ
 4MXaC16vrhJBLJ7T4IZzFCJ1IGPjPuMRNqs6xDLgteZX5CG1j+f1DEirGD0pXlMcsabd
 vwq5iIii4TIM3rvxsptUlZAz5zNCBh5d86aUfJZqwKnwZlQoA9kglclN/XM0xKL+aqyi
 Qbn4vqwjpSoD2Hp6dGoz4J0V5GQzuBlfon0gxyGUXV92KmuwrGgSM16n3dXCKS8AtVZP
 Qw3uk8KGo2CW9YQvNwQDppHcr5MKdvJx06ReeSEF8hIQHar8+aRjAvE79UqoqV00jAZ9
 EpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fOBPjcNpz91mCMYtlgOYiEJnJpHJJ7wowgArIUAKBpQ=;
 b=C5QLvvZF3YG818NiIAmMLwd6ACbkvwJFwoutYDlN341sJw643flMuukG33PBeLU16V
 tSrEloy+WKqkZdT3Bz2Kebx/REJgGernjpguiYPOmslHv53VDfnONHfFZJKcWDGtEQzq
 6lURiBjOh2a9aLzxLlTXok3OCOQVozLVcZJvXqBHjKN7kfu4De7BApoEo2xtS0S/StdX
 vvSp+LTXko6yTFymBfTNHVHwfnUIPENO032bWh9C35WoY1pPeAXcDn7dm854wuHv1CD/
 amsWvdE1jgJ7YL60mVztsyafViEP/vsOxgGKomiChQore2YDuWWw+tElFXpip848AmpK
 9N/g==
X-Gm-Message-State: AOAM530Oi1lTwa19D8FB4R/KMMT39BWse/YAX86gH4XprTyp6NJxXNwd
 fERM/CxPKxmljzgQUANKdA+KoFXuUThblntW3J8=
X-Google-Smtp-Source: ABdhPJwp3lXAPU50agZOEqw4doQ3R4tIdinA9SliisR1tkW2IKPNfSZxOF5yGat2GbhQxN0UAuZdd3elAtRyCEiVtJY=
X-Received: by 2002:adf:f246:: with SMTP id b6mr25860054wrp.111.1605046017139; 
 Tue, 10 Nov 2020 14:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-4-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-4-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:06:46 -0500
Message-ID: <CADnq5_PC1=sxZP2wT-jfeBwObHCRBHOdW4ceEt-2=8PaA3aYzQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] drm/radeon/radeon_fence: Demote some non-conformant
 kernel-doc headers and fix another
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVuY2UuYzoxNjg6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3dhaXQnIG5vdCBkZXNjcmli
ZWQgaW4gJ3JhZGVvbl9mZW5jZV9jaGVja19zaWduYWxlZCcKPiAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZmVuY2UuYzoxNjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ21vZGUnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9mZW5jZV9jaGVja19zaWduYWxl
ZCcKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVuY2UuYzoxNjg6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICdy
YWRlb25fZmVuY2VfY2hlY2tfc2lnbmFsZWQnCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2ZlbmNlLmM6MTY4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdr
ZXknIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9mZW5jZV9jaGVja19zaWduYWxlZCcKPiAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVuY2UuYzozOTM6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2YnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9mZW5jZV9l
bmFibGVfc2lnbmFsaW5nJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mZW5jZS5j
OjM5Mzogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0
aW9uIGluICdyYWRlb25fZmVuY2VfZW5hYmxlX3NpZ25hbGluZycKPiAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZmVuY2UuYzoxMDEwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdtJyBub3QgZGVzY3JpYmVkIGluICdyYWRlb25fZGVidWdmc19ncHVfcmVzZXQn
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmM6MTAxMDogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGF0YScgbm90IGRlc2NyaWJlZCBpbiAncmFk
ZW9uX2RlYnVnZnNfZ3B1X3Jlc2V0Jwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNl
bXdhbEBsaW5hcm8ub3JnPgo+IENjOiBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJlZWRlc2t0b3Au
b3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcy4KCkFsZXgKCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmMgfCA2ICsrKy0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mZW5jZS5jCj4gaW5kZXggODczNWJmMmJiOGI1Yy4uOWVl
NmU1OTllZjgzYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9m
ZW5jZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVuY2UuYwo+IEBA
IC0xNTcsNyArMTU3LDcgQEAgaW50IHJhZGVvbl9mZW5jZV9lbWl0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2LAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC0vKioKPiArLyoKPiAgICog
cmFkZW9uX2ZlbmNlX2NoZWNrX3NpZ25hbGVkIC0gY2FsbGJhY2sgZnJvbSBmZW5jZV9xdWV1ZQo+
ICAgKgo+ICAgKiB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aXRoIGZlbmNlX3F1ZXVlIGxvY2sg
aGVsZCwgd2hpY2ggaXMgYWxzbyB1c2VkCj4gQEAgLTM4Myw3ICszODMsNyBAQCBzdGF0aWMgYm9v
bCByYWRlb25fZmVuY2VfaXNfc2lnbmFsZWQoc3RydWN0IGRtYV9mZW5jZSAqZikKPgo+ICAvKioK
PiAgICogcmFkZW9uX2ZlbmNlX2VuYWJsZV9zaWduYWxpbmcgLSBlbmFibGUgc2lnbmFsbGluZyBv
biBmZW5jZQo+IC0gKiBAZmVuY2U6IGZlbmNlCj4gKyAqIEBmOiBmZW5jZQo+ICAgKgo+ICAgKiBU
aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aXRoIGZlbmNlX3F1ZXVlIGxvY2sgaGVsZCwgYW5kIGFk
ZHMgYSBjYWxsYmFjawo+ICAgKiB0byBmZW5jZV9xdWV1ZSB0aGF0IGNoZWNrcyBpZiB0aGlzIGZl
bmNlIGlzIHNpZ25hbGVkLCBhbmQgaWYgc28gaXQKPiBAQCAtMTAwMSw3ICsxMDAxLDcgQEAgc3Rh
dGljIGludCByYWRlb25fZGVidWdmc19mZW5jZV9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9p
ZCAqZGF0YSkKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLyoqCj4gKy8qCj4gICAqIHJh
ZGVvbl9kZWJ1Z2ZzX2dwdV9yZXNldCAtIG1hbnVhbGx5IHRyaWdnZXIgYSBncHUgcmVzZXQKPiAg
ICoKPiAgICogTWFudWFsbHkgdHJpZ2dlciBhIGdwdSByZXNldCBhdCB0aGUgbmV4dCBmZW5jZSB3
YWl0Lgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
