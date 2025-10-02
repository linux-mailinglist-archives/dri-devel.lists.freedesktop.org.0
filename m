Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E678EBB237C
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3659310E756;
	Thu,  2 Oct 2025 01:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAJ89+YB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695410E753
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:08:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcHDs023936
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 01:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=; b=kAJ89+YBtKdwEXA/
 EY/RUK7xmEzz0FzDZ2y2M4hb4nQW03UXjthgmqSMXl+ImeN+/c84JPJ4z8HcaqVC
 kGm6fdGj+l1I2rULN2UIyh4O0pChAybfBTc2nvMX6YO2tP3e98hlyY8LXxg1tNTg
 I6mEJCb8nERgWCIcFpiOcFKzJDTd5H28k1sXGIA9xlSAKhN7KwaLxPqz8+4ohQD1
 3kyP7S9zQp4J6FXn7fQft5TSCY9om/mTj+QadQk92PpVlwgMtKE3eM0d+RdDtAvD
 p3aHvlMB+EW/WNAI6VhRrzWF84AJR+Fq4DrZ8/VFS+Vy6CAfjtmkjdeGxqD+XI2m
 Vg80gQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977x51s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 01:08:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b302991816so9750561cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 18:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759367298; x=1759972098;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=;
 b=jwJ4C4aYPqIk9nd+a3rAPXh2Fox4XwHTKrWFIkm9F/mfJb2XPlYl6IVmqIv8WRY3tE
 BwT8XHjAIPmioDHZzwqtX5R1ZTzvwA8+q9eqhcp2pcwpqDa1Adjx5neM41RkI3Pnd38b
 6+DM6JoGOhZoU9K8oA4Pit/5cKuTSF7X4Uuo4x3k7bHzy5O5ZdcbVlQrsTomohq4qM8O
 gNuMFe1taamceuYayfmlasS3mrpYqo/2dvyN4jJYIi6sj4oRGurDnUUfusIO7nWmBm2A
 /UxvnvaZuFv4cy2Y5lRsXN9/7SPOqK4/bJBMaAPk+eiFukW0KeE1a5YuD1UMx+7rq3DB
 Zs3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuUxLm2y7wEyvPvpXc1eQr7th0AYg6pKQCO5jljmUNwGU8UvZJoWKUKSu+s/rqe50Nc760xXLW/Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx91pFzGZwZo4T2xggi9551xHiINERin/mcBqf6j2dNSd+O4ujD
 vjg+IvIDtxWeotAR2mYK8oxFnRFDWZaKfSBRuUoC3zh6cQQZJPbmrOiaidLnbEUAU4gVlKebe3Q
 My4CIePk+Ecqb/Ww9VkozgzBPK/oh404HOt0m22ruZ5MBYvnDgAqyD5vaasdnciJK/ayiz90=
X-Gm-Gg: ASbGncvblEFDL4Se6SBd41hLUeGGR4nKbgs9eZiWf8nr1wVN+6UkvrHqxgkZoMD37rE
 AJDG8xzwPeZ0N9T5g6B2vVaeUsKnSZLfRIBM+HPP+I7di5Sm530Zd0rr60aP6QSAcfKuVyjSZOP
 QLV5njGres9W8INKMJwc0R7Ui+knS+11WQ1ZDgv2/oIhBetr8f1InPk/aFVOtho4s4zD6QldSP/
 /xKko0lnCHqZwRrQr3F3UJ9ZUSjRMWrHPJaYWRZKr0RhnxXTzNrCdj9QdevgrgqT1o4B7E+fl6T
 f4yRYYBFqJnSVOt9XeaLH9UaVonC6uepAg1VhtLxkNZi+5zY4x+uSjve7LTMxiZqAoQKG71Rjm0
 QFoINSgfwiXEAkmei/v7hs6AFcxdGuPkBsfRVcIttz1fXevdNXzfyyAR7Lg==
X-Received: by 2002:a05:622a:53c7:b0:4b7:aa52:a6f3 with SMTP id
 d75a77b69052e-4e41df6e97dmr78906691cf.39.1759367297968; 
 Wed, 01 Oct 2025 18:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrZaqEqf2UGQPe+mVMDuKAcfgbDUzaQ4FB8Nc046Mcl+O0GtaoEhYIkuD7lCFi+fSNe0W6CA==
X-Received: by 2002:a05:622a:53c7:b0:4b7:aa52:a6f3 with SMTP id
 d75a77b69052e-4e41df6e97dmr78906061cf.39.1759367297485; 
 Wed, 01 Oct 2025 18:08:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba273eeasm2860421fa.9.2025.10.01.18.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 18:08:15 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, rob.clark@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
Message-ID: <o55el5zduao57uomzm6zeqslxjg7rtzfbttk7gq6gvsatapktx@5lflwspish24>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
 <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
 <CACu1E7H0Y9wLwN=ztx+YSQLMQuqOF0hYPqvF-VdXyFW65og6og@mail.gmail.com>
 <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
X-Proofpoint-GUID: eZnNAexLVDe2W7g2S8boWvm0kZn4ObQY
X-Proofpoint-ORIG-GUID: eZnNAexLVDe2W7g2S8boWvm0kZn4ObQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX3x8YA4GUeTwO
 JKPsQzY3eYO/wissDYnbQ2YU5eKYdFGSjhkuBtmAfuKNIKHPimICniXVh26pV/pOn67cxfw8Keq
 mMMDrPa5pq0B/vtlokwxtqGwHDFSXM2VHxFT0HCeP0ooraMXyA5VmJDE4qN3CEmmyk8mprbqeyl
 3uRGFDe8L/dwDPYg+MnAR8jbPzyYNvbK/oFVnxfJ6UNtLnbtQ/fZRJNG6r7lPvVD0RBYyGAlG5g
 HQsMCmqADD/JmDJnvkg0lWVhBW7pg17ZfxvZ/yIxDXz3jKVRPsEG8muEgnrt8b+LK+TA1Tjs6O3
 3EtUQbzDEQyjxBqH+4qlIXdjjihABy7uQ7zLWY7zcjgIMQ+im7KvYgfZF1hwJC/iEaGo90bAi3V
 bGC2pD4r5Jwyletfsuxzsg/2sGgUOg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68ddd083 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3yd5t0Cfpw69QvuzZ3oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

On Thu, Oct 02, 2025 at 02:32:21AM +0530, Akhil P Oommen wrote:
> On 9/30/2025 2:11 PM, Connor Abbott wrote:
> > On Tue, Sep 30, 2025 at 10:08 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > 
> > > On Tue, Sep 30, 2025 at 12:43 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > 
> > > > On Tue, Sep 30, 2025 at 11:18:17AM +0530, Akhil P Oommen wrote:
> > > > > A8x is the next generation of Adreno GPUs, featuring a significant
> > > > > hardware design change. A major update to the design is the introduction
> > > > > of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> > > > > are more independent in processing Graphics and compute workloads. Also,
> > > > > in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> > > > > with additional pipes.
> > > > > 
> > > > > From a software interface perspective, these changes have a significant
> > > > > impact on the KMD side. First, the GPU register space has been extensively
> > > > > reorganized. Second, to avoid  a register space explosion caused by the
> > > > > new slice architecture and additional pipes, many registers are now
> > > > > virtualized, instead of duplicated as in A7x. KMD must configure an
> > > > > aperture register with the appropriate slice and pipe ID before accessing
> > > > > these virtualized registers.
> > > > > 
> > > > > This patch adds only a skeleton support for the A8x family. An A8x GPU
> > > > > support will be added in an upcoming patch.
> > > > 
> > > > Consider this lands in a commit message. What would it mean in the Git
> > > > history?
> 
> Commit text is not just for git history. This sentence is for a reviewer who
> is going through the patches one by one.

You can put this in the commit message (in the git tree) under three
dashes:

----- CUT ----
drm: subject

Foo bar baz.

SoB: you
---

All the notes and details  that will be ignored by git-am.
----- CUT ----



> > > > > @@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > > >       adreno_gpu->base.hw_apriv =
> > > > >               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> > > > > 
> > > > > -     /* gpu->info only gets assigned in adreno_gpu_init() */
> > > > > -     is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
> > > > > -               config->info->family == ADRENO_7XX_GEN2 ||
> > > > > -               config->info->family == ADRENO_7XX_GEN3;
> > > > > +     /* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
> > > > > +     is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
> > > > 
> > > > Is A8xx also a part of is_a7xx? What about the A9XX which will come at
> > > > some point in future?
> 
> I think this is okay for now. I have a separate patch which reworks the
> cx_mem initialization. That will completely remove the above ugliness.

Ack.


-- 
With best wishes
Dmitry
