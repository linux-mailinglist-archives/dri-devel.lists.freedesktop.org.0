Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08B2A9193
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFB36EE35;
	Fri,  6 Nov 2020 08:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7186ED64
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f9so2435203lfq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 05:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+oB95VM8Zw9gIAt2FC+TShAF+0gIWo5rt3Q41RXJdtg=;
 b=k7qYU/S7xIQk2jr0RN0b4YX8DQl0u0bLGIF7BIO03i9ysBwBpKDn2MliLppMdD912h
 r6BgWfzuRYtSE1eLkUMnbUB/BLsLo+YvOQfwlkgKibkMcVVi1isY/5BggTofJ/y1r0Hm
 YXTNppZyodPQYF16UO3KTj5p7F89cfzPcpONsMTDz0kZoeDG8Fx0XGembDMrW3FuOzXM
 jio/WB6mh7LmvjaKoQD27SeVDVB1tKJaInHuJOCXUkAdoOyzgiBYOsX/YjAtCKwJlQaR
 K889lN9RvZfHHalw/0sSwWgdKgiFdf9q8dpTy6GIkWbl3kBPpBC5N6gEirv5uxbLGA/i
 qy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+oB95VM8Zw9gIAt2FC+TShAF+0gIWo5rt3Q41RXJdtg=;
 b=dlyym8q26pDYc0YmNLBrPQTHqjqncHNjEOHM3b/MAkkIEXqr2phxI3OyZo78B3N30d
 mP1EVnXQiReclvy06QBq2ulPD+HiB1BcyOh7lBB7TqnGNp5xd1xT7r5lr1b316CPyk6z
 srLMTx/DFEqdabW2wim4VA885Vc00n0gpGhIK3IwfseGZbpctRkKV2hSDMsHQMajDt7j
 kLhTD+2SBbv2axlr5hzfGYfZIs+lui+sQn1D22eSWy7iLuAi8UeTQdRCFJ3HyVucaXuA
 Wz+EVa54dpUn2zdh1ciJYVkycnMHh2VKG8J36HTjTA7nOvw22Os5twUK8fd5OZE1mWeM
 td5Q==
X-Gm-Message-State: AOAM533itK08cW+l63H8l9MxwoXsnP22MWvqDBKMtfZEkAF3Lz57TtxW
 gYCT37TNqzZ6hB6s2ZELzfYxaDU6OJ4=
X-Google-Smtp-Source: ABdhPJy8aDH+pQWACig1gxUeRAo9xbkzKXDLndcNZHc3MgeMS7MQorfWYcYeqkisehyHHQbAhHZsRw==
X-Received: by 2002:ac2:522a:: with SMTP id i10mr1023516lfl.128.1604584648429; 
 Thu, 05 Nov 2020 05:57:28 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.googlemail.com with ESMTPSA id h10sm158920ljj.116.2020.11.05.05.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 05:57:27 -0800 (PST)
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201105014502.GB17266@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60e6ea6b-3a02-30a1-f0c9-d33ef7906ed6@gmail.com>
Date: Thu, 5 Nov 2020 16:57:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105014502.GB17266@qmqm.qmqm.pl>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMTEuMjAyMCAwNDo0NSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBUaHUs
IE5vdiAwNSwgMjAyMCBhdCAwMjo0Mzo1N0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IEludHJvZHVjZSBjb3JlIHZvbHRhZ2Ugc2NhbGluZyBmb3IgTlZJRElBIFRlZ3JhMjAvMzAg
U29Dcywgd2hpY2ggcmVkdWNlcwo+PiBwb3dlciBjb25zdW1wdGlvbiBhbmQgaGVhdGluZyBvZiB0
aGUgVGVncmEgY2hpcHMuIFRlZ3JhIFNvQyBoYXMgbXVsdGlwbGUKPj4gaGFyZHdhcmUgdW5pdHMg
d2hpY2ggYmVsb25nIHRvIGEgY29yZSBwb3dlciBkb21haW4gb2YgdGhlIFNvQyBhbmQgc2hhcmUK
Pj4gdGhlIGNvcmUgdm9sdGFnZS4gVGhlIHZvbHRhZ2UgbXVzdCBiZSBzZWxlY3RlZCBpbiBhY2Nv
cmRhbmNlIHRvIGEgbWluaW11bQo+PiByZXF1aXJlbWVudCBvZiBldmVyeSBjb3JlIGhhcmR3YXJl
IHVuaXQuCj4gWy4uLl0KPiAKPiBKdXN0IGxvb2tlZCBicmllZmx5IHRocm91Z2ggdGhlIHNlcmll
cyAtIGl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgYSBsb3Qgb2YKPiBjb2RlIGR1cGxpY2F0aW9uIGlu
ICpfaW5pdF9vcHBfdGFibGUoKSBmdW5jdGlvbnMuIENvdWxkIHRoaXMgYmUgbWFkZQo+IG1vcmUg
Z2VuZXJpYyAvIGRhdGEtZHJpdmVuPwoKSW5kZWVkLCBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8g
YWRkIGEgY29tbW9uIGhlbHBlci4gSSBoYWQgYSBxdWljawp0aG91Z2h0IGFib3V0IGRvaW5nIGl0
IHRvbywgYnV0IHRoZW4gZGVjaWRlZCB0byBkZWZlciBmb3IgdGhlIHN0YXJ0ZXIKc2luY2UgdGhl
cmUgd2VyZSBzb21lIGRpZmZlcmVuY2VzIGFtb25nIHRoZSBuZWVkcyBvZiB0aGUgZHJpdmVycy4g
SSdsbAp0YWtlIGEgY2xvc2VyIGxvb2sgZm9yIHRoZSB2MiwgdGhhbmtzIQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
