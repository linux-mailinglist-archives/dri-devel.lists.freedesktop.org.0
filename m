Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C141CBD8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562546EACB;
	Wed, 29 Sep 2021 18:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0D6EACB;
 Wed, 29 Sep 2021 18:30:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7FD661507;
 Wed, 29 Sep 2021 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632940249;
 bh=gjF28VMTIug2m1bl/FU/M9snQ4rR61AFv5fVsRKalNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CISl9Rl7R+M6haM6b37hM8Y55j2HAbcMi0eojp8x2X5LO3rMaVS5sudmIbZDpY2Fa
 v3jkZlxqIQsgk7xdc/KNDPDNwnRYggSWDCUgB/s/FiZxlhlKX24dWHVpR7Wt0mlN/7
 mhK6ym9B69BkMQdp4WI4pKJ+rr90hmai+tmZp9rhMJtK7ONWh9AhmLAFD2pHKhaUG3
 HMRbEb2CCpVxIrKjjd6yE6ttU5SikyGGITOLPKJu1L7QFLNrx8p43TXVkgBvbCSBJk
 HoUf+R5uDfbywO7AlRlXS5uX8pbpj5u56JSH5+uMScUwkPlS/zeQ1/1lCIAk541NMv
 d88464bdH/fHQ==
Received: by mail-wr1-f47.google.com with SMTP id m22so360112wrb.0;
 Wed, 29 Sep 2021 11:30:49 -0700 (PDT)
X-Gm-Message-State: AOAM5321wngN/E/lXSbYRpZO40h5PTaN/aixR23U4SPeeSN+3+uk03Fi
 gRbedwXrw12iCdSBzAddQKHn/k/D+ffCUe+ogKg=
X-Google-Smtp-Source: ABdhPJznh64DeD5YLkqLyCdpGZrw2eJDCFhsGINcOBsXO/6p1u7dAzpxKDez727ElHRBigRMgHpji/X6aGMkMR1n8h4=
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr1607418wrz.369.1632940247984; 
 Wed, 29 Sep 2021 11:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org>
 <20210929095107.GA21057@willie-the-truck>
 <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
 <YVR8Q7LO0weiFin+@yoga>
In-Reply-To: <YVR8Q7LO0weiFin+@yoga>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 29 Sep 2021 20:30:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Kk6Y1Hs98z2UFEis8cWekREFt8YKg2Nbu3G5WQJ7Fag@mail.gmail.com>
Message-ID: <CAK8P3a2Kk6Y1Hs98z2UFEis8cWekREFt8YKg2Nbu3G5WQJ7Fag@mail.gmail.com>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Joerg Roedel <joro@8bytes.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Alex Elder <elder@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, 
 Andy Gross <agross@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
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

On Wed, Sep 29, 2021 at 4:46 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 29 Sep 05:04 CDT 2021, Arnd Bergmann wrote:
>
> > On Wed, Sep 29, 2021 at 11:51 AM Will Deacon <will@kernel.org> wrote:
> > > On Mon, Sep 27, 2021 at 05:22:13PM +0200, Arnd Bergmann wrote:
> > > >
> > > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > > index 124c41adeca1..989c83acbfee 100644
> > > > --- a/drivers/iommu/Kconfig
> > > > +++ b/drivers/iommu/Kconfig
> > > > @@ -308,7 +308,7 @@ config APPLE_DART
> > > >  config ARM_SMMU
> > > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > > >       depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > > > -     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > > > +     select QCOM_SCM
> > > >       select IOMMU_API
> > > >       select IOMMU_IO_PGTABLE_LPAE
> > > >       select ARM_DMA_USE_IOMMU if ARM
> > >
> > > I don't want to get in the way of this patch because I'm also tired of the
> > > randconfig failures caused by QCOM_SCM. However, ARM_SMMU is applicable to
> > > a wide variety of (non-qcom) SoCs and so it seems a shame to require the
> > > QCOM_SCM code to be included for all of those when it's not strictly needed
> > > at all.
> >
> > Good point, I agree that needs to be fixed. I think this additional
> > change should do the trick:
> >
>
> ARM_SMMU and QCOM_IOMMU are two separate implementations and both uses
> QCOM_SCM. So both of them should select QCOM_SCM.

Right, I figured that out later as well.

> "Unfortunately" the Qualcomm portion of ARM_SMMU is builtin
> unconditionally, so going with something like select QCOM_SCM if
> ARCH_QCOM would still require the stubs in qcom_scm.h.

Yes, sounds good. I also noticed that I still need one hack in there
if I do this:

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 55690af1b25d..36c304a8fc9b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -427,6 +427,9 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct
arm_smmu_device *smmu)
 {
        const struct device_node *np = smmu->dev->of_node;

+       if (!IS_ENABLED(CONFIG_QCOM_SCM))
+               return ERR_PTR(-ENXIO);
+
 #ifdef CONFIG_ACPI
        if (np == NULL) {
                /* Match platform for ACPI boot */


Otherwise it still breaks with ARM_SMMU=y and QCOM_SCM=m.

Splitting out the qualcomm portion of the arm_smmu driver using
a separate 'bool' symbol should also work, if  you prefer that
and can suggest a name and help text for that symbol. It would
look like

diff --git a/drivers/iommu/arm/arm-smmu/Makefile
b/drivers/iommu/arm/arm-smmu/Makefile
index e240a7bcf310..b0cc01aa20c9 100644
--- a/drivers/iommu/arm/arm-smmu/Makefile
+++ b/drivers/iommu/arm/arm-smmu/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
 obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
-arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o arm-smmu-qcom.o
+arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o
+arm_smmu-$(CONFIG_ARM_SMMU_QCOM) += arm-smmu-qcom.o
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 9f465e146799..2c25cce38060 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -215,7 +215,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct
arm_smmu_device *smmu)
            of_device_is_compatible(np, "nvidia,tegra186-smmu"))
                return nvidia_smmu_impl_init(smmu);

-       smmu = qcom_smmu_impl_init(smmu);
+       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
+               smmu = qcom_smmu_impl_init(smmu);

        if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
                smmu->impl = &mrvl_mmu500_impl;



       Arnd
