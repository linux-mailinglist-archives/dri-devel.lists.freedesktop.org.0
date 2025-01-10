Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBE0A08B35
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA8C10F02E;
	Fri, 10 Jan 2025 09:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="waeS81+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4354410F036
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 09:18:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1853838e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 01:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736500718; x=1737105518; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=teMG/Zd1XSpfgE57JFpVgJUAeecoObADRnfBk+Gxnho=;
 b=waeS81+i66uiqEMzrRnW6Xy92NQeg545KG1/OSS7ie9owVGwB4Bno7fKCe0DQQJb7V
 vHqA6qcgm83oZioweyRV6lU3Wl3eLiccfbj1TbX1Nq9RBATvELRmfB4e9lHqglLjFSkz
 HcZwoi69pA+wBUFheiRNBG/tXYuTRc7jlQvQBKjnDtIb7PJe7VCRhdgg5m7E5xZXVwiP
 k0qJbff7egMREeCJ4CCCnd/xJTMzXBVttMjFbjfoKxYsVub1GTAwRSG2QsEGSt6bBeM7
 XflNr99WHOFEML+B+oOgyY3xVFsV4OEsNyQXEOtSBwUdY1sNME0FTFvHAMIhzpyDAeLK
 PNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736500718; x=1737105518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teMG/Zd1XSpfgE57JFpVgJUAeecoObADRnfBk+Gxnho=;
 b=IbKl8KUQkKfKmpT8Chmt0BHI0mPDpWpSzwvE9fES+bOUtLMiOKHa3gI+sa9KLORS7c
 0RSgGkXqs9CIfj/7XX7yDOymL1w8ul813BDDbCSzQIabBYXJg005p9SmVIkauoZObO+f
 JtjVus0U1b4gtb4AL0SMVr/3y9N8x+45GpoMtx4iaZZK6+rIj/xLNPtSavpX9Rzeofc3
 yMrEY5Sy3zgi/1fd/IbcAKJTRM6MDELyuKG65wDzoNafgVvWIbBaQP1hXJ0/zD9VbgAp
 SlHTV0RNKaMYKvBgBzvn8rN6SRVBi5Un3uVJAWsPsqoX7VAjhyVaxu9jEgEkJ60oa9E6
 wAIg==
X-Gm-Message-State: AOJu0YwOi5P53RcAPk+ylpPw3SKoRLvp7twGQZ75nGlWYcZ58UClE8Dv
 T8aNHkr/ftvJgM/M6pPxmFhwfn75zCZJ+pabCcGEbOR82zzU1EDtLm0mkS347+s=
X-Gm-Gg: ASbGnctO0ASlsKB70GLU5a4VdMDlm4oWzwoabj/L9E/H0SRyUsKB+IVsdZU8d4D4zud
 AEjhvGoNMZ3DDxQvK7j0cJFh90hAYKbPoBDi+UVOBnEUzc4IO92tqXqtVF/F2ESwSSRmgj2/hzl
 /cvwLpzF2RJrTKgOpcBvBu2VLBN7c86YfZ6+nRDykMPmTtt1DkcgCFQxdVLupO3k6GjVZ2AMgj3
 La+TtffN+oA7M7hED/NAYJYDbnOO2Z8+bM18KtrPtrf+1g4MTFDtngiFwZs6/pl/Fp8zjcdDpiX
 BPHjKf83Jg+yTPkPSZL2aaiOWNWbhMeGJDjJ
X-Google-Smtp-Source: AGHT+IGaCxvfzPjJVwkWGcwq852Gx91BgF13INsaogd/pYQRSu0TBx1mjxSzFSbh+OGk3Ek7YvLN5Q==
X-Received: by 2002:a05:6512:6d6:b0:542:2e09:637a with SMTP id
 2adb3069b0e04-542845b18cemr3242406e87.12.1736500718548; 
 Fri, 10 Jan 2025 01:18:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becb2b5sm456714e87.252.2025.01.10.01.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:18:38 -0800 (PST)
Date: Fri, 10 Jan 2025 11:18:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH v2 1/2] drm/connector: hdmi: Do atomic check when necessary
Message-ID: <d7bb7ncdljijjdyaqf6tnvs2vk4brrwru2bg5uxmouabdnvocw@kgd63sykbmh4>
References: <20250110084821.3239518-1-victor.liu@nxp.com>
 <20250110084821.3239518-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110084821.3239518-2-victor.liu@nxp.com>
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

On Fri, Jan 10, 2025 at 04:48:20PM +0800, Liu Ying wrote:
> It's ok to pass atomic check successfully if an atomic commit tries to
> disable the display pipeline which the connector belongs to. That is,
> when the crtc or the best_encoder pointers in struct drm_connector_state
> are NULL, drm_atomic_helper_connector_hdmi_check() should return 0.
> Without the check against the NULL pointers, drm_default_rgb_quant_range()
> called by drm_atomic_helper_connector_hdmi_check() would dereference
> the NULL pointer to_match in drm_match_cea_mode().
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Call trace:
>  drm_default_rgb_quant_range+0x0/0x4c (P)
>  drm_bridge_connector_atomic_check+0x20/0x2c
>  drm_atomic_helper_check_modeset+0x488/0xc78
>  drm_atomic_helper_check+0x20/0xa4
>  drm_atomic_check_only+0x4b8/0x984
>  drm_atomic_commit+0x48/0xc4
>  drm_framebuffer_remove+0x44c/0x530
>  drm_mode_rmfb_work_fn+0x7c/0xa0
>  process_one_work+0x150/0x294
>  worker_thread+0x2dc/0x3dc
>  kthread+0x130/0x204
>  ret_from_fork+0x10/0x20
> 
> Fixes: 8ec116ff21a9 ("drm/display: bridge_connector: provide atomic_check for HDMI bridges")
> Fixes: 84e541b1e58e ("drm/sun4i: use drm_atomic_helper_connector_hdmi_check()")
> Fixes: 65548c8ff0ab ("drm/rockchip: inno_hdmi: Switch to HDMI connector")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Tested with i.MX8MP imx-lcdif.
> sun4i and rockchip are not tested due to no HW access.
> 
> v2:
> * Trim backtrace in commit message. (Dmitry)
> * Drop timestamps from backtrace commit message. (Dmitry)
> * Move the necessary checks from drm_bridge_connector_atomic_check() to
>   drm_atomic_helper_connector_hdmi_check(). (Dmitry)
> 
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
