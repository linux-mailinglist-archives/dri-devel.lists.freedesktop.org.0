Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D929A546A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 15:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F95010E008;
	Sun, 20 Oct 2024 13:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MSt5XoZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEEF10E008
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:53:10 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so33829551fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729432389; x=1730037189; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Gg1MDIPC7ZdKtGx4DSPHs00Leu3qoibohsRe4EHzNM=;
 b=MSt5XoZUmhKG16E85ccyoX/7yezyr8GzXNIezWPWgX9B17RnUteqlCn7q7fpUezA2T
 mrE7y5WVYYI2CoSA3GoOIHorIamKxuIP9VKeKikJ1xUxObAUVmUqn59FJFX0XDnL9aag
 RE2iOGRSThu/P/7YcEMZnA4DzKIvuToBzcsNvkv9ysHtTptHOI19x5xIMXwroTVQBv6B
 LjAYopdbai9ys9DGODVaYsSCae0ORRbWeRTjZFa7+8ksK4P069T7+4aW7vvAhgi57vot
 Pj5OeJCLcgKLEaay+aeAkP9I1ZwCYCYVoEdJnAQTsYRwzwSa2WtSqqXnX19XRn3NUHob
 272w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729432389; x=1730037189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Gg1MDIPC7ZdKtGx4DSPHs00Leu3qoibohsRe4EHzNM=;
 b=g5nxy6siuD8aa2w2CL9P62yP03CONtFVwUNfotcp5Gc1+4c1ElfK1+42KoEhL9GLmw
 Gt9cfPreMaPlShf0lasVxG19Dq/Nf3sqzW5T57Dh2qOWzaIRjtCenqhWEwIh6HRA/7QS
 USicPPitawFl9yMTG7MTN3rYpa3BEu5QAGG4/MUr+ogG5EFKpmShka+QGPpyPbBRwnty
 X6zMuXtKFbBIgElnbysEYvf6/LsRhH4avMgY7myzeJik6LnLoEriS1GHO9vMJnkcW+Ha
 OThwUh/+q3yk/F3RZog82wQ/ZX3dGUGPk5MrbF5eciQuC3IAiX2/VPTE+RrLTrQr36ID
 bhIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNz3GWlzEEs4UfW6qETErhnBQ5V6KGvuGg6doSLR/E4eHjCAnefzACEw1up8NUVzyjf9NizXPszI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5KlSs3Y72e8nxl2wa23lH/WkxRgqFsWOHoKiVncCcSCKo63QD
 LDmaSR3FP6gCsGlWf4eEC5sHoAsteTgQnxPOqZ8Oxe1P724IyaZ+id0ZjkeXKXg=
X-Google-Smtp-Source: AGHT+IHhzOLb5I3egLSSwZjc9BNKis8amHkTwLwjkwvSdniL6EjlNHXASdEegJ8U+tOsgB5Ha2S3CA==
X-Received: by 2002:a2e:e12:0:b0:2f6:57b1:98b0 with SMTP id
 38308e7fff4ca-2fb8320dd55mr29466571fa.42.1729432388467; 
 Sun, 20 Oct 2024 06:53:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ad60775sm2387881fa.36.2024.10.20.06.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 06:53:06 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:53:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 03/10] drm/bridge: it6505: add AUX operation for HDCP
 KSV list read
Message-ID: <ojy6n4hphcohozcqnkbmmiwtyjspbklu5ozmnkkgawzyaz66zk@pozfn4kn3rcs>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <20241016-upstream-v6-v6-3-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-3-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:15PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> HDCP KSV list readback can choose to use AUX FIFO or
> general data register.
> For some DisplayPort devices, the KSV list must be read
> in 5 byte boundaries.
> The original AUX read command does not support these devices.
> 
> The AUX command operation control register "REG_AUX_CMD_REQ" uses b[3:0]
> as AUX operacion control, and b[7:4] are status bits and read only.
> To change KSV read operation uses "CMD_AUX_NATIVE_READ" from using
> the data registers to using AUX FIFO.
> The extended command "CMD_AUX_GET_KSV_LIST" is added as
> "CMD_AUX_NATIVE_READ" with the 0x10 flag which selects AUX FIFO mode.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

> @@ -996,7 +1001,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  				  size);
>  
>  	/* Aux Fire */
> -	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> +	it6505_write(it6505, REG_AUX_CMD_REQ, FIELD_GET(M_AUX_REQ_CMD, cmd));

This needs #include <linux/bitfield.h>

Other than that

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  
>  	ret = it6505_aux_wait(it6505);
>  	if (ret < 0)

-- 
With best wishes
Dmitry
