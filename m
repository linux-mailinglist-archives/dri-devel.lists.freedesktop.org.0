Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE9703A2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC2189CC4;
	Mon, 22 Jul 2019 15:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3E889CC4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:23:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p74so35597220wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dt/YdbkdtXbQfI//Db8fFkJDny3N1lhFKp8D2tIZAQw=;
 b=fE3+z6xeF9agyK9ojuPKK6gON62uiHjoJdSVfIarW7Ops58g4FY9FQa09pF1ofkBKw
 cm4XPT7skia2C2+OI/OujLbpKC2DKmp/lQXA1Q7LblOZW1HankpZ+1CIJq4o8anUHCns
 fLwIAOgE96uwC7Re7wII08zjvIjpNhorDTeMSswUrpUp6O15+AlvcHN0cw73CVPC22gJ
 +kcJ/ocTYhpu7TBQD1JX10ujDLhOT42aOknkYnD+4pVljqOZzc/IuNRtfBOZar3Kt5dM
 1bLkvPIK/kUKvUQ3s+gAr41ssftexh4g6woCzSWVwjcLrrLgKNoInP2ISGPsMfOs+4oz
 4thQ==
X-Gm-Message-State: APjAAAUdStEs7g0a53iQ5X6AG/LlRFuIHrY3KlFrvqlget4fNTjZ3O+O
 Xwg+H1lhxAlXFI7NQ22b8VPxfg==
X-Google-Smtp-Source: APXvYqygZB7malLkPMeQEKMwJy8+ylJrhDjDfHPzerIG3eAhjzAGq3TdPyRHRcEw3vxVe2mikWslSQ==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr57074124wma.176.1563809029501; 
 Mon, 22 Jul 2019 08:23:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n2sm27256412wmi.38.2019.07.22.08.23.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:23:48 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:23:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190722152347.fuar2lezfhp7iuyy@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dt/YdbkdtXbQfI//Db8fFkJDny3N1lhFKp8D2tIZAQw=;
 b=cQ2I7j835ew5ZusitfiizKVXsv2ms/Nc0gSb5CrVHW/lFCaI9Gv70gdA4oadY9nnnt
 22rHq7NOp1P54r4QTN05DnoO5Vzk7n5pOqdpjljYIGB6p/c5/nb5/NE7ssI4cnM5+uMW
 re3SrKpnRzNArReAT73AICGdFbuEJXjev/94JuhOADB6QIJg6lsQY73ChYKd5Ay955n8
 n/282J2Tet1cmlYWPRfz4nrpYUJ3ON+x0+U8/9RSfLmrAUYjyYD408Dv0NWz2VfZl9v7
 0EV1HGfx/k9CthCvh6voCMuiR+51PFNtlUlVSLG1xJXZPSpw9f/DV0Y7wom93U6fLsF+
 EEYA==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDM6MDJQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwg
dXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBi
YXlsaWJyZS5jb20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KCgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2Jh
Y2tsaWdodC5jIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggY2Q2YTc1YmNhOWNjLi4wOTFmZjc5OTY1OWEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBAQCAtNTQs
MjkgKzU0LDMyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBncGlvX2JhY2ts
aWdodF9vcHMgPSB7Cj4gIAo+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAtCXN0cnVjdCBncGlvX2JhY2tsaWdodF9w
bGF0Zm9ybV9kYXRhICpwZGF0YSA9Cj4gLQkJZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsK
PiArCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YTsKPiAgCXN0cnVj
dCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNl
ICpibDsKPiAgCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwo+ICAJZW51bSBncGlvZF9mbGFn
cyBmbGFnczsKPiArCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAgCWludCByZXQsIGRlZl92YWx1ZTsK
PiAgCj4gLQlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBf
S0VSTkVMKTsKPiArCWRldiA9ICZwZGV2LT5kZXY7Cj4gKwlwZGF0YSA9IGRldl9nZXRfcGxhdGRh
dGEoZGV2KTsKPiArCj4gKwlnYmwgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmdibCksIEdG
UF9LRVJORUwpOwo+ICAJaWYgKGdibCA9PSBOVUxMKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAK
PiAgCWlmIChwZGF0YSkKPiAgCQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2Owo+ICAKPiAtCWRl
Zl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQt
b24iKTsKPiArCWRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVm
YXVsdC1vbiIpOwo+ICAJZmxhZ3MgPSBkZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9E
X09VVF9MT1c7Cj4gIAo+IC0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYs
IE5VTEwsIGZsYWdzKTsKPiArCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEws
IGZsYWdzKTsKPiAgCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKPiAgCQlyZXQgPSBQVFJfRVJS
KGdibC0+Z3Bpb2QpOwo+ICAJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgewo+IC0JCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsCj4gKwkJCWRldl9lcnIoZGV2LAo+ICAJCQkJIkVycm9yOiBUaGUgZ3Bp
b3MgcGFyYW1ldGVyIGlzIG1pc3Npbmcgb3IgaW52YWxpZC5cbiIpOwo+ICAJCX0KPiAgCQlyZXR1
cm4gcmV0Owo+IEBAIC04NSwxMSArODgsMTAgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJbWVtc2V0KCZwcm9wcywgMCwg
c2l6ZW9mKHByb3BzKSk7Cj4gIAlwcm9wcy50eXBlID0gQkFDS0xJR0hUX1JBVzsKPiAgCXByb3Bz
Lm1heF9icmlnaHRuZXNzID0gMTsKPiAtCWJsID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lz
dGVyKCZwZGV2LT5kZXYsIGRldl9uYW1lKCZwZGV2LT5kZXYpLAo+IC0JCQkJCSZwZGV2LT5kZXYs
IGdibCwgJmdwaW9fYmFja2xpZ2h0X29wcywKPiAtCQkJCQkmcHJvcHMpOwo+ICsJYmwgPSBkZXZt
X2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoZGV2LCBkZXZfbmFtZShkZXYpLCBkZXYsIGdibCwK
PiArCQkJCQkgICAgJmdwaW9fYmFja2xpZ2h0X29wcywgJnByb3BzKTsKPiAgCWlmIChJU19FUlIo
YmwpKSB7Cj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGJhY2ts
aWdodFxuIik7Cj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgYmFja2xpZ2h0
XG4iKTsKPiAgCQlyZXR1cm4gUFRSX0VSUihibCk7Cj4gIAl9Cj4gIAo+IC0tIAo+IDIuMjEuMAo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
