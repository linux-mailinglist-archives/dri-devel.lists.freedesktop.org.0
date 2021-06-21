Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F13AE84D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 13:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD72B8991E;
	Mon, 21 Jun 2021 11:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3358A8991E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 11:44:21 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q23so14269268ljh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TvnTnGnSvT/wzcRtCIQ6B7dOOoTU5ysPY7rP65LBPcY=;
 b=NXGg0c7craxUcqNhRaT+jQw2x5ROQqdt5x2dBCqXs2jNFOEy/YGap3LnXP1YwcUAjM
 5G01dyQKmz25sWNdAzoECLk94HKhYL3CSlwl8Sb8Cr9/Z0uIcXA+uKLE2DXZ7xzJGgCh
 LpexwTncTGfEFCD0q83Dbcor+Aao2Jhbtym/jCGzjruRUIg3QuWH5NboNFiUrYIoVAwS
 QALcOuU0LGWRYtO5ZSu1YTuK0vb0SsavpdHeIWe3owroU6nnG93Oc0/DWQ1hga5vuhod
 NU/eTkw/kA3mLYrsFDCJqSfxEQNpeBZEQpZwvqyDS/vaIJtMJ+IuIpl0bSd4qj0nex/T
 JDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TvnTnGnSvT/wzcRtCIQ6B7dOOoTU5ysPY7rP65LBPcY=;
 b=BEY+MnSW2gPZeOr5eeN0ZGQ1/VPWgKYjP/7hhHQJz6bn8RjKUu4x0CaYI7pqPkgmwy
 nDGwVVSHz+hN0qPqeGyRF1Fx2kRDfoN6Eu0H36QPrKyqR4f1lGiM/jwc5gY3fo/A52Ee
 SyV1ya3crDatOjVyiFAdFC2PkqDDAaEAqwSOi54Js+bFIc+57CExw1dX6OmTOJoTc95h
 3mbnFTFfYhd8t+meCci6MV04bUQpmmpb5yVk5/7Qs0nK7oXUr3Bj7gkDom46nqgQwVBr
 9wUu1uhG3vbZh7hNI9NPi6qzrinIJS1ZCvXKzum/3er9xtjKavusS9kVPG4TGzn2pS2C
 //Yg==
X-Gm-Message-State: AOAM532WxV/uw+3Iie1+c+5hmvRmzc8FaKarL9RSTOsQ3uohfZus6u0h
 g7UYF6hfv1Mc6PkYj+VFQMQ=
X-Google-Smtp-Source: ABdhPJzZqNE1v82IJt68up+rW8SvYARB7SxPKZ+9ubQvwMGy0eOKEOsPIa0ETY98RpNKHEL+/717Ng==
X-Received: by 2002:a05:651c:236:: with SMTP id
 z22mr5920364ljn.106.1624275859324; 
 Mon, 21 Jun 2021 04:44:19 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
 by smtp.googlemail.com with ESMTPSA id z4sm2085643lji.61.2021.06.21.04.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 04:44:19 -0700 (PDT)
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210601042108.1942-1-digetx@gmail.com>
 <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
 <50912a57-aa43-58b0-02d2-6928578d6286@gmail.com>
 <YNBxiFXMS9rfT93c@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <af058fc3-8696-a8f9-b52d-8e1b2ee760c3@gmail.com>
Date: Mon, 21 Jun 2021 14:43:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNBxiFXMS9rfT93c@orome.fritz.box>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.06.2021 14:01, Thierry Reding пишет:
> On Mon, Jun 21, 2021 at 07:19:15AM +0300, Dmitry Osipenko wrote:
>> 07.06.2021 01:40, Dmitry Osipenko пишет:
>>> 01.06.2021 07:21, Dmitry Osipenko пишет:
>>>> This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
>>>> which is done using interconnect framework. It fixes display corruption that
>>>> happens due to insufficient memory bandwidth.
>>>>
>>>> Changelog:
>>>>
>>>> v18: - Moved total peak bandwidth from CRTC state to plane state and removed
>>>>        dummy plane bandwidth state initialization from T186+ plane hub. This
>>>>        was suggested by Thierry Reding to v17.
>>>>
>>>>      - I haven't done anything about the cursor's plane bandwidth which
>>>>        doesn't contribute to overlapping bandwidths for a small sized
>>>>        window because it works okay as-is.
>>>
>>> Thierry, will you take these patches for 5.14?
>>>
>>
>> The display controller does _NOT_WORK_ properly without bandwidth
>> management.
> 
> That's surprising. So either it has never worked before (which I think
> I'd know) or something has caused this regression recently. In the
> latter case we need to identify what that was and revert (or fix) it.

The problem is caused by the support of dynamic memory frequency scaling
which does a good job at keeping memory in a low power state during idle
time. So display controller may not get enough bandwidth at the start of
scanout if it won't request BW beforehand. This problem existed for many
years on T124 and now T20/30 are also affected. The DC of T20 is the
least tolerant to memory bandwidth troubles.

This problem is not critical, but it hurts user experience since high
resolution modes may not work at all and display output may become
distorted, requiring a DC reset.

>> Can we get this patch into 5.14? What is the problem?
> 
> There was not enough time to review and test this, so I didn't feel
> comfortable picking it up so close to the -rc6 cut-off. I plan to pick
> this up early in the v5.14 release cycle and target v5.15.

Thank you for the explanation! It's not uncommon to forget about
patches, so the silence worries me. I hoped that both the dynamic freq
scaling and display BW support would be merged around the same time, but
apparently we got a disconnect here.
