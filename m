Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ABB46F02A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A8810F83B;
	Thu,  9 Dec 2021 16:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C814910E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 16:04:33 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z8so9682724ljz.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 08:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VyNNZFntqq/7S368iziv68PH8JNo+/JFrth8MiQPnN0=;
 b=IA7AoXxTmmSQDOR+7JKZHyzbrQBtcmUHlvjNOsI6VhwUlOOkWTKICCOXFWDtkJ5+9I
 zmOVovEwnkRPBJXuZusPYkhCOLHcCgFyE3xc/D0BrQ00tfWhCmYJJmylb1/Y6fqP08r4
 VtKTR9+q0cQqyn7osxibjswsFTnwV8iUVhUnqyGnYlwBNoMD36ugcWUATRYKTXR+EOBQ
 9Knz1bXER1N69YwSURq1/WRV9wNnH1jlUXPvem/b6QE7oAMoy997fsL6Z/0qTpEX9nmS
 INuhBlkVetXa9YG9Rht9GQgAMN1x5HZzyYFVQZm2Ut1XbKhxW0rDJG6vAPYZ3624XIpL
 vRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VyNNZFntqq/7S368iziv68PH8JNo+/JFrth8MiQPnN0=;
 b=VBDiwDzM20zoD5In9ntjbKI1my+lAQZAHhohES/XdjVsA0zx2pIND4u9MHUHz1c7hF
 nuHu8Ku0mJH+OrrkApqeSI7rHpYj64VPAypt6vJM4fVqCHhzltmXz57Sd7vmQuC4WCtb
 2K+ICkLrQBU9rYIaZWVumuebw2h269oxUfC8OHJHKSHYWeikzOAX98L6DlnpYSVxCIJW
 B0mc657eXQ0MIbMiIDeD7Hxobi9d9agAIIsZ4fl97kYYc2NVX+xItLdnokdOR8hLDMXj
 SkqyCTl5868lYtb1xUyyv6N9D565Q2D9Qamjc2kQ14FQRAC73GaJ4E027l7jaFEWCIEg
 UnKQ==
X-Gm-Message-State: AOAM531Ew0Ghf8x/45zAFJD2870kAMpdQfelzQAsyHi3RxV8xOTsFlM1
 bFv0j1XcFlVJQkEaSufq7ls=
X-Google-Smtp-Source: ABdhPJyjIVIwTFb/jRVG1s/HtU+6iq+SlVSeTRgCyq6BgyCqa/f3O4tShJ7SxaDdE4z6Q6IQHg5qYA==
X-Received: by 2002:a2e:aa14:: with SMTP id bf20mr7025963ljb.376.1639065872006; 
 Thu, 09 Dec 2021 08:04:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id a23sm16158ljh.140.2021.12.09.08.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 08:04:31 -0800 (PST)
Subject: Re: [PATCH 0/2] Add SMBus features to Tegra I2C
To: Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, sumit.semwal@linaro.org, thierry.reding@gmail.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3deea6a-3854-e58c-0d27-602413f2a496@gmail.com>
Date: Thu, 9 Dec 2021 19:04:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
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

09.12.2021 18:05, Akhil R пишет:
> Add support for SMBus Alert and SMBus block read functions to
> i2c-tegra driver
> 
> Akhil R (2):
>   dt-bindings: i2c: tegra: Add SMBus feature properties
>   i2c: tegra: Add SMBus block read and SMBus alert functions
> 
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  4 ++
>  drivers/i2c/busses/i2c-tegra.c                     | 54 +++++++++++++++++++++-
>  2 files changed, 57 insertions(+), 1 deletion(-)
> 

How this was tested? This series must include the DT patch. If there is
no real user in upstream for this feature, then I don't think that we
should bother at all about it.
