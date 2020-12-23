Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B556F2E1B46
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6026E8FE;
	Wed, 23 Dec 2020 10:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA67898A4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 04:19:38 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2so9646683pfq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 20:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=26Fr+AtJaqoWMCq9NSUD8XDm547WXau8kIa+Po3ijaQ=;
 b=sT3RPi0cmSySv3TpxqXakwSZd4+TeVAbgUtHRhhkr9zD2oKndQhh3nAF2ZWRKFEwst
 fxL85ZuUBFNAQ5onTZ3nMEdhsWGrllkYRYl1tGbri1cjmNeEdBXqoR00oFAdZlinf2sG
 i3trnl1FImHrkHWsQjqfYqktVg5C0p9hGp3zMs/4X0+liPYJ7Fj35h7EVOzzqMQQ4BmP
 NoOLT9BhfddUa5brM8O18Y39e3dDinW3tOqST333s6BHhsMhvIuY7sARBYQPtJaNRvta
 GBJlJv49y/k+55A3aNfm4MsUIuzj/qy5vzUrSvfzWGdcTkTePTwKJsgOch7YgnJiucC7
 W3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=26Fr+AtJaqoWMCq9NSUD8XDm547WXau8kIa+Po3ijaQ=;
 b=PCf5CDRuHWun7oEpaUmNAfJMbaq9+6zHLqi4Q3nlhM0y2tAhlbQWTH6mmkDQqAjYjw
 e8oqDQssko5ZKQH+Pb/dznYCtSmguwR7dimS1DG0/NJ5Hqm2JV6Ud9GfBmoSa5IDrIP7
 J+o2GXgU4Xrrjg6cMlyglk0bjSi5saBpSqileW7xuxK4HxyI3d6ZfZUhONXLYePJYgnP
 z9BrdoEzd1///Zv7rBOg9/r5JPM/N8gnufLo7RPFXMpiucsCpaGsQWQN2ppJdmRlMRF0
 wLQWjrcQoQxe8/YhY8QhoWVJx+Q1C9SLUTfFhRU7FIkGX/Jo9/cDywuGR1Bdd9hjlO1h
 maMg==
X-Gm-Message-State: AOAM5327dPFbxNxH16mKFm75119hdWtsPQIs+XhOVxX950S/aRY45sRU
 GpwgjrmEZRmvt80R5SKuBDTkCQ==
X-Google-Smtp-Source: ABdhPJz3XTw78JGZT3bqt2E1D4SaVZTnIQudWjGvtEJkaUATY8WvaXe+1UR/zVBvhFKdu72MF7n3JA==
X-Received: by 2002:a63:c205:: with SMTP id b5mr310031pgd.281.1608697177622;
 Tue, 22 Dec 2020 20:19:37 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id j23sm2918258pgj.34.2020.12.22.20.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 20:19:36 -0800 (PST)
Date: Wed, 23 Dec 2020 09:49:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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

T24gMjItMTItMjAsIDIyOjE1LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjIuMTIuMjAyMCAw
OTo0MiwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAxNy0xMi0yMCwgMjE6MDYsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBBZGQgYSBjZWlsIHZlcnNpb24gb2YgdGhlIGRldl9w
bV9vcHBfZmluZF9sZXZlbCgpLiBJdCdzIGhhbmR5IHRvIGhhdmUgaWYKPiA+PiBsZXZlbHMgZG9u
J3Qgc3RhcnQgZnJvbSAwIGluIE9QUCB0YWJsZSBhbmQgemVybyB1c3VhbGx5IG1lYW5zIGEgbWlu
aW1hbAo+ID4+IGxldmVsLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPgo+ID4gCj4gPiBXaHkgZG9lc24ndCB0aGUgZXhhY3QgdmVyc2lv
biB3b3JrIGZvciB5b3UgaGVyZSA/Cj4gPiAKPiAKPiBUaGUgZXhhY3QgdmVyc2lvbiB3b24ndCBm
aW5kIE9QUCBmb3IgbGV2ZWw9MCBpZiBsZXZlbHMgZG9uJ3Qgc3RhcnQgd2l0aAo+IDAsIHdoZXJl
IDAgbWVhbnMgdGhhdCBtaW5pbWFsIGxldmVsIGlzIGRlc2lyZWQuCgpSaWdodCwgYnV0IHdoeSBk
byB5b3UgbmVlZCB0byBzZW5kIDAgZm9yIHlvdXIgcGxhdGZvcm0gPwoKLS0gCnZpcmVzaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
