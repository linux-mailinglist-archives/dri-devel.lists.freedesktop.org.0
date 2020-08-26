Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A014253E55
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366E06EB46;
	Thu, 27 Aug 2020 06:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6936E6E373
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 12:45:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a5so1663344wrm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+kzzXEOc0SKCEMyYbz32N97qq/kdnqi11MwwZYW+8A=;
 b=Eaaico8YLL0rqVWjj9g6C+EZwEJug3H7gLaaOoyO7gbEBptgnoTLAETEQcpA+bkGtH
 gqoi2pkRVFWFtV4ooHuSiKrdysd7sbHPtq1fr55uxzmvkBOuRfpqp4FZ/H+03fvgJqji
 sWiUVZMSSl6E7DpP8g9SU0azG2zVOcp+ZgxhBi1yN9Jn1KjoxcpEJw5sQv5JISKeQJKI
 FqKeyHs4YyCt43Eg0VZ9URCKuzwqbLFN3BL+SEWjSC4jf4OYyu18HkjXQzq4fu0PdfVt
 VYL82PcVRCY1HuotUr/xeGfnEvbEwd67UVQbqFlf8gqGKzPYLptFdpWCq4TedfJJXzO4
 ouvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+kzzXEOc0SKCEMyYbz32N97qq/kdnqi11MwwZYW+8A=;
 b=V54G3BSfQQTo9S8OAUIiwdO7r0bgUGtXBNU/47rEeWXemsYk4P6PUHsPXDLgt6MVkd
 1llXZWYJBfIwhBM0oepwUIxhGWLS5x2JTIo/QjFa1j4SQUkDlaaMz1JyhrTivknyCWv/
 ajUK1Ry8iNI85IieKd7h7lEwTXjO5qc8oy7C0Iu7cHf+Tq3GHWyG6QvF82Re1ct2WU+J
 4mqvLG1ZhBBWiHSQyaeiUwmOToI9mkfjkLDMZydYkqVA1jtzBypwdu7o6utvny+95/DS
 tj+ajSDAqYr+L4u9atOvyyDe8tCId8RODMkbqHB0XRb4+86Nt3SxBj18OXTj/lIJ3AZg
 Aaeg==
X-Gm-Message-State: AOAM531eakluzbo+/HyuJjxSDX5u7QdiTig/XtOdIGGu43Jg7T4/e9g7
 bx8V1OjH43fclPuwaZIrtXM=
X-Google-Smtp-Source: ABdhPJzz3psrSXNKKZ8i9/G6RaSCelZjPxvn52X1JMOmitt6XeOC5Mo9TfCruKPO2Y/opEds3GKrMg==
X-Received: by 2002:adf:9591:: with SMTP id p17mr15996721wrp.237.1598445916171; 
 Wed, 26 Aug 2020 05:45:16 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id a11sm6139369wrq.0.2020.08.26.05.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 05:45:15 -0700 (PDT)
Date: Wed, 26 Aug 2020 17:45:10 +0500
From: Bilal Wasim <bwasim.lkml@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 3/5] drm/bridge: ps8640: Return an error for
 incorrect attach flags
Message-ID: <20200826174510.0207854f@a-VirtualBox>
In-Reply-To: <20200826081526.674866-4-enric.balletbo@collabora.com>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
 <20200826081526.674866-4-enric.balletbo@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:37 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Aug 2020 10:15:24 +0200
Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:

> Bridge drivers that implement the new model only shall return an error
> from their attach() handler when the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag is not set. So make sure we return an error because only the new
> drm_bridge model is supported.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c
> b/drivers/gpu/drm/bridge/parade-ps8640.c index
> 13755d278db6..ce3e8b2da8c9 100644 ---
> a/drivers/gpu/drm/bridge/parade-ps8640.c +++
> b/drivers/gpu/drm/bridge/parade-ps8640.c @@ -200,6 +200,10 @@ static
> int ps8640_bridge_attach(struct drm_bridge *bridge, .channel = 0,
>  						   .node = NULL,
>  						 };
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		return -EINVAL;
> +
>  	/* port@0 is ps8640 dsi input port */
>  	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!in_ep)

Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>

-Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
