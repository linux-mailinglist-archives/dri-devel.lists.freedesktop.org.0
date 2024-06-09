Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F609017F8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 21:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740A10E0EA;
	Sun,  9 Jun 2024 19:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+zEXrs0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6519D10E0EA
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 19:33:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebe9e49287so644341fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717961583; x=1718566383; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Viqm4Rd+vVlyg7IQXnYQo+tnnNOCKizP2/Q+mWLtnNM=;
 b=S+zEXrs0jmoXTK2BE4VUJpmxf6JpMqNzHHJU0xuUUEsYVKDl1+K6CQUt9dUwI4RHSN
 6qqm8qxfyuVJh964tIEUB3PlZ9/torKkvrSaU4MCG7bjNPfNiaSTCVE/in/LQjf49g60
 jI1R0T7i4dMP/i1PEeowpRqknEDj05B4jHM9ggAlsPRCCE0jlwptd47VwCOlBNoEL9z/
 bYnfypKT9TosWEmaPg6bpzGmqneKkd5qzhNzirUQJNrcrqs9buXUQi0Jasqdpac9S6F+
 ALuiq23/hK2juB+GSQZqJn2iPJGKor+4WpKYayvqSo16aRcLqadnjcjIYVdkizIx2/cq
 CKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717961583; x=1718566383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Viqm4Rd+vVlyg7IQXnYQo+tnnNOCKizP2/Q+mWLtnNM=;
 b=OIcdC++wFugtTRUe/EwFt/i4aJ5yr0XLDaAOqSiJQJjGApf17YlBV5Yc62A+m7jzU6
 G7oOe+feF1ohtgBzkbTZp9GiSSzAAnNnepfKBToEhPpjeC9bjZ9nwdQv0JjFNuwfSLWa
 mMlpzOSMqB7+6VX0nEJKE0rmm2cGWt/CBM1Dcgmgp4RiuaVZnVFG0nIgNYPxrWFGMG8x
 va2On+tKxYYRJ5KVwhOcIT5JzufsPp4g3AHivcCA/0Dk1ZiNfv5HcjXhaZU1F6WHM8ZG
 V/drM02NtfdNw/gSxvLMKM/m9rgCNpFcrrfnO4aF6hT8nkljInj+lPDQDrCuYmsBnhCx
 Fm8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCypbSOpVAhTq9wOwpaPfvYfZTLrmNjK+jETXSqJAooPj5KpMuGgg+2XsQqj9k0VOW2PV2diIkI1gWOO4C036+UJ12hD07PFjSI62gvaL9
X-Gm-Message-State: AOJu0YwfbOYhq3QYe4j/oXhWzpZjTYB6EYkdG8o/yzBY78bW9CTOvYlr
 COPJvVrVSFy8U43/Zvc1cuM9TJblumwHiGA65ylZUoDpLFmZIbGsD8qIBCxy7gk=
X-Google-Smtp-Source: AGHT+IHr4rTUrevKHEZm6LYZHWVX/UEWe2caOFgwKBeK//7r7LpbbqtNwUhcdND+fIL/TyRKCR97+A==
X-Received: by 2002:a2e:740a:0:b0:2ea:ea79:4fa6 with SMTP id
 38308e7fff4ca-2eaea7951ecmr40855531fa.36.1717961582894; 
 Sun, 09 Jun 2024 12:33:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzbgq2gvv5-kpclzt-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a04:adb1:631c:fd0c:1269])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eaebc60f9esm8825191fa.123.2024.06.09.12.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 12:33:02 -0700 (PDT)
Date: Sun, 9 Jun 2024 22:33:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Allen Chen <allen.chen@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hermes Wu <hermes.wu@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: Fix potential NULL dereference
Message-ID: <3u6bktmaxri5ktwmhstrjzzi7f2qcupy6tc2zuh2qjreo7s2cy@ypl52gxmqfii>
References: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
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

On Sat, Jun 08, 2024 at 05:21:08PM +0300, Dan Carpenter wrote:
> Smatch complains correctly that the NULL checking isn't consistent:
> 
>     drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
>     error: we previously assumed 'pdata->pwr18' could be null
>     (see line 2569)
> 
> Add a NULL check to prevent a NULL dereference on the error path.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
