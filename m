Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5AFA1C843
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7510E099;
	Sun, 26 Jan 2025 14:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ks3X5cpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5E10E099
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:10:30 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso3943470e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 06:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737900628; x=1738505428; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8iFu7kfZyApP/YK/23C4ewWSLBktiQkPucZ1cnWaGXc=;
 b=ks3X5cpec19WbGg4VvUiSbHmaJy5/44XjLP8rXG9qaYka4GJlPBzv4UzQsc5Q72f7I
 wPOAF5EToJ4eVA8h1y6aq2Jn13dOcUmTNaNKDEJff8znKOWF9BRXewGPDK8HL5SUBxNz
 YcWu5lodYbec3M0hCF4iwlEjIcBpm0du8+8pTeZ4pTOt/6VvSkWRZLcdke3Hj+Ji/Mth
 ZQOWvxl+JfyTaq8qUlXZq72ush5GrFRsDNRQXNI0/kqB/oQgA0tETX7AMEqCGStmt3KL
 2OBuqv870igLx+rPLsmiaFbzDCJfMSsRVQRRwOpkMHBVJoktDwZLYkqVGFBw4DtJRjsn
 aKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737900628; x=1738505428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iFu7kfZyApP/YK/23C4ewWSLBktiQkPucZ1cnWaGXc=;
 b=l+MmjctdyUyWocZjPng9YBxnniCZDJAL3lYrMS3CM8jfJE6kO1T6ISNJ5hpZcvPTmJ
 P9XOwe5VXvlphXmcHcmV9lmB/2jXYQyY3bNK8U7a3Y1x75fFO4JC5jmiJGOqbotpaL6a
 CzwPdzcqCsQ8PIE+ODiPdGTfnAhIw0Guf5uFC7QuGd0f9kVT64X8QnX/xN0xmnMDGqft
 S3cVzRceQWeEVH3CBncmTEMHUswLeSse8iJaGEyd/pZi94+ct/mycdRaRUewqcZ34Wy0
 uMgZkYTstJSQKbaW1nxqeMMa4xr22QqnfsBg3VgQ2kX7HaHEgJ46vvii3QAV8/+BT7Jz
 X31g==
X-Gm-Message-State: AOJu0YynM8vYFbtaQnB+778wT+xU/zmBit7A4zEE4z5h0a8AFr62FATc
 w391jb/6npS1a5oXDIkbEe0b0lAcyeXC5OKZt770G8D3BuQ6Rek+YR3HNZHGr3M=
X-Gm-Gg: ASbGncvudJftw+dPd08T03+u8X3KJdUlk47z5ny9IC04EH43kP2rdEfDMwI0xbzKnzF
 bpVec9a2nhaVeU4sRRs23vwNAeZaJQXpNZM30fIHvMo2aNjGnZiQogHf01ZXgRDatInKIX5bNEY
 5EvYS2O7zt6rzzqnLO30bw1U/0nXMVLsHwFlmX6cBqFTPUd4DMxV7jC7lSwgfpB033jYmW5u1lR
 9FMkeEpbhyDUtIPEbD98ES24ds0TQ8CHD3j5YR7YUhL0eD9YMykzHat3hNy3Q94qwohdJad2pVY
 vPCeZzcQXMuVzpGa35qHEv6oUadNruZbNgexrYgo+ocTkkI5Bjhmivnm1/eY
X-Google-Smtp-Source: AGHT+IEUgaOjlIqzb8Iw75badSBbGfzHKqCavi4X6hbCsr4dlPImhmBJpQl9OJuzshwRDY3VSmuTCw==
X-Received: by 2002:ac2:4155:0:b0:542:8cf5:a3a3 with SMTP id
 2adb3069b0e04-5439c216c23mr11100848e87.5.1737900628467; 
 Sun, 26 Jan 2025 06:10:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c836826asm948964e87.156.2025.01.26.06.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 06:10:28 -0800 (PST)
Date: Sun, 26 Jan 2025 16:10:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/10] drm/display: hdmi-state-helper: handle CEC
 physical address
Message-ID: <q7647mm5zxh566zliu7rqa4glzbn43wopd4rpvdpwneuopeuex@rpbtwxfsqm2c>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-3-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-3-5b5b2d4956da@linaro.org>
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

On Sun, Jan 26, 2025 at 03:29:08PM +0200, Dmitry Baryshkov wrote:
> Call HDMI CEC helpers in order to update physical address of the
> adapter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 2691e8b3e480131ac6e4e4b74b24947be55694bd..1e7ea9b387088d5f407b647a9a3fead7a2929a30 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_print.h>
>  
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_hdmi_cec_helper.h>
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
>  
> @@ -786,8 +787,11 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
>  	const struct drm_edid *drm_edid;
>  
>  	if (status == connector_status_disconnected) {
> -		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> +		// TODO: also handle scramber, HDMI sink disconnected.
>  		drm_connector_hdmi_audio_plugged_notify(connector, false);
> +		drm_edid_connector_update(connector, NULL);
> +		drm_connector_hdmi_cec_phys_addr_invalidate(connector);

This also has a chunk from the commit 78a5acf5433d ("drm/display: hdmi:
Do not read EDID on disconnected connectors") present only in
drm-misc-next-fixes. In future I will make sure that that commit is
included into my tree history, but the series should probably wait for
-rc1, until all -fixes branches are again a part of the drm-misc-next.

On the other hand, if anybody would like to test the series on top of
drm-misc-next (wink-wink), there would be no need to pick up any other
changes.

> +		return;
>  	}
>  
>  	if (connector->hdmi.funcs->read_edid)
> @@ -800,8 +804,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
>  	drm_edid_free(drm_edid);
>  
>  	if (status == connector_status_connected) {
> -		// TODO: also handle CEC and scramber, HDMI sink is now connected.
> +		// TODO: also handle scramber, HDMI sink is now connected.
>  		drm_connector_hdmi_audio_plugged_notify(connector, true);
> +		drm_connector_hdmi_cec_phys_addr_set(connector);
>  	}
>  }
>  
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
