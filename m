Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13D2A207E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75EA6EB27;
	Sun,  1 Nov 2020 17:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20FF6E1B7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 14:12:44 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 23so12094701ljv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 06:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=REz7RPg2i02sVn5unh+ejD4RRDVKEN7sf6CTpP8ALEc=;
 b=XIySwbqwwWK+H07YdaRn27fLru1bo4Dez13BPQ7ix6EB/sGw/tnwV+eIYqXBMG1iJQ
 eNxQuFSPTOeShlcgCkryhP7JQEUKAOQ3ACRMWDC+JK1/ULlD50xlY3vVtToswKJRFnTB
 LHN/C8X+aO6ALXRC3oVmNfNewiaIj5Qq7DzFimDqgYV/yYp+EaLc5HPz6T/K/KoUdu7W
 rmO6ibHNbvVBiR52XOepxbf8DsFmORuPprPmJtOzbuV37SaJmwlZKeQ1bTjOB1EsAdaj
 vJx/5Feo9XftQF6H6Od7OKSsnFPww6gcKhFcleg0OsBo2beMyoNoYOYTEL6D4n5Uq/LN
 RYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=REz7RPg2i02sVn5unh+ejD4RRDVKEN7sf6CTpP8ALEc=;
 b=Agq4T0hJ3SV1oPqZm8ef8O6LHtfHI9Kh8RZmOChR49zlUZAJbKtM4yzK5KVUOfpvsS
 3isTM7fxP3bZr8SrBWeiR2FR6jhoAXjksc2ySPTXVJ9rvN+RFVL0S1kALqsIsOiTj2eG
 SEyZ5mzOWlJ86xQc9VNvUWeXdhCt7fIjcaYW+wuRxQq9X85XWu+cuKbE9nHlRnM9lCmq
 GO7SeY8xt1niu77IETEQ2WZdAaRf4xaGA2feYQPbIcwsgGR+hHEFDhu4uyp+ON8asfXB
 Ydbq8ZXXZFTVw5N1Hn2WtYTj+Xb9LdtKn2qaecfL3D17uAO1RoExpeE65BhkffgYr0gg
 vUPw==
X-Gm-Message-State: AOAM530U5z/FNJRxKsTgHmEDE928KT3Ei8GWPA0le0yTgqG4iMGJnDnT
 MtU9UZ/bf/aJ3zpqGfnrnFA=
X-Google-Smtp-Source: ABdhPJxhAHCxnZhPTqKRzzn3oyVPFxXaMw4VchPE5jombOYQPEfMRZfjVrf1wOOg7FNtEz7hvm2v0A==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr5051440ljg.311.1604239963242; 
 Sun, 01 Nov 2020 06:12:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id a11sm1425557lfi.305.2020.11.01.06.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 06:12:42 -0800 (PST)
Subject: Re: [PATCH v6 49/52] PM / devfreq: tegra20: Convert to EMC_STAT
 driver, support interconnect and device-tree
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-50-digetx@gmail.com>
 <CAGTfZH0KxyZYLZ_AgM7Lr+4s35kaWJp1AenpZ-o_FRLCCHC+6A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0ffa84f6-625e-807c-e9af-7a67f0fe48e7@gmail.com>
Date: Sun, 1 Nov 2020 17:12:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGTfZH0KxyZYLZ_AgM7Lr+4s35kaWJp1AenpZ-o_FRLCCHC+6A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMTEuMjAyMCAxNjozMSwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IFRoaXMgcGF0Y2ggY29udGFpbnMgdGhlIHRocmVlIGZlYXR1cmVzIGFzIGZvbGxvd2luZzoK
PiAxLiBVc2UgaW50ZXJjb25uZWN0IGludGVyZmFjZSBmb3IgY29udHJvbGxpbmcgdGhlIGNsb2Nr
IGluc3RlYWQgb2YKPiBjb250cm9sbGluZyBpdCBkaXJlY2x0eQo+IDIuIFVzZSBFTUNfU1RBVCBp
bnN0ZWFkIG9mIElNQ19TVEFUCj4gMy4gQ2hhbmdlIHBvbGxpbmdfaW50ZXJ2YWwgYW5kIHVwdGhy
ZXNob2xkIGZvciBtb3JlIGZhc3QgcmVzcG9uc2l2ZW5lc3MKPiAKPiBJIHRoaW5rIHlvdSBuZWVk
IHRvIG1ha2UgdGhlIHNlcGFyYXRlIHBhdGNoZXMgZm9yIGVhY2ggcm9sZS4KPiBCdXQsIGlmIGl0
IGlzIGRpZmZpY3VsdCBvciBub3QgcHJvcGVyIHRvIHNwbGl0IG91dCAxLDIgcm9sZXMsIHlvdSBj
YW4KPiBtYWtlIHR3byBwYXRjaGVzIGZvciAxLDIgYW5kIDMgcm9sZXMuCgpIZWxsbyBDaGFud29v
LAoKV2Ugd2lsbCBwcm9iYWJseSBtb3ZlIHRoZSBUZWdyYTIwIEVNQ19TVEFUIGRldmZyZXEgZHJp
dmVyIGludG8gdGhlCm1lbW9yeSBkcml2ZXIgYW5kIHJlbW92ZSB0aGUgb2xkZXIgSU1DX1NUQVQg
ZHJpdmVyIGluIHY3LCBsaWtlIGl0IHdhcwpzdWdnZXN0ZWQgYnkgVGhpZXJyeSBSZWRpbmcuIFRo
aXMgd2lsbCBiZSBhIG11Y2ggbGVzcyBpbnZhc2l2ZSBjb2RlIGNoYW5nZS4KCj4gQWxzbywgaWYg
eW91IHdhbnQgdG8gZ2V0IG1vcmUgcmVzcG9uc2l2ZW5lc3MsIHlvdSBjb3VsZCB1c2UgZGVsYXll
ZCB0aW1lcgo+IGluc3RlYWQgb2YgZGVmZXJyYWJsZSB0aW1lciBieSBlZGl0aW5nIHRoZSBkZXZm
cmVxX2Rldl9wcm9maWxlIHN0cnVjdHVyZS4KClRoYW5rcywgSSdsbCB0cnkgdGhlIGRlZmVycmFi
bGUgdGltZXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
