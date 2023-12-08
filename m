Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8E80AE42
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81E910EB31;
	Fri,  8 Dec 2023 20:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F2110EB31
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 20:50:00 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d3758fdd2eso24802007b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 12:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702068599; x=1702673399; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6KhpakefNMt7z+9BVAO0Im1k8nsN5/mcfjnb1F4h20w=;
 b=EYkQ/nI2kvkels9p7Y/l+v11iqzxd/0yLwP8kNlRD1UAMKNds7lu9KQjl7HZVnO3kp
 iqtxwBFEKPlpoTPahejAJH3bxyI4wde4PCxypwr17vYfGYNRjlv5uVfbIYs9/L/IUycP
 mU1VYi2SPd1y6VWXa2f0wrF86iRTg71d+N5ZhEtAQD5ePh0UdHw9spb4ntv+A6U1tHKG
 0vjGQDRNRnbAnEVAzK7YhQt3QeeLrFvxwKF86h8CC2QTwDz38cAmwv7k0E97Itn2sQpS
 t9f+lQO7pl2FRevSeJpJVpaUPEEoUpax8KwTPOYCvYCVNQZ4oKSQcbx+y8bHo6uzBhYD
 Ht2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702068599; x=1702673399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KhpakefNMt7z+9BVAO0Im1k8nsN5/mcfjnb1F4h20w=;
 b=NcmBkjmID3I2OhqWlZG+vErvn7cjSWcbutsuc4IC71/hns9b6/J2ysYhEvkuVaQNaE
 cBZwZLzzPFeu0wM95AA0YojIj8hq1xOr3vvGUK88RxVbVmKhrIHRxN+V2sPJZsLlomia
 KDn1fLnVJP0FA33b4n6zVLu3PGGSUhP8kNNpUuv6yfXvW3XwID1iE1cfzBIALsME99sR
 Ui2PaNuuqMLERlUEWIBq8dWPvkfgdp17Zs7u2917Cq5X0IljSGV9JxFvtswzc8BIVZU8
 0sJj3XDOyDQzKRSG6m1BxWk9TPXe+ivVgEj9A5vNEHVchG5Mv/Eqlh2OoPt9D8k+dgUk
 /X9A==
X-Gm-Message-State: AOJu0YxF9YQBExoG1tz8DY6B+YNReHUdvkn0KpJ5uqs4AAtyiwSkSInb
 ygZVOnWgDi2PL4kxOZDmNSdmLuE0Qz7feNyEKaO42w==
X-Google-Smtp-Source: AGHT+IGGg8efJmcnYIDxepEIOIyB69HWxV9ew1unXR0R+9LAJuJRCUSt74GHcVKCpdp55Q6uYKwc/yzLP1MU6Z5yhjo=
X-Received: by 2002:a81:5cc2:0:b0:5d7:1941:3577 with SMTP id
 q185-20020a815cc2000000b005d719413577mr578647ywb.94.1702068599164; Fri, 08
 Dec 2023 12:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp_ck5HuXYNAY2xdag2D-XODdOhZjA7XQA8PZs7qds_UQ@mail.gmail.com>
 <68685494-b45c-9065-19d4-0084eb481352@quicinc.com>
In-Reply-To: <68685494-b45c-9065-19d4-0084eb481352@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 22:49:48 +0200
Message-ID: <CAA8EJpp689K12uqwBYu7EbjG6+MdJbH_ABS0hecz2QoMN-Hxzw@mail.gmail.com>
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

On Fri, 8 Dec 2023 at 19:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 4:14 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
> >> which among other things has a CSC block that can convert RGB input
> >> from the DPU to YUV data.
> >
> > This block is more or less standard between all hw versions. I do not
> > expect any faults and/or issues with any of the platforms.
> >  From what I can see, from the platforms that we do not support, it is
> > not available only on sm6115/qcs4290, qcm2290 and sm6375. Can we
> > please enable it for all the other platforms?
> >
>
> Its just a validation criteria. I have only enabled it on devices which
> I have tested on and do not want to take responsibilty of the bugs
> reported on untested chipsets.
>
> I am open to the approach of publishing a follow-up RFT for the other
> devices like you did for WB on some of the chipsets.

Sure, why not. We will be able to test it on most of the high-end platforms.
Maybe after validating it on the majority of the platforms, we can
enable it on the rest of the platforms 'by extension'. I mean, unlike
WB or VIG blocks I don't see drastic changes for CDM.

>
> >>
> >> This block can be used with either HDMI, DP or writeback interface.
> >>
> >> In this series, lets first add the support for CDM block to be used
> >> with writeback and then follow-up with support for other interfaces such
> >> as DP.
> >>
> >> This was validated by adding support to pass custom output format to the
> >> IGT's kms_writeback test-case, specifically only for the output dump
> >> test-case [1].
> >>
> >> The usage for this is:
> >>
> >> ./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>
> >>
> >> So for NV12, this can be verified with the below command:
> >>
> >> ./kms_writeback -d -f NV12
> >>
> >> [1] : https://patchwork.freedesktop.org/series/122125/
> >>
> >> changes in v2:
> >>          - rebased on top of current msm-next-lumag
> >>          - fix commit text of some of the patches
> >>          - move csc matrices to dpu_hw_util as they span across DPU
> >>          - move cdm blk define to dpu_hw_catalog as its common across chipsets
> >>          - remove bit magic in dpu_hw_cdm with relevant defines
> >>          - use drmm_kzalloc instead of kzalloc/free
> >>          - protect bind_pingpong_blk with core_rev check
> >>          - drop setup_csc_data() and setup_cdwn() ops as they
> >>            are merged into enable()
> >>          - protect bind_pingpong_blk with core_rev check
> >>          - drop setup_csc_data() and setup_cdwn() ops as they
> >>            are merged into enable()
> >>          - move needs_cdm to topology struct
> >>          - call update_pending_flush_cdm even when bind_pingpong_blk
> >>            is not present
> >>          - drop usage of setup_csc_data() and setup_cdwn() cdm ops
> >>            as they both have been merged into enable()
> >>          - drop reduntant hw_cdm and hw_pp checks
> >>          - drop fb related checks from dpu_encoder::atomic_mode_set()
> >>          - introduce separate wb2_format arrays for rgb and yuv
> >>
> >> Abhinav Kumar (16):
> >>    drm/msm/dpu: add formats check for writeback encoder
> >>    drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
> >>      functionality
> >>    drm/msm/dpu: fix writeback programming for YUV cases
> >>    drm/msm/dpu: move csc matrices to dpu_hw_util
> >>    drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
> >>    drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
> >>    drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
> >>    drm/msm/dpu: add cdm blocks to RM
> >>    drm/msm/dpu: add support to allocate CDM from RM
> >>    drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
> >>    drm/msm/dpu: add support to disable CDM block during encoder cleanup
> >>    drm/msm/dpu: add an API to setup the CDM block for writeback
> >>    drm/msm/dpu: plug-in the cdm related bits to writeback setup
> >>    drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
> >>    drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
> >>    drm/msm/dpu: add cdm blocks to dpu snapshot
> >>
> >>   drivers/gpu/drm/msm/Makefile                  |   1 +
> >>   .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |   4 +-
> >>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   5 +-
> >>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   4 +-
> >>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   5 +-
> >>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |   4 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  37 +++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 +
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 117 +++++++-
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  47 ++-
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 276 ++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 114 ++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  35 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  12 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  71 +++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   8 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  39 +--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  51 +++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +
> >>   drivers/gpu/drm/msm/msm_drv.h                 |   2 +
> >>   25 files changed, 815 insertions(+), 52 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

-- 
With best wishes
Dmitry
