Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486C97D77F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90910E102;
	Fri, 20 Sep 2024 15:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sJag0t+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129CC10E102
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:33:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-536562739baso2168164e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726846420; x=1727451220; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jv9o8TGrcov4wFQsLxGwrTX430N+dK3XgvjP2/6zbGA=;
 b=sJag0t+kU+4ww3yame/V3nml8FAc62ko4YHI8Yjs5k9yP+xZSIuEKUDBZ6snbiiMCP
 ZFZtQbYVr4S+J8SOQ6FfYuSmK+RkzvrSH3c/ZOnbUoCuKJxOBcXJaI+sMGao4akCq+kO
 TybnXO3cz+U5HE/1RM47hU74Qf0c4qJADOhZjjb2jLqPSwNfHUKivh86tEE4rtu6N/MZ
 mAGBiAxfeVogWCkPg2214qk+1S+nxKuVjd1cnX1i/tUrb+d/YAThfYUhZDwkn5MFEWa9
 95uXKMswwMtZeXB5Ny1ArYl4yPglYhFl4JL2XEAqLRBIGRmv/3GRhZy9SIUtdX2GQWiE
 02EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726846420; x=1727451220;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jv9o8TGrcov4wFQsLxGwrTX430N+dK3XgvjP2/6zbGA=;
 b=Q5cvvykWWWnU8rwzfQuwd+4opGJogdQkyo0Wbe8Frtf2c0RlmmutPVl3QuZvRGAUXE
 EitAP+VrzTta9HF5tZp7wiVhBA/2D/yQjoF++9e16jc9Gt3qffJ2oGo++UBnrzZU4+Xj
 CN48ZHm+VHKDT3GyDFTitq507CVIRO/0QlMi8MeEpJzqeKHPw4aiHlUJWqZkV1rlJT8k
 G7Ga814TWq9mSBg5DCsagGXt5AAoKN4ZeCnbPvAoXuaDvB4eqWjrXNg7bL8cd+4j+UKU
 ohLTRbr6XehWPGATs1SX4KPM4ObjwnE+f/qtYNGu6Afq/rRX33h33Ypj0WoOJcQjjPn9
 rOMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcQTJxbd6IG5JECUnxoA34KN6FhuRfdXp3QF0QUzSS4Wi6ASnVPzBWl62n4YVbUCXtnFchWe4Ygy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGK9cJU+i0aiX0GytIcADy0qzmykoL+xEUFY1wnXpBB3HXLN+Q
 J9y8vgrtzhI3U1GfUUiUd4vjcIaYCGOd/6kkXLtPN68M0/Z0wDlqHl3ihxrwtm8=
X-Google-Smtp-Source: AGHT+IGw23lF+hbTYFLwOdhKlOYBaupGaR45yI6nU+klXthzjCAMI9F9zKfWYuR9PZ4gB9iVyxMFRA==
X-Received: by 2002:a05:6512:138b:b0:52f:c833:861a with SMTP id
 2adb3069b0e04-536ac3400b5mr2077421e87.51.1726846420009; 
 Fri, 20 Sep 2024 08:33:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a45aesm2242756e87.183.2024.09.20.08.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 08:33:39 -0700 (PDT)
Date: Fri, 20 Sep 2024 18:33:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>
Subject: Re: [PATCH v2 1/2] drm/bridge: it6505: HDCP CTS fail on repeater
Message-ID: <ho4ixf5fi5nuuq744ojjadzsku23y2sksnrkhrzlnvgvd3qfdo@cb4aocrk53ug>
References: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
 <20240920082451.9240-6-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920082451.9240-6-Hermes.Wu@ite.com.tw>
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

On Fri, Sep 20, 2024 at 04:24:50PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Fix HDCP CTS items on UNIGRAF DPR-100
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>

All my comments from v1 (except for the Changes-Id trailers) seem to
apply as well.

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 152 ++++++++++++++++++----------
>  1 file changed, 101 insertions(+), 51 deletions(-)
-- 
With best wishes
Dmitry
