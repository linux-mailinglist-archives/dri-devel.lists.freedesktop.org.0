Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D7211CC8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5BE6EA60;
	Thu,  2 Jul 2020 07:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB966E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:20:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so13631796ljj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 18:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dYCeMOPmLDd6YkOtzFpnQl9uCIfo9ocTM9gPN7zgGLs=;
 b=d9j4CswU2NFZCBq45rswJjWthlpogrZnyxU2Y3/qFx3SzQ/Yg010yg+KHPckVLMK7E
 sPM8Vl3sG/AcQaGYeiyAu0/y2NWDRFpN1cCGWZfSvqzvHm5OiyAxAO1Dt97pMU2E0dmk
 iS7KuYi16IoF64egljBq4I2PpWLZDdd95183IIuQ7d7bgik4N+IndnkWEQhQKukAgMZA
 s+JpJag5nHTBtAfKONT0BOIODyFke/y2jPMJiBL+CegXb4WhTK5iNesdPuPjBHoOitij
 010J4brz2P8aTqBd6+yMM3QatHxh0kZo1oOmAU8jRZ0M8hgVNeF73mXnCW8JE/+4P82m
 R9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dYCeMOPmLDd6YkOtzFpnQl9uCIfo9ocTM9gPN7zgGLs=;
 b=nGeUB8Fmbczg+swcdOOpHoUm6f5E0If505SclD4kuLJkvgu66f1mASKcBzu4oSiv4U
 X6Nk+5yUyOXsPKi9gPggtb7Bl2dWxRtEV2LSPX6tlySHIkE/EB5ZG2ajjAzBk1UbVpZN
 UenkLmLO1mGpK5SZmB4GpjQIMcmeduyLIPd+cMvEpeNL/HsmurWQDWwrksAAbvhHPatc
 s24b4iUMcH+jpndVLutXvpBVHEF1EivmaHiYZtcMbzAfgWG12+uLGTMleQP08AdYmnWt
 RlEyt+LTKLW+5XSy0yeI9W6zGZ3YjaEDv24XtdBAk0EDwiRam3Is5rE1CDuYwdcrDWAV
 yV+A==
X-Gm-Message-State: AOAM533ouuL5rWscWplaZYwZ0OMfaXNCoIZZV3ktSIYKQnr5lUVBXrdW
 2py2ZpOKbCDLUq6ZOLbFz6k=
X-Google-Smtp-Source: ABdhPJxfVjfn28q5t97TdXNmIK+RNFjKEXIoVX+Bw+Pu1pBF7C+yZ6DON9DioM1xmYHgdH2FopVzAw==
X-Received: by 2002:a2e:9818:: with SMTP id a24mr13554159ljj.280.1593652857102; 
 Wed, 01 Jul 2020 18:20:57 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id d18sm2380862lja.116.2020.07.01.18.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 18:20:56 -0700 (PDT)
Subject: Re: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe
 error
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656@epcas1p3.samsung.com>
 <20200609131404.17523-12-digetx@gmail.com>
 <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
Date: Thu, 2 Jul 2020 04:20:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDcuMjAyMCAwMzo1OSwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGksCj4gCj4gT24g
Ni85LzIwIDEwOjEzIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRlZ3JhIEVNQyBkcml2
ZXIgd2FzIHR1cm5lZCBpbnRvIGEgcmVndWxhciBrZXJuZWwgZHJpdmVyLCBpdCBhbHNvIGNvdWxk
Cj4+IGJlIGNvbXBpbGVkIGFzIGEgbG9hZGFibGUga2VybmVsIG1vZHVsZSBub3cuIEhlbmNlIEVN
QyBjbG9jayBpc24ndAo+PiBndWFyYW50ZWVkIHRvIGJlIGF2YWlsYWJsZSBhbmQgY2xrX2dldCgi
ZW1jIikgbWF5IHJldHVybiAtRVBST0JFX0RFRkVSIGFuZAo+PiB0aGVyZSBpcyBubyBnb29kIHJl
YXNvbiB0byBzcGFtIEtNU0cgd2l0aCBhIGVycm9yIGFib3V0IG1pc3NpbmcgRU1DIGNsb2NrCj4+
IGluIHRoaXMgY2FzZSwgc28gbGV0J3Mgc2lsZW5jZSB0aGUgZGVmZXJyZWQgcHJvYmUgZXJyb3Iu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4K
Pj4gLS0tCj4+ICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMgfCA5ICsrKysrKy0t
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYyBiL2RyaXZl
cnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYwo+PiBpbmRleCBlOTRhMjc4MDRjMjAuLjQyM2Rk
MzVjOTViMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5j
Cj4+ICsrKyBiL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYwo+PiBAQCAtODAxLDkg
KzgwMSwxMiBAQCBzdGF0aWMgaW50IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPj4gIAl9Cj4+ICAKPj4gIAl0ZWdyYS0+ZW1jX2Nsb2NrID0gZGV2bV9j
bGtfZ2V0KCZwZGV2LT5kZXYsICJlbWMiKTsKPj4gLQlpZiAoSVNfRVJSKHRlZ3JhLT5lbWNfY2xv
Y2spKSB7Cj4+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBnZXQgZW1jIGNsb2Nr
XG4iKTsKPj4gLQkJcmV0dXJuIFBUUl9FUlIodGVncmEtPmVtY19jbG9jayk7Cj4+ICsJZXJyID0g
UFRSX0VSUl9PUl9aRVJPKHRlZ3JhLT5lbWNfY2xvY2spOwo+PiArCWlmIChlcnIpIHsKPj4gKwkJ
aWYgKGVyciAhPSAtRVBST0JFX0RFRkVSKQo+PiArCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFp
bGVkIHRvIGdldCBlbWMgY2xvY2s6ICVkXG4iLAo+PiArCQkJCWVycik7Cj4+ICsJCXJldHVybiBl
cnI7Cj4+ICAJfQo+PiAgCj4+ICAJZXJyID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4K
PiAKPiBBcyBJIGNvbW1lbnRlZCBvbiBwYXRjaDEwLCBJIHJlY29tbWVuZCB0aGF0IHlvdSBhZGQg
dGhlIFRlZ3JhIEVNQyBkcml2ZXIKPiBjb21taXQgaW5mb3JtYXRpb24gaW50byBwYXRjaCBkZXNj
cmlwdGlvbiBhbmQgTG9va3MgZ29vZCB0byBtZS4KPiAKCkhlbGxvLCBDaGFud29vIQoKVGhpcyBw
YXRjaDExIGFuZCBwYXRjaDEwIGFyZSBkZXBlbmRpbmcgb24gdGhlIHBhdGNoZXMgNC81ICh0aGUg
VGVncmEgRU1DCmRyaXZlciBwYXRjaGVzKSBvZiAqdGhpcyogc2VyaWVzLCBoZW5jZSB0aGVyZSBp
cyBubyBjb21taXQgaW5mb3JtYXRpb24uCkknbSBleHBlY3RpbmcgdGhhdCB0aGlzIHdob2xlIHNl
cmllcyB3aWxsIGdvIHZpYSB0ZWdyYSB0cmVlIG9uY2UgYWxsIHRoZQpwYXRjaGVzIHdpbGwgYmUg
cmV2aWV3ZWQgYW5kIGNvbGxlY3QgYWxsIHRoZSBuZWNlc3NhcnkgYWNrcyBmcm9tIHlvdSwKSUND
IGFuZCBDTEsgc3Vic3lzdGVtIG1haW50YWluZXJzLgoKUGxlYXNlIGZlZWwgZnJlZSB0byBnaXZl
IHlvdXJzIGFjayB0byB0aGUgcGF0Y2hlcyAxMC8xMSBpZiB0aGV5IGFyZSBnb29kCnRvIHlvdSA6
KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
