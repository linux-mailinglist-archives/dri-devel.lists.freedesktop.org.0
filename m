Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994788C96E0
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6444D10E086;
	Sun, 19 May 2024 21:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QqFof7ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D60E10E086
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:56:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51f1e8eaee5so3252248e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716155781; x=1716760581; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NqWcAcWOXnnzkVyIizFxo4VH2p0pA2wDAVa78vU4aiI=;
 b=QqFof7ulXBO2wgz0tvOakp5mGQEjAyINXqnjmTM0LMDdmvUBNCo/eizH7/7TyYpMXP
 T3Khk5rt1YsJQuy/FAT002tnSgiM+p2VzMNgTqbKuMonjiKMmxTJkTu7FXDTuJG93KI/
 8Am7ZGBlNMo7SutJhCBr0eZ0dUfTKd/M7FsmVY+wG4aOuhDUt6DH2OruNAmvD9FUJR/Q
 LQuVQRwQiPsaLmkV8kw8MQ5fZqlscbRrt2TWCG9luOBM3N6hC8apxTwLVOlZkbKMnv1J
 7/r8KWg79slLEV+1Evi0+BPK1HD2gGPpbwvGV3iiP8ZNdGCO6yWsWAcjOWrKgjU0G3ls
 RLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716155781; x=1716760581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqWcAcWOXnnzkVyIizFxo4VH2p0pA2wDAVa78vU4aiI=;
 b=dUY6H1xJGlC4tiUiFF88HVi/RUwDU+xXHEevvi72mG1vB327KI35iYdwD464/r2WXx
 sScMXZ4+u83ftaI3cZ1GlwHLk6rc9sGVpgipgWcL5dpN0cXnxkFSzusbCT1KZfLZQuKX
 k77uj+wVsYhggQ9D9KN5leb83Wo/A9seBHXrCUGPjcXqjB95Ch6sqZ5USGrzEtURHK6b
 ATQhhw8O6zLGmvVgEZChAt9i5jS+KtpOqHZAqMAy2+T1LhRcEVJ0MGqoks5YHH0hWiaJ
 tcbbJ1Cnd+HKAFtL5DLn1KCw7Gfvrq3iWQ6yj+hxgK5POxrH/lABA9R9770+/IAZ0s0T
 nnkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqpuuBK3azxFM12tMtWpHtM/gfpUlecZ2MI2juGnIwwKEI9gdG9rcv9YLaZ68ndujC9UNyTqYPgDNKKLXKXYeCj9NXHBYZjasE4qp7T8h7
X-Gm-Message-State: AOJu0YwxrBISzrqd/9qlkQEo4uetUXXNl9Eb+wo9EJWcalZ4Pi24M1d1
 pxnxJO+sOJnrFCS2vix7eQixZw3dCLQMglvRgSvdt3fvVobRRe5JIKDW4C4jyKw=
X-Google-Smtp-Source: AGHT+IFyqYb0ivv8L/qvl8riI9jb8dyInABkPmW1q3wSeNDsqrDwAECqKGQ4ce2GI6aWsqdmB//2qw==
X-Received: by 2002:ac2:5979:0:b0:520:ed4e:2206 with SMTP id
 2adb3069b0e04-52407ac117dmr1174073e87.17.1716155781476; 
 Sun, 19 May 2024 14:56:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d379fsm4057359e87.137.2024.05.19.14.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:56:21 -0700 (PDT)
Date: Mon, 20 May 2024 00:56:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/bridge: tc358767: Use dev_err_probe
Message-ID: <bbcbmef42xws3yf26alfu6dffky4iqix26crqjviz27xqp7cby@xgqipaof3gya>
References: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
 <20240516062455.106266-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516062455.106266-2-alexander.stein@ew.tq-group.com>
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

On Thu, May 16, 2024 at 08:24:53AM +0200, Alexander Stein wrote:
> The function calls preceding these returns can return -EPROBE_DEFER. So
> use dev_err_probe to add some information to
> /sys/kernel/debug/devices_deferred
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
