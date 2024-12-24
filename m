Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A939FB916
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 05:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884410E0B9;
	Tue, 24 Dec 2024 04:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dc3ucglN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8059510E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 04:09:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401ab97206so4946339e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735013375; x=1735618175; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=;
 b=Dc3ucglNdY0g32sgOagAVkuWzwLo4/JKWa6OLPg72mehNIOMBSXYSXtxAtC0U/pz2A
 4flS62No0YLdMikBhTjVBDbmZNck/6o42bjP9wfVcVK+SF/eU5MRKr39qlfLnuO4LYQX
 6MJ54N0LVbXm2Hui7gXPVaUJ67e14NPJmEU6BqEDE7p7uGv/dxem1MsUBN2MxYZyL2qE
 KXRzwsMFn3yuuwCyMmRyXMefccGq88ZbRKLIMYLMoWoqCJDSoW3lqU82JToc4Xd5nHG0
 nBmF6lCPZvWKxJm98zu46yJfjHib7VgVmWGLePTBzTA6LHM8qhmbjQ9oxjD6pBxDT0Xk
 rXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735013375; x=1735618175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8on0ZbRPpfYPOhsA0CTtKSQk3XChh59DoR/C8XX6ZpQ=;
 b=jDkyq5FB54tC9tvHR6fOvcdEO22dItb95cJwD08IGyKjDVNaBjl5tpz6CnAvxvZvPt
 QQLaOXLM/I5hSrNGxBnd+7PtP0dCgacRqC/8YkXOE17/Qa92zHvxpULJvLF6LPwSSO7Z
 y/nGIEJIdEwvtPueIjK5kcJ74SSDO8U+5mRvWCBHnwun5C+f7/agEnA0eyuDYo2nrzLF
 4003+hxE3ZCuUsSfpxNgDmduVhCjwyzDPg0zlTQkhhh3t/Z00ttzDkssMx6NmadewcEb
 7NDUCa6YL65n7OBaMlAwYQY8cOANQ3lcvXdPpdpaT+1VsCkQuK3vjeOoRIVL+Hh3jqFn
 i1bQ==
X-Gm-Message-State: AOJu0YwZKx6j9qW6fSTKdqCN1y6e5sOmVSeBwQDtZMz3Aamvp92vEPML
 NiaCp/kunLIDmQw4RMwW91Yoxyp0ifRbvSzAiTJOMAMAOVKXammQV6fJ/VxsaYQ=
X-Gm-Gg: ASbGnctWDhOVxfwKpU5aJ7YjX00zk4ZP9hhU3KPs8H2NNphwIrerOE+PfHW2sJ0DGD9
 eAreQkdUmRHjz+Mm2RHUpEcgwlKKLCZSTJyePWmf9v214xhACyrPCnDZPpTcGsphJwqdBqQ/kGi
 hgtj0YHs9P8p5C4H7x4LVSGXM1IAEP2iSYE7UvVQRHrvPykYkT1aCc+CdvAgNjiIict6eXcufXS
 Dn8mf3Ip8xQtYY8cmRBis7hlpIgnOCRIjZYTQG3xeFOSmVIxRA5gh2hwEySQNPUw/y2hxB71SBh
 16JSoJSSf0M3enupmlMbP67VUEeIqUb7wEwS
X-Google-Smtp-Source: AGHT+IFywzjt+YUMxB9ndT32dpSascSP1hmk767MuEP9vd7WzaJ7hUJym7qgGXttXA0sSFsZgZdAmw==
X-Received: by 2002:a05:6512:318e:b0:540:1fb5:3f9f with SMTP id
 2adb3069b0e04-54229597f4dmr4305510e87.47.1735013375119; 
 Mon, 23 Dec 2024 20:09:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382faa1sm1450458e87.238.2024.12.23.20.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:09:33 -0800 (PST)
Date: Tue, 24 Dec 2024 06:09:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <qqd3xztq2drkdbjrybzwa5an37lpb236ur4iqjaaydncwewltx@o3zjqaat22tw>
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224014701.253490-3-marex@denx.de>
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

On Tue, Dec 24, 2024 at 02:46:16AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Mini.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Cache connector from drm_bridge_connector_init()
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 37 ++++++++++++++++++++++---------
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
