Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F0D59EE7D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A828D10E0ED;
	Tue, 23 Aug 2022 21:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6BB10E1CB;
 Tue, 23 Aug 2022 21:53:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NLETrn032693;
 Tue, 23 Aug 2022 21:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=63mYcCRYwAmhtJBQvoDGWhFTubjdT5pbPv7I8T/oDbM=;
 b=hEl6Fj2XwmXk0HEXmWoL+b2vQ0kQJ8dFhCBEiGFkOEzvRR2GUDeDdo72GGB1Qf7inol5
 oxDBexFlYfqkVBX45in9+XvBde7trsDJXlKpQn6p1dxjnk9kawUI6GWnqwhg3K2LgjOC
 XiiDjpfWOsj0HPzm/1XKzO9Fo347GIVPTVB/mI8KoOfOBNA8Xc18fKa0rYwGV2jirUV8
 Qr4aueLNRc3GZnu/7IoOiB2+/2P0WOkp1PwMV8uHsJmScYgK5boHwfXBwqTrnUu/Avvj
 UHvyyD4fQEOHLDgGHWCUDKk9P2QW99/IfnCT1k0kQYSHZf6VrEdAk6lb2WB7U+3mP+U7 +A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pk8uu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 21:53:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NLrOHA015152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 21:53:24 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 14:53:22 -0700
Message-ID: <b8cc0537-e2c8-1936-05c5-0cd61b07dd73@quicinc.com>
Date: Tue, 23 Aug 2022 14:53:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: drop the hpd worker
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220822174417.292926-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220822174417.292926-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 89qVqjZVCZDR_83iQyTAYhQAvBAxP6QI
X-Proofpoint-GUID: 89qVqjZVCZDR_83iQyTAYhQAvBAxP6QI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_09,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208230082
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/2022 10:44 AM, Dmitry Baryshkov wrote:
> It makes no sense to have the HPD worker in the MSM DSI driver anymore.
> It is only queued from the dsi_host_attach/detach() callbacks, where
> it plays no useful role. Either way the panel or next bridge will be
> present and will report it's status directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With DRM_CONNECTOR_POLL_HPD removed as part of the PANEL_BRIDGE change, 
this change makes sense and LGTM, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a34078497af1..43bf84e92a7c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -144,7 +144,6 @@ struct msm_dsi_host {
>   
>   	u32 err_work_state;
>   	struct work_struct err_work;
> -	struct work_struct hpd_work;
>   	struct workqueue_struct *workqueue;
>   
>   	/* DSI 6G TX buffer*/
> @@ -1500,14 +1499,6 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   	return len;
>   }
>   
> -static void dsi_hpd_worker(struct work_struct *work)
> -{
> -	struct msm_dsi_host *msm_host =
> -		container_of(work, struct msm_dsi_host, hpd_work);
> -
> -	drm_helper_hpd_irq_event(msm_host->dev);
> -}
> -
>   static void dsi_err_worker(struct work_struct *work)
>   {
>   	struct msm_dsi_host *msm_host =
> @@ -1697,8 +1688,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>   		return ret;
>   
>   	DBG("id=%d", msm_host->id);
> -	if (msm_host->dev)
> -		queue_work(msm_host->workqueue, &msm_host->hpd_work);
>   
>   	return 0;
>   }
> @@ -1713,8 +1702,6 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
>   	msm_host->device_node = NULL;
>   
>   	DBG("id=%d", msm_host->id);
> -	if (msm_host->dev)
> -		queue_work(msm_host->workqueue, &msm_host->hpd_work);
>   
>   	return 0;
>   }
> @@ -2126,7 +2113,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	/* setup workqueue */
>   	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
>   	INIT_WORK(&msm_host->err_work, dsi_err_worker);
> -	INIT_WORK(&msm_host->hpd_work, dsi_hpd_worker);
>   
>   	msm_dsi->id = msm_host->id;
>   
