Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F040B4922D9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8810EC2A;
	Tue, 18 Jan 2022 09:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFAC10EC2A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:37:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m1so68251043lfq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DeGHxvOkcbTC/3aO1jG67yYJNY+X5JLaHOHG742whjc=;
 b=j289bUD6/nRw1kvMteOz/gAeSpGxqR1YbsBSM35IwtNK3cz53ODPP2U0Gpitwhg0Vy
 Vd82mJsuKN1LIVSf+xzNofaKd7D1zKuUjsNZjHHmCMYy5/zpdme25+/uW30plHWI5ShL
 up+MqI9j/Ksd3B4JHZCVF+MrbXycXG87IsDBRS2kN+dzIKeZiThlm2MV8ZEiJraHY6HM
 oUSQUf0RgyTUX+3S/2uTazv1X7wEEJR6R6NNyrI4kNnnTjnEzs02mNuA1Gs5+9xDWu05
 jBmPbwnqf8cXOMxnBwARL3zcUZxLJUAmKd6ANbdOK4/zuwJdbRqbTcvgdbiK1bQiaU81
 +eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DeGHxvOkcbTC/3aO1jG67yYJNY+X5JLaHOHG742whjc=;
 b=0g8jM0hJ7vAcDaw8w33ClEvlcW0fnHvE9TWZvlf+CqcKlC/pY9eFtH+SbaphZpjwH5
 cf3Oxvhpml11nQxNO1F6e4Ifm6D/u2Dl2EDIfnPm8qnREy6jvPJomCynRrKEbmpP8+Wl
 Xj0EAekTINZhRp0zRmeT8lV9hjahX6itIHFYDk24n2du+YgWirbtIbDlk1+GiWRJJhtv
 g/BilQnqCncxxiaNFfIz2LYWflQgx9xZlGzSQUVJcF5c1GCunWoD6zlyFRQaVxCkaw/H
 hjJqlEP+5tlo6tGJ4d8Mew6jzgN8nm9NT70zqelnAsNFQI5WjQ28werab+JUj5dpy5At
 80rg==
X-Gm-Message-State: AOAM533ZaSnXTnFNHwEzsQlGYOJll27LjaA3Gm7zLrWrnks0FISQw3Ga
 vBBucZ7NXEW2XgwQ87oYLyM=
X-Google-Smtp-Source: ABdhPJwTHY46PIQGIjoqtqIH7KsMzep7tLv9PsCznK/890ApCoT/rYMS/bG85Zy7ncA3FY3KkVpWrw==
X-Received: by 2002:a2e:a413:: with SMTP id p19mr19853738ljn.12.1642498672632; 
 Tue, 18 Jan 2022 01:37:52 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru.
 [46.138.227.157])
 by smtp.googlemail.com with ESMTPSA id n14sm1585857ljg.47.2022.01.18.01.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:37:52 -0800 (PST)
Message-ID: <1fa23a4d-f647-c3ae-df8c-4cbd91f5a4c6@gmail.com>
Date: Tue, 18 Jan 2022 12:37:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH AUTOSEL 5.15 123/188] drm/tegra: dc: rgb: Allow changing
 PLLD rate on Tegra30+
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220118023152.1948105-1-sashal@kernel.org>
 <20220118023152.1948105-123-sashal@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220118023152.1948105-123-sashal@kernel.org>
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

18.01.2022 05:30, Sasha Levin пишет:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> [ Upstream commit 0c921b6d4ba06bc899fd84d3ce1c1afd3d00bc1c ]
> 
> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
> bridge that requires a precise clock rate in order to operate properly.
> Tegra30 has a dedicated PLL for each display controller, hence the PLL
> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
> output. Configure the clock rate before display controller is enabled
> since DC itself may be running off this PLL and it's not okay to change
> the rate of the active PLL that doesn't support dynamic frequency
> switching since hardware will hang.
> 
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>  drivers/gpu/drm/tegra/dc.h  |  1 +
>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 12 deletions(-)

Hi,

This patch shouldn't be ported to any stable kernel because h/w that
needs this patch was just merged to the 5.17.
