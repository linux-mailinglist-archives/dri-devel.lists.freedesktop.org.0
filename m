Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0208D1F06
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80410E820;
	Tue, 28 May 2024 14:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DevOH5UY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F59410E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:40:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e974862b00so9789951fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716907234; x=1717512034; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8gGbq2+G0YRbMbOdBIQss5wZtbiI49aMbKPIubZFnKg=;
 b=DevOH5UY0xhaw+xbOFzqZTgUGF1kJxlFJCCB/QthRuPa2kMmt08v4krOg/D7o2tEf6
 PabkkBNAUEAJMAympotoCrK5xu4IYE/snOS9QxnDSP/RxQsl+Mt0ogDxnEyjAWc8klSs
 mRq3uAKfYldHDh47Nys15X6Ae6c3Pp8tKmoHMbXNUJ8Op2lOev+vvPBjmiLHv9uEnfzy
 LdugdVeVwnG009AAx7ziX9Qp/QYM1Y8t/SWdq3ihKqyHhj+0FOLa5yBTF6okEeHM3ceo
 D6mV2eY2u2/Aim5X8W5C7eEwpnJVGeaD/MUX8Mvlf+e1qhb+JESQfsjgPCBkA2w+mGmv
 pneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716907234; x=1717512034;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gGbq2+G0YRbMbOdBIQss5wZtbiI49aMbKPIubZFnKg=;
 b=ZkxwAW+gN7cZmmwuFDijY4Phk/GsR9TKc6hKs0u2OB+eJlLL8nH0VW9wPoV/NTIGou
 MPtmb3FvWvXjkyVWR9E1X1tcLwtIa6zW9Lhumtt7ivAslsJkEYsAFax9g+IRYv3Rl/RQ
 snB+4pMRVEweYXREO06qKe/Cds9CLY7X/mO3AgXMM/NDm/3e1btKH0XsItkpSjofehGt
 oQ8MRFvQWlIGgs/dWIlsuPKBbbnjBvq24GpfWcuT/phEz2RgCO5WeVM15xq9TyrgqDxS
 i0PJY4oH6LcALOWUQusJra7E/Tq7VwiIceB2iDqDtUt5eo++kSXPaVvz/fUQIBHAOABT
 g+KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAEkIIer51j9sKOKl8U/V7FnuJQm8cFGoM+fVXwSr1p+uNCS3DLT1WSXeI18HnjOlbEQQlPXaQ/ZFDj3xTBxSC3N+Nyb9Q0BrRmF7y2/93
X-Gm-Message-State: AOJu0Yx9m1jgNnpipeF7InjzUfBrSm054ZdIj8OcEmFy/6yMN4Ah3pLP
 zA0LvGck0x7HVoboNST4fragPBJvNKkyL/zxg2A7nwOcboH7ZlPGys++XUUAiIA=
X-Google-Smtp-Source: AGHT+IFLOJBz/bELqSb+f+uM0s4cO1qSHnszdkdpYEfD8loMqI9OQBAGzZRt5U9/gt8IksZYdmpK1A==
X-Received: by 2002:a05:651c:a09:b0:2e9:841d:dacb with SMTP id
 38308e7fff4ca-2e9841dddeamr31411951fa.40.1716907234225; 
 Tue, 28 May 2024 07:40:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcd7c20sm22927471fa.33.2024.05.28.07.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 07:40:33 -0700 (PDT)
Date: Tue, 28 May 2024 17:40:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ricard Wanderlof <ricardw@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32
 bits via I2S
Message-ID: <m7sghjgqtm45yjkpzrekeab7doojagxjts7vmw23a3tqtjltdj@v2oencka3uer>
References: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
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

On Tue, May 28, 2024 at 12:04:49PM +0200, Ricard Wanderlof wrote:
> 
> Even though data is truncated to 24 bits, the I2S interface does
> accept 32 bit data (the slot widths according to the data sheet
> can be 16 or 32 bits) so let the hw_params callback reflect this,
> even if the lowest 8 bits are not used when 32 bits are specified.
> 
> This is normally how 24 bit audio data is handled (i.e. as 32 bit
> data, with the LSB:s unused) and this is also reflected in other
> bridge drivers which handle audio, for instance sii902x.c and
> synopsis/dw-hdmi-i2s-audio.c .
> 
> Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

What about:

Fixes: ae053fa234f4 ("drm: bridge: adv7511: Support I2S IEC958 encoded PCM format")

?


-- 
With best wishes
Dmitry
