Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5CC263E7C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FCA6E098;
	Thu, 10 Sep 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0089D43
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 21:15:54 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k25so5390953ljg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 14:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HnVKigTPD0SFBmS6CufvtEE5hp82hUFW+McOGmr8ObQ=;
 b=AEMv6CEcQnDBpdKHTGDMpkqWbBkkyC3XIxDghgAq6QwSz0FWI1czP7m0rAzo79YaUO
 HhSPr/YEjsCxhLZNISf2Be4NR3orDy7ZMU3ziy+PCzsbiOvedaK+eULC3/znoKwQpZQN
 yEFMKl+0lLsRF885mZeeYpXmXqdzwu2hriKD0arnoUdoFgdQq/W7VbK0tMmb4llhPzLH
 mylxshFdjPd7CFrrJjAFAcdxxmHgEZQUtW8vDl46F6E2AS+0y0rImqP+AIcfI+PYsOlt
 0lsDcTyRVia/TrfsxcEeguz4Au8Zcsz1oZXSrbyLfaWKtThupylDm5rqOR7ozYYE3wOt
 ou7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HnVKigTPD0SFBmS6CufvtEE5hp82hUFW+McOGmr8ObQ=;
 b=hps/qKqCYyowIbZ3FutH7zwrtbwMUkrUI9T37YJzHnRK+wLBStbr+BqU5UZ56p3cyn
 dISNA+QnZ4Co7zAkIz4RSc7hwctEw7Ns5VhVSd/9cWaQoHgUTAjVupqB+SFAe4KGvJ4a
 YDgmxCNjZevXn+3P1y3EZ7JWmUX1qfUcKx8XGDIpY+pZLUB+azpsoql2h9xh/dgvxGyB
 KEJyX4jj5pi6Oe+VK74hYVFMwgMhVGyk7pVVPK7V/PtHsH+z5gMwB7Ut5CqFyIHMote+
 fyxVsrWqXq1/qLGmxu2UBGMqQBTAw5KHBU3bMQmwhTqxqIKOP7lGYoBhOGycy9DA9tMI
 Pghw==
X-Gm-Message-State: AOAM533gtkPljUZmPUGvNSkRbEzeP6jJT5vbvU6VrmOBC9sH+Up10/ux
 6lKH2mGLraqyAUzey/QcFHY=
X-Google-Smtp-Source: ABdhPJxp8VYmLXdjWwfoDoXk3NH/mFiHKjQmDtqVaj5hvvbbW+sEPnZMlMfqd4r/5YSVXyKy5zLhqw==
X-Received: by 2002:a2e:3c08:: with SMTP id j8mr2597735lja.358.1599686153003; 
 Wed, 09 Sep 2020 14:15:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id j7sm821561lfb.41.2020.09.09.14.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 14:15:52 -0700 (PDT)
Subject: Re: [PATCH v5 27/36] memory: tegra-mc: Register as interconnect
 provider
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200814000621.8415-1-digetx@gmail.com>
 <20200814000621.8415-28-digetx@gmail.com>
 <923b6801-5194-b936-13c6-0972761c29b8@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <01996606-84cd-909d-8dfc-4f33bdf8f3cc@gmail.com>
Date: Thu, 10 Sep 2020 00:15:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <923b6801-5194-b936-13c6-0972761c29b8@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAxMTozMSwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgo+IE9uIDgvMTQvMjAg
MDM6MDYsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gTm93IG1lbW9yeSBjb250cm9sbGVyIGlz
IGEgbWVtb3J5IGludGVyY29ubmVjdGlvbiBwcm92aWRlci4gVGhpcyBhbGxvd3MgdXMKPj4gdG8g
dXNlIGludGVyY29ubmVjdCBBUEkgaW4gb3JkZXIgdG8gY2hhbmdlIG1lbW9yeSBjb25maWd1cmF0
aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Cj4gCj4gVGhhbmtzIERtaXRyeSEgTG9va3MgZ29vZCB0byBtZS4KPiAKPiBBY2tlZC1ieTog
R2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgo+IAoKVGhhbmtzIHlvdSEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
