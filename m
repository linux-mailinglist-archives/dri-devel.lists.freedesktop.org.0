Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4982C425
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 18:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8B010E10F;
	Fri, 12 Jan 2024 17:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99D310E10F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 17:00:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40CFQI7q008287; Fri, 12 Jan 2024 17:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=b9NZbxKGkMu7WSq1DRJZvs6ktHpD4yfQIktgeIKEyJw=; b=Id
 eTu56kFSblsfgVGDycwx3ezfsyQZ8TwW+/eXm9jeJ6Bg0HWCqKBVWBMm3hekJQtU
 kWBdGXHGPkyoUCI7CVXz+1A7aPcaYPxIBTdVMXP/gCwLThRAjOcnTKCCk9kkyWld
 fyjB7STNPmmQO2F/D1coP2yNyzr69lvgYbZ+E8Sn4UP0Uuy5gzsTTfZosRZoGTzd
 lqcI7QS0vvDkDKLpl63xb+Kzwo+wy26SfRJA1qcKn0uNR8UYoHkbdJzFkUxny2wE
 ujhrm5HLAEUX9iBdjy+XDP7VopEVdtFVeLuVl1n+8saw2LWYu0dEvZBtSu+TsQ+D
 3yso7ktmQSBIv0l3P6MA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjqx1jevd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jan 2024 17:00:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CH0iQN021505
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jan 2024 17:00:44 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 09:00:43 -0800
Message-ID: <3915b289-2741-4b18-ab11-3c7c8e7fbac4@quicinc.com>
Date: Fri, 12 Jan 2024 09:00:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: nt36523: Set 120Hz fps for xiaomi, elish panels
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240112140047.18123-1-lujianhua000@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240112140047.18123-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5duJvOEVbRnFTa77GTuHcGGCO9uB0RxV
X-Proofpoint-GUID: 5duJvOEVbRnFTa77GTuHcGGCO9uB0RxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120134
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



On 1/12/2024 6:00 AM, Jianhua Lu wrote:
> After commit e6c0de5f4450 ("drm/msm/dpu: try multirect based on mdp clock limits")
> merged, 120Hz is working on xiaomi,elish panels, so feature it.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index a189ce236328..d6fa76dbf948 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -933,8 +933,7 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
>   
>   static const struct drm_display_mode elish_boe_modes[] = {
>   	{
> -		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
> -		.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
> +		.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 120 / 1000,
>   		.hdisplay = 1600,
>   		.hsync_start = 1600 + 60,
>   		.hsync_end = 1600 + 60 + 8,
> @@ -948,8 +947,7 @@ static const struct drm_display_mode elish_boe_modes[] = {
>   
>   static const struct drm_display_mode elish_csot_modes[] = {
>   	{
> -		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
> -		.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
> +		.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 120 / 1000,
>   		.hdisplay = 1600,
>   		.hsync_start = 1600 + 200,
>   		.hsync_end = 1600 + 200 + 40,
> -- 
> 2.41.0
> 
