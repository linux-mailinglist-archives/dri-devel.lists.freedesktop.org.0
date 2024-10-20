Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5179A538A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 12:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2099110E051;
	Sun, 20 Oct 2024 10:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dg2mRkvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C005710E051
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 10:49:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f72c913aso4116398e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729421347; x=1730026147; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3XnRvKQZOPjLLwFgoT+R7Kj3/LS+KzGl7QLkoKVG53M=;
 b=Dg2mRkvCwUIfo4dtzNpCYnlJvY1cHk4lCn15nGh4L6c465KyHmB8F8BG56vmdOVUIW
 6bY9V1bFevvBCvo8F5Mcx0ZeZT7OmJm8V/Tm9Fzf544VQJGnzaBS+LYjoI1yOYrnNFLw
 qLvvtE2twpepsGa+ENAQjUxuJxQBtFN2EaxEB3lAB0Of7KxcgeDhxzRveRTPc1slj/T/
 qWbGvIQ2u/TSitcDNA1REA3VymVndBZ/Ci3RBGQbPm7YFXqCna/lKX/4S67WAfjPp+pG
 pHbHxw0yUTEbNu4IK0j/ZSxTNsKA7zURN35I8Aq8xNrLH9FNqtzu2Hy5g/rGdqmVxPKn
 dgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729421347; x=1730026147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XnRvKQZOPjLLwFgoT+R7Kj3/LS+KzGl7QLkoKVG53M=;
 b=qGPgyFfG3QgDZEoSDSMjmvdpuSbJDjxPWH30h2gPUEeyQEmDTicjhZeNbGOmI75Ej8
 1RyXGKmOC0BZSCKTAri/tJpgaiyBlje7d2QIIEbZHsGscFS6rIjcz2kOuE9hk2RQizbx
 /vjWDkG1wis1rFjB9oaUoPpzpjFWoZniey1fXjvkQKxeRyAi7Vz3jh2IwQJdNuwX0TFr
 9O9EwfoEKDyBmOG4ftNsbFsqLJ+ydCcK747YobV/y2nJEPdQscqBuw5xMpn0OCGVujFm
 mZKUAGMMP3ZB9aKFVozKHKFWXu9O16Iob7Q+JcaVdk9IPR11Qk8AHQT2KW9lRMCeY0Ka
 RfMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNIKDjgYDp8+/E/djKI4t86wfytv6dLtgoPPRAg/mSMOerKGnL31p/ug8dJq5BeBciF9t1avfS1ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhJ392Aj8PYIsatA34V62X4ki1z+ch8IY9Vke4m2YtQXRCIX0j
 wTjKp/dgdllCkUZxg373qO1+zxyK4+1QvKFkiWCfDwrVRd7M5wQuKzdh1yWKA2Y=
X-Google-Smtp-Source: AGHT+IG15odfy1uIpfdw/x7yt8H3vJ7DWHk8bseIVvdVWT8X/fdgPz4GJSpxX6HrPRoBkC049bAgNA==
X-Received: by 2002:a05:6512:ea2:b0:539:f995:5b00 with SMTP id
 2adb3069b0e04-53a1520b222mr4261814e87.7.1729421346743; 
 Sun, 20 Oct 2024 03:49:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223e587fsm190423e87.10.2024.10.20.03.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 03:49:05 -0700 (PDT)
Date: Sun, 20 Oct 2024 13:49:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/13] drm/bridge: cdns-dsi: Move to
 devm_drm_of_get_bridge()
Message-ID: <pw2zhwnyx6xn7lgondigds55ow6fkdbyh54sfuk3zqvsdsedtz@nnfsv7wenqrv>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019195411.266860-3-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019195411.266860-3-aradhya.bhatia@linux.dev>
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

On Sun, Oct 20, 2024 at 01:24:00AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Instead of manually finding the next bridge/panel, and maintaining the
> panel-bridge (in-case the next entity is a panel), switch to using the
> automatically managing devm_drm_of_get_bridge() API.
> 
> Drop the drm_panel support completely from the driver while at it.
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
