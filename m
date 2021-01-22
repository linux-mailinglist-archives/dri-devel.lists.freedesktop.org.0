Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB230144B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38B26EADF;
	Sat, 23 Jan 2021 09:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2A089B51
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 16:23:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id i17so7191403ljn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88Vl5wsF3LhouE+0mndGQ/+yVD0WCSAjrMW79+8hbAM=;
 b=Us7urmLGEwxHeZEMTzuxL/3zWhj0wu4J28lp40bhggvyz+92iK48WF2EJ1K0XlZJ3m
 LsWq6NMNpF74uSIkUo/cKyPs9WoFktH55Ls9L905qoa3c4CtftN+SRU/xwHo1Cc5zxod
 Kr1iMG9QeqMad/QqJrqMLeIXA1sMiX9k29dAi3TxV/PR3Kc/RzBuqU551PRoSW2Cy7Xl
 Uu2cLZmiDq5aIUnHsklJyKsBoMUp0cLINsLNDM8z/+52w+YT/EoEAZYpSNvPSw5gRY7u
 r6XrTThyzJwDojLrbkCoTZmGeaOXkxUVNdlOS7CuF77qJWfmgFeYhqGDl+ZjfGivq/Sj
 BAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88Vl5wsF3LhouE+0mndGQ/+yVD0WCSAjrMW79+8hbAM=;
 b=boyLa5flUNwQESpV+grS7plJkysc6MTy7rzAkxuPtNfExdn62PFOQrn3+u/ztuYeDU
 HYnIJgCiK3+xaSwYIyPmvOt/srY0eLafLqrg0SMSlE+QI+SYwP5LBGy8FLfe2AqezpWa
 TQGOUJa/PepMkVgWco+S4aUPMuX3YQC2KyhLtzCJr+jMru9OC4oBXn9NZRAqFWQB1+yJ
 VcLgiTHRMHKS1Iwnm9Lo9nDUhFG7vShfHQhUuabCINrsL3AEncleDaBSUSY54+3p57Az
 sWc+iDF3YflkxZtfSiaAPVJpSpwg/SW3xSJppmbgfJJuFZ+kphOqOIYktLRbw6FtB+bO
 HooA==
X-Gm-Message-State: AOAM532L3U/EV5Xgx+JuKaNXMDECbJSMVSHU6P2RuP4SQWWYtw3v0Q5S
 vIxW62+L97JHwUdQ/2Gt9FsYlQQ89gLpi5Dlg04=
X-Google-Smtp-Source: ABdhPJyWZRdgKUpo3TJpGFTQooQcCurQgqyPxBZSmMJibdHu4cMEuNs8RlC4FTKzhIQ1owSXMFJ6ODKxNdNQEtbop48=
X-Received: by 2002:a2e:90c4:: with SMTP id o4mr93601ljg.268.1611332580266;
 Fri, 22 Jan 2021 08:23:00 -0800 (PST)
MIME-Version: 1.0
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Sat, 23 Jan 2021 00:22:29 +0800
Message-ID: <CAFPSGXYePUYX7mPPTZ=nE6hH87Q1B5gee+hHqpnqJ50Zi-AP4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add Unisoc's drm kms module
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Tang <kevin3.tang@gmail.com>
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: Orson Zhai <orsonzhai@gmail.com>, devicetree@vger.kernel.org,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: multipart/mixed; boundary="===============0032325641=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0032325641==
Content-Type: multipart/alternative; boundary="0000000000000fd67e05b97f9abc"

--0000000000000fd67e05b97f9abc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
Do you have some more comments for our patch?

Kevin Tang <kevin3.tang@gmail.com> =E4=BA=8E2021=E5=B9=B41=E6=9C=885=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:46=E5=86=99=E9=81=93=EF=BC=9A

> ChangeList:
> RFC v1:
> 1. only upstream modeset and atomic at first commit.
> 2. remove some unused code;
> 3. use alpha and blend_mode properties;
> 3. add yaml support;
> 4. remove auto-adaptive panel driver;
> 5. bugfix
>
> RFC v2:
> 1. add sprd crtc and plane module for KMS, preparing for multi crtc&encod=
er
> 2. remove gem drivers, use generic CMA handlers
> 3. remove redundant "module_init", all the sub modules loading by KMS
>
> RFC v3:
> 1. multi crtc&encoder design have problem, so rollback to v1
>
> RFC v4:
> 1. update to gcc-linaro-7.5.0
> 2. update to Linux 5.6-rc3
> 3. remove pm_runtime support
> 4. add COMPILE_TEST, remove unused kconfig
> 5. "drm_dev_put" on drm_unbind
> 6. fix some naming convention issue
> 7. remove semaphore lock for crtc flip
> 8. remove static variables
>
> RFC v5:
> 1. optimize encoder and connector code implementation
> 2. use "platform_get_irq" and "platform_get_resource"
> 3. drop useless function return type, drop unless debug log
> 4. custom properties should be separate, so drop it
> 5. use DRM_XXX replase pr_xxx
> 6. drop dsi&dphy hal callback ops
> 7. drop unless callback ops checking
> 8. add comments for sprd dpu structure
>
> RFC v6:
> 1. Access registers via readl/writel
> 2. Checking for unsupported KMS properties (format, rotation, blend_mode,
> etc) on plane_check ops
> 3. Remove always true checks for dpu core ops
>
> RFC v7:
> 1. Fix DTC unit name warnings
> 2. Fix the problem of maintainers
> 3. Call drmm_mode_config_init to mode config init
> 4. Embed drm_device in sprd_drm and use devm_drm_dev_alloc
> 5. Replace DRM_XXX with drm_xxx on KMS module, but not suitable for other
> subsystems
> 6. Remove plane_update stuff, dpu handles all the HW update in
> crtc->atomic_flush
> 7. Dsi&Dphy Code structure adjustment, all move to "sprd/"
>
> v0:
> 1. Remove dpu_core_ops stuff layer for sprd drtc driver, but dpu_layer
> need to keeping.
>    Because all the HW update in crtc->atomic_flush, we need temporary
> storage all layers for
>    the dpu pageflip of atomic_flush.
> 2. Add ports subnode with port@X.
>
> v1:
> 1. Remove dphy and dsi graph binding, merge the dphy driver into the dsi.
> 2. Add commit messages for Unisoc's virtual nodes.
>
> v2:
> 1. Use drm_xxx to replace all DRM_XXX.
> 2. Use kzalloc to replace devm_kzalloc for sprd_dsi/sprd_dpu structure
> init.
> 3. Remove dpu_core_ops midlayer.
>
> v3:
> 1. Remove dpu_layer midlayer and commit layers by aotmic_update
>
> Kevin Tang (6):
>   dt-bindings: display: add Unisoc's drm master bindings
>   drm/sprd: add Unisoc's drm kms master
>   dt-bindings: display: add Unisoc's dpu bindings
>   drm/sprd: add Unisoc's drm display controller driver
>   dt-bindings: display: add Unisoc's mipi dsi controller bindings
>   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
>
>  .../display/sprd/sprd,display-subsystem.yaml       |   64 +
>  .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   77 +
>  .../display/sprd/sprd,sharkl3-dsi-host.yaml        |  102 ++
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/sprd/Kconfig                       |   13 +
>  drivers/gpu/drm/sprd/Makefile                      |    8 +
>  drivers/gpu/drm/sprd/dw_dsi_ctrl.c                 |  794 +++++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl.h                 | 1475
> ++++++++++++++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c             |  157 +++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h             |   26 +
>  drivers/gpu/drm/sprd/megacores_pll.c               |  317 +++++
>  drivers/gpu/drm/sprd/megacores_pll.h               |  146 ++
>  drivers/gpu/drm/sprd/sprd_dpu.c                    |  985 +++++++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.h                    |  120 ++
>  drivers/gpu/drm/sprd/sprd_drm.c                    |  224 +++
>  drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
>  drivers/gpu/drm/sprd/sprd_dsi.c                    | 1162 ++++++++++++++=
+
>  drivers/gpu/drm/sprd/sprd_dsi.h                    |  107 ++
>  19 files changed, 5799 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yam=
l
>  create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
>
> --
> 2.7.4
>
>

--0000000000000fd67e05b97f9abc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel,=C2=A0<div>Do you have some more comments for ou=
r patch?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@gmail.com" target=3D"_=
blank">kevin3.tang@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B41=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:46=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">ChangeList:<br>
RFC v1:<br>
1. only upstream modeset and atomic at first commit. <br>
2. remove some unused code;<br>
3. use alpha and blend_mode properties;<br>
3. add yaml support;<br>
4. remove auto-adaptive panel driver;<br>
5. bugfix<br>
<br>
RFC v2:<br>
1. add sprd crtc and plane module for KMS, preparing for multi crtc&amp;enc=
oder<br>
2. remove gem drivers, use generic CMA handlers<br>
3. remove redundant &quot;module_init&quot;, all the sub modules loading by=
 KMS<br>
<br>
RFC v3:<br>
1. multi crtc&amp;encoder design have problem, so rollback to v1<br>
<br>
RFC v4:<br>
1. update to gcc-linaro-7.5.0<br>
2. update to Linux 5.6-rc3<br>
3. remove pm_runtime support<br>
4. add COMPILE_TEST, remove unused kconfig<br>
5. &quot;drm_dev_put&quot; on drm_unbind<br>
6. fix some naming convention issue<br>
7. remove semaphore lock for crtc flip<br>
8. remove static variables<br>
<br>
RFC v5:<br>
1. optimize encoder and connector code implementation<br>
2. use &quot;platform_get_irq&quot; and &quot;platform_get_resource&quot;<b=
r>
3. drop useless function return type, drop unless debug log<br>
4. custom properties should be separate, so drop it<br>
5. use DRM_XXX replase pr_xxx<br>
6. drop dsi&amp;dphy hal callback ops<br>
7. drop unless callback ops checking<br>
8. add comments for sprd dpu structure<br>
<br>
RFC v6:<br>
1. Access registers via readl/writel<br>
2. Checking for unsupported KMS properties (format, rotation, blend_mode, e=
tc) on plane_check ops<br>
3. Remove always true checks for dpu core ops<br>
<br>
RFC v7:<br>
1. Fix DTC unit name warnings<br>
2. Fix the problem of maintainers<br>
3. Call drmm_mode_config_init to mode config init<br>
4. Embed drm_device in sprd_drm and use devm_drm_dev_alloc<br>
5. Replace DRM_XXX with drm_xxx on KMS module, but not suitable for other s=
ubsystems<br>
6. Remove plane_update stuff, dpu handles all the HW update in crtc-&gt;ato=
mic_flush<br>
7. Dsi&amp;Dphy Code structure adjustment, all move to &quot;sprd/&quot;<br=
>
<br>
v0:<br>
1. Remove dpu_core_ops stuff layer for sprd drtc driver, but dpu_layer need=
 to keeping.<br>
=C2=A0 =C2=A0Because all the HW update in crtc-&gt;atomic_flush, we need te=
mporary storage all layers for<br>
=C2=A0 =C2=A0the dpu pageflip of atomic_flush.<br>
2. Add ports subnode with port@X.<br>
<br>
v1:<br>
1. Remove dphy and dsi graph binding, merge the dphy driver into the dsi.<b=
r>
2. Add commit messages for Unisoc&#39;s virtual nodes.<br>
<br>
v2:<br>
1. Use drm_xxx to replace all DRM_XXX.<br>
2. Use kzalloc to replace devm_kzalloc for sprd_dsi/sprd_dpu structure init=
.<br>
3. Remove dpu_core_ops midlayer.<br>
<br>
v3:<br>
1. Remove dpu_layer midlayer and commit layers by aotmic_update<br>
<br>
Kevin Tang (6):<br>
=C2=A0 dt-bindings: display: add Unisoc&#39;s drm master bindings<br>
=C2=A0 drm/sprd: add Unisoc&#39;s drm kms master<br>
=C2=A0 dt-bindings: display: add Unisoc&#39;s dpu bindings<br>
=C2=A0 drm/sprd: add Unisoc&#39;s drm display controller driver<br>
=C2=A0 dt-bindings: display: add Unisoc&#39;s mipi dsi controller bindings<=
br>
=C2=A0 drm/sprd: add Unisoc&#39;s drm mipi dsi&amp;dphy driver<br>
<br>
=C2=A0.../display/sprd/sprd,display-subsystem.yaml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A064 +<br>
=C2=A0.../bindings/display/sprd/sprd,sharkl3-dpu.yaml=C2=A0 =C2=A0 |=C2=A0 =
=C2=A077 +<br>
=C2=A0.../display/sprd/sprd,sharkl3-dsi-host.yaml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 102 ++<br>
=C2=A0drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013 +<br>
=C2=A0drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +<br>
=C2=A0drivers/gpu/drm/sprd/dw_dsi_ctrl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 794 +++++++++++<br>
=C2=A0drivers/gpu/drm/sprd/dw_dsi_ctrl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1475 ++++++++++++++++++++<br>
=C2=A0drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 157 +++<br>
=C2=A0drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
=C2=A0drivers/gpu/drm/sprd/megacores_pll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 317 +++++<br>
=C2=A0drivers/gpu/drm/sprd/megacores_pll.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 146 ++<br>
=C2=A0drivers/gpu/drm/sprd/sprd_dpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 985 +++++++++++++<br>
=C2=A0drivers/gpu/drm/sprd/sprd_dpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 120 ++<br>
=C2=A0drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 224 +++<br>
=C2=A0drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A019 +<br>
=C2=A0drivers/gpu/drm/sprd/sprd_dsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1162 +++++++++++++++<br>
=C2=A0drivers/gpu/drm/sprd/sprd_dsi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 107 ++<br>
=C2=A019 files changed, 5799 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/display/sprd/spr=
d,display-subsystem.yaml<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/display/sprd/spr=
d,sharkl3-dpu.yaml<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/display/sprd/spr=
d,sharkl3-dsi-host.yaml<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h<br>
<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--0000000000000fd67e05b97f9abc--

--===============0032325641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0032325641==--
