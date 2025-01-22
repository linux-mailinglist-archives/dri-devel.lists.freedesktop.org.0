Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23343A19ABD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 23:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5323B10E76B;
	Wed, 22 Jan 2025 22:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZZedrW/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10EC10E77F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 22:14:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-304d757a9c1so3592651fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737584079; x=1738188879; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jwZtc77vhcVJuVM8Re9KLoWSMRTvcITBEPJQXYppitQ=;
 b=ZZedrW/MJ9pQPRlE1muu4oWuqaoRvPz7pAAyBX4F9Ilo4+88Xh3E549QZKGnUvS9XY
 H4aGTzgQH+I9aVzF2ZC7WBwErgYuaZXuxvqEh0S9zBZ5FCs/XEKS1gy0qCEBmdCIasVg
 xkEGCD1xL+rdrVhASkL/LLjadfwQqS7LnhLuKM59HWwCBkxhp3j5WCEy56Dyq8H/YzpL
 Trk8K/zX+Ed9mz/WFO3LhO4hn9JdHhXnYySQIu+HOxxmha0ywixcEhBwqzZvTe+XZi5a
 0G2MFWeigqAGYi+WGo3yaHIK463xmvW2Zr5yKL2rjjJuXD93KvGoNWoRHBtsFE7KJV5X
 Y8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737584079; x=1738188879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwZtc77vhcVJuVM8Re9KLoWSMRTvcITBEPJQXYppitQ=;
 b=HhFt+iqbi0OjjGZwABQoQVa1AlvhlwSDdxYK49Gnk38zNw8h8726bjQa/fposrOiZz
 Be3hQn/oE17ft2GnNvjLS99ORQQqiGv904V1mKkgqSTr4MdhESSpzecv4h+/MiTW+9aE
 5MyBdnev2Qefq/wMwvfPvK3E54qOQPcjY/3swvF4MesTMBzVs2eqszCWHr3ElzGzRUqE
 Jy0c09wWmZHqj5/uhOXbtAHR6sp7gnbXfNQwE32yyFEEUD/GSBETp/p8yR4ANlVzHjzq
 Rq4ocDpGIRkkRHlep03EckE4wbAllrkqH5dK/uTPCZCo/4mpsO1yybi7uBqbYWipVQLN
 +QvQ==
X-Gm-Message-State: AOJu0Yza8q6ZTZ3YNz1XgTr5S01JJQyZQJWqtkMKwL5/Y3QY6gAwHKfS
 1AgxW85fxMQiN6Mf08s8T0Oj5cEroZeC/IzMDod3oekAbwb5J8WS4c96K3N4QYo=
X-Gm-Gg: ASbGnct7LBYieBnln9YgdTOZjxtqNsIsdgUiZTz2qnN4F1YtlfymRQt816Ip+WuEYgJ
 3nfgs8445FZlNu4MnWYm8NvUp3jKtWsVqp2NiUoNEhxeIXd4GvSQOFlldX2yuWGddpOE+V4rNYd
 V2cww04lJ4mymIjhW7YvQXIixx0sIg6Ichw2D7sN04NHddk6o+1C4Ps367+OckCmw9szaYpHV0y
 H+Ek10X22YRvALBpg39GNkittejde+HzJnmejGXyOZpC/GHaf8SU1cW6tEncSaYabZZwDh8aN3f
 yn9kS9wbbQ+bbKyNpvuDcjIAkujdyCsohXfFOpGoaCp+gh0EtNb9GJYqJ+Io
X-Google-Smtp-Source: AGHT+IFK/4GQM98jZZ/5OPlTud8xH7WRoXr9IJVmyofaZZMHWNRpLmTWDBbwwb5fKkA6+eFoKUKwWg==
X-Received: by 2002:a05:651c:410d:b0:300:3307:389f with SMTP id
 38308e7fff4ca-307619c49c8mr1819821fa.0.1737584079129; 
 Wed, 22 Jan 2025 14:14:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed2d2sm27708361fa.74.2025.01.22.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 14:14:37 -0800 (PST)
Date: Thu, 23 Jan 2025 00:14:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Message-ID: <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
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

On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
> Existing DPCD access functions return an error code or the number of
> bytes being read / write in case of partial access. However a lot of
> drivers either (incorrectly) ignore partial access or mishandle error
> codes. In other cases this results in a boilerplate code which compares
> returned value with the size.
> 
> As suggested by Jani implement new set of DPCD access helpers, which
> ignore partial access, always return 0 or an error code. Reimplement
> existing helpers using the new functions to ensure backwards
> compatibility.
> 
> This series targets only the DRM helpers code. If the approach is found
> to be acceptable, each of the drivers should be converted on its own.

Gracious ping for the series, it's been posted a week ago.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (7):
>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
>       drm/display: dp: implement new access helpers
>       drm/display: dp: use new DCPD access helpers
>       drm/display: dp-aux-dev: use new DCPD access helpers
>       drm/display: dp-cec: use new DCPD access helpers
>       drm/display: dp-mst-topology: use new DCPD access helpers
>       drm/display: dp-tunnel: use new DCPD access helpers
> 
>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
>  include/drm/display/drm_dp_helper.h           |  81 +++++-
>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
>  9 files changed, 354 insertions(+), 345 deletions(-)
> ---
> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
