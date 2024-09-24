Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56795983D65
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 08:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE7E10E4E0;
	Tue, 24 Sep 2024 06:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JyiZiLHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9778310E4E0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 06:53:45 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f75f116d11so50137681fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727160824; x=1727765624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oZF/NHnf/x9FbKZHy3TRIN4j+o2GmvD5PjB1e51dEMc=;
 b=JyiZiLHGxH+uwJVtWjZkLizOR35Litzn6tQvYQ4ywwirwaqN6ArMcdHz/aQTq3O2yk
 /mZHZY+CWBkI4SMjBfMi5e6tmRA/nna4XqAd+mVPCBwaoLZc+g+1TnGrvfTYiYm5fx/M
 FalVU34ntwFfpusqPbdngFY261mEr+e08E+b8w7a2BVGTHfSzPM3y+LwNUytzt1Dcw/i
 fR3CyBazDnuSmKYkCa8TTehD8MQqQCQSHl5gNBOfPyyYgKe8kTwaysEoH/d3/3U/pLHS
 OdnBUKZQW3SnNcAKqrr7usG9va8Yxowt8un/qG+5gHpteQDGWNGWwzZMl6eVIUEs98YO
 QBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727160824; x=1727765624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZF/NHnf/x9FbKZHy3TRIN4j+o2GmvD5PjB1e51dEMc=;
 b=dK4bmedv6TPFTa4g54qm2L0M/qpMe4cp+e6JwVbmMNy5EMYO9w3nAKUNX88g2jDBc9
 vZJXu4nAwTbphUpW3LyrU6feRv9QQCGCSEx4gy8/+vTwazGc9YDw5wOx9eUdbxusFupQ
 gjst1pNprW0WYZTQpm6N/d8PyKWhYLhCW5DIFbLJjhsKJVfvgX1bfNX7NPrmniMbsGAW
 +12akF5PRBti8ExADLul4yIAuXHV/1Gtv9F0wpgH8zMJPTcP9OEGXr8Y0XOzENXwfARi
 JWslAdBi8Y8oU+Ki2MyvYfsQT2ymeDkDPvzmQkKgvAvMjdDZJtEkWItB6FRGtXH2lh8C
 4SBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhZwReWaZc9INYBFBv5bH+RUHnNVWSiqFcCgxiRO9PPdvRX9NmEaLtki3Kn7KvJSafKIiBoYBzeDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJa36uzUQXaO1/XdytaQ/zDU28/c0S/fKIfIvTnD3hgCC3z2ty
 LryuFvBIIyR+PAPob3OXABiLp5QYsnn70aBIl7J0fKH6SSArVV6t1VkfneAQ7oo=
X-Google-Smtp-Source: AGHT+IHxYXqItuZuuL7B92AozBUG30T1l/LeTzUmqvphuqmbNaplH9jS24oIFO33lmSgW0U88tUVLQ==
X-Received: by 2002:a05:651c:198d:b0:2f4:f22c:53d5 with SMTP id
 38308e7fff4ca-2f7cb2e6944mr82126561fa.8.1727160823707; 
 Mon, 23 Sep 2024 23:53:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d28b5a5asm1225001fa.134.2024.09.23.23.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 23:53:42 -0700 (PDT)
Date: Tue, 24 Sep 2024 09:53:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] drm/bridge: anx7625: Drop EDID cache on bridge power
 off
Message-ID: <2tuetmn72w2dttbwe42k7wckamdqzswutlrvrvilg5j2jgj6ow@eaf2pbstfnju>
References: <20240924035231.1163670-1-treapking@chromium.org>
 <20240924035231.1163670-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924035231.1163670-2-treapking@chromium.org>
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

On Tue, Sep 24, 2024 at 11:51:46AM GMT, Pin-yen Lin wrote:
> The bridge might miss the display change events when it's powered off.
> This happens when a user changes the external monitor when the system
> is suspended and the embedded controller doesn't not wake AP up.
> 
> It's also observed that one DP-to-HDMI bridge doesn't work correctly
> when there is no EDID read after it is powered on.
> 
> Drop the cache to force an EDID read after system resume to fix this.
> 
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
