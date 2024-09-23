Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535797E99F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E891110E1A1;
	Mon, 23 Sep 2024 10:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jV0JVblb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7752D10E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:14:49 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso4869976e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727086488; x=1727691288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mae6Avg1FIHgSG+BcO4YtIKpdaFqrjXa2Kuld6x2i8c=;
 b=jV0JVblbCKRRDNM+gyIAThcgxBiXf5Rkr4GIKAoHrQ6jU2avxcyQxWCExOTuDE1V6A
 PdpMXojFO8v3mf4lBohuyYzfxEBywgKO42SSF03rezy6QXTt0wg2Dz6X+7DIHAnb1uDN
 YHKQ4jo3FJyrFc8w8DWHKbZPv5dMlRRlI+2qT9PEfqNla0YU9eeCoUuMXLTLXkp5EuzP
 Eh37hrVi0sbdF/DteBCNlw2TfEGBvaEhOR6PpdkxIIY2bVfB/zWXqx9rlC+lFtePJpyV
 bQmrw3QD+x/h8vA52p4fubE9RwoGweeL7zJLAtrB19EIHmfcz0RHKLaFqrhL/icMuCaH
 Tzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727086488; x=1727691288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mae6Avg1FIHgSG+BcO4YtIKpdaFqrjXa2Kuld6x2i8c=;
 b=Vw68Zfi636RWNtx0FxJI5dnb0MNYe63Qx5tmWNJAG35idb/kthvDKdMzGN63yiM2RJ
 OWTQ3kgI6Syl7FFgTcQ5kXTnhR7vpS6ewBdtW33KvAXSDJjRv8WqPEA5c9uu1mL/eia8
 AaThiFK8Nv8OALcmEMoExCKJcBwkQgfg3ETSeoKegouNpmtPgBAxTovpGxFApJ3tMFaH
 R4WLc5tqxRXSVOYSaYWUuxpw54PAo1JFZKkMMTMSiOEzsw398IoSD1JJikI0p+2s6vH9
 iRMlCIeSJnPuJIKhTPedpnsBsT7Iicnaun/TUd/7tmS3KKaNQjBcXZxCfSm21VDlzg/S
 Xavg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+kMp6lNkIY2F7MTh9hfhQ1Hm0NaeKN6YllNwNWgpkEiRf3bYugOl7PRog7wmOn2RtiqHg7Bsdbuo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1HoARJXiMuB06bRw32eSjw6EpeEMrct+wu7/u7srIjlFD5UM0
 zccWKhjMnEUI+akyb/qVQCHFCyAE9/e8ka5lorqC0lKv/nBgtrIwMkzNNeKx8Eg=
X-Google-Smtp-Source: AGHT+IEJ4FRJFjtM6OZF/5c9q24G7P4XNARCEcNGCmeR31EtaLklWtVoHKAsqQj4SgCYxhyH7gIfAg==
X-Received: by 2002:a05:6512:acb:b0:536:a4e9:9cf7 with SMTP id
 2adb3069b0e04-536ac3400e3mr5563017e87.56.1727086487564; 
 Mon, 23 Sep 2024 03:14:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368895db54sm3140244e87.112.2024.09.23.03.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 03:14:46 -0700 (PDT)
Date: Mon, 23 Sep 2024 13:14:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater items
Message-ID: <4viir5prnuvpp76npblwmdrwlttm5daumvdnocipdsn6geyxvf@2yfcytjb3ono>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
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

On Mon, Sep 23, 2024 at 05:48:28PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Changes in v3:
>  -add detials about fail item and changes.
> 
> 
> Fix HDCP CTS fail items on UNIGRAF DRP-100
> 
> DUT must Support 127 devices.
> DUT must check BSTATUS when recive CP_IRQ.
> DUT must enable encription when R0' is ready.
> DUT must retry V' check 3 times.
> it6505 must read DRP-100 KSV FIFO by FIFO mode.
> it6505 should restart HDCP within 5s if KSV not ready.

Still not readable.

English text, please. Split the patch to fix one issue at a time.
Describe the _reason_ for the change. Annotate fixes with Fixes tags.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 112 ++++++++++++++++++----------
>  1 file changed, 74 insertions(+), 38 deletions(-)

-- 
With best wishes
Dmitry
