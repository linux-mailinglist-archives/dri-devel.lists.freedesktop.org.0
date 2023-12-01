Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3B80101A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 17:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CC410E124;
	Fri,  1 Dec 2023 16:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA3610E124;
 Fri,  1 Dec 2023 16:29:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1BLifl029255; Fri, 1 Dec 2023 16:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=G5hw65bwWWTIpsT+/2eFCiG3XyYCVlrTUm4AMs1wZ7A=;
 b=WWzOL5lfofL8I3wPyemWXmmaSGA/ZZbIUR/Wuxq9Q+AbDCmFieK9QmuVCeOHl8hR5sX6
 YRguArpxmCYu9HF9dSsjoNhLgn5q221NJWQ6X0lRmmNOss+Pq3v9kuq2YIQ9Uti2eVKd
 nrulIwLUjTYwEtRj47qld06pWX1T5IiaMHcp5HMwyIxFJQ7N7JjC/SerWLhPmpAvUScb
 PAN0Y6wX/sMkSGwtDG9WGkCJrnrBaUmaKN0GPd9nVu6I3LpPItsT5QkxCjvBzHlguySz
 Q81EPCE91YWgb8JLb72glzW94esiPDKqPzV6nRsb5grw7GIGs0y4MEcpoIpxhLHcuXqQ +w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2j9jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 16:28:57 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1GSuKA015439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 16:28:56 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 08:28:56 -0800
Date: Fri, 1 Dec 2023 08:28:55 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
Message-ID: <20231201162855.GH1766637@hu-bjorande-lv.qualcomm.com>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
 <ZWmUFdWif3QGrqQc@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZWmUFdWif3QGrqQc@hovoldconsulting.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8GGEN6E7BHYpaJCRSd15h9IvrK6-n_Rm
X-Proofpoint-ORIG-GUID: 8GGEN6E7BHYpaJCRSd15h9IvrK6-n_Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_14,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=903 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010112
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org, Bjorn
 Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 09:06:45AM +0100, Johan Hovold wrote:
> On Thu, Nov 30, 2023 at 04:35:01PM -0800, Bjorn Andersson wrote:
> > Similar to SC8280XP, the misconfigured SAFE logic causes rather
> > significant delays in __arm_smmu_tlb_sync(), resulting in poor
> > performance for things such as USB.
> > 
> > Introduce appropriate SAFE values for SC8180X to correct this.
> > 
> > Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
> 
> Missing CC stable tag?
> 

I figured it doesn't matter in practice, there's still a few issues left
preventing people from just running a stable kernel on this platform.

But it would be the right thing to do...

Cc: stable@vger.kernel.org

Regards,
Bjorn

> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Johan
> 
