Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDF29CE9D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8183C6E48D;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916026EB81
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:30:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i2so3297625ljg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xIMfAXFiMN14kIOtEDp4rVS1/lZfGWxB0FToCxiOcv0=;
 b=fLeCZRoi/NbdluOH9GChFb9hVKMiWXbyUnQsUyk4GeXxzi5Gz+jkyx1ECk6IFfsOHJ
 Z4hQ7h1ZCFVpZvWUoZyJIlMHwpbUhkydyYIyAlw3pHU57KvDJl4ziqS7CepyQTpUcj3k
 x2Yb0Gm6P3GQR4jt2PqI3/IojM63m8I7EOV6+/TML7imF4UJHfrI3kWAVF6LQtfW+KFw
 8dUTsRjnZMTD/Rrr0e1CW4Fbl1aVOiJoFnjj+LV4ELb5qi7QYLvINWmJ6XwLT68CZUt5
 W7e0OHQxvw4T94TBYncahUslEv6sdK2+WBuJ/6ao9GB3tkYLWqBRJVA3sC5BCmm5I2gH
 8/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xIMfAXFiMN14kIOtEDp4rVS1/lZfGWxB0FToCxiOcv0=;
 b=U11laiEnPtXw/omb8M/bj4PHwkLDvuo2Cupe5glY7KAvFcWC9r9BEoii9B21jlTxCv
 CfjBg8DNQqubZxTYukVT/7r2gC+SnPFOf9L0CJFsTN3YWbrWE7aSUNcUgk7OFmIfWLXq
 aMkVt1f/MkJQFcYfyCDF0LCTm0dhhU7nX4iI2BtPuv7BQBfla5js/Xupyx7ibiNRhSiv
 v9i8dBR+ikUpKhFxaghq3uPx9o9xjL4XwPixVVt7BUoBMhwqhpQU2sRM9v6Y6GzNp5PZ
 lnfFR8P3t1ee5jlzokxmcWA4mz1wjo8NeGNx0c+IdrdRdw7rqfPg8Y3Bu+wQuuUmwkuT
 P57Q==
X-Gm-Message-State: AOAM533i4frwb0MUdJaanivMSzZxARVp9z78dylAQ/voOGRzO1p8SmQh
 ZARfABBO8xDDn4F3kQkPoMo=
X-Google-Smtp-Source: ABdhPJxKa4m/gbvwQbmxgMvINe+bK5H6koZp7YuoStfXjrjjYtRl7Hc+aAnh0WptiQo+vFNmFcvw/Q==
X-Received: by 2002:a2e:b04a:: with SMTP id d10mr1947668ljl.81.1603830633050; 
 Tue, 27 Oct 2020 13:30:33 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id e140sm284016lfd.218.2020.10.27.13.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:30:32 -0700 (PDT)
Subject: Re: [PATCH v6 41/52] memory: tegra124-emc: Use
 devm_platform_ioremap_resource()
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-42-digetx@gmail.com> <20201027102707.GC17089@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d79e4972-acf9-f889-50b8-f0829a0e8e08@gmail.com>
Date: Tue, 27 Oct 2020 23:30:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027102707.GC17089@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMzoyNywgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE3OjI0QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIGhlbHBlciB3aGljaCBt
YWtlcyBjb2RlIGEgYml0Cj4+IGNsZWFuZXIuCj4gCj4gU3VjaCBjbGVhbnVwcyAoYW5kIGZldyBv
dGhlciBpbiB0aGlzIHBhdGNoc2V0KSBzaG91bGQgYmUgYXQgYmVnaW5uaW5nIG9mCj4gcGF0Y2hz
ZXQgb3IgZXZlbiBhcyBwYXJ0IG9mIGEgc2VwYXJhdGUgb25lLiAgSSB0aGluayB0aGVyZSBpcyBu
b3QgbXVjaAo+IHN0b3BwaW5nIGFueW9uZSBmcm9tIGFwcGx5aW5nIHRoZXNlLi4uIGV4Y2VwdCB0
aGF0IHlvdSBwdXQgdGhlbSBpbiB0aGUKPiBtaWRkbGUgb2YgYmlnIGRlcGVuZGVuY3kuCgpTb21l
IG9mIHRoZXNlIGNsZWFudXAgcGF0Y2hlcyBjYW4ndCBiZSBhcHBsaWVkIHNlcGFyYXRlbHkgd2l0
aG91dCBhIG5lZWQKdG8gbWFrZSBhIHJlYmFzZS4gSSB0aGluayBpdCBzaG91bGQgYmUgbW9yZSBw
cmVmZXJyZWQgdG8gaGF2ZSBhbGwgdGhlCnBhdGNoZXMgd2l0aGluIGEgc2luZ2xlIHNlcmllcy4K
CkknbGwgdHJ5IHRvIHJlb3JkZXIgdGhlIHBhdGNoZXMgaW4gdjcgaWYgdGhpcyB3aWxsIGVhc2Ug
dGhlIHJldmlldywgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
