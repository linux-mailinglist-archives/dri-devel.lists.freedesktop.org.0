Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB06A4FB6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 00:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B446310E412;
	Mon, 27 Feb 2023 23:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ACD10E403;
 Mon, 27 Feb 2023 23:36:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RNKjsj030560; Mon, 27 Feb 2023 23:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=qHaosaJntF0SKHOjT5yMQrfguGmVKutyo8YLEgKMr4I=;
 b=JtAPqxa74xBTUV61RONrjz+ymE8r6waGyNpJ2V0DsLleYd9L/NBZjP+qm/xVWJN2u0DA
 G++OceA62EDmJYdcnJL+Qj00ik9dr0ZaSPiLCBIxTfCKH8ogwA50CG8dA6xgaZB39yV8
 JQFQzid/jUOo/CuSvXEmiSupyt8qh4FrXaZt9IT3zrPA+k7+MloiOq6KJbIAsvHOGtxN
 iMtHWboaD2GC620idyASM6cAunGECQ8D83pUcKi3W9KemV3Iwbjz9Fa9NCMnT77t9kAT
 m37l1Sz9fWX8K8Svoe7+j4mGbajWeYisSGp9FVCGmK+rVpl3xNNENH3ZNSoMrWLLzA00 Nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nyajaxea6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 23:36:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31RNah8R015714
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 23:36:43 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Feb 2023 15:36:43 -0800
Date: Mon, 27 Feb 2023 15:36:41 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [RFC PATCH 2/2] drm/msm/dp: enable pm_runtime support for dp
 driver
Message-ID: <20230227233641.GC4062527@hu-bjorande-lv.qualcomm.com>
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
 <20230223135635.30659-3-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223135635.30659-3-quic_sbillaka@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RWsQ7KJfPELIduEYmP7Ztgo3Ub_-8b9g
X-Proofpoint-ORIG-GUID: RWsQ7KJfPELIduEYmP7Ztgo3Ub_-8b9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1011 phishscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270189
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 07:26:35PM +0530, Sankeerth Billakanti wrote:
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
[..]
> +static int dp_runtime_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_dp *dp_display = platform_get_drvdata(pdev);
> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +	dp_display_host_init(dp);
> +
> +	if (dp->dp_display.is_edp) {
> +		dp_display_host_phy_init(dp);
> +	} else {
> +		dp_catalog_hpd_config_intr(dp->catalog,
> +				DP_DP_HPD_PLUG_INT_MASK |
> +				DP_DP_HPD_UNPLUG_INT_MASK,
> +				true);

I believe this is backwards.

Only in the event that there's no "downstream" HPD handler should we use
the internal HPD. This is signalled by the DRM framework by a call to
dp_bridge_hpd_enable(). So we should use that to enable/disable the
internal HPD handler.

When this happens, we have a reason for keeping power on; i.e. call
pm_runtime_get(). Once we have power/clocking, we'd call
dp_catalog_hpd_config_intr(), from dp_bridge_hpd_enable().


In the case that the internal HPD handling is not use,
dp_bridge_hpd_enable() will not be called, instead once the downstream
hpd handler switches state dp_bridge_hpd_notify() will be invoked.

In this case, we need the DP controller to be powered/clocked between
connector_status_connected and connector_status_disconnected.


I believe this should allow the DP controller(s) to stay powered down in
the case where we have external HPD handling (e.g. USB Type-C or
gpio-based dp-connector).

Regards,
Bjorn
