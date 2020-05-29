Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161771E9031
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FF96E9D1;
	Sat, 30 May 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0B06E954
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 17:43:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f5so4608752wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gVHswwd0kSAFGKu/imUZP8zXFuR2uDAO/9AxJgTWj2k=;
 b=vNp+WRPzmVLo1r8+DFAF8gNmZb/28QvNPt/T2VsGiAimd+bWW8HoyDgA44dOUlNzMk
 fY65A1nqYFgcKpVZcbbW6tYLMtlh1ht+H5UUiLrE4WcIm9kEtdVSx+NatHrZ+lmYrhhC
 TEkORAF/qRMaBY4K+bWEZXNc34wV8hrH9Sl3bfCSd73vqQudGr/rBOnFlwIQXYpV3J4O
 YveoFJuluD6cvfUPa7l+Qm9w38CmY64aFpgFFPWvaEWCWqOWPw39DK4zY7+IW5lqL77K
 De+wvJPgksSh0vXciTQWXdpFVX/+YAGuASngCU8rlZeV4qPQ6T0jq8K2Odu8OOwprjGT
 T3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVHswwd0kSAFGKu/imUZP8zXFuR2uDAO/9AxJgTWj2k=;
 b=U9+WUiR4/MIlVoTZ40TNrwt9HpYiiJkAXdYkSNO347QQrqW9n0oRRiGrH2b9jxzrGi
 IXRWHexMzQmRUfEIUl7YozYKZkxeQl/75LP6c0WPGhdwWooK0nqs6PnacYmhppKfV7s7
 A5zilr7yN2iH+CNIINYqnNzxUG1PNzrnfuOf9Xb5NEUJf8VImyEFfD2jFJS31VEHc8z+
 y4PrXU3AZr64dqEmq8A5yGPttGG3njSA44Kh17uEUGgj5/RRrjS45vHE6FUQ9IetpSR0
 cYtYIkr6csq69/88hM+pIClnDHp6L1Z2jHPr+zGAdp3vQxv7TXIXpULcouaxwPzxZZsk
 k8Qg==
X-Gm-Message-State: AOAM531O8FXqzbh+1Db0HskvJrMvD4ypOhRHbEQ2R6wCtDjOu1QmRhM/
 fwE6y6JSBZxLuCI5P5S99amLDQ==
X-Google-Smtp-Source: ABdhPJw5RPN4E4dGorLBaNA+WhTMk21B9a7oGwIJp3X1RT5IwHv1j8KNJcB+UIWbVhdzlIO7TazAAQ==
X-Received: by 2002:a1c:a403:: with SMTP id n3mr9510567wme.98.1590774210138;
 Fri, 29 May 2020 10:43:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5568:5913:8a3a:5e4e?
 ([2a01:e34:ed2f:f020:5568:5913:8a3a:5e4e])
 by smtp.googlemail.com with ESMTPSA id q13sm10600040wrn.84.2020.05.29.10.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 10:43:29 -0700 (PDT)
Subject: Re: [PATCH v8 3/8] PM / EM: update callback structure and add device
 pointer
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-4-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <666b2f9e-d7ed-6ddb-80aa-e63ab9909ee6@linaro.org>
Date: Fri, 29 May 2020 19:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527095854.21714-4-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDUvMjAyMCAxMTo1OCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gVGhlIEVuZXJneSBNb2Rl
bCBmcmFtZXdvcmsgaXMgZ29pbmcgdG8gc3VwcG9ydCBkZXZpY2VzIG90aGVyIHRoYXQgQ1BVcy4g
SW4KPiBvcmRlciB0byBtYWtlIHRoaXMgaGFwcGVuIGNoYW5nZSB0aGUgY2FsbGJhY2sgZnVuY3Rp
b24gYW5kIGFkZCBwb2ludGVyIHRvCj4gYSBkZXZpY2UgYXMgYW4gYXJndW1lbnQuCj4gCj4gVXBk
YXRlIHRoZSByZWxhdGVkIHVzZXJzIHRvIHVzZSBuZXcgZnVuY3Rpb24gYW5kIG5ldyBjYWxsYmFj
ayBmcm9tIHRoZQo+IEVuZXJneSBNb2RlbC4KPiAKPiBBY2tlZC1ieTogUXVlbnRpbiBQZXJyZXQg
PHFwZXJyZXRAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6
Lmx1YmFAYXJtLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9A
bGluYXJvLm9yZz4KClsgLi4uIF0KCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0
dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
