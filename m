Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010429CEAD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105436E49A;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393AE6EC20
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:23:45 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 23so3073787ljv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Akjb+zu83Tp/ZWt6kxaaIN1ra2F7kz6LqBZ1oZjBDnM=;
 b=SL0PgTg+pMJCfn1eIJ/PohULVHx02bXVzKYatI3HV5z5DoVBijWPYKwUemWlIAYNtd
 1Ph7/a5JS1XLSdRXrL3yQ9+Qa1qBzV9PM/SR0Y25xm7LytMIqWhEm9PZAyaQ0JjSqeLJ
 7KJvBnth6yqGN+1y1ef8PDRy32pTnp4brNSd1HzVeeZUxoJ3XVieGH3K60904x3BMN7L
 ged4gGaool3vixitGPoD9OcSjQrM6UoZqsA1a0+cIICrGpeqmqtPoGpSczsqMLNc5BqP
 ZvoeniGueCUOzNqwTO0mSOVjY9vzA7V/WL8sULitPMQLEnqIWGVS3hwyF3WZEDZlsQaC
 tkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Akjb+zu83Tp/ZWt6kxaaIN1ra2F7kz6LqBZ1oZjBDnM=;
 b=XLq2k77FzfbqIs2pZZ5Ezwf08u4ho3qzpQh3JygSPlGg3tvQiGnnnVIX20O9Nj2kjl
 z1SOm7VoU8IMG1FbEHS+23TTfwxoGI34+dyPlHFKp2wGi42sC4BMvoswaHukvFAPcM24
 Hoi+sFGKmf1t3WQqzUNN5LQyEBmHL53ndYE2zIHucf+ZsrpuLJkEDdwl5bnQaPB9LKQ/
 Q8d453YwEBUCzKcxfkhKv1kbzdJf9KDf/gE0R3N/ArvqjTI1uPsfPYMObXH5hz9mEEkY
 nBD0Ah9ySO0ym01r2dv2/Fv4U2pNhbYiN8iNMSFe69d6FZVZo8m/8OJKKowNiz6dt360
 OvhQ==
X-Gm-Message-State: AOAM531UuOCs7O1TFLrigIOrb4Bm6H+L2waY8JuGKfc+wK6fAkCJwn9e
 zZvA2XZ1F7ZtOZdDl3VAbyo=
X-Google-Smtp-Source: ABdhPJweAT6nor9dVVTdPqiBE7Dkth/aMi9siRaEEQNJntR0tq0UbWvZ5+KYQAAg3FLULXu6vp6tRg==
X-Received: by 2002:a2e:9913:: with SMTP id v19mr1856642lji.443.1603826623643; 
 Tue, 27 Oct 2020 12:23:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id x5sm287766lji.78.2020.10.27.12.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:23:43 -0700 (PDT)
Subject: Re: [PATCH v6 22/52] ARM: tegra: Add interconnect properties to
 Tegra30 device-tree
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-23-digetx@gmail.com> <20201027091516.GA10762@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f7ac9562-6ba9-dc67-f2d7-cc5c1321f5d0@gmail.com>
Date: Tue, 27 Oct 2020 22:23:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027091516.GA10762@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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

MjcuMTAuMjAyMCAxMjoxNSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgouLi4+PiBA
QCAtNzQ4LDE1ICs3NzAsMTggQEAgbWM6IG1lbW9yeS1jb250cm9sbGVyQDcwMDBmMDAwIHsKPj4g
IAo+PiAgCQkjaW9tbXUtY2VsbHMgPSA8MT47Cj4+ICAJCSNyZXNldC1jZWxscyA9IDwxPjsKPj4g
KwkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwxPjsKPj4gIAl9Owo+PiAgCj4+IC0JbWVtb3J5LWNv
bnRyb2xsZXJANzAwMGY0MDAgewo+PiArCWVtYzogbWVtb3J5LWNvbnRyb2xsZXJANzAwMGY0MDAg
ewo+PiAgCQljb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTMwLWVtYyI7Cj4+ICAJCXJlZyA9IDww
eDcwMDBmNDAwIDB4NDAwPjsKPj4gIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDc4IElSUV9UWVBF
X0xFVkVMX0hJR0g+Owo+PiAgCQljbG9ja3MgPSA8JnRlZ3JhX2NhciBURUdSQTMwX0NMS19FTUM+
Owo+PiAgCj4+ICAJCW52aWRpYSxtZW1vcnktY29udHJvbGxlciA9IDwmbWM+Owo+PiArCj4gCj4g
Tm8gbmVlZCBmb3IgYmxhbmsgbGluZS4KCkl0J3MgbmVlZGVkIHRvIG1ha2UgTUMgYW5kIEVNQyBu
b2RlcyBsb29rIGNvbnNpc3RlbnQuIFNlZSB0aGUgTUMgbm9kZQphYm92ZSB3aGljaCBoYXMgdGhl
IGJsYW5rIGxpbmUuCgo+IAo+PiArCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+PiAgCX07
Cj4+ICAKPj4gIAlmdXNlQDcwMDBmODAwIHsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
