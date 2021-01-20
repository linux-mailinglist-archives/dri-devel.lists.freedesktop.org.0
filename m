Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698712FE56B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532A6E52D;
	Thu, 21 Jan 2021 08:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713289F6B;
 Wed, 20 Jan 2021 15:53:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id p13so26703460ljg.2;
 Wed, 20 Jan 2021 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lE0By9BdqcLq0DFuPQl1N1WFBOvj2HiI4v8fCey86OI=;
 b=O8YbneSc0EPrK+x+ACTtxER1MN0M1XBi9LAGKH0nJM/5YJ1U79U/haRbmcrTpw14Ng
 lBaEFHTJj6uIY63LJCsu0OOLazGC+3p3cBzv4s5khXMYyJCLeRJM3f/UJi7Rf3bv7HNz
 k0aqDb53e+mRms17Zo1upTYQlWehrToOd/0vHZ7fRfi1mE9K/82zL3j5wsS+Se83qP/e
 xJAYfHeMu3zMp0M4hy//z7iIh2UPaY0XFSze5PIVkL8fgXJw/hKGhv8n54eHuLqO+3jk
 XMsUhVHZrUptWva+QjeF42vhw1p0cSAIbp9cNnBd1rO1Ez8jfoRVI+SaUV/sESqO5CFJ
 xJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lE0By9BdqcLq0DFuPQl1N1WFBOvj2HiI4v8fCey86OI=;
 b=EQnNc2Y1khEp5sKMBipRXfjRAZZegpzy8XInIszmVTg8x8Ykt9JDrbQkmsnNO/4WB7
 u59BaJ4EKs4ERJQr+kCyb23OjOxISsIgqjsaHsnbZiLg5yjUcy2bYT5WYZKSu1UjLLDm
 g+qkgKCZomjV9pU6mbv5BukUudRmamJKvXiN+AREUpeOYprB85uW3JzxVFRU50kPusZy
 mnWIjci0ZAYva0wYfkZtN+dY8eIZESbqbD9qT7oBDB6N2fhsX/TB3OafH9dLLPKmewaO
 pbLvTCHE3AEr0bU/4kwHCg1SjZChfb42dqXGVsoMTuz3feweWELEia3KmLjkHDbeuJ2U
 qaCA==
X-Gm-Message-State: AOAM530kueDdtmu1eLQ+/BynQREAg0YgbHEPiZDLybZSL49ZgJAwdFhI
 Jq3TOhysoSjvqFRWhI6TqAE=
X-Google-Smtp-Source: ABdhPJyBy+9sQjBpII9U0Ep8TbQz3BXDkf0PkENZMYoEspvmyYtpJD0VWDKPNhL7YKEOT6kR2w2cOw==
X-Received: by 2002:a2e:a366:: with SMTP id i6mr4945023ljn.427.1611157998525; 
 Wed, 20 Jan 2021 07:53:18 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id w13sm188387ljw.115.2021.01.20.07.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 07:53:17 -0800 (PST)
Subject: Re: [PATCH 03/31] opp: Add devres wrapper for
 dev_pm_opp_set_supported_hw
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
 <20210101165507.19486-4-tiny.windzz@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fc9a1f79-639c-4384-c324-87249ac576fd@gmail.com>
Date: Wed, 20 Jan 2021 18:53:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-4-tiny.windzz@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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

MDEuMDEuMjAyMSAxOTo1NCwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+IEFkZCBkZXZyZXMgd3Jh
cHBlciBmb3IgZGV2X3BtX29wcF9zZXRfc3VwcG9ydGVkX2h3KCkgdG8gc2ltcGxpZnkgZHJpdmVy
Cj4gY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDx0aW55LndpbmR6ekBnbWFp
bC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvb3BwL2NvcmUuYyAgICAgfCAzOCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3BtX29wcC5oIHwgIDgg
KysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpUZXN0ZWQtYnk6IERtaXRyeSBP
c2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
