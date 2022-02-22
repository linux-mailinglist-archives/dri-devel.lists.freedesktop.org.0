Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA1A4BF62F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6489710E368;
	Tue, 22 Feb 2022 10:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6D610E368
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 10:39:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m14so23862350lfu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 02:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bA82aRvveeHb4EfwxS91IfJ8rNVGJgeKZIsr7UMLI1g=;
 b=Gb358b/tkcnDwPm0miT5c8AUxhKk3NMVBDVKVh76hn1QnBgsP7txJa3g7CqqXWqaeK
 eKIWfL4V9xFON8mVeLC1KXgOXR0M3AF/fuAt2TftjIokBgV7+erBBUUdivtH0mTMPVOv
 uaiT1is+XAZalMf1P33AdTHRb04PVUPuU8HWhcdjkrNbjsdw3RGdbG/UKmVv74qXsvOO
 W/FJW8rjXnALvs619uQX55IWOEmfJvgJMQC4BDlOAHdXtJerKGVbaGawcmGJbT/eVqpS
 +SzWSLbtcpOro58I4EHOmoZ9CQlvGQ5UyU7UR/LJsrIVtBvWqgNv5JakxdW0Pb+B+BJC
 gNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bA82aRvveeHb4EfwxS91IfJ8rNVGJgeKZIsr7UMLI1g=;
 b=2YFGXxgkVuTdHMVoFL+9JI+usIp2SEF5OGZhCjsIChxQr3BNoUby5O6u+04bj3yn54
 kCBy/J91oZCOemZdoFX892gjRUahWKW+z1IDYhhkkSNtAXRw9nW58F/nQo1zM/bbGnqT
 Zc/GnCa4+4NoNA9Z0+jYbMfb/LUQV8mfLmNGAcGzsJpaZgGW3kCeqM+cLhdpfeEOlj2L
 NJW7A0jQPvPS1qHsO1L1yXTf/UoDc6TSRjeQpfsgcYwGHmIhYYQMkk1SDRVImQ0lOdet
 n8SqrqEmlEBBdUK0JeDkRkRKPfiyqkUd2WuB2nsSEXXD6RYDbEedVoUT1Fo5rhkjJ8Mk
 s8Pw==
X-Gm-Message-State: AOAM532EY9FMFLyfsIazUePRgnV2CFtTzmRIGKa6XXdkx8iO7c2u0y66
 HR0Qu6Oxv7eITPccaU5bulY=
X-Google-Smtp-Source: ABdhPJwRW2DfFi7vaENUA23Jq3YSQCwkSFxTvN+A+UDSLBW3imjJteLUnHwhO8atUISlgmzgaNxWbQ==
X-Received: by 2002:ac2:4194:0:b0:442:ed9e:4a25 with SMTP id
 z20-20020ac24194000000b00442ed9e4a25mr16609681lfh.629.1645526352564; 
 Tue, 22 Feb 2022 02:39:12 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id 26sm1674219ljt.99.2022.02.22.02.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 02:39:11 -0800 (PST)
Message-ID: <de5a48a4-4aca-5ac6-e4f2-e90244c9936d@gmail.com>
Date: Tue, 22 Feb 2022 13:39:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

20.12.2021 13:48, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this is an alternative proposal to fix panel support on Venice 2 and
> Nyan. Dmitry had proposed a different solution that involved reverting
> the I2C/DDC registration order and would complicate things by breaking
> the encapsulation of the driver by introducing a global (though locally
> scoped) variable[0].
> 
> This set of patches avoids that by using the recently introduced DP AUX
> bus infrastructure. The result is that the changes are actually less
> intrusive and not a step back. Instead they nicely remove the circular
> dependency that previously existed and caused these issues in the first
> place.
> 
> To be fair, this is not perfect either because it requires a device tree
> change and hence isn't technically backwards-compatible. However, given
> that the original device tree was badly broken in the first place, I
> think we can make an exception, especially since it is not generally a
> problem to update device trees on the affected devices.
> 
> Secondly, this relies on infrastructure that was introduced in v5.15 and
> therefore will be difficult to backport beyond that. However, since this
> functionality has been broken since v5.13 and all of the kernel versions
> between that and v5.15 are EOL anyway, there isn't much that we can do
> to fix the interim versions anyway.
> 
> Adding Doug and Laurent since they originally designed the AUX bus
> patches in case they see anything in here that would be objectionable.
> 
> Thierry
> 
> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/
> 
> Thierry Reding (2):
>   drm/tegra: dpaux: Populate AUX bus
>   ARM: tegra: Move panels to AUX bus
> 
>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>  drivers/gpu/drm/tegra/Kconfig             |  1 +
>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
>  5 files changed, 33 insertions(+), 19 deletions(-)
> 

Will we see the v2 anytime soon?
