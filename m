Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303F6218D9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCE610E49A;
	Tue,  8 Nov 2022 15:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D5110E49A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 15:54:03 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z18so23133872edb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VYgDBew4hVqkPCqPA0g2lZuYyRZVLCgUnOyKgxZtsiU=;
 b=VCletfrkm2QP28kLr1ndkQoa0b/OfPHiOr+d5VRJPXTI8D89yTexwp1l22/7bNSq4m
 nTvBafuvM50M5mos5B4eV0xCUQSFWYORTJwYHb/+SyQxSdekDileLXJVA3oOYN2O2BkP
 e8M89qG6CAQkak24ixKDVXzi8ikTbbGjYCprE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VYgDBew4hVqkPCqPA0g2lZuYyRZVLCgUnOyKgxZtsiU=;
 b=cKWoxZSATMPD3L1bqYND6wLk/HFyFckeO/lCZboXq99B1jvXniNbKPrA15NAf3tC2/
 hQUbAG2xhnAtQLvlV1mD6dak8eShSwVH/zT+EnYCibkd5HA2MSPVT5ZElofINjhC1f5f
 4wPvQK1bnIYf9B2LU/PQc4VcPDek1eNZ8YYhQsI3aQUG9nP5hN6boQGL5TkSu5rX/b1j
 oy9IPjGwICRZ5Ey+HyltixuJa00ZfAbLmquKIO1Xh7HjwoKxfNo/L4k0BT5uuKvHT7YB
 hGSbdRWapOJja+zTriRNXpxiRpzZy0HDuRnPuwyKXEoT4OIELnFT3OKrVW4aQ7ZJkP+L
 LELQ==
X-Gm-Message-State: ACrzQf15yI83v8jHPMxi+g4suehRkySPjdjfeBQFSxpLJYQw9zlBIclg
 C5UIMaXpEa2qBpCt4FruNu0V5PzHM+nUBA==
X-Google-Smtp-Source: AMsMyM5zbEIYURtAl7I7j0dEd+CsxpAeG5aydtTNlDrm7nx530uz8xEsSWJMTS2DlwygEmcGN4dqkA==
X-Received: by 2002:a50:ee0a:0:b0:463:4055:9db4 with SMTP id
 g10-20020a50ee0a000000b0046340559db4mr50822203eds.421.1667922842099; 
 Tue, 08 Nov 2022 07:54:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e8-20020a170906314800b0077b2b0563f4sm4862458eje.173.2022.11.08.07.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 07:54:01 -0800 (PST)
Date: Tue, 8 Nov 2022 16:53:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 0/7] drm: Review of mode copies
Message-ID: <Y2p7l/6hy8NxO2rP@phenom.ffwll.local>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 09:25:38PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Repost of the stragglers from
> https://patchwork.freedesktop.org/series/100393/
> 
> Note that I didn't rerun the cocci stuff, nor have I had
> time to come up with something to inluce the cocci scripts
> in the tree. So it's possible this is missing some new
> things that have snuck in the meantime.
> 
> Ville Syrjälä (7):
>   drm/amdgpu: Use drm_mode_init() for on-stack modes
>   drm/hisilicon: Use drm_mode_init() for on-stack modes
>   drm/msm: Use drm_mode_init() for on-stack modes
>   drm/msm: Use drm_mode_copy()
>   drm/mtk: Use drm_mode_init() for on-stack modes
>   drm/rockchip: Use drm_mode_copy()
>   drm/sti: Use drm_mode_copy()

On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Imo ping Alex/Rob and stuff everything left into drm-misc-next.
-Daniel

> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 3 ++-
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                  | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
>  drivers/gpu/drm/msm/dp/dp_display.c                  | 2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c               | 2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c                 | 2 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c               | 2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                        | 2 +-
>  drivers/gpu/drm/sti/sti_hda.c                        | 2 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                       | 2 +-
>  11 files changed, 16 insertions(+), 12 deletions(-)
> 
> -- 
> 2.37.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
