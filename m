Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B032E1B25
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46F36E8F6;
	Wed, 23 Dec 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7DD6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:25:48 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id o19so34653098lfo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9+keXiLEk5gQGJPiWQkNdVYaSlolI1HV8zcJ2QbRMaQ=;
 b=cwmcOiIr56V+aHnviMOFhw4VD72whd2PBync3o2+Hbov28yOUg+OUoW9TCbUrF9P1z
 iCRrQp9DPbIlRmFAPpxKl10fINbO2txdguE4fAtCEdBTFYfMxy4ma+XExex7QQ3gFSeJ
 nC5LDYQ+63FHdkW7zMlIxWgJ0wJ+v7KvHPjTJB+RafkLgtHDhMnywSssMjo/Gfn6wYeU
 fDyHODxQh4aeFeVk6uVvyTBf9nNKrE+DRPAEGtvHoNOFhgLj6Swvyjx1qn8C2H09a4Ev
 ICJ8rRt14rTpnFJqgWe75rftGv5vf1RMl4t91L00Om2U2JCDPdmm82uzrx5BnSy8/cQ3
 JgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+keXiLEk5gQGJPiWQkNdVYaSlolI1HV8zcJ2QbRMaQ=;
 b=Lep5TY7Vx7Fj8QBfMDmw+uIa2Rd3PkHL+Iv9ZhbsMpEGH7m6b22C1VQXb7aiUe6suj
 p4El7XK2nktbRDWALOGbtHJ9Z4J8QELIfO7AKi18lIfWee3Ybeq4g9MWvQO5UQE+FJRW
 5zI+aaahaAwk12bXW07Ye04WYTz+8yKNLIzyc0ZqZRAm4D4eUwFiLhlEVMkHw3pAn5nW
 BLazzZzCRC+KukLwAgksCtThVMDeCzllaUFLnSpNP5UH6HBXNWLbhXHuM2JFXaansA4f
 +/0H7YBUYe834liQY4fDHcjr9h+W9F4ULEplvYp0mvPhQklD2ZkQ0zp8jeE/VFjIkV28
 uFfw==
X-Gm-Message-State: AOAM532QL3XP4eCxtTK7Y+WO2gTCUbe+Tgi4TJC9oQcHZT5eO5+knDNV
 r+/oGgGqIRCPa7e41yDqdh8=
X-Google-Smtp-Source: ABdhPJyXtIjDqUhu/7BRrpZ/tJi+1x7pRk7GyjlCea8ARaozHJ2tNG8EUYgfA3mlRH1V24zHnzlI9w==
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr10050098ljp.35.1608665147257; 
 Tue, 22 Dec 2020 11:25:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id d23sm3012942ljj.24.2020.12.22.11.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:25:46 -0800 (PST)
Subject: Re: [PATCH v2 44/48] ARM: tegra: Add OPP tables and power domains to
 Tegra30 device-tree
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-45-digetx@gmail.com>
 <20201222091408.vvputqs27olywdxq@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c00dbbb3-88fc-6606-e5b1-dcd6a3e60383@gmail.com>
Date: Tue, 22 Dec 2020 22:25:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222091408.vvputqs27olywdxq@vireshk-i7>
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

MjIuMTIuMjAyMCAxMjoxNCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy90ZWdyYTMwLXBlcmlwaGVyYWxzLW9wcC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMv
dGVncmEzMC1wZXJpcGhlcmFscy1vcHAuZHRzaQo+PiBpbmRleCBjYmU4NGQyNWU3MjYuLjk4M2Ri
MWEwNjY4MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEzMC1wZXJpcGhl
cmFscy1vcHAuZHRzaQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLXBlcmlwaGVy
YWxzLW9wcC5kdHNpCj4+IEBAIC0xLDYgKzEsNTYgQEAKPj4gIC8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4+ICAKPj4gIC8gewo+PiArCWNvcmVfb3BwX3RhYmxlOiBjb3JlLXBv
d2VyLWRvbWFpbi1vcHAtdGFibGUgewo+PiArCQljb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2lu
dHMtdjIiOwo+PiArCQlvcHAtc2hhcmVkOwo+PiArCj4+ICsJCWNvcmVfb3BwXzk1MDogb3BwQDk1
MDAwMCB7Cj4+ICsJCQlvcHAtbWljcm92b2x0ID0gPDk1MDAwMCA5NTAwMDAgMTM1MDAwMD47Cj4+
ICsJCQlvcHAtbGV2ZWwgPSA8OTUwMDAwPjsKPiAKPiBQZXJoYXBzIHlvdSBkb24ndCBuZWVkIHRv
IGV4YWN0bHkgY29weSB0aGUgdm9sdGFnZSB2YWx1ZSBpbnRvIHRoZSBsZXZlbCBmaWVsZC4KPiBU
aGUgbGV2ZWwgZmllbGQgY2FuIGp1c3QgYmUga2VwdCB0byAwLCAxLDIsIDMsIGV0Yy4uCgpJdCdz
IG11Y2ggbW9yZSBjb252ZW5pZW50IHRvIHNldCBib3RoIGZpZWxkcyB0byB0aGUgc2FtZSB2YWx1
ZSBiZWNhdXNlCnRoZSBsZXZlbCB2YWx1ZXMgYXJlIHNob3duIGluIEdFTlBEIGRlYnVnZnMgYW5k
IHRoZSAwLDEsMiB2YWx1ZXMgYXJlCm1lYW5pbmdsZXNzIGZyb20gdGhlIGRlYnVnZ2luZyBwZXJz
cGVjdGl2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
