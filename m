Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C0211CEF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EAA6EA8A;
	Thu,  2 Jul 2020 07:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C476E973
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:10:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so23182528wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iAmyBjucUvreoEWUkZI20ibgdJNiBgFXx30xaPRx/xA=;
 b=XQeaH6yImlrDYYtsz2DYYzhZxlJeHDLUCXIQgmDtV4cDt+Vg9j1u7dzc3i0Ztyu2eK
 pENtT9q/u4vBspnrp0m79+afEEjVjqFE77KyHErg4GkdaDme6bkBkSogsJLMqqhZZ6I8
 kZ/iymGAY/Mpas6XlQpSdNn40Q+x13ItoIe8EV/ZURuiBFBSiPucrjg3empJwZlUAS3m
 nH5QPfqfZqrXJvMriu7434qy9r3qdezjm+c4LqNHZJqXyeMmXmtSctd5NyMznTOAtHCP
 X1/8AYdfLP4YSw3kPCaqutzuIDdWEIRuMcodEFPJBssvk8PBCHpp0iZJZj1GDXZaOjFF
 jzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iAmyBjucUvreoEWUkZI20ibgdJNiBgFXx30xaPRx/xA=;
 b=n9yejbdbf3wcSTzV9qA876PP4TEhQ91DUfZ7AjYDnXTUJjbJIgpS8RbBDVxrYJtyFW
 kS4e57Pp13CUwwho6odB0CMxfUr/CBvtHblqft4Knm9YdVyg2wlIy+qweRg4+TvOjeVV
 oeZXGJ6wtU92ZOOxsJas9Crkg2EJJp+UzwB5n7BpN+4hrFp4Ddtiut7xuEKdnHLv2w/c
 3IxF6N+7GuMww4oplrUk3CySZSmpKGlEILzYCAd5NjqwAgJk0jiNrdtQjNEyFg+LSh4S
 zduJOxiS6e3DawrztSSbBivZXBPHlkMaRXkg3Kiz+KWKOW0Ibw2VFvKybvFoWkXhzJG8
 0avA==
X-Gm-Message-State: AOAM5305uby8DY7geXWBb79A8qkG+ED0GIQ8Nmuh4Vfs6rXzg5jitb54
 jkJzjvmifAloyLQf5ZNHga2K6Q==
X-Google-Smtp-Source: ABdhPJxRoAZIiKa74FbFTUsZV5KAVRLjCbHIpX1rcXcl+CjO9DLVFf0U2JKCm6Ho81pYAcVBNxxOpg==
X-Received: by 2002:a1c:5986:: with SMTP id
 n128mr15892330wmb.112.1593623412008; 
 Wed, 01 Jul 2020 10:10:12 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id a15sm9444906wrh.54.2020.07.01.10.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:10:11 -0700 (PDT)
Subject: Re: [PATCH v4 27/37] interconnect: Relax requirement in
 of_icc_get_from_provider()
To: Dmitry Osipenko <digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-28-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <3b410ea3-26d3-6f7a-213c-40dbabbde8d1@linaro.org>
Date: Wed, 1 Jul 2020 20:10:09 +0300
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-28-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gNi85LzIwIDE2OjEzLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gRnJv
bTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+IAo+IFRoaXMgcGF0Y2gg
cmVsYXhlcyB0aGUgY29uZGl0aW9uIGluIG9mX2ljY19nZXRfZnJvbV9wcm92aWRlcigpIHNvIHRo
YXQgaXQKPiBpcyBubyBsb25nZXIgcmVxdWlyZWQgdG8gc2V0ICNpbnRlcmNvbm5lY3QtY2VsbHMg
PSA8MT4gaW4gdGhlIERULiBJbiBjYXNlCj4gb2YgdGhlIGRldmZyZXEgZHJpdmVyIGZvciBleHlu
b3MtYnVzLCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiBbZGlnZXR4QGdt
YWlsLmNvbTogYWRkZWQgY2VsbHNfbnVtIGNoZWNraW5nIGZvciBvZl9pY2NfeGxhdGVfb25lY2Vs
bCgpXQo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4K
CkkgaGF2ZSBhbHJlYWR5IGFwcGxpZWQgdGhlIG9yaWdpbmFsIHBhdGNoIGJ5IEFydHVyLCBzbyBw
bGVhc2UgbWFrZSB0aGUgY2VsbHNfbnVtCmNoZWNrIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGFua3Ms
Ckdlb3JnaQoKPiAtLS0KPiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jIHwgMTEgKysrKysr
KysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jIGIvZHJpdmVycy9p
bnRlcmNvbm5lY3QvY29yZS5jCj4gaW5kZXggZTVmOTk4NzQ0NTAxLi5jYjE0MzQyMWNhNjcgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCj4gKysrIGIvZHJpdmVycy9p
bnRlcmNvbm5lY3QvY29yZS5jCj4gQEAgLTMzOSw3ICszMzksNyBAQCBzdGF0aWMgc3RydWN0IGlj
Y19ub2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAq
c3BlYykKPiAgCXN0cnVjdCBpY2Nfbm9kZSAqbm9kZSA9IEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7
Cj4gIAlzdHJ1Y3QgaWNjX3Byb3ZpZGVyICpwcm92aWRlcjsKPiAgCj4gLQlpZiAoIXNwZWMgfHwg
c3BlYy0+YXJnc19jb3VudCAhPSAxKQo+ICsJaWYgKCFzcGVjKQo+ICAJCXJldHVybiBFUlJfUFRS
KC1FSU5WQUwpOwo+ICAKPiAgCW11dGV4X2xvY2soJmljY19sb2NrKTsKPiBAQCAtOTY3LDYgKzk2
NywxNSBAQCBFWFBPUlRfU1lNQk9MX0dQTChpY2Nfbm9kZXNfcmVtb3ZlKTsKPiAgICovCj4gIGlu
dCBpY2NfcHJvdmlkZXJfYWRkKHN0cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyKQo+ICB7Cj4g
KwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcHJvdmlkZXItPmRldi0+b2Zfbm9kZTsKPiArCXUz
MiBjZWxsc19udW07Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWVyciA9IG9mX3Byb3BlcnR5X3JlYWRf
dTMyKG5wLCAiI2ludGVyY29ubmVjdC1jZWxscyIsICZjZWxsc19udW0pOwo+ICsJaWYgKFdBUk5f
T04oZXJyKSkKPiArCQlyZXR1cm4gZXJyOwo+ICsJaWYgKFdBUk5fT04ocHJvdmlkZXItPnhsYXRl
ID09IG9mX2ljY194bGF0ZV9vbmVjZWxsICYmIGNlbGxzX251bSAhPSAxKSkKPiArCQlyZXR1cm4g
LUVJTlZBTDsKPiAgCWlmIChXQVJOX09OKCFwcm92aWRlci0+c2V0KSkKPiAgCQlyZXR1cm4gLUVJ
TlZBTDsKPiAgCWlmIChXQVJOX09OKCFwcm92aWRlci0+eGxhdGUpKQo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
