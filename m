Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF567B18E9D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 15:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722AD10E12C;
	Sat,  2 Aug 2025 13:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fff7fVi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6946710E155
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 13:13:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725fPA9009279
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 13:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=RwyIruoH357mBYmIQWZhwXtNEOPEWuLPLWx1UxajN4Y=; b=Ff
 f7fVi1dnNIrwXb/iMeIqV8CbfLsqBxJjIEsHJwM2pWSvtK9UZfZQP8Sb81Dsjwz4
 F/I5I1OD2CTRle5g1kzdIFsCDW8uACcl+G5XA2bVPGHlEayfgHbAsVydzLcdVSCd
 tl5qlVyIFIA5OFRTjUgxFgdrZ+QdkFxQB5G7H5v33Bklg0F6KmgLyqUwCn7HNmLT
 NcO/eTatKODfF0psNXdG0QHpheBvhQAEI/ogq0Pkdberpozom4xdZiNfU5Pui2OC
 x8t63PTD7SJtTNPx8LvFM0k1NfkuPBy6o7H9bfDsav0wujnHxogPji85Tp5drpT3
 K7bOovCV2VTUZUgxNaow==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899mvrwmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 13:13:08 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-433fa511cbfso16711b6e.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754140387; x=1754745187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RwyIruoH357mBYmIQWZhwXtNEOPEWuLPLWx1UxajN4Y=;
 b=kIFXeU9d9Itxy4vR1py/Vmc67bRb6ZkM4wd+ojNsylR0h4Y1uqJwsAy7PVf0MtJLv9
 0YgNmusPlEeYXzPPrI6XdrnG2aH3R2HUQzMZFIOsj3ogxgk3FzXHY3lDMylldBhHfJRf
 9zgr0f1lFEyK4UOfeP6ZXrvDy7k2VfMN61uaPIEH5D6meEsem51VTi3CEKFa/xRIulgO
 P/24qsTS2WZ7MyNY76lk9HbXjO3sFBln4+fHjyJtE5uhsyisPGM4ryw/iAWiIoUpQp6O
 4hzdoPCBTCeTdVfELRjy36CPN6xLS6/T4gQZoexw9Am9A6rfagD/lE/NbOgWhlEwQncT
 q73g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs+KoDv32eHsNbGIAO2xPTlKtY41k/aO70MrysGWESA/KJ//gg4+KtbDkTxnjlS2B3IVDuv/ZrHHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrwlVgm8ETk5t9UB+SbHV9tmKT+YNVi0OW5uqRx5oCvRU9z4dM
 hyd/RiQm1uM/zWVt7LzHft/I0nIUBW2CwH6f5N5Q0zGyKIvpc/NmZZ/Mp84gv46o8LBpwumXFxN
 0DzQfTZNo8hohEOe8NpWBxO/VlTRdX2Tsgr6tefFFbZSWr4o5rPB/uGC9EaFEsslqJXyniX3nJG
 3DEzLulu6TbOvuE9IZI+QHbQdQE5SEcJRha2MNcu/BvyV5Pg==
X-Gm-Gg: ASbGnctw02e74wTj297OQLxpBatxJuZ/ibURTip3Rj9o6brwyT6fOWYrJZTbO2dAfD+
 NZ7SH0x7n0o8BhPLKdmrbfi+Y8EyBD3xnuSxaPgRth5dUkZFt6h6EldrHCT1WJkigvhJpaZzwlb
 8/WJMwoMXMYs3MFD0xDtJJv0cm8ZYhTJNaRbXRKI9OMv0+k9Vjp6OI
X-Received: by 2002:a05:6808:f0d:b0:409:f8e:72a7 with SMTP id
 5614622812f47-433f0356347mr1718337b6e.33.1754140387517; 
 Sat, 02 Aug 2025 06:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWQkdajOA5XCw4IsBRRfjdIHkUjt/VC0wsWR6Nzln9EEWN+Aa4GjnIjQVDxxDcbK/En0vwGMd3+BZR/+Qkc88=
X-Received: by 2002:a05:6808:f0d:b0:409:f8e:72a7 with SMTP id
 5614622812f47-433f0356347mr1718322b6e.33.1754140387107; Sat, 02 Aug 2025
 06:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <aI3C8c4iR3PmIMGE@stanley.mountain>
In-Reply-To: <aI3C8c4iR3PmIMGE@stanley.mountain>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 06:12:56 -0700
X-Gm-Features: Ac12FXzxLB_zJXMDBnX0oji4EfdrWmXO6C4QFI5VAFWsuljcbouIO7FFpZP8jEo
Message-ID: <CACSVV00Bv+P2rzi0Wpnxba8VCTiVT_kK3voRZEZJGKrupSbigA@mail.gmail.com>
Subject: Re: [bug report] drm/msm: Add VM_BIND ioctl
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VLZKKtHi-lYUeew58clv1h5IxZai5ARQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDExMCBTYWx0ZWRfXyC+bKw2Oze/c
 8Gd0R3Z9BTzObMrXo5WzYJuzW/u62sl0495U9LQICxKF5VbiJ05kmzGAx/hnM/thlFrnolEGLXW
 x2Iu5woGItqqHQUDnMICL4blCNrhTJjuay4x2jrwDLpcxKL67q8CzQFhOcKvpmGMdsRppSTf1ac
 GEAbrAMGaSgynuaavHHs3zKn1z8yp36jfwyYjx07wbewt7hIuUbVxRQ3C7N0aapSdH4GJSrkATr
 f0if2A/w3NeDryYfVVS7f6ThAINk/3uJCqcUQIKe/TmsmXujWXF3HJu8Egg3kszqZ1C3rW9rZ9+
 alQriKSzjnsd/F1ennAbJYzBDCg0SUH/qh3lSBp02zBb85W7iA2XpaNAMV+gVPcALs/lu8NCWOw
 l8bwp4ZMpnYVwA9d6jt1Ca7Taybo1SwcwTx2X9Yvr0QrkrOG7K1gBBGNy636qRBtqS7ayQnS
X-Authority-Analysis: v=2.4 cv=duXbC0g4 c=1 sm=1 tr=0 ts=688e0ee4 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=KKAkSRfTAAAA:8 a=h7oZlVOF9mIUhsnAhVEA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VLZKKtHi-lYUeew58clv1h5IxZai5ARQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020110
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

On Sat, Aug 2, 2025 at 12:49=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Rob Clark,
>
> Commit 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl") from Jun 29, 2025
> (linux-next), leads to the following Smatch static checker warning:
>
>         drivers/gpu/drm/msm/msm_gem_vma.c:596 msm_gem_vm_sm_step_remap()
>         error: we previously assumed 'vm_bo' could be null (see line 564)
>
> drivers/gpu/drm/msm/msm_gem_vma.c
>     521 static int
>     522 msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
>     523 {
>     524         struct msm_vm_bind_job *job =3D ((struct op_arg *)arg)->j=
ob;
>     525         struct drm_gpuvm *vm =3D job->vm;
>     526         struct drm_gpuva *orig_vma =3D op->remap.unmap->va;
>     527         struct drm_gpuva *prev_vma =3D NULL, *next_vma =3D NULL;
>     528         struct drm_gpuvm_bo *vm_bo =3D orig_vma->vm_bo;
>     529         bool mapped =3D to_msm_vma(orig_vma)->mapped;
>     530         unsigned flags;
>     531
>     532         vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vm=
a,
>     533                orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va=
.range);
>     534
>     535         if (mapped) {
>     536                 uint64_t unmap_start, unmap_range;
>     537
>     538                 drm_gpuva_op_remap_to_unmap_range(&op->remap, &un=
map_start, &unmap_range);
>     539
>     540                 vm_op_enqueue(arg, (struct msm_vm_op){
>     541                         .op =3D MSM_VM_OP_UNMAP,
>     542                         .unmap =3D {
>     543                                 .iova =3D unmap_start,
>     544                                 .range =3D unmap_range,
>     545                                 .queue_id =3D job->queue->id,
>     546                         },
>     547                         .obj =3D orig_vma->gem.obj,
>     548                 });
>     549
>     550                 /*
>     551                  * Part of this GEM obj is still mapped, but we'r=
e going to kill the
>     552                  * existing VMA and replace it with one or two ne=
w ones (ie. two if
>     553                  * the unmapped range is in the middle of the exi=
sting (unmap) VMA).
>     554                  * So just set the state to unmapped:
>     555                  */
>     556                 to_msm_vma(orig_vma)->mapped =3D false;
>     557         }
>     558
>     559         /*
>     560          * Hold a ref to the vm_bo between the msm_gem_vma_close(=
) and the
>     561          * creation of the new prev/next vma's, in case the vm_bo=
 is tracked
>     562          * in the VM's evict list:
>     563          */
>     564         if (vm_bo)
>                 ^^^^^^^^^^
> NULL check
>
>     565                 drm_gpuvm_bo_get(vm_bo);
>     566
>     567         /*
>     568          * The prev_vma and/or next_vma are replacing the unmappe=
d vma, and
>     569          * therefore should preserve it's flags:
>     570          */
>     571         flags =3D orig_vma->flags;
>     572
>     573         msm_gem_vma_close(orig_vma);
>     574
>     575         if (op->remap.prev) {
>     576                 prev_vma =3D vma_from_op(arg, op->remap.prev);
>     577                 if (WARN_ON(IS_ERR(prev_vma)))
>     578                         return PTR_ERR(prev_vma);
>     579
>     580                 vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, pr=
ev_vma, prev_vma->va.addr, prev_vma->va.range);
>     581                 to_msm_vma(prev_vma)->mapped =3D mapped;
>     582                 prev_vma->flags =3D flags;
>     583         }
>     584
>     585         if (op->remap.next) {
>     586                 next_vma =3D vma_from_op(arg, op->remap.next);
>     587                 if (WARN_ON(IS_ERR(next_vma)))
>     588                         return PTR_ERR(next_vma);
>     589
>     590                 vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, ne=
xt_vma, next_vma->va.addr, next_vma->va.range);
>     591                 to_msm_vma(next_vma)->mapped =3D mapped;
>     592                 next_vma->flags =3D flags;
>     593         }
>     594
>     595         if (!mapped)
> --> 596                 drm_gpuvm_bo_evict(vm_bo, true);
>                                            ^^^^^
> Unchecked dereference.  Possibly if we're not mapped then it's non-NULL?
> If so then just ignore this warning.

Correct, the !mapped case will only happen when the shrinker evicts
BOs.  The case where the BO (and therefore vm_bo) is NULL, is MAP_NULL
mappings which are backed by the PRR page, not a BO that can be
evicted.

Would adding a WARN_ON(!vm_bo) convey to smatch that this case should
not happen unless something somewhere else was rather screwed up?

BR,
-R

>     597
>     598         /* Drop the previous ref: */
>     599         drm_gpuvm_bo_put(vm_bo);
>     600
>     601         return 0;
>     602 }
>
> regards,
> dan carpenter
