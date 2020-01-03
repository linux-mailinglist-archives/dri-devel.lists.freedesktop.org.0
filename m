Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6712FCCA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 20:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2556E32C;
	Fri,  3 Jan 2020 19:02:17 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643586E32C
 for <dri-devel@freedesktop.org>; Fri,  3 Jan 2020 19:02:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r21so42377525edq.0
 for <dri-devel@freedesktop.org>; Fri, 03 Jan 2020 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TkjoiDoXf+Ju82Ph5GrtKx56lLId5gNQMBVsYU2UV2I=;
 b=O2MUFtAD4ZE08qe5e8wUK40pSV3MWGSqQ9oCAPTvZsEdPCFIN0dnMBZamFXlmw6lEt
 pjbp3ltsNqOVn7rnbJL3TqQGijOBPe5Jkq4gD5dRfySP0YItvvLFTf9mBhrabASlg47a
 2Bm4XFI54uLMXNw/GcTGRethvJsUfjLSYEww68efsuRZlnlAi4KyEx1bqLE+478t/sdf
 wzTGDoAFKcyin76PjFi53Ex/UhOtNaJMwvUOQ16KKmtS9KpIv3NpYuNdfBDbe41oMYaE
 kqPu3OqyaIDoEPWR1htm4+anPvqidSSfXQOKV+wWLhqQYyWv1KVOrDaTpkowvcvxiUGt
 1Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TkjoiDoXf+Ju82Ph5GrtKx56lLId5gNQMBVsYU2UV2I=;
 b=HntrSpd1EzTXFPMulOdiL6Vl2dg/9H6IaekONrxceGFUi5JW4/3XQkJ/O/0GaOsBLB
 zNlfTEbQskM2VTwcBA6HGkME99Xi9E9a2VWEVo+jWg62Q3Vv82FPUWSf92MkfL1ZHvgs
 L0CHAJ4C0+/oVMggM01gIzoddx9WdfSBswqJgL8QtCaXDB/oXFAUhJ4CSHA9dbm2JpSP
 w60AHUQ7z45j9mnlx5wMmeUw/SiFvj6Ai70mDjpiulxrECJ9NTp9iAled9rVH8QZ+wao
 qMyduJF4tvSg4MUTmr4HSciYO5+vN6b+/RrJKMHxcIe9CfMfVm5KM2+vD7/TuczKqfYs
 svcw==
X-Gm-Message-State: APjAAAVdJJZJ+uW4c5cYpcqNg48o6sAW3w9R3HE6qLPuojuNHaWge5J1
 6u35ky1j7aj6K47WIRnbfgVrG0CMpxaNFWE75/M=
X-Google-Smtp-Source: APXvYqxS55HXS3z8CIX9ctS+VVvu28guenRxGgfT7JZP5HxyppRusJag9NZUaCsJSd1/RAnJOLIyc/xzpyWSZQZVZhs=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr94494730eds.163.1578078134838; 
 Fri, 03 Jan 2020 11:02:14 -0800 (PST)
MIME-Version: 1.0
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
 <1577962933-13577-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1577962933-13577-3-git-send-email-smasetty@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2020 11:02:03 -0800
Message-ID: <CAF6AEGvmrTmjyFsqX+DQNNgXxDw2uGYJv6bA0Y6OGn05m_0WFQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/7] iommu/arm-smmu: Add domain attribute
 for QCOM system cache
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: saiprakash.ranjan@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 dri-devel@freedesktop.org, Vivek Gautam <vivek.gautam@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 2, 2020 at 3:02 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Add iommu domain attribute for using system cache aka last level
> cache on QCOM SoCs by client drivers like GPU to set right
> attributes for caching the hardware pagetables into the system cache.
>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-qcom.c | 10 ++++++++++
>  drivers/iommu/arm-smmu.c      | 14 ++++++++++++++
>  drivers/iommu/arm-smmu.h      |  1 +
>  include/linux/iommu.h         |  1 +
>  4 files changed, 26 insertions(+)
>
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 24c071c..d1d22df 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -30,7 +30,17 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>         return ret;
>  }
>
> +static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> +                                 struct io_pgtable_cfg *pgtbl_cfg)
> +{
> +       if (smmu_domain->sys_cache)
> +               pgtbl_cfg->coherent_walk = false;

just curious, does coherent walk not work with sys-cache, or is it
just that it is kind of pointless (given that, afaiu, the pagetables
can be cached by the system cache)?

> +
> +       return 0;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> +       .init_context = qcom_smmu_init_context,
>         .reset = qcom_sdm845_smmu500_reset,
>  };
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 4f7e0c0..055b548 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1466,6 +1466,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>                 case DOMAIN_ATTR_NESTING:
>                         *(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>                         return 0;
> +               case DOMAIN_ATTR_QCOM_SYS_CACHE:
> +                       *((int *)data) = smmu_domain->sys_cache;
> +                       return 0;
>                 default:
>                         return -ENODEV;
>                 }
> @@ -1506,6 +1509,17 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>                         else
>                                 smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>                         break;
> +               case DOMAIN_ATTR_QCOM_SYS_CACHE:
> +                       if (smmu_domain->smmu) {
> +                               ret = -EPERM;
> +                               goto out_unlock;
> +                       }
> +
> +                       if (*((int *)data))
> +                               smmu_domain->sys_cache = true;
> +                       else
> +                               smmu_domain->sys_cache = false;
> +                       break;
>                 default:
>                         ret = -ENODEV;
>                 }
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index f57cdbe..8aeaaf0 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -322,6 +322,7 @@ struct arm_smmu_domain {
>         struct mutex                    init_mutex; /* Protects smmu pointer */
>         spinlock_t                      cb_lock; /* Serialises ATS1* ops and TLB syncs */
>         struct iommu_domain             domain;
> +       bool                            sys_cache;
>  };
>
>
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 0c60e75..bd61c60 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -127,6 +127,7 @@ enum iommu_attr {
>         DOMAIN_ATTR_FSL_PAMUV1,
>         DOMAIN_ATTR_NESTING,    /* two stages of translation */
>         DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> +       DOMAIN_ATTR_QCOM_SYS_CACHE,

Given that IOMMU_QCOM_SYS_CACHE was renamed to IOMMU_SYS_CACHE_ONLY, I
wonder if this domain attr should simply be DOMAIN_ATTR_SYS_CACHE?

But that said, the function of this domain attr seems to simply be to
disable coherent walk.. I wonder if naming the domain attr after what
it does would make more sense?

BR,
-R


>         DOMAIN_ATTR_MAX,
>  };
>
> --
> 1.9.1
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
