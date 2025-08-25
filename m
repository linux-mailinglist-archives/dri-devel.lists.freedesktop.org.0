Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C3B34060
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 15:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F410E460;
	Mon, 25 Aug 2025 13:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5AcVBoa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9E10E460
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 13:08:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8M7bL021722
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=mLb5kXtp3JZDVVL6Y5bEFTlZwa6bARViRJ9g/Jqdr/w=; b=Q5
 AcVBoaQmdmull2cK/OetVXsMAs4whnLUM3fHKV7+h52HRj/y+M1Lt3UKKYIJeoDD
 /P8Gtl4hDIh46VOHqlV+5Iqlykj34KATBbU2VJ56xwmRFoMLyQlg6HJuKIPbcX9c
 E1VQssucmWlVUIurCGwxagI/eiaq27zvndo4M0GRc/nRoNCVzEO3sEkn5gEm3VQI
 P0ewY9pQpQ8vN6Hd1ApE9gkQEFsffM6PchmBk2xET9xksYOEeFHFDfQpPwZ3EBSC
 AZ+uI/3EuJqFd3qOSLckI/8B+5UjbKtg4euhR9Ufeqh+fS2yNLE+7LQDuiVuvHA4
 tOFSbMhv83JxHwA5FIWg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615d2ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 13:08:48 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-74381fa08b6so7523816a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 06:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756127327; x=1756732127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLb5kXtp3JZDVVL6Y5bEFTlZwa6bARViRJ9g/Jqdr/w=;
 b=KK5bJGfl+eTZA9QvXpQZLh4MD50BtwYke8nfUs86rm6wHdnoh9rm6oenFS7n65IT7M
 AktUZJocjzxb8BA6uub7N5hCTRTKmTeNQw+Xzw80EI7bhdimAiIl4Uv1y8xon/koByP2
 J6xBA++JFA2K9O53DQtL6keHQdQ+vrB6KfXn2ahz6W7Xg4ra6pat1w/Ff4vUBiTj28Jy
 YDkgjl3uALIdOsGkr2LAdvD/yT/m1PclNLpyFDNQVmyU2GRUTCGv0130V93lbqkkMQtu
 ghh1ryk3W7C16gfiOqrej4WHKA9fO+shbjqJSXct1HdP+LxxWPTEWjMDzaoPrA2EYZnR
 u7Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4oTu1/y0S17EvnPohrwdnwj+t1t/o5d7q7OP3awMvDzwAxJKJguVOQ76P1exQMzjWoU8/Q/VDh7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlLQjjMh9YhDkaAwTp9C9Y6pEYyz5kaBA9tYumB8h8n1N630Sl
 NqnBAu3KYhEiqcRfj7BWza1muYGV8FlmhY0bef/eo7JeWLKGxHDXQatdQTnpECRob/C1iVzjSaH
 4iSdCYnj7jxcyTkwYFoYL1Kv5kLREcDqFbKvK75WN82jqmMIK79n+sOqEwyn8zAFJdDZwR92G2k
 iuaeV0qV+sJjKuwVEQU8umizJk3Sxs6D3Cqa0L/ci6BkjCsg==
X-Gm-Gg: ASbGnctAi2tpv22haelHmnAe6spZfxq5pw47CVM38q45u9siIG5yCB8Ff2Fu+VpsRrm
 XkdKCxvX3bkMj9srVEwQOtek+ejNOn6wcRuJqgppmDt4RCaeuqWMX0lYGatuSm/Xr18mp94P9Ml
 NPKWnST7NO90Nhyl4E+rLOuUq3ogstYDsfLglnrrzNp/ou4qI9dO9r
X-Received: by 2002:a05:6830:618b:b0:73e:5bdd:a26a with SMTP id
 46e09a7af769-7450096feb5mr6755040a34.9.1756127326808; 
 Mon, 25 Aug 2025 06:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf1mlBVCjf4vOsM5MnwVwSaIvX8715qihb4fhYBKinuor019PfotnBMd06hPMWBc+xl0MSuBbV6ACZ4S2dee4=
X-Received: by 2002:a05:6830:618b:b0:73e:5bdd:a26a with SMTP id
 46e09a7af769-7450096feb5mr6755016a34.9.1756127326391; Mon, 25 Aug 2025
 06:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
 <20250825090908.269e1119@fedora>
In-Reply-To: <20250825090908.269e1119@fedora>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 06:08:34 -0700
X-Gm-Features: Ac12FXxVMbN4YIAqrvV2kTi7-EqGh6ZKLdVC2PGJCMTcARzTFOGIUb9P7BDgx8Q
Message-ID: <CACSVV02uJCRW8imFz7Q4fDZ3gfwkjQW2TkKYEVKLrfs4bXRFCg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danct12 <danct12@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX4ZQo9xsevbwg
 hVvzgFU9x5ikQJmGCnXnoTem9+hqhn3lGrtZTux/b7mwMGvvxmcUhl+LKeblEm3b8rSGeowRWTF
 /kvTd+6SKD5c6yzGxeJ5HxRTTemqwjhPGz2C4zAIXUXiF+O6sQ93U+3nxCMXL1MzTMa3OgPUaEd
 RYOgkB8CPWBtRpRWMOUkZ1Xm3Gx7YpD+x7/Z+4rLqaQuUyHFuWJLyNR9XDeEuHCwV+rU/0XzDoo
 r5jAyshI05zSRSLLd93QzQ/MdHk4DLztluh7Fg1WvZoQ60wjoBHiu8ToTCRUY6SJ6Krt4AUn7rq
 DsNUGLvY4k4PYw76jk6YsGI8wWWENCGkhGrwDtkGQ+jZkk5ssAY/rSEtViYSzWyeeAQL/z/Ltle
 nZwbq/TN
X-Proofpoint-GUID: 8sYh6Ta5z0GLNCIWeHHn71-NGfBKVz3P
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac6060 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=fJUbV6HVZzjmhIKkI0cA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-ORIG-GUID: 8sYh6Ta5z0GLNCIWeHHn71-NGfBKVz3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 25, 2025 at 12:09=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Sat, 23 Aug 2025 03:12:00 +0300
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> > driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could no=
t
> > allocate memptrs: -22" errors. The mentioned commit reworked the
> > function, but didn't take into account that op_map is initialized at th=
e
> > top of the function, while ranges might change if GPUVM is managed by
> > the kernel.
> >
> > Move op_mode initialization after finalizing all addresses and right
> > before the drm_gpuva_init_from_op() call.
> >
> > Reported-by: Danct12 <danct12@disroot.org>
> > Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> > index 3f440bc1f7106f3b0091f037611d0b433e5e2c18..6df6b7c0984da57fe64de41=
fa54f7dea0a324c74 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -368,12 +368,6 @@ struct drm_gpuva *
> >  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
> >               u64 offset, u64 range_start, u64 range_end)
> >  {
> > -     struct drm_gpuva_op_map op_map =3D {
> > -             .va.addr =3D range_start,
> > -             .va.range =3D range_end - range_start,
> > -             .gem.obj =3D obj,
> > -             .gem.offset =3D offset,
> > -     };
> >       struct msm_gem_vm *vm =3D to_msm_vm(gpuvm);
> >       struct drm_gpuvm_bo *vm_bo;
> >       struct msm_gem_vma *vma;
> > @@ -402,6 +396,13 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct dr=
m_gem_object *obj,
> >       if (obj)
> >               GEM_WARN_ON((range_end - range_start) > obj->size);
> >
> > +     struct drm_gpuva_op_map op_map =3D {
> > +             .va.addr =3D range_start,
> > +             .va.range =3D range_end - range_start,
> > +             .gem.obj =3D obj,
> > +             .gem.offset =3D offset,
> > +     };
>
> OOC, are we now allowed to declare local variables in the middle of a
> code block in kernel code? I must admit that's not something I tried
> doing recently, but I've had gcc warnings in the past because of that.

yes.. I try not to go overboard with it, but this is a case where it
seems like the cleanest solution

BR,
-R

> > +
> >       drm_gpuva_init_from_op(&vma->base, &op_map);
> >       vma->mapped =3D false;
> >
> >
> > ---
> > base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> > change-id: 20250823-msm-fix-gpuvm-init-520d87ebcf26
> >
> > Best regards,
>
