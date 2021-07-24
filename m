Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFB3D444D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 04:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82E06FD53;
	Sat, 24 Jul 2021 02:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08576FD53
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 02:05:49 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so3860015ota.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 19:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=TRhTnKFTdBD6i//Nvm6jq0fcWdEGfGx7D4wfOpvHe+Y=;
 b=D7Cbvu4j9Ncs84mzYw7NP1/wVBkOi6i7GSKcMJ9awQ+UWjvZbLKZfJvvlNahCMO7MV
 TRLwoZfUHCQwTwrAZoJ4cTv6gSm4nsWXCRZMnDazJ0kjCp4u5DPLortS6/Rqp5vEqIvE
 NrM11yyE/FN5LrC+QWnLVjSIgXU1sXxV0Gd7pomWJBjA1H0IoMjnrpH0jdp8XqpUkBz1
 XXt5TsvWarrl+0wxYZaKqvgBg3sflhCHkUnDdQnkX5WdmC+xAiIMjGXHuAMbmfa2GEGn
 sgBzGAX6JgiH44b05h4gsImMsLVCfeAvNqVc55WyIbRSgjrG7AtcCFhFhMDZGw8/JXGr
 BU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=TRhTnKFTdBD6i//Nvm6jq0fcWdEGfGx7D4wfOpvHe+Y=;
 b=KWY7cKpJD6qiIZ8tSIaGoBn0TNu/E/QJXHk7nVk2nR+RiOepM+LIP0RTru2vTCcXZl
 QYuNRywmOxMn5Bk3DxvaYwFSBbSoNUyTvOZDWLyWnVDEj68+pXBBjkFYAYrLFzuxp0j4
 qehPMif8GWkEQYdhCAIy1EoBXUfQ1INiFffqx6kYXHtUaUDkgwmdWmdlh22gyuoYW4K9
 i4HB2kzbXR7JLG0sotKGZ4LKM0N7zYHQl3zOiN9hJ7GnPKYaOq9AjlcoOwazEKrhsDXI
 Oc58wf7HCRgzz5ib5O6Yiu8ZbYb1ksUgCyyYJvyHsogrUy6XIvuo2ZuRfCX+ibwFP0eS
 USZw==
X-Gm-Message-State: AOAM533tVpx6B0M2pIscAAqNMSTkQjPv7z1G9+pwF5Vq04MT4gCX3WhK
 Hn8ALWgPEA1QZuk9ppkOwumSaQ==
X-Google-Smtp-Source: ABdhPJxt+Qpmetx3ddziuK6jYiDTiUGWycCOakK1Nr3nlVyFxD3DQdSecPtB+6h+SRW4fA2VU55L/A==
X-Received: by 2002:a05:6830:1db9:: with SMTP id
 z25mr4970442oti.39.1627092348867; 
 Fri, 23 Jul 2021 19:05:48 -0700 (PDT)
Received: from [100.72.193.189] ([209.107.186.70])
 by smtp.gmail.com with ESMTPSA id g31sm5995518otb.53.2021.07.23.19.05.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jul 2021 19:05:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Date: Fri, 23 Jul 2021 21:05:45 -0500
Message-ID: <17ad642e0a8.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
User-Agent: AquaMail/1.30.0-1826 (build: 103000001)
Subject: Re: [PATCH 00/30] Remove CNL support
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="17ad642e270575a28175fc2a41"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jose Souza <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--17ad642e270575a28175fc2a41
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Generally a big fan. 👍

--Jason

On July 23, 2021 19:11:34 Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> Patches 1 and 2 are already being reviewed elsewhere. Discussion on 2nd
> patch made me revive something I started after comment from Ville
> at 
> https://patchwork.freedesktop.org/patch/428168/?series=88988&rev=1#comment_768918
>
> This removes CNL completely from the driver, while trying to rename
> functions and macros where appropriate (usually to GLK when dealing with
> display or with ICL otherwise). It starts with display, which is more
> straightforward, and then proceed to the rest of i915.
>
> diff stat removing 1600 lines of dead code seems to pay the pain of
> doing this.
>
>
> Lucas De Marchi (30):
>  drm/i915: fix not reading DSC disable fuse in GLK
>  drm/i915/display: split DISPLAY_VER 9 and 10 in intel_setup_outputs()
>  drm/i915/display: remove PORT_F workaround for CNL
>  drm/i915/display: remove explicit CNL handling from intel_cdclk.c
>  drm/i915/display: remove explicit CNL handling from intel_color.c
>  drm/i915/display: remove explicit CNL handling from intel_combo_phy.c
>  drm/i915/display: remove explicit CNL handling from intel_crtc.c
>  drm/i915/display: remove explicit CNL handling from intel_ddi.c
>  drm/i915/display: remove explicit CNL handling from
>    intel_display_debugfs.c
>  drm/i915/display: remove explicit CNL handling from intel_dmc.c
>  drm/i915/display: remove explicit CNL handling from intel_dp.c
>  drm/i915/display: remove explicit CNL handling from intel_dpll_mgr.c
>  drm/i915/display: remove explicit CNL handling from intel_vdsc.c
>  drm/i915/display: remove explicit CNL handling from
>    skl_universal_plane.c
>  drm/i915/display: remove explicit CNL handling from
>    intel_display_power.c
>  drm/i915/display: remove CNL ddi buf translation tables
>  drm/i915/display: rename CNL references in skl_scaler.c
>  drm/i915: remove explicit CNL handling from i915_irq.c
>  drm/i915: remove explicit CNL handling from intel_pm.c
>  drm/i915: remove explicit CNL handling from intel_mocs.c
>  drm/i915: remove explicit CNL handling from intel_pch.c
>  drm/i915: remove explicit CNL handling from intel_wopcm.c
>  drm/i915/gt: remove explicit CNL handling from intel_sseu.c
>  drm/i915: rename CNL references in intel_dram.c
>  drm/i915/gt: rename CNL references in intel_engine.h
>  drm/i915: finish removal of CNL
>  drm/i915: remove GRAPHICS_VER == 10
>  drm/i915: rename/remove CNL registers
>  drm/i915: replace random CNL comments
>  drm/i915: switch num_scalers/num_sprites to consider DISPLAY_VER
>
> drivers/gpu/drm/i915/display/intel_bios.c     |   8 +-
> drivers/gpu/drm/i915/display/intel_cdclk.c    |  72 +-
> drivers/gpu/drm/i915/display/intel_color.c    |   5 +-
> .../gpu/drm/i915/display/intel_combo_phy.c    | 106 +--
> drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
> drivers/gpu/drm/i915/display/intel_ddi.c      | 266 +-------
> .../drm/i915/display/intel_ddi_buf_trans.c    | 616 +++++-------------
> .../drm/i915/display/intel_ddi_buf_trans.h    |   4 +-
> drivers/gpu/drm/i915/display/intel_display.c  |   3 +-
> .../drm/i915/display/intel_display_debugfs.c  |   2 +-
> .../drm/i915/display/intel_display_power.c    | 289 --------
> .../drm/i915/display/intel_display_power.h    |   2 -
> drivers/gpu/drm/i915/display/intel_dmc.c      |   9 -
> drivers/gpu/drm/i915/display/intel_dp.c       |  35 +-
> drivers/gpu/drm/i915/display/intel_dp_aux.c   |   1 -
> drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 586 +++--------------
> drivers/gpu/drm/i915/display/intel_dpll_mgr.h |   1 -
> drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
> drivers/gpu/drm/i915/display/intel_vdsc.c     |   5 +-
> drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
> .../drm/i915/display/skl_universal_plane.c    |  14 +-
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   1 -
> drivers/gpu/drm/i915/gt/debugfs_gt_pm.c       |  10 +-
> drivers/gpu/drm/i915/gt/intel_engine.h        |   2 +-
> drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   3 -
> drivers/gpu/drm/i915/gt/intel_ggtt.c          |   4 +-
> .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |  10 +-
> drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +-
> drivers/gpu/drm/i915/gt/intel_lrc.c           |  42 +-
> drivers/gpu/drm/i915/gt/intel_mocs.c          |   2 +-
> drivers/gpu/drm/i915/gt/intel_rc6.c           |   2 +-
> drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
> drivers/gpu/drm/i915/gt/intel_sseu.c          |  79 ---
> drivers/gpu/drm/i915/gt/intel_sseu.h          |   2 +-
> drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |   6 +-
> drivers/gpu/drm/i915/gvt/gtt.c                |   2 +-
> drivers/gpu/drm/i915/i915_debugfs.c           |   6 +-
> drivers/gpu/drm/i915/i915_drv.h               |  13 +-
> drivers/gpu/drm/i915/i915_irq.c               |   7 +-
> drivers/gpu/drm/i915/i915_pci.c               |  23 +-
> drivers/gpu/drm/i915/i915_perf.c              |  22 +-
> drivers/gpu/drm/i915/i915_reg.h               | 245 ++-----
> drivers/gpu/drm/i915/intel_device_info.c      |  23 +-
> drivers/gpu/drm/i915/intel_device_info.h      |   4 +-
> drivers/gpu/drm/i915/intel_dram.c             |  32 +-
> drivers/gpu/drm/i915/intel_pch.c              |   5 +-
> drivers/gpu/drm/i915/intel_pm.c               |  41 +-
> drivers/gpu/drm/i915/intel_wopcm.c            |  10 +-
> 48 files changed, 516 insertions(+), 2128 deletions(-)
>
> --
> 2.31.1


--17ad642e270575a28175fc2a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Generally a big fan. =F0=9F=91=8D</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">--Jason</div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On July 23, 2021 19:11:34 Lucas De Marchi &lt;lucas.demar=
chi@intel.com&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Patches 1 and 2 are already being reviewed elsewhere. Dis=
cussion on 2nd</div>
<div dir=3D"auto">patch made me revive something I started after comment fr=
om Ville</div>
<div dir=3D"auto">at https://patchwork.freedesktop.org/patch/428168/?series=
=3D88988&amp;rev=3D1#comment_768918</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This removes CNL completely from the driver, while trying=
 to rename</div>
<div dir=3D"auto">functions and macros where appropriate (usually to GLK wh=
en dealing with</div>
<div dir=3D"auto">display or with ICL otherwise). It starts with display, w=
hich is more</div>
<div dir=3D"auto">straightforward, and then proceed to the rest of i915.</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff stat removing 1600 lines of dead code seems to pay t=
he pain of</div>
<div dir=3D"auto">doing this.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Lucas De Marchi (30):</div>
<div dir=3D"auto">&nbsp; drm/i915: fix not reading DSC disable fuse in GLK<=
/div>
<div dir=3D"auto">&nbsp; drm/i915/display: split DISPLAY_VER 9 and 10 in in=
tel_setup_outputs()</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove PORT_F workaround for CNL=
</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_cdclk.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_color.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_combo_phy.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_crtc.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_ddi.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m</div>
<div dir=3D"auto">&nbsp; &nbsp; intel_display_debugfs.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_dmc.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_dp.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_dpll_mgr.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m intel_vdsc.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m</div>
<div dir=3D"auto">&nbsp; &nbsp; skl_universal_plane.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove explicit CNL handling fro=
m</div>
<div dir=3D"auto">&nbsp; &nbsp; intel_display_power.c</div>
<div dir=3D"auto">&nbsp; drm/i915/display: remove CNL ddi buf translation t=
ables</div>
<div dir=3D"auto">&nbsp; drm/i915/display: rename CNL references in skl_sca=
ler.c</div>
<div dir=3D"auto">&nbsp; drm/i915: remove explicit CNL handling from i915_i=
rq.c</div>
<div dir=3D"auto">&nbsp; drm/i915: remove explicit CNL handling from intel_=
pm.c</div>
<div dir=3D"auto">&nbsp; drm/i915: remove explicit CNL handling from intel_=
mocs.c</div>
<div dir=3D"auto">&nbsp; drm/i915: remove explicit CNL handling from intel_=
pch.c</div>
<div dir=3D"auto">&nbsp; drm/i915: remove explicit CNL handling from intel_=
wopcm.c</div>
<div dir=3D"auto">&nbsp; drm/i915/gt: remove explicit CNL handling from int=
el_sseu.c</div>
<div dir=3D"auto">&nbsp; drm/i915: rename CNL references in intel_dram.c</d=
iv>
<div dir=3D"auto">&nbsp; drm/i915/gt: rename CNL references in intel_engine=
.h</div>
<div dir=3D"auto">&nbsp; drm/i915: finish removal of CNL</div>
<div dir=3D"auto">&nbsp; drm/i915: remove GRAPHICS_VER =3D=3D 10</div>
<div dir=3D"auto">&nbsp; drm/i915: rename/remove CNL registers</div>
<div dir=3D"auto">&nbsp; drm/i915: replace random CNL comments</div>
<div dir=3D"auto">&nbsp; drm/i915: switch num_scalers/num_sprites to consid=
er DISPLAY_VER</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_bios.c &nbsp; &n=
bsp; | &nbsp; 8 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_cdclk.c &nbsp; &=
nbsp;| &nbsp;72 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_color.c &nbsp; &=
nbsp;| &nbsp; 5 +-</div>
<div dir=3D"auto">&nbsp;.../gpu/drm/i915/display/intel_combo_phy.c &nbsp; &=
nbsp;| 106 +--</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_crtc.c &nbsp; &n=
bsp; | &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_ddi.c &nbsp; &nb=
sp; &nbsp;| 266 +-------</div>
<div dir=3D"auto">&nbsp;.../drm/i915/display/intel_ddi_buf_trans.c &nbsp; &=
nbsp;| 616 +++++-------------</div>
<div dir=3D"auto">&nbsp;.../drm/i915/display/intel_ddi_buf_trans.h &nbsp; &=
nbsp;| &nbsp; 4 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_display.c &nbsp;=
| &nbsp; 3 +-</div>
<div dir=3D"auto">&nbsp;.../drm/i915/display/intel_display_debugfs.c &nbsp;=
| &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;.../drm/i915/display/intel_display_power.c &nbsp; &=
nbsp;| 289 --------</div>
<div dir=3D"auto">&nbsp;.../drm/i915/display/intel_display_power.h &nbsp; &=
nbsp;| &nbsp; 2 -</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_dmc.c &nbsp; &nb=
sp; &nbsp;| &nbsp; 9 -</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_dp.c &nbsp; &nbs=
p; &nbsp; | &nbsp;35 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_dp_aux.c &nbsp; =
| &nbsp; 1 -</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 586=
 +++--------------</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_dpll_mgr.h | &nb=
sp; 1 -</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_vbt_defs.h | &nb=
sp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/intel_vdsc.c &nbsp; &n=
bsp; | &nbsp; 5 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/display/skl_scaler.c &nbsp; &n=
bsp; | &nbsp;10 +-</div>
<div dir=3D"auto">&nbsp;.../drm/i915/display/skl_universal_plane.c &nbsp; &=
nbsp;| &nbsp;14 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gem/i915_gem_stolen.c &nbsp; &=
nbsp;| &nbsp; 1 -</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/debugfs_gt_pm.c &nbsp; &nbs=
p; &nbsp; | &nbsp;10 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_engine.h &nbsp; &nbsp=
; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_engine_cs.c &nbsp; &n=
bsp; | &nbsp; 3 -</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_ggtt.c &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;| &nbsp; 4 +-</div>
<div dir=3D"auto">&nbsp;.../gpu/drm/i915/gt/intel_gt_clock_utils.c &nbsp; &=
nbsp;| &nbsp;10 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_gtt.c &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; | &nbsp; 6 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_lrc.c &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; | &nbsp;42 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_mocs.c &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_rc6.c &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; | &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_rps.c &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; | &nbsp; 4 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_sseu.c &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;| &nbsp;79 ---</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_sseu.h &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c &nbsp;=
| &nbsp; 6 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gvt/gtt.c &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_debugfs.c &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; | &nbsp; 6 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_drv.h &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;13 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_irq.c &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 7 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_pci.c &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;23 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_perf.c &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;22 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_reg.h &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; | 245 ++-----</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/intel_device_info.c &nbsp; &nb=
sp; &nbsp;| &nbsp;23 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/intel_device_info.h &nbsp; &nb=
sp; &nbsp;| &nbsp; 4 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/intel_dram.c &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; | &nbsp;32 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/intel_pch.c &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 5 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/intel_pm.c &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;41 +-</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/intel_wopcm.c &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;| &nbsp;10 +-</div>
<div dir=3D"auto">&nbsp;48 files changed, 516 insertions(+), 2128 deletions=
(-)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.31.1</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--17ad642e270575a28175fc2a41--

