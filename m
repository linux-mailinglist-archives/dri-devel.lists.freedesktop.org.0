Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98DD9F3E3B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1E10E4D2;
	Mon, 16 Dec 2024 23:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eHwplglo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6974E10E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 23:27:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso5450965e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 15:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734391674; x=1734996474; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=akfQP25JefiJ/TKw5uzaBdDihIUT/GOLadWDictxU6E=;
 b=eHwplglov2MmSZegPUBij9J95jgr5e/nBQKZQ1drLcgxQsvQdwSOaFTrl1qoP9HFkO
 wWseMYegcAJxI7R+lQxNAYJYDORB3mf6I6zn+ZwkyfxJ39COZDwfuPaHi1BcqQ+6cpqQ
 RmGnq9E9Irq9EsgPmwYLVjyrWbUes0Ecq8Szutyzc8u2Kp0XxNcj5xNozreR++m4kYrf
 DYRlg6joynkCUUm1yQ28E7qoarXpu3TPMqNmlUa0STVahRbbsLVno+Gft0tSgoIKf2rO
 Kil7Ejn3gDP9cEYCyEBZmtGaERnef4lH2pt99X9hXMP5X/YskdGz64qw3N7c3diRXZcZ
 IYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734391674; x=1734996474;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akfQP25JefiJ/TKw5uzaBdDihIUT/GOLadWDictxU6E=;
 b=GVvo8SHHbcA7Y8yPB8fVLNAOwyoRw4AHMZ0ZQT01B037fiffc0LFt4RBnjfJXs9/IR
 OKsWJOxiVA5wUo64mBFnm+Qx/0iYTy7EcRNKPuWXBr3I6fUf8vQYGiJU00cAewUTmExG
 o0soErmmb5yR9in4LPV+B3pEFge7thDUCz7t+WEtBVigZFpdWsddiDR78yZ1IW+1/DIZ
 d3oiQNgR1WgdF8Bzi4WGGWesw1vF0waNYmjOe+C2S4OrvQDLrtcfeqmhEGwhxsJO+wYC
 m6L9Uz1z7rc7DOWAO7H1wTm0392L+NwnTtCKrJIpusXuZ95kDcHgNjA4491d9+18feWW
 eESA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW7qjPRK1wjeLxyaK87lx8fAxgoFCDQvkrOtdX8GXz35F+rkWv0ztXtmgrlqEB9m41Br4pffFL6OE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh7ksOG9ut9FYVcQJ5J0uu1+fT7xQY69Zqnom7qyhlp4mXdPk5
 XwkklWiNvDew5mj4ypL769Y23rOi4QEbfJBQ3cvFl5p0F0vO8rCp5nD4we2ewiE=
X-Gm-Gg: ASbGnctHtK5VskDCnEYa64+qKXFkHrGLylSn457RII8Uo4TAh8qe5OgQvyP6TB29D66
 VGC1SsdYJFU6gja+RSn3Kvn65u0/WycJVydkNLFr27itHN1THcxJ+CXYXSnPqCTX5001mpPJVxu
 +H7s8q6NXEaAx9FVO3xQNJGYP3P7K0h0oTuePAIjjB/Tc5l8NsDSeAFtFfx/iXz6Jy5Sz2EmRwT
 +rGWZztSQOv7AUYte6ytGrJ2jBswa6hir7FD5DODnNrP3Bpus9CsbS9Lj9wv/zV+CBuQMhZGGBJ
 7Zh3MSu83l2u4wWNQtfYOaS/nEUSKvGGZ3Vv
X-Google-Smtp-Source: AGHT+IHuMwbituYzpO/gqLrVnLgQvpnm7NvIBskKam1c0urWPpQ+JwfR+BJdSDwmwff6lC/CbAgOIw==
X-Received: by 2002:a05:6512:39c8:b0:53e:384e:13e5 with SMTP id
 2adb3069b0e04-54090560b39mr5344046e87.32.1734391673495; 
 Mon, 16 Dec 2024 15:27:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9945sm1011228e87.60.2024.12.16.15.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 15:27:52 -0800 (PST)
Date: Tue, 17 Dec 2024 01:27:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/bridge-connector: Prioritize
 supported_formats over ycbcr_420_allowed
Message-ID: <c36o6ro5qqfkqipltlecb3r22d5k3xiqdt46rtl2gdyha7xtmm@l2ovdfono7np>
References: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
 <20241217-bridge-conn-fmt-prio-v3-1-3ecb3c8fc06f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-bridge-conn-fmt-prio-v3-1-3ecb3c8fc06f@collabora.com>
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

On Tue, Dec 17, 2024 at 12:54:07AM +0200, Cristian Ciocaltea wrote:
> Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
> supposed to rely on drm_bridge->supported_formats bitmask to advertise
> the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
> the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
> redundant in this particular context.
> 
> Moreover, when drm_bridge_connector gets initialised, only
> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
> the equivalent property of the base drm_connector, which effectively
> discards the formats advertised by the HDMI bridge.
> 
> Handle the inconsistency by overwriting drm_bridge->ycbcr_420_allowed
> for HDMI bridges according to drm_bridge->supported_formats, before
> adding them to the global bridge list.
> 
> Additionally, ensure the YUV420 related bit is removed from the bitmask
> passed to drmm_connector_hdmi_init() when the final ycbcr_420_allowed
> flag for the connector ends up not being set (i.e. the case of having at
> least one non-HDMI bridge in the pipeline that didn't enable it).
> 
> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 8 ++++++--
>  drivers/gpu/drm/drm_bridge.c                   | 4 ++++
>  2 files changed, 10 insertions(+), 2 deletions(-)

I think the second patch in the series is enough, it ensures that
connector's state is consistent, no matter if the drm_bridge_connector
is being used or a normal drm_connector.

Nevertheless, I'd leave the final decision to DRM maintainers.

-- 
With best wishes
Dmitry
