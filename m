Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1E29CEC3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99346EC88;
	Wed, 28 Oct 2020 08:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC726EC1E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:22:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 2so3012866ljj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0LPNweG+gfW0E+7Iib5GUjlD2JP5EWxruAvLHtaU8XE=;
 b=aSkqnm7gx7xKIhmazlcPViUAMX7Tp2uHkbyBVUdCFkMxeMIdX2Xi9DW0855SI7bMdv
 tt3tR49WUXa/WWNOl4DlYA2JKR7vFmksRbGmg2jV+mgwfSwCbadlTlsOLBppruycITi+
 w/f3rCWA79Y1t0HlgyIgmO8rYYe3U4b7weHWVvqF4IGkLGVoHUJ6eWTPmeGG/2KRAbBH
 buCK0HYDr4Hks/1ccaSZLA28nFhWBDswpv7UohY7LK8b5pZ1eSSDBs31G6e+JpGJ9Snf
 m51ztOLcJsIfX8SexWXZxkrhoV0FehIPopeR7Jttn8qdjCi+XaVcvjBJR9Ht1d/7wscE
 0skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0LPNweG+gfW0E+7Iib5GUjlD2JP5EWxruAvLHtaU8XE=;
 b=HPoVg3TMNxoDaXsMkyEY1gH1Rs/YuL4cevYgMF7L4/JocnszsHVt180JL0SmpXQToQ
 0UXDCJi9HrCLMmjigUJjQyPY+zz6SWUvJvSzScd4zCEjjQwO3ThbFGbsMpVPM2vZ6UHI
 mJOHZZ+iA6L9aOuLmyyY+IXZ87TT0ITlnuX5JIRrr1uQPvmQfk0EnU+F8NOdWWfv+OG5
 stv9PWb8PaoaKjnFcFb2mVbGKcTWWNZZmf1SOQp1mRM3s2tqOdBWGGR9e0P7+fKsJRDq
 JfdYpdXY6VssVTw6difDdpLnTcLxUJdO6It127cmHyZ3GGv4SfHNNHSLfga33zJDes9z
 Tb0Q==
X-Gm-Message-State: AOAM532CeowIokBBp5D5b9jV06/JdkbchX41XkZ06Fx6biW5eGzekHHK
 MB2qs5HXUha1y2plgtmQTro=
X-Google-Smtp-Source: ABdhPJwzYHdGLKWirtJJS8W/Sx8MXsyFr0CXQVIbEPKIdICpwTjspH3wnE4roG7cjpHTIAuDhoBLnw==
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr1808964ljj.233.1603826541677; 
 Tue, 27 Oct 2020 12:22:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id m14sm285483ljo.76.2020.10.27.12.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:22:21 -0700 (PDT)
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com> <20201027090212.GG4244@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1cce314a-1eab-61c9-099d-54f987b03761@gmail.com>
Date: Tue, 27 Oct 2020 22:22:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027090212.GG4244@kozik-lap>
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

MjcuMTAuMjAyMCAxMjowMiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+PiBAQCAt
MzEsMTcgKzMyLDM0IEBAIEV4YW1wbGU6Cj4+ICAJCS4uLgo+PiAgCX07Cj4+ICAKPj4gKwllbWNf
YndfZGZzX29wcF90YWJsZTogZW1jX29wcF90YWJsZTEgewo+IEh5cGhlbnMgZm9yIG5vZGUgbmFt
ZS4KCldlIGFscmVhZHkgdXNlIHVuZGVyc2NvcmVzIGZvciB0aGUgVGVncmEgQ1BVIE9QUCB0YWJs
ZS4KCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEwLXJjMS9zb3VyY2UvYXJj
aC9hcm0vYm9vdC9kdHMvdGVncmEyMC1jcHUtb3BwLmR0c2kjTDQKCldoYXQgbWFrZXMgeW91IHRo
aW5rIHRoYXQgaHlwaGVucyB3aWxsIGJlIGEgYmV0dGVyIGNob2ljZT8gSXMgaXQgYQpkb2N1bWVu
dGVkIG5hbWluZyBjb252ZW50aW9uPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
