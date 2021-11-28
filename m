Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD48460A84
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 23:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2A96E105;
	Sun, 28 Nov 2021 22:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B9C6E105
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 22:03:28 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k37so39497139lfv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 14:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BmJDsI1frubqpSHpwgLMDcWP2GRwtD3Aeu0GDNSS4Ao=;
 b=JqJrLFejdvwG6EFcUaec1471GQnF4o7rWmB6ZJgoVyHzKIkkY8XPck6x3CHTcSe3mr
 7c3WWIfu0LFTWTIWtfr1xMf1sIz9hSxmJjNmg5EpOoGtRIqQYrl7w/0PM+7DPJe3Nxtk
 rN6rxwckbCb/tFQBuTom9QWJWe368iYPCHR6SzKZyxcrZavR0Qvz3FBbGQQWlxES0zx3
 AyGMKx7T8uiK3LGqvY6k4r/pZaiGv/E3eR+VX0o1y8VwEVOx6vlL8inxXaHnS9nNzCHP
 /sog83T0MTHqC7MSI4QlW3DNzKcOyj4MQKPD+Rgk5qe7wAw3+rNMhs5lE34rRjfMa9d6
 m5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BmJDsI1frubqpSHpwgLMDcWP2GRwtD3Aeu0GDNSS4Ao=;
 b=qtcScd48d4QpFcEdp+/oy+KQksEMS4UqXjtaELC6Q7aipxK0xL3p8jDxi5XTDzNlIO
 ZLoVEQn/CqqEtfR0/deQ8K5O7KE8QTXYFieRZQfCh304paWazdhApTU0cvtTayfP8wTt
 cGooVEbc1/m+SVYZ4f8JjuUlshZCLONJxV1lbl0fIGTAiCiKQKVIR5CFn/psJPlyL/yW
 8WasoX+Sf+1Xqsj326TzsrPKiS20VmFrRVUq8VqLcWjGZWQpIqyytPS0y/LG/uMOi4c4
 dv8kcsznoZ6Vxl+maXJA3yw8e7jaQeu3mlGYN64QLekCUuRKAsuSn85r6/q1F+c9lG85
 4Jtw==
X-Gm-Message-State: AOAM531rarve6CXTIE55evNOlnY0G+3TZdSTjrI68wG1gmT1gZHhwAcd
 fzvuqcyOVyXUbHkBfdpxd3g=
X-Google-Smtp-Source: ABdhPJxrPfjj0n+sgrY4w60/8r91odYTvOOfn9dIP0FlQoVAM5bMvzeBYaBIJ/QlbWNLbD8x9ctRNA==
X-Received: by 2002:ac2:5fb1:: with SMTP id s17mr6692388lfe.587.1638137006608; 
 Sun, 28 Nov 2021 14:03:26 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id s13sm1117685lfg.126.2021.11.28.14.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 14:03:26 -0800 (PST)
Subject: Re: [PATCH v15 00/39] NVIDIA Tegra power management patches for 5.17
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211114193435.7705-1-digetx@gmail.com>
 <YaMWaKqQ+c8G08mJ@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e364419-c4ef-a6d6-6538-9b04f1cfe9c7@gmail.com>
Date: Mon, 29 Nov 2021 01:03:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaMWaKqQ+c8G08mJ@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Heidelberg <david@ixit.cz>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

28.11.2021 08:40, Michał Mirosław пишет:
> On Sun, Nov 14, 2021 at 10:33:56PM +0300, Dmitry Osipenko wrote:
>> This series adds runtime PM support to Tegra drivers and enables core
>> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>>
>> All patches in this series are interdependent and should go via Tegra tree
>> for simplicity.
> [...]
> 
> I would suggest pushing all the fixes to the front of the series (those are
> at least patches 1, 3, 17, 27-31 and 39).

All those patches, apart from 17, should be irrelevant to stable kernel.
There is no real benefit in reordering them, IMO. The patches are
grouped logically in this series.

In the case of patch 17, perhaps won't hurt to add stable tag to it.
Then the "drm/tegra: submit:" patches could be swapped to prioritize the
fix, though there is no danger of a merge conflict there.
