Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEDABAF4C
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E595810E1E5;
	Sun, 18 May 2025 10:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cagupj3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E86510E1E5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:32:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I35DZM029896
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=; b=Cagupj3DupOaDdl6
 hZIHTICpCYogEUpG17UOi7aniNW9zbtJ8S0B/WFJKxGBujRSALz40kNN67ic6Imb
 dafeHScYr+SEcsBPMejJ+zgPXIXnlKRnwP1STx1djW7IIlJl7IUw+5oPB5J/bzb6
 ZsvFkYLDfF11iRCuGNAwkf2wf6NBJ9lxxqTSdZhOOJdY8l8CvkgLLANKhK6W2dGo
 CBdBJXZXsW2N91bQjdZKPJVyXiVNPkeEoU6tt7mW6t+0fd+o6DWDupPeWvuEGfJk
 d2hsn9F1ZpxgTeHBorfPP9RWlPbm8oZMuh9vlFsKtdPsjwjKMXu+mfITrA2PHg8Y
 xYoukQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9ssup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:32:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8d3f48f35so5225956d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747564363; x=1748169163;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=;
 b=dqvOA6fFZkw237LG4LN2ZlH9yUVY94sjnnzqkqYv/ntrtYfHlMJ3pWGoICkvqpB/Sb
 bLNf4VtwjQtDg7bG8DZgDZrnAHyLCG0nMzY7NRwQQLITstTs/XYPBmpyUxN2B/+fXSaF
 rZbRFaCjd0krWcTiSQtKtvTsCFwPzVw36GcWpwWGqf8i2kM8ntW0SDbVfDENprnZ24lo
 V4AfzM+1zJFTfGw1kWv2gx5AiJu9xgpvYppe1r3JXEHT74cnxmPR7KsE43qC11/M7jEk
 XP5iA3J1w8upjWfUGr0OkMiRccL/+ChlCRGwU3H5Hc7++Xuiah8iN/FRM5z+YjZINsiu
 a/2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwdzRsNFRbO/+/QTAU1NFBizOvg27tdLKI7YJZRm8CM1Go+wSAvt3113v/xiPy3UAvkCKgkLyCq8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmoR3eJoF5HYmScMq6JPGHV6rrpJEaEYAuLIJLsz+JUph7Ih0x
 ljoyzh4smF05cSjStrxNxN1CeGstCeTlYn8EOsYD7iGelwk0AGPCGlNviHdow1R5WK9oGq/kihQ
 Frw7JX6Pba6xN7Qpo6avhf/EK2yPG/6zCYUeQo461pYznhhNWN8XmJBTIAXtWf2GFd4lTB/M=
X-Gm-Gg: ASbGncsiRBhD5ovcyigarn4Q16sMBHmRrqZrq5s9HAkx+VoTwi9PaGvozPkWW/3HGrZ
 rGeP//jjY3mi+Wh8Cx9SKji6/9Y+NrfOvUr2yq4PLdYHvqvC592L8uhUkqBnxB/uKynRZu2hw65
 qwu9tQcKZFg9aUnizRZaLp+Hq29MmB1puyhegBjq9URZ4ra9+7m7SliIhZEvduCSui/dYPQa4Xu
 ZO2swcNsqtyL5eGPtaSRAqVDm7zGRrSTjJl+bobFu+Jzq8ii7uIWP8b9ieHSdV/lj7cdRqE73sX
 bekRrlF9RMVhbLkbFMQnQYaIbSIFG8X1eFXI+97o7kPJmTVQBWsA1+OR7+f8rxJWEEc2bfk2GSs
 =
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id
 6a1803df08f44-6f8c23c82b2mr69977916d6.11.1747564363388; 
 Sun, 18 May 2025 03:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPoFsBUaDrnwOXnuPwNlAF6cFAuLO04cfaVzqOcUVBeyq/FhbV/KeXlfPcZ1p20TjPJxmqKw==
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id
 6a1803df08f44-6f8c23c82b2mr69977686d6.11.1747564363030; 
 Sun, 18 May 2025 03:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f161bcsm1392553e87.7.2025.05.18.03.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:32:42 -0700 (PDT)
Date: Sun, 18 May 2025 13:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] drm/msm: make it possible to disable GPU support
Message-ID: <b7zkrdxmigz3bmgphedzoosgesxs3y24wgi4l52zf6r6djo7vo@aupsak7d6ma2>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
 <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
X-Proofpoint-GUID: XnXZiLm-r94H0b9szfeWc132wA5pqfFp
X-Proofpoint-ORIG-GUID: XnXZiLm-r94H0b9szfeWc132wA5pqfFp
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=6829b74c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hVAVfT_TPH0Tf30rILYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5OSBTYWx0ZWRfX73QmNsNcUWzP
 AqBcqYRjRgDLwX8r6OBhgzoF47QvsyRQVchsDRFeU3OTmZ0A/E9LTEMc7/Opt7Cwob5W4JnKHFZ
 E0CWUUc3unNuSEkbvmreAy53jzLho/d/VX2aWIzAY5D0hzryCxODyDW3tt2dROJsIWrwHjGn18I
 ETZh1e2njtMbmMKgs34+1PR25uvocakpb9svuGD+mq4vW0A4Gj2Y3oqli+ZqLyTVg8v0WCs7k25
 Tr4EShBBHgVWK/q0WJBCWCqPprAMNHoJ0Ob3K8VKavey4ou3iVYACfzdzjiDpmUulpjuvdusOnR
 dHSMWXJ1cNqTl4EXe2hIWxsvaAxKhgbqrs36XBL2R9kk9ngE3T2q3IRuvDEtZZieAbuZOYaa6VB
 nxtQxXzPWsWBHW96SMSucDuyv6WcuMiMtZ4enEPl8COmMPiK5FNR1jtlG5BIvpX/CXuOMmlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180099
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

On Wed, May 07, 2025 at 09:45:26AM -0700, Rob Clark wrote:
> On Sat, May 3, 2025 at 12:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Some of the platforms don't have onboard GPU or don't provide support
> > for the GPU in the drm/msm driver. Make it possible to disable the GPU
> > part of the driver and build the KMS-only part.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig           |  20 +++--
> >  drivers/gpu/drm/msm/Makefile          |  14 ++--
> >  drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------------
> >  drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
> >  drivers/gpu/drm/msm/msm_drv.h         |   3 +
> >  drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
> >  drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
> >  7 files changed, 191 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f6360931ae55a2923264f0e6cc33c6af0d50c706..5605d2bc93a8ad9cb33afcb8ca9da44c68250620 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -15,29 +15,37 @@ config DRM_MSM
> >         select IOMMU_IO_PGTABLE
> >         select QCOM_MDT_LOADER if ARCH_QCOM
> >         select REGULATOR
> > -       select DRM_EXEC
> > -       select DRM_SCHED
> >         select SHMEM
> >         select TMPFS
> >         select QCOM_SCM
> >         select WANT_DEV_COREDUMP
> >         select SND_SOC_HDMI_CODEC if SND_SOC
> > -       select SYNC_FILE
> 
> fwiw, atomic depends on SYNC_FILE... otoh it is selected at the
> toplevel by CONFIG_DRM

Within drm/msm it is only used by GEM_SUBMIT code, so I still think this
is correct.

-- 
With best wishes
Dmitry
