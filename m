Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE30F573026
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2A294AFB;
	Wed, 13 Jul 2022 08:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366E094B6A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:11:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v14so14363858wra.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=w3mh7mSgOdwjOte1AQXmDns6aE0VntldMF/fOySoyz0=;
 b=uCrAA+uzPAWxLWCGb4PkG9dXnQy25fjY2FJphWgJuLK+++V+mJWdRDrLrB1pwl6tn+
 mBscwpHrjnFK+uWfxkYUL9hLFrjJBhB3C9cZSKxWhTt+Kw8mUt/oXnDJiyseGQ8Sa9o3
 a96/37rjL4yt31+2z3ewqsOk2x5din6PCBQA2Ywc8OAsVIVJ7lufUsvdSnYv5zE1NCMU
 zEd72FWpbLn14QkBP7gfXjuLZZRoJwm4yNSNg3ERqPVh3U9+M3rlxGwgv3+XzM3SpBRl
 tRxhq6fDewKvNFqThx36ZjEIp6lKDT0+QO9ekStVMJsBY9UO45wYN85ZTfLoZ7Yy6kuz
 1iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w3mh7mSgOdwjOte1AQXmDns6aE0VntldMF/fOySoyz0=;
 b=cKLmhYHBVTbLr5P7oR6mSAvHJKfNh0gZ3KjGzWuUSUM2xFrEYc95EXatv15hq9lHzq
 7tJkS+v9DCPa+FTTFLtbO2WZIpOJzFZ9wARHQI0u/0wrPaqPYAQumKGsTq9ziSTIaynL
 b/6Pc3/WK6PWoCl4fGFi6zadkw/NTn4RrhdsqiP+hoYG/+JUZlBnJIza92XHIYNH52Wh
 lHuJiC59lehNt3ofQZ8NExAh9B3qkxdFzOL84u2AedoU3GeqXAqlfnbDzi9L4K8lz6bD
 qCwDoLB17AF4pSgiKIRtSGHBnYjn0wzRZXxyTZG4YipfQCFJ+bnrI5a/7qEvAOEOHlId
 OZQw==
X-Gm-Message-State: AJIora+Kb09AfVCdhBOX9HonTj4Loa2GgeSgPIWELyKOFtr33juOWEMR
 S/8kuFmCgZkXw2nkhKeJs9Yc+A==
X-Google-Smtp-Source: AGRyM1vXUPhWcRP/h8EOhUrcVZT9zzgiwiQSjeNfCyeXP8a0q8IfaM81cuydW1W8bgSk4nlqDVWyWw==
X-Received: by 2002:a5d:5683:0:b0:21d:8013:cdc7 with SMTP id
 f3-20020a5d5683000000b0021d8013cdc7mr2029245wrv.618.1657699902753; 
 Wed, 13 Jul 2022 01:11:42 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 u13-20020a7bcb0d000000b0039c54bb28f2sm1311516wmj.36.2022.07.13.01.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:11:42 -0700 (PDT)
Date: Wed, 13 Jul 2022 09:11:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Revert "drivers/video/backlight/platform_lcd.c: add
 support for device tree based probe"
Message-ID: <Ys5+PH4ig049cavb@google.com>
References: <20220629210024.815761-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629210024.815761-1-robh@kernel.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Jingoo Han <jg1.han@samsung.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022, Rob Herring wrote:

> This reverts commit 52e842432f36d5b15227d0ee0d2aa3d2bc3cc0b2.
> 
> The DT support never would have worked because there's no platform_data
> providing ops. There's not any documented binding for it either.
> 
> Cc: Jingoo Han <jg1.han@samsung.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/video/backlight/platform_lcd.c | 10 ----------
>  1 file changed, 10 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
