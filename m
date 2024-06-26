Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6737919978
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 22:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CE610E9B0;
	Wed, 26 Jun 2024 20:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="epT5xGp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2625910E2C1;
 Wed, 26 Jun 2024 20:52:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfgXO029319;
 Wed, 26 Jun 2024 20:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qRITUhAyP+sP5Tf2h+Medc9XwsxQyzmKc1jB2x02owo=; b=epT5xGp5DuIHXMME
 qxk2yLNM6zrW+bfcgpp8CyUg8Mv26imkowANcDrP75boDCcKo7fSPb8ZCMzL0naW
 /iRPMYTCDTKseUud7KaAgRDAhBQV2a/4r2HvtN5hc9wlkHtXLhqEh/TTEDyVxr0B
 mRcZSWitmR/Zpbsuc0x2n2GVWV2P2Vdt8KqYWKqnvm5/gRlaiRGgZC6ajZIZ3tGJ
 0g+Hjd5Yaci8tFCcUqvk8Nl8wu9SGpxYIGJHXHwXclEOXbEv8MloKKscsaUaeMh8
 XvdIAJV0iJydlnOCfAJfMBqCHW1UYlDCdxHQJ9epO0VZs/XiDTci9Sf1KSoZbwEZ
 TdKtGA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6t9fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 20:52:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QKqgaW003646
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 20:52:42 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 13:52:38 -0700
Date: Thu, 27 Jun 2024 02:22:34 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno
 <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
Message-ID: <20240626205234.ivk5xszi375sl6fe@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 95c7s-hD7U8wy0ZsVDXB6prpZ7IdIWWB
X-Proofpoint-ORIG-GUID: 95c7s-hD7U8wy0ZsVDXB6prpZ7IdIWWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260153
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

On Wed, Jun 26, 2024 at 11:43:08AM -0700, Rob Clark wrote:
> On Wed, Jun 26, 2024 at 1:24 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
> > >
> > >
> > > On 6/23/24 13:06, Akhil P Oommen wrote:
> > > > Add support in drm/msm driver for the Adreno X185 gpu found in
> > > > Snapdragon X1 Elite chipset.
> > > >
> > > > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > > ---
> > > >
> > > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
> > > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> > > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> > > >   4 files changed, 36 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
> > > >      */
> > > >     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> > > > +   if (adreno_is_x185(adreno_gpu)) {
> > > > +           chipid = 0x7050001;
> > >
> > > What's wrong with using the logic below?
> >
> > patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> > changes in the chipid scheme within the a7x family, this is a bit
> > confusing. I will try to improve here in another series.
> 
> I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh
> 
> Maybe to start with, we can fall back to the existing logic if
> a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
> a6xx/a7xx

Agree, I was thinking the same.

-Akhil.
> 
> BR,
> -R
> 
> > >
> > > >     /* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
> > > > -   if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> > > > +   } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> > > >             /* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
> > > >             chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
> > > > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
> > > >     if (!pri_count)
> > > >             return -EINVAL;
> > > > -   sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > > -   if (IS_ERR(sec))
> > > > -           return PTR_ERR(sec);
> > > > +   /*
> > > > +    * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
> > > > +    * to regular mx rail if it is missing
> > > > +    */
> > > > +   sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > > > +   if (PTR_ERR_OR_ZERO(sec) == -EPROBE_DEFER) {
> > > > +           return -EPROBE_DEFER;
> > > > +   } else if (IS_ERR(sec)) {
> > > > +           sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > > +           if (IS_ERR(sec))
> > > > +                   return PTR_ERR(sec);
> > > > +   }
> > >
> > > I assume GMXC would always be used if present, although please use the
> > > approach Dmitry suggested
> >
> > Correct.
> >
> > -Akhil
> > >
> > >
> > > The rest looks good!
> > >
> > > Konrad
