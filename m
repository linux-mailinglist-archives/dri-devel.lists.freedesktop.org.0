Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A91A9D5FC
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 01:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1710E139;
	Fri, 25 Apr 2025 23:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y1iDMeAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCCC10E139;
 Fri, 25 Apr 2025 23:02:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuRS001348;
 Fri, 25 Apr 2025 23:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PVCoVGhbhHaQpzrYc6zL+NmjQ0+ewuCnFrIJjis5X1I=; b=Y1iDMeAkjL79nxRK
 ZXi39MsyhYJBJp++z5y0kwRUg4KlZn6jRp+rzTLGJc6Cf29gWnTd51/Nl58K0OF4
 hbGV+e2BN6h4n8QwcJyK65ARupvUmUFMa8kN/V/z0p8rKZiZrOWj5p83dbykv6dh
 NqkY0VHmYL371SMfBv2dgNntrYrxzPMq9SVCO75lN41Kl+iet995yxYRkPkNmo49
 5nrx1JWF1l4JezKTT4k9uZcz4d1PpXXqz9CmhywBAou+sJ4mMtHVTYE88Pm/YWMz
 KGA83yueRQk+e3Ypoxq18dBnlyfTRzsPDfWCgl3BSLeMUvBNhAXk6jncIdV5W1hR
 TDbu/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jg1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 23:01:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PN1qVE000653
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 23:01:52 GMT
Received: from [10.110.43.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 16:01:50 -0700
Message-ID: <beb866cb-0510-4e8c-84a0-ae66f864303e@quicinc.com>
Date: Fri, 25 Apr 2025 16:01:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
 <20250425-fd-mdp4-lvds-v4-6-6b212160b44c@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-6-6b212160b44c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE2NSBTYWx0ZWRfX0BTU8LZ/tPk3
 du2Ri2Maj/ZAkOx5kAZhXnhX2xTOU7iM9773HOfcEstyyVM6nAMMi9WLQhPgxyXaNpRxjW9ybVi
 2KhHtREZC94X3W7zN8vyNI5HShqawG+cFiax797jMEGQx7DDiAf1a8YVRIf2S7ew+9j5gUteEEV
 S8y9IVG3Ir9gIyPeYfu7oeF1zFZP4ZnBL1BrSTd+avME44jMGZl1g46IL/WZaauE2N2cjaZ5VVA
 tVBY/13s1OCxkDKPQ/NMXZ+oIlm0Q9MznNJuTUE1v4khUBcwjTsVjHqHeMSyhWAqbUl/Nf4772e
 rFBnTBG1JH3oVxVejYxDIxGAokrPsZz86t93VxZwKoghJb5F3CNCNbCmnBI4um6YTpR0WrmUavw
 KeSdqEhu1M5uVcC6V6LX+JlFfPZVoXneUXfrq/yVyRCPFFmV3aiN4hmRZah6PsNA7MnhCod+
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680c1460 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=mBQssbH8hIC3Lvm7LJMA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9Cy1EhYJFLfHWBx0aUHbhKwvB1YM9lZh
X-Proofpoint-GUID: 9Cy1EhYJFLfHWBx0aUHbhKwvB1YM9lZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250165
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



On 4/25/2025 2:51 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> LVDS support in MDP4 driver makes use of drm_connector directly. However
> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> them to use drm_panel_bridge/drm_bridge_connector. This allows using
> standard interface for the drm_panel and also inserting additional
> bridges between encoder and panel.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Makefile                       |   1 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
>   .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
>   5 files changed, 28 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..7a2ada6e2d74a902879e4f12a78ed475e5209ec2 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -48,7 +48,6 @@ msm-display-$(CONFIG_DRM_MSM_MDP4) += \
>   	disp/mdp4/mdp4_dsi_encoder.o \
>   	disp/mdp4/mdp4_dtv_encoder.o \
>   	disp/mdp4/mdp4_lcdc_encoder.o \
> -	disp/mdp4/mdp4_lvds_connector.o \
>   	disp/mdp4/mdp4_lvds_pll.o \
>   	disp/mdp4/mdp4_irq.o \
>   	disp/mdp4/mdp4_kms.o \
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 689e210660a5218ed1e2d116073723215af5a187..93c9411eb422bc67b7fedb5ffce4c330310b520f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -6,6 +6,8 @@
>   
>   #include <linux/delay.h>
>   
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>   #include <drm/drm_vblank.h>
>   
>   #include "msm_drv.h"
> @@ -189,7 +191,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct drm_encoder *encoder;
>   	struct drm_connector *connector;
> -	struct device_node *panel_node;
> +	struct drm_bridge *next_bridge;
>   	int dsi_id;
>   	int ret;
>   
> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>   		 * bail out early if there is no panel node (no need to
>   		 * initialize LCDC encoder and LVDS connector)
>   		 */
> -		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> -		if (!panel_node)
> -			return 0;
> +		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> +		if (IS_ERR(next_bridge)) {
> +			ret = PTR_ERR(next_bridge);
> +			if (ret == -ENODEV)
> +				return 0;
> +			return ret;
> +		}

Alright, I think this will protect us against the fact that there is no 
panel in the DT currently like before, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

