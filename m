Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC299B49B4B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F0C10E5D9;
	Mon,  8 Sep 2025 20:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwsAPDy5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6D710E5D8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:58:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588H6gLZ022751
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 20:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XT4D6Rl6xH7fkqut4jVRGRITzuU+VSPL2bAYsUG2sK8=; b=fwsAPDy5ELsm5PqX
 Fro65gKobXPjGVoAHUBkPxR0EE9A7aLm7onUviGKb37+JaUjjsWiBlZepLTJRWii
 2gShlA3u8TTcS56DxxoS/AkQS55kqxTu+Eb1FfXJ4taHz+m5d51VfizsvrANYptr
 LL2BOw2Y8lMqH3ykncbGTt1l9paupuF43t//RGdTL755WhZykTmjT6KGyKalOt3b
 KDe79Ugy1RP3iSdXSymD/+Tt9AxWsWxHUPTw8nXUoQ8sMBDh29genLN1OO2Od06X
 9r81FgOvnQ1SLSxPiWpD2x5soj78B8rl1XyFTjcGgzIzD2UvkfBMjzS4IAXqw0Na
 J4+nUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc21x41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 20:58:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b60d5eca3aso42483511cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 13:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757365101; x=1757969901;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XT4D6Rl6xH7fkqut4jVRGRITzuU+VSPL2bAYsUG2sK8=;
 b=pQriI3rAAE6ygE9MwiIZ1ARSkhqgdZCLb/Uzc9HqFad409PWsT+UQrmz7/JnUqdH/O
 C+w2MGE330quYfiDRwus059PUrNiLFdPwx4E0lh+BiRpXOFFX0IWDGzMo44AmcSO9+U+
 CVVnLd3T3uQH4SdzV0DyoLxU2lQ9zvSvre8txbQqRX4ABFNh3RdklEJ1SjBAU6Dedj0R
 RgoMI8G1zz01Y4RmJf8RUWN0Nw+M8/jzGE8EnjyqsBZpWMF72qwgSpZDQm+4ZxHg+5l8
 c0DlUFgmtQIY02DLjB4A7/xDWkTdRYzW+1yA6ZuiIiudci/aRKjZ1UUp6W7PPHCs8ifw
 2L3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHRZpjWxyKqHbugjx+DK3A3ByNCctepFz+ezdoRsnw4Bl8iPm+08bEkJor5bj+eKpmIrZoxSr6TkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2+G9KrwWcWMfOt+9tL3S3Q60Kynj3otS1clB5EiKIsrjLb93I
 8EjdEai59m1Y69IXMTDKAESO00RFIgsDho8B7Pa9dvG/f6qDfLhgkEumvDhEWX4qXuuplGlo++K
 DPSs1OFaOhHy0AGdOOr9qwFofZYNhci7pvG59n+jdbxtd9ANMv3/C5dUpW0LkMvjudzyOR/I=
X-Gm-Gg: ASbGncvOZ4aE0u6+XRFlrxmUUMOjigIlCfuF5Y7Iv/zqiKrEcy5joboGYtYwIWpraEv
 ItanWxW3JI7Zcj923py9DUwaAmniLx3SaGoDmivdtURMFfVcxW4jxJ6I5ulYIX5xsMMxEkpupFJ
 xHUe780l6NvmzIDJ30177uMflZQyMV5mnuvAMBDqJ/pTmt5xmdI8gjkh6NBuXwnR94sYuYq5S64
 lw2d3ofy1VPe57mddbS+pGxWCSBNA+wDvmyoe28sPja8FtQE0fNbhkJrR6KIVCV7gh9/8qQS6T5
 n674Z2JjvyzfCXVJW1iccDScjZzxT6v4ygjnnXVaUrVY32om334dIKfITHb/t1yFOQBf+dS4gxv
 oBKdV4nQs5i+/I1REeu1iru6w1EdV7eeRxvVu64qG2/sSm/nShJec
X-Received: by 2002:a05:622a:164a:b0:4b4:8f35:c902 with SMTP id
 d75a77b69052e-4b5f8386268mr101015511cf.4.1757365100928; 
 Mon, 08 Sep 2025 13:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgGo4AskYYA97bXQw5ZnjKY3trY7Q/2Y1T6Qh64u6FXmuTPBJyX/pqKAgqBTyfCqSsjgeyRA==
X-Received: by 2002:a05:622a:164a:b0:4b4:8f35:c902 with SMTP id
 d75a77b69052e-4b5f8386268mr101015111cf.4.1757365100187; 
 Mon, 08 Sep 2025 13:58:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50bfda3sm36656851fa.62.2025.09.08.13.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 13:58:19 -0700 (PDT)
Date: Mon, 8 Sep 2025 23:58:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: rob.clark@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
 Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <dm22fmz6yuxrn7cwsviwg6djnbbwr2lq7aamatz3rjeeqf7r2q@mdmnolrb3ytq>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
 <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
 <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bf436e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=7zjSVlYyKO-sLu-dpfcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: q_BwCCdp-fnKfLoTU86KfxNBZW-HQbZG
X-Proofpoint-GUID: q_BwCCdp-fnKfLoTU86KfxNBZW-HQbZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX6izz5x8efV+G
 N4uJYF0Cq6bC1adRKFih//91F39Ehy5mvJ1zZFk0XgB4oJbzg7yYKfZCR7SSbW/86sej7yoj8dC
 qG03VQUYIjpsui1MDQVIxdsKRB7IXT3Eh2wyCjfEjJL+HG0WHVvF1+gMvkzH0QYJKT0R9o1ZXhq
 uuSi42FerM0LYCqGqwFXVxVYrnWXCN85liUpUIhHbnkVRPMInjjdNdDYfQ4I0aCqnGAv7EOzIe6
 SWGxYPplX2HzKVqDc0mG5uZiZ2MXQbWVSJSSFpKbgNsQajzSlQe054Ltu6Hpbeh+SPelO+6ieUr
 fyrCGaujwfAHQZv9dpusjav7gpBntyfslv79Q7UcAutuzPSpB06vUZdc+EOvdFvrD1t31rsPJUr
 XxCXxj14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Mon, Sep 08, 2025 at 12:59:37PM -0500, Ryan Eatmon wrote:
> 
> 
> On 9/8/2025 9:19 AM, Rob Clark wrote:
> > On Mon, Sep 8, 2025 at 6:39 AM Ryan Eatmon <reatmon@ti.com> wrote:
> > > 
> > > 
> > > 
> > > On 9/6/2025 6:24 PM, Rob Clark wrote:
> > > > On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > 
> > > > > On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > > > > > From: Ryan Eatmon <reatmon@ti.com>
> > > > > > 
> > > > > > The files generated by gen_header.py capture the source path to the
> > > > > > input files and the date.  While that can be informative, it varies
> > > > > > based on where and when the kernel was built as the full path is
> > > > > > captured.
> > > > > > 
> > > > > > Since all of the files that this tool is run on is under the drivers
> > > > > > directory, this modifies the application to strip all of the path before
> > > > > > drivers.  Additionally it prints <stripped> instead of the date.
> > > > > > 
> > > > > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > > > > > ---
> > > > > > The files generated by gen_header.py include the source path to the
> > > > > > input files and the build date. While this information can be useful,
> > > > > > it inadvertently exposes build system configuration details in the
> > > > > > binaries. This hinders binary reproducibility, as the output will
> > > > > > vary if the build environment changes.
> > > > > > 
> > > > > > This change was originally submitted to the linux-yocto-dev kernel [1]
> > > > > > to address binary reproducibility QA errors. However, the fix is generic
> > > > > > enough to be applicable to the mainline kernel and would benefit other
> > > > > > distributions as well. So proposing it here for broader inclusion.
> > > > > > 
> > > > > > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Corrected author id
> > > > > > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> > > > > > ---
> > > > > >    drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> > > > > >    1 file changed, 5 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > 
> > > > > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > 
> > > > > Rob, WDYT?
> > > > 
> > > > I'm revisiting this one, in the context of trying to re-sync
> > > > gen_header.py with mesa.. but it is only changing the contents of
> > > > comments, so it's not quite clear to me how this ends up mattering for
> > > > binary reproducibility.
> > > 
> > > The reason it matters is that for Yocto, the generated header file is
> > > identified as a file that needs to be installed into the sysroot.  All
> > > files going into the sysroot are checked to make sure they do not
> > > contain dates and/or paths to the build directory contained within.
> > > Since this is a generated header file that is included in the sysroot we
> > > needed to strip out the path and date.
> > > 
> > > The idea for the reproducible builds are that the same files on a
> > > different a machine at a different time should produce 100% identical
> > > files.  Including paths and dates violates that tenet.
> > > 
> > > Hope that helps explain why we needed this.  So long as the
> > > gen_header.py is being called to generate header files then we need to
> > > maintain the reproducible aspect.
> > > 
> > 
> > My plan is (was?) to just replace the entire comment header with simply:
> > 
> >    /* Autogenerated file, DO NOT EDIT manually! */
> > 
> > That said, I'm not entirely sure why these files should get installed
> > into the sysroot?  I'm not super hands-on familiar with Yocto, so
> > maybe there is a good reason.. but if there is, maybe the plan to
> > remove the license/etc from the comment header isn't such a good idea
> > after all?
> 
> The generated header files would be part of a linux-headers package that
> would be needed to build other packages as part of the distro.  And so the
> header files are all checked against the rules.  A linux-headers type
> package is common for distros to have available.

I think you mean linux-libc-headers here. No, as Rob wrote, it is not
(these headers are not even under include/ subdir.

Do we check the work-shared/kernel-source and kernel-build-artifacts for
sysroot paths?

> 
> 
> > BR,
> > -R
> > 
> > > 
> > > > That said, since the generated files are no longer checked in to mesa
> > > > or the kernel, we could probably just drop all of this if it mattered.
> > > > 
> > > > BR,
> > > > -R
> > > 
> > > --
> > > Ryan Eatmon                reatmon@ti.com
> > > -----------------------------------------
> > > Texas Instruments, Inc.  -  LCPD  -  MGTS
> > > 
> > > 
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
> 

-- 
With best wishes
Dmitry
