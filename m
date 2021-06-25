Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C43B46C5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 17:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB006EE01;
	Fri, 25 Jun 2021 15:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BBE6EDF2;
 Fri, 25 Jun 2021 15:39:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e22so11081901wrc.1;
 Fri, 25 Jun 2021 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vdo63xtloDEOamPYATEH0AS03eYl+iSZfl6fPLjUbC0=;
 b=Jb0i1Lvqmij+LCFT/Mg28ra5KlS0qJQBQ26bnZVtH4y9cZM+GnQHp1dvUZ3LUnWJU1
 VzKHiDXKJ9TXOkl17FLwldxn5maUTbOx3wMjeu2i22mk56UmTrPM2C2y1zrh2p4371l0
 ngGo21DjmXU8rIwuOaB0GEvcMZhCKAAVE7WsMozqU4xp0DWnN/diafx6zcMFlVz8YtbY
 aIz9j5DOTQ8JoWobUYeiB5EYVcMY3rgGVqh20F/KXHQpiUCypMMwLwq0Qv/Y/y5sMS5I
 Wf5LtD+mCjflS70/C4h1O3yl6AOOjPMzZUBQRWl3uyvHi7tsu3jsi7mwnFUC1vgtP6yY
 uOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vdo63xtloDEOamPYATEH0AS03eYl+iSZfl6fPLjUbC0=;
 b=PdVF4pmMQSs5v5tKlglaTyCmoDSq0fCNt69SxTLzqeeTqfl51X9P67GXJVR3laG2WW
 QuYhWiOqOsrfUcNqR3ZOLN3fSUYLISH6Ftj8SgpFFbrK6HKgCYSTi99JtZLqV6NWDCYX
 qpJh5QsnSt3wIGTS2+cPrXseet+36FobT/ET3li/tczx7F/X64Fn/A4Cd552aZXYqWbv
 q3Cpw4Zmh2xWMw1/Zhy2T2aRG47HgSS6/utG2YrHiLbkA6Vjfkpeg+FeVjYlEKkeSwpn
 0Q0xahDcoLVeIDSxHnew3jYBpOCULwywkpEmVwPbIj0Oiu4POcJKDHGuc7udQTvyNXFp
 Ybdg==
X-Gm-Message-State: AOAM533gKkeXkpUnLYBn2YwoV2E2SQXsnetybmyvvJGZswYu0BKmonuh
 ZJH0oUF3QxbclSGxcijjR6iegQ42VRYWH6Q9iNM=
X-Google-Smtp-Source: ABdhPJxMd2QD5QxjGCuh4pj9v343g3SW9Px0O12bqlsmSQOJev5MZ4vy4Nc2H7rSC6xBZLfN8VeV69ccnD8vSa1vkF0=
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr11934898wrs.83.1624635539523; 
 Fri, 25 Jun 2021 08:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-4-robdclark@gmail.com>
 <YNVP6rfQ699BejsI@yoga>
In-Reply-To: <YNVP6rfQ699BejsI@yoga>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Jun 2021 08:42:59 -0700
Message-ID: <CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 8:39 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:
> [..]
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 50d881794758..6975b95c3c29 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >               unsigned long iova, int flags, void *arg)
> >  {
> >       struct msm_iommu *iommu = arg;
> > +     struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> > +     struct adreno_smmu_fault_info info, *ptr = NULL;
> > +
> > +     if (adreno_smmu->get_fault_info) {
>
> This seemed reasonable when I read it last time, but I didn't realize
> that the msm_fault_handler() is installed for all msm_iommu instances.
>
> So while we're trying to recover from the boot splash and setup the new
> framebuffer we end up here with iommu->base.dev being the mdss device.
> Naturally drvdata of mdss is not a struct adreno_smmu_priv.
>
> > +             adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
>
> So here we just jump straight out into hyperspace, never to return.
>
> Not sure how to wire this up to avoid the problem, but right now I don't
> think we can boot any device with a boot splash.
>

I think we could do:

------------------------
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index eed2a762e9dd..30ee8866154e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -29,6 +29,9 @@ static struct msm_iommu_pagetable
*to_pagetable(struct msm_mmu *mmu)
  return container_of(mmu, struct msm_iommu_pagetable, base);
 }

+static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
+ unsigned long iova, int flags, void *arg);
+
 static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
  size_t size)
 {
@@ -151,6 +154,8 @@ struct msm_mmu *msm_iommu_pagetable_create(struct
msm_mmu *parent)
  struct io_pgtable_cfg ttbr0_cfg;
  int ret;

+ iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+
  /* Get the pagetable configuration from the domain */
  if (adreno_smmu->cookie)
  ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
@@ -300,7 +305,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev,
struct iommu_domain *domain)

  iommu->domain = domain;
  msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
- iommu_set_fault_handler(domain, msm_fault_handler, iommu);

  atomic_set(&iommu->pagetables, 0);

------------------------

That would have the result of setting the same fault handler multiple
times, but that looks harmless.  Mostly the fault handling stuff is to
make it easier to debug userspace issues, the fallback dmesg spam from
arm-smmu should be sufficient for any kernel side issues.

BR,
-R
