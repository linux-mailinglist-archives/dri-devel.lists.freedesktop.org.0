Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D014AC0B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 23:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6A46EC01;
	Mon, 27 Jan 2020 22:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B98C6EC01;
 Mon, 27 Jan 2020 22:30:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q6so13605150wro.9;
 Mon, 27 Jan 2020 14:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LVS6f/wPOE4znrIbfpLB0muoLbzhHsX2U0v1a+9SRVU=;
 b=R3IAjcauW6k83zoO8Ar1Vo+uTjlQXeY7NBoCclutDvvZT68LSwoJn4Jhin72Y+cx8S
 QgpXANwZvkce3GVu1LdXZnVlQjnhZ5bkUfREoIa89txHn1FDo+ddFslGFKlCWYg6e0+F
 XzBY/Jgz2L48vJ6wW+NFwJIMlDaafnLl1i9Kh1Ijmv4aSBZiFA/RwuGr1sai/5HtptLj
 XcEa5W/XFBeBOLK3ooCX6kovpw9Np5T0ZgwsWma5n+8IueREaCuNq+GfvTISTiz+x80W
 HlN2V1byOm2BRuAjtv1DEvPv48WafvwHGggBGJkig3jfx6nX59+RVEUiT791Rc5GarrW
 PXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LVS6f/wPOE4znrIbfpLB0muoLbzhHsX2U0v1a+9SRVU=;
 b=SouvV/vLRomTdmMxkWUp41OjVv2hXkTO2x9VFY0+zf4EDj03j9SXSA7q/MisrJnjQe
 Vnu0VWClZMfaPuZ3/zIDWqt3ZKZhvtrmEsmWW754l4sz9XV+BCesCTW9WrTiZSsh54Ut
 8m4KyRtRTkv3J/RyVFvQgxd5U6QCiD/w2dH73871GjBgXYv5CNqhDSfveOCxN/tq8GNu
 /gHWms7EYSWjR14idKcmBmSb+EGXL8CvH8/3EzmVc4CDtFW2jMhLXWc/5c/O0Zds1Ife
 blrNy+jJkVsIuXKIBW2HRewjlrlreHRyt3ZG/DvZI24cvveuVz1TB/eiOf2LzQExnsE+
 oYbw==
X-Gm-Message-State: APjAAAX8pOnAmifi20JDGusp7uo5asQBa1dmZyqErmJQa1+rI0+/OBtd
 PtKGREuk+4JG0dGcVSUZcrll1CKSgM5Np5Ns3pI=
X-Google-Smtp-Source: APXvYqyclJBEjw6dMyGp1+zh6uJUVYXyz0yozEHlmNx/bflc71jNGkCFWHu9waP1IhbYtZeBceDosI6N1Pl7jOVGwY4=
X-Received: by 2002:a5d:5491:: with SMTP id h17mr24823785wrv.374.1580164253929; 
 Mon, 27 Jan 2020 14:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20200124200231.10517-5-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jan 2020 17:30:42 -0500
Message-ID: <CADnq5_MM5VHhZan=Q-NUjgvmyovg_33DjvNcZ3kO0=rxCkizQg@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/edid: Document why we don't bounds check the
 DispID CEA block start/end
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andres Rodriguez <andresx7@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgMzowMyBQTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gQWZ0ZXIgbXVjaCBoZWFkIHNjcmF0Y2hp
bmcgSSBtYW5hZ2VkIHRvIGNvbnZpbmNlIG15c2VsZiB0aGF0Cj4gZm9yX2VhY2hfZGlzcGxheWlk
X2RiKCkgaGFzIGFscmVhZHkgZG9uZSB0aGUgYm91bmRzIGNoZWNrcyBmb3IKPiB0aGUgRGlzcElE
IENFQSBkYXRhIGJsb2NrLiBXaGljaCBpcyB3aHkgd2UgZG9uJ3QgbmVlZCB0byByZXBlYXQKPiB0
aGVtIGluIGNlYV9kYl9vZmZzZXRzKCkuIFRvIGF2b2lkIGhhdmluZyB0byBnbyB0aHJvdWdoIHRo
YXQKPiBwYWluIGFnYWluIGluIHRoZSBmdXR1cmUgYWRkIGEgY29tbWVudCB3aGljaCBleHBsYWlu
cyB0aGlzIGZhY3QuCj4KPiBDYzogQW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdAZ21haWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgNCArKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXgg
M2RmNTc0NDAyNmIwLi4wMzY5YTU0ZTNkMzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC00MDAx
LDYgKzQwMDEsMTAgQEAgY2VhX2RiX29mZnNldHMoY29uc3QgdTggKmNlYSwgaW50ICpzdGFydCwg
aW50ICplbmQpCj4gICAgICAgICAgKiAgIG5vIG5vbi1EVEQgZGF0YS4KPiAgICAgICAgICAqLwo+
ICAgICAgICAgaWYgKGNlYVswXSA9PSBEQVRBX0JMT0NLX0NUQSkgewo+ICsgICAgICAgICAgICAg
ICAvKgo+ICsgICAgICAgICAgICAgICAgKiBmb3JfZWFjaF9kaXNwbGF5aWRfZGIoKSBoYXMgYWxy
ZWFkeSB2ZXJpZmllZAo+ICsgICAgICAgICAgICAgICAgKiB0aGF0IHRoZXNlIHN0YXkgd2l0aGlu
IGV4cGVjdGVkIGJvdW5kcy4KPiArICAgICAgICAgICAgICAgICovCgpJIHRoaW5rIHRoZSBwcmVm
ZXJyZWQgZm9ybWF0IGlzIHRvIGhhdmUgdGhlIHN0YXJ0IG9mIHRoZSBjb21tZW50IGJlIG9uCnRo
ZSBmaXJzdCBsaW5lIGFmdGVyIHRoZSAvKiB3aXRoIHRoYXQgZml4ZWQ6CkFja2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+ICAgICAgICAgICAgICAgICAq
c3RhcnQgPSAzOwo+ICAgICAgICAgICAgICAgICAqZW5kID0gKnN0YXJ0ICsgY2VhWzJdOwo+ICAg
ICAgICAgfSBlbHNlIGlmIChjZWFbMF0gPT0gQ0VBX0VYVCkgewo+IC0tCj4gMi4yNC4xCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
