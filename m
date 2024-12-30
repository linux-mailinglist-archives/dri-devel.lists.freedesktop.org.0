Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F12B9FE79D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 16:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0C110E512;
	Mon, 30 Dec 2024 15:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AHpkRoJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CF910E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 15:34:57 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso9316553e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 07:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735572835; x=1736177635; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l0dkeZElZUicBQg7Gm/aUyjLuaRRrfkZ91W2XoQW7Po=;
 b=AHpkRoJ7zo9wS4bhRNneSg0WW55/Biq7DoMhuE0G3NO8ThD88XXXKsS38C969c3v0y
 E10OKpQBD0ZI74ebITGrKrX3f/rIG+Ea1G2h4nfA0jVyaYiTLJo3qq+Id0Jd59kWqGgw
 bHjwAj0MvkKEIQUYKcQrhxuNzhGh7xiMXuH/ov3qibjyy2yj9TfJrCp9AcxXShETFvkD
 L8VjTasdLnF6EUf2JGk7ZoeDazaclmd9nrPyLHTfUa1zk4GzBrUpUfBEw8ybCzLZMfsK
 Ykbt4fwFGzeawoKxcAjEEWwVtMCc3qBeGFoJsZbckt2ouVr3x+om+Et0N3EFvN2nAwVQ
 gunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735572835; x=1736177635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0dkeZElZUicBQg7Gm/aUyjLuaRRrfkZ91W2XoQW7Po=;
 b=OiHYRm+FBSk+7/UbvSHUlfx12KZ8E9333z5IqsxnhCAJzXJvnuKQfXrmhkmuTgy81w
 vMt8vPs0zoVk2tiSqVULPgKmfrKRP1/ry5En//Dtk1K1gRT4ZeKoUxRmOvJhFGDctbHh
 b5sENfmZ3TdJF7Z6kZHMsGw8LDiFHpQ3+PitYk9ZLkhPqQlD5m9ZKlJv2obgLGV5Wbw/
 lWsGGHuvoD3OSo04gpys8bi9/q/otzgGE8+UBU+crdq+YagSqAbEmyyFYcEjKZTKu6S+
 L7egntTuK6VtR2sCiwV8UQk3A14GN49/wPVDvakFfS/8RFesoe1TKonjgCZe+f2SwxZh
 s+3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8jBPNekXI/MNLonxZOx5ajMLmceJ148M1vv2ZBB8oLQo62l9SRwaaDh+BfgBAjOyNkGk1xNVLn6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxD4S7i/uTsxT1fHFLRzSdb2LTcH/UrbKCypfTXioZTN/cQGKc
 os2R20WCXgrTBLXAhwuEaBfH9IfCZndle+W04SIcWjRu8NN+zJnSgLlMFpo5O4M=
X-Gm-Gg: ASbGnctQnpwZOX0sbjNOfC6yT6LcoHIeey6h7q8XwMrXD4kyKSCxYsN8DLLXRW+rSKJ
 rHoOc658QN4sDOP39MMKXwGqMj6jKNQQMUheZEQy9+F8Q/CcfeE3JhsuX2hw6IKQW0sesRssrdj
 GEqO1LOb8CX2T6glovDob4wH40MjlEWy2TfJ4tGB1E2OSojwwc0aoK9ZKN8vExfy4S00D544Flx
 zVGHNDLP/2LsBQzzJUlBxA177TzX/TUhScxyQOmekHNiseF2fBRU2DLLteiOo+rKY/Y/TtARwJ8
 MP3LkB95gS5zw7DUDpj0DcwKcpz2kXRKrXmk
X-Google-Smtp-Source: AGHT+IHWzmJ912FHCUA83eSQHoOTi6PSr8/8B5XyzBTURUdEry17XcgKS2WSqmKyADDiAJ6AQblaFw==
X-Received: by 2002:a05:6512:4407:b0:542:29a9:4098 with SMTP id
 2adb3069b0e04-54229a940b4mr9356373e87.5.1735572835196; 
 Mon, 30 Dec 2024 07:33:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm3185240e87.43.2024.12.30.07.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 07:33:54 -0800 (PST)
Date: Mon, 30 Dec 2024 17:33:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 drm-dp 0/5] Add dp module in hibmc driver
Message-ID: <muieolurswxzxevlqgnsftev5mlztopsqze3jhdf32lz4h2hhm@zxfnenjknwav>
References: <20241213060229.1191037-1-shiyongbang@huawei.com>
 <046b010c-d40b-42c8-b701-4570b7a536eb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <046b010c-d40b-42c8-b701-4570b7a536eb@huawei.com>
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

On Thu, Dec 19, 2024 at 10:52:32AM +0800, Yongbang Shi wrote:
> Does everyone have a question with the patch?

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'reg_value' - possible side-effects?
#225: FILE: drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:23:
+#define dp_field_modify(reg_value, mask, val)				\
+	do {								\
+		(reg_value) &= ~(mask);					\
+		(reg_value) |= FIELD_PREP(mask, val);			\
+	} while (0)							\
+

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask' - possible side-effects?
#225: FILE: drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:23:
+#define dp_field_modify(reg_value, mask, val)				\
+	do {								\
+		(reg_value) &= ~(mask);					\
+		(reg_value) |= FIELD_PREP(mask, val);			\
+	} while (0)							\
+

-:277: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'

total: 0 errors, 2 warnings, 2 checks, 239 lines checked
1c3faaf4e729 drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
-:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#70: 
new file mode 100644

-:435: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'

total: 0 errors, 2 warnings, 0 checks, 399 lines checked
70bf7b765c82 drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:371: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'

total: 0 errors, 2 warnings, 0 checks, 327 lines checked
24d6be2577d8 drm/hisilicon/hibmc: refactored struct hibmc_drm_private
-:188: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'

total: 0 errors, 1 warnings, 0 checks, 151 lines checked
9a74395d14e2 (HEAD -> drm-misc-next) drm/hisilicon/hibmc: add dp module in hibmc
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

-:219: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'

> 
> 
> > From: baihan li <libaihan@huawei.com>
> > 
> > Realizing the basic display function of DP cable for DP connector
> > displaying. Add DP module in hibmc drm driver, which is for Hisilicon
> > Hibmc SoC which used for Out-of-band management. Blow is the general
> > hardware connection, both the Hibmc and the host CPU are on the same
> > mother board.
> > 
> > +----------+       +----------+      +----- ----+      +----------------+
> > |          | PCIe  |  Hibmc   |      |          |      |                |
> > |host CPU( |<----->| display  |<---->| dp kapi  |<---->| dp aux moduel  |
> > |arm64,x86)|       |subsystem |      |  moduel  |<---->| dp link moduel |
> > +----------+       +----------+      +----------+      +----------------+
> > 
> > ---
> > ChangeLog:
> > v7 -> v8:
> >    - adding DP_AUX_NATIVE_WRITE case in switch statement in hibmc_dp_aux_parse_xfer().
> >    - adding pci_set_master() in hibmc_pci_probe().
> >    v7:https://lore.kernel.org/all/20241209144840.1933265-1-shiyongbang@huawei.com/
> > v6 -> v7:
> >    - deleteing unset fields in struct hibmc_link_cap, suggested by Dmitry Baryshkov.
> >    - using macro instead of constants in hibmc_dp_link_training_configure(), suggested by Dmitry Baryshkov.
> >    - lowercasing hex, suggested by Dmitry Baryshkov.
> >    v6:https://lore.kernel.org/all/20241202131322.1847078-1-shiyongbang@huawei.com/
> > v5 -> v6:
> >    - adding do{} while(0) in macro defination function, suggested by Dmitry Baryshkov.
> >    - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
> >    - adding code comments in hibmc_dp_set_sst(), suggested by Dmitry Baryshkov.
> >    - adding hpd and get_edid comments in the beginning of patch, suggested by Dmitry Baryshkov.
> >    v5:https://lore.kernel.org/all/20241118142805.3326443-1-shiyongbang@huawei.com/
> > v4 -> v5:
> >    - fixing build errors reported by kernel test robot <lkp@intel.com>
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/
> >    v4:https://lore.kernel.org/all/20241112132348.2631150-1-shiyongbang@huawei.com/
> > v3 -> v4:
> >    - retun error codes in  result incorrect branch, suggested by Dmitry Baryshkov.
> >    - replacing all ret= with returns, suggested by Dmitry Baryshkov.
> >    - moving the comment below the judgment statement, suggested by Dmitry Baryshkov.
> >    - moving definations to the source file and clearing headers, suggested by Dmitry Baryshkov.
> >    - reanaming dp_prefix to hibmc_dp_prefix, suggested by Dmitry Baryshkov.
> >    - changing hibmc_dp_reg_write_field to static inline and lock, suggested by Dmitry Baryshkov.
> >    - moving some structs to later patch, suggested by Dmitry Baryshkov.
> >    - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
> >    - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
> >    - deleting meaningless macro, suggested by Dmitry Baryshkov.
> >    - fixing build errors reported by kernel test robot <lkp@intel.com>
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
> >    - changed the type of train_set to array, suggested by Dmitry Baryshkov.
> >    - using actual link rate instead of magic num, suggested by Dmitry Baryshkov.
> >    - deleting hibmc_dp_hw_uninit(), suggested by Dmitry Baryshkov.
> >    - separating hibmc_vdac and hibmc_dp changes into separate patche, suggested by Dmitry Baryshkov.
> >    - static int hibmc_dp_prepare(), suggested by Dmitry Baryshkov.
> >    v3:https://lore.kernel.org/all/20241101105028.2177274-1-shiyongbang@huawei.com/
> > v2 -> v3:
> >    - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
> >    - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
> >    - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
> >    - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
> >    - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
> >    - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
> >    - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
> >    - fix build errors reported by kernel test robot <lkp@intel.com>
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/
> >    v2:https://lore.kernel.org/all/20241022124148.1952761-1-shiyongbang@huawei.com/
> > v1 -> v2:
> >    - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
> >    - using drm dp header files' dp macros instead, suggested by Andy Yan.
> >    - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
> >    - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
> >    - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
> >    - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
> >    - modifying drm_simple_encoder_init function, suggested by Dmitry Baryshkov.
> >    - refactoring struct hibmc_connector, suggested by Dmitry Baryshkov.
> >    - withdrawing the modification in hibmc_kms_init, suggested by Dmitry Baryshkov.
> >    - fix build errors reported by kernel test robot <lkp@intel.com>
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
> >      Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
> >    v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> > ---
> > 
> > baihan li (5):
> >    drm/hisilicon/hibmc: add dp aux in hibmc drivers
> >    drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
> >    drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
> >    drm/hisilicon/hibmc: refactored struct hibmc_drm_private
> >    drm/hisilicon/hibmc: add dp module in hibmc
> > 
> >   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 164 +++++++++
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  63 ++++
> >   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 +
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 220 ++++++++++++
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  28 ++
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 332 ++++++++++++++++++
> >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  76 ++++
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 118 +++++++
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  19 +-
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  41 ++-
> >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  20 +-
> >   13 files changed, 1078 insertions(+), 39 deletions(-)
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> >   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > 

-- 
With best wishes
Dmitry
