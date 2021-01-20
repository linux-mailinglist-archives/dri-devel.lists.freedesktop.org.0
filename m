Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B72FE596
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ADE6E909;
	Thu, 21 Jan 2021 08:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49E789EA3;
 Wed, 20 Jan 2021 16:00:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id v67so34788540lfa.0;
 Wed, 20 Jan 2021 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6pR6fg/vKnYn4hcu/THLeviR1hmHEHC9vnXYnmcjF/Q=;
 b=abtLr1uy/58LoLQJLzYbf0L+o2zJbLuT/uYCyd48HpLF2JAhOx0hrfWwOfIcXeXTgE
 9HOfUHGHmtSumGGVFBAuddWJ/pQvwtaaVjlR8LOgYJgvOr0axxti6ZdEumKE2Pdt5BDV
 FdhlVFIlj6sF2mxWlGuxZfNjGlGpgOG+qnZ8Et4+3QqTh7tvZ5Ct1Xh1dbAdXTf2umqX
 8x4F+Ku4eBtZ7uQ6IoiGOouZ5VCOxgk5/J7a8NInuLXOSX16zmC+Z7HYRrj5QDJifKoe
 cNs1iMgtdoOFx+imchuo2kJ4HyYbPQwyxvWWVEV3zFd+tqiJgOtPAD/z2arSBt5IR3Cd
 InCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6pR6fg/vKnYn4hcu/THLeviR1hmHEHC9vnXYnmcjF/Q=;
 b=is+zYp1JfJvc8i5OQ/oKoYQ4pNYclWs7IJKvg9j7PHAkRJKJNmdt/3CCokZuv7tFum
 SC+O/nBAbFVtIphgvsrb/cuHin+l28+xeea6ldN3uztv7VJiBfkOtq/YNiCbu0JVjg8t
 5MABWjRycBVTvgIkx/8Vaqr6lupXy4LyzO06A9twoG8YeTD4yFimw/Y/m4053zk7KAM9
 yPjxx8FLZdYlfHwUhekPAGMKOs6U0Zjnb8QPkgJpHVJ/91UKPOwtIjyQlP6aD+Wt8LnI
 FF4Aq/iAcEZ58dH976pSi2pfNMMzl0cpavMijm0q7wOyNQYpzoYiMfk1iehczECmRTlV
 wfIw==
X-Gm-Message-State: AOAM530L/PCu2z0YUdc+2Ao2GMY8Jo6dU/29iUcY87FAxZjvCQVUgWpq
 07H0fUmBS6YYVoLFQrUuclw=
X-Google-Smtp-Source: ABdhPJx4ryhDhUccrXGgvid3ZVbrnrbevGoNExSyx1pGmnWuOH6PWddYTRxvkvma6v12P7EIGAI0ZA==
X-Received: by 2002:ac2:58f2:: with SMTP id v18mr4396795lfo.623.1611158422110; 
 Wed, 20 Jan 2021 08:00:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id 76sm233715lfh.163.2021.01.20.08.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:00:21 -0800 (PST)
Subject: Re: [PATCH 24/31] memory: tegra20: convert to use devm_pm_opp_* API
To: Yangtao Li <tiny.windzz@gmail.com>, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, krzk@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
 lukasz.luba@arm.com, adrian.hunter@intel.com, ulf.hansson@linaro.org,
 vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, ddavenport@chromium.org,
 jsanka@codeaurora.org, rnayak@codeaurora.org, tongtiangen@huawei.com,
 miaoqinglang@huawei.com, khsieh@codeaurora.org, abhinavk@codeaurora.org,
 chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
 mka@chromium.org, harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
 natechancellor@gmail.com, georgi.djakov@linaro.org, akashast@codeaurora.org,
 parashar@codeaurora.org, dianders@chromium.org
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-25-tiny.windzz@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b9f19bb2-c225-b64d-a995-1f84926bd18b@gmail.com>
Date: Wed, 20 Jan 2021 19:00:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-25-tiny.windzz@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:32 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDEuMjAyMSAxOTo1NSwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+IFVzZSBkZXZtX3BtX29w
cF8qIEFQSSB0byBzaW1wbGlmeSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkg
PHRpbnkud2luZHp6QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZW1vcnkvdGVncmEvdGVn
cmEyMC1lbWMuYyB8IDI5ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKVGhlcmUgYXJlIGFsc28g
dGVncmEzMC1lbWMuYyBhbmQgdGVncmExMjQtZW1jLmMgd2l0aCBhIHNpbWlsYXIgT1BQIGNvZGUu
CgpCdXQgY291bGQgd2UgcGxlYXNlIG5vdCB0b3VjaCB0aGVzZSBtZW1vcnkgZHJpdmVycz8gSSBh
bHJlYWR5IGhhdmUgYQpwcmVwYXJlZCBwYXRjaCB3aGljaCByZXBsYWNlcyBhbGwgdGhlIHRlZ3Jh
X2VtY19vcHBfdGFibGVfaW5pdCgpIHdpdGggYQpzaW5nbGUgY29tbW9uIGhlbHBlciB0aGF0IHdp
bGwgdXNlIGRldm1fb3BwXyogaGVscGVycy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
