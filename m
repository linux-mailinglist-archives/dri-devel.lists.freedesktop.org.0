Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8742398F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 10:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCBC6ECFC;
	Wed,  6 Oct 2021 08:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7556ECFC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 08:17:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e12so6203708wra.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1wB5d45hEZgCS8nUqh0LAV78NiFyfDUuN0cP1eNzA80=;
 b=0qTl0YxZH/PurBcNGxfEdfTQovDp73AFaNSk+gowxYmrCRlyWZ2LUtwiubES+cyR9i
 /8ukLhpO7Px1N2M+x+eZvIviNHGDNz2xLlVY9PJRzDQfimQNU/M3UtpWl+Wux9KzOjCz
 UGACAadPLpQO7J8dnx3DCKqdvsT6MOp5iVWwMqw6PsWzNDO0bbEKVgDijZiDewjA7UB+
 HVdKSW14IVxobP/JojOmW6QsHJgO9HqIXIDJKD3tBJaIg7JUliYWa9wg5cYu/97sW+wV
 l3NBqcLc28Gxp3aI0+iMjf+uAR8lY6hmthQPGxe/SZtVOwtNi6qE87qTlmGxBXDxkwxH
 ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1wB5d45hEZgCS8nUqh0LAV78NiFyfDUuN0cP1eNzA80=;
 b=azFOT1uiW04dcwZ2C23w9KUIKruQdNiVBPtH0Ro3wT7yJKNSnkeSBTub4mxdhCjZAv
 SK43mHBZT6rRqn8E/WOZcR9l3+aGV1yFiG3CtJguYJd8n8O4VSqGrpLljCliFfddE+vF
 UeKc8ryHnBD6Xcy3s+O/mN4ddF3HeiwQy9ciAKnsQM/LyYV9/krMkDR9mSe1285HH34N
 glvxImgt2d5KYA8fcYeuV0kMVtM9IyA9Ka9eQLwjw+WKydXvVNmF0IOM0XESO0NxNmv2
 7LgCDMFToBa6Wt9E+K79HjaKS/vv3a+fSWboM+j8Hij5IF0edFxTr3SshbqupZI4wSzi
 x9Ig==
X-Gm-Message-State: AOAM532bZid0W9Rd/WzkYBx4kLPU6U1L8q9gcMkKKpEWEUuyIpTqLPNs
 4eB7DahIT2VtVTiTVSavCizlUw==
X-Google-Smtp-Source: ABdhPJzkoAuNsY3jeNMCa16QPGhdCvf7i034q/yhJmaxeWozjuYlTUadRYjNSZaSIOaWNjSPynmk6w==
X-Received: by 2002:adf:bc03:: with SMTP id s3mr27607106wrg.37.1633508228639; 
 Wed, 06 Oct 2021 01:17:08 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:287f:efbb:492d:f66b?
 ([2001:861:44c0:66c0:287f:efbb:492d:f66b])
 by smtp.gmail.com with ESMTPSA id u2sm19593614wrr.35.2021.10.06.01.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 01:17:07 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <5e60b305-dda2-ab9a-0954-f2d2b441667e@baylibre.com>
Date: Wed, 6 Oct 2021 10:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

On 23/09/2021 09:06, Neil Armstrong wrote:
> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
> 
> This patch series adds virtual-plane support to omapdrm driver to allow the use
> of display wider than 2048 pixels.
> 
> In order to do so we introduce the concept of hw_overlay which can then be
> dynamically allocated to a plane. When the requested output width exceed what
> be supported by one overlay a second is then allocated if possible to handle
> display wider then 2048.
> 
> This series replaces an earlier series which was DT based and using statically
> allocated resources. 
> 
> This implementation is inspired from the work done in msm/disp/mdp5
> driver.

Gentle ping, who is supposed reviewing those patches ?

Thanks,
Neil

> 
> Changes since v4 at [1]:
> - rebased on v5.15-rc2
> - adapted to drm_atomic_get_new/old_plane_state()
> - tested on Beagle-x15
> - checked for non-regression on Beagle-x15
> - removed unused "state" variable in omap_global_state
> 
> [1] https://lore.kernel.org/all/20181012201703.29065-1-bparrot@ti.com/
> 
> Benoit Parrot (8):
>   drm/omap: Add ability to check if requested plane modes can be
>     supported
>   drm/omap: Add ovl checking funcs to dispc_ops
>   drm/omap: introduce omap_hw_overlay
>   drm/omap: omap_plane: subclass drm_plane_state
>   drm/omap: Add global state as a private atomic object
>   drm/omap: dynamically assign hw overlays to planes
>   drm/omap: add plane_atomic_print_state support
>   drm/omap: Add a 'right overlay' to plane state
> 
>  drivers/gpu/drm/omapdrm/Makefile       |   1 +
>  drivers/gpu/drm/omapdrm/dss/dispc.c    |  31 +-
>  drivers/gpu/drm/omapdrm/dss/dss.h      |   5 +
>  drivers/gpu/drm/omapdrm/omap_drv.c     | 189 ++++++++++++-
>  drivers/gpu/drm/omapdrm/omap_drv.h     |  28 ++
>  drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++-
>  drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
>  drivers/gpu/drm/omapdrm/omap_overlay.c | 254 +++++++++++++++++
>  drivers/gpu/drm/omapdrm/omap_overlay.h |  41 +++
>  drivers/gpu/drm/omapdrm/omap_plane.c   | 375 +++++++++++++++++++++----
>  drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
>  11 files changed, 903 insertions(+), 59 deletions(-)
>  create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
>  create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h
> 

