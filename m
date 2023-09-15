Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37E7A2572
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB8310E663;
	Fri, 15 Sep 2023 18:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8031410E663
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 18:18:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FDvkge010845; Fri, 15 Sep 2023 18:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ScPmv1rXleIYvNd2GNIPKxGOwP7VQnyxi+aZcYGfh94=;
 b=bZZd24BjGoGbtXk8916rPzrzx0tEueBG60csKBbJLRfrlh7Yy6V729/SrD9A7TNVVIY/
 ZqFqV09gs1zBR+4KhP2gXBL/5k0ORFf1LhN+XXzfo5FmXfT4rb4yxvwbRgBStNvlqky2
 Yp/FoHf8kNN1TYV9q5ORUnVx+QdSFsLes/LvbRf2whG5/fmBkxC1VO1btyaeZjHtqTlL
 jGXXe47WcNn02yB8UxieXbsvRHA0rWGTyGGDE9qbNtvTn2OBgDTx2Ym1DMf3eq286uzR
 OTCtHqmShoG1PqMITq0/nCbA7mDWuE39IKCV2sLACAZrzgqN2LkCGTcQ6uydRUtP7P6c Nw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g2xhvxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 18:17:55 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FIHtXQ009369
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 18:17:55 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 11:17:54 -0700
Message-ID: <a8e50634-979f-3b4a-bdcb-39d264a861d7@quicinc.com>
Date: Fri, 15 Sep 2023 11:17:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Completely Pull GPW to VGL
 before TP term
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 <neil.armstrong@linaro.org>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
References: <20230912105932.16618-1-zhouruihai@huaqin.corp-partner.google.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230912105932.16618-1-zhouruihai@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VSEVdV26e0gMC7C6wf-sxLStDqZR1wfY
X-Proofpoint-ORIG-GUID: VSEVdV26e0gMC7C6wf-sxLStDqZR1wfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_14,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=846 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150164
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/12/2023 3:59 AM, Ruihai Zhou wrote:
> The sta_himax83102 panel sometimes shows abnormally flickering
> horizontal lines. The front gate output will precharge the X point of
> the next pole circuit before TP(TouchPanel Enable) term starts, and wait
> until the end of the TP term to resume the CLK. For this reason, the X
> point must be maintained during the TP term. In abnormal case, we
> measured a slight leakage at point X. This because during the TP term,
> the GPW does not fully pull the VGL low, causing the TFT to not be
> closed tightly.
> 
> To fix this, we completely pull GPW to VGL before entering the TP term.
> This will ensure that the TFT is closed tightly and prevent the abnormal
> display.

Hi Ruihai,

Can you add a fixes-by tag?
I think this might be the one to use:

Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI 
MIPI-DSI panel")

Otherwise this LGTM.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
> ---
> This patch base on original fixes series [1]
> [1] https://patchwork.kernel.org/project/dri-devel/cover/20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org/
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index c2ee2c6b4150..e37b9b4f528d 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1305,9 +1305,8 @@ static int starry_himax83102_j02_init(struct mipi_dsi_device *dsi)
>   	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x01, 0xBF, 0x11);
>   	mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x86);
>   	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0x3C, 0xFA);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE9, 0xC5);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
> +			       0x0C, 0x01);
>   	mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E, 0x10, 0xA0,
>   			       0x00, 0x00, 0x20, 0x40, 0x50, 0x40);
>   	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x02);
> -- 
> 2.17.1
> 
