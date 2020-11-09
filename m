Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07C2AB2CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32D189688;
	Mon,  9 Nov 2020 08:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD98938F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 04:47:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 23so8681895ljv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 20:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cLiYnZqbbTYE+Gmw/2Cct5bDgH44FThPRJ7yw1uOIgg=;
 b=q2vWN2tcxbRALqh8OhrgcjDqiOjQbYaIcNRVNh3xuY/yQantgDrl9u9nLrJnRUv9hA
 ozelSxwbh5ozbLSshRt26t0nn4JgOue72bFZttfyw0OBrgyxy/0q3YUfYR1pgzipa1SN
 6rHhFDgY16ZfVDrPNbw8QVvyGqs9wQGx8X/2T03ASxqQRgNE0dCDud32D9uGfGNfmZew
 AenTGWzR9MZaHnzxGDIGm5LIPE7Dlu6AUnIf3Gl4/2Uz0XXecX93kgVw1IzKv+dHuxNp
 SVxUDP0R0o66WKgdGwDfxEasf8e1tTJw/gWlwvjZlL0cz4D/qEX0YXjFyR4Mid3JYB8g
 gN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cLiYnZqbbTYE+Gmw/2Cct5bDgH44FThPRJ7yw1uOIgg=;
 b=Prc6m97KkUWFVp4r+6+isW/Ravhu/QoqdwqXpJ2sftdRK8gRRiGnpBSJWuVneZUg1J
 n2wcVV7oO6xTl5fO35wIi+gXVz98hGdSFSrKsAn2bRqJAOVqwM5V7+/m1xc93ZMka651
 gOWj5BjB/88ekCijaQhUzONgJ0VefOyjoez3gDOrxuAXrZSfyyaBTCzkMDyjIzSUchBE
 z5SmqDVJFYj2Dluz0InQ+tjgZ/5hZpAikK8SwM1MzkoDCx//x/7i+JmYI8oHHLrDPWLh
 mFdkvehx0gNkd2D6gO6a+oy3/3tEx/eqzbLEw+mJiTC/0D/oeHig4s6TSLv20MnxJDTq
 Gr2Q==
X-Gm-Message-State: AOAM530uNnF3j+dynGYTFexl1pLUBKfnm2vFazkGvB7NuOFgNxBqz6DJ
 tYBCAQ5HsfcVgXSmTW2hWMU=
X-Google-Smtp-Source: ABdhPJyDE2aG8TshKuizrAN7qDH3x0b/P0IYn1ToY1b01Ld0Wj957fykeNLLAtH1r4vAPpkK8xTQfg==
X-Received: by 2002:a05:651c:2cb:: with SMTP id
 f11mr218668ljo.371.1604897270127; 
 Sun, 08 Nov 2020 20:47:50 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id w13sm795441lfq.72.2020.11.08.20.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 20:47:49 -0800 (PST)
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <20201109044354.ljd5pomhob6b7u5v@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <713b319e-bb7b-4743-59f0-b9892c3da92d@gmail.com>
Date: Mon, 9 Nov 2020 07:47:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109044354.ljd5pomhob6b7u5v@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMTEuMjAyMCAwNzo0MywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMDgtMTEtMjAs
IDE1OjE5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEkgdG9vayBhIGRldGFpbGVkIGxvb2sg
YXQgdGhlIEdFTlBEIGFuZCB0cmllZCB0byBpbXBsZW1lbnQgaXQuIEhlcmUgaXMKPj4gd2hhdCB3
YXMgZm91bmQ6Cj4+Cj4+IDEuIEdFTlBEIGZyYW1ld29yayBkb2Vzbid0IGFnZ3JlZ2F0ZSBwZXJm
b3JtYW5jZSByZXF1ZXN0cyBmcm9tIHRoZQo+PiBhdHRhY2hlZCBkZXZpY2VzLiBUaGlzIG1lYW5z
IHRoYXQgaWYgZGV2aWNlQSByZXF1ZXN0cyBwZXJmb3JtYW5jZSBzdGF0ZQo+PiAxMCBhbmQgdGhl
biBkZXZpY2VCIHJlcXVlc3RzIHN0YXRlIDMsIHRoZW4gZnJhbWV3b3JrIHdpbGwgc2V0IGRvbWFp
bidzCj4+IHN0YXRlIHRvIDMgaW5zdGVhZCBvZiAxMC4KPiAKPiBJdCBkb2VzLiBMb29rIGF0IF9n
ZW5wZF9yZWV2YWxfcGVyZm9ybWFuY2Vfc3RhdGUoKS4KPiAKClRoYW5rcywgSSBwcm9iYWJseSBo
YWQgYSBidWcgaW4gdGhlIHF1aWNrIHByb3RvdHlwZSBhbmQgdGhlbiBvdmVybG9va2VkCnRoYXQg
ZnVuY3Rpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
