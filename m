Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C4A455C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F9410E84F;
	Wed, 26 Feb 2025 06:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iBkH+YDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6A610E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:40:45 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-548430564d9so4047066e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552044; x=1741156844; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lvrcxh2NOKDJoqVw96Qhct4iGfREhK0gSFGHNTyZJvg=;
 b=iBkH+YDflTsqnpYSpbRYhwSgGCBPQBMGarBfkermTDjmY9u9KPTvd+3aQSVek+cPuJ
 2vL5hstwDOwPP+3DtcQwOs11U/c4mzq1gGIcRErZ/cjr0AOhhIwLA6W6YC8HHeh4KRsc
 5V8WG91IUMEIqtbJ0MEzW1PcyIbeAPhTQsKU/mTlGqc+VjIDUiulHYI+V1JVgEcYEZTq
 vKgmt3S0JM+egLlmSA7uBKJbDIbKLZG/tefKZrCtSyDj1o8xvIaeaXz1IHn7UxfS+LhY
 4VXMP3vxBG4tLeCaLYB2F06ixut1gjv8fInjURWCTtC469sX8khFJ6fbpaAhITTvjqER
 OndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552044; x=1741156844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lvrcxh2NOKDJoqVw96Qhct4iGfREhK0gSFGHNTyZJvg=;
 b=gVNcWHJO8qLGYA//F/mCiUsSRjXsS4LeIqT+ITVqOLjRwRj/Y/15vs7nY4Tn5B61yQ
 BCBkoZ0furxKZUuZX1hz0bbyPzQs0ocemq0934ILiVIjV4c3NsC4PVNgwr/DTuwffXbe
 CQFZgA2teEJtykOxq8NkOyjZ5kziuSGAIMvoDNo903gVH1PNJUp6+8vYiqVYXNZV3m40
 leDH8of5daF0qxD30Mvk/WOSS+lZJB4wMs9thnr+3rOrJVEjAPdUn/LmLT7UC+mOJlmO
 nWbSTS24rofxoWXIgJ/eaGPu5HPyk0jFVXFq0X3TTSWhi+or9ke4p6iq56kUvWbGKFFZ
 TBFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWiB+VJdmGZctNUDOCSuNma2OtuJLZpow6gT1uSmEANQsBBXlXTnpCt2TGHH2w5z796w48lWnRCx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrnOMIT3G5pFvowb5LTDQ/0jBq9PzeHtFyi+FXKgLRtUzAwnIh
 l7z395IK/x/NTNExJtyI2SwvjdX9MdslDzdEpScQd2WySBeCJAKsKvkpkjbhUVw=
X-Gm-Gg: ASbGncukTmz4A7mNeVQMe+L6LitvOFDk/N+ytV0OzE31/6ZNc2WsuSCboab4td+eJ8g
 x4xFzELADxaJTaub0xwVidOwWWdnjMc76TSmDk3hzSqCXTskTvwmYEURfmld06mteCJsu4uedVL
 8VbdBpgkDydyy2n0+wvk+Pa++Gf6bkQLNcV6yfwWfz/K2+PIHEvwMzlp8eFfrJQ0kuyzKcp74/x
 GBRpih3q0d+RC29zXN3LFTR4PkGupMRVNQzcX6McBDsLLYmru6/fj3VWQB7p/LdfdcRP87TfFDO
 WOTjj85SYmDMuYinp+8bgN5PTLHA4e6XDiKZAFn1pkWRc4NyiVSN2051gYxF/kWCNzH/3M+Nk5o
 t573cNg==
X-Google-Smtp-Source: AGHT+IE+UZnvevEs1viGMTJRPBC8JRF4hWUCWXPwjS+7NIlt6UfyZslUh/zC7Mo+N1nw7oya2efNUw==
X-Received: by 2002:ac2:4c2f:0:b0:549:2ae5:a499 with SMTP id
 2adb3069b0e04-5492ae5a600mr2619977e87.7.1740552044249; 
 Tue, 25 Feb 2025 22:40:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f9e3fsm362150e87.217.2025.02.25.22.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:40:42 -0800 (PST)
Date: Wed, 26 Feb 2025 08:40:41 +0200
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/15] drm/tests: Add kunit tests for bridges
Message-ID: <yzddmmuq4nweiat7zlt7pmac76djx2o5jw4g6rucomasbkiaek@v4hcph45qf74>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-3-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-3-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:51PM +0100, Maxime Ripard wrote:
> None of the drm_bridge function have kunit tests so far. Let's change
> that, starting with drm_bridge_get_current_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                 |   1 +
>  drivers/gpu/drm/tests/Makefile          |   1 +
>  drivers/gpu/drm/tests/drm_bridge_test.c | 210 ++++++++++++++++++++++++++++++++
>  3 files changed, 212 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
