Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9762E1B2C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21646E8F5;
	Wed, 23 Dec 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1264A6E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:16:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h205so34516409lfd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EYz840XL2+BeI0xjEE06TBEE7fdn2tJLjp3OBT5/ex8=;
 b=WO/+jgsIPVHjgU4VTXpX/R+M6h7CBASVoES4t57fsRb+I8UWFF3iEARAY69dC2xVCo
 URYB8ZCwHROXxrMoSQfEtImbj7c/UBbjtf5Wppgok+6BjEEX+4GDdvKCgZ5AiNVejLpV
 yDex70ynkN50VzkRYPfke51Hr/xb70vpCIITCUSAC/xSiApc4ZpftGY2fwtLxBXL9f4o
 uFtfsI5DO6JjUrZu3E+H64hK+PS4wdGDsyEcuHcntfhq4PpnQOaiRcwdyaDXSLj3xdr0
 hkswoi8Ce9rcBbCA5Cfi9t+d9anhhKbMJFEZF4i/qJ7qx+f/j8nhJyFFfvA5v60T4o1v
 8OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EYz840XL2+BeI0xjEE06TBEE7fdn2tJLjp3OBT5/ex8=;
 b=MF5xhnq/okyidgqRcGiLGDS42uWMyyiE525feNYCtgBKDwMGOd9lUUkP/wA66VbKdV
 xl9hPsDDYYjpEuUl5aEKfDiv4PmYUr34DeopQl9VPU4Z5VWBw68Q7mjIGGX5wjb9AMq0
 fWbHfwWdA1hR6qicAiCHBUH1Nah7Wj1LIWMakuNZNqxL3ByiUxaNEhRVoK3dWrmcPKlV
 L25aWzw+QuNtlg7X+8rY1itNQd6+ogncl/PqNkI5SR4MfYVCxVp+8vRZZVEM1zZZaJ8K
 r4bQeS4HrrrECGi9NUT3pVC1rizxJE81oml8cgVuHg6NiJ43ktf3Gpo+5T2x1O1XVSw7
 EN3g==
X-Gm-Message-State: AOAM531uEePmst4/5xfzTEvY3fDVzzMMcnzzViTgG2DWikDLasohTpEa
 cJPkL70YjHXJLwKZJi8EX8M=
X-Google-Smtp-Source: ABdhPJxxLcLuqNoUidxNTzzW4XSp0tGUe7iGFP3OUZen+YjbkOInSgT8KDKBAzgE8hfiRbLGNlTSMg==
X-Received: by 2002:a05:651c:1123:: with SMTP id
 e3mr10075574ljo.131.1608664589537; 
 Tue, 22 Dec 2020 11:16:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id e27sm3037048ljb.6.2020.12.22.11.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:16:29 -0800 (PST)
Subject: Re: [PATCH v2 06/48] dt-bindings: clock: tegra: Document clocks
 sub-node
To: Rob Herring <robh@kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-7-digetx@gmail.com>
 <20201222001457.GA891962@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4ce87e9-0e8d-a0cb-6098-f98e285ebf75@gmail.com>
Date: Tue, 22 Dec 2020 22:16:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222001457.GA891962@robh.at.kernel.org>
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
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAwMzoxNCwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIERlYyAx
NywgMjAyMCBhdCAwOTowNTo1NlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IERv
Y3VtZW50ICJjbG9ja3MiIHN1Yi1ub2RlIHdoaWNoIGRlc2NyaWJlcyBUZWdyYSBTb0MgY2xvY2tz
IHRoYXQgcmVxdWlyZQo+PiBhIGhpZ2hlciB2b2x0YWdlIG9mIHRoZSBjb3JlIHBvd2VyIGRvbWFp
biBpbiBvcmRlciB0byBvcGVyYXRlIHByb3Blcmx5IG9uCj4+IGEgaGlnaGVyIHJhdGVzLgo+IAo+
IFNlZW1zIGxpa2UgYW4gb2RkIHJlYXNvbiB0byBoYXZlIGEgYnVuY2ggb2YgY2hpbGQgbm9kZXMu
IEl0IHZlcnkgbXVjaCAKPiBzZWVtcyBsaWtlIGEgcHJvYmxlbSB5b3UnZCBuZWVkIHRvIHNvbHZl
IGFmdGVyIHlvdSBkZXNpZ24gdGhlIGJpbmRpbmcgCj4gd2hpY2ggc2hvdWxkIGJlIGZpeGVkIHdp
dGhpbiB0aGUga2VybmVsLgoKVGhlIHJlYXNvbiBpcyB0aGF0IG11bHRpcGxlIHJvb3QgU29DIFBM
TCBjbG9ja3MgbmVlZCB0byBoYXZlIGluZGl2aWR1YWwKT1BQIHRhYmxlIGJlY2F1c2UgcHJvcGVy
IHZvbHRhZ2Ugc2hvdWxkIGJlIG1haW50YWluZWQgZm9yIHRoZXNlIGNsb2NrcwpiYXNlZCBvbiB0
aGUgY2xvY2sgcmF0ZS4KClNvbWUgb2YgdGhlIGNsb2NrcyBkbyBub3QgYmVsb25nIHRvIGFueSBz
cGVjaWZpYyBkZXZpY2UgYW5kIHRoZXJlIGlzIGEKbmVlZCB0byBzcGVjaWZ5IHRoZSBPUFAgdGFi
bGUgZm9yIHRoZW0uIEVhY2ggY2hpbGQgbm9kZSByZXByZXNlbnRzIGFuCmluZGl2aWR1YWwgY2xv
Y2sgd2l0aCB0aGUgY2xvY2sncyBPUFAgdGFibGUgYW5kIHBvd2VyIGRvbWFpbi4KClNvbWUgY2xv
Y2tzIGJlbG9uZyB0byBhIHNwZWNpZmljIGRldmljZSwgYnV0IGRvbid0IHJlcXVpcmUgaGlnaCB2
b2x0YWdlcwphbmQgaXQncyB2ZXJ5IGNvbnZlbmllbnQgdGhhdCBjbGsgZGV2aWNlIGNvdWxkIG1h
bmFnZSB2b2x0YWdlIGZvciB0aGVzZQpjbG9ja3MsIGluc3RlYWQgb2YgcG9wdWxhdGluZyBlYWNo
IGRldmljZSB3aXRoIE9QUCBzdXBwb3J0IChQV00sIE1NQyBhbmQKZXRjKS4KCkknbGwgdXBkYXRl
IHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIGEgYmV0dGVyIGV4cGxhbmF0aW9uIGluIHYzLgoKPiBU
aGlzIGlzIGFsc28gYWJvdmUgbXkgdGhyZXNob2xkIGZvciAnY29udmVydCB0byBzY2hlbWEnIGZp
cnN0Li4uCgpBbHJpZ2h0LCB3aWxsIGNvbnZlcnQgaXQgaW4gdjMuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
