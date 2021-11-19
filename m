Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB845724A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831056EDAA;
	Fri, 19 Nov 2021 16:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339C66EDA4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:01:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t5so44933004edd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 08:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4bmmiqGFVF3c4eOLSe06WVhfiqWVoidcMplPIJMDdLE=;
 b=LS2IPJuvNBDKJboKgPO56rYiI2Hfr4RIPNQ8vCKNbwmgOIATKEW6dlYREu3Jvo5kaZ
 lbelMOMgaTc2/+sTmPQ2Mzc2+0IUDhXmQtzoe+wFzcIBG0sasY2oEsaWqo54qeuaEMvT
 6H6ywSYwgugBI5SV8iLR2G2Wcli6j3fxX0xm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4bmmiqGFVF3c4eOLSe06WVhfiqWVoidcMplPIJMDdLE=;
 b=gbjLSjfZUUjcmM7FjVP3bQ04tjWj4Y1MZDTMZxp2ba3mrXAONMVtZd5LQthP5XgJPS
 Eo6dr052YTowxWMq5Cz3DZkwt2kQhxaObibJ8w176N5iBav4Vt18HwKUmtm3GgyzjXmq
 4wzRh6DNHNRZNxHn5QLIjdvJYebhDC957xTdaumbdX3NRWEUuLXNa9k444ngf/pP/4VL
 TBhzkpU2JqAinJ4DmK3Cv86UF6RVx4tPTMHGivg9wf1m/Ms7VmvzMcl1lha6wpqBVavM
 HmRU55kdJH6PSaShMk0eCUtFUASSORO45/68L6YexP2ZnhI687CdgNE+YGxmeu/Ecbbe
 +e4w==
X-Gm-Message-State: AOAM531nKKBWATGdAcDUbgYjY6KieCSMRXeF/EfBI8X/wdVNFsA9g+h6
 +jdJdydF0OKufoY40kdYagSryg==
X-Google-Smtp-Source: ABdhPJwYo18PBweJM60UMYbXxcXsunbW0J1lw381vnpaCzB0Pvli7+WDEngfJ4ZIXDP9jtIfAKx7bQ==
X-Received: by 2002:a05:6402:268d:: with SMTP id
 w13mr26718762edd.257.1637337676691; 
 Fri, 19 Nov 2021 08:01:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u16sm118094ejy.16.2021.11.19.08.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:01:15 -0800 (PST)
Date: Fri, 19 Nov 2021 17:01:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
References: <20211118103814.524670-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 11:38:01AM +0100, Maxime Ripard wrote:
> Hi,
> 
> This is a follow-up of the work to support the interactions between the hotplug
> and the scrambling support for vc4:
> 
> https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno.tech/
> https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cerno.tech/
> 
> Ville feedback was that the same discussion happened some time ago for i915,
> and resulted in a function to do an full disable/enable cycle on reconnection
> to avoid breaking the HDMI 2.0 spec.
> 
> This series improves the current scrambling support by adding generic helpers
> for usual scrambling-related operations, and builds upon them to provide a
> generic alternative to intel_hdmi_reset_link.

Out of curiosity, can we rebuild intel_hdmi_reset_link on top of these?
Always better to have two drivers to actually show the helpers help, than
just one.
-Daniel

> 
> Let me know what you think,
> Maxime
> 
> Changes from v1:
>   - Dropped the 340MHz define
>   - Make drm_mode_hdmi_requires_scrambling use the bpc
>   - Make more drm_display_mode const in vc4
>   - Dropped the tegra conversion
>   - Added more comments
> 
> Maxime Ripard (13):
>   drm/connector: Add helper to check if a mode requires scrambling
>   drm/atomic: Add HDMI scrambler state helper
>   drm/atomic: Add HDMI reset link helper
>   drm/scdc: Document hotplug gotchas
>   drm/vc4: hdmi: Constify drm_display_mode
>   drm/vc4: hdmi: Remove unused argument in vc4_hdmi_supports_scrambling
>   drm/vc4: hdmi: Remove mutex in detect
>   drm/vc4: hdmi: Remove HDMI flag from encoder
>   drm/vc4: hdmi: Simplify the hotplug handling
>   drm/vc4: hdmi: Simplify the connector state retrieval
>   drm/vc4: hdmi: Switch to detect_ctx
>   drm/vc4: hdmi: Leverage new SCDC atomic_check
>   drm/vc4: hdmi: Reset link on hotplug
> 
>  drivers/gpu/drm/drm_atomic_helper.c       | 109 +++++++++
>  drivers/gpu/drm/drm_atomic_state_helper.c |  58 +++++
>  drivers/gpu/drm/drm_scdc_helper.c         |  13 ++
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 257 ++++++++++------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h            |  19 +-
>  include/drm/drm_atomic_helper.h           |   3 +
>  include/drm/drm_atomic_state_helper.h     |   3 +
>  include/drm/drm_connector.h               |  25 +++
>  include/drm/drm_modes.h                   |  20 ++
>  9 files changed, 353 insertions(+), 154 deletions(-)
> 
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
