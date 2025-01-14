Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FEA10518
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03B10E175;
	Tue, 14 Jan 2025 11:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d+n0d52s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5F610E175
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:14:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53f757134cdso5338257e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 03:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736853240; x=1737458040; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BhMdX0Wdxb06Nc55Hc+l633VQuCHe7nF9NMiNM59tq4=;
 b=d+n0d52sGULnwLeEnWWjb/V500m2yAPFPpM1pFqimkJZ9dcRcBYqaNd4K7EUg8xtsl
 h4E/jR7rPd6dNtmOazmqMN0AcLkhWUWPU2iU1tF1fg0jWKwdqJASJMxyWpv7dt3wDHz0
 DeqRZrm3vLJ+czhLMxV2NHEgBTnNg0jMkn4HioyPbtA0AYlilgQesotcbsSwvZZ/PMi9
 axNSkYBA0Ni4kScS7GwrsQjR0XrTuQpy2tZkIAl9ZZlAhXWL5HNgj1kwTIJGOV6BpQHU
 j35Hs2If9oRtZARLP7GnIuYj/TZWeT7r9XLWx3JSQx8kWRnpXnTD2ZJRNpz6xFKFvWLW
 d3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736853240; x=1737458040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhMdX0Wdxb06Nc55Hc+l633VQuCHe7nF9NMiNM59tq4=;
 b=U5C48aqdSXlCz+WL5V4k57zbghEWAm8BBQ7UvL2e5Zi/NFmZEkDUM+sZkaI0C+JmsM
 ftq66wedy9waPGQ+d7rj74giwEbxgYWjH6m/PNhQii17VJoD82+ZFU8XOsXF/ceWg7cS
 WTlstgaUNIlhyolG8dtsSOUsa5s/Io1tBzv2JuigaIvWmpmcGWaafMRmI5/UCnMEwHA/
 3aHUsI9YPGsZe/sNJPwP7D0UzE3Xk0OZ2lDCk2hv0/rhAvdIJOShYKnp6YfGEOF+yFKu
 Zxa6hQabuQmGV1tvX07pHS/ROdCWHHzbWiASm9s/SR03mUVTT0wTQRTQBy1zCC3H5nsi
 RlnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdB/Ps64ItG/yqPQuZimB8oUZdxq+nthdTW7BNA6lqemwICvulFVmGx+VR2j5mYIR+Gfja1UblhDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxGXITpk+emj/wZfY6cJQRSbuATocaDSS+l/6u5qH2GhmqtDkX
 atARcJh1MKbPBTehbpX/7yjoMUcCQu0FLfeIUMCmqBIzx8kxRDTEsh3WcB/KJys=
X-Gm-Gg: ASbGnctzW4zgmS/2C3zg6XFbxrDpSMbI8YE1P7tV0SlnMD7nyq5r/CazDFQQykfx/yY
 MGTrTtFbS2XQGoIJOScvBI3VdxG6HYClFKrr30zUDkOIhs9/4ku1xc5u2wJCfzLxrv6LvKp8Hlt
 t/FYyUZyiy+pb5PyydrZicv1th0cXYkZ3Ron2oqAFIFpjkjmmUtveE/6vOYC+KPBEtFrznqZx4k
 54f62TOSqImU2E35QjDVEz62GG4MW2cxPQRhMkDrj2uSGTHM+Ow+ItL6FDUdTDBTTr+e9XuNRa8
 XmUHsXkOYXM9iW7FboZbDXdNRZ2RD+YP+g8B
X-Google-Smtp-Source: AGHT+IEPlt03vCChEXGNGHXKiJprd4KteHSwsigJuHHGW2UForVnIKeagrMOfDf8WuIY1RwTkcDsdA==
X-Received: by 2002:a05:6512:159b:b0:541:3587:9d45 with SMTP id
 2adb3069b0e04-542845b1b7dmr6413786e87.4.1736853240389; 
 Tue, 14 Jan 2025 03:14:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be54779sm1693223e87.93.2025.01.14.03.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:13:59 -0800 (PST)
Date: Tue, 14 Jan 2025 13:13:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/12] drm/bridge: cdns-dsi: Fix the clock variable
 for mode_valid()
Message-ID: <awfpmd5cc2yeboptvu2npbjvtaylm747fc73vxtyejqul5rri6@whucgrdfdzqu>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-6-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114055626.18816-6-aradhya.bhatia@linux.dev>
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

On Tue, Jan 14, 2025 at 11:26:19AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The crtc_* mode parameters do not get generated (duplicated in this
> case) from the regular parameters before the mode validation phase
> begins.
> 
> The rest of the code conditionally uses the crtc_* parameters only
> during the bridge enable phase, but sticks to the regular parameters
> for mode validation. In this singular instance, however, the driver
> tries to use the crtc_clock parameter even during the mode validation,
> causing the validation to fail.
> 
> Allow the D-Phy config checks to use mode->clock instead of
> mode->crtc_clock during mode_valid checks, like everywhere else in the
> driver.
> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
