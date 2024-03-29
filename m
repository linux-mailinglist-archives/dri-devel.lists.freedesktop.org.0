Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4D892096
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 16:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080C112783;
	Fri, 29 Mar 2024 15:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oRUYCDDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096FA112735;
 Fri, 29 Mar 2024 15:38:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42TEUrBd029454; Fri, 29 Mar 2024 15:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=OQFdy3sUVFWf0Klmkip3N
 FOHi61RbjiqyF7llsku+EY=; b=oRUYCDDpJpAq6rwi1iO1RFjusRAjgjizUQd/F
 wigVE629aZT5jKXY3ua3yC/0i2tVwWt7DRKXx2oTVfbSCBQgPruef+L3uR+sD1x/
 OqiuiqvBg00EUkMqvhi2oeUro0w3lKqZxUjFy4vcptIH5ypCtWV080qvN2tghLM0
 VtKl66Oiazy7KqbXLg/SZA4oen7h0wDCuTOg4m18QnUDSqbBVjorrsDuR9+tDJNV
 9wh3C7Hh/ynQq7P6EhPY6F2z4l41O5QDlJ/zMpoAS2i3XqnYim8TjTSAWKEVXz34
 NDE6fIIYNJ/dCQDdzTfEC8OP4CiIBAqlpIEVKVIBcykS/lOYw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5sm6h5p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 15:37:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TFbwOB013590
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 15:37:58 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 08:37:58 -0700
Date: Fri, 29 Mar 2024 08:37:56 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dp: Remove now unused connector_type from desc
Message-ID: <20240329153756.GW3213752@hu-bjorande-lv.qualcomm.com>
References: <20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com>
 <CAA8EJpoNBA7L3FMqf+4korbbYfrptHq3Fke86DpfNcbpiBaqzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpoNBA7L3FMqf+4korbbYfrptHq3Fke86DpfNcbpiBaqzQ@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0nuwXDAwd1cpYAV1oHt8DmqD3pHS-S4I
X-Proofpoint-GUID: 0nuwXDAwd1cpYAV1oHt8DmqD3pHS-S4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290138
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

On Fri, Mar 29, 2024 at 07:23:07AM +0200, Dmitry Baryshkov wrote:
> On Fri, 29 Mar 2024 at 06:02, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
[..]
> >  static const struct msm_dp_desc sc8280xp_edp_descs[] = {
> 
> This can now be merged with sc8280xp_dp_descs
> 

You're right, only saw the first level of cleanup. Will repsin this.

Thanks,
Bjorn
