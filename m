Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046445E3DB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 02:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4B06E3FE;
	Fri, 26 Nov 2021 01:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D46E3C4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 01:02:43 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u22so15504853lju.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 17:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d5eybHUeaAVMy2um3rYiSgMu1qvMcc0ni9BDBOieeBo=;
 b=L+idWAu/GRgivG969p6gm/LH2qCEWB+i5m44beTgr6Uwa6hzdF2k4qBXhNZeLU6USE
 AChTYSdb57Vipf33dqjoqCKu1B+j/3EdyNxE5ANPzoyzy+oQH7DItcOOPiRN+nBk6eln
 8vcYABfJvDkeBwWC3fOVs5RcaHdQB0We53YH82o2z1iLmpNx7s50b0+/P9aMv7k1uYBq
 g+l7gx5pk1mJEwMf+kGfYz4+xFF4dHaybX0F6HJASGO3/nx4QKR0vbOkxR5UTV1Eq56L
 5L+D/+ft8wytUEy1smK5cMwSCidZTxDJ0slNHrk6jafsCTGdF1tbyrPZeqewO9cssL2x
 X6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5eybHUeaAVMy2um3rYiSgMu1qvMcc0ni9BDBOieeBo=;
 b=roJTv+yGitksGx79aT6eJgdH3WI5PghjLx7V+3tHlILL1JEgl9lQxGPamcWyFrc7Vb
 rrzo7Qg4PUGGq+/AY1bXJs+0FrZeZl+h1U0JfgoimOFOkkl9bNc7d6O7b+QCGwnzTeGp
 F81EolK/yimb+7ifcOPWlP6wJ3UroEze3UFEhF2gzUnZXWUVP1ord4+a0Vdzr49FH0jT
 bZiSU04Tq1Q5snqmrVaM7KhRGwoGVw8VvlLi/WyhbdwdEaMCXjnh9JkBurB3uIFa/mwi
 aL2/Ni3QefUdD0XS3wmqWB9vEd1+m92Nq/fMscEMwOrW6o2d8tf9t21GUtIPSS7Vup/E
 y+JA==
X-Gm-Message-State: AOAM530B1WhqLu9vTptPSEzF1mPh3lK8m+VdWB9+KGMlfrIyjG9V0pIv
 YKf7kxnB9kKRFSMT/dRYzMM=
X-Google-Smtp-Source: ABdhPJwDlHo4lbJIQNIvxCxi52QGGUiKS4o/tEWhT6OWWbm2bP2UQs/NTgNq7wKFmXqO8NiR+HnQ9Q==
X-Received: by 2002:a05:651c:238:: with SMTP id
 z24mr30440552ljn.84.1637888562022; 
 Thu, 25 Nov 2021 17:02:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id f6sm363021ljm.48.2021.11.25.17.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 17:02:41 -0800 (PST)
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
To: Akhil R <akhilrajeev@nvidia.com>
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <08781b22-2d96-6605-06ea-6911a4837474@gmail.com>
Date: Fri, 26 Nov 2021 04:02:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linaro-mm-sig@lists.linaro.org,
 andy.shevchenko@gmail.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

25.11.2021 19:53, Akhil R пишет:
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
> 
> This does not include the ACPI support for Tegra VI and DVC I2C.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> v4 changes:
>   * changed has_acpi_companion to ACPI_HANDLE for consistency across 
>     all functions
> v3 - https://lkml.org/lkml/2021/11/25/173
> v2 - https://lkml.org/lkml/2021/11/23/82
> v1 - https://lkml.org/lkml/2021/11/19/393

Andy suggested to make v5 with extra patch that will make use of the
generic i2c_timings, but it should be a separate change.

This patch is good to me. Please provide the full changelog for each
version next time, instead of the links. Thanks!

If you'll make v5, then feel free to add my r-b:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
