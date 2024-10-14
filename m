Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3899CC2D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED5810E2B0;
	Mon, 14 Oct 2024 14:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BA7sOqXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D6C10E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:05:37 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb4ec17f5cso8603691fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728914735; x=1729519535; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I3ZWorb8+RZKagcCRZE5upz10RMDYXXfKqea7CqMPBA=;
 b=BA7sOqXSu0uExlxZE4fuyCfAQ4bt31sX+Z1UEo6YFl+ShHKXmyTKn2ZfWTBtS1kXRv
 h3zFFXRirwajz/7xSebQAPClwY/qakKCexZQR7L/UdCoLx71dtuuVw3ugGVvSjcgRd9V
 V3THCQGYpVyPWMWAKkpmPqFRpkOyP0rTp+1GRuWtl+atXpMUFjYbZoleLf2+aU0td+YE
 bVagc+MyqMFDJanlajibvzS0ugY09AFhYHfBAylUSAz2GijWu/DqDNHVY2+FJkhw/nsK
 +ADWuumVD7/Q2X10rxjObYK8pYcfjluxPeImAaf0FsN4JfcTCTa3iYouB0ZjBBabDkWF
 Zp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728914735; x=1729519535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3ZWorb8+RZKagcCRZE5upz10RMDYXXfKqea7CqMPBA=;
 b=sl3EsHvtRc2bo6AaaBqJN64nRHx4e/o6W+Akk0iCmEqG8CPzbbI+iT0Ct1wzliYEFB
 UGB+tMVjL7SRpYN4JBaKXW8fv6R5qTf0l+oJBuL3xMpxTErHmV/A+58LD2BLuqg4H1ET
 Yw+u0F80hGoURhZhWKCZBa+d9ilUZXQIRyhmrBYMHWRL3cgBOjRwY7jYOXZuGQD88AyI
 7o9iDSVNWzqfWK/xPpMunimsWffxsDFjawLMM1cwjpT9z6vkOl8xkQ7vZEb3jeMs1yHA
 q9QkXEreXenrNrXO3Z+Oio1X9VR7oUmHtwmhQfyuFRFDFmjrOvUuTjcSTydb2pV+oGrr
 lgUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV71xp2S/uUm19VUxz5EzItsJ1rT1Lw37EsVw3CImYVuR8jCG5yGv8T/HnyDxwQ4bu6wtDIef1ELQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybJSmUqV0myT6qsHveIj54InGYFL6QmzLX9z0HIHsBJ+qsqRgk
 V+OtSTcah+Mcd+a6G87QKXZSKeZ9/a5pjEnhu2dAhXX2pFeyONHHO+DqqEK8vx4=
X-Google-Smtp-Source: AGHT+IGr3Nd5QXm3kjAkubtvYwT8DSFOO1CVmXbvWR421hBitV2drZZRqqgT48RCtHLlQbhkfWPYwg==
X-Received: by 2002:a2e:131a:0:b0:2fa:d84a:bd83 with SMTP id
 38308e7fff4ca-2fb32770fbamr41639751fa.24.1728914735111; 
 Mon, 14 Oct 2024 07:05:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb4c52d6dcsm4884491fa.103.2024.10.14.07.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 07:05:34 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:05:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Allen Chen <allen.chen@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v5 00/10]drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Message-ID: <jd2wxdsgcgqhiek557i32c7god3cb2ic6bovyrmwsljkqtdofb@lrerfednnobl>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:42:59PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> This is a v5 patch-set.

Please check the way you are sending your patches. For some reason my
email client lists patches 0-4 separately, patches 6-8 as a separate
thread and patches 5, 9, 10 as individual patches. Please use single git
send-email command to send the whole patchset.

> 
> There are lots of failure items while running HDCP CTS using UNIGRAF DPR-100.
> In Order to fix those failures, HDCP flow needs to be changed.
> 
> The DisplayPort AUX protocol supports I2C transport.
> In Order to support MCCS via the aux channel, the aux-i2c operation is added.
> 
> v4 ->v5:
> 	-add more messages for changes.
> 	-[2/10] modified AUX transfer data size judgment.
> 		change for-loop to do-while.
> 	-[7/10] change for-loop to do-while.
> 	-[9/10] change wait timer with timer_after()
> 
> 	links:
> 	https://lore.kernel.org/all/20240926074755.22176-4-Hermes.Wu@ite.com.tw/
> 	https://lore.kernel.org/all/20240926075134.22394-1-Hermes.Wu@ite.com.tw/
> 
> v3 ->v4:
> 	-split changes  into patches.
> 
> v2- > v3:
> 	-split aux read  KSV function to a patch.
> 	-[1/3] new in v3
> 	-[2/3] add description of patch
> 
> v1 -> v2 :
> 	- ignored.
> 
> 
> 
> Hermes Wu (10):
>   drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
>   drm/bridge: it6505: improve AUX operation for edid read
>   drm/bridge: it6505: add AUX operation for HDCP KSV list read
>   drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
>   drm/bridge: it6505: fix HDCP Bstatus check
>   drm/bridge: it6505: fix HDCP encryption when R0 ready
>   drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
>   drm/bridge: it6505: fix HDCP CTS compare V matching
>   drm/bridge: it6505: fix HDCP CTS KSV list wait timer
>   drm/bridge: it6505: add I2C functionality on AUX
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 334 +++++++++++++++++++++++-----
>  1 file changed, 277 insertions(+), 57 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
