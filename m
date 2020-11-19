Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173232BA4DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D0D6E899;
	Fri, 20 Nov 2020 08:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDD26E802
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 21:04:14 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f11so10334279lfs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 13:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vuoOcEDX9Qk97tEXio5KifV8glbdNQVJZyvTphvDqvk=;
 b=Z7nCUKE/RQ9qg0YGyxWOSuPZzYClCIPVG4dDKfgZzvnvTz+99/YQDvGHCnf2I8CnGW
 pkAsHgEoGSwjk8OYL63JspMqMqxAzRUP5d0wxkfE4lVzgYFcZMXxvfmRsSvUvWQPyP7x
 LahO0WpXbtbIKsm9ZwYvUbynYvK0V0wg/JbPCCP5/9fsQDK9lQ3hCVM+eaEDvrFjMMMt
 DjRG4PfvdeoM2ECV8SP01up2ardmTKM4KOC/SwGwFlTeWnVtvfcswkdL+mxdxijByohA
 49fnigdv7xhIi6jPOhXAN2/jDVK5yfVH2dXU5Zi4oxPj+yCg+xe9hQfco0qZEaGUeZfI
 NVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vuoOcEDX9Qk97tEXio5KifV8glbdNQVJZyvTphvDqvk=;
 b=rk1H/12V9OsWyu7JawTrGe9ZrY6fgS5H/Ebfd9Yzt5syZCV3KHRWVX7PdcyYPnjxUe
 t4jq8ROCo1VUu2iXvqci/FhszsX9WLsE+ecOU+qN0+xkBOGQFLhT1bFz4sGI5GYN1etr
 xIbTtq1xgLoh0mrozMrWuyVtyJ5r2lQ97ANPx9IM/XwbZW5uO8Sn8GgN2DizngRUNbDm
 czEXrFePm076pY8q/RN0POm9MW29Y68StUAh8L532krV1EZ8k4rXq2ftTw1qMLRyiESJ
 YC0il2L85kvGF9u3WKUS4byygWNzavX0nU1mNXOB6IeTwAAQWPaDddElHvlEcwpY6rSs
 vTDg==
X-Gm-Message-State: AOAM530l2pR+fvH2g5G7yvmy4v0zxvpP5LcWUmF/RQp5efYIaAhPS3f/
 XooPyA+2/W9pZ7HX6DIJ/36317/jEzI=
X-Google-Smtp-Source: ABdhPJy+CtxWZMIEcLdTw+ve3E4A1aRfbrnZczo8enZeKkTgfMpY2z1d+lCeAwy727IwHQB3omIh1g==
X-Received: by 2002:a19:2390:: with SMTP id j138mr6480480lfj.390.1605819853222; 
 Thu, 19 Nov 2020 13:04:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id y11sm91684lfl.119.2020.11.19.13.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:04:12 -0800 (PST)
Subject: Re: [PATCH v9 07/17] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-8-digetx@gmail.com>
 <20201117100705.i62qr4gosvu76o22@vireshk-i7>
 <956315a9-e806-3b18-6792-f01057a6c511@gmail.com>
 <20201118042117.q6nkwm7exakgfvu3@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <150be162-cb1a-4e30-8937-e99cd1c4255b@gmail.com>
Date: Fri, 20 Nov 2020 00:04:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201118042117.q6nkwm7exakgfvu3@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Nov 2020 08:41:40 +0000
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

MTguMTEuMjAyMCAwNzoyMSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Ci4uLgo+Pj4+ICsJLyog
bGVnYWN5IGRldmljZS10cmVlcyBkb24ndCBoYXZlIE9QUCB0YWJsZSBhbmQgbXVzdCBiZSB1cGRh
dGVkICovCj4+Pj4gKwlpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCZwZGV2LT5kZXYsICJv
cGVyYXRpbmctcG9pbnRzLXYyIikpIHsKPj4+PiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4+Pj4g
KwkJCSJPUFAgdGFibGUgbm90IGZvdW5kLCBwbGVhc2UgdXBkYXRlIHlvdXIgZGV2aWNlIHRyZWVc
biIpOwo+Pj4+ICsJCXJldHVybiAtRU5PREVWOwo+Pj4+ICsJfQo+Pj4+ICsKPj4+Cj4+PiBZb3Ug
Zm9yZ290IHRvIHJlbW92ZSB0aGlzID8KPj4KPj4gWWVzLCBnb29kIGNhdGNoLiBJJ20gcGxhbm5p
bmcgdG8gcmVwbGFjZSB0aGlzIGNvZGUgd2l0aCBhIGNvbW1vbiBoZWxwZXIKPj4gc29tZXRpbWUg
c29vbiwgc28gaWYgdGhlcmUgd29uJ3QgYmUgYW5vdGhlciByZWFzb25zIHRvIG1ha2UgYSBuZXcK
Pj4gcmV2aXNpb24sIHRoZW4gSSdkIHByZWZlciB0byBrZWVwIGl0IGFzLWlzIGZvciBub3cuCj4g
Cj4gWW91IHNob3VsZCBqdXN0IHJlcGxhY2UgdGhpcyBwYXRjaCBvbmx5IHdpdGggYSB2ZXJzaW9u
IG9mIFY5LjEgYW5kIHlvdQo+IGFyZW4ndCByZWFsbHkgcmVxdWlyZWQgdG8gcmVzZW5kIHRoZSB3
aG9sZSBzZXJpZXMuIEFuZCB5b3Ugc2hvdWxkIGZpeAo+IGl0IGJlZm9yZSBpdCBnZXRzIG1lcmdl
ZC4gVGhpcyBpc24ndCBhIGZvcm1hdHRpbmcgaXNzdWUgd2hpY2ggd2UganVzdAo+IGxldCB0aHJv
dWdoLiBJIHRydXN0IHlvdSB3aGVuIHlvdSBzYXkgdGhhdCB5b3Ugd2lsbCBmaXggaXQsIGJ1dCB0
aGlzCj4gbXVzdCBiZSBmaXhlZCBub3cuCj4gCgpTaG91bGQgYmUgZWFzaWVyIHRvIHJlc2VuZCBp
dCBhbGwuIEknbGwgdXBkYXRlIGl0IG92ZXIgdGhlIHdlZWtlbmQsIHRoYW5rcy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
