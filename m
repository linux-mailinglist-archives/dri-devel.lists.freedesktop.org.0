Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7DF2B0102
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991436E197;
	Thu, 12 Nov 2020 08:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C331D6E037
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:08:11 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id e27so3301665lfn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LHvXV2kmqfCvFfKCOYzmtXPEAteV60xqIVKGiujdMpY=;
 b=U9cD5jlnZqzk6ZCMmI2ELj+L2+qxFbClK/3/2fRC5UhG+8kSOaSIhEDeImnrtZ442B
 4ehc0ZUi0WycwJd6FABCVOSUmCQIQJvaTRz3nTFEKZzMEy/GQVxE/teL37gy2EmbsnDY
 TLoaD4KbOM1SvFQdmTdpPhb1AJF21ZfAHLLQdLQmDZGXKVdKIqYkPN8kdsy0/rt0DCqi
 Ttv7PT+23g5FO7QLZPv8e8B5p/I38/sTTEFmOI9MddGrCIUJDDtc4x36pJ3XzktySr5F
 TSj8SkePimEGsCznB1AcTSHmkxBEabttgzce3OGZsGXN/v7vcmZTcyDNTmGVbnFaWRG1
 hIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LHvXV2kmqfCvFfKCOYzmtXPEAteV60xqIVKGiujdMpY=;
 b=niHpFLxL3U8kyJ+mrbHC/M36dDrItFoht8PxA8a3xax8aJ0vPTvQ9fyQRSKGYq4SCh
 6VERhThpzBFrEYbO+sy1g4EanlNsifvSTt2YwSRmfeegOelQLXV+/ezyM+DsW8fTRalC
 wDTbcr7qeLQeSbGrmEL0z6Rh/0Vt5UrhnC/j3grsfTxscuvc33lGOKEHagALbtR7VMt8
 MonFGj3OoNmPrV8Z2KYVnfx5AKUYnN7fG/Wc4hcAeGTzylWKgO1Fb8u4FPz6DwmteIxu
 wf4/V6Sj8y2DDB2CbN5GqyCG82phq1ex5Cd3KOOXGycIfgAJj+TEYw0g4U0ZH/La7psZ
 4JjQ==
X-Gm-Message-State: AOAM532bskTVI+Y2OG/toG/R6W9VfBKGaXwJBPJDtfvmajjl/SjnR9dC
 1B7UfImUFlOdXLuT8nthyafRW/yyttc=
X-Google-Smtp-Source: ABdhPJyJuXZQ+wqXZ67sRla82+eaC3FA04CxCwIzaymyQabbK1aGONYj5LMmAEiiozxq/aRiBW7laA==
X-Received: by 2002:a19:6551:: with SMTP id c17mr5471726lfj.46.1605103689744; 
 Wed, 11 Nov 2020 06:08:09 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id 136sm232266lfb.62.2020.11.11.06.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 06:08:08 -0800 (PST)
Subject: Re: [PATCH v8 09/26] memory: tegra30: Support interconnect framework
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-10-digetx@gmail.com>
 <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
 <185e9140-fdce-29ef-68c3-aa7da02b249d@gmail.com>
 <20201111061855.2azilyhfoxwzpoir@vireshk-i7>
 <7f5c15c6-44d2-c997-442c-8f6670794f0e@gmail.com>
 <20201111075402.y52c2zwcw74eeyko@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <406ecffe-6df5-0fbf-b608-606372ed95dc@gmail.com>
Date: Wed, 11 Nov 2020 17:08:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201111075402.y52c2zwcw74eeyko@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAxMDo1NCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTEtMTEtMjAs
IDEwOjMyLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDExLjExLjIwMjAgMDk6MTgsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMTEtMTEtMjAsIDA5OjE0LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gVGhlIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkgd2lsbCBwcm9kdWNl
IGEgZXJyb3IgbWVzc2FnZSB3aGljaCBkb2Vzbid0Cj4+Pj4gZ2l2ZSBhIGNsdWUgYWJvdXQgd2hh
dCdzIHdyb25nLCBpLmUuIHRoYXQgZGV2aWNlLXRyZWUgbmVlZHMgdG8gYmUgdXBkYXRlZC4KPj4+
Cj4+PiBJZiB5b3UgdGhpbmsgdGhhdCB5b3UgbmVlZCB0byBwcmludCBzb21ldGhpbmcgbW9yZSwg
dGhlbiB5b3UgY2FuIGRvCj4+PiB0aGF0IGluIHRoZSBlcnJvciBtZXNzYWdlIHlvdSBwcmludCB3
aGVuIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkKPj4+IGZhaWxzLiBJIHdvdWxkIHN1Z2dlc3Qg
dG8gZHJvcCB0aGlzIHJlZHVuZGFudCBjaGVjayBoZXJlLgo+Pj4KPj4KPj4gUGxlYXNlIGdpdmUg
dGhlIHJhdGlvbmFsZS4KPiAKPiBUaGUgcmF0aW9uYWxlIGlzIHRoYXQgdGhlIGNoZWNrIGlzIGFs
cmVhZHkgcGVyZm9ybWVkIGJ5Cj4gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKSBhbmQgaXQgaXNu
J3QgZ29pbmcgdG8gYWRkICphbnkqIGJlbmVmaXQgdG8KPiBjaGVjayBpdCBhZ2FpbiBoZXJlLiBT
dWNoIGEgY2hlY2sgZm9yIG1hdGNoaW5nIGNvbXBhdGlibGUgcGxhdGZvcm1zIGlzCj4gbm9ybWFs
bHkgZmluZSwgYnV0IG5vdCBmb3IgdGhpcy4gVGhpcyBpcyBsaWtlIG9wZW4gY29kaW5nIHBhcnQg
b2YKPiBkZXZfcG1fb3BwX29mX2FkZF90YWJsZSgpLCBhbmQgc28gaXMgcmVkdW5kYW50LiBUaGUK
PiBkZXZfcG1fb3BwX29mX2FkZF90YWJsZSgpIGhlbHBlciBhbHNvIGNoZWNrcyBmb3IgT1BQdjEg
YmluZGluZ3MgaW4gdGhlCj4gRFQgKHllcyB5b3Ugd29uJ3QgYmUgdXNpbmcgdGhlbSBvbiB5b3Vy
IHBsYXRmb3JtKSBhbmQgc28gcmVseWluZyBvbgo+IHRoYXQgQVBJIGlzIGEgYmV0dGVyIHRoaW5n
IHRvIGRvLgo+IAo+IEFzIHlvdSBhbHJlYWR5IHNhaWQsIHlvdSBqdXN0IHdhbnRlZCBhIGJldHRl
ciBwcmludCBtZXNzYWdlIGFuZCBzbyB5b3UKPiBoYXZlIGFkZGVkIHRoaXMgY2hlY2suIElmIHlv
dSByZWFsbHkgY2FyZSBvbmx5IGFib3V0IHRoZSBwcmludAo+IG1lc3NhZ2UsIHRoZW4geW91IGNh
biBhZGQgYSBwcmludCBvZiB5b3VyIGNob2ljZSBpbiB0aGUgZHJpdmVyIGJ1dAo+IG90aGVyd2lz
ZSB0aGlzIGNoZWNrIGlzIG5vdCBnb2luZyB0byBiZW5lZml0IHlvdSBtdWNoIEkgYW0gYWZyYWlk
Lgo+IAo+IEhhdmluZyBzYWlkIHRoYXQsIHRoaXMgaXNuJ3QgdGhlIGNvZGUgSSBtYWludGFpbi4g
SSBuZWVkIHRvIGd1YXJhbnRlZQo+IHRoYXQgdGhlIE9QUCBjb3JlIEFQSXMgYXJlIHVzZWQgcHJv
cGVybHkgYW5kIGFyZSBub3QgbWlzdXNlZCBhbmQgc28gSQo+IGhhdmUgYSBoaWdoZXIgc2F5IHRo
ZXJlLiBCdXQgaW4gdGhpcyBjYXNlIGFsbCBJIGNhbiBkbyBpcyBfc3VnZ2VzdF8KPiBhbmQgbm90
IGVuZm9yY2UuIEFuZCBhcyBJIHNhaWQgZWFybGllciwgSSBzdWdnZXN0IHRvIGRyb3AgdGhpcwo+
IHJlZHVuZGFudCBjaGVjayBpbiBvcmRlciB0byBtYWtlIHlvdXIgY29kZSBiZXR0ZXIgYW5kIGZh
c3Rlci4KPiAKPiBUaGFua3MuCj4gCgpJIHRvb2sgYSBjbG9zZXIgbG9vayBhbmQgdHVybmVkIG91
dCB0aGF0IGRldm1fcG1fb3BwX29mX2FkZF90YWJsZSgpCnNpbGVudGx5IHJldHVybnMgLUVOT0RF
ViBpZiBPUFAgaXMgbWlzc2luZyBpbiBhIERULiBIZW5jZSBpbmRlZWQgaXQKc2hvdWxkIGJlIGdv
b2QgdG8gZHJvcCB0aGUgcHJvcGVydHktY2hlY2suIEknbGwgaW1wcm92ZSBpdCBpbiB0aGUgbmV4
dApyZXZpc2lvbiwgdGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
