Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CED916FAA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5F10E719;
	Tue, 25 Jun 2024 17:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="C6mm9Wrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEEF10E189;
 Tue, 25 Jun 2024 17:59:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PGaA8q001878;
 Tue, 25 Jun 2024 17:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UTXlyPMimfPsdML5XnWhbzPWKtt05rNdQQcAZFX6ebk=; b=C6mm9WrfCP2fAyiN
 uGJmkrE714XbvzqP4lHhTORx/H7Un+7wK4oWGEnUkkI0W+hToVZgQfTkjzDkgREs
 qkDBuyYfzoemvvFN0b8ABNFUxnZVDf0FLuJ/29hZ5rmqizw7qVkiOHyYicbsy1OM
 ndUSAq3Y7PhBP2nQhk/v1sFFAIN2VCkytV5Q0X6ThASWCWmG7/24tTt2ThEgve1O
 5gDiTXp2U3xJSG5sN2zYoLdHyRbPjgD42AN1VegwFXSo34yOMY7wA/j42wBS5e6h
 YWchrcP76Xk0AL0xnM2LAcajGgTN/LTJWYqsJ7nRMuQAv9slTtMZY7fA56qdXoo0
 mVIwhg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaeyqjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 17:59:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45PHxYDN006098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 17:59:34 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 10:59:29 -0700
Date: Tue, 25 Jun 2024 23:29:26 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Kiarash Hajian <kiarash8112hajian@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
 <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7nTEj92ALSLleOguYyx3PJoc7eZow3XW
X-Proofpoint-GUID: 7nTEj92ALSLleOguYyx3PJoc7eZow3XW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250132
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

On Fri, Jun 21, 2024 at 02:09:58PM -0700, Rob Clark wrote:
> On Sat, Jun 8, 2024 at 8:44 AM Kiarash Hajian
> <kiarash8112hajian@gmail.com> wrote:
> >
> > The driver's memory regions are currently just ioremap()ed, but not
> > reserved through a request. That's not a bug, but having the request is
> > a little more robust.
> >
> > Implement the region-request through the corresponding managed
> > devres-function.
> >
> > Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> > ---
> > Changes in v6:
> >     -Fix compile error
> >     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-8664f52fc2a1@gmail.com
> >
> > Changes in v5:
> >     - Fix error hanlding problems.
> >     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
> >
> > Changes in v4:
> >     - Combine v3 commits into a singel commit
> >     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
> >
> > Changes in v3:
> >     - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
> >
> > Changes in v2:
> >     - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++----------------------
> >  1 file changed, 11 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 8bea8ef26f77..d26cc6254ef9 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
> >         bool pdc_in_aop = false;
> >
> >         if (IS_ERR(pdcptr))
> > -               goto err;
> > +               return;
> >
> >         if (adreno_is_a650(adreno_gpu) ||
> >             adreno_is_a660_family(adreno_gpu) ||
> > @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
> >         if (!pdc_in_aop) {
> >                 seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> >                 if (IS_ERR(seqptr))
> > -                       goto err;
> > +                       return;
> >         }
> >
> >         /* Disable SDE clock gating */
> > @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
> >         wmb();
> >
> >         a6xx_rpmh_stop(gmu);
> > -
> > -err:
> > -       if (!IS_ERR_OR_NULL(pdcptr))
> > -               iounmap(pdcptr);
> > -       if (!IS_ERR_OR_NULL(seqptr))
> > -               iounmap(seqptr);
> >  }
> >
> >  /*
> > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> >                 return ERR_PTR(-EINVAL);
> >         }
> >
> > -       ret = ioremap(res->start, resource_size(res));
> > +       ret = devm_ioremap_resource(&pdev->dev, res);
> 
> So, this doesn't actually work, failing in __request_region_locked(),
> because the gmu region partially overlaps with the gpucc region (which
> is busy).  I think this is intentional, since gmu is controlling the
> gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> overlapping region.  Maybe Akhil knows more about GMU.

We don't really need to map gpucc region from driver on behalf of gmu.
Since we don't access any gpucc register from drm-msm driver, we can
update the range size to correct this. But due to backward compatibility
requirement with older dt, can we still enable region locking? I prefer
it if that is possible.

FYI, kgsl accesses gpucc registers to ensure gdsc has collapsed. So
gpucc region has to be mapped by kgsl and that is reflected in the kgsl
device tree.

-Akhil

> 
> BR,
> -R
> 
> >         if (!ret) {
> >                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
> >                 return ERR_PTR(-EINVAL);
> > @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >         gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
> >         if (IS_ERR(gmu->mmio)) {
> >                 ret = PTR_ERR(gmu->mmio);
> > -               goto err_mmio;
> > +               goto err_cleanup;
> >         }
> >
> >         gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
> >         if (IS_ERR(gmu->cxpd)) {
> >                 ret = PTR_ERR(gmu->cxpd);
> > -               goto err_mmio;
> > +               goto err_cleanup;
> >         }
> >
> >         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> > @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >         gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
> >         if (IS_ERR(gmu->gxpd)) {
> >                 ret = PTR_ERR(gmu->gxpd);
> > -               goto err_mmio;
> > +               goto err_cleanup;
> >         }
> >
> >         gmu->initialized = true;
> > @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >  detach_cxpd:
> >         dev_pm_domain_detach(gmu->cxpd, false);
> >
> > -err_mmio:
> > -       iounmap(gmu->mmio);
> > -
> > +err_cleanup:
> >         /* Drop reference taken in of_find_device_by_node */
> >         put_device(gmu->dev);
> >
> > @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >                 gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
> >                 if (IS_ERR(gmu->rscc)) {
> >                         ret = -ENODEV;
> > -                       goto err_mmio;
> > +                       goto err_cleanup;
> >                 }
> >         } else {
> >                 gmu->rscc = gmu->mmio + 0x23000;
> > @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >
> >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> >                 ret = -ENODEV;
> > -               goto err_mmio;
> > +               goto err_cleanup;
> >         }
> >
> >         gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
> >         if (IS_ERR(gmu->cxpd)) {
> >                 ret = PTR_ERR(gmu->cxpd);
> > -               goto err_mmio;
> > +               goto err_cleanup;
> >         }
> >
> >         link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
> > @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >  detach_cxpd:
> >         dev_pm_domain_detach(gmu->cxpd, false);
> >
> > -err_mmio:
> > -       iounmap(gmu->mmio);
> > -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> > -               iounmap(gmu->rscc);
> > +err_cleanup:
> >         free_irq(gmu->gmu_irq, gmu);
> >         free_irq(gmu->hfi_irq, gmu);
> >
> >
> > ---
> > base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> > change-id: 20240608-adreno-98c412bfdc03
> >
> > Best regards,
> > --
> > Kiarash Hajian <kiarash8112hajian@gmail.com>
> >
