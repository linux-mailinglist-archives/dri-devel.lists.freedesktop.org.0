Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E3209A8D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDC36E88C;
	Thu, 25 Jun 2020 07:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A36A89CCE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 23:23:17 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x18so4471438lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+q5Opz1z0wRg1NqzZx58OYZGGiibmuJzUjuRhMUUaD4=;
 b=P9h8YJipfoA4gOUtNAyLZS5oT+vkZhgxQkidgXELT5luS7daPypiQjcoJOzIn8LdK/
 90CYU23yVp+6f8ZKMnl3TVcs/JLWXpwepm6xPv0Fc75KgyekbskgdoHnKd8WbjwSy736
 yt9V0qQGKBC4QXD11c8RaV9wjUID7StbeBpK2YvFT211LymuNnlxj7c9y8ldU0AUQTRF
 5fbsNwaJ5V5CVPkE/WmEDjWSsupUQmJz7JejLn1ycEheZ0lrCnV4K0GtDeJF0gFuQpGj
 0jR28UnBGE3CehkFpZhwwZ05nnKXlU7PpMDewp6xdtbI0kP7nYRPNXLqJLXs7Iei8IXG
 HvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+q5Opz1z0wRg1NqzZx58OYZGGiibmuJzUjuRhMUUaD4=;
 b=e/z8xn7/qCJa7UtrTZZsamikaXgcVlJhDn4Z/7N4wV7RxKwTqzCvnh+9Vqhv3G4qwl
 V80dQT+ryhzsNDSE7DOzn9tHAiWfLukUGeoABXjyKJ2r6PrH2gI4u+ihcxuXbS3X3bkX
 infSgy4HaJtcgJ4pYumxjhV1ElcSbYmGS3cHoTJg4u74lG5PvqwnhGlvQit0fiaYe8Xh
 mmHVOJhMWV3zzTbG4B6JBzgP7H8s0vXkxkuEkjQzIDBmuDWct60z0SKv7lPF9+bkSS/w
 Z93SdUFlu0NNnBPANEzpxyqPJfqXOynAZ6kHGQ2mqem9AgvbN+o+/sfM8cjRJTM5qKns
 wGkg==
X-Gm-Message-State: AOAM530hEHRQKRIlwHnPqxbqY2tEnbfkEegtlx+LFiqTakNVv/DXf7jR
 xSpVXko5Bt+iK7+RotE2KtY=
X-Google-Smtp-Source: ABdhPJzuszx1IYSaePVGH2nrCCicDhTEPO1AN5OeeW/CUfX8imZqHypcHazl6Hz4UH54ae1Q5BQhPA==
X-Received: by 2002:a2e:2414:: with SMTP id k20mr14179551ljk.24.1593040995236; 
 Wed, 24 Jun 2020 16:23:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id 203sm1782546ljf.14.2020.06.24.16.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 16:23:14 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
Date: Thu, 25 Jun 2020 02:23:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gCj4gc3RydWN0
IGRybV90ZWdyYV9jaGFubmVsX3N1Ym1pdCB7Cj4gwqDCoMKgwqDCoMKgwqAgX191MzIgY2hhbm5l
bF9pZDsKPiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBmbGFnczsKPiAKPiDCoMKgwqDCoMKgwqDCoCAv
KioKPiDCoMKgwqDCoMKgwqDCoMKgICogW2luXSBUaW1lb3V0IGluIG1pY3Jvc2Vjb25kcyBhZnRl
ciB3aGljaCB0aGUga2VybmVsIG1heQo+IMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgY29uc2lkZXIg
dGhlIGpvYiB0byBoYXZlIGh1bmcgYW5kIG1heSByZWFwIGl0IGFuZAo+IMKgwqDCoMKgwqDCoMKg
wqAgKsKgwqAgZmFzdC1mb3J3YXJkIGl0cyBzeW5jcG9pbnQgaW5jcmVtZW50cy4KPiDCoMKgwqDC
oMKgwqDCoMKgICoKPiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIFRoZSB2YWx1ZSBtYXkgYmUgY2Fw
cGVkIGJ5IHRoZSBrZXJuZWwuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKg
IF9fdTMyIHRpbWVvdXQ7CgpXaGF0IGFib3V0IHRvIHJlbmFtZSB0aGlzIHRvIHRpbWVvdXRfdXM/
IEZvciBjbGFyaXR5LgoKPiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBudW1fc3luY3B0X2luY3JzOwo+
IMKgwqDCoMKgwqDCoMKgIF9fdTMyIG51bV9yZWxvY2F0aW9uczsKPiDCoMKgwqDCoMKgwqDCoCBf
X3UzMiBudW1fY29tbWFuZHM7Cj4gCj4gwqDCoMKgwqDCoMKgwqAgX191NjQgc3luY3B0X2luY3Jz
Owo+IMKgwqDCoMKgwqDCoMKgIF9fdTY0IHJlbG9jYXRpb25zOwo+IMKgwqDCoMKgwqDCoMKgIF9f
dTY0IGNvbW1hbmRzOwoKTGV0J3MgYWxzbyBhZGQgIl9wdHIiIHBvc3RmaXggdG8gYWxsIHVzcnB0
ciBuYW1lcywgYWdhaW4gZm9yIGNsYXJpdHkuCgpJdCdzIGFsd2F5cyBuaWNlIHRvIGhhdmUgbWVh
bmluZ2Z1bCBuYW1lcyA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
