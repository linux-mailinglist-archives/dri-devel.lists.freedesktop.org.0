Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD88D113E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 03:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389010FD97;
	Tue, 28 May 2024 01:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z30P9md9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520BE10FD97
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 01:01:15 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e964acff1aso2556911fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 18:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716858073; x=1717462873; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
 b=Z30P9md9YU3eXTEYr0ji0vk7D97g3Uv9E0cdy86w25/RndYzkamc8BA2+RU4aUwvPk
 OZE0kVEYH8h+9EdlKvbERfB5SAG0KbFvuJZXaHwth0x2sdyU3bn7uojvpgecIOc7aLhV
 kgHL2K174+Ph1Tt6Tjz4CreKlDGJxCL7asBLHHNHiKBg14B2A+jFR82pIA/5iSBG8BFV
 eShs9Iw6eW1oQSd08Et4DlNpoVYKxpfIKaLEqAcJhEvmuZyCGQxRkGI3HDMAxe0vhYSM
 ZqRz5NEV8frQFe7Qq+HHrzpz+wV66qkS+KfqZmowU8JkV6YcVUbBRkb0h9DYDAULh13m
 hMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716858073; x=1717462873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
 b=JBZwKp+8TAHTMp3gNhHRUSg6cc0/err9j5x9POIySEJXC8TvcZlhB6m0X+T+wSDrl8
 14Y846ROrvmpi2yBU2EfzA8tiT4EeLCh3w2654nksSJImXgEPp1YKKOzUIvYQFbtBNz6
 ytrTCdKjRokqcl6KdH/BJbzo4IQRxGWFzifqNK604XC+72nqKj9QhfKSnmostdNH9a5O
 j8z4wwYMOMrbBD/nj0thblWFz3s2/0lCO3dYFNHEoS2suVrfx6fZlsAgpbH26p4rKysW
 bO9uimcQXeclNsa4DVeLLq0cPYFxGa2uO8PBip4byzcfJgim9Y2Ybqgj8MCEtlJ1yvd+
 fQxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjArNlg+1PKU+wFbl/WC/bxBVqS0XeMs3d2Kq+dhfuQskYnopD6yyrrNxhMvU/mz/sBouL1XZVcJ/iczGaUY0jGasTuzmMvKS10Kbl58N1
X-Gm-Message-State: AOJu0YzO/QQkF9HHYlHql7+Q3/YRXqdaEQx/lpa5zp65QuDRzMKChCFV
 72nw9hjtm0VinEKtPuSsitB5+L9C9YKSNrGa1KCguZqYw+IQTfijsN/8jV2QOig=
X-Google-Smtp-Source: AGHT+IHJTgREWZz1ERTKguUSrfa2uSdH6MWQOiMMxr9ZzLrg0bQtJ+SkJaUNtX+UKWWdzgu2vkTWKA==
X-Received: by 2002:a2e:9f16:0:b0:2e9:8197:eca5 with SMTP id
 38308e7fff4ca-2e98197ee2emr15410431fa.0.1716858073013; 
 Mon, 27 May 2024 18:01:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bf23fc4sm21208521fa.134.2024.05.27.18.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 18:01:12 -0700 (PDT)
Date: Tue, 28 May 2024 04:01:11 +0300
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
Subject: Re: [PATCH v15 10/29] drm/tests: Add HDMI TDMS character rate tests
Message-ID: <duizmokcym456fn7mpsfwrwsgazwy4q5nhtfoi5ih6ntmd75th@7yxduxya6j6k>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>
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

On Mon, May 27, 2024 at 03:57:59PM +0200, Maxime Ripard wrote:
> The previous patch added an helper to compute the TMDS character rate on
> an HDMI connector. Let's add a few tests to make sure it works as
> expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 300 +++++++++++++++++++++++++++++
>  1 file changed, 300 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
