Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123918BE8B7
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C85910F660;
	Tue,  7 May 2024 16:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="efwQhAco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3E10F660;
 Tue,  7 May 2024 16:22:32 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a599eedc8eeso762084766b.1; 
 Tue, 07 May 2024 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715098950; x=1715703750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uStDReDZGB5kYcpgJpnvmAa2qAXJsLoR2JEKJxgwv9s=;
 b=efwQhAcoKotg+CZ+r9iB9CaEbtIAJmJwOmLwArDDQtTJ/kizVpP9yFxSBkZ4WudjKd
 Uro7qM8+fL/t6108emVV5HqT9H0AU0U728dsnvKE+7Wynbqo4bpOZEqe513uKu7k46ua
 KvgRPOyZEmTx7HqHFx5zd3+dURvfLiRJNMHSEVCmpzpus2BGU7eFme0WpYdHu47L9UBy
 sE2d4Yq/9vfxc5AjQw8GX2E0WnXmtwngMpFmATIfnBNPQHlpRcDCx4MHk2LNvhUDoQBQ
 kmK6kRSeey5OR3QD4ZTOHwR6AMniVHl4496si6dMLR7tW10e0OF4ulkQ5q8c998Gf9mt
 vSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715098950; x=1715703750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uStDReDZGB5kYcpgJpnvmAa2qAXJsLoR2JEKJxgwv9s=;
 b=IGGf2VGZf84GKKo5QpsdXZzPja9PDfcS/PsyqfjpEGGdWBQQSDyy/k636wA0kTdwHg
 VN4qs6yjyd349ffyMsVcGgxRqqeihR77fpMRLyaLR/EqEQZaZB/PFlixgHWDtMxzqBqk
 oCgP1QggaEhuHMlaFxf3041Pl9Fv8xYldpVIdPlnShtvbV/qhgaHM9ukTKoyCHUe80PB
 bZngE1FlTMLHOThb5ZCup71Ms3g/uodfOpePSLn8w9UjPXIcEv4r3qe438qwuXp27yIk
 MBNecoy8hIvZUQNNdI17vVcJeYlDWu4XTRY60J+nI6ySeN+oPgyDdqUDmX04g0lWbUju
 /WsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3XLCVcnJNTcmDl+5NLZ6bRjKh3Ec9tIourkjZZwGwzKjIaiXNLmxkYWEOWuVMWmw4SNxjMEl1eTwF/Oc1sJTsBC+BktU2Sp0BGJ/v1Vk0
X-Gm-Message-State: AOJu0YxBlNESko7eb7st31QcAzhKzEHav1SZVBOCRuj0iU+1FA6Jo4Qg
 w/SfwJNam9/a61prcWpRGQCYDBINR8pukdSm52MBA+y131WUniYM+Rwlr3wwBNQyS5NYhhJTFP/
 RJMUe8E0FL8FVXj7YDHxhb1KbXgk=
X-Google-Smtp-Source: AGHT+IFIDAuWBnXRsqxU3CPy8/ecIJyL7I/8YUSttyJSDWPuwXIJ2DJ5fUAvXeG5caQpwRuGgDbj4P6huTGF6tjbjtA=
X-Received: by 2002:a50:8d4c:0:b0:56d:f3a7:60e with SMTP id
 4fb4d7f45d1cf-5731d9d0f35mr148380a12.22.1715098950083; Tue, 07 May 2024
 09:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtpw6dNR9JBikFTQ=TCpt-9FeFW+SGjXWv+Jv3emm0Pbg@mail.gmail.com>
In-Reply-To: <CAF6AEGtpw6dNR9JBikFTQ=TCpt-9FeFW+SGjXWv+Jv3emm0Pbg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 May 2024 09:22:17 -0700
Message-ID: <CAF6AEGvTxvuJTbriaLMRztufdSM1VGKXu15WrJuKL9p7DkfcOw@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2024-05-07 for v6.10
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 7, 2024 at 8:40=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> Hi Dave,
>
> This is the main pull for v6.10.  It includes a merge of
> phy_dp_modes_6.10 to pick up DP subnode API, so we can add support to
> configure phy as either DP or eDP depending on hw configuration.
>
> We might have a second late pull req, for a couple patchsets that have
> dependencies on soc/qcom and firmware/qcom:
>
>   https://patchwork.freedesktop.org/series/132065/
>   https://patchwork.freedesktop.org/series/132911/
>
> Further description below

also jfyi, see https://lore.kernel.org/lkml/20240506121308.09de6f33@canb.au=
ug.org.au/t/
for an upcoming merge conflict

BR,
-R

>
> The following changes since commit 3e5a516f3bf1a33f2bf219f570e9b5c031616f=
6a:
>
>   Merge tag 'phy_dp_modes_6.10' into msm-next-lumag (2024-04-08 18:38:16 =
+0300)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-05-07
>
> for you to fetch changes up to b587f413ca47530b41aadc6f6bda6fc76153f77f:
>
>   drm/msm/gen_header: allow skipping the validation (2024-05-07 07:56:40 =
-0700)
>
> ----------------------------------------------------------------
> Updates for v6.10
>
> Core:
> - Switched to generating register header files during build process
>   instead of shipping pre-generated headers
> - Merged DPU and MDP4 format databases.
>
> DP:
> - Stop using compat string to distinguish DP and eDP cases
> - Added support for X Elite platform (X1E80100)
> - Reworked DP aux/audio support
> - Added SM6350 DP to the bindings (no driver changes, using SM8350
>   as a fallback compat)
>
> GPU:
> - a7xx perfcntr reg fixes
> - MAINTAINERS updates
> - a750 devcoredump support
>
> ----------------------------------------------------------------
> Abel Vesa (2):
>       drm/msm/dp: Add support for determining the eDP/DP mode from DT
>       drm/msm/dp: Add support for the X1E80100
>
> Aleksandr Mishin (1):
>       drm/msm/dpu: Add callback function pointer check before its call
>
> Andy Shevchenko (1):
>       drm/msm/hdmi: Replace of_gpio.h by proper one
>
> Bjorn Andersson (7):
>       drm/msm/dp: Remove now unused connector_type from desc
>       drm/msm/dp: Drop unused dp_debug struct
>       drm/msm/dp: Removed fixed nvid "support"
>       drm/msm/dp: Remove unused defines and members
>       drm/msm/dp: Use function arguments for aux writes
>       drm/msm/dp: Use function arguments for timing configuration
>       drm/msm/dp: Use function arguments for audio operations
>
> Connor Abbott (5):
>       drm/msm: Import a750 snapshot registers from kgsl
>       drm/msm: Fix imported a750 snapshot header for upstream
>       drm/msm: Update a6xx registers XML
>       drm/msm: Adjust a7xx GBIF debugbus dumping
>       drm/msm: Add devcoredump support for a750
>
> Dmitry Baryshkov (35):
>       drm/msm/dp: allow voltage swing / pre emphasis of 3
>       drm/msm/dpu: add current resource allocation to dumped state
>       drm/msm/mdp5: add writeback block bases
>       drm/msm/hdmi: drop qfprom.xml.h
>       drm/msm/dsi: drop mmss_cc.xml.h
>       drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
>       drm/msm: remove dependencies from core onto adreno headers
>       drm/msm: import XML display registers database
>       drm/msm: import A2xx-A4xx XML display registers database
>       drm/msm: import A5xx XML display registers database
>       drm/msm: import A6xx XML display registers database
>       drm/msm: import gen_header.py script from Mesa
>       drm/msm: generate headers on the fly
>       drm/msm: drop display-related headers
>       drm/msm: drop A2xx and common headers
>       drm/msm: drop A3xx and A4xx headers
>       drm/msm: drop A5xx header
>       drm/msm: drop A6xx GMU header
>       drm/msm: drop C++ parts of a6xx.xml.h
>       drm/msm: drop A6xx header
>       drm/msm/dsi: remove the drm_bridge_attach fallback
>       drm/msm/dsi: move next bridge acquisition to dsi_bind
>       drm/msm/dsi: simplify connector creation
>       drm/msm/dpu: use format-related definitions from mdp_common.xml.h
>       drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
>       drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
>       drm/msm/dpu: pull format flag definitions to mdp_format.h
>       drm/msm: merge dpu_format and mdp_format in struct msm_format
>       drm/msm: convert msm_format::unpack_tight to the flag
>       drm/msm: convert msm_format::unpack_align_msb to the flag
>       drm/msm: merge dpu format database to MDP formats
>       drm/msm: drop msm_kms_funcs::get_format() callback
>       drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
>       drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
>       drm/msm/gen_header: allow skipping the validation
>
> Douglas Anderson (3):
>       drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connec=
ted
>       drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
>       drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer
>
> Jani Nikula (1):
>       drm/msm: convert all pixel format logging to use %p4cc
>
> Jon Hunter (1):
>       drm/msm: Fix gen_header.py for older python3 versions
>
> Konrad Dybcio (4):
>       drm/msm: Drop msm_read/writel
>       drm/msm/a6xx: Avoid a nullptr dereference when speedbin setting fai=
ls
>       MAINTAINERS: Add a separate entry for Qualcomm Adreno GPU drivers
>       MAINTAINERS: Add Konrad Dybcio as a reviewer for the Adreno driver
>
> Luca Weiss (2):
>       dt-bindings: display: msm: dp-controller: document SM6350 compatibl=
e
>       dt-bindings: display: msm: sm6350-mdss: document DP controller subn=
ode
>
> Marijn Suijten (4):
>       drm/msm/dsi: Print dual-DSI-adjusted pclk instead of original mode =
pclk
>       drm/msm/dpu: Always flush the slave INTF on the CTL
>       drm/msm/dpu: Allow configuring multiple active DSC blocks
>       drm/msm/dpu: Rename `ctx` parameter to `intf` to match other functi=
ons
>
> Rob Clark (1):
>       drm/msm/a6xx: Cleanup indexed regs const'ness
>
> Zan Dobersek (2):
>       drm/msm/a7xx: allow writing to CP_BV counter selection registers
>       drm/msm/adreno: fix CP cycles stat retrieval on a7xx
>
>  .../bindings/display/msm/dp-controller.yaml        |     1 +
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     |     9 +
>  MAINTAINERS                                        |    20 +-
>  drivers/gpu/drm/msm/.gitignore                     |     1 +
>  drivers/gpu/drm/msm/Kconfig                        |     8 +
>  drivers/gpu/drm/msm/Makefile                       |   106 +-
>  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
>  .../drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} |    45 +-
>  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
>  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------=
------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |     2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    12 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    15 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |     4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    83 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    14 +-
>  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
>  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  1446 +++
>  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    24 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     3 -
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     8 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   660 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |    25 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |     6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |     4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |     9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |     4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |     2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   124 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    40 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |     6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |    14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |     4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    22 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |     2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    13 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |     2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    91 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    56 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |     8 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |     4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |     1 -
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |     4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   129 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |     7 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |     1 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |     4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   125 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |     4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |     2 +-
>  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
>  drivers/gpu/drm/msm/disp/mdp_format.c              |   630 +-
>  drivers/gpu/drm/msm/disp/mdp_format.h              |    77 +
>  drivers/gpu/drm/msm/disp/mdp_kms.h                 |    18 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |    25 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |    39 +-
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |     1 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |    71 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |    52 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    23 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |     1 -
>  drivers/gpu/drm/msm/dp/dp_debug.c                  |    59 +-
>  drivers/gpu/drm/msm/dp/dp_debug.h                  |    38 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |   101 +-
>  drivers/gpu/drm/msm/dp/dp_display.h                |     3 -
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |     2 -
>  drivers/gpu/drm/msm/dp/dp_link.c                   |    26 +-
>  drivers/gpu/drm/msm/dp/dp_link.h                   |    15 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |    14 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |     3 -
>  drivers/gpu/drm/msm/dsi/dsi.c                      |    26 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                      |     7 +-
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |    20 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |    79 +-
>  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
>  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     8 +-
>  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
>  drivers/gpu/drm/msm/hdmi/hdmi.c                    |     2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.h                    |    10 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |     6 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |     4 +-
>  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
>  drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
>  drivers/gpu/drm/msm/msm_drv.h                      |    11 +-
>  drivers/gpu/drm/msm/msm_fb.c                       |    12 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |    12 +-
>  drivers/gpu/drm/msm/msm_kms.h                      |     4 -
>  drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
>  drivers/gpu/drm/msm/registers/.gitignore           |     4 +
>  drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
>  drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
>  drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  5011 ++++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |   400 +
>  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2268 ++++
>  drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
>  .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
>  .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
>  .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
>  .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
>  .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
>  drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
>  drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
>  drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
>  drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
>  .../gpu/drm/msm/registers/display/mdp_common.xml   |    90 +
>  drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
>  drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
>  .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
>  drivers/gpu/drm/msm/registers/gen_header.py        |   970 ++
>  drivers/gpu/drm/msm/registers/rules-fd.xsd         |   404 +
>  136 files changed, 25360 insertions(+), 41401 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/.gitignore
>  delete mode 100644 drivers/gpu/drm/msm/adreno/a2xx.xml.h
>  rename drivers/gpu/drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} (67%=
)
>  delete mode 100644 drivers/gpu/drm/msm/adreno/a3xx.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/adreno/a4xx.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/adreno/a5xx.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/adreno/a6xx.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/adreno/adreno_common.xml.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
>  delete mode 100644 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/disp/mdp_common.xml.h
>  create mode 100644 drivers/gpu/drm/msm/disp/mdp_format.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/dsi/sfpb.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/hdmi/qfprom.xml.h
>  create mode 100644 drivers/gpu/drm/msm/registers/.gitignore
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a3xx.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a4xx.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/adreno_common.xm=
l
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_10nm.xm=
l
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_14nm.xm=
l
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_20nm.xm=
l
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_28nm.xm=
l
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_28nm_89=
60.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/edp.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/hdmi.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/mdp4.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/mdp5.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/mdp_common.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/msm.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/display/sfpb.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/freedreno_copyright.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/gen_header.py
>  create mode 100644 drivers/gpu/drm/msm/registers/rules-fd.xsd
