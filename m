Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02292DDFDC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B546E89D79;
	Fri, 18 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB5D897DC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 19:01:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o17so57368946lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=81D+yHFMAabVlf+2tjVOZShdc9YBbXvn/2mHiBk65M8=;
 b=E4VCRRwgR/wwwJZ3vV67dTB9C325unQ0kkUOLNhfK3cB9Coik2iK9XFK1Mkl7Li7BV
 ljYTYh7ccCTr9J8kDePLB/tKR1Ax6UPYyQdMOfo9OtZ/RY/xHNsoRGtTqVGNhEX7lu9m
 t8h7XcmH+TqCHlqiQE0P/LB3C6qNwDVQ322flLSUavE6ycdJkAibg+I4vgFqgparDlys
 h7QAlaLgGU+0khcKtaPcZ0Q76U+UZCdJqQ1x4yDKGxpdTxxLf+bBwkyphA0AgxakdYTO
 m3wAoVXRlQtyAVWMhNILnhc1J6IakGhyInFhMSoa9IuwTqk4krYzDREl8VrcPFk8ZRZS
 A7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=81D+yHFMAabVlf+2tjVOZShdc9YBbXvn/2mHiBk65M8=;
 b=VsMYw6HGOUJTHg2vESZMO0mG3XM342JRzt+h4DRBSfJpiyvR3P3H3m+XItXlX/gVjv
 q0G3et/kTKLq+f59izmfAN9fZPgtN1wt60iwPdYAAOgc7XhhFSKlHBEicORF/tOgUE72
 KFfSKsgzXaewueJzEtVCO7N7uVj6yyb0tdvnualVquEgLwjX/+BW0rDsFMmMysHyCxEM
 oiAV8NXdfsRmrmhJMoz2sYsrux+flIRMnWL7h6qibbJ848n1lDwltMHTZcDty3wQIbUZ
 ikaICsZwmn9oHj6p4Lk1mSBPi1TUTDWEp/ayHOBrYJncQYDGE3gvwWogYjDja7ZdmBZ1
 6GdQ==
X-Gm-Message-State: AOAM531M22ogPSGiLyk4sthNuiLL4E17i7f4wWp3IHxDzirN92yE1L2V
 zriPfDGdMvlsGE/hFKGp9pA=
X-Google-Smtp-Source: ABdhPJz2fbmlKJZp5mILGAenl01AxesjkvEREd6Ss2Woz35PQnzT59ZzuIIso9Jym8YQiMAeMBzqQw==
X-Received: by 2002:a2e:4c11:: with SMTP id z17mr323589lja.364.1608231663452; 
 Thu, 17 Dec 2020 11:01:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id l1sm671498lfk.201.2020.12.17.11.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 11:01:02 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
 and thermal throttling
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-48-digetx@gmail.com>
 <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
Date: Thu, 17 Dec 2020 22:01:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMTIuMjAyMCAyMToyOCwgRGFuaWVsIExlemNhbm8g0L/QuNGI0LXRgjoKPiBPbiAxNy8xMi8y
MDIwIDE5OjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEVuYWJsZSBDUFUgdm9sdGFnZSBz
Y2FsaW5nIGFuZCB0aGVybWFsIHRocm90dGxpbmcgb24gVGVncmEyMCBWZW50YW5hIGJvYXJkLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+
IC0tLQo+PiAgYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEyMC12ZW50YW5hLmR0cyB8IDQwICsrKysr
KysrKysrKysrKysrKysrKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Rl
Z3JhMjAtdmVudGFuYS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLXZlbnRhbmEuZHRz
Cj4+IGluZGV4IDE0YWNlMmVmNzQ5Yy4uYzJkOWYzODk2MGJjIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy90ZWdyYTIwLXZlbnRhbmEuZHRzCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3RlZ3JhMjAtdmVudGFuYS5kdHMKPj4gQEAgLTIsOCArMiwxMCBAQAo+PiAgL2R0cy12MS87
Cj4+ICAKPj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5oPgo+PiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPgo+PiAgI2luY2x1ZGUgInRlZ3JhMjAu
ZHRzaSIKPj4gICNpbmNsdWRlICJ0ZWdyYTIwLWNwdS1vcHAuZHRzaSIKPj4gKyNpbmNsdWRlICJ0
ZWdyYTIwLWNwdS1vcHAtbWljcm92b2x0LmR0c2kiCj4+ICAKPj4gIC8gewo+PiAgCW1vZGVsID0g
Ik5WSURJQSBUZWdyYTIwIFZlbnRhbmEgZXZhbHVhdGlvbiBib2FyZCI7Cj4+IEBAIC01MjcsOSAr
NTI5LDEwIEBAIGxkb19ydGMgewo+PiAgCQkJfTsKPj4gIAkJfTsKPj4gIAo+PiAtCQl0ZW1wZXJh
dHVyZS1zZW5zb3JANGMgewo+PiArCQluY3QxMDA4OiB0ZW1wZXJhdHVyZS1zZW5zb3JANGMgewo+
PiAgCQkJY29tcGF0aWJsZSA9ICJvbm5uLG5jdDEwMDgiOwo+PiAgCQkJcmVnID0gPDB4NGM+Owo+
PiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+Owo+PiAgCQl9Owo+PiAgCX07Cj4+ICAK
Pj4gQEAgLTYxNSwxMCArNjE4LDEzIEBAIGNsazMya19pbjogY2xvY2tAMCB7Cj4+ICAKPj4gIAlj
cHVzIHsKPj4gIAkJY3B1MDogY3B1QDAgewo+PiArCQkJY3B1LXN1cHBseSA9IDwmdmRkX2NwdT47
Cj4+ICAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZjcHUwX29wcF90YWJsZT47Cj4+ICsJCQkj
Y29vbGluZy1jZWxscyA9IDwyPjsKPj4gIAkJfTsKPj4gIAo+PiAgCQljcHVAMSB7Cj4+ICsJCQlj
cHUtc3VwcGx5ID0gPCZ2ZGRfY3B1PjsKPj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmNw
dTBfb3BwX3RhYmxlPjsKPj4gIAkJfTsKPj4gIAl9Owo+PiBAQCAtNzE3LDQgKzcyMywzNiBAQCBz
b3VuZCB7Cj4+ICAJCQkgPCZ0ZWdyYV9jYXIgVEVHUkEyMF9DTEtfQ0RFVjE+Owo+PiAgCQljbG9j
ay1uYW1lcyA9ICJwbGxfYSIsICJwbGxfYV9vdXQwIiwgIm1jbGsiOwo+PiAgCX07Cj4+ICsKPj4g
Kwl0aGVybWFsLXpvbmVzIHsKPj4gKwkJY3B1LXRoZXJtYWwgewo+PiArCQkJcG9sbGluZy1kZWxh
eS1wYXNzaXZlID0gPDEwMDA+OyAvKiBtaWxsaXNlY29uZHMgKi8KPj4gKwkJCXBvbGxpbmctZGVs
YXkgPSA8NTAwMD47IC8qIG1pbGxpc2Vjb25kcyAqLwo+PiArCj4+ICsJCQl0aGVybWFsLXNlbnNv
cnMgPSA8Jm5jdDEwMDggMT47Cj4+ICsKPj4gKwkJCXRyaXBzIHsKPj4gKwkJCQl0cmlwMDogY3B1
LWFsZXJ0MCB7Cj4+ICsJCQkJCS8qIHN0YXJ0IHRocm90dGxpbmcgYXQgNTBDICovCj4+ICsJCQkJ
CXRlbXBlcmF0dXJlID0gPDUwMDAwPjsKPj4gKwkJCQkJaHlzdGVyZXNpcyA9IDwyMDA+Owo+IAo+
IERpZCB5b3UgbWVhbiA8MjAwMD4gPwoKVGhlIDwyMDA+IGlzIGNvcnJlY3QuCgpQbGVhc2Ugc2Vl
IHRoaXMgY29tbWl0IGZvciBleGFtcGxlOgoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MmIyMjM5M2Iy
NzY3MGI0NWEyYzg3MGJjZTNkZjY1NzllZmQ5YTg2YQoKPj4gKwkJCQkJdHlwZSA9ICJwYXNzaXZl
IjsKPj4gKwkJCQl9Owo+PiArCj4+ICsJCQkJdHJpcDE6IGNwdS1jcml0IHsKPj4gKwkJCQkJLyog
c2h1dCBkb3duIGF0IDYwQyAqLwo+PiArCQkJCQl0ZW1wZXJhdHVyZSA9IDw2MDAwMD47Cj4+ICsJ
CQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47Cj4gCj4gSSB0aGluayB5b3UgY2FuIGRyb3AgdGhlIGh5
c3RlcmVzaXMgaGVyZSwgd2hlbiB0aGUgY3JpdGljYWwgdGVtcGVyYXR1cmUKPiBpcyByZWFjaGVk
LCB0aGVyZSBpcyBhbiBlbWVyZ2VuY3kgc2h1dGRvd24uCgpZZXMsIHBlcmhhcHMgeW91J3JlIHJp
Z2h0LiBIeXN0ZXJlc2lzIGRvZXNuJ3QgbWFrZSBzZW5zZSBmb3IgYSBjcml0aWNhbAp0cmlwLiBJ
J2xsIGltcHJvdmUgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24sIHRoYW5rcy4KCj4gNTDCsEMgYW5k
IDYwwrBDIHNvdW5kIHZlcnkgbG93IHZhbHVlcywgbm8gPwoKVGVncmEyMCBDUFUgaXMgdmVyeSBj
b2xkIGluIGNvbXBhcmlzb24gdG8gbGF0ZXIgZ2VuZXJhdGlvbnMsIGl0IHNob3VsZApzdGF5IHVu
ZGVyIDUwwrBDIGV2ZW4gYXQgYSBmdWxsIGxvYWQuCgo+PiArCQkJCQl0eXBlID0gImNyaXRpY2Fs
IjsKPj4gKwkJCQl9Owo+PiArCQkJfTsKPj4gKwo+PiArCQkJY29vbGluZy1tYXBzIHsKPj4gKwkJ
CQltYXAwIHsKPj4gKwkJCQkJdHJpcCA9IDwmdHJpcDA+Owo+PiArCQkJCQljb29saW5nLWRldmlj
ZSA9IDwmY3B1MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+IAo+IFlvdSBz
aG91bGQgYWRkIGFsbCBDUFVzIGhlcmUuCgoKQWxsIENQVSBjb3JlcyBhcmUgY291cGxlZCBvbiBU
ZWdyYSBpbiByZWdhcmRzIHRvIENQVUZyZXEsIGhlbmNlIEkgdGhpbmsKaXQgd29uJ3QgbWFrZSBh
bnkgZGlmZmVyZW5jZSBpZiBzZWNvbmRhcnkgQ1BVIGNvcmVzIHdpbGwgYmUgYWRkZWQgaGVyZSwK
aXNuJ3QgaXQ/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
