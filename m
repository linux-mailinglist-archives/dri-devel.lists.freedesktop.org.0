Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCC43D1DC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 21:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B9589A5E;
	Wed, 27 Oct 2021 19:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315C589A5E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 19:42:42 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 205so6537934ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lMrIGDyxX8Zy9n5Qfaorgc1V0f7+eeLTleV6gBWprQs=;
 b=EpcfosP+IsCdHIOo4g9lQWA3Dt1mvkaa2S1lXNcMJ+wAv70XvIlAza40HBE97tgQSR
 IkfIOp4xJgtTffYGkAODDYFJUZj25zWXktUjS8WptldLXdmHDvPyX9mlbT0mLS1M3dXX
 vUj4Del4y/UjFwXSQBiS0m51FgS+KELr7DJbgRJsAD/6braCFNhttH/KC80FJLOUhVUT
 XfbMBVd+oQ2hJle6n3br/BePBAtqcauPVqovMypm7aya3CAfvvL8qtYTm6PKzR8w5vVX
 22lLwx9nfxESrOYG2VjBRQJktOLAAIQCePAjr6ylcuwqDGPz2+ysUeVsBLBoQzGs0iWt
 nJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lMrIGDyxX8Zy9n5Qfaorgc1V0f7+eeLTleV6gBWprQs=;
 b=Azvq5wXFmuKmv3YHXZOgpyZrML30G2M3sxmAyxNC3mo4NYRS9KfeIYBbElj5myWy7p
 28+Hf2dWZmHl8vMdXD5IU9hZKtQMrdETrrlYPkFNtLAFCMhDv8mo2jJNp3xgd96KyHi5
 xDTl/siYwUQGIxYJTaIOSDtyASvZqv1xJDgz3MLid79r9YUMwBg44rIY/wPJ34dNOr+B
 I3IL9NdGJGvsRTLtRxv1Xg7yZsnFBlM8uMrw5EPCBoD4ZWq7cFw8D21+9P6bq/jW6kys
 TircC0E+qew+XCm++cpCIEN7JSxqlIXok6p5WRs8N3fyQBtwPoiDkgyr3EzPrTrFaowQ
 ghXg==
X-Gm-Message-State: AOAM532w4IXE2anB4UNRTU5I/PgMGRScTVT+3w9tzgBI47MugG5x14dh
 28BFHkYPAr5lpDIfvKwburc=
X-Google-Smtp-Source: ABdhPJxS+SO4cZo9cpkl8K0LznK+P9fYpGRd1oswPP0T1GAwpmwlx8un9r9DrfnHA/QNv1WaeAvq9A==
X-Received: by 2002:a05:651c:4cf:: with SMTP id
 e15mr34624456lji.139.1635363760555; 
 Wed, 27 Oct 2021 12:42:40 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.googlemail.com with ESMTPSA id o14sm71771ljh.62.2021.10.27.12.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:42:40 -0700 (PDT)
Subject: Re: [PATCH v14 00/39] NVIDIA Tegra power management patches for 5.17
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 David Heidelberg <david@ixit.cz>
References: <20211025224032.21012-1-digetx@gmail.com>
 <CAPDyKFrA2Jcb5BmaFmajtdUCmpwoPjAAvPC_MhoWwjDXJynD=w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98072124-c196-5a5a-7fa6-9c8e465f9878@gmail.com>
Date: Wed, 27 Oct 2021 22:42:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrA2Jcb5BmaFmajtdUCmpwoPjAAvPC_MhoWwjDXJynD=w@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

27.10.2021 19:01, Ulf Hansson пишет:
> On Tue, 26 Oct 2021 at 00:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> This series adds runtime PM support to Tegra drivers and enables core
>> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>>
>> All patches in this series are interdependent and should go via Tegra tree
>> for simplicity.
>>
>> Changelog:
>>
>> v14: - Fixed missing runtime PM syncing on removal of drivers, which was
>>        spotted by Ulf Hansson in v13.
>>
>>      - clk-device driver now resumes RPM on system suspend instead of
>>        preparing clock which it backs. This was suggested by Ulf Hansson.
>>
>>      - clk-device driver now syncs power domain performance unconditionally
>>        during driver's probe time since GENPD API allows to do this now.
>>        It was spotted by Ulf Hansson.
>>
>>      - Added new "Enable runtime PM during OPP state-syncing" patch, which
>>        allows drivers to sync state at any time. Previously drivers were
>>        obligated to take care of enabling RPM at the "right" time.
>>
>>      - Moved runtime PM initialization/uninitialization of DRM drivers that
>>        use host1x channel to host1x client init/deinit phase. I noticed that
>>        there is UAF problem because RPM-suspend callback waits until channel
>>        is idling and channel is already released/freed during driver's removal
>>        phase.
>>
>>      - Added system suspend support to the new NVDEC DRM driver.
>>
>>      - Added missing pm_runtime_mark_last_busy() to DRM driver.
>>
>>      - Corrected VDE GENPD patch which previously made video decoder clock
>>        always-enabled by mistake if legacy PD code path was used. It was
>>        spotted while we were testing VDE on Tegra114 that doesn't support
>>        GENPD yet.
>>
>>      - Added ack from Peter Chen to the USB patch that he gave to v13.
>>
>>      - Changed OPP table names in accordance to the new naming scheme
>>        required by the recent core OPP binding.
>>
>>      - Added 500MHz memory OPP entry used by ASUS Transformer tablets.
> 
> Besides those minor nitpicks/questions that I have sent for patch1 and
> patch29, the series looks good to me!
> 
> Feel free to add, for the whole series:
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thank you, Ulf!

I'll wait for more comments and re-spin v15 with minor improvements
around the end of the upcoming merge window.
