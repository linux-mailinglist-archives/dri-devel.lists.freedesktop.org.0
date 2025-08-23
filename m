Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB7CB32904
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 16:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7FB10E009;
	Sat, 23 Aug 2025 14:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSsFUZZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359DF10E009
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:14:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N3fM20003966
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=hq+jica18d7wO8Y/ug5Lom/zPuKSHhUnRgrzqyuE1Rw=; b=eS
 sFUZZcCBTKkhSfcVh+qxTkj6/ccHad0WQS7Gexb1Tuylfp7hKYpzKKx90SZI2704
 17AjcJT29nIFjb6nDhVYra5c5npb0IMPngfPgN/85MWaXUDc1rHAcHz3GziDyuP7
 rkIKkRbV1zbgqcQ6ClaVrLYZbg7eb6e6zqc/574TZBbVxwAyvY7q76ZAPS+PZgh0
 kMNQK84DmDRIy04iEenOeIbU+XIJkEUQuDl0Ed99RkDXQ2P4cBmuflhAlbgPcGpe
 2sz0Ap1ih/jT9kaPeKf+YYQsRVRrwGBR0FgOnVblH6Lp6U/4bmriBl/JYc3fze+g
 qdv+aV44zQlcx5re9tGQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y58wya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:14:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-435de7c19f0so1094478b6e.2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 07:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755958459; x=1756563259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hq+jica18d7wO8Y/ug5Lom/zPuKSHhUnRgrzqyuE1Rw=;
 b=PXu/KnMO1sNgYSyPz5s5khKJrOb0NLyLde1XP46G3+p/my/X5+Onughk9cN0JeYgiE
 LBxzn104SEzkDz9nbPtshVuK2WrcIB2madBtI+vlFkN3Qrv0fFFT3ZUBo89yLJJmWsSl
 N1zxk52kpXh6Da5Vkkusb2xYRscQR9f5l6V0u+f5K9M70pnCRMUpoqa2uViZ/cYk87sy
 poQbFs5Q/4XoILGjR+8rJ90IzdDLGJQ0GEhR8t++ef0cx/4Orhll2IG49d7NjyN0TuXb
 Is2/GIacFHipmMIg04Q6U1/Elbt4JqU9ht2I8j5BoIZJrbhntdU8szRMlhbTFzTHCTJz
 qFQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZUTybbMRgr3pvW6JPiMLF8avXhMf3RrmnVUrlZIVVxIedum38gN6k44y29K9JlH17ecnooY0N3Hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyetW1OqbWMW5CX8ym8C9GCCFwunmn/lGNuXReQJ5KTTsAqHhs3
 f3atQ0r5/DZa1CcpzNDY8hX0UWwuArj2mCSzDb3t8QjDf4xj03ut1JXQplPTMi9gLWRV0np004h
 ukvNSVK/SmEFb6bCqNJa8Nq902t6da/1upRSUL7xHIeS45ovIl/UVKUP93qDbHFcbee1IUDufQs
 Kl5u+6nSb8+dNeXkwVj4QI9YWwkbfSLTT4eaGzcEqwOGcuig==
X-Gm-Gg: ASbGncse6EHjQN6xpE4e2BUwcNnVXfpVlgI8AseX3wopAqEG0zrHNPs02fFiZbttuJb
 F5CTe9NFiiJ1o1AgWcoUNKswsDph437hb3Ze3WzlFD2nJK0kEXW1AHBERrbfU/f+0X0wP4i7I6p
 XbRn4UcO3usHsoRi4Qn3dP9uDiN0pN/B0TZu9yzqANd0AMzz2NFd3X
X-Received: by 2002:a05:6808:bd3:b0:435:902b:ed82 with SMTP id
 5614622812f47-437851c6f62mr3443142b6e.15.1755958458928; 
 Sat, 23 Aug 2025 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaa0KNWcAiEqgNPw4u0S8UVbV1rBVNv2UYsT3Lse+1st1+/U5kXNW33XfG/8rpFHvtI2/bQLrM72oS057vff8=
X-Received: by 2002:a05:6808:bd3:b0:435:902b:ed82 with SMTP id
 5614622812f47-437851c6f62mr3443122b6e.15.1755958458496; Sat, 23 Aug 2025
 07:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
 <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
 <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
In-Reply-To: <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 07:14:07 -0700
X-Gm-Features: Ac12FXyq0kZZJI5O-DfBShZ4wpACZxqRul7R9cVVMfZTUO4D81g_hv8uQdEnXFk
Message-ID: <CACSVV01uwUZn5JcT4of6GCJT23+vzcnSR1G6_6_1WGA7iJNegQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danct12 <danct12@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1YrBXwxnskCL
 IKoZSkiUIMiNrXl9PMXYXZ4CnIgiAIBElFFjRpm11pBbMWtr3x2zgpcSsE/+d9nlpszrAQpv2wb
 P1tcvH2fYLhyRN91nN+SEkoaC+NNgQXx2BpC31W6/c3VMZcdV5Ll/Ra2yQtjMx/eegYCxkwrBYh
 hQwZ8AS3dr4O0r+EN4JhB6Z1ebBQjeSR9/cMZ+hD36HF6WkGdSDHvZ+xpEfZSmcZq8OSPIaO2Ti
 kZ0gDgOoOVau4DTZ/KCj0WOdBRibSm9WrH7OgiPxXBPtfpCOBfwfzAzT52lwBWTPnsqdPAhMpba
 XEolBB1Z1CCNtK7FSXyMayAp+aCimEJ23JURjKFcicKHhRXO2gPQVYZ20ZgSGOA8EOEI1956rx+
 LF9/uKfi
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68a9ccbd cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=nYsNrKCB0-J-WGV1dNcA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: YSzwkuZdrxLkLirzBPvcHCvvDl0NxRZi
X-Proofpoint-ORIG-GUID: YSzwkuZdrxLkLirzBPvcHCvvDl0NxRZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Sat, Aug 23, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Aug 22, 2025 at 05:14:02PM -0700, Rob Clark wrote:
> > On Fri, Aug 22, 2025 at 5:12=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> > > driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could =
not
> > > allocate memptrs: -22" errors. The mentioned commit reworked the
> > > function, but didn't take into account that op_map is initialized at =
the
> > > top of the function, while ranges might change if GPUVM is managed by
> > > the kernel.
> > >
> > > Move op_mode initialization after finalizing all addresses and right
> > > before the drm_gpuva_init_from_op() call.
> > >
> > > Reported-by: Danct12 <danct12@disroot.org>
> > > Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> > > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
> > >  1 file changed, 7 insertions(+), 6 deletions(-)
> > >
> >
> > Thanks,
> >
> > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
>
> I'll also need Acked-by to merge through drm-misc-next, where the
> offending commit is.
>

Acked-by: Rob Clark <rob.clark@oss.qualcomm.com>

>
> --
> With best wishes
> Dmitry
