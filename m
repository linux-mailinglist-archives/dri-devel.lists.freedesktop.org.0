Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BCA17B3E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CEA10E086;
	Tue, 21 Jan 2025 10:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VkOX6dNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A210E086
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:17:40 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-304d760f118so45320991fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737454599; x=1738059399; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jS21cbWSnZbcTNjc+zqP0lMl2HLl8gKtLzORakq4t8w=;
 b=VkOX6dNOaZq/mTVo/iwqNN1FY2fZleOw+fQbmeX3iLBgimqrfvylIfjCXPmAkn/92u
 cTYqplWvih3gROwFqJLGa+iiITlq/46jyhNgAnG9j8RM8ZW/usk83Auylwr+tHGt1VWE
 m1l/PtEau5MkS9zKMYX7B2EbXPM+HZvPgnZm4jEYN8Afye14sjKeGrrS4JxJOC/RA/oq
 E/c3Udfci4G1P59lEu5hf0C9e2wvBj86NfE4oUUzfVJu0KLh2KlmlHEsSVW2n1C0r+/B
 l7deyhXjEiVArQAPHW40tVTU1m6azmIc5pVI+XUtzqSVCwhBpypzVJSKnqxobdKClQrE
 UsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454599; x=1738059399;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jS21cbWSnZbcTNjc+zqP0lMl2HLl8gKtLzORakq4t8w=;
 b=C1KbPprgTM3b3rTmnnalRNOGR7w3e44N6oVP6y5LKJ67LtJiat97+EGRntJOs0TTo9
 PAn1EUpUdLLYbLsFC+91m2Uox3iQpIoC/3hYEcNqMsQWVF3LeRE8IXOU3OWwk3p/ByEn
 vPj9AFFRwUiUCdjSJJyDjG0Tr6nNeHpb8NyVZj4C1HE3/3+wPdS+CKWRwL9rP/WWXfa6
 mxzP/xbyC/vqr9gova7MRhwwg2aE/BRZfb2zaf+XKsOOlaH0p9eost+ZAhyDjqEum9s8
 oDgyA/VomJeK0JpH4n9XUmQrlk+CV6gpaD29qaB4lwA0u/ZH/qOJiA79yxBj4h238j7E
 Ncmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6w4uiOV+CuhIDauThSkkKvxfM/RroitJckM65evUlEMhYFNWilZ8Ef4EngZSWTKlNpv4ZVXagnxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycz5A73WDjCJzjGVYkv9RC7/9gzftOT/1MuoXRatEi/SnXcoa3
 ZLQuA77BIqDYSsU3YnQ/fIlLA3JzEs6jYxLPgTpGqxKT19Noh87tAyfVW+pYPvA=
X-Gm-Gg: ASbGncuubVCZLsIYGhTjXdIzwc6g26Yt3mYA2vDddkMTk7RcOHBWaaENYQOerWO0arb
 B60KyTT38ad3tRMfmELK8NZNYjONII93eL2oCu/gVfzPnOAkva6dnUf+VbujFbJsj6fbmosrOg6
 EbeyPVyaunePk/CDm4ZQ0vio47zrO3XLW2hr17js9hXb59nwOt9KYjOokx6MwqTEb5btDHM6uBP
 a/IbbvxwJh6lADyleRzW/rA2kxgsmcx6lbW4kJ0t1+xcVG1dnN8Oz7pSt2BLpVVLRs96Pmmd3CF
 Ez4vWOCXHSeYUj6GxWyMm+TETdVZVnaCOwDfjD5yBySNtPVgQg==
X-Google-Smtp-Source: AGHT+IHL908JnrRZIpSzTaS+TH5HkOXAJmgtJZBqyAaScL1vVV1tK77ebPsMKEY480aW7wSa3ugNHA==
X-Received: by 2002:a05:651c:b12:b0:304:d31f:2fbc with SMTP id
 38308e7fff4ca-3072cb817c5mr55997801fa.36.1737454598729; 
 Tue, 21 Jan 2025 02:16:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a344dbdsm20467441fa.40.2025.01.21.02.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:16:38 -0800 (PST)
Date: Tue, 21 Jan 2025 12:16:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: oushixiong1025@163.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/bridge: Use devm_platform_get_and_ioremap_resource()
Message-ID: <5azphlwpnx6i6uj367ywj6xyr24dcwjpx55hg4ibvb4y5qmngi@ngh2qeuazgd3>
References: <20250121081336.218918-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121081336.218918-1-oushixiong1025@163.com>
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

On Tue, Jan 21, 2025 at 04:13:36PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 

Missing commit message

> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

This doesn't match your email address, so SoB is missing.

> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
>  drivers/gpu/drm/bridge/microchip-lvds.c            | 5 ++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 3 +--
>  3 files changed, 4 insertions(+), 8 deletions(-)
> 
> 

-- 
With best wishes
Dmitry
