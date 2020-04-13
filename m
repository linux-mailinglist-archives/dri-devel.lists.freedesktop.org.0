Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5888C1A7434
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8EC6E466;
	Tue, 14 Apr 2020 07:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDBF89E26
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 15:01:10 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w145so6775466lff.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ru0QSPI9P9UnB6fBmE8CYo+keKBVUlIYNIIDkobQ4LQ=;
 b=Y6rUG6M+j0aiSfmg6JaVatWMejLQsTEbkp+Py4z65rU+aUir3yH4IntWg02ep3JdhB
 Usx5lvplfJa0s5cxCQggtxc7W1wuy/8j1mK4AZtTraerenGI/fqV/T+OEco9I8hWTw3G
 H5eZJiTMnm9GprAVPGhUU7X7wHFEgQoqJDxH1gSMg4mpw4wjthr9obdVLEixRldPLNnf
 XW/AIcU3Kw0c7BABMeRaSSqzB//NmqUeCTH+hoMqFLxXYzFcNL0yf5+hERb3K+Zb1/T1
 oO1zLQ4iHnn+63mj5PtkZjuKKVjSrvSA7ffFDGrGQdVV2vvFVpai2yo/VXtWCSj+XtIx
 wcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ru0QSPI9P9UnB6fBmE8CYo+keKBVUlIYNIIDkobQ4LQ=;
 b=mpSISUo43M1StJmcTfHmlP7rXzjV4NS/TSaWTmcAZJAxSZGiGd9tMVtcYCJI/jVF1r
 hcVqXbEJEoQxkiSx1PbsSlLfURccAfaHI1n5ooiSdILYowX+yCbLZSA01Mv/8wbUFbVb
 NO1Ite2WDD+QjHFLtTlzSTaqZCCbBbDb34ebDK3zqSEcsfK89oQpHby3XDBr44QhD3O9
 IwOv1w7CW2+HVRVCBep6eYtlotDFbqMAkz3rl8hqtnRRbAGYIkw++qE6eb+Pv2JESofy
 KBc+dpkRxlluZk1wMIdct4xIfU9svxaGW5NNjYhAy0Y+kyUgzs2mO7fn40g+G/taiPFv
 FIEQ==
X-Gm-Message-State: AGi0PuYBzLMVB1xXpDoKqSkKXRERrPFimbb45INXGklDyf5/W7JvzADx
 QDVWAeXCdcQZnuhdnMwPGJs=
X-Google-Smtp-Source: APiQypJuMbGzqumA19vjCipPNUMuK6knNtWelRmhSmQ7RHP5iQyyKfnbir6+7o6qjvFvRW6ssE2yTw==
X-Received: by 2002:a19:ee06:: with SMTP id g6mr9366702lfb.90.1586790069000;
 Mon, 13 Apr 2020 08:01:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id b28sm8190875lfo.46.2020.04.13.08.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 08:01:08 -0700 (PDT)
Subject: Re: [PATCH v2 11/22] memory: tegra: Register as interconnect provider
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-12-digetx@gmail.com>
 <70f724d6-5cb2-0ebe-ffc1-5dbb77d9dc74@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8d8dd1aa-71b3-e090-5637-578e23150bf1@gmail.com>
Date: Mon, 13 Apr 2020 18:01:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <70f724d6-5cb2-0ebe-ffc1-5dbb77d9dc74@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gR2VvcmdpLAoKMTMuMDQuMjAyMCAxNTo0MywgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGC
OgouLi4KPj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfSU5URVJDT05ORUNUKSkgewo+IAo+IFRo
ZSBpbnRlcmNvbm5lY3QgZnJhbWV3b3JrIGNhbiBiZSBhbHNvIGEgbW9kdWxlIGFuZCB0aGUgdGhl
biB0aGUgYnVpbGQgd2lsbCBmYWlsLgoKVGhhdCdzIGEgZ29vZCBjYXRjaCEKCj4+ICsJCWVyciA9
IHRlZ3JhX21jX2ludGVyY29ubmVjdF9zZXR1cChtYyk7Cj4gCj4gTWF5YmUgcmVnaXN0ZXIgdGhl
IGludGVyY29ubmVjdCBwcm92aWRlciBhcyBhIHBsYXRmb3JtIHN1Yi1kZXZpY2UgaW5zdGVhZD8K
ClRoZSBzdWItZGV2aWNlIHNvdW5kIGxpa2UgYSBiaXQgdG9vIG11Y2ggb2YgaGFzc2xlLiBJJ20g
Y3VyaW91cyB3aGV0aGVyCndlIGNvdWxkIHRyeSB0byBtYWtlIGFsbCB0aGUgdGVncmEtbWVtb3J5
IGRyaXZlcnMgbW9kdWxhciwgcGxlYXNlIGxldCBtZQp0cnkuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
