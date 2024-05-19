Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CEB8C9741
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4C210E20A;
	Sun, 19 May 2024 22:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FLxLluBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9B10E20A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:26:44 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e6f33150bcso37922011fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157603; x=1716762403; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JObSYzQBPhN8GXmYgBbRvZYZ/SCSfA1Ecyc4ynw/10k=;
 b=FLxLluBp9a/iaeKVd2fc+eHD/A/rEZiIDAqBAWyW2/+kSVfdvKogIljwQ961SdtuGU
 xYi9ifa8ISIAXseqDcJ/Hhg8LbiBJjexNadqTQLo5aDRr5R1Y3u/aF772fkvkjWUInT1
 jQ5RE5aAzoJ8e3MUEEP1wrmxavO9zWRZhTYoKIYp4oBqUnduwZquAvod1ga/QrmFYDCQ
 qohO97zItPInLbefz34GfIHz7El0fTISs755BYoXXeg5L685/3L/xsLKPGCLWpWnh2FQ
 ldfMTTHzrJEhSQUapDf1H84fj21R6zwWotE0r2A4f/+qh3WindpUKyrh/5FqY9ENoVmD
 E4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157603; x=1716762403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JObSYzQBPhN8GXmYgBbRvZYZ/SCSfA1Ecyc4ynw/10k=;
 b=PCTCe3x8mhHfPU0UOpspfB/A2LRtgjUd2+Pud0+FiJ/R0kLDm6Aine+eim13JhzDSk
 H1HtbtwiEt32vcVQWEmfGUSbslqGGjtLvXbB6oeBIS+dYswM7GRYZjtF4zo6BF4w23XX
 f6Sdb6WEArYkg09JrEy1Zge5OBIpwy39p3xHvR4Lyik+VBGqFNCSzRigZkMEVHEyMEn9
 QiqP8LmlfJvjx4iSDMure/+R/84yh1bolfcRXUpgL1pC/OO+WWeeziYgppTqJqp8ew05
 F8wSX+8nG7CntMM/rgnNveJcWTDoRMIGZmXrzvaZUh2JgIU5Jm8GYWuLJ+/nwulEJkN6
 K6hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOEGnq8UT+GAT2oleVILJN0BN0taInTlRfq+Pw9Rv8ulbVotmy5Ez5ApAOqYKRdVnV1vqxpdj2OBNVNWoN+h8zQL0tuB6jZyuTUlRLljyr
X-Gm-Message-State: AOJu0Yz1omaWtSkyNACTsIsXe2kUiZd1ZndlZPbM6QQZcvn+qj6nMHlM
 PuMpOJ5NPgNZ00YMjWtoTkP3GP5mg5CJDfqVLw4cbug82uOpWbzCdUCEnbFXSdk=
X-Google-Smtp-Source: AGHT+IFWahWBY2ir7LucN1X/aBwVlMImRfoE+eP/cd4MqvN0pjGjs98YYiaYuQpQSioRNFZxFIQh1A==
X-Received: by 2002:a05:6512:b88:b0:523:8c7a:5f6 with SMTP id
 2adb3069b0e04-5238c7a06e3mr11745122e87.51.1716157602727; 
 Sun, 19 May 2024 15:26:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad640sm4025069e87.61.2024.05.19.15.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:26:42 -0700 (PDT)
Date: Mon, 20 May 2024 01:26:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Shuijing Li <shuijing.li@mediatek.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] drm/panel: boe-tv101wum-nl6: Check for errors on the
 NOP in prepare()
Message-ID: <5n7uz7wacuz7cwlv5drr77l27kq7nsw34horh6o5iecrhs2tws@5gvxuusty4rx>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.3.Ibffbaa5b4999ac0e55f43bf353144433b099d727@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.3.Ibffbaa5b4999ac0e55f43bf353144433b099d727@changeid>
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

On Fri, May 17, 2024 at 02:36:38PM -0700, Douglas Anderson wrote:
> The mipi_dsi_dcs_nop() function returns an error but we weren't
> checking it in boe_panel_prepare(). Add a check. This is highly
> unlikely to matter in practice. If the NOP failed then likely later
> MIPI commands would fail too.
> 
> Found by code inspection.
> 
> Fixes: 812562b8d881 ("drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
