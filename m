Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F89FB81C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F2C10E1C1;
	Tue, 24 Dec 2024 01:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sK5WNns2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32610E1C1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:01:29 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so5285196e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735002028; x=1735606828; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=;
 b=sK5WNns2kHFXky3hrGJ1GYRFuCpTfXB2H6RaI9V/pAg1uaBS2VRLrDkKdaFSH9aAYR
 VukH5z55qNj8DhEQdmdITasCuSKmW4Z6qjsnSRN30Uto4MGsb5zbTu3B9njnCsyD185F
 pTgWGbmgMjxkSMi1ZQpwImzy22hQoVxykxPumhINYxEMhtGUW8YS7lWLaIBDOGo6PP1i
 7HS+6Q4a3Ean1kLe7kH+MRnQaqfgD4Q3wbM6tBSr0+N1ferE1QSyavpXLL3Jf2Pjk2Fs
 EdcGYB9eVYNZCpDW4cRoLg9d4XZUhaDVuJYHwCC1Mdh80PaW+X2pRlK42tHitQLXNee6
 Wurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735002028; x=1735606828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=;
 b=nvFgyt92t04riiVynTWYZN6aqgDsA1YPe3hpK/l62hCGoVorIqZpUu65kh7pJRKucL
 UliiER1/rAxW74OY5Ek/hi1ARrqJjHN1FRiczMQYuc66T7GohZ2KtbmTil+gTeyJGjc7
 RyRl2LFi9V3kT6dPdZu2zAFP6dV+iG8g1ctgqLVfzu5A1CdgXkOG6VPRZrWivTL/rdU9
 4U3clq9JnNkuHIbzHv63M5p5BX7W3jt5Akch1CaVwU+W7gIKfeISzJqPme+e16E05drJ
 JJvvQWusja+Cj4gWNUVNTl5ZtTDLJosLuo+myjMt/VqbKwEVoMU9rYTD5yMdLPHZ+5bf
 jAXA==
X-Gm-Message-State: AOJu0YxpVg9VYdP16fLsRlCbPWRRuqPgKGmhLe2EbL40zgxc9vR9p9fq
 vbAz51sDfhHefeQQITKPzRsDHGXJD0SJq2SW3lJvMOnAKb00X4AFGOp2S80wtQk=
X-Gm-Gg: ASbGncsxLaQDOxFUZGZOROtHx02a9zPCRgzg2ndW14wdUXq1xeoZbD+ljZA3xpUO5Gv
 pwy5PYfKbq4MdXh4s2ol422K2mxIIxs10Ss0MvRsncqBy8mSyOWA/mGUXLaVmQ5Vd6MOMqjLZMv
 AzAQVowK17Oq2sMWlcGn/RthfDNEgaljJHRah+1gNzp16zD1Qr9qWaKACxiS3xBcgBuDBgPxdV9
 YvxR7IU4jQAaUVZgTx3FYS1KMMpwcC2lyTKI5W7UP9I5H4njkxvJeDexDxLnwmQ2XYLUJs/Kk8a
 LZzyFbbqr9KPhh30N114lys7evcvW1VXRYHY
X-Google-Smtp-Source: AGHT+IHtyOoIg7bHGt0g9e1Uo2eNMrzJeCrkRIN1DDXKRKcewpjO0JB5UPvqvpz2rQ2ZoS2g0aK8Ag==
X-Received: by 2002:a05:6512:2807:b0:53e:38fd:7514 with SMTP id
 2adb3069b0e04-5422956bdaamr5438834e87.51.1735002027757; 
 Mon, 23 Dec 2024 17:00:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422381381csm1459363e87.165.2024.12.23.17.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:00:26 -0800 (PST)
Date: Tue, 24 Dec 2024 03:00:23 +0200
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
Subject: Re: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <6p6gvofde5mbjdzjs3am7qrezhwzxf7byguws5lfhexeh5faaa@vw4effmwiyay>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-2-marex@denx.de>
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

On Tue, Dec 24, 2024 at 01:42:48AM +0100, Marek Vasut wrote:
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
> This makes LT9611 work with i.MX8M Plus.
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
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
