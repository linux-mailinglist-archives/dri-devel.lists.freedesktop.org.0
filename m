Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2725FC13
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AD16E484;
	Mon,  7 Sep 2020 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70036E463
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 14:24:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u21so6105375ljl.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c3o7vSrPtfVLY+L0kjQIwvaz2ovSHjf+IEqBu3OCb/o=;
 b=ZfsQVh5sOFI6WXpScSWpbNwdBgiRHlDc06CeoPETYDVo+zJ2ZfpvWawcA10tLMKKD9
 KXZ1Uvms4FAp8JxcirPU3z6GhpGTlnOK1EZ6D0+CZNjDsZm8WZFPHPlX9+1edSK5LOVb
 s4cXB5Rw1O8xiYBKLdol3oQMaZOCHO4uolymrxNK1Xv5zLDX55nfQDY7dZxoIfRxoTqr
 AvbaMT0+vfuRN3JXo1OAcDTmPRmS34ql8nFZKAiKqucLL5+UJ9MdfJMTZRAmqLDMkDEW
 WWS6JlMemfEFb6yXqAF9NK8gplj4KJ58tMQcA1mFVxOSQnSg9dvyflu+8f1BhLcNmLyx
 Gw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3o7vSrPtfVLY+L0kjQIwvaz2ovSHjf+IEqBu3OCb/o=;
 b=j/H8ZnJvIZx3lpnO142Hw+SIpmwNWWEX9r91J71ZWvBi8mjsqA/eMtVMIT9jpRY2YC
 uvmfZ6t64Tg1yJVyR2V4lCB/ltIQVowXBv+uMfLByiIVzE0K6IAievZ0a4eJqG+J96r5
 jlks2VhhV4rFWA12BuqECwVgcK+mrRihYutWAJ3z/Lvm8pJUrpmwoeDsppKqWZ/b0LE0
 OG/v1PAcxlQNwP28vclja9QcIK21tJw3IxZUwnwWDdMgrNhZHXMkiAonpiHijnuFEPwx
 hNUR2aYKWAx1UOmJEzTw1cePMP4g2yzncNMgryN1/qYJeTtY/968gCnOt416mb1J7LPg
 /ClA==
X-Gm-Message-State: AOAM533IxZ1LQJ7RVo6HphV1rp2Nf1w6SoTvJPu2sDQnf0mr60FXMIkG
 OWjQnoxch7D2L21Zf1w8khvqjA==
X-Google-Smtp-Source: ABdhPJziSj5qaeVTYIzqn7mGp3GSDS6K4Y8Yf+iGVKSihjNsDajXJdMvFBL//9rql7id5+Q2WjAVlQ==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr10319433ljj.289.1599488657317; 
 Mon, 07 Sep 2020 07:24:17 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.144])
 by smtp.gmail.com with ESMTPSA id t14sm7558507lfp.77.2020.09.07.07.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 07:24:16 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm/msm/dsi: support SM8150 and SM8250
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20200904172859.25633-1-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <87a45d1e-328b-99f5-4990-d4746a24c864@linaro.org>
Date: Mon, 7 Sep 2020 17:24:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904172859.25633-1-jonathan@marek.ca>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/09/2020 20:28, Jonathan Marek wrote:
> Add support for SM8150 and SM8250 DSI.
> 
> Note I haven't tested SM8150 recently, but DSI is almost identical to SM8250.

On SM8250:
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Jonathan Marek (3):
>    drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
>    drm/msm/dsi: add DSI config for sm8150 and sm8250
>    drm/msm/dsi: add support for 7nm DSI PHY/PLL
> 
>   .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
>   drivers/gpu/drm/msm/Kconfig                   |   7 +
>   drivers/gpu/drm/msm/Makefile                  |   2 +
>   drivers/gpu/drm/msm/dsi/dsi.h                 |   2 +
>   drivers/gpu/drm/msm/dsi/dsi.xml.h             | 423 ++++++++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   5 +-
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 102 ++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   6 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 255 +++++
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |   4 +
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  10 +
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 902 ++++++++++++++++++
>   13 files changed, 1721 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>   create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> 


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
