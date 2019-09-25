Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA43BECBA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67836EDF7;
	Thu, 26 Sep 2019 07:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4686EBF6;
 Wed, 25 Sep 2019 16:14:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i1so7654576wro.4;
 Wed, 25 Sep 2019 09:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ybucH2zzb0JMaO3LBxXiAg+udDkRMpU6mPdkTXPq7xA=;
 b=RxwPagtPbgYf/cruf67Bx3PK4jD8fGAL9d2d2D/4Ijcr7xc9CiwiW5FqHFWCaEqo04
 JmDI/GSoQY2Ep/Zt103BX+XBKwrpQ2GkEOfVCYizOKo/dHAqJlvFx6cnjUYXad649e23
 prPi8ePRMaRE6ynXNJpSKusPX0WyDNo0XqkLUr8PzzWHix36vLVGHbMPAFBhQLzBIR0X
 pZ3+Bn6bWzhnR4TMwB8dFnC7Vu+OVUl5Ap8+45fOhyFmQvNyIidVDE3ETS0iEqXB2vom
 s39XaEFZ6JYWGpMWtts06uHtjv9XdW2K/rs0uKW+IyWY7gp6YXX0wn4oYCfpBLejuPa5
 TtRw==
X-Gm-Message-State: APjAAAURnfGdIxNvuO4jRzL2O7qxd/au/ZmGZIrFG2UM8sCz25ZpGIgC
 c8egZ1JU5s+O7Yn/6YoKcuExOKFsZlnfn16FnzzoxQ==
X-Google-Smtp-Source: APXvYqzlZagGo2ACRJGWLIbl/773iwsET/4dw/CD9jHZPo+SPIgIPk00Z1Z8P0zMRO6Q19cZNnP6DVfwdG2SManYjTo=
X-Received: by 2002:a5d:4590:: with SMTP id p16mr10961231wrq.82.1569428083368; 
 Wed, 25 Sep 2019 09:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Wed, 25 Sep 2019 09:14:31 -0700
Message-ID: <CAKi4VA+zkHJVGFHmYKPA1SqGQx5JKmKfu8N7nrV15eJOrMOoPA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/dp/mst: Reduce nested ifs
To: Ville Syrjala <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Thu, 26 Sep 2019 07:42:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ybucH2zzb0JMaO3LBxXiAg+udDkRMpU6mPdkTXPq7xA=;
 b=upqlDdGNa/tYEiM9qFpsl8aorhKsWsnaWI4/mblwC7Cveg5mJxefEk99uzVoXns1VJ
 /W6vaLZP8E5T5qBuXCbnUjCWPNu2nksa5HRlsxO0cEhUTEuCz9pJWV2lsisuq7xq8x+W
 h3xFQ8B2ncZIcemRKYhn2DKAZti0SSm1V2e/z+RAP5uSJMBwybTPIrF57XsvUPWA3jC+
 hpNuZM7SFH+MA3Q/pbjtNQP21k6aOevorWNvH8YCmlp9c9yXfB+9WQA9DT0vXxMLOXHn
 V/oR7x1ds4Nn8/w76zH1giLPbU5OEWg90mCBaYn18U9B8gCjK8R8CoDd1hauhvTEFQeM
 I01A==
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNzoxNCBBTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gUmVwbGFjZSB0aGUgbmVzdGVkIGlmcyB3
aXRoIGEgc2luZ2xlIGlmIGFuZCBhIGxvZ2ljYWwgQU5ELgo+Cj4gQ2M6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KCkx1Y2FzIERlIE1hcmNoaQoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IDk3MjE2MDk5YTcxOC4uZTI1NTk3ZWIzY2Ex
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTExMjMsMTEg
KzExMjMsMTEgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF9wdXRfcGF5bG9hZF9pZChzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiAgICAgICAgIGNsZWFyX2JpdCh2Y3BpIC0g
MSwgJm1nci0+dmNwaV9tYXNrKTsKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG1nci0+bWF4
X3BheWxvYWRzOyBpKyspIHsKPiAtICAgICAgICAgICAgICAgaWYgKG1nci0+cHJvcG9zZWRfdmNw
aXNbaV0pCj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1nci0+cHJvcG9zZWRfdmNwaXNb
aV0tPnZjcGkgPT0gdmNwaSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWdy
LT5wcm9wb3NlZF92Y3Bpc1tpXSA9IE5VTEw7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjbGVhcl9iaXQoaSArIDEsICZtZ3ItPnBheWxvYWRfbWFzayk7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBpZiAobWdyLT5wcm9wb3NlZF92Y3Bpc1tp
XSAmJgo+ICsgICAgICAgICAgICAgICAgICAgbWdyLT5wcm9wb3NlZF92Y3Bpc1tpXS0+dmNwaSA9
PSB2Y3BpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWdyLT5wcm9wb3NlZF92Y3Bpc1tp
XSA9IE5VTEw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfYml0KGkgKyAxLCAmbWdy
LT5wYXlsb2FkX21hc2spOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gICAgICAg
ICBtdXRleF91bmxvY2soJm1nci0+cGF5bG9hZF9sb2NrKTsKPiAgfQo+IC0tCj4gMi4yMS4wCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEludGVs
LWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKCgoK
LS0gCkx1Y2FzIERlIE1hcmNoaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
