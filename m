Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AB258918
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF4D6E5CC;
	Tue,  1 Sep 2020 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E466E575
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 03:52:20 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id m4so2015998oos.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DHgd1Cn7DbLEoeK4tX+vty8BzXm7n6usmD/UeI07Mrk=;
 b=dyaEu3K2fa7X2g3Iy4XaFmUwFb2VziG9VK8UPB8GwRUXnqKa7ib6yl+CECA0Q1vPLz
 IjQ+mn612HdIbhc5odg6OfaT3Qb/TYbaI5T/zWIex5gVUoWgirWjKb0AvwZRDaqbzzCO
 Y1OtNL+0UUlSJmpsQ0sd9QBKMSwBu6kJ5paH3wPa4P9agbIv6yxHgu7afTYDTEwIeYGH
 DJZ6IsI3RU6NTWK8tqqEnwY3s/hCocMGlybV+ffvg6CgjQt6J50QWplKw+lBIr/ief3F
 psjjzA+evsRqJDJS9fx7ldrRPcAmxLmEOhyENyNuK+ikFrDogOJS+r6DRfJGytxsSq3x
 WDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DHgd1Cn7DbLEoeK4tX+vty8BzXm7n6usmD/UeI07Mrk=;
 b=KkTIxRJPz6qDn77pV7JcHtBQKbHV8dXo9ycaJxVyAbmxG0ALq6jgZu/gspV7LP7aoR
 YBhw2iOvkfdO8AzWLYMBhudpkgqCsQW1F1qlJDmpWx5zFRTkWysxZ7iP9kdl14p6v9cy
 UsR30CeXUInU9N0FKEv4AoDWIHD1tYR7wiMbC+/JiQdsq3lb/jbQx89A9q9xLq5bgwAL
 +sCk54py0qDNzeNBt/1DXa2Qpnd+JxPQE3rp6DF07OoIoQ/6/7uXRRGGmip/R2ke0aF1
 v9ivRgASgbhWpYU9GdCNHVylx0eNm6LcjrXCoLTlx0e0yXdfjFJKOBg20yY7k11itfiH
 lFdg==
X-Gm-Message-State: AOAM532h2edpmB+GBENcQCPav8mKRiy39Al0PqpcdkEI6eg2COV6gTxC
 3YyCjPIF4Y66V9yrdvAJ5andRWC7svCGwg==
X-Google-Smtp-Source: ABdhPJyW82+oNd0uKsSlubviePmT2U0GHcTQ3RDx78hC9s24SzOxGZRfPqGKe1d6Eg2D6goGkTWR0w==
X-Received: by 2002:a4a:aec3:: with SMTP id v3mr2968825oon.69.1598932339869;
 Mon, 31 Aug 2020 20:52:19 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id u19sm2067501oic.10.2020.08.31.20.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 20:52:19 -0700 (PDT)
Date: Mon, 31 Aug 2020 22:52:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 05/19] iommu: add private interface for adreno-smmu
Message-ID: <20200901035216.GM3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-6-robdclark@gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> This interface will be used for drm/msm to coordinate with the
> qcom_adreno_smmu_impl to enable/disable TTBR0 translation.
> 
> Once TTBR0 translation is enabled, the GPU's CP (Command Processor)
> will directly switch TTBR0 pgtables (and do the necessary TLB inv)
> synchronized to the GPU's operation.  But help from the SMMU driver
> is needed to initially bootstrap TTBR0 translation, which cannot be
> done from the GPU.
> 
> Since this is a very special case, a private interface is used to
> avoid adding highly driver specific things to the public iommu
> interface.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  include/linux/adreno-smmu-priv.h | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/linux/adreno-smmu-priv.h
> 
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> new file mode 100644
> index 000000000000..a889f28afb42
> --- /dev/null
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Google, Inc
> + */
> +
> +#ifndef __ADRENO_SMMU_PRIV_H
> +#define __ADRENO_SMMU_PRIV_H
> +
> +#include <linux/io-pgtable.h>
> +
> +/**
> + * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
> + *
> + * @cookie:        An opque token provided by adreno-smmu and passed
> + *                 back into the callbacks
> + * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
> + * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
> + *                 NULL config disables TTBR0 translation, otherwise
> + *                 TTBR0 translation is enabled with the specified cfg
> + *
> + * The GPU driver (drm/msm) and adreno-smmu work together for controlling
> + * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> + * updating the SMMU for context switches, while on the other hand we do
> + * not want to duplicate all of the initial setup logic from arm-smmu.
> + *
> + * This private interface is used for the two drivers to coordinate.  The
> + * cookie and callback functions are populated when the GPU driver attaches
> + * it's domain.
> + */
> +struct adreno_smmu_priv {
> +    const void *cookie;
> +    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
> +    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
> +};
> +
> +#endif /* __ADRENO_SMMU_PRIV_H */
> \ No newline at end of file
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
