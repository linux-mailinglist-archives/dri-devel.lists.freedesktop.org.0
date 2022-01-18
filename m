Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846D4922EF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EA510EBE1;
	Tue, 18 Jan 2022 09:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294D310EBFB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:39:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id d3so68095625lfv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=a0YVlEWbjgSbayNkq6pHh+iGzDRMa2x1N0HZiV2J5M8=;
 b=H+GBCxLRExjSJlYdrsQ+ZmaBiqmUtbP3o4f++IGayxtMEoBGd8XS+BxXsd9baWgDEc
 D7XoACSmazPv4dmQiZI8VJSYaAnpHjDKHC4V72hTHbtIHcLuR9uXaHjFMvV+6u7TkF3I
 PYxeUj6oC5ff6TYvmgQnIaGPlCGfWxPV23AWxG4FH1xxbzC9XP5lLCsZJe1+WkIGtB2u
 CtVwJzokEzgqIugBCicPdIyabeve/FI+fm4eAv3JlxYcTvE3iRqfERLshLzWqIpwybX5
 YHY5M51WuLDVSiDqTtG/Ef+bEYkbA+m1RuXxkVpkSsJIvaicN6WPUoy0KsS3LuBBC/AL
 jZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=a0YVlEWbjgSbayNkq6pHh+iGzDRMa2x1N0HZiV2J5M8=;
 b=04bMXrTNXMCTsviZc7mIqxF9dqmdBcgz0/+W71fK1nMi+m0MkONpLBUVFFRbd5yI36
 pQcSzadAz2UUKVpfewPZB8micvwCaXb42e4L+pL/z93feQbHlY+KKSdVyT92Ola5hUfT
 wwK/+Nk/Z7Qe6//tkaBihAt/thWWHf1piN142dMlNUpzQySwSa9FBCeQeJSUDUE/OgEA
 P8R9xwLu9OHPheYkkVZjqeoZf2VJFaAt6OSIVaN1d0ekxu4sE1QzsyHEUmnqGd/3ds9M
 J8wfdyEdVcMtA7mFRfidwSentwZdFQSUHv7qoeIjwqAekQ6A4nOaz/UjkMjUGNd5mSGw
 I22Q==
X-Gm-Message-State: AOAM531O1IXF1+bMrSh7UDnAolaAnwrN1X89jEhXxBMvJ82h7RaWIVa1
 QFoz4qpG/R7FVH5sNYnqi4I=
X-Google-Smtp-Source: ABdhPJwrsOw6fWZQAvQPhT0+8RdJOK/tXZZPgey8qzx/rfO+H5bfWmNIDPDsdz61+hdPuHU4nH9kHg==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr20029474ljj.407.1642498784488; 
 Tue, 18 Jan 2022 01:39:44 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru.
 [46.138.227.157])
 by smtp.googlemail.com with ESMTPSA id d18sm659567ljl.22.2022.01.18.01.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:39:44 -0800 (PST)
Message-ID: <3bfdaf7b-c34d-1396-c6c7-2e22996b7643@gmail.com>
Date: Tue, 18 Jan 2022 12:39:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH AUTOSEL 5.15 123/188] drm/tegra: dc: rgb: Allow changing
 PLLD rate on Tegra30+
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220118023152.1948105-1-sashal@kernel.org>
 <20220118023152.1948105-123-sashal@kernel.org>
 <1fa23a4d-f647-c3ae-df8c-4cbd91f5a4c6@gmail.com>
In-Reply-To: <1fa23a4d-f647-c3ae-df8c-4cbd91f5a4c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, Maxim Schwalm <maxim.schwalm@gmail.com>,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

18.01.2022 12:37, Dmitry Osipenko пишет:
> 18.01.2022 05:30, Sasha Levin пишет:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> [ Upstream commit 0c921b6d4ba06bc899fd84d3ce1c1afd3d00bc1c ]
>>
>> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
>> bridge that requires a precise clock rate in order to operate properly.
>> Tegra30 has a dedicated PLL for each display controller, hence the PLL
>> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
>> output. Configure the clock rate before display controller is enabled
>> since DC itself may be running off this PLL and it's not okay to change
>> the rate of the active PLL that doesn't support dynamic frequency
>> switching since hardware will hang.
>>
>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>>  drivers/gpu/drm/tegra/dc.h  |  1 +
>>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>>  3 files changed, 65 insertions(+), 12 deletions(-)
> 
> Hi,
> 
> This patch shouldn't be ported to any stable kernel because h/w that
> needs this patch was just merged to the 5.17.

* support of h/w that needs..
