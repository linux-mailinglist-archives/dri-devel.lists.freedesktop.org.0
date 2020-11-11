Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED92AEAA0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6ED6E03B;
	Wed, 11 Nov 2020 07:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04AC89BBE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:14:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so1650454lfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 22:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lEYEjKzJU66Ij93I8jWPRFuo7Pd1or5OxSnq43v1nCk=;
 b=u3C6K+j11FR9CFXaV+VOXGecYwd6QzEZya9r+zI3shRFCtNk2YKCxN+0npZuwEIP5C
 y824Nl/hx8yxsqA1zs7NdnQQ4rjDBNU4CDXEzxLFmOIjQEHkbFj0vh08mhIAruNoNkjO
 JSe6AuXggENBuikW7sMzMCwIVyV9mtMmIloNPUUfztbhK64OEhp8qhVFjdBPfwSDtzv0
 CFx1SNiEriNpMPICEFaLSNdvh/j6gevGUy5KZA5Itd0a6X6GNXIcEkEO8JXVXlPkWTEo
 pjW2AYh/fOcg+V51KLFlt9rZc091RaXAK5VssQMSItVKHd9NLTURjirC8byG1kwfQB4c
 hgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEYEjKzJU66Ij93I8jWPRFuo7Pd1or5OxSnq43v1nCk=;
 b=nOaKSee9dJNPZwRSrWw7RA4AJTwGf1qwJez82uMs+0HkFq5S+r7clqGM4JB+pNFcFf
 7GGaiE56r8Xg6xNW7P4Vmy01GBPxQQyO9/NrzeaRYirY8us9IXOXrB1P0PzldrIHzTOB
 CLVIOP7+38D61YjsE3klAzmjguKVkzxtIILgM8WsY4Gm/LUtNTCVQF9urSGv+wADxu8Q
 IZPRG6w9BWckpqaw7anjirLQRnhv8D5pl2ypxtrz4xUS/KH2p2hDtjv++QkbgrAU0zaX
 PoC5spNYJZAfzlO+fnwGb9MN0mioyM9X7QXxH2DIrwNf/BvH1CooZiE1sSi2v1vxuVc+
 6GAw==
X-Gm-Message-State: AOAM531pvdNWv1ZT3EHjxpZUw/KHGWfL3KzE4timNl8pLwkYr9QoUm4W
 UpCZfM2hi/aRbXoA4UfiXI8i1K+ygFU=
X-Google-Smtp-Source: ABdhPJzLehGf18xxtBKtRyrfI/6NG1g3yu2AS/fS5MEUZSbxrjK+f66FKyA/QSbiAyVs+WiZ9diPdA==
X-Received: by 2002:a19:8854:: with SMTP id k81mr2400616lfd.195.1605075283102; 
 Tue, 10 Nov 2020 22:14:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id s5sm121375lfd.58.2020.11.10.22.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 22:14:42 -0800 (PST)
Subject: Re: [PATCH v8 09/26] memory: tegra30: Support interconnect framework
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-10-digetx@gmail.com>
 <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <185e9140-fdce-29ef-68c3-aa7da02b249d@gmail.com>
Date: Wed, 11 Nov 2020 09:14:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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

MTEuMTEuMjAyMCAwODo1MywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4+ICtzdGF0aWMgaW50
IHRlZ3JhX2VtY19vcHBfdGFibGVfaW5pdChzdHJ1Y3QgdGVncmFfZW1jICplbWMpCj4+ICt7Cj4+
ICsJc3RydWN0IG9wcF90YWJsZSAqcmVnX29wcF90YWJsZSA9IE5VTEwsICpjbGtfb3BwX3RhYmxl
LCAqaHdfb3BwX3RhYmxlOwo+PiArCXUzMiBod192ZXJzaW9uID0gQklUKHRlZ3JhX3NrdV9pbmZv
LnNvY19zcGVlZG9faWQpOwo+PiArCWNvbnN0IGNoYXIgKnJuYW1lID0gImNvcmUiOwo+PiArCWlu
dCBlcnI7Cj4+ICsKPj4gKwkvKgo+PiArCSAqIExlZ2FjeSBkZXZpY2UtdHJlZXMgZG9uJ3QgaGF2
ZSBPUFAgdGFibGUgYW5kIEVNQyBkcml2ZXIgaXNuJ3QKPj4gKwkgKiB1c2VmdWwgaW4gdGhpcyBj
YXNlLgo+PiArCSAqLwo+PiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoZW1jLT5kZXYs
ICJvcGVyYXRpbmctcG9pbnRzLXYyIikpIHsKPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdSB3
YW50IHRvIGNoZWNrIHRoaXMgPyBUaGUgYmVsb3cgY2FsbCB0bwo+IGRldl9wbV9vcHBfb2ZfYWRk
X3RhYmxlKCkgd2lsbCBmYWlsIGFueXdheSBhbmQgdGhhdCBzaG91bGQgYmUgZ29vZCBmb3IKPiB5
b3UuCj4gCgpUaGUgZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKSB3aWxsIHByb2R1Y2UgYSBlcnJv
ciBtZXNzYWdlIHdoaWNoIGRvZXNuJ3QKZ2l2ZSBhIGNsdWUgYWJvdXQgd2hhdCdzIHdyb25nLCBp
LmUuIHRoYXQgZGV2aWNlLXRyZWUgbmVlZHMgdG8gYmUgdXBkYXRlZC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
