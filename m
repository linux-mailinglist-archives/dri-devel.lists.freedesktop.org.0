Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D9C2AB2C8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50E889668;
	Mon,  9 Nov 2020 08:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65012893D5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 05:10:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y16so2696611ljh.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 21:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F8bnoTfMLfQuAGNjcxWowIscN/dz6R46GaHzllMg8J0=;
 b=QYMCKqr7RGvgYQCWbQWS7P62qghK9GYhJHOPC6o3qWYxnmx01eOxLC3P9oE915gwvt
 Fh3WypXWmqFr5JDzFvcPizJHaUlaojEYEUSbCYiCwkjs4V93aOmdN+Fgb69PJ6NqE2Gw
 PU1tJC6S9ZO6C2E/cEJiZ7Ugx4M8B/quGev7CODiOs60KgtrPSL8dsbQi1bSJBrgItSj
 sS++FruzLvRC0nDuMK2bw7Tv77TCae5RwbeUbWYjmokvQPKApEWrKpR+CACc3lpJArf0
 NYbmiYM7C+3HAkDJKFrl7LPc7SxMra13YtbJE8XKMrd/eT1ThSFtS/0QhWfQ+88xkHzq
 O9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8bnoTfMLfQuAGNjcxWowIscN/dz6R46GaHzllMg8J0=;
 b=tFLVs2eKVZCuHfZrAKs7tVCZRnqYdA7fkwS1mYuBSUwhr3825iwfPhNXqbfaKVpfbe
 K//9Iz9UPJG7Wt0MyK8Xs3DHRGnUUEET3nnd/5Ca1OAbhSAC2f620WDH0KK3eLy57mYg
 +Ro66zsz1IlMYo+TZD2LnpBUctKILrwUdEU8uTFZRGRuCRtW4NBclhQ7l/fpricuFABT
 eAPgbI7OHU/BNgMsrV1MtVhOO/zCRymyVzrSOHj+v673piwhaixILqXw2TBY6xpGcTaH
 C25yjR6pLOEL91HvPn9Jd8fP/ZyB2SDyFgSTvqBCOhUeDCA0X/q5hiYx3VkHedYTrjvB
 od8A==
X-Gm-Message-State: AOAM531yDRgE9Ll+hDBeKJ9hC+nLtGIgcoIu+r4e/yKF3Ld/sACRq0P+
 e70gjIsE+XKZUUbEIeZzTP8=
X-Google-Smtp-Source: ABdhPJzn+t/fz27158UyX7xdQtkSIJERw+NXYwjCpA/tjOndB+43X/qkcsxZZqHz/vcErD/wbcazTQ==
X-Received: by 2002:a2e:6a0f:: with SMTP id f15mr272519ljc.375.1604898617889; 
 Sun, 08 Nov 2020 21:10:17 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id r9sm1547587ljd.23.2020.11.08.21.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 21:10:17 -0800 (PST)
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
From: Dmitry Osipenko <digetx@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <20201109044354.ljd5pomhob6b7u5v@vireshk-i7>
 <713b319e-bb7b-4743-59f0-b9892c3da92d@gmail.com>
Message-ID: <aba1fcac-74b8-f370-ab45-312975da66e6@gmail.com>
Date: Mon, 9 Nov 2020 08:10:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <713b319e-bb7b-4743-59f0-b9892c3da92d@gmail.com>
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

MDkuMTEuMjAyMCAwNzo0NywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDkuMTEuMjAy
MCAwNzo0MywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4+IE9uIDA4LTExLTIwLCAxNToxOSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gSSB0b29rIGEgZGV0YWlsZWQgbG9vayBhdCB0aGUg
R0VOUEQgYW5kIHRyaWVkIHRvIGltcGxlbWVudCBpdC4gSGVyZSBpcwo+Pj4gd2hhdCB3YXMgZm91
bmQ6Cj4+Pgo+Pj4gMS4gR0VOUEQgZnJhbWV3b3JrIGRvZXNuJ3QgYWdncmVnYXRlIHBlcmZvcm1h
bmNlIHJlcXVlc3RzIGZyb20gdGhlCj4+PiBhdHRhY2hlZCBkZXZpY2VzLiBUaGlzIG1lYW5zIHRo
YXQgaWYgZGV2aWNlQSByZXF1ZXN0cyBwZXJmb3JtYW5jZSBzdGF0ZQo+Pj4gMTAgYW5kIHRoZW4g
ZGV2aWNlQiByZXF1ZXN0cyBzdGF0ZSAzLCB0aGVuIGZyYW1ld29yayB3aWxsIHNldCBkb21haW4n
cwo+Pj4gc3RhdGUgdG8gMyBpbnN0ZWFkIG9mIDEwLgo+Pgo+PiBJdCBkb2VzLiBMb29rIGF0IF9n
ZW5wZF9yZWV2YWxfcGVyZm9ybWFuY2Vfc3RhdGUoKS4KPj4KPiAKPiBUaGFua3MsIEkgcHJvYmFi
bHkgaGFkIGEgYnVnIGluIHRoZSBxdWljayBwcm90b3R5cGUgYW5kIHRoZW4gb3Zlcmxvb2tlZAo+
IHRoYXQgZnVuY3Rpb24uCj4gCgpJZiBhIG5vbi1oYXJkd2FyZSBkZXZpY2UtdHJlZSBub2RlIGlz
IG9rYXkgdG8gaGF2ZSBmb3IgdGhlIGRvbWFpbiwgdGhlbgpJIGNhbiB0cnkgYWdhaW4uCgpXaGF0
IEkgYWxzbyBoYXZlbid0IG1lbnRpb25lZCBpcyB0aGF0IEdFTlBEIGFkZHMgc29tZSBleHRyYSBj
b21wbGV4aXR5CnRvIHNvbWUgZHJpdmVycyAoM2QsIHZpZGVvIGRlY29kZXIpIGJlY2F1c2Ugd2Ug
d2lsbCBuZWVkIHRvIGhhbmRsZSBib3RoCm5ldyBHRU5QRCBhbmQgbGVnYWN5IFRlZ3JhIHNwZWNp
ZmljIHByZS1nZW5wZCBlcmEgZG9tYWlucy4KCkknbSBhbHNvIG5vdCBleGFjdGx5IHN1cmUgaG93
IHRoZSB0b3BvbG9neSBvZiBkb21haW5zIHNob3VsZCBsb29rIGxpa2UKYmVjYXVzZSBUZWdyYSBo
YXMgYSBwb3dlci1jb250cm9sbGVyIChQTUMpIHdoaWNoIG1hbmFnZXMgcG93ZXIgcmFpbCBvZiBh
CmZldyBoYXJkd2FyZSB1bml0cy4gUGVyaGFwcyBpdCBzaG91bGQgYmUKCiAgZGV2aWNlIC0+IFBN
QyBkb21haW4gLT4gQ09SRSBkb21haW4KCmJ1dCBub3QgZXhhY3RseSBzdXJlIGZvciBub3cuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
