Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0380A2DB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 13:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790FB10E2A0;
	Fri,  8 Dec 2023 12:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF6510E2A0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 12:14:29 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d3d5b10197so17415287b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 04:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702037669; x=1702642469; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7gGNt+s/Wcljh/u9YK4wU+D+G5ntA1fSQzHeZZarWtM=;
 b=x56ajwtcQpcajO1RE+hGbbwBo2laUwHgV+oPYUFTxIU/zIA/dVyHLOP4ezN+ejhIfR
 cI/+B1+S7jwqlUDU4khACejAP7e5smt0vynjUbtkCgn8JCNHcQ+WEEWfpGKZkmjrk5dQ
 WIWzybW5rvdy5Z1IK7Kc4GeLZD3FMWzeVdpp3z79nFuJ7/PwvQE2tzqtljzZMHCNZQ2O
 gvKqFLjD+taNjId1PjBjUaucbU1fSeuZaji5z30R3Qyt4t3dKWwnAiPS8GyRv+BWCTS8
 DSgganDkLxWwt0c85Q7QVedd+acaoIXUB+hyTRgToPyRi/Ib7/4LHl6XcpPHTVgtsj8a
 DBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702037669; x=1702642469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7gGNt+s/Wcljh/u9YK4wU+D+G5ntA1fSQzHeZZarWtM=;
 b=d5kfDj1C33OO/A9+GnPcRtzLTC4l9PYiNxJIf2jLJJ6OkbS1GWuzy6RDgj2UhPq1Qu
 sfLKmyKlZ3U5/UsXUoGnA5BowaocCd3JTIgArkBR1rtgCcroRijVCAudFbZTV7Yv4Z4E
 OYqITTZYs9MsO6Y7j0chx9o0KS8c/QwACb+GbAukvuLOC3btTMMxLc8PmCc5Qco44slT
 7zNkjR6hS62M2uMLdbZ+llr86hRCDEBTt4r+/mEj6iEH9JtjJiVaoDLpKGLHdL7GV6Ys
 AzKOLTVNGXL8L9TMyWVFauQywfCBaFGVXe77UF48PSQX4ARcl9ys0UOL5J7nfw151h2T
 cDcg==
X-Gm-Message-State: AOJu0Ywk/emgbJvgKCgPB3VkMQ2ZpFiIM803H8s+FfnUAEo6U7mwaP/J
 PS+syxkbuH5a9uuk6nQfbVAaaiYFfMiKmKyjMidTBA==
X-Google-Smtp-Source: AGHT+IEabkkPGJEeEiYZBOP/cyp3L12B1zqkHMRxDFfTXE847OQg2naABRb1+MKRzipLZfaVIUcyktqNiQ6ZXWamUpQ=
X-Received: by 2002:a81:7e51:0:b0:5cc:e5a5:d951 with SMTP id
 p17-20020a817e51000000b005cce5a5d951mr3670535ywn.45.1702037668797; Fri, 08
 Dec 2023 04:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:14:17 +0200
Message-ID: <CAA8EJpp_ck5HuXYNAY2xdag2D-XODdOhZjA7XQA8PZs7qds_UQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] Add CDM support for MSM writeback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org,
 quic_parellan@quicinc.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
> which among other things has a CSC block that can convert RGB input
> from the DPU to YUV data.

This block is more or less standard between all hw versions. I do not
expect any faults and/or issues with any of the platforms.
From what I can see, from the platforms that we do not support, it is
not available only on sm6115/qcs4290, qcm2290 and sm6375. Can we
please enable it for all the other platforms?

>
> This block can be used with either HDMI, DP or writeback interface.
>
> In this series, lets first add the support for CDM block to be used
> with writeback and then follow-up with support for other interfaces such
> as DP.
>
> This was validated by adding support to pass custom output format to the
> IGT's kms_writeback test-case, specifically only for the output dump
> test-case [1].
>
> The usage for this is:
>
> ./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>
>
> So for NV12, this can be verified with the below command:
>
> ./kms_writeback -d -f NV12
>
> [1] : https://patchwork.freedesktop.org/series/122125/
>
> changes in v2:
>         - rebased on top of current msm-next-lumag
>         - fix commit text of some of the patches
>         - move csc matrices to dpu_hw_util as they span across DPU
>         - move cdm blk define to dpu_hw_catalog as its common across chipsets
>         - remove bit magic in dpu_hw_cdm with relevant defines
>         - use drmm_kzalloc instead of kzalloc/free
>         - protect bind_pingpong_blk with core_rev check
>         - drop setup_csc_data() and setup_cdwn() ops as they
>           are merged into enable()
>         - protect bind_pingpong_blk with core_rev check
>         - drop setup_csc_data() and setup_cdwn() ops as they
>           are merged into enable()
>         - move needs_cdm to topology struct
>         - call update_pending_flush_cdm even when bind_pingpong_blk
>           is not present
>         - drop usage of setup_csc_data() and setup_cdwn() cdm ops
>           as they both have been merged into enable()
>         - drop reduntant hw_cdm and hw_pp checks
>         - drop fb related checks from dpu_encoder::atomic_mode_set()
>         - introduce separate wb2_format arrays for rgb and yuv
>
> Abhinav Kumar (16):
>   drm/msm/dpu: add formats check for writeback encoder
>   drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
>     functionality
>   drm/msm/dpu: fix writeback programming for YUV cases
>   drm/msm/dpu: move csc matrices to dpu_hw_util
>   drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
>   drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
>   drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
>   drm/msm/dpu: add cdm blocks to RM
>   drm/msm/dpu: add support to allocate CDM from RM
>   drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
>   drm/msm/dpu: add support to disable CDM block during encoder cleanup
>   drm/msm/dpu: add an API to setup the CDM block for writeback
>   drm/msm/dpu: plug-in the cdm related bits to writeback setup
>   drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
>   drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
>   drm/msm/dpu: add cdm blocks to dpu snapshot
>
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |   4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   5 +-
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   4 +-
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   5 +-
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  37 +++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 +
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 117 +++++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  47 ++-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 276 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 114 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  35 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  12 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  71 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  39 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  51 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +
>  drivers/gpu/drm/msm/msm_drv.h                 |   2 +
>  25 files changed, 815 insertions(+), 52 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
