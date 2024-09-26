Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2645986E6F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4E710EB04;
	Thu, 26 Sep 2024 08:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yLBsYdPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA4F10E18E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:01:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so6559791fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727337680; x=1727942480; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mnYkXlO4xqxmTC9/oaS9Fy67Dlsqb/FqP+5KeOimFjE=;
 b=yLBsYdPEdga7+rcAnICdhnKBjOdEp5DzVXYVlfm7AlBDIOiAY5HePNSx4YKjZDCGz3
 5rpj5ycqrMYsx3X9tkn4pUG+mBm03yhS6eobk+p9Ou78DwhQAzjvuxU1xK9kd5r9eVUz
 b9+xLArxSwxVUVA1owcm5yJWF6tWWi0NLZsGxWvhuQbAElnvzvIOIyd5FosHrzJ/9LLV
 0PvIqujh8tovulqgG4mWJy7+e8DBpeYvDg8ZaRZk/W1ie9liiLxRVFKhMbthd0cPIpfm
 vQXmqivBubwUpekDFeC0PLEkiR7zFaME5s23gfU6FcXDo23ozyS8gve4nuuAuzJJ04hS
 eVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727337680; x=1727942480;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnYkXlO4xqxmTC9/oaS9Fy67Dlsqb/FqP+5KeOimFjE=;
 b=WYba8p7DzzWsLFnYK0UD3NYNi7CzZZiruEG5eWi95kkDj2zleQYm+ilZRehPXdNI8f
 OlLHiF+lozVRFEh7dnbQXH4k+dyFof4wlXpUctvH5deFSqQivP4dtaWFkdfcKBj7jlC0
 SPlGHWheJWjDWDccRwc82i0HHp6rSG+dv5kyEfs8ccwk8R6LVdikey5mmKmYQNgyG3xQ
 JXFsrTf1881/OsiFOp6D7Xapi1KZS7vhjVcZ/89DAZXbAHNWw2uYvRi28sVTWjtIRGgx
 gOqep4dp0XUnCxnQVUjIUh07AKC6FNPhkccoCh/ozL0ymAvSUBnQad1IxANuF75zWCmD
 L6vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuhFifzL/LpqqXW4Q+HRcpCvu/iI3unnDI+6I4AwppoYin0J9c5ZC9FMGsvFLXI2IrJUhgVJga1WA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtxMUSQ3RPfxc/eb/jZpT5VpE4ieTN0TKi4F1VuSChwuaznJTv
 SuQHTW0BLa7Dty7GfsUwJRRw364ccDylRIzdeTsiv3Ujel1SPA7D5yq5WjwreXw=
X-Google-Smtp-Source: AGHT+IFtMIQI9HYA+rwxH65S1pikrqxhoUIciOnR3NOXr2mN5NDNBRifM1sAHFCpXhAFfxKki4zyhw==
X-Received: by 2002:a05:651c:50b:b0:2f3:ed84:9e66 with SMTP id
 38308e7fff4ca-2f916007957mr32637691fa.13.1727337680478; 
 Thu, 26 Sep 2024 01:01:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b6f7sm7591461fa.113.2024.09.26.01.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:01:19 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:01:17 +0300
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
Subject: Re: [PATCH v4 04/11] drm/bridge: it6505: fix aux command write to
 aux operaction register
Message-ID: <fcy6i4cfmtpsgnvuqfjm7pwlkyuno65rij5w32snmjbudma6wp@ht2jqtj2rsxq>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-5-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926074755.22176-5-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:47:54PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The aux control register command is 4 bits LSB only, adding a MACRO to get
> correct operaction command.

Nit: AUX, add (not adding), macro.

What happens if the driver doesn't limit the field? Let me guess, the
KSV reading command is 0x10 (it should have been a part of the commit
message, BTW), so it overrides some other bits? In such a case this
either should be a part of the previous commit, or, at least, come
before it.

> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 0583abdca75f..d1f5220e04a6 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -329,6 +329,8 @@ enum aux_cmd_type {
>  	CMD_AUX_GET_KSV_LIST = 0x10,
>  };
>  
> +#define GET_AUX_CONTROL_CODE(cmd) ((cmd) & 0x0F)
> +
>  enum aux_cmd_reply {
>  	REPLY_ACK,
>  	REPLY_NACK,
> @@ -1000,7 +1002,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  				  size);
>  
>  	/* Aux Fire */
> -	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> +	it6505_write(it6505, REG_AUX_CMD_REQ, GET_AUX_CONTROL_CODE(cmd));
>  
>  	ret = it6505_aux_wait(it6505);
>  	if (ret < 0)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
