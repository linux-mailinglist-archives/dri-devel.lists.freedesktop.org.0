Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B416DB4998B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B110E1B2;
	Mon,  8 Sep 2025 19:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS3rFM4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339510E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:14:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588DcpXt005199
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=vJousEWyIWj0ub4ZHn6o3Sl6CyGPUwpGa21aRKVc7Yk=; b=FS
 3rFM4TMjv6TCTt1jOjiOlisYyipDiwXSs3XP3nY+uIy+Wv0IScJlR79HTz07MCoX
 Vhi3UqI9HWugk11YV4T6BRdEqYprXSpnLeNVETFcq+NDAEj/6tekTanodfxZBdUx
 UjnFxc3CrYknR3fhLOI30aWVxh2hz7E8tBORhfQLFr5dMsNNC5xxu03kAIbX7uq5
 auogqTpTIYAoECF2qqwLaSHI5yBfx4X5+mHT6rxPXaeYjnXvqCMjbsXEQcrOdx5B
 yAjwite7w03kt/qEymz1bZnPAKU/nV3K4ATSuJSL8iBWertH/A6ufUkCpbhjlEAi
 qsse2VIsiz2tdp2slpZw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37t6hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:14:10 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-3199dccf133so7222893fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757358850; x=1757963650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJousEWyIWj0ub4ZHn6o3Sl6CyGPUwpGa21aRKVc7Yk=;
 b=rzqVzo7y3Ry4NXPxVf4eV8Yei1EX+ND/HALccWvw+2NhoeEAvv2m1fW+Fi9DIYB+al
 EvlcW3jQ5ZRHioXHMErgcLokPHVVlmKc0Ox9nv79hkaLT+xYVzBVuWTomWNHLD4Cn36n
 a331tozfoZCoG4oALhbg2hQtOonQxHS3GaoDXVUYXbAKtddiuomR/Qi5QbJJv5zoAZPK
 1F21iU6wqkNKn1eBYmS1fNq+S2Gpaoi7oOknQCQ4Zirwm1onh8JGbJS7qQ4L5HD4CoG5
 3pUAN5bb0iJRE9QDLyb93AD/pFDu+7SjnQVfyX1OmA/z09DHfjXbk6ZbLV2+EErnzKXq
 Tr5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMSAiZdP8LZ2TEQpH4wubwXqWS0/VzRI49b7nGcJ4Np1ONGQkxCflq5Cd7DurdCbWZa7PIsGG5lys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMbAK2wkuD6IL1CfJWi3lOpGK491mMf+xnil8VcmqAezrA29gd
 yF+HvaGzATJeeH5pjlpMhoepE7FwladCuLHA19XUcFmE8wlxhzFZz+oP1a7gf4xoYzMz14zCIwq
 t7Lrt8Vxwh18myNMjD+C6El882wGic3MAjJi6YIjm6fhXSi9Vtm8yF2iXi0+ld0qUdtsri6rkzk
 N2noLUB47k85jECxqYjm7unkxoBZzJnbHOnaRYJRb93L3Hgw==
X-Gm-Gg: ASbGncurOOKH7mX0HSOSPOLdvSxPOT3Kpw+pFsLPsz4gfCzopu3dJQ9bJgw7p7jYbvk
 F0jeyxqZFyzoPrCSKKbfA6m932NGw8JBFUjTSQE0lEC7n2TrlkQaUMgRQkbqFu027vD4QCqODAD
 TpB6chl/KinqURX28bzpEk7euGF6qs3kaP1zu/eJWyXm+rvbS3cU2z
X-Received: by 2002:a05:6870:524d:b0:321:2b89:bbaa with SMTP id
 586e51a60fabf-3226284cc86mr4609090fac.6.1757358849637; 
 Mon, 08 Sep 2025 12:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGokMZ7QUqcfHUl38dF+DB2O10fwJWlpb3ZPwwVbBjH/HoiQE2yWgmsLyAzH2eSvGXvnd62ydkMLjA94QKHo7g=
X-Received: by 2002:a05:6870:524d:b0:321:2b89:bbaa with SMTP id
 586e51a60fabf-3226284cc86mr4609070fac.6.1757358849094; Mon, 08 Sep 2025
 12:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
 <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
 <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
In-Reply-To: <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 12:13:57 -0700
X-Gm-Features: AS18NWD6PCBVVpU8xqhBnPcHvCAMvQ-KNt6NE47xv7XjxuR77RvPVN2COWfaD_s
Message-ID: <CACSVV027yBWLKaghuBnnGPg84W6RvrO=O+55ROx-SOeqTMbDGA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
To: Ryan Eatmon <reatmon@ti.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: SaLccMG7iud0f6QNQoYH8UqbatNvBnjn
X-Proofpoint-GUID: SaLccMG7iud0f6QNQoYH8UqbatNvBnjn
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf2b02 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=E82fJwX0KJD4OIwMoWkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX0UP3CNk7fx4d
 P0AiYKuq4htD6it3gNRqe/m+5FiWYQMt0pf7oqNyGs/6/kH5gDfY1vTXGZeyUJkKbd1y5S7OKCt
 1DwPWXWzoVs5gtVQz4SN8T7PXuXB2sKlSYR6Mx7yJIpqQdlUIAuXvzoXKnzh7rjY75JaQIe1K9E
 vln4LAuO648Or9tijtYf/2Q5MxnNmn2h3DVwah1TtqtlNcGtojX8GtknkT4Tkg3XcUqyfYVX++P
 nF7CCKF/3wrU/v44Xz4M6FsE8dZSWzgrhMFzMYpWyktXeGqeugqPmLd4NXRN7HsOdym1hQkgg77
 aBMAsTY20/L3sj3HjZKV4TnJajR6tk0zDWhTPBFJnmJWwgH4rsID1az8LLES8PNZPhGDc4FYQRC
 fxd3nv5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

On Mon, Sep 8, 2025 at 10:59=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 9/8/2025 9:19 AM, Rob Clark wrote:
> > On Mon, Sep 8, 2025 at 6:39=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wro=
te:
> >>
> >>
> >>
> >> On 9/6/2025 6:24 PM, Rob Clark wrote:
> >>> On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> >>>> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> >>>>> From: Ryan Eatmon <reatmon@ti.com>
> >>>>>
> >>>>> The files generated by gen_header.py capture the source path to the
> >>>>> input files and the date.  While that can be informative, it varies
> >>>>> based on where and when the kernel was built as the full path is
> >>>>> captured.
> >>>>>
> >>>>> Since all of the files that this tool is run on is under the driver=
s
> >>>>> directory, this modifies the application to strip all of the path b=
efore
> >>>>> drivers.  Additionally it prints <stripped> instead of the date.
> >>>>>
> >>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.co=
m>
> >>>>> ---
> >>>>> The files generated by gen_header.py include the source path to the
> >>>>> input files and the build date. While this information can be usefu=
l,
> >>>>> it inadvertently exposes build system configuration details in the
> >>>>> binaries. This hinders binary reproducibility, as the output will
> >>>>> vary if the build environment changes.
> >>>>>
> >>>>> This change was originally submitted to the linux-yocto-dev kernel =
[1]
> >>>>> to address binary reproducibility QA errors. However, the fix is ge=
neric
> >>>>> enough to be applicable to the mainline kernel and would benefit ot=
her
> >>>>> distributions as well. So proposing it here for broader inclusion.
> >>>>>
> >>>>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36fa=
f0f9f8d8f5b4c43a68e5c6bd83a62253140
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Corrected author id
> >>>>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446=
518847@oss.qualcomm.com
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
> >>>>>
> >>>>
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>
> >>>> Rob, WDYT?
> >>>
> >>> I'm revisiting this one, in the context of trying to re-sync
> >>> gen_header.py with mesa.. but it is only changing the contents of
> >>> comments, so it's not quite clear to me how this ends up mattering fo=
r
> >>> binary reproducibility.
> >>
> >> The reason it matters is that for Yocto, the generated header file is
> >> identified as a file that needs to be installed into the sysroot.  All
> >> files going into the sysroot are checked to make sure they do not
> >> contain dates and/or paths to the build directory contained within.
> >> Since this is a generated header file that is included in the sysroot =
we
> >> needed to strip out the path and date.
> >>
> >> The idea for the reproducible builds are that the same files on a
> >> different a machine at a different time should produce 100% identical
> >> files.  Including paths and dates violates that tenet.
> >>
> >> Hope that helps explain why we needed this.  So long as the
> >> gen_header.py is being called to generate header files then we need to
> >> maintain the reproducible aspect.
> >>
> >
> > My plan is (was?) to just replace the entire comment header with simply=
:
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
> would be needed to build other packages as part of the distro.  And so
> the header files are all checked against the rules.  A linux-headers
> type package is common for distros to have available.
>

These headers should only be used to build the kernel, they are not in
include/uapi and as such should not be used for building any other
userspace package (or out of tree kernel module, for that matter).

BR,
-R

>
> > BR,
> > -R
> >
> >>
> >>> That said, since the generated files are no longer checked in to mesa
> >>> or the kernel, we could probably just drop all of this if it mattered=
.
> >>>
> >>> BR,
> >>> -R
> >>
> >> --
> >> Ryan Eatmon                reatmon@ti.com
> >> -----------------------------------------
> >> Texas Instruments, Inc.  -  LCPD  -  MGTS
> >>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
