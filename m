Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DFF29CEBC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C46EC5A;
	Wed, 28 Oct 2020 08:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D806E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 21:12:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 2so3335700ljj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xx452EybhZY/Be3m6ZPFyPAZdRMh+EqfNW2ocWqJUkQ=;
 b=D6Wr3oaM9cb6BAmiXy3RkDD4ypsh2yfV8mv0vEtF5pP1za3dGFHgk3xtjw87AkfiqN
 omzwflvsg5c3541QMlIKkoHT4+D1FIZ2bFGO7nnh7r16tMFPnPouySY0KiZ5B+0yFUzW
 jAwlJz05zfj7nRFVKSs2LqKL7Xkxs0q+w55fq+OEbWp6C83f1YUR5Z4sd8rvoQQiatgt
 sRSC/upzBI+sqHvANT1BPo8HtPkXVjBRc9jwm4rpY3tOGQdLsf0lLSaQL1PLASU1v8qu
 hGfPJkzaUUUVklWeOsK5NV5iT6rRLnCqvMy6tGpA+sbqkn6kkN5iOmAaLWkzt5cdR3/q
 /WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xx452EybhZY/Be3m6ZPFyPAZdRMh+EqfNW2ocWqJUkQ=;
 b=oCx9N00pn1CLJ+7JREsP+y8l8KkOWCgcN0Rarb9viuIiEDKuleDaxzIdhQgcHk0/Wo
 CCOuYm2jJJ981e0EHM131lnMpHQ3BTfy3ryAAMf0CX64qBMZrqy7f/omh5cK0wuF4J1g
 +jEXlwbWQWSLG0PFRAwoyRjh/uLz7XNp4XF9Q/tWdFFTzhNnoWc1wrnS009eWEPm/n6n
 /niqgJmDJh0EsAL24UngP4C/2w5XVlUJyZKFx9Al57rDvVoorrYYSqyuswSVFcYu781h
 oTrbhrRqZE17+SicR4XC3oczYrJH1TFlkE8gFJgDt7PeMyLRzKUMab1AwacmbuQRFUKr
 kLSA==
X-Gm-Message-State: AOAM533HO/eizMgwCS6YT144toKG14qO+ao+ui9ErKmmQMb8T9u4ytLS
 8yYtL0IuuDEbW4d1YYHfXec=
X-Google-Smtp-Source: ABdhPJwv14XNGp2zM2xoLnCiq9kknsnE1yraNpyVdtEy7elcpP9cB4Kgv07q0csNDEYeh5IGZ093Gg==
X-Received: by 2002:a05:651c:1291:: with SMTP id
 17mr1768187ljc.52.1603833122475; 
 Tue, 27 Oct 2020 14:12:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id i139sm292785lfi.276.2020.10.27.14.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 14:12:01 -0700 (PDT)
Subject: Re: [PATCH v6 33/52] memory: tegra20: Support interconnect framework
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-34-digetx@gmail.com> <20201027141152.GN1822510@ulmo>
 <713bf4eb-dc5b-9c4b-4ab4-23b36ba4fab1@gmail.com>
Message-ID: <4ff5d718-5e05-fc11-9795-7c3fef4525d3@gmail.com>
Date: Wed, 28 Oct 2020 00:12:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <713bf4eb-dc5b-9c4b-4ab4-23b36ba4fab1@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAyMzoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Ci4uLgo+Pj4gKwo+
Pj4gKwkqYWdnX2F2ZyArPSBhdmdfYnc7Cj4+PiArCSphZ2dfcGVhayA9IG1heCgqYWdnX3BlYWss
IHBlYWtfYncpOwo+Pgo+PiBJJ20gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCBJQ0MsIGJ1dCBzaG91
bGRuJ3QgdGhlIGFnZ3JlZ2F0ZWQgcGVhayB2YWx1ZQo+PiBiZSB0aGUgc3VtIG9mIHRoZSBjdXJy
ZW50IGFnZ3JlZ2F0ZWQgcGVhayBhbmQgdGhlIG5ldyBwZWFrIGJhbmR3aWR0aD8KPj4gQ3VycmVu
dGx5IHlvdSdyZSBzZWxlY3RpbmcgdGhlIG1heGltdW0gcGVhayBiYW5kd2lkdGggYWNyb3NzIGFs
bAo+PiBjbGllbnRzLCBzbyBpc24ndCB0aGF0IGdvaW5nIHRvIGJlIHRvbyBzbWFsbCBpZiBmb3Ig
d2hhdGV2ZXIgcmVhc29uCj4+IG11bHRpcGxlIGNsaWVudHMgbmVlZCBwZWFrIGJhbmR3aWR0aCBh
dCB0aGUgc2FtZSB0aW1lPwoKVGhlIGN1cnJlbnQgdmFyaWFudCB3aXRoIG1heC1wZWFrIHNlbGVj
dGlvbiBzaG91bGQgYmUgb2theSBzaW5jZSBpdAp0YWtlcyBpbnRvIGFjY291bnQgdGhlIGNvbXBl
dGluZyBJU08gYmFuZHdpZHRocyBvZiBvdGhlciBkZXZpY2VzIGJ5Cm92ZXJlc3RpbWF0aW5nIHRo
ZSBiYW5kd2lkdGguCgpGb3Igbm93IHdlIGhhdmUgb25seSBkaXNwbGF5IElTTyBjbGllbnRzIGFu
ZCBpdCB3b24ndCBiZSBhIHByb2JsZW0gdG8KdHVuZSB0aGUgYWxnb3JpdGhtIGxhdGVyIG9uIGlm
IGl0IHdvbid0IHdvcmsgd2VsbCBmb3Igb3RoZXIgSVNPIGNsaWVudHMuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
