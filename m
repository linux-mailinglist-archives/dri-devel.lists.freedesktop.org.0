Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C92C1F82
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663866E217;
	Tue, 24 Nov 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538D489D6C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 12:14:08 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i17so17741248ljd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 04:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XsZCv5023Mu/1oSh+AEapg1m34NXeyOJ1unD1eIBZQw=;
 b=aB1KYaV7QqWCZox3C1Jd1sqfwbSLXAQ3jPNeKgOhMUvcnvNB+7Eikk716UJZZdPigW
 qnMeYDdM9c69XWEjLShh/Zve5JmHKWUaj5ItrO7NfeBpUVAEWQXflrAGCFTu8LO7ab22
 RSB5f4WCpXTvazXHF4RBQKjRPiJu0EUP1gkgxeEhUWNhg5RBZb/aXAxnqD/JzL2wlTfM
 alizEIHllaRJbhLpzXPaIJ/t39ndcERuS8RRSt+5Z8Ayd088t7ICseCenMYJzmaIGcHN
 JQdsd2RXj/bbn/JMKwi0+GCi8X4j+3Xfet8lNvmwvwLixlz4aWxFEXr+moKrY9mOaJTg
 JT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XsZCv5023Mu/1oSh+AEapg1m34NXeyOJ1unD1eIBZQw=;
 b=DYLB99Ps/mG+JQZYa3tgHljmCVIRINVRLPUbrj9EYbIC9eXGD3nSrlVuEOFcf1bCHz
 +bWRfTnjT237+tfihC91uOQqSLDr0xZs4nNjgFKY/b0Bftk181Ln3KmnOurw03Gx0nT3
 B3meVSfzz5GOCfHGyC65vB/4Z1dow9M3GGYbP7rvJ+NvkeHtMkIFGcmGk09/9eck7Jqp
 lmHCEpgj7p0B5IO3KfjS8BTd6n2nr5x+8+E5ag+lI3aDXXMX4s2sQNG0JuGxZ9NGM0P8
 vIEidDqLVrw8/gpBWcxKgnoded89eYzi9sv/4lmrcmvSqXjNS5AcSzexrgNi8D7zYZVG
 WVjg==
X-Gm-Message-State: AOAM530ZjRsFmVynkD0m/fwVtVigfMjfX9A7bH7F2al+BXT91UH4evzR
 TI3Pj82D+GdUR9eVST4Wp/7mAgX86Q4=
X-Google-Smtp-Source: ABdhPJx4k5t4//jZKRi/ta0kUpQyFAiLJpsAYAJoaM9b+pEwu73ZR0cHXPiCx8Ola24KDGwrKRvL8w==
X-Received: by 2002:a05:651c:299:: with SMTP id
 b25mr13588973ljo.16.1606133646185; 
 Mon, 23 Nov 2020 04:14:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id o3sm1368332lfo.217.2020.11.23.04.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:14:05 -0800 (PST)
Subject: Re: [PATCH v10 03/19] memory: tegra30: Support interconnect framework
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-4-digetx@gmail.com>
 <109bc617-f7d9-8635-3db1-3f4869b32f4d@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cd22b4ce-b2c1-9893-5007-5dd7dc49404f@gmail.com>
Date: Mon, 23 Nov 2020 15:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <109bc617-f7d9-8635-3db1-3f4869b32f4d@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMTEuMjAyMCAwOTozMiwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgo+IEhpIERtaXRyeSwK
PiAKPiBPbiAyMy4xMS4yMCAyOjI3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IE5vdyBJbnRl
cm5hbCBhbmQgRXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXJzIGFyZSBtZW1vcnkgaW50ZXJjb25u
ZWN0aW9uCj4+IHByb3ZpZGVycy4gVGhpcyBhbGxvd3MgdXMgdG8gdXNlIGludGVyY29ubmVjdCBB
UEkgZm9yIHR1bmluZyBvZiBtZW1vcnkKPj4gY29uZmlndXJhdGlvbi4gRU1DIGRyaXZlciBub3cg
c3VwcG9ydHMgT1BQcyBhbmQgRFZGUy4gTUMgZHJpdmVyIG5vdwo+PiBzdXBwb3J0cyB0dW5pbmcg
b2YgbWVtb3J5IGFyYml0cmF0aW9uIGxhdGVuY3ksIHdoaWNoIG5lZWRzIHRvIGJlIGRvbmUKPj4g
Zm9yIElTTyBtZW1vcnkgY2xpZW50cywgbGlrZSBhIERpc3BsYXkgY2xpZW50IGZvciBleGFtcGxl
Lgo+Pgo+PiBUZXN0ZWQtYnk6IFBldGVyIEdlaXMgPHBnd2lwZW91dEBnbWFpbC5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAKPiBBY2tl
ZC1ieTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgo+IAo+IFRoYW5r
IHlvdSBmb3IgdGhlIGNvbnRpbnVvdXMgd29yayBvbiB0aGlzIHBhdGNoc2V0IQoKSGVsbG8gR2Vv
cmdpLAoKVGhhbmsgeW91IGZvciByZXZpZXdpbmcgdGhlIHBhdGNoZXMhCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
