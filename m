Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D01A26181
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF710E52C;
	Mon,  3 Feb 2025 17:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bl/gDt/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B5F10E52C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:32:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso4995748e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603921; x=1739208721; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GDUijl8uS2TQuu4uVYKfLNqBTHvBE5FjtYAu/OpsnPw=;
 b=bl/gDt/Q08/g8B0Wv1gC65/odpxyRx20gHJmpoIj6+4JhDoQWv0b7dj5TbPMPghuxz
 bqxvcUZnoFgqMAUhCC7cEa2sAHNlk5QaVNUlUjk1H85OP8iMxAQPuEeYCd4ZsnJgpcUT
 4IuWmV84DZUzGFoCXMHy/syVO8UVTgENbkIJ7aPc2uGXLU03yPuYLgFURZmJJHki3obc
 8JmuIaRtGGdrJj89zTRkjGazt+022IhPILCgxjGCfEjRv15zVCo9i3nOd3SkWvxOaBL+
 gJteUP9/Nj0wZASp+8p20MFSe3oYJwYJlNgQsQRac6UAUZrkNTKkpNL4spoFfVKtIgtV
 5GBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603921; x=1739208721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDUijl8uS2TQuu4uVYKfLNqBTHvBE5FjtYAu/OpsnPw=;
 b=kM8kP1V4XOk7LlkfA7o3vjh5zsaEYlvYsFXrR55tfgeOm/sH1E+WIGe+2XveIJOwou
 8OIhfGKU2ptZklUJ1IGFf1RguNzUBles9YcTYDQ/tiA6t2S4Od6raLDXr/IsZemcE6U/
 wBNQtwTPwwFHTNO4vVKZz33G07trtfCrVii+EBw6QyurjXksoGB+cu6PtwaXrHKizXl9
 SVd1ip0R19L3Bp70t6QtLdvBo5Ruy0AzW9ivLcXR2AhCisq7vR8NJxmUQ8h+O8d9ew/0
 dMmePVrJ4MfvawB6r021a5m7cmfXJ7dKMBBYubdp+H8PmjBzzgBSoHUrKj9Hznux3wvd
 24SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgH76gR+y8IAhHkoxYxwWB99unLRBuTuV1LWpszgnX0w0Q/n6dobyV7k6jPX8vaeKLlq6f6MiHG2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0l7MGg0VfV3YWVDB1WjYJM3wHaHhHNCaQIOMbeBE7cVRRKbZm
 BHpzGG2z4JhCYHjDZk/IjhCec67oXejWUqxcog5RId/o2k6ghqHhCRsVv82OuCc=
X-Gm-Gg: ASbGncuFmv5uJEVkZtqG6zn7bvbT5xXa/WycRinZCDYWYql6qUhWbfvuV8CBuDNDKKn
 /mSwWntW9uakd0roqi5unS2g/+HU58fGj4NexOr2sPGORnrNNYQsYrCWYOpgZZLinVB+Tsg3QJm
 2zmFzyRSaSIbVEKuRwEJagrhKnj681bTAKW8QIFE32cdLR5JI7V7NqUId6Pj+/6zKYvFhMLp3Lc
 t2roHpaWs/5U/b6VyR2pJv2mopwivW0bSybJf91++HZhejPHDdjxR8b/uSItRprzRVFSK979/gX
 CEIxrQifT/L0kx6fx0oLLAo63pU7rDD9jwrVYP7RmTTowc5spSIGhFyu3Fy2x3kPV/gPtDU=
X-Google-Smtp-Source: AGHT+IEb+YyAW/StovyfhGvTrplF4uSDM9l+hAFGlMM+ryuL+SzWuAvhltLr7IYW4VtZW5P8EU0Sug==
X-Received: by 2002:ac2:5142:0:b0:542:91a5:1d5c with SMTP id
 2adb3069b0e04-543e4bdff1fmr5990527e87.8.1738603921128; 
 Mon, 03 Feb 2025 09:32:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebebeb49sm1356174e87.225.2025.02.03.09.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:31:59 -0800 (PST)
Date: Mon, 3 Feb 2025 19:31:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Message-ID: <75boqmmyd5hqpdluidnd72b6ygaxsharxtlxv5jmkgtehnmyuu@3udsy5y6s4hc>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <20250203161607.223731-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203161607.223731-4-herve.codina@bootlin.com>
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

On Mon, Feb 03, 2025 at 05:16:05PM +0100, Herve Codina wrote:
> The current code uses a the reset_pipe() local function to reset the
> CRTC outputs.
> 
> drm_atomic_helper_reset_crtc() has been introduced recently and it
> performs exact same operations.
> 
> In order to avoid code duplication, use the new helper instead of the
> local function.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
