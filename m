Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC9A2E1B31
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF606E907;
	Wed, 23 Dec 2020 10:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2D56E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:15:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h205so34512438lfd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bPx7EE6PSbCPkDarnx0nbSqX4DyTXsuDpEiN7AF5ASk=;
 b=by5CwRSkj7I1IIVMvp0X5QOxMswVE4c93suYm7juykVfkZccthrQYR/1LHg5tNX9Fs
 G5RwLCFfqZuGdA/NMT84/GKhThuNV13dgCCXDs/xbrTgpQc5HAhUTsSNzuw3OAt9hmPF
 rCBS/+GhCjpuMIBVDAodHt0e2K5MCFdMyRJCUenuFRI69khvLmnFtCssyFBTVA8mgAI3
 +P71mriOwhz3yEpqEecEZB4c63IhIbysXU/t4EmQ7A6e7VqHYmWGP4lyIkwrmWQ8nyWi
 oYy5aN+2WIyhWj0VJdqnrFFB/kKhcNWdk3BD+639Sf/Qe3l2191KixQ85whWtQvBNbO5
 Japg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bPx7EE6PSbCPkDarnx0nbSqX4DyTXsuDpEiN7AF5ASk=;
 b=F+kFup05hf5l3i7fb+u++S+GqHstUw/7tBtEvzaH9zfd7Adk0bK2tyS5iwyLLOf1Pp
 71jhaUemxGJflTt4LvOqT1KzOM+dqp3wecsPUpBIs1jDBckdaaLGJKopZBlKmgOPmuBz
 aE/kR6r55R0WWy3DPy8siSyhHNNxx2vDo9wXKejbcdCI6shPcKy6ZSB4qJIkKpcN5m8e
 e0n2pvfkXTYsd7VVPq2ZAzJApXXOCcJkbwZ7A2AwfR1CjVI4R/gYWY6T76H52gA3GvWZ
 GYzQWl8zxNp/HQod3cwh/Sspn/vdYkNDCkKsMICibJJ9hDDKmvkSHJyt1B0OwdvoZA+A
 5eDQ==
X-Gm-Message-State: AOAM5315EY28zTjeJQY9KT1j9KaDzZt8ZXRLILqYCep3TmniIS68Anml
 M0lhy6xBcXtxaJegiaJalE4=
X-Google-Smtp-Source: ABdhPJzHaWjDXUMak9w+Uk5NxxvdBfxwblLdXjwl2xjCH+RslfqzQ0040C+FqW1K8XqCgG6Upk0xGA==
X-Received: by 2002:a2e:9847:: with SMTP id e7mr10954928ljj.388.1608664553007; 
 Tue, 22 Dec 2020 11:15:53 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id f23sm2788410lfh.196.2020.12.22.11.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:15:52 -0800 (PST)
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
Date: Tue, 22 Dec 2020 22:15:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
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

MjIuMTIuMjAyMCAwOTo0MiwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEFkZCBhIGNlaWwgdmVyc2lvbiBvZiB0
aGUgZGV2X3BtX29wcF9maW5kX2xldmVsKCkuIEl0J3MgaGFuZHkgdG8gaGF2ZSBpZgo+PiBsZXZl
bHMgZG9uJ3Qgc3RhcnQgZnJvbSAwIGluIE9QUCB0YWJsZSBhbmQgemVybyB1c3VhbGx5IG1lYW5z
IGEgbWluaW1hbAo+PiBsZXZlbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPgo+IAo+IFdoeSBkb2Vzbid0IHRoZSBleGFjdCB2ZXJzaW9uIHdv
cmsgZm9yIHlvdSBoZXJlID8KPiAKClRoZSBleGFjdCB2ZXJzaW9uIHdvbid0IGZpbmQgT1BQIGZv
ciBsZXZlbD0wIGlmIGxldmVscyBkb24ndCBzdGFydCB3aXRoCjAsIHdoZXJlIDAgbWVhbnMgdGhh
dCBtaW5pbWFsIGxldmVsIGlzIGRlc2lyZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
