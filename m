Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B9E01C5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772EC6E578;
	Tue, 22 Oct 2019 10:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9216E578
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 10:14:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so12133319wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 03:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ecp7w/hJmXBVWFySg3KpzIRhvM49DSx8lFHehzy7hk0=;
 b=I1jcUiqcTNagQU7H3nlRUnBQLxQbvEd2TAaVCa+AlYlbSI4AQoHNyxcrXdDJhl6XI+
 KBcwgvmN1uFSSYkji3XqgBs5X/k6FHvFd47gA4Dja8HB7nTEzfZS+MlD91d84ZLNWn6p
 HwyO+mLfSsEP2Z/wNLJkmZHSykFM6iciyH/47Tt06kQ7dR4yq/Eu3ciF0clMruqDvOQr
 LVeHBb3/LH5zgCNHEgP/EC69V4v8fDIpbxHU25FWcqyDOw3UNO9nuL/Th5qn7N+/wj1P
 Rh44r52gPVdtzyF6Z5e7Wkt3GYG31xvqjpITscCfde4ZyM2m8kifVZgyVJROTSQUiS1H
 hb3g==
X-Gm-Message-State: APjAAAXoiAYFtnuRsREuIKISNADTwmQjK2OjMX+p5ki78EwlJm+yB1M8
 LP6cLf/xUb7P6AsQNKG8FVXRyQ==
X-Google-Smtp-Source: APXvYqy69MSDwMGJydjlO5jDUJHbFqo/+EKRl4bhfBg3eHvYxjqMrge6DsMg/kqLwPmoSguq6vUTyw==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr2667048wrx.111.1571739259892; 
 Tue, 22 Oct 2019 03:14:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l7sm8333986wro.17.2019.10.22.03.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 03:14:19 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:14:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 3/9] backlight: gpio: explicitly set the direction of
 the GPIO
Message-ID: <20191022101417.24zkd3htnyfg3hy6@holly.lan>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <20191022083630.28175-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022083630.28175-4-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ecp7w/hJmXBVWFySg3KpzIRhvM49DSx8lFHehzy7hk0=;
 b=fRFiFu9115aCE+SgtQZi4fJ3gGrz7s99XoenJ0ll+4BbNyYVHfehhS/TgSO8/MNxiK
 wwecmTwAPsjrc+Hj/hgjLWz11X+sweN1cPESRp41Q150VwGfLDHW1SmKZMk8JZPJTXs7
 3SV6wGOX1b5QOcslTm2aou+1oRmAwbePg1zZZYbqzBdSNMhHb/ParUdwX0haH4Sf4COA
 VgW0Q8mE9zp4LoCF0PT/p9QoFC9Ox4117lV60UZCcmcZi78FU5qPf316/I5JCC2/VZPR
 3rRBedVtPBkiORU65dNmroqlaRDNYzYYJcPqrbW3vT+Y3sAigm1A2YxAi91Jv/+NZvvj
 PbTg==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6MzY6MjRBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoZSBHUElPIGJhY2tsaWdodCBkcml2ZXIgY3VycmVudGx5IHJlcXVl
c3RzIHRoZSBsaW5lICdhcyBpcycsIHdpdGhvdXQKPiBhY2l2ZWx5IHNldHRpbmcgaXRzIGRpcmVj
dGlvbi4gVGhpcyBjYW4gbGVhZCB0byBwcm9ibGVtczogaWYgdGhlIGxpbmUKPiBpcyBpbiBpbnB1
dCBtb2RlIGJ5IGRlZmF1bHQsIHdlIHdvbid0IGJlIGFibGUgdG8gZHJpdmUgaXQgbGF0ZXIgd2hl
bgo+IHVwZGF0aW5nIHRoZSBzdGF0dXMgYW5kIGFsc28gcmVhZGluZyBpdHMgaW5pdGlhbCB2YWx1
ZSBkb2Vzbid0IG1ha2UKPiBzZW5zZSBmb3IgYmFja2xpZ2h0IHNldHRpbmcuCj4gCj4gUmVxdWVz
dCB0aGUgbGluZSAnYXMgaXMnIGluaXRpYWxseSwgc28gdGhhdCB3ZSBjYW4gcmVhZCBpdHMgdmFs
dWUKPiB3aXRob3V0IGFmZmVjdGluZyBpdCBidXQgdGhlbiBjaGFuZ2UgdGhlIGRpcmVjdGlvbiB0
byBvdXRwdXQgZXhwbGljaXRseQo+IHdoZW4gc2V0dGluZyB0aGUgaW5pdGlhbCBicmlnaHRuZXNz
Lgo+IAo+IEFsc286IGNoZWNrIHRoZSBjdXJyZW50IGRpcmVjdGlvbiBhbmQgb25seSByZWFkIHRo
ZSB2YWx1ZSBpZiBpdCdzIG91dHB1dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBU
aG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggMzk1NWI1
MTNmMmY4Li41MmYxN2M5Y2ExYzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvZ3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9f
YmFja2xpZ2h0LmMKPiBAQCAtMjUsOSArMjUsOCBAQCBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgewo+
ICAJaW50IGRlZl92YWx1ZTsKPiAgfTsKPiAgCj4gLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
dXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmwpCj4gK3N0YXRpYyBpbnQg
Z3Bpb19iYWNrbGlnaHRfZ2V0X25leHRfYnJpZ2h0bmVzcyhzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmwpCj4gIHsKPiAtCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsID0gYmxfZ2V0X2RhdGEo
YmwpOwo+ICAJaW50IGJyaWdodG5lc3MgPSBibC0+cHJvcHMuYnJpZ2h0bmVzczsKPiAgCj4gIAlp
ZiAoYmwtPnByb3BzLnBvd2VyICE9IEZCX0JMQU5LX1VOQkxBTksgfHwKPiBAQCAtMzUsNiArMzQs
MTQgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF91cGRhdGVfc3RhdHVzKHN0cnVjdCBiYWNr
bGlnaHRfZGV2aWNlICpibCkKPiAgCSAgICBibC0+cHJvcHMuc3RhdGUgJiAoQkxfQ09SRV9TVVNQ
RU5ERUQgfCBCTF9DT1JFX0ZCQkxBTkspKQo+ICAJCWJyaWdodG5lc3MgPSAwOwo+ICAKPiArCXJl
dHVybiBicmlnaHRuZXNzOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Vw
ZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsKQo+ICt7Cj4gKwlzdHJ1Y3Qg
Z3Bpb19iYWNrbGlnaHQgKmdibCA9IGJsX2dldF9kYXRhKGJsKTsKPiArCWludCBicmlnaHRuZXNz
ID0gZ3Bpb19iYWNrbGlnaHRfZ2V0X25leHRfYnJpZ2h0bmVzcyhibCk7Cj4gKwo+ICAJZ3Bpb2Rf
c2V0X3ZhbHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QsIGJyaWdodG5lc3MpOwo+ICAKPiAgCXJldHVy
biAwOwo+IEBAIC04NSw3ICs5Miw4IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5pdGlh
bF9wb3dlcl9zdGF0ZShzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKPiAgCQlyZXR1cm4gZ2Js
LT5kZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJMQU5LIDogRkJfQkxBTktfUE9XRVJET1dOOwo+ICAK
PiAgCS8qIGlmIHRoZSBlbmFibGUgR1BJTyBpcyBkaXNhYmxlZCwgZG8gbm90IGVuYWJsZSB0aGUg
YmFja2xpZ2h0ICovCj4gLQlpZiAoZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2Qp
ID09IDApCj4gKwlpZiAoZ3Bpb2RfZ2V0X2RpcmVjdGlvbihnYmwtPmdwaW9kKSA9PSAwICYmCj4g
KwkgICAgZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QpID09IDApCj4gIAkJcmV0
dXJuIEZCX0JMQU5LX1BPV0VSRE9XTjsKPiAgCj4gIAlyZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsK
PiBAQCAtOTgsNyArMTA2LDcgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVz
IHByb3BzOwo+ICAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsOwo+ICAJc3RydWN0IGdwaW9f
YmFja2xpZ2h0ICpnYmw7Cj4gLQlpbnQgcmV0Owo+ICsJaW50IHJldCwgaW5pdF9icmlnaHRuZXNz
Owo+ICAKPiAgCWdibCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmdibCksIEdG
UF9LRVJORUwpOwo+ICAJaWYgKGdibCA9PSBOVUxMKQo+IEBAIC0xNTEsNyArMTU5LDEyIEBAIHN0
YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgCWJsLT5wcm9wcy5wb3dlciA9IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3Rh
dGUoZ2JsKTsKPiAgCWJsLT5wcm9wcy5icmlnaHRuZXNzID0gMTsKPiAgCj4gLQliYWNrbGlnaHRf
dXBkYXRlX3N0YXR1cyhibCk7Cj4gKwlpbml0X2JyaWdodG5lc3MgPSBncGlvX2JhY2tsaWdodF9n
ZXRfbmV4dF9icmlnaHRuZXNzKGJsKTsKPiArCXJldCA9IGdwaW9kX2RpcmVjdGlvbl9vdXRwdXQo
Z2JsLT5ncGlvZCwgaW5pdF9icmlnaHRuZXNzKTsKPiArCWlmIChyZXQpIHsKPiArCQlkZXZfZXJy
KCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gc2V0IGluaXRpYWwgYnJpZ2h0bmVzc1xuIik7Cj4gKwkJ
cmV0dXJuIHJldDsKPiArCX0KPiAgCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBibCk7
Cj4gIAlyZXR1cm4gMDsKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
