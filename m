Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EE2DDF8C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A89689829;
	Fri, 18 Dec 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A61893C9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 20:29:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m25so60959886lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GKljy0FefLQb5prsvrnmqmrfVAtuVTCWN2SoJppsiGI=;
 b=VYw3hMep39JaWr4RwvGdOrkGOk9i1d6L30sa3pEZc7Jv57OKRk5xzJobClTKgPsGz4
 Ux2rqCf61N62ecUxjuf+FhwgZuq6/I5KHRjnZ7diKnsWDfTW/SukvhsBUZlxuHES2tBx
 KA6mi1x/TTsvr79mP2iIAy6rt5BtlZov6lwj0Q/GroxAz5jbgQjbT6zgJMSIwELBKf2g
 /n0gYoohxBFjsnmUc/HOVz4oKc+nh6akNPzNKQgP+4u5qyrHWzuQTI0sEJ5e7lGr1KM4
 Iv71/evpjH/o4eVLGPr6hFsFvEMIGycEsSNOAE3yZWz2nbBq0cBhHetzYDI877dr1BgC
 x8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GKljy0FefLQb5prsvrnmqmrfVAtuVTCWN2SoJppsiGI=;
 b=LBi0hCO3fuyUc+9hn0VBGpz5gHXIFdSz3SjGQfCMUnDe/qvmegJiWm90FtK9WyFQVK
 INNvHv77B8mh3JQvwkuPcm3nRSnwgkxNSYNkOicHbh9qiyB/tlJj+5xVhvehX3AV0Zkp
 TyljFQ46LxPZ0pQMIYTbT84dWcHEESVvTlnVnV/ymM8orn4PRxJRxh5ipTlFG0BWh/H/
 DbFnPbeCfudktR8hg1UMfCKQsR1C9ZTAwwQVMeLWX55LRE9q4aBYzXKJYigMOrOpVUUP
 b03mwp8vXffl8KT4J13vov65neC76M9FOHypNdkyE9XV0VffFgmeRHnb+rTBGlW+r+nM
 RzRA==
X-Gm-Message-State: AOAM533qU1rm1yk74mBYVzyAA5Uo+HUDlQtKWZL61V5Eorm5ZkQT+PnK
 8wyXQPt2TEikMeefH8R3tzQ=
X-Google-Smtp-Source: ABdhPJyk0uEwMqjubAd1x7PylZGa1gcruRNAfNVBuufl026RTe1WSf8KkEES9wW9uq7xDnyQwzJAbA==
X-Received: by 2002:a05:651c:101:: with SMTP id
 a1mr421137ljb.277.1608236938516; 
 Thu, 17 Dec 2020 12:28:58 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id z26sm781859ljn.98.2020.12.17.12.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 12:28:57 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
 and thermal throttling
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-48-digetx@gmail.com>
 <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
 <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
 <776e0e84-e395-2bfb-f1ee-c34864b1cf16@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ce603c74-3a20-7331-36a7-d7bc43ce36b6@gmail.com>
Date: Thu, 17 Dec 2020 23:28:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <776e0e84-e395-2bfb-f1ee-c34864b1cf16@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMTIuMjAyMCAyMjozNiwgRGFuaWVsIExlemNhbm8g0L/QuNGI0LXRgjoKPj4+PiArCQkJCQl0
eXBlID0gImNyaXRpY2FsIjsKPj4+PiArCQkJCX07Cj4+Pj4gKwkJCX07Cj4+Pj4gKwo+Pj4+ICsJ
CQljb29saW5nLW1hcHMgewo+Pj4+ICsJCQkJbWFwMCB7Cj4+Pj4gKwkJCQkJdHJpcCA9IDwmdHJp
cDA+Owo+Pj4+ICsJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwIFRIRVJNQUxfTk9fTElNSVQg
VEhFUk1BTF9OT19MSU1JVD47Cj4+PiBZb3Ugc2hvdWxkIGFkZCBhbGwgQ1BVcyBoZXJlLgo+Pgo+
PiBBbGwgQ1BVIGNvcmVzIGFyZSBjb3VwbGVkIG9uIFRlZ3JhIGluIHJlZ2FyZHMgdG8gQ1BVRnJl
cSwgaGVuY2UgSSB0aGluawo+PiBpdCB3b24ndCBtYWtlIGFueSBkaWZmZXJlbmNlIGlmIHNlY29u
ZGFyeSBDUFUgY29yZXMgd2lsbCBiZSBhZGRlZCBoZXJlLAo+PiBpc24ndCBpdD8KPiBUaGUgZXhw
bGFuYXRpb24gaXMgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIGNvbW1pdCBlZjQ3MzQ1MDA0MDdjZTRk
CgpJIHRoaW5rIHRoYXQgcmVhbGx5IG9ubHkgbWFrZXMgc2Vuc2UgaWYgQ1BVIGNvcmVzIGhhdmUg
aW5kZXBlbmRlbnQgY2xvY2sKcmF0ZSBtYW5hZ2VtZW50LiBJSVJDLCBJIGFjdHVhbGx5IG1hZGUg
c29tZSByZXNlYXJjaCBhYm91dCB0aGlzIGluIHRoZQpwYXN0IGFuZCBpbnRlbnRpb25hbGx5IHJl
bW92ZWQgdGhlIHNlY29uZGFyeSBjb3JlcyBmcm9tIHRoZQpjb29saW5nLWRldmljZSBzaW5jZSB0
aGV5IGRpZG4ndCBtYWtlIGFueSBkaWZmZXJlbmNlIGZvciBhIGNvdXBsZWQgQ1BVCmNvcmVzLgoK
VGhhdCBjb21taXQgYWxzbyBzYXlzOgoKIkJ1dCBhcyBzb29uIGFzIHRoaXMgQ1BVIG9yZGVyaW5n
IGNoYW5nZXMgYW5kIGFueSBvdGhlciBDUFUgaXMgdXNlZCB0bwpicmluZyB1cCB0aGUgY29vbGlu
ZyBkZXZpY2UsIHdlIHdpbGwgc3RhcnQgc2VlaW5nIGZhaWx1cmVzLiIKCkkgZG9uJ3QgcXVpdGUg
dW5kZXJzdGFuZCB0byB3aGF0ICJmYWlsdXJlcyIgdGhhdCBjb21taXQgcmVmZXJyZXJzLiBJCnRy
aWVkIHRvIGNoYW5nZSB0aGUgY3B1MCB0byBjcHUxIGluIHRoZSBjb29saW5nLWRldmljZSBhbmQg
ZG9uJ3Qgc2VlIGFueQpmYWlsdXJlcy4gQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHRoaXM/CgpJ
biBnZW5lcmFsIGl0IHNob3VsZCBiZSBmaW5lIHRvIGFkZCBhbGwgdGhlIGNvcmVzIHRvIHRoZSBj
b29saW5nLWRldmljZQphbmQgSSdsbCBkbyBpdCBpbiB2MywgYnV0IEkgd2FudCB0byBtYWtlIGl0
IGNsZWFyIHdoeSB0aGlzIGlzIG5lZWRlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
