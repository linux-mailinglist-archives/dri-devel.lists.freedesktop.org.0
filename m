Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF44933DFC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 15:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D9D10E0CB;
	Wed, 17 Jul 2024 13:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J6U9cufU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8329610E111
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 13:52:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so87026651fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721224369; x=1721829169; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qTZ1w34LpY+Iwl2cOExG2kPyEczemOKdDN28ITn5flU=;
 b=J6U9cufUb16vsQSMr46sjlbaG8Bk7ryb/wWJodkOcOSI0bPeg7e5E5pyS1iII3wrYB
 nWm0dqk8VCN6DLbPX+7DxPlM6kv73Ys4ZpF0X4jqO2OgjeZXR8Goxd3t+VbfdHQwTQZI
 y8rRNteE12/2JRkDLgaKZw9pF7aA+7sn2UJfA4e3DRLbKT/M75j+5c8s2aViy93i1mGB
 hH181fMiZXd+pwlKWa1DRndS9MzGnjpWGgWDMDCZViiYiprU5fLz0WJM8JAKw2RE6IMb
 vJhgOzEKGYAPNcrvymC0/bDs64bd5tnfQFKP1NoEUTXKXWG0CXUAf+bXlo7MLN+j+Xr5
 HoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224369; x=1721829169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTZ1w34LpY+Iwl2cOExG2kPyEczemOKdDN28ITn5flU=;
 b=SgbeQCtekgREftcbHOyuAUxDLQ5gZxYcpSR48XvnUM71v86MnncMZJ6shLx2w+dJQW
 b0Hy5HQ8uj/hGmmrPwXaPzBPSm4gr3rFouINZB9KpdeeGQbI+SUXgn94ps4zUXRnOA9i
 1EmdHjGo1v+dfgIpJVThSJA+bU8Cu/dNbbQDOHLE02NOFvWmqhDHM/VUjYMv/SRWUozX
 QU31AszA1L88AHzIck3SWjgfDZVVDUlWV3b0WjkFe4iWWFR+ffoj7knIWYGOpETnRv/K
 OlIvZLi5pgzpmWJRMmSbiV5Icz5sBO0p9mn5uYi9209JNBYJVyY9oqt16/ygAKelUPRU
 yrvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVheQlPLdbZrK8v5jdbBIWCD1fL5UcX0SkGhXxhlt2lfPPW60bJtUQIq+lPR3b1vMG1+1OJ3yrSB60SqRjl4rx0bwZara22A1u0tU/bowJK
X-Gm-Message-State: AOJu0YzPFpDxDp+dVhlactXNwwTsqd3mf+/k9f4+ao2HMCUHQ+I2CLd1
 WxP4oLOj/sSgqw0Lp/bONwH/l5gNlqSW0oXDDERkP2nWneSgMVWPY7jWMqZFpV4=
X-Google-Smtp-Source: AGHT+IE6OoXjvcCZm9Pc74dlkP2dbs85YedF8j5WiIaAFphQI9CaG9G+19xV9GW3eCQ2VKK4rEBu8A==
X-Received: by 2002:a05:6512:10d5:b0:52c:e402:4dc1 with SMTP id
 2adb3069b0e04-52ee543da79mr1235817e87.55.1721224369292; 
 Wed, 17 Jul 2024 06:52:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed252d771sm1482228e87.124.2024.07.17.06.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 06:52:48 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:52:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge-connector: Fix double free in error handling
 paths
Message-ID: <7nlj7lexg4hwllwaw27gtfsgvkbhlnodi3u2ckr7uwryvwkhhh@mjc5wduxripy>
References: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
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

On Thu, Jul 11, 2024 at 02:26:55PM GMT, Cristian Ciocaltea wrote:
> The recent switch to drmm allocation in drm_bridge_connector_init() may
> cause double free on bridge_connector in some of the error handling
> paths.
> 
> Drop the explicit kfree() calls on bridge_connector.
> 
> Fixes: c12907be57b1 ("drm/bridge-connector: switch to using drmm allocations")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
