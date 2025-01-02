Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11C9FFEA3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 19:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5CF10E777;
	Thu,  2 Jan 2025 18:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uCU1vl6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029E810E22B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 18:40:47 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3a9cb8460f7so86867885ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735843187; x=1736447987; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hjk/M72EdwTYg4Zy8ycvuwHpCYWZ5L1FAim6sGjk5/Y=;
 b=uCU1vl6SITTcthNP2DFMJEYQio9lL88FXAcxt3ei2RAEc8ACbFwZnNI/z5JFdhiipH
 WP+F4a74bu4+4ooXIzG+fx43Hy7hGZJRaXPKgKcniNk0xP5TZMijHoeOhnbKRTHg4IvD
 tRz/PI9gIlkElGRSzkL4NxHSQA5vZvEEB9Up1PUTweKsj4X0IEpHkTG8DM44L97t9e4M
 1s0+hDh51ORLil524hS/4fz6WRb3As05VwpYA+kxSS+lHdmgqmnpLKS5rSxpheJpQyyr
 CFll0hvX/sHRI4HISQV5Y9fwFRvF4ILRjrRO4fKeb5mWVIOB+trza4EXJBb+5Szd9Tpt
 t64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735843187; x=1736447987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hjk/M72EdwTYg4Zy8ycvuwHpCYWZ5L1FAim6sGjk5/Y=;
 b=O4MMVB/lMdpC9/2EoB7WK01LXKMlgJi5Sr+CvH+dWnh4gZoU56nuU4e8zHuS5Rc9SL
 vNNv3yGecoZscjPaRLtEdPAUT688SojU4L2D3al2s6cClKTdKT4/IGB1yxve4eO9Ppmh
 W+xeK+7Fmtu0P5E923PDsEi0Wmn2cYlw53e+hz/RkZ/TF7zCuTJVg2L/lJxEs+i5vxqs
 VRo3+V2f4WM3z7IK0/Xg94nprhFc3KGZCIZY0WoDasJiW3OTGiYUVn+cKC/qtON6Uutf
 60CpLWnEUaBN04joJxXvI9M9v/9YUVOzQWFtdiLftSlsRUrxeBTLQy01Dk3muQLHfLM5
 VTzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu2GTnjp6Ib/QcxRlH47sogJ6CJZriMJ96ulNE269xih+YjmIOi68wi4hu4g+YQ08XZQG0QrHPQ+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfacahREBWS192ZkpZhgcB/PQUmlh99fVXiPrlmvtO6zd0pW1h
 vN+f7NUzPff3kYuMOFIj8iFuTGXwd3AHSqKaSrsTaKJ/1LRyRYSly0ehO+FjRLC5XN1Vk6Ln2Hq
 0Bc+Az1xgg/YVtgrGJ8sKn21+reGpYX1E6gaJ6xJivAm/K3VL
X-Gm-Gg: ASbGncu50eJI9jGB+DmcoYHsa1fpiVN5oudz7n4xzkFoloS+dwZ8DjnwfOIqJT1dYAe
 w4a2vmZFq1FHSx7B5+XMHLFZdAIEvCUyIUQet9rZaz+PYFkQeka39
X-Google-Smtp-Source: AGHT+IEv0ordAbN/yMl+GUtAkp67fXqgqP0RHKNc9O+xma8wAPb3tLcQFTQ8qhO+WUp9cPDHRiLKXmbudVDuZOqumA0=
X-Received: by 2002:a05:690c:650a:b0:6ea:ef9d:fcba with SMTP id
 00721157ae682-6f3f80d5f3fmr348344897b3.6.1735841465768; Thu, 02 Jan 2025
 10:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20241213060229.1191037-1-shiyongbang@huawei.com>
 <046b010c-d40b-42c8-b701-4570b7a536eb@huawei.com>
 <muieolurswxzxevlqgnsftev5mlztopsqze3jhdf32lz4h2hhm@zxfnenjknwav>
 <0e862c4f-a383-4381-8883-3e28d4e254e7@huawei.com>
In-Reply-To: <0e862c4f-a383-4381-8883-3e28d4e254e7@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jan 2025 20:10:55 +0200
Message-ID: <CAA8EJpqbRpDGeXYvdM2t+X=dF3N-TtmBvO7eyWhQ0CtTwy9ZbQ@mail.gmail.com>
Subject: Re: [PATCH v8 drm-dp 0/5] Add dp module in hibmc driver
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, 
 liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com, 
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jan 2025 at 14:53, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
> > On Thu, Dec 19, 2024 at 10:52:32AM +0800, Yongbang Shi wrote:
> >> Does everyone have a question with the patch?
> > -:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'reg_value' - possible side-effects?
> > #225: FILE: drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:23:
> > +#define dp_field_modify(reg_value, mask, val)                                \
> > +     do {                                                            \
> > +             (reg_value) &= ~(mask);                                 \
> > +             (reg_value) |= FIELD_PREP(mask, val);                   \
> > +     } while (0)                                                     \
> > +
> >
> > -:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask' - possible side-effects?
> > #225: FILE: drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:23:
> > +#define dp_field_modify(reg_value, mask, val)                                \
> > +     do {                                                            \
> > +             (reg_value) &= ~(mask);                                 \
> > +             (reg_value) |= FIELD_PREP(mask, val);                   \
> > +     } while (0)                                                     \
> > +
>
> Hi Dmitry,
> Thanks for your reminding. For this point, we have to use two variables(mask, reg_value) twice here.
> I tried to another way that static inline functions, but there are build errors. So the only way is like this.
> After reviewed all references, we have a review session about it, and we think it's acceptable and relatively safe.
>   (like we won't use varible with post/pre-increment operator)
> If you have a better way to realize this, plz tell me. Appreciate!

Well, there is an obvious way:

do {
  u32 __mask = (mask);
  (reg_value) &= ~__mask;
  (reg_value) |= FIELD_PREP(__mask, (val));
} while (0)

But I don't really think that it makes sense to change. It's a
check-level, not a warning. The next one is important.

>
>
> > -:277: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
> >
> > total: 0 errors, 2 warnings, 2 checks, 239 lines checked
> > 1c3faaf4e729 drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
> > -:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #70:
> > new file mode 100644
> >
> > -:435: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
> >
> > total: 0 errors, 2 warnings, 0 checks, 399 lines checked
> > 70bf7b765c82 drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
> > -:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #28:
> > new file mode 100644
> >
> > -:371: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
> >
> > total: 0 errors, 2 warnings, 0 checks, 327 lines checked
> > 24d6be2577d8 drm/hisilicon/hibmc: refactored struct hibmc_drm_private
> > -:188: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
> >
> > total: 0 errors, 1 warnings, 0 checks, 151 lines checked
> > 9a74395d14e2 (HEAD -> drm-misc-next) drm/hisilicon/hibmc: add dp module in hibmc
> > -:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #30:
> > new file mode 100644
> >
> > -:219: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
>
> We already have maintainers for our hibmc-drm module, so there is no need add maintainers in each new file.

Please read carefully. Those warnings are about sign-off mismatches.
You can ignore the maintainers entry.

>
> Thanks ,
> Baihan Li
>
>
> >>
> >>> From: baihan li <libaihan@huawei.com>
> >>>
> >>> Realizing the basic display function of DP cable for DP connector
> >>> displaying. Add DP module in hibmc drm driver, which is for Hisilicon
> >>> Hibmc SoC which used for Out-of-band management. Blow is the general
> >>> hardware connection, both the Hibmc and the host CPU are on the same
> >>> mother board.
> >>>
> >>> +----------+       +----------+      +----- ----+      +----------------+
> >>> |          | PCIe  |  Hibmc   |      |          |      |                |
> >>> |host CPU( |<----->| display  |<---->| dp kapi  |<---->| dp aux moduel  |
> >>> |arm64,x86)|       |subsystem |      |  moduel  |<---->| dp link moduel |
> >>> +----------+       +----------+      +----------+      +----------------+
> >>>
> >>> ---
> >>> ChangeLog:
> >>> v7 -> v8:
> >>>     - adding DP_AUX_NATIVE_WRITE case in switch statement in hibmc_dp_aux_parse_xfer().
> >>>     - adding pci_set_master() in hibmc_pci_probe().
> >>>     v7:https://lore.kernel.org/all/20241209144840.1933265-1-shiyongbang@huawei.com/
> >>> v6 -> v7:
> >>>     - deleteing unset fields in struct hibmc_link_cap, suggested by Dmitry Baryshkov.
> >>>     - using macro instead of constants in hibmc_dp_link_training_configure(), suggested by Dmitry Baryshkov.
> >>>     - lowercasing hex, suggested by Dmitry Baryshkov.
> >>>     v6:https://lore.kernel.org/all/20241202131322.1847078-1-shiyongbang@huawei.com/
> >>> v5 -> v6:
> >>>     - adding do{} while(0) in macro defination function, suggested by Dmitry Baryshkov.
> >>>     - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
> >>>     - adding code comments in hibmc_dp_set_sst(), suggested by Dmitry Baryshkov.
> >>>     - adding hpd and get_edid comments in the beginning of patch, suggested by Dmitry Baryshkov.
> >>>     v5:https://lore.kernel.org/all/20241118142805.3326443-1-shiyongbang@huawei.com/
> >>> v4 -> v5:
> >>>     - fixing build errors reported by kernel test robot <lkp@intel.com>
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/
> >>>     v4:https://lore.kernel.org/all/20241112132348.2631150-1-shiyongbang@huawei.com/
> >>> v3 -> v4:
> >>>     - retun error codes in  result incorrect branch, suggested by Dmitry Baryshkov.
> >>>     - replacing all ret= with returns, suggested by Dmitry Baryshkov.
> >>>     - moving the comment below the judgment statement, suggested by Dmitry Baryshkov.
> >>>     - moving definations to the source file and clearing headers, suggested by Dmitry Baryshkov.
> >>>     - reanaming dp_prefix to hibmc_dp_prefix, suggested by Dmitry Baryshkov.
> >>>     - changing hibmc_dp_reg_write_field to static inline and lock, suggested by Dmitry Baryshkov.
> >>>     - moving some structs to later patch, suggested by Dmitry Baryshkov.
> >>>     - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
> >>>     - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
> >>>     - deleting meaningless macro, suggested by Dmitry Baryshkov.
> >>>     - fixing build errors reported by kernel test robot <lkp@intel.com>
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
> >>>     - changed the type of train_set to array, suggested by Dmitry Baryshkov.
> >>>     - using actual link rate instead of magic num, suggested by Dmitry Baryshkov.
> >>>     - deleting hibmc_dp_hw_uninit(), suggested by Dmitry Baryshkov.
> >>>     - separating hibmc_vdac and hibmc_dp changes into separate patche, suggested by Dmitry Baryshkov.
> >>>     - static int hibmc_dp_prepare(), suggested by Dmitry Baryshkov.
> >>>     v3:https://lore.kernel.org/all/20241101105028.2177274-1-shiyongbang@huawei.com/
> >>> v2 -> v3:
> >>>     - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
> >>>     - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
> >>>     - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
> >>>     - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
> >>>     - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
> >>>     - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
> >>>     - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
> >>>     - fix build errors reported by kernel test robot <lkp@intel.com>
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/
> >>>     v2:https://lore.kernel.org/all/20241022124148.1952761-1-shiyongbang@huawei.com/
> >>> v1 -> v2:
> >>>     - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
> >>>     - using drm dp header files' dp macros instead, suggested by Andy Yan.
> >>>     - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
> >>>     - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
> >>>     - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
> >>>     - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
> >>>     - modifying drm_simple_encoder_init function, suggested by Dmitry Baryshkov.
> >>>     - refactoring struct hibmc_connector, suggested by Dmitry Baryshkov.
> >>>     - withdrawing the modification in hibmc_kms_init, suggested by Dmitry Baryshkov.
> >>>     - fix build errors reported by kernel test robot <lkp@intel.com>
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
> >>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
> >>>     v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> >>> ---
> >>>
> >>> baihan li (5):
> >>>     drm/hisilicon/hibmc: add dp aux in hibmc drivers
> >>>     drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
> >>>     drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
> >>>     drm/hisilicon/hibmc: refactored struct hibmc_drm_private
> >>>     drm/hisilicon/hibmc: add dp module in hibmc
> >>>
> >>>    drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
> >>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 164 +++++++++
> >>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  63 ++++
> >>>    .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 +
> >>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 220 ++++++++++++
> >>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  28 ++
> >>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 332 ++++++++++++++++++
> >>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  76 ++++
> >>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 118 +++++++
> >>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +
> >>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  19 +-
> >>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  41 ++-
> >>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  20 +-
> >>>    13 files changed, 1078 insertions(+), 39 deletions(-)
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> >>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> >>>



-- 
With best wishes
Dmitry
