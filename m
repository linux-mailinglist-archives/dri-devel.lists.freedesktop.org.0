Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045C9133E1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 14:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A26D10E035;
	Sat, 22 Jun 2024 12:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vm51n1TA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BF510E035
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 12:19:55 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so14547971fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719058793; x=1719663593; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qGqWQ0KXhW8OxiX+0ZFBPoio2XcyXoe1CvzjPWFjYb0=;
 b=vm51n1TAV+Hfc0lbagB1usAO7DVheLZgRR7qqh5KGxn6JoX2tGhDKM0i1aUr/wO8Fq
 SgfEPrruXLmUcigMLy7fI0ZoMKoT6e13kL1XZ/tyAzeldz8jImTLb0XnzwiDhVSA93Z2
 u8MLCqw0NHHccC1oPxH2fK16seK5GptVYVlI80SJWwJPIxr8UzW0B74YnKstL5EdrEC0
 84gTqJcWV1RQhx9UVt+E4E7cg0C+Vj6dQ96y3wmnbZUlDgaXn3uGRrIqDTTlzFU8mkDx
 CXnsGshp0S+gi4hOhDUEPiLWdfZ4ApOetq7ZfYqWX+GcV6Z8JTUwhlG9SU/I82GNATx+
 EurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719058793; x=1719663593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGqWQ0KXhW8OxiX+0ZFBPoio2XcyXoe1CvzjPWFjYb0=;
 b=Ym2sNLEKcw+jMMduJUWRZmLMpoRKV7i45jU806qQtYINwQYuGEic0p8hJ94sv4pExw
 dIkADt88plruWdqw4sTA6ADnPhcuhupwqQ50Q7CmeLwfutDFvrPX6lL+pWvsbiZYEj3W
 XJluvzBY85YkoGBkTrEjHYshB/vgUSV1/BWrhkwi5B5oY+c9Sk5ee6aNl7I9UL4CtTCD
 C1g4BEKbgfNSjz95XltOwBMnYfirXPRGTiHAdmtxXxP/7Vg/PNMMeYGmMjTWMAdijLim
 paKHWMoVIG3fq4YQw/K7/g84XOHDdlLS9iJb1yKHDSm582w4U0PXaQiCSD3a9Pe+AVLy
 SUXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEPti9tNivuH5qpCJA6EJk6YE5EQUsgtjTJ+CcBsJTMN+YpE7SQHvfba5KlDwbEfny3bkSLXfB+60TLo1vPTkxloM0+pmdoJIEK8ut52Xh
X-Gm-Message-State: AOJu0YxjTIecqkAts8aWTdgKS6wyRFEfDLSPeN4tBJloFwRsUzSvTRzH
 tilFUWylhurHfumd8NUSiT+vt3EEK3jb2wm07z6kKGxFH5DzSh7z9TV0AQ8pDFM=
X-Google-Smtp-Source: AGHT+IHD7TVzn6lmksj2n2QOTdKYM7mv+05xXtSaYsPY+qudR+FFoQvVW+IFqzCgNUZ52V+LWCZBaQ==
X-Received: by 2002:a2e:884e:0:b0:2ec:59d8:a7e9 with SMTP id
 38308e7fff4ca-2ec59d8aa7emr1428491fa.52.1719058793396; 
 Sat, 22 Jun 2024 05:19:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d75823asm4510371fa.90.2024.06.22.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 05:19:52 -0700 (PDT)
Date: Sat, 22 Jun 2024 15:19:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/bridge: tc358767: Add format negotiation
 hooks for DPI/DSI to (e)DP
Message-ID: <wqg5nxg6muyoljbmsemipzv74ziwmt55qtzmcbexpqxsqzqpno@o2uhl2jrljft>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <20231108-tc358767-v2-1-25c5f70a2159@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108-tc358767-v2-1-25c5f70a2159@ideasonboard.com>
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

On Wed, Nov 08, 2023 at 01:27:22PM GMT, Tomi Valkeinen wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> With new connector model, tc358767 will not create the connector, when
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
> rely on format negotiation to setup the encoder format.
> 
> Add the missing bus format negotiation hooks in the
> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
> 
> Output format, for DPI/DSI to DP, is selected to
> MEDIA_BUS_FMT_RGB888_1X24 as default, keeping in mind what the older
> model used to support.
> 
> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
> Closes: https://lore.kernel.org/all/24282420-b4dd-45b3-bb1c-fc37fe4a8205@siemens.com/
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
