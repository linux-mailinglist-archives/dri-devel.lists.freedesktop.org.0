Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA782A01C2F
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 23:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804F310E17B;
	Sun,  5 Jan 2025 22:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eIiwhAIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85CF10E17B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 22:44:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso71530131fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 14:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736116995; x=1736721795; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ozKCT1WX5bYZIp5BeslnEsWc8UBkFL9q47ZzhoaOURQ=;
 b=eIiwhAIOF7NZFQhQFZvNK6RY7xgUoS3auRXIFuUCLXH4SUffpEsWmb32EEjoV6VokF
 SAA8arAJtTdhh/ednCdfNkElcDIfIQmX3JNuGSyViftWmQvbRE9veWfkqQy8S8wGTi63
 nzzh/tfKNUDsOwTJ7LQWmGaTI6UNzBt4tXZeYStCr57/Lxfzwp6S8MFF8Ec732QAfO39
 rljsI+OhIp9Q5BgwidUJFBvTKl0K/X21Ebym4V5grLx8zk2XrM5NdQKUHEOPo21ZENG2
 HeA8O8BTn9y6BGHqwnP91VLhe6z2ncWFPoVuWjEWHikWWFduwlLRGC3N1i1g8IC+a5td
 dWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736116995; x=1736721795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozKCT1WX5bYZIp5BeslnEsWc8UBkFL9q47ZzhoaOURQ=;
 b=TOCtaurYRqPs+EC2tDVBjOF0T9cQlpUngQ3E34Ba4qPQOOo2rEi1Jq99AXChKu9iot
 V2klXadN/grEfFAu/zBsI2qnwXqgi9v4tOpEwCf2iSn/rVJ65/GEplT8M6EN2fiiylmp
 UjieyDUDJ8z4fFJFo9d+aCslI9cQC9ps4WF8llTNXEvDGb1VN0BSNa5/a9lBKxPhjnKi
 C1YTJjF2pxShNa7JCIIa30iffGeb+JpBxbQblMZl1N9kdCVOC9kl9rjzf2ghvpfTUqPj
 WDbjVZ2ySFEnZcMTaFzQHkRrO+lU66Lc7njSzo9N+Kn1/09fzlbzty8jNQVwXqI87fhR
 MdTA==
X-Gm-Message-State: AOJu0Yz68iNvUfm+J1PkR7PYzu40iwxkZsErD3bvO3CE/FqTl2dBzN4Q
 MrfWmFr62QiAAdeLhCE/6sKbi7U40Zf9pMsdfuLj2cx8VGhlLRF4zOCmhIBQwvQ=
X-Gm-Gg: ASbGnctJ1efzpBS+/dEizoaubUAB7wbHGSZGsSySfQpMUGlAd6EtkvzSPO0HpgvGRH+
 87gfoU7ty50tKo2dFoevI8L+oigB4z8uNMswKZ9an+qbKqQ0m4F4CyubSvgE2dSr0Q34CdmCVEk
 doUbxYqEXnIdS1c9gNetq/hmB7MtPw+r/2R8ut1gyXpEK0gO2aTzFjMYanRdSjC4libpo+mW5rN
 jTdmZwYZrhvzBvn2QoBAf25jHHUf7h92mOX5dsfQkmW2mn/ZS/4dqmKxfrJIWycQk3JvrMPpuex
 RWIkt/zqswhMFelRhIHKhleimLBXBju9YSST
X-Google-Smtp-Source: AGHT+IHIKLH5ukoNCrCzDVfYqohtSK1YjvsCrp0LEO7iWSfMJwRC+W/nnSb8PQb9s22YGbI1jNfIxQ==
X-Received: by 2002:a05:6512:39cc:b0:542:250d:eefb with SMTP id
 2adb3069b0e04-5422955fd2fmr17723642e87.41.1736116994958; 
 Sun, 05 Jan 2025 14:43:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6509sm4681290e87.25.2025.01.05.14.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 14:43:13 -0800 (PST)
Date: Mon, 6 Jan 2025 00:43:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jesse Van Gavere <jesseevg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Adam Ford <aford173@gmail.com>, 
 Jani Nikula <jani.nikula@intel.com>,
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Switch to atomic operations
Message-ID: <qfxsq2dmj2ty5knlbjmdge2dm7vcace256qkjosg5hvgfplybi@3wwsn5hcnksv>
References: <20250104181908.15141-1-jesseevg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104181908.15141-1-jesseevg@gmail.com>
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

On Sat, Jan 04, 2025 at 07:19:08PM +0100, Jesse Van Gavere wrote:
> Use the atomic version of enable/disable.
> 
> Doing so enables it to work in a chain where atomic operations are expected
> such as TIDSS

The patch LGTM, but the commit message needs some work. Why/how does
TIDSS require bridges to use atomic ops?

> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
