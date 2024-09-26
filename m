Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBC986E84
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6E110EAF5;
	Thu, 26 Sep 2024 08:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g8sVQ3hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3100C10EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:09:10 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f75c205e4aso7683781fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727338148; x=1727942948; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/l9iStkPIaFLHxVt0ItzAGm7iNiw5At7Uj636c1Ihx4=;
 b=g8sVQ3hdg7s+LAvepjeWh5xm8D/ou4wCqFdyte6TyAUZc+rBcBXDlUQpu6RxhAC+Ii
 A1lAN+DbGlH7k1ZcGKGs+EvoKOMdPFPlBgM8FuJMyRqMl7mlOtj8SUn76mIKoXN+ixyt
 AOqrkIHL81qU4td25d8gzgrTxSnRmJy8e61PjP3gEORwzyZqS5ms5Ucxikl4LKoCWlIH
 rmTcwwC+XtTDRlni3uNe1f+i8LINKR9r4DMxRSWJ7Qx8IdSz7jpy7W7TzxQzOhB8sBky
 uRfKbZ61oIf56E/tJB3VarUgiiGGF9TZfa+c2JtU9S9rdKyRx2lVRBAUldFZJN2zxXKz
 25AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727338148; x=1727942948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/l9iStkPIaFLHxVt0ItzAGm7iNiw5At7Uj636c1Ihx4=;
 b=BKjRaztp67QcYZAjqRvnt7iw5b615XpZ2GiAgYNiCM+DXFZ0oD8EXQDBtcoB6II6Hx
 ycRxzxui7C9TRxOm5bM9nV3WUrvQYfFhSjB3k5A94GYOqaq8hzC3EznzWYE5fuLO0P8A
 VekK0OZIwXMHuXwxN9lE56UgRg4RGsOsDpO5xL9Pvy2J3ucVUihpMkM3nXruKMhsA9bp
 XmxIG827qfeI1nof6VgUi+J5tHEabv28UJ8c/AZKCba3ZGzWVr2JWe3XUDAHrUkDCfU4
 SdXWw3AMwnP9prPBD63H7kKgtfaH9jviaXskf7AT6ziH5watU6cGI+3FNALr2P1O1xpK
 KzAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJYhe55pcdl9iPUa4pVSmtf/UmJzHbBZIyTLcZBFXHQByS0YdCceZ/Gtm9le1SdSpfVwfb/SexpX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCsr9kLpODYMvu2W5h549Inz4m0ouC0cYDbYvN8HjwV3kVaXaV
 4KjYF/EX4MVcOKwczcwBs+MG1ejVfbSVRrL8N+E+S6649iCKu2p41uaY66uy+CM=
X-Google-Smtp-Source: AGHT+IG3lTN+4Ke2+Q6A+sK/efesJW8egbbbe6JzVlq8PPbmr6MZ48pwrwyfUgBEjkJGM9d3IFV0qg==
X-Received: by 2002:a05:651c:1509:b0:2f6:61d7:ab63 with SMTP id
 38308e7fff4ca-2f915ff591fmr30473561fa.23.1727338148191; 
 Thu, 26 Sep 2024 01:09:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d288e5afsm7483111fa.97.2024.09.26.01.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:09:06 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:09:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Kenneth Hung <Kenneth.hung@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Allen Chen <allen.chen@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 06/11] drm/bridge: it6505: fix HDCP Bstatus check.
Message-ID: <oed5mkjnyqnxmefxx2ahlrh4l73slgbwttum6hji6cvgf4zujb@wgo3h2r5jb4s>
References: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
 <20240926075018.22328-2-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926075018.22328-2-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:50:15PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When HDCP is activated, A DisplayPort source receives CP_IRQ from the
> sink shall check Bstatus from DPCD and process the corresponding value.
> 
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
