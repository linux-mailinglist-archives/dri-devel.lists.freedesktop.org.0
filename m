Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9A264042
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB76E34D;
	Thu, 10 Sep 2020 08:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EAA6E34D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:42:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s12so5723166wrw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qt26jIRrU/4dtFhMQngZIshVJTEFZdIZPHsu8nvcbDU=;
 b=E8s6Rh8HXeYzjin1iSezxdoBAsAiA9gcXOXA/QgX2Krqhcpb0aTBCtnI8YtcoSKB7V
 sdRyhHjkhyhd+PuRwRBc+7n9YD6HAowazDTnpmpjCMQVrrTJLnKotK2NyBV2PT0/s3In
 H8mQDou26CyzMd4P36Zk0Q+Pup1j6dS9Lt2Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qt26jIRrU/4dtFhMQngZIshVJTEFZdIZPHsu8nvcbDU=;
 b=UJ+X/00ZteDdvHcrV9CVAx7+cJymE5kombmgzN0KVnqyi9oeoKsgi2oK6b7EhMRgf5
 PhK+0Y2+D1k82ovNW1flECjsm4zdI/aWKBuqLu82jLB0ODv7/wLSCUSslSLj39Mktojb
 /9vyrOUnpFW3NVL5KntiKGXVgBAD5C3cCRfPCB9r8E1rWJD4FL2j79Jk0nMCs4cZkrTU
 CnM0v+9jaGb+SSw4mWmLHX7JL5bycgzy9T8fHk/6QwNX3QbOvlMIU6CLfilELNo4AZda
 DEFafU+QjEfvbYOlE3ChpDj+7rKW6S9TV2F3Y4QsBMORikrd2tbjuW4wA5BTNPxJXPuX
 9jtQ==
X-Gm-Message-State: AOAM530G11nJ3kiVE5nLDV4UGnK2ym8lIBvxd7LMVQDFeqGg44ohdIXe
 uvJIMYEQ1Rw/jC5yPigg8Kx+zg==
X-Google-Smtp-Source: ABdhPJzpN0TFpScPSzHLRsBjZueSpz7JHeTGq3Q3+BTcvD0OWYZhVUABe8K5/DTwlMCsTe3AXeXXAQ==
X-Received: by 2002:a5d:6407:: with SMTP id z7mr7648916wru.65.1599727337822;
 Thu, 10 Sep 2020 01:42:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 97sm2311510wrm.15.2020.09.10.01.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:42:17 -0700 (PDT)
Date: Thu, 10 Sep 2020 10:42:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v7 0/4] Add support for KeemBay DRM driver
Message-ID: <20200910084215.GK438822@phenom.ffwll.local>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniel.vetter@intel.com, edmund.j.dea@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 01:02:48PM -0700, Anitha Chrisanthus wrote:
> This is a new DRM driver for Intel's KeemBay SOC.
> The SoC couples an ARM Cortex A53 CPU with an Intel
> Movidius VPU.
> 
> This driver is tested with the KMB EVM board which is the refernce baord
> for Keem Bay SOC. The SOC's display pipeline is as follows
> 
> +--------------+    +---------+    +-----------------------+
> |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> +--------------+    +---------+    +-----------------------+
> 
> LCD controller and Mipi DSI transmitter are part of the SOC and
> mipi to HDMI converter is ADV7535 for KMB EVM board.
> 
> The DRM driver is a basic KMS atomic modesetting display driver and
> has no 2D or 3D graphics.It calls into the ADV bridge driver at
> the connector level.
> 
> Only 1080p resolution and single plane is supported at this time.
> The usecase is for debugging video and camera outputs.
> 
> Device tree patches are under review here
> https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-daniele.alessandrelli@linux.intel.com/T/

I've looked at the code, and imo looks fairly reasonable. I think the
remaining things can also be polished in-tree, and we could start merging
the code already. For that 2 things are missing:

- Need a MAINTAINERS entry for this (I'm assuming you're volunteering)
- You need drm-misc commit rights set up so you can push patches, see

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-changes-with-igt

The docs there also have howto and everything.

Cheers, Daniel

> 
> Changes since v1:
> - Removed redundant license text, updated license
> - Rearranged include blocks
> - renamed global vars and removed extern in c
> - Used upclassing for dev_private
> - Used drm_dev_init in drm device create
> - minor cleanups
> 
> Changes since v2:
> - squashed all commits to a single commit
> - logging changed to drm_info, drm_dbg etc.
> - used devm_drm_dev_alloc()
> - removed commented out sections and general cleanup
> 
> Changes since v3:
> - renamed dev_p to kmb
> - moved clocks under kmb_clock, consolidated clk initializations
> - use drmm functions
> - use DRM_GEM_CMA_DRIVER_OPS_VMAP
> - more cleanups
> 
> Changes since v4:
> - corrected spellings
> 
> Changes since v5:
> - corrected checkpatch warnings/checks
>    -Please ignore checkpatch checks on Camelcase - this is how it is
>    named in the databook
>    - Please ignore checkpatch warnings on misspelled for hsa, dout,
>    widthn etc. - they are spelled as in the databook
>    - Please ignore checkpatch checks on macro arguments reuse -
>    its confirmed ok
> 
> Changes since v6:
> - review changes Sam Ravnborg and Thomas Zimmerman
> 	split patch into 4 parts, part1 register definitions, part2 display
> 	driver files, part3 mipi dsi, part4 build files (Sam)
> 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> 	renamed mode_set, kmb_load, inlined unload (Thomas)
> 	moved remaining logging to drm_*(Thomas)
> 	re-orged driver initialization (Thomas)
> 	moved plane_status to drm_private (Sam)
> 	removed unnecessary logs and defines and ifdef codes (Sam)
> 	split dphy_init_sequence smaller (Sam)
> 	removed redundant checks in kmb_dsi (Sam)
> 	changed kmb_dsi_init to drm_bridge_connector_init and
> 	drm_connector_attach_encoder to bridge's connector (Sam)
> 	call helper_check in plane_atomic_check (Sam)
> 	renamed set to get for bpp and format functions(Sam)
> 	use drm helper functions for reset, duplicate/destroy state instead
> 	of kmb functions (Sam)
> 	removed kmb_priv from kmb_plane and removed kmb_plane_state (Sam)
> 
> Anitha Chrisanthus (4):
>   drm/kmb: Keem Bay driver register definition
>   drm/kmb: Add support for KeemBay Display
>   drm/kmb: Mipi DSI part of the display driver
>   drm/kmb: Build files for KeemBay Display driver
> 
>  drivers/gpu/drm/Kconfig         |    2 +
>  drivers/gpu/drm/Makefile        |    1 +
>  drivers/gpu/drm/kmb/Kconfig     |   13 +
>  drivers/gpu/drm/kmb/Makefile    |    2 +
>  drivers/gpu/drm/kmb/kmb_crtc.c  |  224 ++++++
>  drivers/gpu/drm/kmb/kmb_drv.c   |  676 +++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_drv.h   |  170 +++++
>  drivers/gpu/drm/kmb/kmb_dsi.c   | 1523 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_dsi.h   |  350 +++++++++
>  drivers/gpu/drm/kmb/kmb_plane.c |  480 ++++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.h |  110 +++
>  drivers/gpu/drm/kmb/kmb_regs.h  |  748 +++++++++++++++++++
>  12 files changed, 4299 insertions(+)
>  create mode 100644 drivers/gpu/drm/kmb/Kconfig
>  create mode 100644 drivers/gpu/drm/kmb/Makefile
>  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_regs.h
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
