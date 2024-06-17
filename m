Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D228890A825
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5FD10E126;
	Mon, 17 Jun 2024 08:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yv8/Bq0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0817410E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:09:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso4670694e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718611760; x=1719216560; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X2zL/OVwfsmsGKut76UeqNrv4709+NhZVNP+gY0GxxQ=;
 b=Yv8/Bq0/Vc+1s+WLpVrbBvc1RIWZ5RIxLpDKQ49tbZGGJE20dU6A3+XTF14oKY1w1J
 0Hb5TAvllUsamXTy6gEqqFPUJXDNFqkSWeaxwXWRbWdokdYA3SKopcLwxcCqjvFfqx65
 no4I0zYYRVsdzNNEBr4w7WvcrAnH7eKVlxXynXBkgOFe0dkw8KC7Ni90HSV/XdYbtDkE
 wD9j34YeoKXdTdx2TItEfyXCErV55XLm/dqAnRt4WgMFSHV5Ir54cARg1WJdx8yje/a8
 cJSAZaqdWiFUzw1N4iFsMvWK2VmBKsSF8pxiSEHy2Tu1n0cr6ir1kQPk9MA/n51HHW7s
 6vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718611760; x=1719216560;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2zL/OVwfsmsGKut76UeqNrv4709+NhZVNP+gY0GxxQ=;
 b=Ti2t/RKxz7ccKOkBPvYXW4AQHszVWKm3PbjqIZodJeGDYANleI4fJWtcOdZT+X+r+O
 SjC5nrj5FXYvK5WeJg2EbSu3ld0cVCj79KZ4bvmBY6JsGdVVpwZsKf20+ynUQxSnDgoW
 gP3yLfldEociMhoq7/i7gOp+qfh7Px7kXTwexCO4G1TNXRixtQEPHyznzoTckp3SW01i
 UC9ryXGnu54tyQbdMiDwShFQ9G4toVJG2pAtHReOWlMeg3qFzXrnKLP62/UcSyGOBxKM
 kmRDGXWIqpP4YnasnIBhrmNcdKhmxLJBE/ia4z+i42DS+gvq4l1wjH/yNfx4mXcmXIal
 +Trg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrNDzSgkEtKeYcCM2/SG+S2NlGkyOXH/IeqV3g3mk2qm1P5dXRH7q/CuA/kU00yitZhgYk58VoImIds3rSm0+cr6Wjlkw6b3mU9KU+/TEO
X-Gm-Message-State: AOJu0YyQ9aqj0GKHGONMDRQrQceIMnhlBZYsQFQgLArUi06XUt6Y/hTu
 FfFCo4sRfYrw9a365RgbdvOdukss5VenzI/AkyWNsJIMNHJDcw4r0Ryn31v+tJU=
X-Google-Smtp-Source: AGHT+IGIN1VZ1dypo5WcnYr1mOVKMSlIuBzxulj3P3h7dJapVZkX5DtowVEXUEm0YvuSq5466IStVA==
X-Received: by 2002:a05:6512:3481:b0:52c:8ddd:7bde with SMTP id
 2adb3069b0e04-52ca6e9f522mr5211431e87.69.1718611759946; 
 Mon, 17 Jun 2024 01:09:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1165097e87.163.2024.06.17.01.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 01:09:19 -0700 (PDT)
Date: Mon, 17 Jun 2024 11:09:17 +0300
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
Message-ID: <x3modgardta7sj4hxw6akufgpavhvanxyily4mvejmyvsuvesx@fjmlc6oerspi>
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

If this is a fix, where is the Fixes tag?

-- 
With best wishes
Dmitry
