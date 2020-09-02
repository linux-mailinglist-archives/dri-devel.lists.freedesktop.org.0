Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F351125A61A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156146E90E;
	Wed,  2 Sep 2020 07:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8D06E130
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 07:01:28 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 7so2065811pgm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2VBp7Lpbc9ICyEZOh+PAo/PTYbf1ofIuaPW1FlGuW60=;
 b=cvZ2lRWS/K1mePpg+qzSYqqi1cRElv6vuYDkCfonKlKHO89DzNH/KqMbGv6t1Hcl3b
 jBMiROk7dmO+zLsKzXhUOkPUR365CPCEEpd72j5fNU0xy8A36MxcyFaIcQUVuKEi185R
 XmMbv6KrZolva+sbow2V5bbf4wy3d9fFgMias3gaOGFMdinYTLyeOMR1+7DLTgNKsKnY
 cfkUdths5gFvqpjj2jPdq+76IE0Q0JfQ7hth2oSC4LYICEJe7SMmqbNgHxCg/B4Gw5sX
 k52zJui/62CWfQSlT4Sx5vW2t+bubaowOMzduS+xyJNgrNtalz79ebkKMku7z4RxnBeS
 G9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2VBp7Lpbc9ICyEZOh+PAo/PTYbf1ofIuaPW1FlGuW60=;
 b=glMf20CcaMU5maIPu5zX57obw0ON9JuGaU11l10nzhma9zeFyCNmDCP+/0Kr6nnVa4
 7LzCQGJkvPNzJ2juyQmj1wjh8Q0kfXvwreIiGVe1D9J+U8sJZjjw/NonBLbaZw5urQtl
 pHILWZk62tZsI9Q2l20iS6xhvmhmITZFbOXgsyynvF5la8Kb99RUi0wRh8aMnqOVMWmt
 iEtlr213+W/z9Bkj2NUEIWMq+8MfVFCnWo4t4FOMJFH8mMKedXT+/DJpoCGINZnJJ3R/
 Fq0rLiqXzudaT5EBdC+XzPcJpxTuY+zqpcXTE0n3JVmiUJMME1Pzf6MH34ekW/zJJXRU
 gNcA==
X-Gm-Message-State: AOAM532/tLCvEK7s5Ih1tEJovltQsNY38jiB0UkJxnZRAXUG7aGcoUUN
 eO5OwCY134RgYs41S8qFCe3Xa168OSeEEGgELS8=
X-Google-Smtp-Source: ABdhPJzyLrQWUInqU1HwkAEDX0M48D0ehobZk/DCp1+yTXFpbVCgHzovoVjqrhhEXk+moMSbkqf3tWhOekSGKTIyNQ0=
X-Received: by 2002:a63:1402:: with SMTP id u2mr823991pgl.400.1599030088244;
 Wed, 02 Sep 2020 00:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200901220305.6809-1-jernej.skrabec@siol.net>
In-Reply-To: <20200901220305.6809-1-jernej.skrabec@siol.net>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Wed, 2 Sep 2020 10:01:17 +0300
Message-ID: <CAGphcdnT4U8AztL_B_B2HYskQSAYKRgCQcnO3Q8Qj+UFO082hQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix DE2 YVU handling
To: Jernej Skrabec <jernej.skrabec@siol.net>
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
Cc: irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0YHRgCwgMiDRgdC10L3Rgi4gMjAyMCDQsy4g0LIgMDA6NTgsIEplcm5laiBTa3JhYmVjIDxqZXJu
ZWouc2tyYWJlY0BzaW9sLm5ldD46Cj4KPiBGdW5jdGlvbiBzdW44aV92aV9sYXllcl9nZXRfY3Nj
X21vZGUoKSBpcyBzdXBwb3NlZCB0byByZXR1cm4gQ1NDIG1vZGUKPiBidXQgZHVlIHRvIGlucHJv
cGVyIHJldHVybiB0eXBlIChib29sIGluc3RlYWQgb2YgdTMyKSBpdCByZXR1cm5zIGp1c3QgMAo+
IG9yIDEuIENvbG9ycyBhcmUgd3JvbmcgZm9yIFlWVSBmb3JtYXRzIGJlY2F1c2Ugb2YgdGhhdC4K
Pgo+IEZpeGVzOiBkYWFiM2QwZThlMmIgKCJkcm0vc3VuNGk6IGRlMjogY3NjX21vZGUgaW4gZGUy
IGZvcm1hdCBzdHJ1Y3QgaXMgbW9zdGx5IHJlZHVuZGFudCIpCj4gUmVwb3J0ZWQtYnk6IFJvbWFu
IFN0cmF0aWllbmtvIDxyLnN0cmF0aWllbmtvQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
ZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44
aV92aV9sYXllci5jCj4gaW5kZXggMjJjOGM1Mzc1ZDBkLi5jMDE0N2FmNmE4NDAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYwo+IEBAIC0yMTEsNyArMjExLDcgQEAg
c3RhdGljIGludCBzdW44aV92aV9sYXllcl91cGRhdGVfY29vcmQoc3RydWN0IHN1bjhpX21peGVy
ICptaXhlciwgaW50IGNoYW5uZWwsCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLXN0YXRp
YyBib29sIHN1bjhpX3ZpX2xheWVyX2dldF9jc2NfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1h
dF9pbmZvICpmb3JtYXQpCj4gK3N0YXRpYyB1MzIgc3VuOGlfdmlfbGF5ZXJfZ2V0X2NzY19tb2Rl
KGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdCkKPiAgewo+ICAgICAgICAgaWYg
KCFmb3JtYXQtPmlzX3l1dikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNVTjhJX0NTQ19NT0RF
X09GRjsKPiAtLQo+IDIuMjguMAo+CgpIaSBKZXJuZWosCgpUaGFuayB5b3UgZm9yIHRoZSBmaXgu
CkkgY2FuIGNvbmZpcm0gdGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgd2l0aCB3cm9uZyBjb2xv
cnMuCgpMZXQgbWUgc2hhcmUgbXkgdGhvdWdodHM6CkkndmUgbG9va2VkIGludG8gY3NjIGNvZGUs
IGFuZCBpdCBzZWVtcyB0byBtZSByZW9yZGVyaW5nIFUsIFYgb2Zmc2V0cwpzaG91bGQgYmUgYSBt
dWNoIHNpbXBsZXIgc29sdXRpb24gdGhhbiBhcHBseWluZwpjb2xvciB0cmFuc2Zvcm1hdGlvbiBt
YXRyaWNlcy5JdCBzaG91bGQgYWxzbyBzaW1wbGlmeSBhZGRpbmcgbW9yZQpjb2xvciBlbmNvZGlu
Z3MgaW4gdGhlIGZ1dHVyZS4KClJlZ2FyZHMsClJvbWFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
