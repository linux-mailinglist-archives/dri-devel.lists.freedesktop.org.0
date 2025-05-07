Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1656AAE7D5
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B769E10E874;
	Wed,  7 May 2025 17:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa4gO2Wp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE5910E86C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 17:30:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547Ai8fa018366
 for <dri-devel@lists.freedesktop.org>; Wed, 7 May 2025 17:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nD8wm4cEZTjKzpIYhURNdokdQRu4kt6j22N6qR/i6d0=; b=oa4gO2Wp8elOrkc4
 sPUx8fmNy/lr/Jz/wqqUkrajfH4i4fH30xT6iB9H7nsYJCgcsPBlRN0zwNkilLwM
 UwWzF9PduebqFyCKfnGng8IoVdmlsBjoGetVToT6yEDfNhgdTZPkWi78OlJxDOi9
 T+Dvz0DV6mlUNxGKZTIrT5JdNLTDdllsrpxCuY8J1GHtqkNu3EC1xzfzB/Vmh9Ds
 vkaIcoKNZ9RRc9nF+kEHTgGSov5XKy2AH0asxeh/1VswlifpzkxPv+saMZbrIHj4
 NFQ4yJRWProfxCFPUjrDzyl7f2Mh8KlTlNZiUEBUDIqbXMLnOY2U+GnNv2c25sii
 b/0YBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbejsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 17:29:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff8119b436so169262a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 10:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746638998; x=1747243798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nD8wm4cEZTjKzpIYhURNdokdQRu4kt6j22N6qR/i6d0=;
 b=R6nx9CIHgwuSLZoD3QWeD7aYsLmqphcbQehWueft00SLqb4NEhKINeV+1p3lWYpAiy
 zZ1vWdO5Vn+YA2jxgeK2r4/aHtAt/E2I6JJhL4UIVCcTODw2bHWVQvwNDS6Z4n8oDR+E
 pjL3wzFDVnGZGC9nCpIOVoL8QMSheNYMQ5OlEn2fh+nQKI70lXKwxAOf99pqHqZGBoQy
 0yQQdApzWto1aKzOuFsSJwBS1nG25abPVgblFjmSjoxng7EtSSh5VfqLKxjLhVcX8s4h
 9ozjne866Z3xyaD84F065CoEc/wxPEBZbTW1+n/6e7kOk2KXWDvVeJ/lQ0c2x52lmkyE
 CLnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTKjX4xnNX2kZjof2aUP8+eUCk4MgZAKqWJy9JaSQt/wt25KWJV+TEcyMkMyCS1hJo0nAdyRx7DKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrICIWFOAYi7nrNV5TY52IttOMChCNIf55OT2wyLzkXbvyjn1J
 13EktTQDTlLlCHepcrg1ek9LhHPwUz5ikmX5FivtTKxa8hzoJQEsPpgM6fHQpqYuxH0DefWgSBE
 Vj/NDZIzPfNNUxlQzMFa3pINJrdsnfZxmzPMDvlkz1Y/B9SjVICJLq07FMsl6V3lbWTAdcv6+Ly
 ME2etg23lm//OHh7gCSIFGClSGpMVRmmEQ1qOxTGat+jhflXAClQ==
X-Gm-Gg: ASbGnctmpd6ZswFef87j175xTbZc8k4A7rU/16PT7V9zJo9c1N28C4zEUaUMwg8W4lx
 YHshYSki5m+7zTVZ2+xVYHcKTty/McRomEU/7u4dOPCJ2OU9Grt2or8rQAzJfUuyd17dFO/rAAO
 fsNBExn5Onwz86xHO9kcqUfQ==
X-Received: by 2002:a17:90b:3e84:b0:2ff:5357:1c7f with SMTP id
 98e67ed59e1d1-30aac28b3bcmr6103773a91.30.1746638998180; 
 Wed, 07 May 2025 10:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOQVoRZLc9G2QUyMlvOAcD6rPSPxKQPo3YM5kgOlrYHr+pSrf/CwBG8ydnumwJajZCFZwyE6v5h1q2sbz0vaw=
X-Received: by 2002:a17:90b:3e84:b0:2ff:5357:1c7f with SMTP id
 98e67ed59e1d1-30aac28b3bcmr6103734a91.30.1746638997791; Wed, 07 May 2025
 10:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-10-1292cba0f5ad@oss.qualcomm.com>
 <CAF6AEGtsnfxHYZyEsC+BSW0aWd1V4ZvM0c_wyTx20Vaeku4o6A@mail.gmail.com>
In-Reply-To: <CAF6AEGtsnfxHYZyEsC+BSW0aWd1V4ZvM0c_wyTx20Vaeku4o6A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 7 May 2025 20:29:46 +0300
X-Gm-Features: ATxdqUFmUTo9xbZuovfRy4v8qESXvAXU0F-7L8CeGMpLu-6p5FVZwQFJmAwEvbg
Message-ID: <CAO9ioeXCO+8wSs-6yjTDOu8pSw___spEX_JPrUNKq3iPDjWQDQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] drm/msm: enable separate binding of GPU and
 display devices
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: z5tmgpSptQEHyC4Cw_cDqDrqWP3ISeDH
X-Proofpoint-GUID: z5tmgpSptQEHyC4Cw_cDqDrqWP3ISeDH
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681b9897 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vLn6z6pMZrcMuYbAoMEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE1OSBTYWx0ZWRfX288qsYBY1WUP
 OJwK46NeQoq/daRsQUxyd5x8CH19/6+9RwnQ49Crx/Qx/+TjBBNGs8cEFz0JRdrkM2jf9uobJE0
 DDAAwH8tfdwFKgpqqBCwBqyYq8xpSJQym/hbjxRzC5lR5xL0yLZ/M0/3Da5uS0a+mwaTmijtu34
 cwqrciYakWuSCLaFyOuuw1FshrZ4qxC5HNijWCym/Y2WcC+4iaaPtyGsWlCHZAdKTzCb9WETpuS
 30cTVYXL/iUlV6omGRN32TsN44mbWnJcmYEcXiY/ii69TUpSFN/m6uH5PnC32aEQcnKkHpxXLB9
 CSNDCkxVBYHlYDGufkgSna2NhQVbIHEJRSOp7BrG5QKz6kp/mm8VKqC/8UN3kuTzduPi7izQFlh
 bjv9WT/nf48VzeqNY/FkWPht5yz5jUnkOic0kRcrDMswRKTVxCtS36cB+O/6XGqFV6VBIiI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070159
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

On Wed, 7 May 2025 at 19:43, Rob Clark <robdclark@gmail.com> wrote:
>
> On Sat, May 3, 2025 at 12:17=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > There are cases when we want to have separate DRM devices for GPU and
> > display pipelines.
> > One example is development, when it is beneficial to be able to bind th=
e
> > GPU driver separately, without the display pipeline (and without the
> > hacks adding "amd,imageon" to the compatible string).
> > Another example is some of Qualcomm platforms, which have two MDSS
> > units, but only one GPU. With current approach it is next to impossible
> > to support this usecase properly, while separate binding allows users t=
o
> > have three DRM devices: two for MDSS units and a single headless GPU.
> >
> > Add kernel param msm.separate_gpu_drm, which if set to true forces
> > creation of separate display and GPU DRM devices. Mesa supports this
> > setup by using the kmsro wrapper.
> >
> > The param is disabled by default, in order to be able to test userspace
> > for the compatibility issues. Simple clients are able to handle this
> > setup automatically.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
> >  drivers/gpu/drm/msm/msm_drv.c              | 49 ++++++++++++++++++++++=
+++++---
> >  drivers/gpu/drm/msm/msm_drv.h              |  2 ++
> >  3 files changed, 49 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 325cb710ea08ac8e5c3d9c80c8d8e18e1946e994..2322a3301a5226c4e259034=
4e4744934addeea33 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -243,7 +243,8 @@ static const struct component_ops a3xx_ops =3D {
> >
> >  static int adreno_probe(struct platform_device *pdev)
> >  {
> > -       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
> > +       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") |=
|
> > +           msm_gpu_no_components())
> >                 return msm_gpu_probe(pdev, &a3xx_ops);
> >
> >         return component_add(&pdev->dev, &a3xx_ops);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 804b594ba1e7df9d9aec53a9be1451f1167fc77a..eec7501eb05b6c31ffd9dc5=
a7ba430e3284ea5ed 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -59,9 +59,18 @@ static bool modeset =3D true;
> >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (defau=
lt), 0=3Ddisable)");
> >  module_param(modeset, bool, 0600);
> >
> > +static bool separate_gpu_drm;
> > +MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GP=
U (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM de=
vices)");
> > +module_param(separate_gpu_drm, bool, 0400);
> > +
> >  DECLARE_FAULT_ATTR(fail_gem_alloc);
> >  DECLARE_FAULT_ATTR(fail_gem_iova);
> >
> > +bool msm_gpu_no_components(void)
> > +{
> > +       return separate_gpu_drm;
> > +}
> > +
> >  static int msm_drm_uninit(struct device *dev, const struct component_o=
ps *gpu_ops)
> >  {
> >         struct platform_device *pdev =3D to_platform_device(dev);
> > @@ -898,6 +907,32 @@ static const struct drm_driver msm_driver =3D {
> >         .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
> >  };
> >
> > +static const struct drm_driver msm_kms_driver =3D {
> > +       .driver_features    =3D DRIVER_GEM |
> > +                               DRIVER_ATOMIC |
> > +                               DRIVER_MODESET |
> > +                               DRIVER_SYNCOBJ_TIMELINE |
> > +                               DRIVER_SYNCOBJ,
>
> I think, drop DRIVER_SYNCOBJ + DRIVER_SYNCOBJ_TIMELINE, since kms only
> uses fence fd's.

Ack.

>  (Syncobj support is only in the SUBMIT and upcoming
> VM_BIND ioctls..  I don't think there is a use-case for being able to
> create syncobjs for KMS only drivers, and it doesn't look like any of
> the other kms-only drivers support this.)
>
> Alternatively, we could use drm_device::driver_features to mask
> certain drm_driver::driver_features at runtime.. that would be a way
> to avoid having separate drm_driver tables.

Not really and that's a problem. DRIVER_RENDER is processed before
driver_features can take place.
Also, the "msm-kms" name is required to prevent userspace from using
it for GPU tasks.
So, at least a KMS-only structure needs to be present.


>
> BR,
> -R
>
> > +       .open               =3D msm_open,
> > +       .postclose          =3D msm_postclose,
> > +       .dumb_create        =3D msm_gem_dumb_create,
> > +       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> > +       .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
> > +#ifdef CONFIG_DEBUG_FS
> > +       .debugfs_init       =3D msm_debugfs_init,
> > +#endif
> > +       MSM_FBDEV_DRIVER_OPS,
> > +       .show_fdinfo        =3D msm_show_fdinfo,
> > +       .ioctls             =3D msm_ioctls,
> > +       .num_ioctls         =3D ARRAY_SIZE(msm_ioctls),
> > +       .fops               =3D &fops,
> > +       .name               =3D "msm-kms",
> > +       .desc               =3D "MSM Snapdragon DRM",
> > +       .major              =3D MSM_VERSION_MAJOR,
> > +       .minor              =3D MSM_VERSION_MINOR,
> > +       .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
> > +};
> > +
> >  static const struct drm_driver msm_gpu_driver =3D {
> >         .driver_features    =3D DRIVER_GEM |
> >                                 DRIVER_RENDER |
> > @@ -1044,7 +1079,11 @@ static int add_gpu_components(struct device *dev=
,
> >
> >  static int msm_drm_bind(struct device *dev)
> >  {
> > -       return msm_drm_init(dev, &msm_driver, NULL);
> > +       return msm_drm_init(dev,
> > +                           msm_gpu_no_components() ?
> > +                                   &msm_kms_driver :
> > +                                   &msm_driver,
> > +                           NULL);
> >  }
> >
> >  static void msm_drm_unbind(struct device *dev)
> > @@ -1080,9 +1119,11 @@ int msm_drv_probe(struct device *master_dev,
> >                         return ret;
> >         }
> >
> > -       ret =3D add_gpu_components(master_dev, &match);
> > -       if (ret)
> > -               return ret;
> > +       if (!msm_gpu_no_components()) {
> > +               ret =3D add_gpu_components(master_dev, &match);
> > +               if (ret)
> > +                       return ret;
> > +       }
> >
> >         /* on all devices that I am aware of, iommu's which can map
> >          * any address the cpu can see are used:
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_dr=
v.h
> > index e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552..1ff799f0c78133e73c6857e=
3692c2dca2c5e60fa 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -543,4 +543,6 @@ void msm_kms_shutdown(struct platform_device *pdev)=
;
> >
> >  bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
> >
> > +bool msm_gpu_no_components(void);
> > +
> >  #endif /* __MSM_DRV_H__ */
> >
> > --
> > 2.39.5
> >



--=20
With best wishes
Dmitry
