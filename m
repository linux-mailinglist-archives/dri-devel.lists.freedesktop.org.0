Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71FDAB52
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 13:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4757D6EA59;
	Thu, 17 Oct 2019 11:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC8D6EA59
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:37:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b24so2164922wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 04:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kz81GWsdy+gT4h09Jxnw2SGeMu79bPfNDv5X5wml0Ow=;
 b=LOiRB86SRRxA+G0Fzo5jPGpQP8v9tWH2BZA4ZGKwjlGzxr7abUwF3k82paHGUmfLrF
 BIEdOv39nkpapJvKZ+mFUeUrg9up1e/jOC4J4zV5VybIJ9TZZJtlUx6N1a/ARR4nk0H4
 i5oKxA82XAhI9dkioRpd8gw8bNHBXpja/KcSVzDs1zUgF3nNvJxk2HOjU6EJQ2YTPAxC
 bNpXOHGQ/sZ0Mbs7g2gCockqrMvwNTYemvMNGRDQeA45wIES/EgUaglKebQ+zrGyiBwJ
 EJp0N+de+Np9gaOtoDO1OR2062TxsDVkaJo/TvLR8BGVBvtvCBudTldVlgPkpVpGfVkY
 KS9A==
X-Gm-Message-State: APjAAAWGQCrsshomQE0oblB2PDzpMzxMrnc93C+JL7r6q8O8otHJrKBQ
 iKu1a4CDbOPVUr5cGnlyfZa/Cg==
X-Google-Smtp-Source: APXvYqwVcAbF9NKa2DBqA54nZM8E1xuownksYgsSe+rQmhJK4e6KkHf1SfpZesJWdHwSR9jrw3iaOw==
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr2631862wmd.51.1571312229630; 
 Thu, 17 Oct 2019 04:37:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u1sm2020090wrp.56.2019.10.17.04.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 04:37:08 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:37:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015191821.11479-30-bigeasy@linutronix.de>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kz81GWsdy+gT4h09Jxnw2SGeMu79bPfNDv5X5wml0Ow=;
 b=wsOtMSHpdRb6Eyt0a4RIHj3ouio4xANV3N5raaZk1cU6ih1BY7YK6f325AhA1diobG
 BoWDhKGQOnDjqitMuKFbONryFjMvYhZmmtl5rmPznmkTrsP/nAWrpY0aOqIlR1HAARM7
 N/1QBXvBRGJE7dzNZi8tAMcuJ1bPouAvd/7WSc9b0ZQOoHsKqZBvcPsPddV4pI0Iho5Z
 DgQO9eIECjl+wUtc+XLAFN3gZWbGdpPq3rWLFAoaw+88iW2ze6C5XjKTY0IQJsCRoKQ9
 ZLY5Mi8HF9bcMw+3rZd+S2RC9xAefNibIiecULZ6nBDr1NAtYRifeOwAy2lom3/e9mrJ
 ZcwQ==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDk6MTg6MTZQTSArMDIwMCwgU2ViYXN0aWFuIEFuZHJ6
ZWogU2lld2lvciB3cm90ZToKPiBGcm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KPiAKPiBDT05GSUdfUFJFRU1QVElPTiBpcyBzZWxlY3RlZCBieSBDT05GSUdfUFJFRU1Q
VCBhbmQgYnkgQ09ORklHX1BSRUVNUFRfUlQuCj4gQm90aCBQUkVFTVBUIGFuZCBQUkVFTVBUX1JU
IHJlcXVpcmUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSB3aGljaCB0b2RheQo+IGRlcGVuZHMgb24g
Q09ORklHX1BSRUVNUFQuCj4gCj4gU3dpdGNoIHRoZSBLY29uZmlnIGRlcGVuZGVuY3kgdG8gQ09O
RklHX1BSRUVNUFRJT04uCj4gCj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Cj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gQ2M6
IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+IENjOiBCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gW2JpZ2Vh
c3k6ICtMQ0RfSFA3MDBdCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lv
ciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgooSSBrbm93Li4uIHRoZSByZXZpZXcgZm9yIHRo
aXMgcGFydGljdWxhciBwYXRjaCBpcyB0cml2aWFsIGJ1dCBhbgpBY2tlZC1ieSBmcm9tIGEgbWFp
bnRhaW5lciBtZWFucyBzb21ldGhpbmcgc3BlY2lmaWMgYW5kIGl0IGlzIExlZQpKb25lcyB3aG8g
Y29vcmRpbmF0ZXMgbGFuZGluZyBjcm9zcyBzdWItc3lzdGVtIHBhdGNoIHNldHMgZm9yCmJhY2ts
aWdodCkuCgoKRGFuaWVsLgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZp
ZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwo+IGluZGV4IDQwNjc2YmUyZTQ2YWEuLmQw
OTM5NjM5MzcyNGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZp
Zwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKPiBAQCAtOTksNyArOTks
NyBAQCBjb25maWcgTENEX1RPU0EKPiAgCj4gIGNvbmZpZyBMQ0RfSFA3MDAKPiAgCXRyaXN0YXRl
ICJIUCBKb3JuYWRhIDcwMCBzZXJpZXMgTENEIERyaXZlciIKPiAtCWRlcGVuZHMgb24gU0ExMTAw
X0pPUk5BREE3MjBfU1NQICYmICFQUkVFTVBUCj4gKwlkZXBlbmRzIG9uIFNBMTEwMF9KT1JOQURB
NzIwX1NTUCAmJiAhUFJFRU1QVElPTgo+ICAJZGVmYXVsdCB5Cj4gIAloZWxwCj4gIAkgIElmIHlv
dSBoYXZlIGFuIEhQIEpvcm5hZGEgNzAwIHNlcmllcyBoYW5kaGVsZCAoNzEwLzcyMC83MjgpCj4g
QEAgLTIyOCw3ICsyMjgsNyBAQCBjb25maWcgQkFDS0xJR0hUX0hQNjgwCj4gIAo+ICBjb25maWcg
QkFDS0xJR0hUX0hQNzAwCj4gIAl0cmlzdGF0ZSAiSFAgSm9ybmFkYSA3MDAgc2VyaWVzIEJhY2ts
aWdodCBEcml2ZXIiCj4gLQlkZXBlbmRzIG9uIFNBMTEwMF9KT1JOQURBNzIwX1NTUCAmJiAhUFJF
RU1QVAo+ICsJZGVwZW5kcyBvbiBTQTExMDBfSk9STkFEQTcyMF9TU1AgJiYgIVBSRUVNUFRJT04K
PiAgCWRlZmF1bHQgeQo+ICAJaGVscAo+ICAJICBJZiB5b3UgaGF2ZSBhbiBIUCBKb3JuYWRhIDcw
MCBzZXJpZXMsCj4gLS0gCj4gMi4yMy4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
