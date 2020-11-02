Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF32A3E8C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4286EC09;
	Tue,  3 Nov 2020 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBD26E301
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:00:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b1so18976909lfp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fmGeQz4Og6FDipaMU7MfHyA+Ho1Q2EbyeVQm7OOUMbk=;
 b=Met36lmBPZbI3Bg/Pi0BDLI/08hKmflwudKsCksniYRSnC2W/wiUPktXMcCMYINb+O
 rnW3KpYgGqt6fxwfqGSoOmb4XiPe3VezWY7KCiemXYzWkwNgSEGpOgUogVpm09EeZivV
 xIgQ/72kcfGJSipTedh4kjJc48ivxagpm/moGDHqHS/jm2iNCk4KY/KZ7aWfTGumeg7n
 CwFwoVUuEoXAZz1cgjbeIJAtWqlAxKUci6wnx2w/PRfbQWjp6xzpnK+i5K8n1hdDrO1z
 +nnfSO1vJ9GcSOU8KxsEicROpjhfr3ZgX6xqqRr7xqWzgo4/xB1cn7CdgvRcWL96lURq
 PUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fmGeQz4Og6FDipaMU7MfHyA+Ho1Q2EbyeVQm7OOUMbk=;
 b=lzlL4/1R8hnML5MYb1h3kWYE04A5GhYZzOGQCrsrbYXeo+tBFhMKQ6f86fyzbJPO/y
 MqrIQH9sfShqCqLA1+XspWoHxvldMfak1uKit/dKaufYuDmppilyQH60KOFrvJZIXZ2i
 yKAcHNu2PhJdGz/6ieYKrbX9ZDHyAwrkfRD3SIPr7Z4DCg/a0HuFHErID9KM2sK832eU
 jcu3UZc9sBSTAuuFe//7Wk6LJW22r0L3BmOlszv0CRH5IRhnyFNNXtsTk+5YH7AmmtEO
 P876xBEK5QtFT7b72mxuRTkBS7sB9ezVjs1odkSm5bd36wOs2dC7+c72Q9ButKppHZj8
 YQBA==
X-Gm-Message-State: AOAM533M/5gFzwgopUSGthpoOQHXhNIyHRQ6TSIr4oM1ODBLlYXdd9el
 Bpf2WBV6XKVbJfoadnOYpxY=
X-Google-Smtp-Source: ABdhPJzGAN9ixbmRmzZSK6h8lOS09fz7Yt/jWFfwFXsjxUpkLxmWqAQ38fK9Cv8CucOCcjXzDPd2iw==
X-Received: by 2002:a19:5f5c:: with SMTP id a28mr6131558lfj.434.1604347234537; 
 Mon, 02 Nov 2020 12:00:34 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id h26sm2932372ljl.55.2020.11.02.12.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 12:00:33 -0800 (PST)
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH1PV4r-pD=zTKD71nQb5+UobJKa5mBv-Nb2ZgSubkscjA@mail.gmail.com>
 <2ebd184c-60e8-19e2-9965-19481ced1c70@gmail.com>
 <CAGTfZH0=6R02euOR3JHgA0iLq5++Yvp3Z_wBCEs7bzkfuorEFQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <85772f5b-1b3d-5bff-7b2e-5b00b83c8a20@gmail.com>
Date: Mon, 2 Nov 2020 23:00:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGTfZH0=6R02euOR3JHgA0iLq5++Yvp3Z_wBCEs7bzkfuorEFQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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

MDEuMTEuMjAyMCAxODo0NCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4+PiBJIHJlY29tbWVu
ZCB0aGF0IHlvdSB1c2UgZGV2X3BtX29wcF9vZl9nZXRfb3BwX2Rlc2Nfbm9kZSgmcGRldi0+ZGV2
KQo+Pj4gdG8gY2hlY2sgd2hldGhlciBhIGRldmljZSBjb250YWlucyBvcHAtdGFibGUgb3Igbm90
Lgo+PiBJJ20gbm90IHN1cmUgd2hhdCBhcmUgdGhlIGJlbmVmaXRzLCB0aGlzIHdpbGwgbWFrZSBj
b2RlIGxlc3MKPj4gZXhwcmVzc2l2ZS9yZWFkYWJsZSBhbmQgd2Ugd2lsbCBuZWVkIHRvIGFkZCBl
eHRyYSBvZl9ub2RlX3B1dCgpLCB3aGljaAo+PiBkZXZpY2VfcHJvcGVydHlfcHJlc2VudCgpIGhh
bmRsZXMgZm9yIHVzLgo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGdpdmUgdGhlIHJhdGlvbmFsZT8K
PiBJTU8sICdvcGVyYXRpbmctcG9pbnRzLXYyJyB3b3JkIHdhcyBkZWZpbmVkIG9uIE9QUCBjb3Jl
LiBJIHRoaW5rIHRoYXQKPiB0aGUgZXh0ZXJuYWwgdXNlcgo+IG9mIE9QUCBiZXR0ZXIgdG8gdXNl
IHRoZSBwdWJsaWMgaGVscGVyIGZ1bmN0aW9uIGluc3RlYWQgb2YgdXNpbmcgdGhlCj4gaW50ZXJ2
YWwgZGVmaW5pdGlvbgo+IG9yIHZhbHVlIG9mIE9QUCBjb3JlIGRpcmVjdGx5LiBCYXNpY2FsbHks
IEkgcHJlZmVyIHRoZSBwcm92aWRlZCBoZWxwZXIKPiBmdW5jdGlvbiBpZiB0aGVyZS4KPiBCdXQs
IGl0IGlzIG5vdCBjcml0aWNhbCBhbmQgZG9lc24ndCBhZmZlY3QgdGhlIG9wZXJhdGlvbi4gSWYg
eW91IHdhbnQKPiB0byBrZWVwLCBpdCBpcyBvay4KPiAKCkknbGwgcHJlZmVyIHRvIGtlZXAgaXQg
c2luY2UgaXQncyBiZXR0ZXIgZm9yIHRoZSByZWFkYWJpbGl0eSBvZiB0aGUKY29kZSwgdGhhbmtz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
