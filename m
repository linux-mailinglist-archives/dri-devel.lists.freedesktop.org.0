Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16290AD87
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA710E390;
	Mon, 17 Jun 2024 12:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lvqNUfb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F1010E389
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:00:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso4908222e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718625650; x=1719230450; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NU/LTmlktNIMT1128wfVsbnpn1ZfLn+vUpRJKBKxt0U=;
 b=lvqNUfb5kKvNuOYfWP8irAQ4C/kJ/5ezOCQsvG5h1NOq6RMf5CsomWkvfkMB6xRw6N
 JrJm+1P7C0NElVQQ0jMtnEG1pXTbCZebmFsLFqPcqvM4X0xbh9vc4gfQYc3Jp7vZgVMR
 bj18KeDohYRpTlv2wN35xccF1TGXek4dTM6JgIa4z8dmov1fsKSq8UPzSrRtb4KuinQZ
 tmuK+GGommxVnQ4RnR0ZFv2HBaG73/KBt5VlMr40HiIl+2rIE2kT+bCreeY5R1B2yQkM
 bWyK14CGkiRHcqhlLIkTXWy/kMVJxzVkwpEOZs2PWpIolcToqPT+EkdbNDX4kKCnJV+5
 kAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718625650; x=1719230450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NU/LTmlktNIMT1128wfVsbnpn1ZfLn+vUpRJKBKxt0U=;
 b=tjkbqq95S2hevrkVh3P71uDPLnKuyke+Xjx+SMSJroaAV4ppX2gB2+iVpy3iVSR54T
 CJD1qQO4E09AJG4EAhlwDvWafVpbEubqhbFqPXC9kd12WPca9N5gVQreXYGUnDjAKJi2
 2xeM/pmwM5+0s++rBloWVvJWGwjb/+9BvZdlXj6K8m+TSB+wNIBUV5LbQwl7oiHYCG5m
 FUF5x4KuzSf3+bPNuSgEL5mHWzCpjeIfo7ELCG3sJClhRF4K6t4chZaDvAe2BqUzqv5e
 d2Yi285VWTBOF5eWo/1h1Q3/XyEzPH7ay68T0+hc5m/8DVRAaNnnhCGZCvgNKG4bbrm5
 EgrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE+N/eCKOKdScbHsv9nyYDhsGtsE5TmnDqvxRATgEmcHlkOzdXk/2OeZgoTOjQJu7xda+3IM6T08H6+EtRKLVZKxAUREXIGayVzPFWz2b3
X-Gm-Message-State: AOJu0YzLPq/ZVD9fjwhNNkhOzLNFbhPchbHN44HGo3+FuDll1JDgtXH7
 2ucI6v5tjtCuG8MbTg3LB0w2VJHYMznCQEvbyVrNvZGgnpHBuEZHUHqcv3llYac=
X-Google-Smtp-Source: AGHT+IH25QDdxRClhZAe83V9E83up0xzJCKOP0Or36m8YFuJoo3ltUbEJfz+c38SeyoOcm23ix9WvQ==
X-Received: by 2002:a19:6406:0:b0:52c:80db:bfe3 with SMTP id
 2adb3069b0e04-52ca6e643edmr5993226e87.21.1718625650508; 
 Mon, 17 Jun 2024 05:00:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282efe1sm1210861e87.76.2024.06.17.05.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 05:00:50 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:00:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v3 07/10] drm/mipi-dsi: Add helper to find input format
Message-ID: <3snmlbjux7j44hxnbrws54lth76uid3zxstwccswiz52gfbqbc@6svsb2zrpsoy>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
 <20240617105311.1587489-8-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617105311.1587489-8-a-bhatia1@ti.com>
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

On Mon, Jun 17, 2024 at 04:23:08PM GMT, Aradhya Bhatia wrote:
> Add a helper API that can be used by the DSI hosts to find the required
> input bus format for the given output dsi pixel format.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     |  1 +
>  2 files changed, 38 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
