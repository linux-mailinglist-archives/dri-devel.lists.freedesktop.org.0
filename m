Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C247AAC1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 14:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4738712ABED;
	Mon, 20 Dec 2021 13:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2044B12ABEC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 13:58:15 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id k21so3757745lfu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 05:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ouFKNSuzmfC87LG9ZgCCjaB7bkrun24Ddt4sKJwaOQ=;
 b=i91OZUJfYkDWb9tQaYcFMcS75YkF5+FLepE9M2Ic0FEMHLkYnFJ6bzuQX+z8lj8L//
 JspWJDdnuGwr2mYY3sGNWn5A9zfv9JHRzoFRyuf/dotR36dZDcnNxkQNer1CTVYctynp
 H3k6uChHtZyDVTGNxk+zj1blZ2Zx+8CXA85dncsJdXvt/wU82hFNCyjYy1PBTAoftAhC
 0cBmYHDokRk16IBOVj7z6Q9FJPp/g7Pz+gF/mz+bKejpfXnyXXZKOPh/2u/F+1vdnlFG
 T8zbeTptbujhZIbuBGoGwPkuxhnLeKEJEfF9qxLzEgjqvvpIVI+I11un9+mkmADpD7d8
 2YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ouFKNSuzmfC87LG9ZgCCjaB7bkrun24Ddt4sKJwaOQ=;
 b=yZdmsYQp4zabVdY/bab78vj0bPLAtWeRZ9L0dQP4KxmqTUJTzR35e/YV6yPeXH3bsn
 +wi5GLjFKUAKYZoLu1l6Y0yKEj/DuQMQgzGAQtsOGerKZiFVrFz90pi+OilE2yWiEpzT
 jOzMPakAfranV8jXkfM4hwi6pi1dNH3QagPaKtQuIrxjgNBZNP5pDVR5Q0ETI9XVsezs
 t7BeaQ/pigho+XErRA5vb4vf5uuZJUFouhDPZ2DcZKr0pBzzCUpKyTC2B6kkdMfbePSc
 Sz9ZYXzzlpqbAl0nnSjH8BWqr3x0JuEfHL7K/60ybbysp3CBCG1UUY2JZEhGzaou4rnB
 aanA==
X-Gm-Message-State: AOAM531RMnu7NcPYC7BRmzXbb+Ui6b2xYg5Esv4RVvcDvnqIvhHf7sBI
 tjEoekajx4EdyLu9OH/QKKmAfSOBljId2SGcBhQ=
X-Google-Smtp-Source: ABdhPJzUXUjQ9dqcfgV5JqQePq6bsxcmf+xRGfNCXBq1PFsubiUDoc5B5wrjr3Q9Pp0QP2lWZf1ixDEFbOs45sHkE6U=
X-Received: by 2002:a05:6512:3d92:: with SMTP id
 k18mr8434126lfv.111.1640008693358; 
 Mon, 20 Dec 2021 05:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20211207142717.30296-1-kevin3.tang@gmail.com>
In-Reply-To: <20211207142717.30296-1-kevin3.tang@gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Mon, 20 Dec 2021 21:55:06 +0800
Message-ID: <CAFPSGXaC1rMF+KLttBJvKzN=UxtFtRR1gO3L4cqdgPJu_jtQ_A@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] Add Unisoc's drm kms module
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Kevin Tang <kevin3.tang@gmail.com>,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, orsonzhai@gmail.com, pony1.wu@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Maarten,
I see it from the cgit.freedesktop.org, our sprd drivers seems has
been merged into drm-misc.

Now, what shall we do next?

BR,
Best wishes

Kevin Tang <kevin3.tang@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=8C 22:27=E5=86=99=E9=81=93=EF=BC=9A

>
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
> 2. Checking for unsupported KMS properties (format, rotation, blend_mode,=
 etc) on plane_check ops
> 3. Remove always true checks for dpu core ops
>
> RFC v7:
> 1. Fix DTC unit name warnings
> 2. Fix the problem of maintainers
> 3. Call drmm_mode_config_init to mode config init
> 4. Embed drm_device in sprd_drm and use devm_drm_dev_alloc
> 5. Replace DRM_XXX with drm_xxx on KMS module, but not suitable for other=
 subsystems
> 6. Remove plane_update stuff, dpu handles all the HW update in crtc->atom=
ic_flush
> 7. Dsi&Dphy Code structure adjustment, all move to "sprd/"
>
> v0:
> 1. Remove dpu_core_ops stuff layer for sprd drtc driver, but dpu_layer ne=
ed to keeping.
>    Because all the HW update in crtc->atomic_flush, we need temporary sto=
rage all layers for
>    the dpu pageflip of atomic_flush.
> 2. Add ports subnode with port@X.
>
> v1:
> 1. Remove dphy and dsi graph binding, merge the dphy driver into the dsi.
> 2. Add commit messages for Unisoc's virtual nodes.
>
> v2:
> 1. Use drm_xxx to replace all DRM_XXX.
> 2. Use kzalloc to replace devm_kzalloc for sprd_dsi/sprd_dpu structure in=
it.
> 3. Remove dpu_core_ops midlayer.
>
> v3:
> 1. Remove dpu_layer midlayer and commit layers by aotmic_update
>
> v4:
> 1. Move the devm_drm_dev_alloc to master_ops->bind function.
> 2. The managed drmm_mode_config_init() it is no longer necessary for driv=
ers to explicitly call drm_mode_config_cleanup, so delete it.
> 3. Use drmm_helpers to allocate crtc ,planes and encoder.
> 4. Move allocate crtc ,planes, encoder to bind funtion.
> 5. Move rotation enum definitions to crtc layer reg bitfields.
>
> v5:
> 1. Remove subdir-ccflgas-y for Makefile.
> 2. Keep the selects sorted by alphabet for Kconfig.
> 3. Fix the checkpatch warnings.
> 4. Use mode_set_nofb instead of mode_valid callback.
> 5. Follow the OF-Graph bindings, use of_graph_get_port_by_id instead of o=
f_parse_phandle.
> 6. Use zpos to represent the layer position.
> 7. Rebase to last drm misc branch.
> 8. Remove panel_in port for dsi node.
> 9. Drop the dsi ip file prefix.
> 10. Add Signed-off-by for dsi&dphy patch.
> 11. Use the mode_flags of mipi_dsi_device to setup crtc DPI and EDPI mode=
.
>
> v6:
> 1. Disable and clear interrupts before register dpu IRQ
> 2. Init dpi config used by crtc_state->adjusted_mode on mode_set_nofb
> 3. Remove enable_irq and disable_irq function call.
> 4. Remove drm_format_info function call.
> 5. Redesign the way to access the dsi register.
> 6. Reduce the dsi_context member variables.
>
> v7:
> 1. Fix codeing style issue by checkpatch.
> 2. Drop the pll registers structure define.
> 3. Use bridge API instead of drm panel API.
> 4. Register mipi_dsi_host on probe phase;
> 5. Remove iommu error interrupt handling function.
> 6. Remove some unused function.
>
> v8:
> 1. Fix missing signed-off-by.
> 2. Move component_add to dsi_host.attach callback.
>
> Kevin Tang (6):
>   dt-bindings: display: add Unisoc's drm master bindings
>   drm/sprd: add Unisoc's drm kms master
>   dt-bindings: display: add Unisoc's dpu bindings
>   drm/sprd: add Unisoc's drm display controller driver
>   dt-bindings: display: add Unisoc's mipi dsi controller bindings
>   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
>
>  .../display/sprd/sprd,display-subsystem.yaml  |   64 +
>  .../display/sprd/sprd,sharkl3-dpu.yaml        |   77 ++
>  .../display/sprd/sprd,sharkl3-dsi-host.yaml   |   88 ++
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/sprd/Kconfig                  |   13 +
>  drivers/gpu/drm/sprd/Makefile                 |    8 +
>  drivers/gpu/drm/sprd/megacores_pll.c          |  305 +++++
>  drivers/gpu/drm/sprd/sprd_dpu.c               |  880 ++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.h               |  109 ++
>  drivers/gpu/drm/sprd/sprd_drm.c               |  205 ++++
>  drivers/gpu/drm/sprd/sprd_drm.h               |   19 +
>  drivers/gpu/drm/sprd/sprd_dsi.c               | 1073 +++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dsi.h               |  126 ++
>  14 files changed, 2970 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,d=
isplay-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,s=
harkl3-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,s=
harkl3-dsi-host.yaml
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
>
> --
> 2.29.0
>
