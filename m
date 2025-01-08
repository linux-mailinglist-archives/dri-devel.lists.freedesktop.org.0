Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A3A064A8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683F810EC76;
	Wed,  8 Jan 2025 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mc2Tt1XV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE66210EC73
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:36:01 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so85243e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736361300; x=1736966100; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IYCZnwFt0+cp1X+PL+bPgFE710cXUj9pBytiXkGYfdc=;
 b=Mc2Tt1XVl9lvSPXOAOHoCHEOfusj8ETyxvBc3lfXDtGYhUvFdaQaKIo06AsYfYNmj/
 5QOWG6cLzr8WsAdAikX6jrcF+JZ6hhv85RUMqBnG/me93/dZ89pGwCkudnPaMN0yJb6T
 X5pxnsnxOiJw7+klpxOnW1ksUJfuTmEC+wSApnxk0lrC7vfSIB8TxYVJ152O53uRGfSV
 +u4OnuJPcy6ffSsSmLJ7B+BI352qNOKLm8Vgm1XbLI+7pa8kenKWACzIHLx4zXhlHLPI
 C98/I63ZNfQGqEe17XmhQVbMqH/eu3eReQsqRjWEwLzjI4kEUCYjBqboysErFnjWdvXB
 9TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736361300; x=1736966100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYCZnwFt0+cp1X+PL+bPgFE710cXUj9pBytiXkGYfdc=;
 b=uPfSfB1m8AAQx9KjJPEsxL3T8fUwrU4VDA5+TMPLr/nEIWVqwJ9FKyUqWANeFhWj3j
 iunjRi/lC2lOhWEk9H2PrcrObvImMflBntLIDr8qxaZ1Ap4d2LW+p2bieAVMTRf5D/+R
 reExEfYKsAF8SZ3hTGN9rbXzvj0mcESdM7xuIancXMD2wyQ1b8ldGxSIN2/Er8f74Jsr
 2HwFSvP1x0eDgXtq8JKxZLPgCKFuu5BVM39sLOIeSAIzrBwjOWyEGC2ucvidZ8anv0XC
 9Yb1v3J4UJQCDF2JNEQBC5nBqf+x9d1aq1MEF1FnwZXhCknzhICYZ1l0bO6sbwhg+ZiP
 py2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV/T+Fkgjo6t0jfpxpfCEuqH716hl2rXDQ8XChkU6SZCb1AocJmOzGFEJGlZxnrmOMqi4IXl5GrLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbRtlW8PpezpVIDBANPZic3n7laj8dlmdnb8BSodSnp7Eh+vVO
 2IAR0f5m3OlPDMXcNNpHFTj6plBkFCF/i9Wo9d+gV341Nem56bbby23dq1J/R3A=
X-Gm-Gg: ASbGncuV3vWMs2X+IccEoTxvhLcmirQvNu0eZO33aXAX5CokHVy1OipoR5wbjer9i34
 dyTgEZQLpLbZGqihYwHmGc6V9mwm1jyGb/iBaiCwy8XcBmjiULAji4ZPSSbjJj0uXcMGwPLtmJv
 kOhGpKEEo4kS29L6en9nYq4H6EnkJI+Q+h7Ro1lZYxlRk8MAi2CbNE8XYBMBQ3PSLmsFljzaKBO
 l1BEpc2I2EszJa8qNT3Hh8GoA12vh0/aoc86e+jx2yNlL9hTJKCClIJ3J4LDl4kXgOGyuf2pusM
 V6l2NdNYyJZ32rvY4tXbMztBRNzaRT5sOVx1
X-Google-Smtp-Source: AGHT+IFb6Npc91Ly5hS/17PsDbdvgtLljGkkI8oTfMdNR5uZx2/bAmzHi9qNVr/ZHnczddV1rrvqHQ==
X-Received: by 2002:a05:6512:3049:b0:542:297f:4f65 with SMTP id
 2adb3069b0e04-54284450352mr1136294e87.0.1736361300267; 
 Wed, 08 Jan 2025 10:35:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238138a3sm5541996e87.157.2025.01.08.10.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:34:59 -0800 (PST)
Date: Wed, 8 Jan 2025 20:34:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm: bridge: adv7511: fill stream capabilities
Message-ID: <gdgrfvzrmgk4lz7ccayzjso4scqe55c2jrq3wmp5zxvdn5thp7@jxeb6kgbee5s>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
 <20250108170356.413063-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108170356.413063-2-olivier.moysan@foss.st.com>
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

On Wed, Jan 08, 2025 at 06:03:54PM +0100, Olivier Moysan wrote:
> Set no_i2s_capture and no_spdif_capture flags in hdmi_codec_pdata structure
> to report that the ADV7511 HDMI bridge does not support i2s or spdif audio
> capture.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
