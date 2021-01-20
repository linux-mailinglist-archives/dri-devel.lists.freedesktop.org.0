Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C02FE586
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A389C6E8FB;
	Thu, 21 Jan 2021 08:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3A6E090;
 Wed, 20 Jan 2021 15:54:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m25so34711187lfc.11;
 Wed, 20 Jan 2021 07:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OraQS0v0Xv5zg7vQaDViOmDICo3Sb7euJyZv9aOaJu8=;
 b=VsvXik7hw5Hl3crun670kcR75wLYFasYTGj7q+1s/NO8wZ5r/tDe5fojKQMoNSQWkS
 aMQAYbRM5GPqs2f8j7Y1mhjlCBqiYJtgxsmi6IyMj+53tNfe7VleKdz1mHUyGb853dsE
 njfONOWRODOxWuzePpWXBtsa+p2FJrq/O4T54gWr5NNYovu6KNFNz4WswCMdb+idfG6U
 g5xIGPzuMp9OeebLCuTvjPWV9vhiOS7CdX0IleSzuo3vRC5dwwq+8FCLSDTcDO9/48IF
 EggAYURVgxOMRFCO2fiU+qag7XnLDo0puFyPuc9SahICXYBvHriLpO7KxR7rLSKKAY+U
 vJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OraQS0v0Xv5zg7vQaDViOmDICo3Sb7euJyZv9aOaJu8=;
 b=riOK07/yhZeOf/6ji7Ps3hAHDu0ag7Qw93BZvYM7/95OF3iADrafMjBNWULXUxjgg4
 ay6zoRRNoi3uC8z6a0AXOBpxlJmkBrmfPtq8jduQJkU74JmlYWy0yrfoAEx+ITb7SRem
 iz1g2HLq48tOpioEQWXed7PE8qqOM/GPIXWwKHuFUE/AMrBZiI597THsAS/tFjT3MKn5
 CYekQI6v3fZsgn3hf8+r0Ltz/XfRQ9EotW/LrwmsXOdOGeGpqY883QegPgtsXMgF2tb5
 x+IxSHRR7UWo4GH23AyHDbrHLzIZajizPy25cNngo+ueskDV+UzAT0rZb8VzfoCCLVpx
 mNeg==
X-Gm-Message-State: AOAM532Rof+oAJjf/IuHTwcvexJZbIKQw+7ssqK1jpjMy2t01HVPeOuY
 JTlcz7K3Vo7Kz8vONh+6PU8=
X-Google-Smtp-Source: ABdhPJxixdZxCteA3EdzQ5S+lWMiRpU31hXGhGOFWP/JeX4pGWhmpG53pDtKr8KAUPnR39Mxv9geQQ==
X-Received: by 2002:a05:6512:3ea:: with SMTP id
 n10mr4495148lfq.535.1611158089273; 
 Wed, 20 Jan 2021 07:54:49 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id 127sm267842ljf.132.2021.01.20.07.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 07:54:48 -0800 (PST)
Subject: Re: [PATCH 04/31] opp: Add devres wrapper for dev_pm_opp_of_add_table
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
 <20210101165507.19486-5-tiny.windzz@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7fde8c7f-8dcc-c085-33e1-35c9db5e1003@gmail.com>
Date: Wed, 20 Jan 2021 18:54:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-5-tiny.windzz@gmail.com>
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

MDEuMDEuMjAyMSAxOTo1NCwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+IEFkZCBkZXZyZXMgd3Jh
cHBlciBmb3IgZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKSB0byBzaW1wbGlmeSBkcml2ZXIKPiBj
b2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPHRpbnkud2luZHp6QGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9vcHAvb2YuYyAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3BtX29wcC5oIHwgIDYgKysrKysr
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IERtaXRy
eSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVua28g
PGRpZ2V0eEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
