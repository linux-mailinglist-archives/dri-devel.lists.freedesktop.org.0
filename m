Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF55499FF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C976610F3F0;
	Mon, 13 Jun 2022 17:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ACC10F3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:31:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o16so8025981wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b6LI4jSTppnwbn/7MHPjsmN7q6vhTZpE2X7+c7LKVK0=;
 b=TjSewGIwP0DCjp2l8QRZYjpF076U4CIy6nnYCGcm+6wAHhgocXZcndKQ01Sjwf9Z9x
 aXsRs94nQKH5njHHI5X7xUl9u0+ErvEIIcs8zmW47MyZ+dMJZxJ85VMQeFMaNCAD7vy3
 2ELYlJ9/lA4/XTMg+JlYX2JAu6BTqdSCb+uilS5l4cRVuQ8ixXvoQHC9Xp9/sVcMQxhZ
 35ROofq60l6F0c8S4Ebs/EkepuPtAh3ZzaZcxkoYYHjC7CFnab4ZQp0ZI7ywJZT3HeAZ
 YsajnPx8xEl6dED0MwsybEwHga8p1kd/sdmv+pyhisG6Wj9drHS0aIFJgwWat+9CyjoY
 NCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b6LI4jSTppnwbn/7MHPjsmN7q6vhTZpE2X7+c7LKVK0=;
 b=ebmzDbYuX4WWCs1zs942Je6jhHSf4gVcrlFDRCZjXWxLo3Huu3v+G7hKUwAqCEEVuC
 x2EpPRXMhBe5qdeRJDTg8eOSGF9EbVga+IK0DuQCSyfQhnRLo7PwMjHajFmkBsqFzFHi
 zi+dVZoIXAT2LVmBldSGxfMD9rQc54GU1CGSCa8w7gec3vCJZXYGHF1Q6RbLL4F0BC0y
 875eCknR2OUSfEZihniFrs+mXXt8YKzON8XFNyIyXkkN0YiG73VyGVHEtL0rnr7qf8oS
 4Yq9EikAYkeUeL1ux5KAprB7QpZ/GnmT0JO3glAuHTe3EG+sLJNlcDEfFsO9PCc9NLtI
 9CGQ==
X-Gm-Message-State: AJIora+Nlte2DuvKFH+zu1OvB/33awIBvfgy5logRa+QfG7r1KusCVU6
 ogSxnhzzSwCNYScV33wZQm4=
X-Google-Smtp-Source: AGRyM1vtq4iKf+PhOy3uDZ8M6ggtx+BY/XhVl3NLTzqQGYY0BcpgVGbFm3Ker6Ngqo0WovrLJDRabw==
X-Received: by 2002:a5d:46cc:0:b0:214:2d66:2d51 with SMTP id
 g12-20020a5d46cc000000b002142d662d51mr886667wrs.349.1655141462582; 
 Mon, 13 Jun 2022 10:31:02 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c3b8400b0039c5224bfcbsm14479675wms.46.2022.06.13.10.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:31:02 -0700 (PDT)
Date: Mon, 13 Jun 2022 19:30:58 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Zero error variable when panel
 bridge not present
Message-ID: <20220613173058.GA132991@elementary>
References: <20220613163705.1531721-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613163705.1531721-1-nfraprado@collabora.com>
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 12:37:05PM -0400, Nícolas F. R. A. Prado wrote:
> While parsing the DT, the anx7625 driver checks for the presence of a
> panel bridge on endpoint 1. If it is missing, pdata->panel_bridge stores
> the error pointer and the function returns successfully without first
> cleaning that variable. This is an issue since other functions later
> check for the presence of a panel bridge by testing the trueness of that
> variable.
> 
> In order to ensure proper behavior, zero out pdata->panel_bridge before
> returning when no panel bridge is found.
> 
> Fixes: 9e82ea0fb1df ("drm/bridge: anx7625: switch to devm_drm_of_get_bridge")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 53a5da6c49dd..3aed4de16690 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1657,8 +1657,10 @@ static int anx7625_parse_dt(struct device *dev,
>  
>  	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
>  	if (IS_ERR(pdata->panel_bridge)) {
> -		if (PTR_ERR(pdata->panel_bridge) == -ENODEV)
> +		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
> +			pdata->panel_bridge = NULL;
>  			return 0;
> +		}
>  
>  		return PTR_ERR(pdata->panel_bridge);
>  	}
> -- 
> 2.36.1
> 

Thanks for spotting this error Nícolas. As you mentioned, prior to
9e82ea0fb1df the "pdata->panel_bridge" pointer was not modified
(i.e. left to NULL) on the ENODEV error branch.

I missed it during the refactor, sorry about that.
