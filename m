Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E42AE2A0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB5E89CF2;
	Tue, 10 Nov 2020 22:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A7D89CE2;
 Tue, 10 Nov 2020 22:10:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d12so12889084wrr.13;
 Tue, 10 Nov 2020 14:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ukynJdVgZ5J1U+TIrNmOqXFA+lgvobo4dd1cCqdQQ+Q=;
 b=QvRqVwKUlzD/PN5Ki8U4o+iG6OiM14ucHgjS8nvbfRrAzyojd6sQVnmypsUZ2W9pvD
 0NuZy8JxUJk+i/ixHNdBhvRHTbTM4I1GY7zxIxcSvTL+Hpu+tZSFY1zU9Zn4M16NYBsv
 fn73zeH9JGqUiMQwJVFqr5i2Lyc56W/Zoihv1VwyGkEwjEYPQmbBVEMczynGi8/7vDyc
 bIm3VJdmVZ53UFMd+JmkcML2zpeRc2hDZxlBWyEC0+owuC7dAxD07EuTkwMwdSrFdFDI
 dJ+2MSZ8AZ+8al7SFwqzN6Cgd5eTNO8d+bR0x0+0yu3a6kd9bugXm+acTzjsZkrMskGO
 jykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ukynJdVgZ5J1U+TIrNmOqXFA+lgvobo4dd1cCqdQQ+Q=;
 b=lhe51bL+wyg1EOCylylLQCFyF/AVvG83BrbQg0Mh5Q9MKvZTL+w2SqFw0akcZCqk1Z
 hVEi649OxAKXgtUBLSHmnSvjOgu+nPiw2S7EwjZhDVOeAhNkFy+R0lSskNF46tSaSYN5
 Jvsg8TpwiFQsa3coaog46dtxFJXRHbmG6AlnWsKA0Qy5Lp2Gn9e+RJeY5VdjYexDbB7f
 k5brL08vM3T6qbbzR2+xmZf+cCXUo1Q4APm8gxNRtzWz5DCpM349DbkJWpaDQWF2UnFq
 Qnu4RXvg0DPEe44YJBjZs9lxtZwzZozSvRWgFrT3bMypGdGO8qv9A8/qmc08lkt0UTpv
 ISpg==
X-Gm-Message-State: AOAM531IaRRz5Rxl/4XbFfFWIiiSWAF/wV5tFnm+0m0fYs1oz4kduwRB
 CVpeUxPTTdfI4npZmtB8uf0FR20Uo4Pn0rwAJJdl8HHp
X-Google-Smtp-Source: ABdhPJxBwPA7qVfB77oYJYHLquoUC/Tat5KRk52NjV+OfYgKGD916hz3E+sw5nyp1u12rnNY2h2w8t7Y/h/3Q05QVtI=
X-Received: by 2002:adf:e551:: with SMTP id z17mr26987302wrm.374.1605046250594; 
 Tue, 10 Nov 2020 14:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-9-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-9-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:10:39 -0500
Message-ID: <CADnq5_Nz78bu3yovnPGUw+fOXRNb1hoZUQAFcoqkdUpCxENWpg@mail.gmail.com>
Subject: Re: [PATCH 08/20] drm/radeon/radeon_i2c: Remove pointless function
 header
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

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmM6NDY6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JhZGVvbl9jb25uZWN0b3InIG5v
dCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9kZGNfcHJvYmUnCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2kyYy5jOjQ2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICd1c2VfYXV4JyBub3QgZGVzY3JpYmVkIGluICdyYWRlb25fZGRjX3Byb2JlJwo+Cj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9pMmMuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pMmMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2kyYy5jCj4gaW5kZXggNTQ1ZTMxZTZj
YzNhOS4uYWE2MWIzY2I0MDQ5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9pMmMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2kyYy5j
Cj4gQEAgLTM4LDEwICszOCw2IEBAIGV4dGVybiBpbnQgcmFkZW9uX2F0b21faHdfaTJjX3hmZXIo
c3RydWN0IGkyY19hZGFwdGVyICppMmNfYWRhcCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBpMmNfbXNnICptc2dzLCBpbnQgbnVtKTsKPiAgZXh0ZXJuIHUzMiBy
YWRlb25fYXRvbV9od19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOwo+Cj4gLS8q
Kgo+IC0gKiByYWRlb25fZGRjX3Byb2JlCj4gLSAqCj4gLSAqLwo+ICBib29sIHJhZGVvbl9kZGNf
cHJvYmUoc3RydWN0IHJhZGVvbl9jb25uZWN0b3IgKnJhZGVvbl9jb25uZWN0b3IsIGJvb2wgdXNl
X2F1eCkKPiAgewo+ICAgICAgICAgdTggb3V0ID0gMHgwOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
