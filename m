Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0C2E2AD0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C20789BD4;
	Fri, 25 Dec 2020 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BC289EF7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:38:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h22so348779lfu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 12:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BZZtJhCkWZc0cTu4suSdN5Dy6qe4mWg5o8z0m1xWmmw=;
 b=ryiTXp95qJn3hFRmeJjFriZA3fRZe1LJkWmcStreS7S1HQzZvQ0MFhnfpf8nwhNZ+4
 byR/kGF7kq8hlx5i8bOSUk5NbfdQl49IIHl5VzTJhFAUygr8vLTNhJ6H9Fr/z4s+Who0
 JSriRDvMEt/sMeC73CcldS07HXFoDDBz34L54otuUG5Pah50GAz4ZCG0agHFcRBy4X2B
 uyI9p6Hg2CYCO7Yg+T9pERyUpRZJUMR2bvIpKnby2t9wroelhS9PxVj2Q6pIuSrKlNIU
 RU2TtFLooW88UoEwgf+7Giff7nBqFk13MWhzd5vTNj//iXu3ditDHhkIaXA/gzp/AW4E
 TNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZZtJhCkWZc0cTu4suSdN5Dy6qe4mWg5o8z0m1xWmmw=;
 b=TKRG7iyENMlg2OShmuyykQFBTugQp+8EmMJ3/SmPlhNrnzAURcHcM0VJs2rtl3nsTa
 T791S08lxjISrmCer13QJggSTVP6Jpk9QVET2VGiX1pjG9GYhm8fzWXqZNnSdb/O05xs
 PirUMo3y2ktzDCQuj2WbWQC+l8dQAmCL3HMd+nosGuvG892Q4nP48XppHR+/mTpQ8Noi
 Uo9mGDGRwrnTIx0DK3C/FTi7NUOOgHLuAfxXZMqH/8bWRacrpT8qV5cZqPvJ01WG/QZ5
 agYsEdxx6Kjy3ZxULHo44DibhYCd/13xBkFERNWMMpGJIX7EiabFm59QhRMAaT/5JoXL
 0ihA==
X-Gm-Message-State: AOAM5317iK/xrE33B+svPfNVVdPRVTTbWhjGQ4un2FqHfmaonUsunCxk
 lzAm53DglOKGOVuZS30grao=
X-Google-Smtp-Source: ABdhPJwfBMyGf+UGyLbLjeTseB6B9wXUQfbXnzUgDrthVMBm31fXo34JrVL1gowO+ssG8p2R1uqvrg==
X-Received: by 2002:a19:f718:: with SMTP id z24mr12249722lfe.532.1608755926503; 
 Wed, 23 Dec 2020 12:38:46 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id z3sm3378258lfj.140.2020.12.23.12.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 12:38:46 -0800 (PST)
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
 <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea025b0f-bb2a-d075-4c8e-45831fa9cd93@gmail.com>
Date: Wed, 23 Dec 2020 23:38:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

MjMuMTIuMjAyMCAwOTowMSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFN1cHBvcnQgc2V0X29wcCgpIGN1c3Rv
bWl6YXRpb24gd2l0aG91dCByZXF1aXJpbmcgdG8gdXNlIHJlZ3VsYXRvcnMuIFRoaXMKPj4gaXMg
bmVlZGVkIGJ5IGRyaXZlcnMgd2hpY2ggd2FudCB0byB1c2UgZGV2X3BtX29wcF9zZXRfcmF0ZSgp
IGZvciBjaGFuZ2luZwo+PiByYXRlcyBvZiBhIG11bHRpcGxlIGNsb2NrcyBhbmQgZG9uJ3QgbmVl
ZCB0byB0b3VjaCByZWd1bGF0b3IuCj4+Cj4+IE9uZSBleGFtcGxlIGlzIE5WSURJQSBUZWdyYTMw
LzExNCBTb0NzIHdoaWNoIGhhdmUgdHdvIHNpYmxpbmcgM0QgaGFyZHdhcmUKPj4gdW5pdHMgd2hp
Y2ggc2hvdWxkIGJlIHVzZSB0byB0aGUgc2FtZSBjbG9jayByYXRlLCBtZWFud2hpbGUgdm9sdGFn
ZQo+PiBzY2FsaW5nIGlzIGRvbmUgdXNpbmcgYSBwb3dlciBkb21haW4uIEluIHRoaXMgY2FzZSBP
UFAgdGFibGUgZG9lc24ndCBoYXZlCj4+IGEgcmVndWxhdG9yLCBjYXVzaW5nIGEgTlVMTCBkZXJl
ZmVyZW5jZSBpbiBfc2V0X29wcF9jdXN0b20oKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvb3BwL2NvcmUu
YyB8IDE2ICsrKysrKysrKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vcHAvY29yZS5j
IGIvZHJpdmVycy9vcHAvY29yZS5jCj4+IGluZGV4IDNkMDJmZTMzNjMwYi4uNjI1ZGFlN2E1ZWNi
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL29wcC9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9vcHAv
Y29yZS5jCj4+IEBAIC04MjgsMTcgKzgyOCwyNSBAQCBzdGF0aWMgaW50IF9zZXRfb3BwX2N1c3Rv
bShjb25zdCBzdHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGUsCj4+ICAJCQkgICBzdHJ1Y3QgZGV2
X3BtX29wcF9zdXBwbHkgKm9sZF9zdXBwbHksCj4+ICAJCQkgICBzdHJ1Y3QgZGV2X3BtX29wcF9z
dXBwbHkgKm5ld19zdXBwbHkpCj4+ICB7Cj4+IC0Jc3RydWN0IGRldl9wbV9zZXRfb3BwX2RhdGEg
KmRhdGE7Cj4+ICsJc3RydWN0IGRldl9wbV9zZXRfb3BwX2RhdGEgKmRhdGEsIHRtcF9kYXRhOwo+
PiArCXVuc2lnbmVkIGludCByZWd1bGF0b3JfY291bnQ7Cj4+ICAJaW50IHNpemU7Cj4+ICAKPj4g
LQlkYXRhID0gb3BwX3RhYmxlLT5zZXRfb3BwX2RhdGE7Cj4+ICsJaWYgKG9wcF90YWJsZS0+c2V0
X29wcF9kYXRhKSB7Cj4+ICsJCWRhdGEgPSBvcHBfdGFibGUtPnNldF9vcHBfZGF0YTsKPj4gKwkJ
cmVndWxhdG9yX2NvdW50ID0gb3BwX3RhYmxlLT5yZWd1bGF0b3JfY291bnQ7Cj4+ICsJfSBlbHNl
IHsKPj4gKwkJZGF0YSA9ICZ0bXBfZGF0YTsKPj4gKwkJcmVndWxhdG9yX2NvdW50ID0gMDsKPj4g
Kwl9Cj4+ICsKPiAKPiBXZSBzaG91bGQgdXNlIHRoZSBzYW1lIHN0cnVjdHVyZSwgeW91IGNhbiBh
ZGQgc29tZSBjaGVja3MgYnV0IG5vdCByZXBsYWNlIHRoZQo+IHN0cnVjdHVyZSBhbHRvZ2V0aGVy
LgoKV2VsbCwgdGhlcmUgaXMgbm8gInNhbWUgc3RydWN0dXJlIiwgdGhlIG9wcF90YWJsZS0+c2V0
X29wcF9kYXRhIGlzIE5VTEwKdGhlcmUuCgpJIGNhbiByZS13cml0ZSBpdCBsaWtlIHRoaXMgaWYg
aXQgbG9va3MgYmV0dGVyIHRvIHlvdToKCnN0YXRpYyBpbnQgX3NldF9vcHBfY3VzdG9tKC4uLikK
ewoJc3RydWN0IGRldl9wbV9zZXRfb3BwX2RhdGEgKmRhdGE7Cgl1bnNpZ25lZCBpbnQgcmVndWxh
dG9yX2NvdW50OwoJaW50IHNpemU7CgorCWlmICghb3BwX3RhYmxlLT5zZXRfb3BwX2RhdGEpIHsK
KwkJc3RydWN0IGRldl9wbV9zZXRfb3BwX2RhdGEgZnJlcV9kYXRhID0ge307CisKKwkJZnJlcV9k
YXRhLmRldiA9IGRldjsKKwkJZnJlcV9kYXRhLmNsayA9IG9wcF90YWJsZS0+Y2xrOworCQlmcmVx
X2RhdGEubmV3X29wcC5yYXRlID0gZnJlcTsKKwkJZnJlcV9kYXRhLm9sZF9vcHAucmF0ZSA9IG9s
ZF9mcmVxOworCisJCXJldHVybiBvcHBfdGFibGUtPnNldF9vcHAoJmZyZXFfZGF0YSk7CisJfQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
