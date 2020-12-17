Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151842DDFF2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE966E090;
	Fri, 18 Dec 2020 08:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B897089A4F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 21:56:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id h205so267535lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 13:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8nG3HAuO5heZzY5IBy8swXxo8V6gUQeM6w2EgX9BXJQ=;
 b=FH7Y4beKxDLn6FrH0io7GO1GcAX5VRh7n2CsH8PTCS52NL/g+LWWVpwhVjPSfruoOQ
 5feO5PmWTZEIKT8KD+uKJxOnCkSmh/oK7rEs6ZU0dpNnmuC+BYgE1edLQspvzqdHce85
 K46dHCsJiwm5jh912Pg12y96Pj9yNyGP/H9uN5s88X7sMd4pMZiioWuUhbS6PAZWq0CC
 flNZnZ8VdVz2LdVZCJj+vLBruo51dfg4tatvoTN4szFr2B2N6KhTg+RWoa6eOEazu6B5
 eLM/se9HsQwagAK1A4dLMLdX6sawyfkSf//yE+th40OP1Wy9rW614MGIGKyPp2zy/ux1
 gM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8nG3HAuO5heZzY5IBy8swXxo8V6gUQeM6w2EgX9BXJQ=;
 b=E/w+MqWLiC2G4oI8jH7dMUinQIx3f62+u1bwh8IQTyK4n/j94TI+u9OPKxO4GR3em3
 3jHnEeNFGA0nqjva/dxLlsxZi+SDrkLhcHbbekZWkHwf7FbI9UDFonBJhiAMD5xi71+P
 5GhH5vHuDH6uWkkfaVXpbnX5H/WHs/Iqiy0V891tHZfB9ty3QRAPBGR0T8Aoh3F7oJFu
 XXXQx3KZeEDOQch1aYy2+FQ1XwF3FiGRJK3uHgvGnFLcqjCvdZBoqcWY485BFftQsFoW
 dxwmVtKev0xEYCaIs1W09GUPKzjvMABUH30QG2KLkBlPCYM8ruefrFMfuy5UFLg61VtO
 0jFw==
X-Gm-Message-State: AOAM533Sh+0t/2pTzrj45JlIOIwvahbNvh2OiwuzK/ty1ApFLcGk4ggW
 bwM2IrGUovNbcwiWFucSbW0=
X-Google-Smtp-Source: ABdhPJwEQwkebdm0xE5Y65k65p4/uFmrBbkvGqy6QOWj0pr2b6l8lKWwgORn22Sw3y8I8JTXiGH9dQ==
X-Received: by 2002:a05:6512:358d:: with SMTP id
 m13mr300445lfr.435.1608242175976; 
 Thu, 17 Dec 2020 13:56:15 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id 20sm708668lfd.237.2020.12.17.13.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 13:56:15 -0800 (PST)
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
 <ce603c74-3a20-7331-36a7-d7bc43ce36b6@gmail.com>
 <6afaf91c-d0ce-265d-4b71-0ea8da19918b@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d6f5fb01-7fda-d08c-f909-b0f4ae731b74@gmail.com>
Date: Fri, 18 Dec 2020 00:56:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6afaf91c-d0ce-265d-4b71-0ea8da19918b@linaro.org>
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

MTguMTIuMjAyMCAwMDoxOSwgRGFuaWVsIExlemNhbm8g0L/QuNGI0LXRgjoKPiBPbiAxNy8xMi8y
MDIwIDIxOjI4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDE3LjEyLjIwMjAgMjI6MzYsIERh
bmllbCBMZXpjYW5vINC/0LjRiNC10YI6Cj4+Pj4+PiArCQkJCQl0eXBlID0gImNyaXRpY2FsIjsK
Pj4+Pj4+ICsJCQkJfTsKPj4+Pj4+ICsJCQl9Owo+Pj4+Pj4gKwo+Pj4+Pj4gKwkJCWNvb2xpbmct
bWFwcyB7Cj4+Pj4+PiArCQkJCW1hcDAgewo+Pj4+Pj4gKwkJCQkJdHJpcCA9IDwmdHJpcDA+Owo+
Pj4+Pj4gKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVS
TUFMX05PX0xJTUlUPjsKPj4+Pj4gWW91IHNob3VsZCBhZGQgYWxsIENQVXMgaGVyZS4KPj4+Pgo+
Pj4+IEFsbCBDUFUgY29yZXMgYXJlIGNvdXBsZWQgb24gVGVncmEgaW4gcmVnYXJkcyB0byBDUFVG
cmVxLCBoZW5jZSBJIHRoaW5rCj4+Pj4gaXQgd29uJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZSBpZiBz
ZWNvbmRhcnkgQ1BVIGNvcmVzIHdpbGwgYmUgYWRkZWQgaGVyZSwKPj4+PiBpc24ndCBpdD8KPj4+
IFRoZSBleHBsYW5hdGlvbiBpcyBpbiB0aGUgZGVzY3JpcHRpb24gb2YgY29tbWl0IGVmNDczNDUw
MDQwN2NlNGQKPj4KPj4gSSB0aGluayB0aGF0IHJlYWxseSBvbmx5IG1ha2VzIHNlbnNlIGlmIENQ
VSBjb3JlcyBoYXZlIGluZGVwZW5kZW50IGNsb2NrCj4+IHJhdGUgbWFuYWdlbWVudC4gCj4gCj4g
QVRNIEkgZGlkIG5vdCBzZWUgYW55IEFSTSBwbGF0Zm9ybSBoYXZpbmcgYSBjbG9jayBsaW5lIHBl
ciBDUFUgYnV0IEkgbWF5Cj4gYmUgd3JvbmcuCj4gCj4+IElJUkMsIEkgYWN0dWFsbHkgbWFkZSBz
b21lIHJlc2VhcmNoIGFib3V0IHRoaXMgaW4gdGhlCj4+IHBhc3QgYW5kIGludGVudGlvbmFsbHkg
cmVtb3ZlZCB0aGUgc2Vjb25kYXJ5IGNvcmVzIGZyb20gdGhlCj4+IGNvb2xpbmctZGV2aWNlIHNp
bmNlIHRoZXkgZGlkbid0IG1ha2UgYW55IGRpZmZlcmVuY2UgZm9yIGEgY291cGxlZCBDUFUKPj4g
Y29yZXMuCj4+Cj4+IFRoYXQgY29tbWl0IGFsc28gc2F5czoKPj4KPj4gIkJ1dCBhcyBzb29uIGFz
IHRoaXMgQ1BVIG9yZGVyaW5nIGNoYW5nZXMgYW5kIGFueSBvdGhlciBDUFUgaXMgdXNlZCB0bwo+
PiBicmluZyB1cCB0aGUgY29vbGluZyBkZXZpY2UsIHdlIHdpbGwgc3RhcnQgc2VlaW5nIGZhaWx1
cmVzLiIKPj4KPj4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRvIHdoYXQgImZhaWx1cmVzIiB0
aGF0IGNvbW1pdCByZWZlcnJlcnMuIEkKPj4gdHJpZWQgdG8gY2hhbmdlIHRoZSBjcHUwIHRvIGNw
dTEgaW4gdGhlIGNvb2xpbmctZGV2aWNlIGFuZCBkb24ndCBzZWUgYW55Cj4+IGZhaWx1cmVzLiBD
b3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgdGhpcz8KPj4KPj4gSW4gZ2VuZXJhbCBpdCBzaG91bGQg
YmUgZmluZSB0byBhZGQgYWxsIHRoZSBjb3JlcyB0byB0aGUgY29vbGluZy1kZXZpY2UKPj4gYW5k
IEknbGwgZG8gaXQgaW4gdjMsIGJ1dCBJIHdhbnQgdG8gbWFrZSBpdCBjbGVhciB3aHkgdGhpcyBp
cyBuZWVkZWQuCj4gCj4gQUZBSVIsIGlmIENQVTAgaXMgdW5wbHVnZ2VkIHRoZSBjb29saW5nIGRl
dmljZSBjYW4gbm90IHJlYmluZCB0byBDUFUxLgo+IEFuZCBpZiBDUFUwIGlzIHBsdWdnZWQgaW4g
YWdhaW4sIHRoZSBjb29saW5nIGRldmljZSBmYWlscyB0byBpbml0aWFsaXplLgo+IAo+IEFuZCwg
aWYgdGhlIENQVXMgYXJlIG1hcHBlZCB3aXRoIHRoZSBwaHlzaWNhbCBDUFUwIHRvIExpbnV4IG51
bWJlcmluZwo+IENQVTEsIHRoZSBjb29saW5nIGRldmljZSBtYXBwaW5nIHdpbGwgZmFpbC4KCkFs
cmlnaHQsIHRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
