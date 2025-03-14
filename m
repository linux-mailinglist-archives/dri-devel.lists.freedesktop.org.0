Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B456A60784
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 03:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F0F10E268;
	Fri, 14 Mar 2025 02:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GjhU5HYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4D110E268
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 02:34:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so502506266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741919652; x=1742524452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il06D9hr0Fc9RDaH12vgTcO4maMntEHFOsv/sipTbFw=;
 b=GjhU5HYWDs2jE7bipc+CWV3oQKibN/6AxtX+vWECM012fSnlW5J7Es7RL4XxCh6GuN
 ehB2w0KgF4dU0FqEyWiqwL8cVZ+3FlKgBQuvXV1zn086dEPD6EaCZDiyObG7QSJ4E7uF
 UE++nfr4wp938iWK2pGsCP7zDvtBeK0BxN7Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741919652; x=1742524452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=il06D9hr0Fc9RDaH12vgTcO4maMntEHFOsv/sipTbFw=;
 b=ABgd/n//Rti8Xt8Vtoz/G5ocIxKFLLwVYZaPas9rxVDgNOajdoEakTo2tAIARRvQUd
 kISaTBnhI1/LZKcdxqwR2ggNdFul4PndWwUdtMHZm2JE1cJkfPdGn8ScD0Jkzcy0w0uC
 jgH6tJPzg3DVcFS2lS0tWfpSA6VPzONhRIv39pcvYpOIqxqOqhOexNVTluRPKVRfDCE8
 d6t0neOHuxBpzaQWUhK63Hd6fi91XESWvGAZpjuxtXepGrZ0fiR8+Tz/9NVx7n8er91R
 I79MDQ1mEIB93GSYeBhStLfw/c9RpKonOVtsPQHReUdtNx80LKIi0DcIkMCf5YVMAC0e
 Tm8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmGedSAWbXUXsX5M86QgfhaegElhIse2dRt90MsHuCWC9prqMMes9K1VHeO/uE/TGsCmdJGsrpPHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBTKMWka8xFW00Hvx0q99hoBqsJ+Ctpka52ecIJHwbNjbpU5lK
 a7Oo09qzwnriA+jIWQF9uYVNSN0IxrDbKzqIXetkYWdGGpv2+Y4tPepIatEgVoHpR0GIRZKKyX2
 qvF+Y
X-Gm-Gg: ASbGncvbv++tlo9ufTbojPzwAbj7COfbS2g72ra29I3KVqrNCS5Fig8Db3lpjntx4o1
 qnhoqta8Y4/vOWjTHAIPBGkOyc3PFuikoGjT2nW3SurMczq1QWFJe5pPZRjqjWZQu3F11zE5kP3
 NE7+WZZYnJQdh+zWPS1Q19aa+Phx6+XkH7erF1GPEVj9+f3IhmQszCs1+Rl+E3PpGKEXA6wJmzf
 2Reeej+qC10S7VfDygiaiLWMv566PrdJe2ZmRkOQTo9fYikmga4Tkb/KnrqCKe1DqVOj5EAiCA+
 pVhtRBP93MX9DBDZoELjjrMVp9aoRAfG/K1tjXJ5pRqNOVvM5P0Io2GRAZ+qeYHtQ8fRTwEeYdo
 /6C3b2xXe
X-Google-Smtp-Source: AGHT+IHXAnyqyM6Dr5hxyjjm39drHRHY8ceT3BwfCmVOcid7RHtDIdq4Ji41weIHOuJmgks9ZbmSSw==
X-Received: by 2002:a17:907:c00b:b0:abf:48df:bf07 with SMTP id
 a640c23a62f3a-ac31233df82mr519700366b.15.1741919652005; 
 Thu, 13 Mar 2025 19:34:12 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a4856csm155147766b.156.2025.03.13.19.34.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 19:34:11 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ab771575040so514573666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUsiGkcEIecZGaInThofHVAhMiwL9szDtvZJ93XlmLn75SC//+KEBRD3qhl0OQO2YvHTEmcjh2SQck=@lists.freedesktop.org
X-Received: by 2002:a05:6512:238b:b0:549:88b8:ccad with SMTP id
 2adb3069b0e04-549c3f97e1amr221177e87.20.1741919289506; Thu, 13 Mar 2025
 19:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-9-damon.ding@rock-chips.com>
In-Reply-To: <20250310104114.2608063-9-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:27:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYt894pPyvRxHAe1LjCXEorzB3xBkAKZzE6Fntfac5GQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrcEIf4cAvd2mSC-J3hgcRSHWlS6TAPo8G1EtX7yAuKQEhPcQq-mGynGdM
Message-ID: <CAD=FV=XYt894pPyvRxHAe1LjCXEorzB3xBkAKZzE6Fntfac5GQ@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
 boris.brezillon@collabora.com, l.stach@pengutronix.de, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Mon, Mar 10, 2025 at 3:42=E2=80=AFAM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The functio=
n
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
>
> If failed to get the panel from the DP AUX bus, it will then try the othe=
r
> way to get panel information through the platform bus.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
>
> Changes in v6:
> - Keep drm_err() in rockchip_dp_poweron()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
>
> Changes in v7:
> - Include the drm_dp_aux_bus.h for devm_of_dp_aux_populate_bus()
> - Use dev_err_probe() for the return value check of
>   devm_of_dp_aux_populate_bus()
> - Select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
> - Restore the error check for drm_of_find_panel_or_bridge() which was
>   removed by mistake
>
> Changes in v8:
> - Add comments when drm_of_find_panel_or_bridge() returns -ENODEV
> - Remove some redundant return cases
> - Add comments when devm_of_dp_aux_populate_bus() returns -ENODEV
> ---
>  drivers/gpu/drm/rockchip/Kconfig              |  1 +
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 42 +++++++++++++++----
>  2 files changed, 34 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
