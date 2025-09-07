Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F1B47A93
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 12:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5A810E1AC;
	Sun,  7 Sep 2025 10:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcHGEupK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CCC10E1A9
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 10:57:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879L8NW001590
 for <dri-devel@lists.freedesktop.org>; Sun, 7 Sep 2025 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Utiwmvf7x+ib9aisS1Pi13DrFz7GSmiEyGwpkMiTHUI=; b=HcHGEupKcXYaoVUc
 QoJz2YXnCAJB6vwcxdVSqlUcYD9PyqGiHfH/BPE31XTRUDQfzpQJoI9IEPOEJhDj
 UrEOzbgoLxuK+2V1pqipwvVQ6/2oHylhtzNoklEGJpFBzFT6Kfhnoe0XmwmwbUtD
 LIgE+FGlDcvebMANa5dSwvRIV/F0/XAO2jBpQ94RMTIUwUeyaAQF2hXPPy4nRUb+
 cDG71JBruJnAXI6cHa9+YeI8B08IcwU2C5Bj+95CLCj6ybR+22QUp6DtXfqouRn2
 zc4lem4XcQUCKgtlfLs4Awdc1sE2ing+r2QjJYl0sZRP5dHXjJ+VhF1GV0+9vW4z
 pcYYiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfswek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 10:57:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-72108a28f05so140552526d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 03:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757242665; x=1757847465;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Utiwmvf7x+ib9aisS1Pi13DrFz7GSmiEyGwpkMiTHUI=;
 b=lTdOp6lvHExF9mtHxTQXEe67SvQyHGl39t54B3r23BXQcHyi0sWKSklOEF8/4dMR8v
 qxDNiPJSbYlJU0WdtXO925kEbsIkIXd0bRBwprsqtIvwxPxTONtah3irw717aOPV99j6
 fPkARSULltYcAE8vjH7xpHQWpMYNLabLnrURW4qISztu7sB9S7wB1h9ekrAYlYwMpwBr
 T5SjV9B537OBgJOYxwsIUQKIy6DfB6plhrmh2PfQWFh/vBt/pHif/ZCET8XnC+dtf0I9
 2r6k5t/NU4Del4OzfRxaz9Fap1UkSDRF+xGtW40u+uiZuQAo00YJWlu180NN+fMVEQil
 9FYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmf2LgkP+Zs7nIvQkFcRcVmwSI8bYIpj4uel838cjyU63qR33uk3ZFh0T/mceNzeMfyYR8nFcz/Jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBqeiM9ie1GbIW5eqcjT9xV3cA5i5ho64AMEPCWznXQxvY9S/t
 n9jPvBxkjxf0puJXQqOcl6X7sHDxL7A8pS9dBu+ofsawbXhs6enUjgXL6IXt/lYii0QPuz+08/8
 kVnTybqOH1WvkVqjATpBRylJ4bs+jkyyR/ifr+7B6BI/mxt7KdZGFDu9viQ2epT9eC9M8Gw4=
X-Gm-Gg: ASbGncsBwL3yyyi9LqentfucVCK/FGWjxb+Fp3s+Dz5g28/44+mqBO5pPuxhp3vlU2J
 bVHXe8uID4e8mQPPXBisBjE7qUwKQtTctte/Bke7rjJHkPV9gX8DmRG7wfhjjE87sDnKL84UJ3F
 2EQGphJ0TC213ipZSVuxvO1wP8wRuIPpFT46n/fwrd2EX4H/54pcRdZjbU9V7+9DcjAP5Gye89O
 A4Gjir89llDjrZtSuPNTYT74SHf9v6yoohY/Tu7OkrL+aRWvIKDjLNosKSukLD0NTjbVa16Spia
 7hCJLoezSM2ZP5WlUaAdD1U/FOC6e64aI90U5vuwaXPuh6Ja8/id3toyV9YyOjzge9BgLnR16vx
 D+LWoW/KDRt+xM8xKL/qWcemvkhB5nhXr87cKNu96Kgzy6YJ+DzBb
X-Received: by 2002:a05:6214:e48:b0:70f:a8a4:e987 with SMTP id
 6a1803df08f44-7393ca985e0mr52736906d6.44.1757242664780; 
 Sun, 07 Sep 2025 03:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH67snNXBDbOrGPpeIUXj3nTtQsTDZBXe0/FNWFzMKo22DEE8TPYZk+Wta8WeNkI8sjpu08A==
X-Received: by 2002:a05:6214:e48:b0:70f:a8a4:e987 with SMTP id
 6a1803df08f44-7393ca985e0mr52736756d6.44.1757242664396; 
 Sun, 07 Sep 2025 03:57:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad4e2e3sm2850443e87.147.2025.09.07.03.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 03:57:43 -0700 (PDT)
Date: Sun, 7 Sep 2025 13:57:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <eoqcx4cjrfuf5a447c62ydrrvxncbya5iw3jgpvfdeijp6be6v@goctbvocjywa>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: LULMaWG67s9SBRPuJtDbTpKeRoC2EtmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX4M2h3oh1CirP
 F96PLz0polBdvyN17P8U7KFwmdA7eiVqBQ3YfaBbLUzt+B+No42SbF3YYBJTUJMX6MB41HJBv+T
 eHpt1heYZ7H4WME1hW+FNv/ijX6Qn465ZNyRbijB+topXHgYvSLFqGfxTnkBi2+UMVtOevCNn5Y
 cpSOK+tG8mybYB6QYFHdyrWzfptGR5gk9a9GMkU0MxmJn2ycReexBWIk+fWi9NFwoOPxS/vIKVf
 UYnqYC9TrbS3qNvkMogiKIGmAsNH1U+kqTWA86EtGalysFr5sZJ4Y733S8EuKp+2xsDVtd+ALbS
 0/eLgsjGXQSBxyG7ZXOaCVTHcaaE6nOFygGw5JjSVXNTvaUQr7Pb+MsmZNTWW/b3CDp+behIS/4
 luE3uJNi
X-Proofpoint-GUID: LULMaWG67s9SBRPuJtDbTpKeRoC2EtmB
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bd652a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=-TsAvhh9eNYMg2Gy3vkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

On Sat, Sep 06, 2025 at 04:24:29PM -0700, Rob Clark wrote:
> On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > > From: Ryan Eatmon <reatmon@ti.com>
> > >
> > > The files generated by gen_header.py capture the source path to the
> > > input files and the date.  While that can be informative, it varies
> > > based on where and when the kernel was built as the full path is
> > > captured.
> > >
> > > Since all of the files that this tool is run on is under the drivers
> > > directory, this modifies the application to strip all of the path before
> > > drivers.  Additionally it prints <stripped> instead of the date.
> > >
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > > ---
> > > The files generated by gen_header.py include the source path to the
> > > input files and the build date. While this information can be useful,
> > > it inadvertently exposes build system configuration details in the
> > > binaries. This hinders binary reproducibility, as the output will
> > > vary if the build environment changes.
> > >
> > > This change was originally submitted to the linux-yocto-dev kernel [1]
> > > to address binary reproducibility QA errors. However, the fix is generic
> > > enough to be applicable to the mainline kernel and would benefit other
> > > distributions as well. So proposing it here for broader inclusion.
> > >
> > > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> > > ---
> > > Changes in v2:
> > > - Corrected author id
> > > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> > > ---
> > >  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> >
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Rob, WDYT?
> 
> I'm revisiting this one, in the context of trying to re-sync
> gen_header.py with mesa.. but it is only changing the contents of
> comments, so it's not quite clear to me how this ends up mattering for
> binary reproducibility.
> 
> That said, since the generated files are no longer checked in to mesa
> or the kernel, we could probably just drop all of this if it mattered.

SGTM.

-- 
With best wishes
Dmitry
