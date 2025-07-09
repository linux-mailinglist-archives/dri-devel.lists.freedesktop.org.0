Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F225AFEA87
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B0E10E214;
	Wed,  9 Jul 2025 13:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hn5dHOD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D974010E214
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:43:17 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so3575634f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752068596; x=1752673396; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2GA0EN9gnFYPYZkAghvtePvaCSCWcIe7GtWQ7AJTlGM=;
 b=Hn5dHOD5aO+mwxZM2s+T5VopoDfN5wDvpDmLLLXkOnkhVEw4HnzKS3aAd+yI+jGDjd
 ZCoaIz41A46NyySW3Wf+CZHlpU8J0i9qAwhl9AgTuDwDBFcfyC5O3C96AN5ZTYjPfk4s
 3NyUPCM/0uWMpY1RUCJRwTYaAbkZLW/TkOOa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752068596; x=1752673396;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2GA0EN9gnFYPYZkAghvtePvaCSCWcIe7GtWQ7AJTlGM=;
 b=rRufiH/XV4KGR9akORgccoytuqAw8i8Hal7hHpTo4CNQFOIX8PWce4FZXFN8DDsxIi
 qPi//6vX+KItaPP6V7KNlsnl714b7zUWmgsdzEbJjbw0EdClrQI649L4GAg49Iarijj9
 AURlAOFptW92NSAkE06FzLaIcJVl5sR6mlklyHQCecO/9TkAE7tJlqNiXUIzzUHPXodU
 +tvnFDjbm5QH7cfjK9fHeg0GhAkW73sl/kklkN2H8XtNmEQ/IC+u0fapoGdXyY9c2DFU
 L6D72GWmjB3W10L8a9OggeVjiReqmTRu/YH4oMfo8QCzE2bxTqJ1cYQRUA593UNc6GrL
 ssvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCfHl8c8kmZeaO3pTniBT4lRBSJjo4qzsMhRf2FtF8g75WBRMYWUpwJDPLumnPxaNhmxkKmMUV6OI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW9YsGRUpIKXw4T/JYjoVcbd8N9BJkr8dNRBB243I/nmOs1Msc
 8WLn8btERFOVNGuDnEjR8s8VfBa3qEvHdxByt5MX2Ni7eKJ1reYWuc4mBaY/XlIlJm0=
X-Gm-Gg: ASbGncvfLJCxE6PKmx8tzDC1FIoTk8lAFLz0zKuxW0ITXPQ6V5nvF7yFAvxgrnfAbUH
 9dJiO9DIivg/fhleo7g86htmtg1V3fDZ034cMPooBnIzo+DPHEe03y0wAOpPmPGp6XXxpjXwN/q
 xLNV1oyHunsuMXKKq1LTeHJeLfxZceBStp7Xi7nLgafiVVNF47dwQED0cb8OwJv3JW3c4LIp2nt
 5xgW6NTW/etAILLD4YqSusU+6S57zlRj9mYTTnnUBhI4m6csxOm7iWc86bmAPnYUCoB8/xjU3Ao
 pkrCbEEYCSTgnjsHaU0kBKfvsPZCukvV6qb1pr+FuKsonFK/GowCPnYMU2lycy/iQqUDZbwKgA=
 =
X-Google-Smtp-Source: AGHT+IF79fZ8h3znMi15CeSd+JoB+26qQ0VCetCrzQoMkMwtHnpy+FY4TCDHHaTnggwV+tzno1DR/g==
X-Received: by 2002:a05:6000:4012:b0:3a4:f7af:b41 with SMTP id
 ffacd0b85a97d-3b5e4527f04mr2311867f8f.15.1752068596310; 
 Wed, 09 Jul 2025 06:43:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030bd42sm15591538f8f.5.2025.07.09.06.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:43:15 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:43:14 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Icenowy Zheng <uwu@icenowy.me>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20250706
Message-ID: <aG5x8taTg2D5Na2F@phenom.ffwll.local>
References: <20250706021955.2794-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250706021955.2794-1-chunkuang.hu@kernel.org>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Sun, Jul 06, 2025 at 02:19:55AM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This includes:
> 1. Add wait_event_timeout when disabling plane
> 2. only announce AFBC if really supported
> 3. mtk_dpi: Reorder output formats on MT8195/88
> 
> Regards,
> Chun-Kuang.
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250706
> 
> for you to fetch changes up to 8708a4897380da17bd1afa70f8c6bef06fefe360:
> 
>   drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88 (2025-06-25 15:13:09 +0000)

Tried to pull this, but doesn't seem to compile all that well:

drivers/gpu/drm/mediatek/mtk_crtc.c: In function ‘mtk_crtc_plane_disable’:
drivers/gpu/drm/mediatek/mtk_crtc.c:729:22: error: ‘struct mtk_crtc’ has no member named ‘cmdq_client’
  729 |         if (!mtk_crtc->cmdq_client.chan)
      |                      ^~


There's more. I'm not exactly sure what's going on, but this looks like it
wasn't tested?

Thanks, Sima

> 
> ----------------------------------------------------------------
> Mediatek DRM Fixes - 20250706
> 
> 1. Add wait_event_timeout when disabling plane
> 2. only announce AFBC if really supported
> 3. mtk_dpi: Reorder output formats on MT8195/88
> 
> ----------------------------------------------------------------
> Icenowy Zheng (1):
>       drm/mediatek: only announce AFBC if really supported
> 
> Jason-JH Lin (1):
>       drm/mediatek: Add wait_event_timeout when disabling plane
> 
> Louis-Alexis Eyraud (1):
>       drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
> 
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 34 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_crtc.h     |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  9 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c |  7 +++++++
>  drivers/gpu/drm/mediatek/mtk_dpi.c      |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.c    | 12 ++++++++++--
>  drivers/gpu/drm/mediatek/mtk_plane.h    |  3 ++-
>  9 files changed, 66 insertions(+), 6 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
