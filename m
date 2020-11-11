Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70A2B0103
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0E6E193;
	Thu, 12 Nov 2020 08:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ADC89F24
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:25:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 74so2462476lfo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YDPQOCu1Q0bKCPL6C42R2nt86MKzHJcXkgJe5Eo+/zI=;
 b=nHudV4l+RFcBpr3axrfNNEScRTyu6drP6JREhMmAoVRKbdS57PvlkXk9toKfclED2s
 5G/GJ7KJRJsFYOl4i6+hz5/nD17g2tiqobNLOl91ANza33Te94/voQb5CZ0zp8lD2BIl
 PU7rMO+1CqahgPqwQycUOiQXXBNmJQk5SzllsR4JSzuOTWV21BW2AOMl66pxwuXjhOh/
 Vjvfq/UE6EkhNOnrClbk3roh6SxJVnCQ9D2Ww2U+TE3x7kVzsAdfFNebF1olzKADUOvJ
 t9JGDbP2u/DDS6t4RZ6L5CjtUW62hY2Z2f/G4Lmf7wPuz8IPXZquX5zg6jtdtLe8EzzV
 WHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YDPQOCu1Q0bKCPL6C42R2nt86MKzHJcXkgJe5Eo+/zI=;
 b=BCoaAV/OXiuKrEtpL7Wrt7rClntTraTSZcqlnTiLWinwagkuYL8jcTgTvtfg4g9zp1
 FjigfdXoA7ciebiBz2A5DB9A49Kq6Hh067bb8UyNgWGmvs2nSclcR4q6lC6z9cB3wMUu
 yn0pWJIOxZhZyHXAWcaNkuLz0CPyWkw1nXESm5gBQqnURyo+aErOFDqrwBHVrlDPvS1Z
 cbVwsGH099iJc2ML488PL+h83tJB0cZ5bnOlQWcJi9DBTFb4ywSiQLq5OY301Ey5jZHm
 E5RY2lvLVXzN8p+nH1KEW9Z5im4624Zy/wfKDBjcm/LdesF6xFJdZxtmLzd0+fLUKqIu
 QWTw==
X-Gm-Message-State: AOAM532TAmE5Ap6juhD+O0rve3psbUNDczwtg77kHGlCNbM49hRcjfvX
 gl3QQW8iJvVrEb7RXwo15n+bpkE6IBw=
X-Google-Smtp-Source: ABdhPJzTv9Jyb7R3JTGhtKOKkgm12/bRzXfaFk0KiQNWX12jN9WFCPB0iS0jN9FOqsksEXFAwAJolg==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr8775060lfh.236.1605090336653; 
 Wed, 11 Nov 2020 02:25:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id t13sm62578lfl.294.2020.11.11.02.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 02:25:35 -0800 (PST)
Subject: Re: [PATCH v8 11/26] memory: tegra124-emc: Make driver modular
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-12-digetx@gmail.com> <20201111090434.GB4050@kozik-lap>
 <f44b64f5-6b08-5f1e-4f9b-a73a1705d493@gmail.com>
 <20201111092619.GD4050@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a75e72b9-273a-4492-09e6-d02a5ea58482@gmail.com>
Date: Wed, 11 Nov 2020 13:25:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201111092619.GD4050@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAxMjoyNiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+PiAxMS4x
MS4yMDIwIDEyOjA0LCBLcnp5c3p0b2YgS296bG93c2tpINC/0LjRiNC10YI6Cj4+Pj4gLW9iai0k
KENPTkZJR19URUdSQTEyNF9FTUMpCQkrPSBjbGstdGVncmExMjQtZW1jLm8KPj4+PiArb2JqLSQo
Q09ORklHX0FSQ0hfVEVHUkFfMTI0X1NPQykJKz0gY2xrLXRlZ3JhMTI0LWVtYy5vCj4+Pj4gK29i
ai0kKENPTkZJR19BUkNIX1RFR1JBXzEzMl9TT0MpCSs9IGNsay10ZWdyYTEyNC1lbWMubwo+Pj4g
SG93IGlzIGl0IHJlbGF0ZWQgdG8gbW9kdWxhcml6YXRpb24/IEl0IGxvb2tzIGxpa2UgZGlmZmVy
ZW50IGlzc3VlIGlzCj4+PiBmaXhlZCBoZXJlLgo+PiBUaGUgQ09ORklHX1RFR1JBMTI0X0VNQyBu
b3cgY291bGQgYmUgJ20nLCB3aGlsZSB0aGUgY2xvY2sgY29kZSBtdXN0IGJlCj4+IGJ1aWx0LWlu
LiBUaGUgVEVHUkExMjQgRU1DIGRyaXZlciBpcyB1c2VkIGJ5IFQxMjQgYW5kIFQxMzIgU29Dcy5c
Cj4gTWhtbSwgIHRoZSBDT05GSUdfVEVHUkExMjRfRU1DIGRlcGVuZHMgb24gQVJDSF9URUdSQV8x
MjRfU09DIHNvIG9uIHRoZQo+IGNvbmZpZyAhQVJDSF9URUdSQV8xMjRfU09DICYmIEFSQ0hfVEVH
UkFfMTMyX1NPQyB0aGlzIHdhcyBub3QKPiBzZWxlY3RlZC4gTm93IGl0IHdpbGwgYmUgc2VsZWN0
ZWQuCj4gCgpUaGUgZHJpdmVyIGlzbid0IGV4cG9zZWQgb24gQVJNNjQgcHJvYmFibHkgYmVjYXVz
ZSBub2JvZHkgYm90aGVyZWQgdG8gZG8KaXQgc28gZmFyLiBCdXQgaXQncyBub3QgYWxzbyB0aGUg
bWVtb3J5IGRyaXZlciB3aGljaCBkZXBlbmRzIG9uCmNsay10ZWdyYTEyNC1lbWMubywgaXQncyBh
bHNvIHRoZSBtYWluIGNsay90ZWdyYS9jbGstdGVncmExMjQuYyBkcml2ZXIKaXRzZWxmLCB3aGlj
aCBpcyBhbHNvIHVzZWQgYnkgYm90aCBUMTI0LzEzMi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
