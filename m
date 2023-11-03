Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB27E075E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 18:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048F410EA3E;
	Fri,  3 Nov 2023 17:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBE810EA46
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 17:29:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A3EabBa018682; Fri, 3 Nov 2023 17:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RbRnW5HH1cP+UAWG5rkksMRu6tiEvqctqCZvUS6Cf4Y=;
 b=KxGoTnGywMkd8ROzeb/VjNtB32ueJYfznghLowVNSpWpQxjCCuqVtZy/mbYHKwh9Yvsn
 vO5ysIjkBctby4rbjmlkbwkk857zThY/jqjZOkbAnxwBcsHhbJZ8RolOsTHN3AKxkxTA
 eW08V8+IgA2pm5SaejvgBc/eK35hqmEHl50pqgpA29TTlWpgm99bbZRQSGEj05Zq56Lp
 XN0tkcOuVHhmZyGIz7WIyL8Zqzi8yl+C20hpG9LqENhUDchZ6kDoQquTuGqsr/62SkRh
 oYE8GZv1v0Xi7FXkeNw1cGnOcfP0un9RIxVwnP7eZ7osoDoN/wMBBrrQYZ16MAJF7y0F Og== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4v8ms9yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Nov 2023 17:28:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3HSoRi001335
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Nov 2023 17:28:50 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 10:28:50 -0700
Message-ID: <1f7583df-825d-4838-9ad0-fab097baa236@quicinc.com>
Date: Fri, 3 Nov 2023 10:28:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel-edp: Add timings for BOE NV133WUM-N63
To: Clayton Craft <clayton@craftyguy.net>, <dri-devel@lists.freedesktop.org>
References: <20231102181907.10189-1-clayton@craftyguy.net>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231102181907.10189-1-clayton@craftyguy.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 75F5evLnhwXwsqYTmR2Wqjk7KeO-0BHV
X-Proofpoint-ORIG-GUID: 75F5evLnhwXwsqYTmR2Wqjk7KeO-0BHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_16,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030145
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



On 11/2/2023 11:19 AM, Clayton Craft wrote:
> This panel is found on laptops e.g., variants of the Thinkpad X13s.
> Configuration was collected from the panel's EDID.
> 
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>

LGTM

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang


> ---
> 
> V2: renamed to "*_mode" since there is only 1 mode listed
> 
>   drivers/gpu/drm/panel/panel-edp.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 95c8472d878a..e2e4d88a5159 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1204,6 +1204,29 @@ static const struct panel_desc boe_nv133fhm_n61 = {
>   	},
>   };
>   
> +static const struct drm_display_mode boe_nv133wum_n63_mode = {
> +	.clock = 157760,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 80,
> +	.vdisplay = 1200,
> +	.vsync_start = 1200 + 3,
> +	.vsync_end = 1200 + 3 + 6,
> +	.vtotal = 1200 + 3 + 6 + 31,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc boe_nv133wum_n63 = {
> +	.modes = &boe_nv133wum_n63_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 286,
> +		.height = 179,
> +	},
> +};
> +
>   static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
>   	{
>   		.clock = 148500,
> @@ -1723,6 +1746,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,nv133fhm-n62",
>   		.data = &boe_nv133fhm_n61,
> +	}, {
> +		.compatible = "boe,nv133wum-n63",
> +		.data = &boe_nv133wum_n63,
>   	}, {
>   		.compatible = "boe,nv140fhmn49",
>   		.data = &boe_nv140fhmn49,
> @@ -1852,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>   
> -- 
> 2.40.1
> 
