Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF98211CD9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E56EA52;
	Thu,  2 Jul 2020 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDBA6E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:25:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h19so29507565ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OA49WuL0sThpD2AYuMtpdZGroGjS32Zzwhjd8yiNNuE=;
 b=Mk2P/S1R51LjiHT7a52NIA3xKyA8UaSrakv3wRtyWYPe6BL3niPa/Dc/e4xhwoI/7y
 qJCb9fIvWwDH+rLQCzB7ZXYtVgYJ17S079OzNbyqQDLIp0iyIOZCd2f/fXeMuCcMZLJt
 /nXGZj42VSvsYShz0ll30Lyi6zGzcBWLqTeKBVrFClp61LhaHRGRo7AY9m0Pyg+rKlJg
 leQR6wWLC+Ta3BChiNfVKYMnm6Cnijo3iVy35FtBvlPGz1TinVSDi5OeLq4ExN/pNSKk
 HVnbRxh9g2dXkTgaTw8nTyxZK7+4+/oV5s4HURZiYG3wpDpJvgjBmRy+AXNHPlFQSHMp
 sU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OA49WuL0sThpD2AYuMtpdZGroGjS32Zzwhjd8yiNNuE=;
 b=akWkALTmgLkaN++uAA47pgw8VF6cM2X8Ki0CFgm5r1eg4Qwb4AMUSiS6494oNTY/TG
 ATwvx7aY0aJ/DC5FTp9N3UWTvwPHrtQiXKFBTw17AeQEq5VE/SqelRJIRYIbt8Sdk8E0
 ygWLNzjEmBEsJS/bOn51kqfWnHVOcv+73U21XWJ/pD7gmhoUjFwvhjA/WL4PyJgoYmVB
 2sGyAK+DDEQTJd2filORJ0YdGmG+BIumR6bSJ1G1KMDqq2VvQDh313DfgaymESvevsV/
 he2il4E9owm8vfEqd8Fxxv07wo+Nrmra7Xka/IhFVPU+aLfksXRVzsFS2wLyzsWQxT7s
 yLlA==
X-Gm-Message-State: AOAM532dSqa1AfBkutka/u2miaZun/XiJnyUy2Tp0YeT3yxHazqMYMoV
 450cNzF4lUWa2EbJIr4GyM4=
X-Google-Smtp-Source: ABdhPJxhRnB8zlB9MEI6/ePrP8TdwiCvmtrvwqZ45jg4cOgOfkQ8DUYoWvB37U4c3CnwDzsMcLaC0A==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr10807112ljg.61.1593653104194; 
 Wed, 01 Jul 2020 18:25:04 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id t4sm2704596lfp.21.2020.07.01.18.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 18:25:03 -0700 (PDT)
Subject: Re: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe
 error
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656@epcas1p3.samsung.com>
 <20200609131404.17523-12-digetx@gmail.com>
 <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
 <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
 <8e941321-5da6-e9e7-6a4e-8c0477911ebd@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3e30279c-0964-4dd8-e7ac-2066c8ccc902@gmail.com>
Date: Thu, 2 Jul 2020 04:25:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8e941321-5da6-e9e7-6a4e-8c0477911ebd@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDcuMjAyMCAwNDozNCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gT24gNy8yLzIwIDEw
OjIwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDAyLjA3LjIwMjAgMDM6NTksIENoYW53
b28gQ2hvaSDQv9C40YjQtdGCOgo+Pj4gSGksCj4+Pgo+Pj4gT24gNi85LzIwIDEwOjEzIFBNLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gVGVncmEgRU1DIGRyaXZlciB3YXMgdHVybmVkIGlu
dG8gYSByZWd1bGFyIGtlcm5lbCBkcml2ZXIsIGl0IGFsc28gY291bGQKPj4+PiBiZSBjb21waWxl
ZCBhcyBhIGxvYWRhYmxlIGtlcm5lbCBtb2R1bGUgbm93LiBIZW5jZSBFTUMgY2xvY2sgaXNuJ3QK
Pj4+PiBndWFyYW50ZWVkIHRvIGJlIGF2YWlsYWJsZSBhbmQgY2xrX2dldCgiZW1jIikgbWF5IHJl
dHVybiAtRVBST0JFX0RFRkVSIGFuZAo+Pj4+IHRoZXJlIGlzIG5vIGdvb2QgcmVhc29uIHRvIHNw
YW0gS01TRyB3aXRoIGEgZXJyb3IgYWJvdXQgbWlzc2luZyBFTUMgY2xvY2sKPj4+PiBpbiB0aGlz
IGNhc2UsIHNvIGxldCdzIHNpbGVuY2UgdGhlIGRlZmVycmVkIHByb2JlIGVycm9yLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+Pj4+
IC0tLQo+Pj4+ICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMgfCA5ICsrKysrKy0t
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYyBi
L2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYwo+Pj4+IGluZGV4IGU5NGEyNzgwNGMy
MC4uNDIzZGQzNWM5NWIzIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMw
LWRldmZyZXEuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTMwLWRldmZyZXEuYwo+
Pj4+IEBAIC04MDEsOSArODAxLDEyIEBAIHN0YXRpYyBpbnQgdGVncmFfZGV2ZnJlcV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+ICAJfQo+Pj4+ICAKPj4+PiAgCXRlZ3Jh
LT5lbWNfY2xvY2sgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgImVtYyIpOwo+Pj4+IC0JaWYg
KElTX0VSUih0ZWdyYS0+ZW1jX2Nsb2NrKSkgewo+Pj4+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwg
IkZhaWxlZCB0byBnZXQgZW1jIGNsb2NrXG4iKTsKPj4+PiAtCQlyZXR1cm4gUFRSX0VSUih0ZWdy
YS0+ZW1jX2Nsb2NrKTsKPj4+PiArCWVyciA9IFBUUl9FUlJfT1JfWkVSTyh0ZWdyYS0+ZW1jX2Ns
b2NrKTsKPj4+PiArCWlmIChlcnIpIHsKPj4+PiArCQlpZiAoZXJyICE9IC1FUFJPQkVfREVGRVIp
Cj4+Pj4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBnZXQgZW1jIGNsb2NrOiAl
ZFxuIiwKPj4+PiArCQkJCWVycik7Cj4+Pj4gKwkJcmV0dXJuIGVycjsKPj4+PiAgCX0KPj4+PiAg
Cj4+Pj4gIAllcnIgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+Pj4+Cj4+Pgo+Pj4gQXMg
SSBjb21tZW50ZWQgb24gcGF0Y2gxMCwgSSByZWNvbW1lbmQgdGhhdCB5b3UgYWRkIHRoZSBUZWdy
YSBFTUMgZHJpdmVyCj4+PiBjb21taXQgaW5mb3JtYXRpb24gaW50byBwYXRjaCBkZXNjcmlwdGlv
biBhbmQgTG9va3MgZ29vZCB0byBtZS4KPj4+Cj4+Cj4+IEhlbGxvLCBDaGFud29vIQo+Pgo+PiBU
aGlzIHBhdGNoMTEgYW5kIHBhdGNoMTAgYXJlIGRlcGVuZGluZyBvbiB0aGUgcGF0Y2hlcyA0LzUg
KHRoZSBUZWdyYSBFTUMKPj4gZHJpdmVyIHBhdGNoZXMpIG9mICp0aGlzKiBzZXJpZXMsIGhlbmNl
IHRoZXJlIGlzIG5vIGNvbW1pdCBpbmZvcm1hdGlvbi4KPj4gSSdtIGV4cGVjdGluZyB0aGF0IHRo
aXMgd2hvbGUgc2VyaWVzIHdpbGwgZ28gdmlhIHRlZ3JhIHRyZWUgb25jZSBhbGwgdGhlCj4+IHBh
dGNoZXMgd2lsbCBiZSByZXZpZXdlZCBhbmQgY29sbGVjdCBhbGwgdGhlIG5lY2Vzc2FyeSBhY2tz
IGZyb20geW91LAo+PiBJQ0MgYW5kIENMSyBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMuCj4+Cj4+IFBs
ZWFzZSBmZWVsIGZyZWUgdG8gZ2l2ZSB5b3VycyBhY2sgdG8gdGhlIHBhdGNoZXMgMTAvMTEgaWYg
dGhleSBhcmUgZ29vZAo+PiB0byB5b3UgOikKPj4KPj4KPiAKPiBPSy4gTG9va3MgZ29vZCB0byBt
ZQo+IEFja2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KPiAKClRo
YW5rIHlvdSEgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
