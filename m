Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA5C8E6B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39E6E895;
	Wed,  2 Oct 2019 16:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00436E8BD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:32:54 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f21so7263331plj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 09:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yHa2ifff61zSzcqlNyC/NW1wPlVFiEX+NgfwBD/73Mo=;
 b=HU4xBGHKpAxszoQlNPfjTvazB+OsgJ5XRB1nIaEYQopNvaOFigVB4BJAFNFlyRG+3t
 qFVaGt8B61hLLSZ5VDaNo6qSVOvjTi3QP4eaqQV5o+vRNdjCHi+CtFNvQGLeSTfYSoZz
 g5N08ehCWcAHN6Kb+LPUbKAcpecR3vOqlhhWsPzoZfrrMGZGeVlkwDIp8YGVA0htHQHo
 kVz2L95+qEHNFOgoJufI77+2qf1OVbKhAJq7HVmXi8B4IqMHjJ0uhzfC0vA5tN/VJwSr
 6++a72NEcmoZjjqaVl7rinlPpfiJyXul7yR+lfsw37np8doNOBq6m6Km5GMM+OvjX8mR
 924Q==
X-Gm-Message-State: APjAAAXtoELdwtSLPT1BCGUMdgZVfg2tu692u89YwVGTS83rw/dvH5go
 Y7bCFcWEeRZ0+5nh66kEP05KKA==
X-Google-Smtp-Source: APXvYqzz5c1WsihtUOrz9EhiZpXsZb9IczkyfwU9rquOTW4vCRt+bTdbF/6F+a9Me86FT53hpQX64A==
X-Received: by 2002:a17:902:144:: with SMTP id
 62mr4630720plb.283.1570033974166; 
 Wed, 02 Oct 2019 09:32:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id r2sm22666315pfq.60.2019.10.02.09.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 09:32:52 -0700 (PDT)
Date: Wed, 2 Oct 2019 09:32:48 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: Don't assign levels table repeatedly
Message-ID: <20191002163248.GE87296@google.com>
References: <20191001162835.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
 <20191002100737.orm5ghpnw6oe6b3r@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002100737.orm5ghpnw6oe6b3r@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yHa2ifff61zSzcqlNyC/NW1wPlVFiEX+NgfwBD/73Mo=;
 b=oJ9hnWECguw7nK8f+kqKEFdwgoKdcYpQ6C2LocCNzbHG4wPPVwsgMTYGbs0DLoeBn9
 zpt70c81D/l56/svCOr4m8/Q27axDQS5LLI3KYhXMUFkhqNlCNyxIYmawcts1sabiJzs
 HODRZe6BFZAVOWl2G5Nvm2PTnB2dxGduISeDo=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMTE6MDc6MzdBTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDAxLCAyMDE5IGF0IDA0OjI5OjI0UE0gLTA3MDAsIE1hdHRo
aWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gcHdtX2JhY2tsaWdodF9wcm9iZSgpIHJlLWFzc2lnbnMg
cGItPmxldmVscyBmb3IgZXZlcnkgYnJpZ2h0bmVzcwo+ID4gbGV2ZWwuIFRoaXMgaXMgbm90IG5l
ZWRlZCBhbmQgd2FzIGxpa2VseSBub3QgaW50ZW5kZWQsIHNpbmNlCj4gPiBuZWl0aGVyIHNpZGUg
b2YgdGhlIGFzc2lnbm1lbnQgY2hhbmdlcyBkdXJpbmcgdGhlIGxvb3AuIEFzc2lnbgo+ID4gdGhl
IGZpZWxkIG9ubHkgb25jZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxj
a2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gCj4gTWFrZXMgc2Vuc2UgYnV0IHRoaXMgc2hvdWxkIHBy
b2JhYmx5IGJlIGRyb3BwaW5nIHRoZSBjdXJseSBicmFjZXMgdG9vLgoKYWNrLCBJJ2xsIHNlbmQg
YSBuZXcgdmVyc2lvbiB3aXRoIHRoZSBjdXJseSBicmFjZXMgcmVtb3ZlZC4KCj4gPiAgZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYwo+ID4gaW5kZXggNzQ2ZWViYzQxMWRmLi45NTk0MzZiOWU5MmIgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ID4gKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+IEBAIC01NjQsNiArNTY0LDggQEAgc3RhdGljIGlu
dCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAg
CW1lbXNldCgmcHJvcHMsIDAsIHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMpKTsK
PiA+ICAKPiA+ICAJaWYgKGRhdGEtPmxldmVscykgewo+ID4gKwkJcGItPmxldmVscyA9IGRhdGEt
PmxldmVsczsKPiA+ICsKPiA+ICAJCS8qCj4gPiAgCQkgKiBGb3IgdGhlIERUIGNhc2UsIG9ubHkg
d2hlbiBicmlnaHRuZXNzIGxldmVscyBpcyBkZWZpbmVkCj4gPiAgCQkgKiBkYXRhLT5sZXZlbHMg
aXMgZmlsbGVkLiBGb3IgdGhlIG5vbi1EVCBjYXNlLCBkYXRhLT5sZXZlbHMKPiA+IEBAIC01NzIs
OCArNTc0LDYgQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gPiAgCQlmb3IgKGkgPSAwOyBpIDw9IGRhdGEtPm1heF9icmlnaHRu
ZXNzOyBpKyspIHsKPiA+ICAJCQlpZiAoZGF0YS0+bGV2ZWxzW2ldID4gcGItPnNjYWxlKQo+ID4g
IAkJCQlwYi0+c2NhbGUgPSBkYXRhLT5sZXZlbHNbaV07Cj4gPiAtCj4gPiAtCQkJcGItPmxldmVs
cyA9IGRhdGEtPmxldmVsczsKPiA+ICAJCX0KPiA+ICAKPiA+ICAJCWlmIChwd21fYmFja2xpZ2h0
X2lzX2xpbmVhcihkYXRhKSkKPiA+IC0tIAo+ID4gMi4yMy4wLjQ0NC5nMThlZWI1YTI2NS1nb29n
Cj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
