Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DBB2E1B36
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6973C6E923;
	Wed, 23 Dec 2020 10:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C6F6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:14:38 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id 23so34437072lfg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XzA+IxTqOiwjX/OrglCXeb/ESpno+XzmysujmIzCZFM=;
 b=h6Un3O0GRIs20IfATLi+caPIyTbxDAcApXIG4ly+tb+Ff/AsSFUMzbqRg8x3QcB6R+
 /lifUSEyU9TWfJc8mLHdB9d8Y9qRGestdhGRPway3GOSGQ8cuy0pUSKXN4e5DxzEnKwD
 fYR1YIf05Ra2zD+xV/OtVJhAAejE7qDSsealn/k6wRndcA+Kr9Qd5G4O+fFM4ffhZQx5
 iWL+fsem7uxnvLNF9sQvi3DoxjBI8dadxS+frkf0ytoCPFY3u7CLr3wTEKUDK5cvpLd6
 ZVfYRe9qC4R3pywKEw8dY8c5wQiJMnxeiGLjUsFSzmvoCygv4r2QJhnbSecDGxF5TC88
 NxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XzA+IxTqOiwjX/OrglCXeb/ESpno+XzmysujmIzCZFM=;
 b=j/Sb7kBkOWcQgWDKhb3KJ2dA1P5wvMEhCPUYS4hUeM7XICU1fAVxLzByET//++6RDz
 CJFoIstIdkjQE52g8o4K67r0tdCLwP4sRMFtJu3G8egFGnJu+FlxjKoQR36Y81qHQ0nT
 KBmho5/WowI0ylcVyoDKE1JXG3Qk4gLkDBPpg4y+/HIWoDUXs1++tFTmagLG8qmOaoOY
 +A1H+0alztiKYt+6oL3kRn3kRFA9j+zsYTFTTMjGKRoPVRYbNa/ZA80zq2NmCHN3qjce
 7SNQqcuO0DEtL1l8Ms0yIRhmmDqANV0V795FKc2uiaK2ne6G8m0GFZoru84XjrKea5NN
 oKVg==
X-Gm-Message-State: AOAM533L2Ww1n9wPjjN4tzKaUpUu6EGYFdzaNl3Skxexsj94IqWqIKLL
 c7MudhCFjlqMkMLC36qy5dFmnKVmi2Y=
X-Google-Smtp-Source: ABdhPJx7qPXV3sur6eNMVZg5jfo2nbqg0IGWfAP0Kv+mCCycwkuquOyLrOc/kJVZYxAbFZWEAV5uLg==
X-Received: by 2002:a2e:a366:: with SMTP id i6mr10568406ljn.427.1608664477207; 
 Tue, 22 Dec 2020 11:14:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id h23sm3018460ljh.115.2020.12.22.11.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:14:36 -0800 (PST)
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
 <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
 <20201222091558.mhqf4oytviwc6b3h@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6281108a-5d76-bf6e-13ea-e27808c829b9@gmail.com>
Date: Tue, 22 Dec 2020 22:14:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222091558.mhqf4oytviwc6b3h@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAxMjoxNSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTgtMTItMjAs
IDE2OjUxLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEFscmlnaHQsIGFsdGhvdWdoIEkgaGF2
ZW4ndCBwcmV0ZW5kZWQgdGhhdCB2MiBwYXRjaGVzIHNob3VsZCBiZSBtZXJnZWQKPj4gcmlnaHQg
YXdheSBzaW5jZSB0aGV5IGFyZSBmdW5kYW1lbnRhbGx5IGRpZmZlcmVudCBmcm9tIHYxLCBhbmQg
dGh1cywgYWxsCj4+IHBhdGNoZXMgbmVlZCB0byBiZSByZXZpZXdlZCBmaXJzdC4KPiAKPiBJIGFn
cmVlLiBJIGhhdmUgZG9uZSBzb21lIGJhc2ljIHJldmlldyBmb3IgdGhlIHN0dWZmLgoKVGhhbmsg
eW91IGZvciB0aGUgcmV2aWV3LgoKPj4gSWYgdGhlIGN1cnJlbnQgT1BQIGNoYW5nZXMgbG9vayBn
b29kIHRvIHlvdSwgdGhlbiBwbGVhc2UgZ2l2ZSB5b3VycyByLWIKPj4gdG8gdGhlIHBhdGNoZXMu
IFRoYW5rcyBpbiBhZHZhbmNlIQo+IAo+IHItYi15IGlzbid0IHJlcXVpcmVkIGFzIHRoZXkgd2ls
bCBnbyB0aHJvdWdoIG15IHRyZWUgaXRzZWxmLiBTbyBpZiBldmVyeW9uZSBpcwo+IGhhcHB5IHdp
dGggdGhlIGlkZWEsIHBsZWFzZSBzdWJtaXQgdGhlIHBhdGNoZXMgc2VwYXJhdGVseSAoZml4ZXMs
IGltcHJvdmVtZW50cywKPiBkZXZtXyosIGV0YykuCgpva2F5Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
