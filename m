Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973ED90AD7B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8440D10E183;
	Mon, 17 Jun 2024 11:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YWsIyUso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169F910E183
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:58:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c8342af5eso4544778e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718625481; x=1719230281; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VFv9S60vB3SZqXilE58DEUCUKeY01efOKoFr8NRr2Jg=;
 b=YWsIyUsocwUjFtcooTAqTYOe3n8E6P5d4zCuPjgP6YsmhiN18iKd1yJcije6cpE4t1
 TOaAeu3OeR1owojGoclJqYmCokHIg0OsIQf6arkP6++BZrRszloEsp3Y6eoLZHGmcdSm
 BZ2OkSsj7zDpIfoBTZNK2bYYc1umHI3LTKUDYs984N86mwUAxH5XCAX4LMUWj1b35HTB
 khKxmMAjToBRLDrXNDIHERL5veUTzZeQs65gxwFVyvRecpurr/OC+VX8aw6sIaWhS9ZY
 pzLsXxiFBIMMTciMM1RrXhWlVKG3slxIx8b8DMu+gGOHyPzcUL+qk2Gt2KtrF6oQ4zcB
 QSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718625481; x=1719230281;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFv9S60vB3SZqXilE58DEUCUKeY01efOKoFr8NRr2Jg=;
 b=QkGZM46Oo4gRlnv9sY4+9YvXpbiev/ZU2RUOJzYGb/XvVJPtVb5Hg/nVdhsCl1Dm4e
 chC4vyOsh5+xEloj9RG7ZdgDssffnsJNURrUHwqGHuyQ2j2DVDe6CIssYIGr4dU8qBSS
 wId1xvpN1pLPOh34IQ5pe9NRZdOEaYG2SV8/2yg+91ETYonTryDljAkZknLU0EDJAAIO
 P0VDEKjM4xJfbs55uKcgnHbgYdX0rgbpqI5uS0Lfee5OIxm2DTnma8aExqiIo+zNGgoM
 XzRUl68UV8ZOQg70zjr9nNKjfZp6sSuhuC5L0ngjgk9EBlFRfgsoPEyfkVElvD/kJqVE
 GhVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvXv4PJMXc1BCpBFecsed759MS5S9cxcUEPI+nZ4baz+KZDLTyk1Oq78dXXsJhNZBwRnVG0dqMrbjDNnbdX8uoQI9eeaLeMHAy22/myJBH
X-Gm-Message-State: AOJu0YzQ9jIF7S5ttrqU6t7XBgiKmml169tQGoFbAGrqHBnxqQADy6YG
 PjlGi7BKuBu4DDUTJeg4pqc7dAtkiilSNnyA/DxTAoPQGnHUeqk4JaDRyvmQOJc=
X-Google-Smtp-Source: AGHT+IFxAHCRf0dql5AD2VczwQjRwaRSdmKEUrnqkoFLWTS2WQFm8qXvw8HzGB9WpVCrsGnELaVabw==
X-Received: by 2002:a2e:9bc7:0:b0:2ea:e57c:a55b with SMTP id
 38308e7fff4ca-2ec0e5d0d3emr62982741fa.31.1718625480926; 
 Mon, 17 Jun 2024 04:58:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c05fb0sm13619471fa.38.2024.06.17.04.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 04:58:00 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:57:59 +0300
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
Subject: Re: [PATCH v3 01/10] drm/bridge: cdns-dsi: Fix OF node pointer
Message-ID: <223c7j4rkz6oh2kvsj7azn5fit2ojbuqmuhux7yafeosj3pch4@abjur6szwgep>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
 <20240617105311.1587489-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617105311.1587489-2-a-bhatia1@ti.com>
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

On Mon, Jun 17, 2024 at 04:23:02PM GMT, Aradhya Bhatia wrote:
> Fix the OF node pointer passed to the of_drm_find_bridge() call to find
> the next bridge in the display chain.
> 
> To find the next bridge in the pipeline, we need to pass "np" - the OF
> node pointer of the next entity in the devicetree chain. Passing
> "of_node" to of_drm_find_bridge will make the function try to fetch the
> bridge for the cdns-dsi which is not what's required.
> 
> Fix that.
> 
> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: consider switching to devm_drm_of_get_bridge(), which does the
same.

-- 
With best wishes
Dmitry
