Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFAA04189
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725FE10E316;
	Tue,  7 Jan 2025 14:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jb7IjqsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB3310E316
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:04:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-435b0df5dbdso48665e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736258602; x=1736863402;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
 b=jb7IjqsNsPcoNRVOfn9opxLiF33R8QIifmHq0BFkqrAM1z5TizZ++jGY1eocgi9iPy
 2eO2NssDCYCi0xDB5CdXVo/bddYbktYXWbv7PUeU5byM+MtXFXNhLF4XLVF1SZn6LUp5
 xKNKYorDLW957H4PGuhtMLYevKHKl73e+ujD14n6mjn/ytypeEoDb4uVzCGvXyN1/+Tw
 ppafojxPFnl1PsnJqKU3BVYYy0kn8PtAJq2qoeEmiVmALs7qdgJniUhj9t2vzk2LEVpS
 xExcOD5IBGIMOmzJom83OUPDrD7yOUYFXRTRS+7DLQ9cMVQhGX3yH8jQBJFB8QX8HHaD
 Fn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736258602; x=1736863402;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
 b=WQcemOm2z2wBXWcMo2ONrJ4XSvpmsVX58WFAKYTkV+2NHBJ2r/iPx7Ujcqc5+qtayV
 gBjkYGMLVVOiPbDieNkQ9ifgT7uyrUFNhP7baxfT16pdYKbuMfWkXAPVyY4gD0khmk04
 +73F4blYjjyDOso2371EjBF2e6aCcSDzbW3gAWKAb9vfP4nQsmho5QoSaZWqCPx2i5wn
 lv+kPse5JJbLcVQxZ3+05s+bIfWYe/rRjG+hjN2QQ1ziG2g6Isq4GeIIVghFGbTd2ic7
 wlcOarOhInZWaKCzbWvkirMKc6Dx/Lf+XYvl3G+1eYq8oMBBfHY4gxRvxw+7NlUvkO4V
 LZlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvNTnEBq6EMrs3TcFVLqSgTVbcnnM7q08Zu94Ab1dHpop7QEjcbul95lv/Y7ODZ8s+jL2KaZpl2Y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMbOREDV0GXa7I01LyHeBVtr243pj/ZLRswGTraGlfuTICXlyl
 sFprYX5k8nasvIlz3BaH+hFnXEVbPi89Ve56zehyIbFpoC4RoH9ZZAmCbBYj2w==
X-Gm-Gg: ASbGncu6wTWaBDEI+IrSup7+fyPmZo3O9YPyFHAGzQZvSmpUri4UOCTvip9QAsx46js
 Bg511QeE5zprzVUOgTjW8ennRxV6kEnZY8PKcTLXDOa0X58LpSG/4ZqcOVgd5kncyoOhzFB5sYV
 +OkP9rOrG0GBRM3MDsigzlS1rfJvdLkxgg4tNhILmcy100MFoP5/qh1y7gMnXVTsOO4ajhK7xcS
 sKrw7yqyb3z2uw4hN17+ONxEhWsjnSglqofE2EFmNbECz0DHG2OiQxuhZ/dK7To00/Byi1i0mjh
 EfP9YfQ8Fp5c/HI0Tog=
X-Google-Smtp-Source: AGHT+IGshgYKYU49AS8Yt3DzTbm9jzfDb1zOfiYsDlqWPz/kk/iuG9opzk/qyzVKRNqNypOg626I8w==
X-Received: by 2002:a05:600c:4f8f:b0:434:c967:e4b5 with SMTP id
 5b1f17b1804b1-436dcf7356fmr901395e9.1.1736254559456; 
 Tue, 07 Jan 2025 04:55:59 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a2e25edbbsm42740762f8f.110.2025.01.07.04.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 04:55:58 -0800 (PST)
Date: Tue, 7 Jan 2025 12:55:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <Z30kWxVxwJXO_z2_@google.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
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

Hi Rob,

On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2:  Fix an armv7/32b build error in the last patch
> v3:  Incorperate Will Deacon's suggestion to make the interface
>      callback based.
> v4:  Actually wire up the callback
> v5:  Drop the callback approach
> v6:  Make walk-data struct pgtable specific and rename
>      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8:  Pass pte pointer to callback so it can modify the actual pte
> v9:  Fix selftests_running case
> v10: Call visit cb for all nodes traversed, leave the decision about
>      whether to care about non-leaf nodes to the callback
> v11: Adjust logic in 3/4 [smostafa@]

I see the level initialization was not removed as it was in the diff[1], so it
seems to me that’s redundant as the level is set anyway in the callback, and
actually looking at that I see it’s not used or printed from the driver,
so may it can be removed all together, anyway that’s nit that may be Will can
fix it up while merging.

Otherwise, For the whole series
Reviewed-by: Mostafa Saleh <smostafa@google.com>

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ed3ba47df350..a884af8fb101 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,7 +731,6 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 {
 	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
 	data->ptes[lvl] = *ptep;
-	data->level = lvl + 1;
 	return 0;
 }
 
@@ -746,8 +745,6 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 		.end = iova + 1,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 0f17a38a304d..c62e344a4058 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -190,7 +190,6 @@ struct io_pgtable_cfg {
  */
 struct arm_lpae_io_pgtable_walk_data {
 	u64 ptes[4];
-	int level;
 };
 
 /**



[1]https://lore.kernel.org/all/Z1AtDgLD0SDUxDHl@google.com/

Thanks,
Mostafa

> 
> Rob Clark (4):
>   iommu/io-pgtable-arm: Make pgtable walker more generic
>   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
>   iommu/io-pgtable-arm: Add way to debug pgtable walk
>   drm/msm: Extend gpu devcore dumps with pgtbl info
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
>  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
>  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
>  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
>  drivers/iommu/io-pgtable-arm.c          | 157 +++++++++++++++---------
>  include/linux/io-pgtable.h              |  15 +++
>  7 files changed, 167 insertions(+), 57 deletions(-)
> 
> -- 
> 2.47.1
> 
