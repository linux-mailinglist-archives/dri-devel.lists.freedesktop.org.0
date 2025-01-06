Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2EA02EDB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 18:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA47710E211;
	Mon,  6 Jan 2025 17:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bj2uJhwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413BD10E211
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 17:24:19 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso4349559276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 09:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736184198; x=1736788998; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lxn/p6hgQlMaLr5WC3DLl4tmFvhz3XGX10EhS1k1aJM=;
 b=bj2uJhwA6yq8hIH0Ez+I9nWI+SwH5+9fgrq/kyi5yOKbuQmHD73s/2iGQZze7l2SJk
 suSaMxSk8Y83coGiOQERniZBBO/f5OlLbgl5V03Ka7xXziG8yqCLdOQlAjdXtg5ciJfb
 pL6FaPB61HSu2cGQclAYbn4VKHKgFK7zUGC+7vg1WNiyetnjXUGvMA2gA8EuGVtRXwR2
 rGvnZ9iAjeu8f2P4suWd9KpVCJyFpVEmch73NQImTA/BjNxxNxBtQOV/CuIS7wRN14zr
 6KTY93NCAMPPAyMqwm/wFyA+V2igmsTbqTKVwYXdmXO3wCZ5ek3rx59u0tOggCJFGKiy
 6zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736184198; x=1736788998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lxn/p6hgQlMaLr5WC3DLl4tmFvhz3XGX10EhS1k1aJM=;
 b=cicdf+bYvjfkk69GzPf5cRVxBOM9HCAZWMXRW+JVMYiXM6oLZMN2iOK6SERtS62Rz3
 O0fqxxPtYOPHUn//jSCtNvJojKX1AFuEYjvPtBi6CZ0RuDfeeXuIv3/PTM6djm2bq6q2
 SkUgD/zWqFxrSgGYkkw6ddO2Us6dpg7M/BE6wRQb5NHURARN6oILKdqP6CoYv4YDuyFW
 wxGE+aGNIYs7TesW88BToKYUx0k2DZLhKB+AKY+GFyyhvA6w/JOZjka/9xAQBzMQel7Z
 Xy5VcElQCPB1oFI3gKJSroYASnFKjqlOjTd0rCdaibhEO1v/BR3lA4mjSNWsx2MR8GN3
 EFHg==
X-Gm-Message-State: AOJu0YxLPsPrds1zCTKwVGZUo8SRPj2cRkfvLvOEgqoEbws2Q+VWoC1y
 kFDT1qurktQBI/XeReJOLuCX8jGuukAsRIG0qN/4bRTfl/wkgRbhm2X7sDFfPEQs9dSHtBj5T0D
 IGi0qzhu9y0vInOMjLM0OVKTxUkmLJY3McP41/Q==
X-Gm-Gg: ASbGncvAqzVUEpBWrQDGN5+8pcoPyj10tlK8dLZYEOQk7GUO/vGKXJVFd1PtuWt9at5
 MwrumF4vwrhRRnjslKGXeowimVBz/YkVUHTJ+Qr1vxx9nko4OxnnJVa6ZMMsOh+2/ZvJlDA==
X-Google-Smtp-Source: AGHT+IFVCl2u3AlD3usL9TykdcQhJFcG3Izq8bQXpAJ7PnbkNL9DpDlu47Yn+IaGpSD8681DyXHHvF4dJLuptIatl3A=
X-Received: by 2002:a05:690c:3610:b0:6ef:146a:aac0 with SMTP id
 00721157ae682-6f3f80d6234mr344377847b3.4.1736184198154; Mon, 06 Jan 2025
 09:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20250106121054.96739-1-jesseevg@gmail.com>
In-Reply-To: <20250106121054.96739-1-jesseevg@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Jan 2025 19:23:09 +0200
Message-ID: <CAA8EJpqO9Ci6mNSA4WRBuiT7tp4D3OLoQfjFnDV_kfo5i-TPuw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: adv7511: Switch to atomic operations
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
 Simona Vetter <simona@ffwll.ch>, 
 Adam Ford <aford173@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 6 Jan 2025 at 14:11, Jesse Van Gavere <jesseevg@gmail.com> wrote:
>
> Use the atomic version of enable/disable.
>
> To support bridges where bus format negotiation is needed such as TIDSS we
> need to implement atomic_get_input_bus_fmts, prepare the driver for this by
> switching the existing operations to it's atomic variants.
>
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
> Changes in v2:
> - Reword commit message to make clear this commit is to prepare for adding
>   input bus formats to make the driver work with systems like TIDSS which
>   expect this capability as suggested by Dmitry
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
