Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A558D8A189F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF29F10F13D;
	Thu, 11 Apr 2024 15:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="isOzmkaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172BA10F13D;
 Thu, 11 Apr 2024 15:27:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43BDjjO7011546; Thu, 11 Apr 2024 15:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=SU914IS7nWQIMQGrQnY97
 Qwb042xHHXVq9oEdqDgzAg=; b=isOzmkaPX906H0Bw5sB5wNJ3VQvtFBrHZBxMh
 f0O1HxHfkpHcEGKAOLKfww4tiCNQgskhuO+3zho7Bt4CfAROCgK0QGMC3C903OYb
 YLhoE8b4E3oc3hKSDXtaK/phVfOCJdG9LhIghSnyGJ3+kETdkHB4VDKnl1apQ3RN
 G7lwQQ+8LyCUob5KROfOfhd0fMPWhgz35ELXuixFzr3cI7y9aKUFoXH3xTwqKIwj
 kcR46BVcLiqDorLXt1fSuLd3jqDdIk3VeCrXLTbfJlbGl/6Uf8Ah0VMr8XUHl2Sc
 gI+vZkOIo1Zdg4bcbyS+rR0+Wf35jWZllM7Sr9WJE598Kwbxg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xebq1sk69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 15:27:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFROHL025554
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 15:27:24 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 08:27:23 -0700
Date: Thu, 11 Apr 2024 08:27:22 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Drop msm_read/writel
Message-ID: <ZhgBWv5BjDvQbWWi@hu-bjorande-lv.qualcomm.com>
References: <20240410-topic-msm_rw-v1-1-e1fede9ffaba@linaro.org>
 <bwhfcobfkddhw2jdj6orvtbejap6ast7njahkbggj6lpelibqi@ae7357lpepmf>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bwhfcobfkddhw2jdj6orvtbejap6ast7njahkbggj6lpelibqi@ae7357lpepmf>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: L2mm3oB7bSj7y85U5AUwn-1c4eJIxsqY
X-Proofpoint-GUID: L2mm3oB7bSj7y85U5AUwn-1c4eJIxsqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=879 spamscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110113
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

On Thu, Apr 11, 2024 at 04:31:41AM +0300, Dmitry Baryshkov wrote:
> On Wed, Apr 10, 2024 at 11:52:52PM +0200, Konrad Dybcio wrote:
[..]
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index e4275d3ad581..5a5dc3faa971 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -12,10 +12,10 @@
> >  
> >  #include "dsi.h"
> >  
> > -#define dsi_phy_read(offset) msm_readl((offset))
> > -#define dsi_phy_write(offset, data) msm_writel((data), (offset))
> > -#define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
> > -#define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
> > +#define dsi_phy_read(offset) readl((offset))
> > +#define dsi_phy_write(offset, data) writel((data), (offset))
> > +#define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
> > +#define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
> 
> What about also inlining these wrappers?
> 

But that should be done in a separate commit, no?

PS. Too much scrolling to find your comments, please trim your replies.

Thanks,
Bjorn
