Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B83473EC3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944BD10EA56;
	Tue, 14 Dec 2021 08:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA9510EA58
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:53:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t9so31129782wrx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 00:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6F2v0HGZC8Zz1ENR2EsLemKYP8DvQFPfyP1kJZ4ji5Y=;
 b=ZCJI84OmuiDwr93CN4gmhjaHX3QHTrprHQy6LYGFAsiDTIKu2ImCjo7MrS4yBW4VT5
 jmKrru+kmsi4pueTIxrO8m7C7zTxNiEjANtdVE8kyX9G8hF2PV9mOCMolix0So3z6MAg
 d+clfe9TV3JnPMdurRleagdEkZ8muj2Hzqi1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6F2v0HGZC8Zz1ENR2EsLemKYP8DvQFPfyP1kJZ4ji5Y=;
 b=42d5rkw9ztpv5uS5VAUGcVXMTtSaSP/jx0CYioPxPTIhyW24odLzXpLi0sljMJYNxn
 XWkZCMaxKG3wtkQOv+4xu5fexzbIsTLXuX+BV2q5EK06D0mhdnOFn46YTscnekEg+PUm
 kj/u+mYYoplVrl1Qlxovt8YiYCBXHpeHdsQHsomMvgCbCcMtD8loDyiAIvKD90QZH8AU
 PQzXq8d4+9QXvVB2A4FfClLL90p0y30iFIzjH0tGFjvzxB1a52N0A1GH1LUCZOQSCohp
 2KVt/5pmyz4g2VQCjhnYbXNP5Zit6it1aRTQvmz5v6P7JhpmFLyFH5jrvTUG7EBDaxOn
 0ZiQ==
X-Gm-Message-State: AOAM533AbU/2PCT9qP02/b001/oSScaVn98ecea/TWreoEz7JYqhHIOU
 mMJd8rnBXCNm36lwx2+Tekmj2g==
X-Google-Smtp-Source: ABdhPJzMTUjYfMWjW7uUOJ4oGugcSHeNN11s2/s0tyZjrNM2qsC80Zow9PG/eCcACOB/usFblImNRA==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr4199216wrw.104.1639472009637; 
 Tue, 14 Dec 2021 00:53:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x13sm13236755wrr.47.2021.12.14.00.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 00:53:29 -0800 (PST)
Date: Tue, 14 Dec 2021 09:53:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-next
Message-ID: <Ybhbh4wUKnNtB8rJ@phenom.ffwll.local>
References: <YaSVz15Q7dAlEevU@linux-uq9g.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaSVz15Q7dAlEevU@linux-uq9g.fritz.box>
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
Cc: Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 09:56:47AM +0100, Thomas Zimmermann wrote:
> Hi Dave and Daniel,
> 
> here's the second PR for drm-misc-next for what will become Linux 5.17.
> It's a bit late, as I was on vacation last week. The most significant
> change moves the nomodeset parameter entirely into the DRM subsystem.
> 
> Best regards
> Thomas
> 
> drm-misc-next-2021-11-29:
> drm-misc-next for 5.17:
> 
> UAPI Changes:
> 
> Cross-subsystem Changes:
> 
>  * Move 'nomodeset' kernel boot option into DRM subsystem
> 
> Core Changes:
> 
>  * Replace several DRM_*() logging macros with drm_*() equivalents
>  * panel: Add quirk for Lenovo Yoga Book X91F/L
>  * ttm: Documentation fixes
> 
> Driver Changes:
> 
>  * Cleanup nomodeset handling in drivers
>  * Fixes
>  * bridge/anx7625: Fix reading EDID; Fix error code
>  * bridge/megachips: Probe both bridges before registering
>  * vboxvideo: Fix ERR_PTR usage
> The following changes since commit a713ca234ea9d946235ac7248995c5fddfd9e523:
> 
>   Merge drm/drm-next into drm-misc-next (2021-11-18 09:36:39 +0100)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-11-29

Pulled, thanks.
-Daniel

> 
> for you to fetch changes up to 69d846126e1653ca9043c3766c66684132586941:
> 
>   drm: Fix build error caused by missing drm_nomodeset.o (2021-11-27 21:05:58 +0100)
> 
> ----------------------------------------------------------------
> drm-misc-next for 5.17:
> 
> UAPI Changes:
> 
> Cross-subsystem Changes:
> 
>  * Move 'nomodeset' kernel boot option into DRM subsystem
> 
> Core Changes:
> 
>  * Replace several DRM_*() logging macros with drm_*() equivalents
>  * panel: Add quirk for Lenovo Yoga Book X91F/L
>  * ttm: Documentation fixes
> 
> Driver Changes:
> 
>  * Cleanup nomodeset handling in drivers
>  * Fixes
>  * bridge/anx7625: Fix reading EDID; Fix error code
>  * bridge/megachips: Probe both bridges before registering
>  * vboxvideo: Fix ERR_PTR usage
> 
> ----------------------------------------------------------------
> Christian König (1):
>       drm/amdgpu: partially revert "svm bo enable_signal call condition"
> 
> Claudio Suarez (1):
>       drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c
> 
> Dan Carpenter (2):
>       drm/vboxvideo: fix a NULL vs IS_ERR() check
>       drm/bridge: anx7625: fix an error code in anx7625_register_audio()
> 
> Hans de Goede (1):
>       drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Book X91F/L
> 
> Hsin-Yi Wang (1):
>       drm/bridge: anx7625: Fix edid_read break case in sp_tx_edid_read()
> 
> Javier Martinez Canillas (7):
>       drm: Don't print messages if drivers are disabled due nomodeset
>       drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call vgacon_text_force()
>       drm: Move nomodeset kernel parameter to the DRM subsystem
>       drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
>       Documentation/admin-guide: Document nomodeset kernel parameter
>       drm: Make the nomodeset message less sensational
>       drm: Fix build error caused by missing drm_nomodeset.o
> 
> Martyn Welch (1):
>       drm/bridge: megachips: Ensure both bridges are probed before registration
> 
> Randy Dunlap (1):
>       drm: ttm: correct ttm_range_manager kernel-doc notation
> 
>  Documentation/admin-guide/kernel-parameters.txt    |   7 +
>  drivers/gpu/drm/Kconfig                            |   6 +
>  drivers/gpu/drm/Makefile                           |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   9 -
>  drivers/gpu/drm/ast/ast_drv.c                      |   3 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |   6 +-
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  40 +++-
>  drivers/gpu/drm/drm_atomic.c                       | 180 ++++++++-------
>  drivers/gpu/drm/drm_atomic_helper.c                | 243 ++++++++++++---------
>  drivers/gpu/drm/drm_atomic_uapi.c                  |   2 +-
>  drivers/gpu/drm/drm_auth.c                         |  12 +-
>  drivers/gpu/drm/drm_nomodeset.c                    |  24 ++
>  drivers/gpu/drm/drm_panel_orientation_quirks.c     |   6 +
>  drivers/gpu/drm/i915/i915_module.c                 |   4 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c              |   3 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                      |   3 +-
>  drivers/gpu/drm/radeon/radeon_drv.c                |   9 +-
>  drivers/gpu/drm/tiny/bochs.c                       |   3 +-
>  drivers/gpu/drm/tiny/cirrus.c                      |   4 +-
>  drivers/gpu/drm/ttm/ttm_range_manager.c            |  11 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c               |   5 +-
>  drivers/gpu/drm/vboxvideo/vbox_main.c              |   4 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c               |   3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   3 +-
>  drivers/video/console/vgacon.c                     |  21 --
>  include/drm/drm_drv.h                              |   1 +
>  include/linux/console.h                            |   6 -
>  29 files changed, 344 insertions(+), 285 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_nomodeset.c
> 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
