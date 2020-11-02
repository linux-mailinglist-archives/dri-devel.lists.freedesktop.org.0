Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D132A3EB8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666046EC1E;
	Tue,  3 Nov 2020 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F736E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:08:28 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m8so10354488ljj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hka4cKqpDMPFWpJt8TYHJB5ZlWozslgjk/byOs/Vz6Q=;
 b=lIKs4+aJlWuxFicaenX76Fiz0DWMW6nUw7wC+zfMn0PaBYMsKo2zYOP8nG8l3RoEH8
 J5J2Phmj83ZVB4hVVzqWHBDR6giS4zsN51Bs1rqw8UpAPN/6LWvditv7rEFBphh0cyI3
 mKo69CaTCMaaAQKgTMDDfGtB+bWEnFIWgq2s/oT75QBIuS1E0Gclwy7ErdoFkzucOYNk
 QY12ShXYL2dpGTnkHkUBEuqC5rxgpDCAGgryRA1CAcXhwq6aEFIQQnglHMwbUTo1wTUD
 6I88siB1KZ5vbyZdQ61YCChaBKm7wlpl4f/+XM9/SXWFMSUeOu5mX2Q25F09pDLTvCdh
 zZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hka4cKqpDMPFWpJt8TYHJB5ZlWozslgjk/byOs/Vz6Q=;
 b=fKj9xRPWITy7Vk4XOZ37/M0rRM1zV4THGQiQn28cdKoJm1DlWOQck2jRSMRZ8w9QVq
 L9K+XfJ9AJoYGIE1wNmAtxLdqQm2JsaO22HTBI50LGgjFUbc3ytXhWFw9YYR7f5XWtdn
 kY6VXKAdaSb375WFTRVg2u1eYFKi8Tmm2gF9v4KypJd3EdeFhLCWENiRvn11lSQzE0Hm
 F9bIXVjcjWw9gd7VjEJscuLqajjoxZPyzV9mu9lUh8h5HfPKNmgHfKZnPp/iR56Di6Vl
 kHc32w29fSh8OEn0WYiMHv0sDLx+a6AwUQdL3G1ycqA5KsyMAORh6a3rBs0XDv6XxDJX
 ffBg==
X-Gm-Message-State: AOAM533WKmKlQYB1Km6+pjmHEdjdN2ccrvp8PTsLhdtCXqgnR4BFIaE5
 AZowQ1I/W85Hi6BOPyUPhpg=
X-Google-Smtp-Source: ABdhPJwu9+601VtSHx9RG6K454vM9jL+o3J7hQ/5XYw2V8eE5tjRxvEHJyNtJxSvrhytwkDkKtlzXw==
X-Received: by 2002:a2e:98c2:: with SMTP id s2mr6789352ljj.339.1604347706478; 
 Mon, 02 Nov 2020 12:08:26 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id c4sm2657571lfm.294.2020.11.02.12.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 12:08:25 -0800 (PST)
Subject: Re: [PATCH v6 49/52] PM / devfreq: tegra20: Convert to EMC_STAT
 driver, support interconnect and device-tree
From: Dmitry Osipenko <digetx@gmail.com>
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-50-digetx@gmail.com>
 <CAGTfZH0KxyZYLZ_AgM7Lr+4s35kaWJp1AenpZ-o_FRLCCHC+6A@mail.gmail.com>
 <0ffa84f6-625e-807c-e9af-7a67f0fe48e7@gmail.com>
Message-ID: <bff3bf4a-8111-7c96-92f6-46343d85be0d@gmail.com>
Date: Mon, 2 Nov 2020 23:08:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ffa84f6-625e-807c-e9af-7a67f0fe48e7@gmail.com>
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

MDEuMTEuMjAyMCAxNzoxMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Ci4uLgo+IFdlIHdp
bGwgcHJvYmFibHkgbW92ZSB0aGUgVGVncmEyMCBFTUNfU1RBVCBkZXZmcmVxIGRyaXZlciBpbnRv
IHRoZQo+IG1lbW9yeSBkcml2ZXIgYW5kIHJlbW92ZSB0aGUgb2xkZXIgSU1DX1NUQVQgZHJpdmVy
IGluIHY3LCBsaWtlIGl0IHdhcwo+IHN1Z2dlc3RlZCBieSBUaGllcnJ5IFJlZGluZy4gVGhpcyB3
aWxsIGJlIGEgbXVjaCBsZXNzIGludmFzaXZlIGNvZGUgY2hhbmdlLgo+IAo+PiBBbHNvLCBpZiB5
b3Ugd2FudCB0byBnZXQgbW9yZSByZXNwb25zaXZlbmVzcywgeW91IGNvdWxkIHVzZSBkZWxheWVk
IHRpbWVyCj4+IGluc3RlYWQgb2YgZGVmZXJyYWJsZSB0aW1lciBieSBlZGl0aW5nIHRoZSBkZXZm
cmVxX2Rldl9wcm9maWxlIHN0cnVjdHVyZS4KPiAKPiBUaGFua3MsIEknbGwgdHJ5IHRoZSBkZWZl
cnJhYmxlIHRpbWVyLgoKSSB0b29rIGEgYnJpZWYgbG9vayBhdCB0aGUgZGVsYXllZCB0aW1lciBh
bmQgSSB0aGluayB0aGUgZGVmZXJyYWJsZQp0aW1lciBzaG91bGQgYmUgbW9yZSBhIHByZWZlcnJl
ZCBvcHRpb24gYmVjYXVzZSB0aGlzIGRldmZyZXEgZHJpdmUgaXMKbW9yZSBhbiBhc3Npc3RhbmNl
IGZvciB0aGUgb3B0aW1hbCBiYW5kd2lkdGggc2VsZWN0aW9uIGFuZCBpdCB3aWxsIGJlCm1vcmUg
cHJlZmVycmVkIHRvIGtlZXAgc3lzdGVtIGlkbGluZyB3aGVuZXZlciBwb3NzaWJsZS4KCk15IHBy
aW1hcnkgY29uY2VybiBpcyB0aGUgaW5pdGlhbCBwZXJmb3JtYW5jZSBsYWcgaW4gYSBjYXNlIG9m
Cm11bHRpbWVkaWEgYXBwbGljYXRpb25zLiBCdXQgdGhpcyB3aWxsIGJlIHJlc29sdmVkIGJ5IGhv
b2tpbmcgdXAKcGVyZm9ybWFuY2Ugdm90aW5nIHRvIGFsbCBkcml2ZXJzLCBvbmNlIHdlIHdpbGwg
Z2V0IGFyb3VuZCB0byBpdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
