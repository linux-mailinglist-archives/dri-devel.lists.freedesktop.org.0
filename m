Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F172C91
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 12:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33576E4FF;
	Wed, 24 Jul 2019 10:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73466E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 10:49:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y4so46461031wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 03:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W3tplNk7Pn8NJuO+Yv/Jc9c6JxYblLtUNg/wctPH1r0=;
 b=j6mqDClwr1xVAd/YHUTvWxJRuE2OluE/Go9NdwAcaWJtw0KrN9hbsz99OnjArkw94t
 uy70My8hqDFh8A3NVQk4S3pSVA9UwxzktDiYl4v+u4mS3Uhc/aLbhCHPCapCxFNYyiCu
 bDTf2tCtev5jtSCkgUJN/aeR3SC42t+qxjp4Xb51byi3bn7qukqH4HbqdV8ko3+PTnbJ
 JwxdOX0SWDqhulucEzw9G59pdsW04024aSoD2B3CQ9RzFBYzbqoTVqXJl6klrnQBNczI
 pV8reBnMCj/HKlAsJBhny5WUCTKGtWXD694hEm8Lt+bDxlF/+gRn50lc4SdRRAcLdwJf
 FBwA==
X-Gm-Message-State: APjAAAUSr1H222vbxEM476TuqT85mxT0t//guRuLI+jOCjDcyxhnppRI
 s41heEyss4dmiJFLwiqi7mECm7kL7HTZ0A==
X-Google-Smtp-Source: APXvYqzZmcScyHr0jtsy/X6z6wcZMOEFESEHtIvXeoPPgNpPNFHSL/VLYLK2EjhotcxOiZqxQSNFbA==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr48946280wrp.258.1563965378294; 
 Wed, 24 Jul 2019 03:49:38 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t13sm56309580wrr.0.2019.07.24.03.49.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 03:49:37 -0700 (PDT)
Date: Wed, 24 Jul 2019 11:49:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] backlight: lm3630a: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190724104936.wt75xycakeyvo25l@holly.lan>
References: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W3tplNk7Pn8NJuO+Yv/Jc9c6JxYblLtUNg/wctPH1r0=;
 b=R6yO2HrPSFUwSotmhDhwG4v3b72oYx0RVIxytbSY0j0j8U5qAFHqmv3QEGBeIxrSWf
 z35yLdX6inW3Z3aJIiYZrQw7Fzr+gK3HtFBfyqHwjQr1NTqnSGMJHUchxhlBr0+F5yPs
 2oN72eUN6U+hIa9jhB5Bv4dVKcqYF/I7wr2VnvM3S17s9Qlh5ei2QqKGmj6EFkVpMo3C
 uMLu+tvpt+Cqv1+A2ODl5J1oD07VlOqXA1sDDp/UCzVAS65vBXsk2CO3R67z2PpXdNMa
 F5b0v41bi7Uf5ggLyJVSc0p62aXR4oVqhQgKkhrkcFJRrVd6U/FS5X1vXCGRyiTiTl7o
 FzPg==
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTA6MzQ6MDBQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IFVzZSB1c2UgZndub2RlX3Byb3BlcnR5X2NvdW50X3VYWCgpIGRpcmVjdGx5LCB0
aGF0IG1ha2VzIGNvZGUgbmVhdGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKPiAtLS0KPiAgZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9s
bTM2MzBhX2JsLmMKPiBpbmRleCBiMDRiMzVkMDA3YTIuLjJkOGU4MTkyZTRlMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiBAQCAtMzc3LDggKzM3Nyw3IEBAIHN0YXRp
YyBpbnQgbG0zNjMwYV9wYXJzZV9sZWRfc291cmNlcyhzdHJ1Y3QgZndub2RlX2hhbmRsZSAqbm9k
ZSwKPiAgCXUzMiBzb3VyY2VzW0xNMzYzMEFfTlVNX1NJTktTXTsKPiAgCWludCByZXQsIG51bV9z
b3VyY2VzLCBpOwo+ICAKPiAtCW51bV9zb3VyY2VzID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMy
X2FycmF5KG5vZGUsICJsZWQtc291cmNlcyIsIE5VTEwsCj4gLQkJCQkJCSAgICAgMCk7Cj4gKwlu
dW1fc291cmNlcyA9IGZ3bm9kZV9wcm9wZXJ0eV9jb3VudF91MzIobm9kZSwgImxlZC1zb3VyY2Vz
Iik7Cj4gIAlpZiAobnVtX3NvdXJjZXMgPCAwKQo+ICAJCXJldHVybiBkZWZhdWx0X2xlZF9zb3Vy
Y2VzOwo+ICAJZWxzZSBpZiAobnVtX3NvdXJjZXMgPiBBUlJBWV9TSVpFKHNvdXJjZXMpKQo+IC0t
IAo+IDIuMjAuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
