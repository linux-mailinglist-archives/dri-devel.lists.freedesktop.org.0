Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DD8A6019
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 03:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25714112926;
	Tue, 16 Apr 2024 01:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pVAVm0YA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883E6112926
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 01:18:59 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-516d0161e13so4723425e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 18:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713230337; x=1713835137; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V84Q9cVFBfzhJCyj19uweJAoXqH3wOGjSA4sDGt5T94=;
 b=pVAVm0YAVraJ4Y8CD/uNP+n/wtNhlts9Yt9AN29ZMPaA3vVUkEwW4ODYRvdBCTf60+
 BrDQ57WFyd4qNvFdTwYqESKzhX/SbsU21e0svbPTNBa04WAPGOqDbqGDLm1lrZX+7Vu9
 guTYYYBIyonPTuy9jGa0dOXB/dmIstcO7rTn4fQPMm72D/DZDqh2NzY5DgmdYVNO7kKP
 ndKN1MQctxji3RDuRI+vNKqnulJk0NdH79Kt+hCzV6Q8NgVi6XDaXzb4UI9RR43C3hif
 z88MRsiexqWZkbZBLso6mp2TCYJ2wDMy92v8t3V4Alazy1Dj2ez0WGZqWne4jnzaMsMT
 mp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713230337; x=1713835137;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V84Q9cVFBfzhJCyj19uweJAoXqH3wOGjSA4sDGt5T94=;
 b=cpKm1DTOdRvZIijcso5zb7Cl0dx6mnk66y2vTGh5srtfFBipjyPEDIZVpNeccC3O/I
 v37Ld+0KQ4vCwKrqUDcwaDUC09LtDunDmIMeLHRKPwleOhfkthqHVtf4pqIxudU3Y1po
 F6TgbEVBn6Lep59D6EjvZ5GxIsy5dyW031liICJaFCoQOZOdPftwABp9zHoyy2MjjlsI
 XHlKlOD6ORnNUOfNuKaBWoOwaBn1jpmzPk+efQ+99LoELp8ceVv3ZZZhM3ERYYsCu0hs
 i+lCDLkS7VsNOXDajYDjTWFt6jJbHQi4s63+CKV7Px8g1pnlvjOtIBrxzFD7mI8acTna
 lXUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNKdx3FwiKrW6DpudU7iNIqRAZFDwn0byu+PRa/OfiplOw6BBgjV1wfJEP/wZto3Usto/F3q+r0lrcoiRaGkzTZBJuszu9WU5AL3uiW0Qz
X-Gm-Message-State: AOJu0YwK4/LxXnXXjQP8RbD/AKNRYobPq9OX7u/ENC898YFPGMaskYm2
 bPYfkzVSR3WIMlnLsOGoULN4+Ma9M6CG0EbkP/loURSa9nLZIF3kCQ30rR5cQ4M=
X-Google-Smtp-Source: AGHT+IFWNBzccYch4p6khvIyf+Lk3SK7UVjljV/Hda5ozoFbl/KDRuaiAB21VcZyyqo2uS0i85rJow==
X-Received: by 2002:a05:6512:3d02:b0:516:d444:b26b with SMTP id
 d2-20020a0565123d0200b00516d444b26bmr10792490lfv.46.1713230337521; 
 Mon, 15 Apr 2024 18:18:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 o9-20020ac25b89000000b00516b069b27esm1425539lfn.37.2024.04.15.18.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 18:18:57 -0700 (PDT)
Date: Tue, 16 Apr 2024 04:18:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Marek Vasut <marex@denx.de>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 5/9] drm/bridge: lt9611uxc: Don't log an error when
 DSI host can't be found
Message-ID: <wg7t7pnrpuz2dy3kj7eh5fmzxg2zwdnahm3yxlc6w35k6r3upy@txfrjhykfrko>
References: <20240415-anx7625-defer-log-no-dsi-host-v3-0-619a28148e5c@collabora.com>
 <20240415-anx7625-defer-log-no-dsi-host-v3-5-619a28148e5c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415-anx7625-defer-log-no-dsi-host-v3-5-619a28148e5c@collabora.com>
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

On Mon, Apr 15, 2024 at 05:49:33PM -0400, Nícolas F. R. A. Prado wrote:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
