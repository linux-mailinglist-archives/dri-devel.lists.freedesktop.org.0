Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20014AC00
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 23:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A506EBFF;
	Mon, 27 Jan 2020 22:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBCE6EBFE;
 Mon, 27 Jan 2020 22:28:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q6so13598037wro.9;
 Mon, 27 Jan 2020 14:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WyhwU63WY8tkSatCCkimQskxqHLn01ZP7kL8X30RByo=;
 b=KQBNzBOYdhyDiuYRZMA/Z9mA5/bqXjLt39tH9xUnwmzVPX1FkUj4qz3JXfJ0AzAy5j
 Z7XHa3VtEQJAVTaOXszGl10vZHwQWkFZg7NukYfhafloEFmduytdlQuTh+u98u7rliK+
 kYQfx61dOQUSDjiSVtNlGnF6XVpXs71zMzFgT7YgoqWuBE0qFnediKgMF5e64StYsG5B
 DbiA3P/SRJn5Zxcwy6LlXZLjfaBb5HxKya/hOlcn2Oyy4g2CJj7whq8pX+YEk5Qbx5V3
 DF6WAvYnMpED7N7YRcPu08QNZcgr5e1XYzjeHY2Xfs7C+EOtuxYK+Un3EE8FUhjro3ts
 uESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WyhwU63WY8tkSatCCkimQskxqHLn01ZP7kL8X30RByo=;
 b=WLN1F2BH39geQSqBmXdpfQPkmpLw0PlBUQio/C0AUsiL0Y9opaKgmnA/rIg5BeYdHg
 3q6hVo+4B1Bs/aTkH+LUrLVhEqSc7yFHa21FaP757h9j3fUSzLjeCOZdv8CJ5UPkHNkL
 RUfh7iZISXIYxpCepTfgnZr56/mfSbkZPEz5F1V0aql+rr9scbQRuSwexZ1jethzKcni
 nS9BWzpl4S1ykvoEYnT746hXbagh4xZo5CvESp3T730No5qD5huEba99zys9rjC+39KP
 xnl8fzA413+xsNl2SQb0DSVdwNs/K2+X1JW80DO8+Q5XVBb464SpY0l4Zrscrnyrhbnj
 Ee+w==
X-Gm-Message-State: APjAAAVy249lZyhQoTuc+gd5eqMevnV10pE6tRwJH3jXh9+1WOCIfHgn
 BjBfw1YB8pknNvXE49MmRUfuqVIe3C8cmmNWXgZrDw==
X-Google-Smtp-Source: APXvYqxSvcXns9Hapug9ojEyGluhIRcv3TJKZgw7o/SqVeHFV+REjcuoHfpDMwgpFk/KZHsc1pQQl3CR1+71btX6Exs=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr23869407wrp.111.1580164117892; 
 Mon, 27 Jan 2020 14:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20200124200231.10517-4-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jan 2020 17:28:25 -0500
Message-ID: <CADnq5_N=EK=QjiK=XH9G7urLHeCT5362AY31MAKAWG1Mh27NZw@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/i915: Clear out spurious whitespace
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGl0bGUgc2hvdWxkIGJlIHMvaTkxNS9lZGlkLyAsIHdpdGggdGhhdCBmaXhlZDoKUmV2aWV3ZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCgpPbiBGcmksIEph
biAyNCwgMjAyMCBhdCAzOjAzIFBNIFZpbGxlIFN5cmphbGEKPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPiB3cm90ZToKPgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Cj4KPiBOdWtlIHNvbWUgd2hpdGVzcGFjZSB0aGF0IHNob3VsZG4n
dCBiZSB0aGVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
IHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggZDZiY2U1OGIyN2FjLi4zZGY1NzQ0MDI2YjAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC0yODQyLDcgKzI4NDIsNyBAQCBkb19pbmZlcnJlZF9t
b2RlcyhzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZvaWQgKmMpCj4gICAgICAgICBj
bG9zdXJlLT5tb2RlcyArPSBkcm1fZG10X21vZGVzX2Zvcl9yYW5nZShjbG9zdXJlLT5jb25uZWN0
b3IsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
bG9zdXJlLT5lZGlkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGltaW5nKTsKPiAtCj4gKwo+ICAgICAgICAgaWYgKCF2ZXJzaW9uX2dyZWF0ZXIo
Y2xvc3VyZS0+ZWRpZCwgMSwgMSkpCj4gICAgICAgICAgICAgICAgIHJldHVybjsgLyogR1RGIG5v
dCBkZWZpbmVkIHlldCAqLwo+Cj4gQEAgLTMwODQsNyArMzA4NCw3IEBAIGRvX2N2dF9tb2RlKHN0
cnVjdCBkZXRhaWxlZF90aW1pbmcgKnRpbWluZywgdm9pZCAqYykKPgo+ICBzdGF0aWMgaW50Cj4g
IGFkZF9jdnRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVk
aWQgKmVkaWQpCj4gLXsKPiArewo+ICAgICAgICAgc3RydWN0IGRldGFpbGVkX21vZGVfY2xvc3Vy
ZSBjbG9zdXJlID0gewo+ICAgICAgICAgICAgICAgICAuY29ubmVjdG9yID0gY29ubmVjdG9yLAo+
ICAgICAgICAgICAgICAgICAuZWRpZCA9IGVkaWQsCj4gQEAgLTQzNDIsNyArNDM0Miw3IEBAIHZv
aWQgZHJtX2VkaWRfZ2V0X21vbml0b3JfbmFtZShzdHJ1Y3QgZWRpZCAqZWRpZCwgY2hhciAqbmFt
ZSwgaW50IGJ1ZnNpemUpCj4gIHsKPiAgICAgICAgIGludCBuYW1lX2xlbmd0aDsKPiAgICAgICAg
IGNoYXIgYnVmWzEzXTsKPiAtCj4gKwo+ICAgICAgICAgaWYgKGJ1ZnNpemUgPD0gMCkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+Cj4gLS0KPiAyLjI0LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
