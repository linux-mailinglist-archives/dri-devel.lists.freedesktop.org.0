Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F2B0B90
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3316EC48;
	Thu, 12 Sep 2019 09:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FC56EC48
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:38:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 7so6656818wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 02:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FyZv+2jpXHUeLj3zo5hEMKDZeE0gwZkeevJP1UY0f7g=;
 b=CvHFsD7SjssnoBBupjIArfVPYdHfNljcucQ8s7omust8UKA6U380idmhyqrxp3fbPs
 3SN3usx5Cy5t0nGS5VjFqzvrvcXeJjWpBIXMNPCddV/5h4tewFAYzWP6zqXPBcoKy6D/
 RN5Lj08RwWJrn+DlJTxSZeMa9zf+Gg9QRgbE/QY9vGoQrk+SXua7AumYr1kgfZz+s5u5
 ZneObZADZTQynywMWG1goKbLzhP+qat/6bTee4L5UL4ESEcyS0vtqKxM6a7QpsWmaqe+
 U7dMKshYPRRatQ7wWY/PDQTUpkOxwQIzXW6onORcWgFyPJwbZpkEMYab5BFsGZhYFdLL
 qc7g==
X-Gm-Message-State: APjAAAU5CFeWfhy4K+ycu1fl6xbOqf1+srNevh1dEIErE+UfwNKn5J+m
 Uxxo8+WNlbyJgC3cj7/xqV6lUA==
X-Google-Smtp-Source: APXvYqwjmAOKkNKKUOfQJdiedHbylzFrCwIEHmlMF2gTZyinn/Hgz7ItTmOAoVNQxy2zFP2RBUqnOg==
X-Received: by 2002:a05:600c:2386:: with SMTP id
 m6mr1662719wma.164.1568281106577; 
 Thu, 12 Sep 2019 02:38:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s26sm43063574wrs.63.2019.09.12.02.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 02:38:25 -0700 (PDT)
Date: Thu, 12 Sep 2019 10:38:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190912093823.h5ahzutlp4evwg6l@holly.lan>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911172106.12843-3-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FyZv+2jpXHUeLj3zo5hEMKDZeE0gwZkeevJP1UY0f7g=;
 b=ecsVnCqf7jy234ajtjhPg9bUFq6eqgeSiFQ3B9VshYDzlqTvwe6qHgo3Rme+YYjBYq
 57zpk4CVJaSffFdPd270c0VN8xlStEbZJZ+Sqs9lpMMOoBBIxWcWmnuTRQRez1qiHG0d
 1lF/Ub0lLFF61mcsJSmPRk+pkj9XHPLqMlmxv7g+hUhnOhPZJw3sqdIw0H0sRO6Szluy
 uubJNNNO3gpZ0uIIEthnKcGjYVCyroZ5Acc8NukHDVwgHn57hKBRTPjMeKVcjOYEpRX9
 joNJftMwDDaAtTVKc4vY8Ukzbw1p4oew/FyaHhwm6kEX+/WIUZzjHq3A1AVFc9G0i9jV
 +qUQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDc6MjE6MDZQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IEZvciBub3cganVzdCBlbmFibGUgaXQgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIHRv
IGFsbG93IGkyYwo+IGFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSBy
ZWdpc3RlciB2YWx1ZXMKPiB0byBkZWZhdWx0IGFuZCBhY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVl
dCBkb2VzIG5vdCBnaXZlCj4gcG93ZXIgc2F2aW5ncy4KPiAKPiBUZXN0ZWQgb24gS29ibyBDbGFy
YSBIRC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFk
ZS5pbmZvPgoKTWFrZSBzdXJlIERhbiBpcyBoYXBweSB3LnIudC4gaGlzIHJldmlldyBjb21tZW50
cyBidXQgaWYgdGhpcyBkcml2ZXIgaXMKdW5jaGFuZ2VkIHdoZW4geW91IHNwaW4gdjQgKGZvciB0
aGUgRFQgY2hhbmdlcykgdGhlbiBmZWVsIGZyZWUgdG8gYWRkOgoKUmV2aWV3ZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKRGFuaWVsLgoKPiAtLS0K
PiBjaGFuZ2VzIGluIHYyOgo+IC0gc2ltcGxpZmljYXRpb24KPiAtIGNvcnJlY3QgZ3BpbyBkaXJl
Y3Rpb24gaW5pdGlhbGlzYXRpb24KPiAKPiBjaGFuZ2VzIGluIHYzOgo+IC0gcmVtb3ZlZCBsZWdh
Y3kgaW5jbHVkZQo+IAo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgfCA5
ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwo+IGluZGV4IDhmODRmMzY4NGYwNC4uZDllNjdiOWIy
NTcxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwo+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwo+IEBAIC0xMiw2ICsx
Miw3IEBACj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvcHdtLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kYXRhL2xtMzYzMGFfYmwuaD4KPiAgCj4gQEAgLTQ4LDYgKzQ5LDcg
QEAgc3RydWN0IGxtMzYzMGFfY2hpcCB7Cj4gIAlzdHJ1Y3QgbG0zNjMwYV9wbGF0Zm9ybV9kYXRh
ICpwZGF0YTsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibGVkYTsKPiAgCXN0cnVjdCBi
YWNrbGlnaHRfZGV2aWNlICpibGVkYjsKPiArCXN0cnVjdCBncGlvX2Rlc2MgKmVuYWJsZV9ncGlv
Owo+ICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICAJc3RydWN0IHB3bV9kZXZpY2UgKnB3bWQ7
Cj4gIH07Cj4gQEAgLTUzNSw2ICs1MzcsMTMgQEAgc3RhdGljIGludCBsbTM2MzBhX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gIAl9Cj4gIAlwY2hpcC0+cGRhdGEgPSBwZGF0YTsK
PiAgCj4gKwlwY2hpcC0+ZW5hYmxlX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCgmY2xp
ZW50LT5kZXYsICJlbmFibGUiLAo+ICsJCQkJCQlHUElPRF9PVVRfSElHSCk7Cj4gKwlpZiAoSVNf
RVJSKHBjaGlwLT5lbmFibGVfZ3BpbykpIHsKPiArCQlydmFsID0gUFRSX0VSUihwY2hpcC0+ZW5h
YmxlX2dwaW8pOwo+ICsJCXJldHVybiBydmFsOwo+ICsJfQo+ICsKPiAgCS8qIGNoaXAgaW5pdGlh
bGl6ZSAqLwo+ICAJcnZhbCA9IGxtMzYzMGFfY2hpcF9pbml0KHBjaGlwKTsKPiAgCWlmIChydmFs
IDwgMCkgewo+IC0tIAo+IDIuMjAuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
