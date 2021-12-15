Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCB475CF5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C6910ED24;
	Wed, 15 Dec 2021 16:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A70810ED24
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:11:56 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 207so34047822ljf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xVG5B7SYBr3u6P2qpHezZS1RRrCpJWiliz1cwjgXHPU=;
 b=MfLIVsUVi+6UjKkeOfI0SWNq8AXH2YggFu7ywHP79o0QYXM9HVXCVGjCAk+oNn9NqZ
 NYCRvxnhWtZHwZ4emtwGdoZjRamabsNU42OtclVmR/5CTOZ7sZgYPgVwywMvu+kF4mUS
 aJNvX2mOII/VEiLV83CfHaHbwj6zorAqRfm2cjUKs1Fa9iCNQrDPXMqIzxJ3rgPWTuLX
 GjzNF1zdf6H31DQ4DWeLg43Fa3WgXEViRaZ+gRq/t/OmoFeO32V9dbtuJpgKE5iMU6Pf
 u+OUQIbVNgsZ6US518XBPac+7esIc24pXvcwYUUqy5ecAQ2c3jDkQxnQ1rvoMr27iyGT
 QpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xVG5B7SYBr3u6P2qpHezZS1RRrCpJWiliz1cwjgXHPU=;
 b=HvkgW6sF91vUfOLqcgU6VLOnz/1cgvYKTevnu8q8k6D0iUqgSkaPVBmEzTAO/h39BI
 gQROO0bqN07DPIrENAM7nU06UAZNvOYE02xX00MJfN9xsJmNUcvSo2SP1MIuPgfkMm5K
 kQSif/eXZTHE4UktkrKCWsiN6NyhmEuAs4Co20VfCP9B+us/7USOohBge9wHwf9YDLjO
 HaCiuLaZKeoQzIo7a89/Yg1Nd5ZHvLL5UI2pJ4gD3JCabsugKcTCWA40Tvoc4uABiu24
 Y8imt/JoY2sCcNzcpah0eJDfDJkXtMSTw+ULGjbKYOdrgJ+de5OGK9mkeayWUmWF6+E1
 ZMWQ==
X-Gm-Message-State: AOAM533bYRgoms4L3vYmmpCSs1kb4co4cLMPpwoxIBJIE2km0m3HGxEz
 B7eqkgVGmcbMHmjWJTaAB6k=
X-Google-Smtp-Source: ABdhPJyW91GoZwqnrgyCst9/kcQTSRAGzVshAjgCuHC7JMUDYihZ1zeSVLqBM/gdk2wHRVzlCGewUw==
X-Received: by 2002:a2e:3012:: with SMTP id w18mr10494861ljw.217.1639584714625; 
 Wed, 15 Dec 2021 08:11:54 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id l4sm503086ljg.60.2021.12.15.08.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 08:11:54 -0800 (PST)
Subject: Re: [PATCH v16 00/40] NVIDIA Tegra power management patches for 5.17
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com> <YboP9IFMUrUnEzrU@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6baf6013-fbb2-b42f-5b26-2d10a2ca9374@gmail.com>
Date: Wed, 15 Dec 2021 19:11:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YboP9IFMUrUnEzrU@orome>
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
 Mikko Perttunen <mperttunen@nvidia.com>, David Heidelberg <david@ixit.cz>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

15.12.2021 18:55, Thierry Reding пишет:
> On Wed, Dec 01, 2021 at 02:23:07AM +0300, Dmitry Osipenko wrote:
>> This series adds runtime PM support to Tegra drivers and enables core
>> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>>
>> All patches in this series are interdependent and should go via Tegra tree
>> for simplicity.
> 
> So these can be applied in any order without breaking anything?

Please notice that the word is *inter* dependent, not *in* dependent.

There is a build dependency for the patches. The first two "soc/tegra"
must be applied first.

The "soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30"
*must* be the last applied patch if we want to preserve bisectability.
The core voltage scaling can be enabled only once all the drivers got
the power management support.

The rest could be applied out-of-order.
