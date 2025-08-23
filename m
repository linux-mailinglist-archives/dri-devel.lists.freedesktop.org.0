Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE49B328E0
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 15:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915610E13B;
	Sat, 23 Aug 2025 13:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nio6dpSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B338010E009
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 13:50:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N3Y7vh021282
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 13:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U6vA7pywJ2vttXsunG5ab7QCq7Dn4Mr2hiEppiVxLW4=; b=nio6dpSUo4+XzYvb
 +g4FAc6M4J86Rqhz8jovolyoTvjXpbL5SvbEeT5bcZGCLfRV1jt7p94B2D8XmKcu
 uVsmbW1JNSfcmo/UgULX9OD/zMNy9DUbM/HbQAlusOIzocf3GbYS9aJ2mMjKsgYM
 hn/mWo+V5FaYFta55RHDn+p3i8rXgZkvUXNLhYI9YGYQdhS8sKJRP55NcgSZWTy2
 t8Gzm424GUGWs2emuFalUSt6LQjYC+SpgJLJI/GeOPEZ2jJ/zjszfJ0XFmyHAQW4
 ju/qT+oiftxCiDsPfV0kw2g+bWwDRGXSyXtXtIQGrbISV0I0iAIV/b7DM5+bm6rW
 2bh2Cg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc0wh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 13:50:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d903d04dbso54360746d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 06:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755957025; x=1756561825;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U6vA7pywJ2vttXsunG5ab7QCq7Dn4Mr2hiEppiVxLW4=;
 b=YxRmCYLCSr5/eXwfbUXbEWEkE6St8RULFYnVcRfmh+LsNkmugt7hfvL6vBuinA5PPU
 YyItIuGTtUmpYApI2EHVXfu+kFfZ6dpdx3jbhfOPj8MhEmU3Swjp4JwLF1DNFovEVqXI
 0GfVZL8VB7nBOJwjJBEWfAmWaOn5u7khE/pcvZxDCe4X0HtFxvbDPo2hwkPm7qHRK2AS
 yaR8OQG7286hVW/4UACLckCwid2wEd/ErzTjmjm81enLzXBxmTtpl8Ng/L49dqZTcMHt
 OIu4FClE4PO5uD0RL5hr2skd0JmuTLldIlvra3MnzYdI+pbXazQ2f6PD+/YDWzzw9zJy
 mHaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/oXUUBDrOm73TKmlv1TPJnpjNkSXjZseYKqe5bg00VJI9H4MoLXBQeoBOKZeaecvo42PBqHV8mjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJBKlI9TDzlrnFrlzWckVedCg6Xe4UA0tQ7muhuUZClPc5F5l6
 PhCqH5BAlKSy6WNk3HQK69jtOYPDjtPQmAFa8pfN20GjITe5iHsq/K0MmC6L823IvVMC4Z9cH2w
 sousV7cMlN6kb658HZNNW4dv/I1eWIK4RZkLVYlAJxJXATe+f7kELKhwc56tDIWieSNf6oIY=
X-Gm-Gg: ASbGncvxQBrtEdxRYrLWgOd732nOTO8x+nhoUrp5cZ8z79W6gI/eqDnHWXkDYDaAq6v
 m6hGER6nZ7hm+7isGstze3OSgtySo6TrcYsNLmh344rUx0EtQHBtoZBf2STXUaeyuMSPQGDlFX+
 Tpdx7rtY+2ZM/ynJ8/XVivxoWoyQf1wQJHiO2X/h7XOmBUgbcXMzdeTb5HZMG3bch+GeaysQv2i
 bn0vlHW1qIw4q9v861OqF6ev0jD6un4mCOQ+S4Jm1/n0JJpmbColQj5HU3m6b8+t5y+eWSGCinf
 b5CJY7P2VnVmY9mhyRI9RB3u7G5KDaAxNOSxAOMcqQM3AEt1K43OB5Bp8mgeR0O64ph1iqnfJXa
 2gys4tVEgQi17QHI4xD00F1NCwz1d9b2FxVopOrfNy9KHlr4ZZdAi
X-Received: by 2002:a05:6214:c81:b0:707:4753:bfa0 with SMTP id
 6a1803df08f44-70d971f69ffmr70804756d6.13.1755957025521; 
 Sat, 23 Aug 2025 06:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyTpNiIvNNs3fPAEjRcZ3bS7cPtXKDiw2pj/9JSAEBFNfi1voXXeGw+P9flbkF2otl4ev4xQ==
X-Received: by 2002:a05:6214:c81:b0:707:4753:bfa0 with SMTP id
 6a1803df08f44-70d971f69ffmr70804426d6.13.1755957024980; 
 Sat, 23 Aug 2025 06:50:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5fc05bsm5159881fa.69.2025.08.23.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 06:50:24 -0700 (PDT)
Date: Sat, 23 Aug 2025 16:50:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
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
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-ID: <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
 <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXyw52eICY5QKP
 wJTq37rV2ZsAJncapEfxDnGlx5PbYzKhYcb/5yCbTVF8nLEKvPEIobJv5BeyhlB/w+fzCjQ7SdN
 VZ5miyhZQ4+aeX6WQQIxR5r+woQNmVh8rWn+omJ15U4KRbj7k8a2hSKWM6zcDKEvxjForK/sp1D
 wt/hx2htL+2HSeqrgemcmkg1vofhuhsojQxsSgu4TkOXqWUe6IKAADB+amMxhoIGOZCiBfgYWD2
 3ZXZzGGdoAwIAbijDVFeSZTohM1RWSPkFz7FDg8KxkHjYYsKoIg0w7gVv6J7XOjOoKdogUagHhE
 4wzDyMQhMIfjgcLys8mV0hFu6qU4PC42vR/cujXm2WZwQ9cOiPK2YIpWrG22kkq6zfJuLRJspv7
 g/lYAm4N
X-Proofpoint-ORIG-GUID: 8YLTGz5of1QAbwMlDFPTvFN8iI8j2cJ7
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68a9c723 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=e-On7NsmxptUPx_5N0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: 8YLTGz5of1QAbwMlDFPTvFN8iI8j2cJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Fri, Aug 22, 2025 at 05:14:02PM -0700, Rob Clark wrote:
> On Fri, Aug 22, 2025 at 5:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> > driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> > allocate memptrs: -22" errors. The mentioned commit reworked the
> > function, but didn't take into account that op_map is initialized at the
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
> 
> Thanks,
> 
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

I'll also need Acked-by to merge through drm-misc-next, where the
offending commit is.


-- 
With best wishes
Dmitry
