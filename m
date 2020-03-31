Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8C198D5D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655A86E58E;
	Tue, 31 Mar 2020 07:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810696E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:48:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i19so1449428wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iqKTP0owR9GHIXqnQIDjvQ+mDIifciqjTTWzYGb8wN8=;
 b=NAVOde3lV4P/QamfdGMAAfpToAz7NqDeUde9mcTMzdiuDgZPr6UeUkxGUqekRwsjft
 wm1Rk+nQO/WDCaREyCFOTLFZcPQFXQoQZH40KiAIxKq2yBl8+3cV+RZ5259sjfx/+cFk
 axeD1ZKn3rl67yXINUhfP5bo2pohigcs0rbzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iqKTP0owR9GHIXqnQIDjvQ+mDIifciqjTTWzYGb8wN8=;
 b=JfsBSccXGldQDvs+wYH7fMZG4qGRnlvAlnLtGQCGv7CKFWKOK8kx/jKtaGcnTXYMBR
 C513hcn+jZX6nw1PzJDWpPsM5OULZVfBRQLMbct6w/caYOJejz4NPGK/PBtsLcJdmG25
 WObK65WcoYInUufGnQx9Zd/0wKsBAjQ4PYf7MNE4ZZ7+vJzYp00czODqDI9PEvsHnA0N
 nV8bHSlNaNzPnSkPd6u/wTKJgPfnagn6xzwkEGKrOCFbo/UQb4lNEGMh1s2ZEyPd1m9Q
 dUu3SgAo2/jG6K0mdjU4+fjBDkyTC+zZyd3V/JNALVO2CAyF1fx6Sl3s1+hoFbzBmvtF
 Qp3w==
X-Gm-Message-State: ANhLgQ17yXvKOG6LQTLdPb+TO9sKWSgyz1vik36Dy+Waw3HHC/iKncch
 HIVvl426uA/FHsqda5k4KYHj/Q==
X-Google-Smtp-Source: ADFU+vv4xmOj0tzWHB5SQ0yDQM7GrYmPWEEG97zyC/ogWSViWb7H2+tdHqbYbLQEWD8qFE+AE2z7Ww==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr894131wmj.91.1585640924179;
 Tue, 31 Mar 2020 00:48:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x11sm19376548wru.62.2020.03.31.00.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 00:48:43 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:48:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 6/6] drm/bridge: fix kernel-doc warning in panel.c
Message-ID: <20200331074841.GE2363188@phenom.ffwll.local>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328132025.19910-7-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 02:20:25PM +0100, Sam Ravnborg wrote:
> Add missing documentation to fix following warning:
> panel.c:303: warning: Function parameter or member 'bridge' not described in 'drm_panel_bridge_connector'
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/bridge/panel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 8461ee8304ba..e933f1c47f5d 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -311,6 +311,7 @@ EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
>  
>  /**
>   * drm_panel_bridge_connector - return the connector for the panel bridge
> + * @bridge: The drm_bridge.
>   *
>   * drm_panel_bridge creates the connector.
>   * This function gives external access to the connector.
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
