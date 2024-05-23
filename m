Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62A8CCECC
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190E989BAE;
	Thu, 23 May 2024 09:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fsraDXtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE6610E175
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:12:36 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e78fe9fc2bso32281941fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716455554; x=1717060354; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
 b=fsraDXtxaOJizC5nkVOud+6EefNPAUw16t112Ul/Bs8ut2+gNBSwUDQffmZ5Al2gtf
 j/lAy7tsnTeo89KELnPujQzE3J/qY9FSUi1tthTygICO7J6FIajbxMdWgcLWj+ZGUctL
 pj4Rx/Vwg3pZhv+g3dVGezXVrPwTezQDPKEFD5oE0q/bmOaw3sp8SbvVLlhPG13EdIXC
 BDhtxq0ZNli+dplsj4EOOPOVYwv2Z4tZJTg1gmB5pXU1j9IvGjpLGdLn7hggiWGdD5KD
 ZEL6dJ0mBLL84obaV4GEKaeXOIc2zpLaSULjtKlwnRAacONQ9/9PLoEdqrALIdQoz+bY
 8ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716455554; x=1717060354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
 b=lC0T8mrBHvmkTopDVN3Aq1MUFk7fxEUcJXi+oaRvMkkZfEYbCcFDrUfSghukF7wXoD
 w6kcCRDS7c2WA7rfc31cLK5AX9hGATR8oy1+kS3nkVSxWvw58DLJP2ptyPHQjMXrR5Kt
 dhU1PSJf9HCWN/NY3v4sHYld3l6drsh2AC2m3JEaezMomfwC/J642SpAUCaM52229O7w
 i+i/gnlHaNTZK6UlBqWZZXfMOm4pV8rMhutQx29R2/MzAxIZyfos7ST38cf0VmIOQci+
 x9krqqr2pbVU98hju5hLvyzKTLJ0d08gmSuHLn6tZOAFeGi2pf+vsm+pNR+iKIHEj/v4
 lqew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmvVzMR1533TSeVorKXf+bsvNcu+6GCA8l7SJ1zNAN8Hm36CmPgeJ02rnmy3oBM7ViFICHcQ8bIDGcIf2gys7SrJ2iQP2TUeeH3cm7jymX
X-Gm-Message-State: AOJu0YzAITCYFHJQ7bOirmJd/zPe3S1Mh68sOOoU4u/BDCSKh/aXFQeE
 QXgbReFFZXu1L/8pE53UMVO1h3U88XgsXZRJg1GWDZ1/H15bu6NI9nCHGZcWEd8=
X-Google-Smtp-Source: AGHT+IFRp9kSkZyOBZ37uKA0zC3RicLR9A71BI+sImuk8bVozEkI6NVn6ruWTcgBILxGVWLUmvKCJg==
X-Received: by 2002:a2e:8797:0:b0:2da:9ed:9b43 with SMTP id
 38308e7fff4ca-2e9494bdbcbmr26440181fa.31.1716455554344; 
 Thu, 23 May 2024 02:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d15158c4sm41368191fa.73.2024.05.23.02.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:12:33 -0700 (PDT)
Date: Thu, 23 May 2024 12:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 07/28] drm/connector: hdmi: Add support for output
 format
Message-ID: <dxqf6n2gaksc66rksmdcaky22nz226veex5q6mw4c6npsuobut@m3vuxyai3evm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:40PM +0200, Maxime Ripard wrote:
> Just like BPC, we'll add support for automatic selection of the output
> format for HDMI connectors.
> 
> Let's add the needed defaults and fields for now.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  3 ++-
>  drivers/gpu/drm/drm_atomic.c                       |  2 ++
>  drivers/gpu/drm/drm_connector.c                    | 31 ++++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         |  9 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 +++++++++++----
>  include/drm/drm_connector.h                        | 20 ++++++++++++++
>  6 files changed, 81 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
