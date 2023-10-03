Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CE7B72A5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 22:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11C10E09E;
	Tue,  3 Oct 2023 20:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F37D10E09E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 20:45:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 393JZIYF027134; Tue, 3 Oct 2023 20:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Bg6E8dl/nMy8TcXSBpDZcgI1rn2FGNvN5jUDCVIHNmY=;
 b=dBA4JrB1poe003ghY47oJz1/J64yjJSE93F8nj+tXqUNSy/tsUI9PXrn1XuWfuXOkuKQ
 y7WSFrrv4XBwo8sT+fqz/LecLkJD95NAqO/7rVaLygROb8hWz75lHTMJ+UIhcFq7drUl
 lP5zqQLfIWHgCxHnCCNPVteNqMjV7294bncRmdtApiy1ut8r6eIBXnYe+flsh1ioARj6
 rTaGFNYqXQ1lafi5FEd6ZvZ4FXw/yFz/MjopoJ1Hs6rFcPwSl887XAebxQ3nBfmM7TNq
 FzH2MSDOc3gvPC1JM9KYmUMeR/0EoqWAO5A9yo3JSNeWQIiOlbJzCmTcPgm0jH60l7EY zw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgqr18br7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 20:45:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 393KjbDt027720
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Oct 2023 20:45:37 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 13:45:37 -0700
Message-ID: <8984b95e-d671-4828-8d75-2ef7eb800b7d@quicinc.com>
Date: Tue, 3 Oct 2023 13:45:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] drm/panel: nv3051d: Add Support for Anbernic 351V
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>
References: <20231003163355.143704-1-macroalpha82@gmail.com>
 <20231003163355.143704-3-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231003163355.143704-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aC7YovR8wxPSFlprbdwp5GFEasXhUoha
X-Proofpoint-GUID: aC7YovR8wxPSFlprbdwp5GFEasXhUoha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_17,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=713
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310030157
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/3/2023 9:33 AM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic 351V. Just like the 353 series the
> underlying vendor is unknown/unmarked (at least not visible in a
> non-destructive manner). The panel had slightly different init
> sequences and timings in the BSP kernel, but works fine with the
> same ones used in the existing driver. The panel will not work without
> the inclusion of the MIPI_DSI_CLOCK_NON_CONTINUOUS flag, and this flag
> prevents the 353 series from working correctly, so a new compatible
> string is added.
> 
> Tested colors and timings using modetest and all seem to work identical
> to the 353 otherwise.

Hi Chris,

LGTM, thanks!

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

BR,

Jessica Zhang

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index ad98dd9322b4..79de6c886292 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> @@ -388,6 +388,13 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>   
> +	/*
> +	 * The panel in the RG351V is identical to the 353P, except it
> +	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
> +	 */
> +	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
> +		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
>   	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
>   
> -- 
> 2.34.1
> 
