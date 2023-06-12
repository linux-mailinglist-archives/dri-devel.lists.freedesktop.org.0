Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E772C45A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2510E21F;
	Mon, 12 Jun 2023 12:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0089910E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:34:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30c2bd52f82so4223553f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686573288; x=1689165288;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6uiOLkZCzE29dDMS8mbkCPIlcaOZI15UFOlxO0jpkY0=;
 b=JYJMhhXD8GoG+wc74RJldJAzuKQdW5UgEr8HC/hxk5ii+viJh1euNwOtRj6jrtEr9D
 eKsE7A1zLZ9fquw51Ws5VAmaivwyRKD55QY/xGZAqCiinlxX1Jdzx9tOTCJn+NDvL4LE
 43CF5SKDlnhFYmsKU8hi9p7jameNYTuAxhga1JKs+5wGQdsKNc2ORHjjfVan6SUBzvPF
 Cum1N4QPjLWxIOz/x4riLsJGfoYSj4+NCPUe76VotTMJjFsZEkN695pRkPH6/4Grdh3U
 CeF62WVyKOpn90DoTkepG18xIfyH0J7ilRE8gUju2DhmdymLp6wWLL5je2zBHdKK0ksg
 Fthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686573288; x=1689165288;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uiOLkZCzE29dDMS8mbkCPIlcaOZI15UFOlxO0jpkY0=;
 b=EMJGHqmNsLzvGcuIycefYCP+dZ/XLSXYgr30/d9VGPTd0Qbcgq16GURqGu2EqAVmbZ
 o3a4JyIBIi/Tgd2LrBrNY1e+zrFgN2kcf4A06Js84QKplNJ8JlzeosqZPeJYSaM5KDWa
 mJrDstzqztZoRteIV9ha1j2NV+LgL4qEXZAJ+D/ZM6bsck01VngMvay+GFaPSdk5e1tJ
 HTxWkvxHS2/lvHCQbQLBTfrje+UQgGPUzjcUaIQ82Pt1bGfI0MrlYzXari8g7u4DXic8
 9vcqRy7+FIbPZxww5eWBWiiUL9r8Kp4NQLt3UKYbYVSLMRZtF6lBMj7yC0J2CVS8jhxO
 MQEg==
X-Gm-Message-State: AC+VfDyZcT2xI5B2vR7ze36fAqsKEi0TOTYpkW2taInGIO0aklZntKMn
 TqvMiuLVXAy5U16l1vxA8Tklpg==
X-Google-Smtp-Source: ACHHUZ7bM0IBJoONrYs6kRhNBRDlS6Go2aTCDQ3PwEcXf0zi87gZWymuDit2csnnPeqTy+MuzxcdFA==
X-Received: by 2002:adf:fd0a:0:b0:30a:f2a0:64fa with SMTP id
 e10-20020adffd0a000000b0030af2a064famr4548732wrr.10.1686573287730; 
 Mon, 12 Jun 2023 05:34:47 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm12485151wrn.75.2023.06.12.05.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 05:34:47 -0700 (PDT)
Message-ID: <47c1cd91-7871-5df6-871b-6a53c94f5f86@linaro.org>
Date: Mon, 12 Jun 2023 14:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 0/3] Add additional YUV420 bus format check for
 dw-meson's bridge enable
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, rfoss@kernel.org, andrzej.hajda@intel.com
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/06/2023 13:23, Adrián Larumbe wrote:
> This is v2 of:
> https://lore.kernel.org/dri-devel/20230528140001.1057084-1-adrian.larumbe@collabora.com/
> 
> The only difference is having added an actual commit message to patch
> number 3 in the series.

Seems you didn't keep my Acked-by/Reviewed-by and you used my old narmstrong@baylibre.com
email address.... and you only selected the Meson & Bridge maintainers and not the reviewers.

> 
> Adrián Larumbe (3):
>    drm/meson: dw-hdmi: change YUV420 selection logic at clock setup
>    dw-hdmi: truly enforce 420-only formats when drm mode demands it

The subject should be: "drm/bridge: dw-hdmi: ..."

>    dw-hdmi: remove dead code and fix indentation

Ditto

> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 35 +++++++++--------------
>   drivers/gpu/drm/meson/meson_dw_hdmi.c     |  4 +--
>   include/drm/bridge/dw_hdmi.h              |  2 ++
>   3 files changed, 18 insertions(+), 23 deletions(-)
> 

Please resend a v3 with all those changes,
Thanks

Neil
