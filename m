Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357CA34A22
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9610EB24;
	Thu, 13 Feb 2025 16:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QQQ8swQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CFC10EB29
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:38:31 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-308ec50eb3dso11399261fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464710; x=1740069510; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5zyljHRvLU6CfUIp4JEgLGjq0cbAwicms/vHIYSGJBE=;
 b=QQQ8swQLaEvzYVDGOc8hSVMPnJWblGauLj28TlMLL5PCQK/8KlaTkfrk7kdAK04Pts
 w5+ubSQHXeJbJoboVLF15rqHRhXqsXKGk23RWgVjtzGv/z++A7oz2UwLNti/SbCcoyTC
 eInWAuAhBG7aqF2chXGEb/XggdBryE/eHBejnCnn9QrGJEbXQtYZc2NdlSB8aJsojJhl
 o8uDX3PHzk+MPCT7ssMCmd5EYCc0T6yoqkqC4A49ged4wI+Mb0RuWAOWQ5MzYp+Z4wlQ
 RviZgSu5l+xstGQs2GKdqt5dmOsjSQ21ykBEUIPp4UDPGRK0hnzYeevDrHiGg7os1dDZ
 CxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464710; x=1740069510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zyljHRvLU6CfUIp4JEgLGjq0cbAwicms/vHIYSGJBE=;
 b=w/VCohtN57pxGKXNPzHzxgaeiL5l74XNuAIvj/LyoJzZP7uPjbYzhrrJ4I921ni9fO
 q+QoBu76uMdjZixHEcsdy8JuOa95gERSvnqLqqsCslHmX/Tg5JMwH+L+d26IsXb7FztV
 6ya/WevR5AwfDNdR3Nt36E5WrBt9hbUM5DzM9qibSnJLsb2W77XvT8feiY9ICdNFuLGg
 tiwX4U5xuX91Ouqh7BCcSranki7utMPQmR++x6FAC2AZOsXX2qJesNDqpjDF5+LXmTcX
 x+C4KwrDIzW7QWS5cnGcxX2/+dCg5Z4nwvb6dBcIOCwHpzlh16rCeng21fDZwQjHaywx
 j3cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkz60alhwOr3Ry0GQ+w9rFPkwHLRp0XWNRPSIMFCKxCUL5pTOnU7Q3/vSiGGrT7Z0IKqPQJ2ZIvug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDOe+70McIS8yYtKv30/ueZSUXvbRQ10fYf58rJiQ8opd0tB2I
 IBMm3IdNSZ9GVtOHqtfAoDEy6ek/ERw8nP3bjI+Gi3QQ4TNRsz2vi9vaZ7x9Y+4=
X-Gm-Gg: ASbGncuXyuZ0L5MI962BHziekvyvCTs8HvqYPVq1xk/B88UBEPR+UhQRC8LndTjemVR
 NUx7mWyxYug1TvsBSv79AxQdX20Cnt7ZZ3USjZn1jEVbGIO41mjp2cYN6iZsdiHuiO/MEUnKtPz
 A6Ss/jTd5RluNZhhZtqEHzRSKNOvTw1ysoUSsu8ImZX/dhL8NdhYl769Fc3tGYO3wDJBe3sLp1Z
 B6fz6YxHTHHleoQETeS7lBa8ljpC+D7zSvMb29JrQIvyOLkVqwBV4vV/W9nnM3OhevGrzoNjP16
 Fhv3uiP3n7+45PBGA/A0JtWmeSSbFDKV1vugSulw07xYNdR7flxbV1/gMhJgY9NWhe/iMgE=
X-Google-Smtp-Source: AGHT+IH3xnLzQL6gEDeHl+s2Ja74DCPJbtqw3lrnmuWXPCOb9TRK/IEStkbvlyJyjGyoNdKUiGIk2A==
X-Received: by 2002:a2e:bc85:0:b0:308:f84b:6b39 with SMTP id
 38308e7fff4ca-30903651966mr36959311fa.14.1739464710047; 
 Thu, 13 Feb 2025 08:38:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30910276f11sm2438831fa.74.2025.02.13.08.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:38:28 -0800 (PST)
Date: Thu, 13 Feb 2025 18:38:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 33/37] drm/bridge: cdns-csi: Switch to atomic helpers
Message-ID: <5nf3oizcucrdbaju5nmwxzizcvefvzf7vx2b3rqcra2ltaduvk@c3bvqbm5f42q>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-33-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-33-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:52PM +0100, Maxime Ripard wrote:
> The Cadence DSI driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the CRTC pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 29 ++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
