Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2A889E605
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 01:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DC41129CF;
	Tue,  9 Apr 2024 23:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LnccMz9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823D81125BD;
 Tue,  9 Apr 2024 23:19:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439MwNQo007240; Tue, 9 Apr 2024 23:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=N+J/7ZTkrzTpb+40/f8nU
 YISV6T5vuTq1CdcjZQHAW4=; b=LnccMz9OsUhMbx+t0EvHpAIHfPxiawqv5aS7k
 YSpFVssGqam50WkQ34tUWp08kniwoa6VjkKJf0tU9eVqqHEtQmnciRg8ijtEpV0u
 Avr2vqbvv1lVFmfE7HOc65mjSVXlMcmix8Q2MdPpGFwHYOL8luxLHU/pU9alTVHI
 9duTEa6DVaETFoARmTokQDZhh6sHWaF7AWNkwr0WXH6wdG93XhJnGwA5pqE3UZOG
 0apYtI932R17ie5+f3lwe4SAb93z/AbW2PtAe277dpryJ7/ST349j4yxQk4yza3+
 8SLmVjJYp4RX2oJcJO3WAQVp6ioB+eR0sXWMpvdZ1NX7GNt6g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xd4uesqjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 23:18:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439NIudR015984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Apr 2024 23:18:56 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Apr 2024 16:18:55 -0700
Date: Tue, 9 Apr 2024 16:18:54 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] drm/msm/dp: Use function arguments for audio
 operations
Message-ID: <ZhXM3ldkY7FBlFjF@hu-bjorande-lv.qualcomm.com>
References: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
 <20240328-msm-dp-cleanup-v2-6-a5aed9798d32@quicinc.com>
 <711e8a6a-a849-3cd3-fde3-d60f756abfa5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <711e8a6a-a849-3cd3-fde3-d60f756abfa5@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rJwRBaALpi4XBpdebfX132nxJz8Au_YR
X-Proofpoint-ORIG-GUID: rJwRBaALpi4XBpdebfX132nxJz8Au_YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 mlxlogscore=965 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090160
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

On Mon, Apr 08, 2024 at 02:31:45PM -0700, Abhinav Kumar wrote:
> On 3/28/2024 7:40 AM, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > 
> > The dp_audio read and write operations uses members in struct dp_catalog
> > for passing arguments and return values. This adds unnecessary
> > complexity to the implementation, as it turns out after detangling the
> > logic that no state is actually held in these variables.
> > 
> > Clean this up by using function arguments and return values for passing
> > the data.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 20 +++++--------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.c | 39 +++++++++++++------------------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.h | 18 +++++++++--------
> >   3 files changed, 28 insertions(+), 49 deletions(-)
> > 
> 
> One quick question, was DP audio re-tested after this patch?

No, sorry for not being explicit about that. I don't have any target
with working DP audio...

Regards,
Bjorn
