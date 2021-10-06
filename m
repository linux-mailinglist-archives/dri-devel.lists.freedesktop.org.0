Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EB424613
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368C56EE05;
	Wed,  6 Oct 2021 18:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC0D6EE05
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:27:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r19so13195187lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IDlvGZDQuR/GYFKsZGJADO2TntxwNUfXL/xPWdPIsUg=;
 b=bPQRG2MMIrokrZ17bTXBKjvGpu/gXkVc8DSIVMGkgIocOp2MJLKOcArtWKqKb7ZnaY
 VkBMnTZJ4ENPLNeQQ9yIXgqPgjdxVwdpAXwkYuirkKKvbLSV/jT6/YsX2JmeBTMpLlVg
 Jhzhn3ikjrMWqQGn/mx6SsdddSpitq7CE/EuMW5a5GbCAqGHSVsPIc07bnHXByQhV1Ab
 wogOjx9SPC0whJTKrZiVyeDPoXASyaaGFsCR4L7X0BYlcWCIXHLmjDO9qiT6GOhOlAg9
 mP/+lDo7PnUYBsNjnIgdCfSb0wQu/0qSodo9j7XEZQyQ9oiVTmGcvvPCxIYu3YHK8Xqh
 pj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDlvGZDQuR/GYFKsZGJADO2TntxwNUfXL/xPWdPIsUg=;
 b=owwXQxpRA0hU80SAgx62B3+caU15Cblw6fBro4QNsqHjf9kaYPK/tpyckGhfdi7LzJ
 q400F2KJH4rSiQ4l6hBzaO8SMjT3T0MWWUj2bqibDNPE6Hx8QmW0pdrEKfFmfbjzGsT3
 rjdEHiE/5XtsNZJS9yZPG3pNbZtLr96sJh/snKyvZRA+ENIIdya7Ms6Ag47T3qo9KC/u
 u3Wn5LbpOpK/lF81L+KNKYA9kq8EEwzwuqIsJ+qylifHzI7a0t000I3CUZHYIngSXALs
 VSjGdQE/ABTaP0Bn6DY/VXmLZx3T5ekg3GFXUBzl51u8kAtmbGrXy014zb5S/h9dNRSx
 dH/Q==
X-Gm-Message-State: AOAM532qraX7CW7KMpKQkHo3EBk2gyL36YTZQ28BfZbX5WKH5Q7F3KKw
 qcoYWUrscl0tfi4GsZM+6n4=
X-Google-Smtp-Source: ABdhPJwYVM5BtfJ+DbI675xHRlMlHS+vnmoHPOiyW0NMw96E7yu8uBeibCGOYaYVP0xDa/2OdFb4Dg==
X-Received: by 2002:a05:651c:4c7:: with SMTP id
 e7mr31268390lji.386.1633544872713; 
 Wed, 06 Oct 2021 11:27:52 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id d27sm2357848ljo.119.2021.10.06.11.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 11:27:52 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com> <YV3nQuo7eG6dkl0f@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b858348a-698e-c22b-da9a-83cd2f00e668@gmail.com>
Date: Wed, 6 Oct 2021 21:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV3nQuo7eG6dkl0f@orome.fritz.box>
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

06.10.2021 21:13, Thierry Reding пишет:
> On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
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
>> ---
>>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>>  drivers/gpu/drm/tegra/dc.h  |  1 +
>>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>>  3 files changed, 65 insertions(+), 12 deletions(-)
> 
> This seems overly complicated. I especially don't like the way how
> clocks are looked up with clk_get_sys() and then used in the comparison.
> Could this not be achieved by using assigned-clocks and friends
> properties in DT?

Assigned-clocks have nothing to do with this patch. We need to check
whether PLLD *is* already pre-assigned as the parent.

Adding properties for describing the clk parents is overly complicated,
clk_get_sys() is a much simpler solution that doesn't involve extra DT
changes.

BTW, assigned-clocks can't be used for display controller  because
controller is usually turned on during boot and reparenting of active DC
will hang machine.
