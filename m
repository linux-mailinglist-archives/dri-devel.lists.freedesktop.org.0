Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A47A1CEE2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 22:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D19410E22C;
	Sun, 26 Jan 2025 21:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uY1gj80M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC0210E22C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 21:52:50 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5439b0dd4bfso3176166e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737928369; x=1738533169; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qXWEy4m/+SedvQxipCy0/WvNRoS9HJTYyRPS0PLi6FE=;
 b=uY1gj80MvtmSI1BiYhsUQQRGQcPKzhbL5MCAUQLz2fjF4+Y0lG4TAUru4VB0cO6vfX
 q7ffPXaiF4suX3qmmbyfBCoDiaO7/earI5i/1OD8MnpGp35U6Bzr0OcGLlHy7gFUlpf5
 xdI9pvyC073gL5VAMqCS1c73f4PbHDsHK1YUMlNIpTQmo88MZfvbigcLpRz2YQ5dlZY6
 C4ZBGslqVhRnBVXuj7E9IdhuYgu3b0EObCM1uxB7vS7b/Slgln3Hi5vsabDGfYbcqpKl
 Co9BhJT54827aZqDa3NZji9UxZxZ6kOyC+sulOZljGoHge04pNPS1LM9JGRMRM/NSY6H
 10Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737928369; x=1738533169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXWEy4m/+SedvQxipCy0/WvNRoS9HJTYyRPS0PLi6FE=;
 b=CWAlej/+6fz59BqYRJZhO4gXqGuu1hVbpfqq6DucLvLHYq5u5MOpam3v+iOKV+6YOp
 9mo8dfWX8cGe4kO1h65zRwBfX78NkejABdtbUkxydtjj/cQxlYVGhBOUQFmkMp82+zf/
 heQbg6GSO/FxTSAr+l8Z7bd9FP3xHWL0x7AdcJbmb/+UDrGblHa+rXLWnYyprfd/g5H9
 T5brIEtBOtlOUefkQ2gnfI/voXQiRr55Nn4esxlXHPNq02HF5IRefQLSSYz/VJ0afRCS
 Tx7b381+fXDvylZyZ7yp1Qf/2RHldD4ZnODgmVZqjocpe5zzujjeO8UdzkmIpyMx5J0x
 ktyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAYW8kRJRePR6iNzLVs+PMR8jMIIIZBk1qkdKMT9dmmFOCHxWxW8mIm+7d/2YuxxrwxKhRZvrTskQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+5IKD6h3xiNWG59TQ/RGy/FKEa25bwIkCStrGZtQfV3UOR/8+
 RJcBz1oMxJ1FFltvYlWbC45YtoATFhBIOL/z20JvNA4i0mKKS+DVLUNN+hpHAe4=
X-Gm-Gg: ASbGncsKGsbYfWr8nmxWKrtAi7PpSnII65TDaqhp6s8NNvawvGjpwrqEp5l1TZrvNZW
 Zy9aPnguzGuAnF02a1ThQz+ewdp1pwD5Cbk7JSdF633WzwsHKoD31RTw53EkP/ICPqK3TNZ+zbj
 SqZM56fstWtU4dZ4SIYtz6F5sgp24d5NX2njnfs8atYlTB+M7MQc+fOxDFz+NQ9Av/1+Bsnj3CA
 8MdZZBoaeGxyvaydwJsZQx3NrgWSp0wAPFUDexgwTzCIEZ5PGbi77hw3kKYaZKW0mxqVQ8P/i/C
 5gfSLWTZXtHu5Yf6gqrgOXD/M4u/yFDVvZZItOJP93k5yKincD/sH9bz1FDsRg2Zej9uhQ4=
X-Google-Smtp-Source: AGHT+IGm0KQb0Vij9k3D8pZVpr5BC9rc0eUVUGgKeQWn4WWcS07Ek9mP0rUYBloUQD6i7NVcVlTQ1A==
X-Received: by 2002:a05:6512:1183:b0:543:c3c7:b3ad with SMTP id
 2adb3069b0e04-543c3c7b449mr4225553e87.50.1737928368581; 
 Sun, 26 Jan 2025 13:52:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c83682d1sm1039176e87.155.2025.01.26.13.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 13:52:47 -0800 (PST)
Date: Sun, 26 Jan 2025 23:52:44 +0200
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
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Stable List <stable@vger.kernel.org>
Subject: Re: [PATCH v8 02/13] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
Message-ID: <mzz2zkxcd3z3jinxoty4unqxtm5jdynnlkzggwejtz6nzo7afq@bmspzevjb2lj>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
 <20250126191551.741957-3-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126191551.741957-3-aradhya.bhatia@linux.dev>
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

On Mon, Jan 27, 2025 at 12:45:40AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The driver code doesn't have a Phy de-initialization path as yet, and so
> it does not clear the phy_initialized flag while suspending. This is a
> problem because after resume the driver looks at this flag to determine
> if a Phy re-initialization is required or not. It is in fact required
> because the hardware is resuming from a suspend, but the driver does not
> carry out any re-initialization causing the D-Phy to not work at all.
> 
> Call the counterparts of phy_init() and phy_power_on(), that are
> phy_exit() and phy_power_off(), from _bridge_post_disable(), and clear
> the flags so that the Phy can be initialized again when required.
> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Cc: Stable List <stable@vger.kernel.org>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
