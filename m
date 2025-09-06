Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143AB476C7
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 21:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4867910E05E;
	Sat,  6 Sep 2025 19:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/QNNA34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6549410E05E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 19:08:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586DBGOD027873
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 19:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hpuRj8cMaFi7F8+GiXH5kkLiGalrpmEGijsR/b2FsOY=; b=T/QNNA34UXV+oc4U
 zg/44aeJB6/7Un3krZfISTO2zQl6xjPkV3AMRNP6VrqycF27kA7PSkk5LRrXNhWU
 fKuJBMWuC+aYN6TI6q8PNAcZg7UhmWmgm4JoJZwqqkmjFfNhUXcENCKWxABzITFR
 3nU2+f1r+m1nAbl3uHHHs6+GVNga1Le5t+dRpm0EGMKqHIVoAXnJGwD87BWPOnDz
 qYgGP23CQopguDDJDzNwspEyl7maCLcXDz1P48BuJmqx3WMxv8IzfecC3Gyj0H5+
 uuU/odbe7JyWp+Cd+N06dqjdlh36VhmEyce0oxOXM6qBc+xUaFox0+EgjKs+hbwN
 OpTUfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d6392cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 19:08:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f112dafeso41760001cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 12:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757185718; x=1757790518;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hpuRj8cMaFi7F8+GiXH5kkLiGalrpmEGijsR/b2FsOY=;
 b=KNbUfrtH51Hd8KtVutzenQoJ/LuAoLJct8QQmO8OqjForDzongnJUqx7VRl5ZBiBl4
 OJUgJaWxZz5lQI8582t1CqTFbvJJBCbAqhpxBhjYmrv3bggQ7k7I4KoL/uYHDGh+f2BV
 ERJw57892iJPm5dbxL+p9ibvUsBl4XE4WRMsLGF3DMCYQx94sT/nl+vwAvMxo/Q3pjQE
 Pa7yJi1KTrmNorunGovu3JQyKJLuj3U5YVHpmXhhgnY0PcAwEYlmsg3TRV2wqUUkMWS2
 xqoQaJeHag3oJdLnLBOj/uixlYw8Br6TJWBZ7E4TxQ9/OZ/pnt84J4qUcyslanzRmjpp
 DB8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw1LpnDJk5nIC6WVz0rtfw+jsNJXXfNoZEjILUnyjdsFSMwgYBdKfcrSnSSCIxRrdq1J+GU89x0fM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/anrOBJbBvQsCQonXzywlLvZEsvTmVBp7fL90kUlx3kqB0eIA
 4O581vmpgr/VOhX5P5BllY9WmkFjk9DRPGuHqNwimop28qiqCKyIqX35YLc8+JaaMSMJRUMe0Np
 ZQUpgMyoF6fQ1cDHmHxKw8QXKaDoHD3QpDXemTOJTUeMkhjXq2PIOpkV2tW3QnrwzVf8KgCg=
X-Gm-Gg: ASbGncs9txukXJF+kcfh3yi7Fo02A3ERdKH6Y7FMNU2PhpdN2fp/RwC96qRrH8X6kDj
 aIUoiTyqUGukgz7ZN7PMuC9z8JUKCTKbpja3HqBPznj+hLKd/ioENelQ7MoYZmksPEaNTzk/m+q
 rA9Z0MfwydnQYqiWyBeVhg2aw05j25w9mgSbmwVJyx0g2VnesuhdSxB04YZ9i25YxtK4S3xIgrq
 94b9wKKhsm2XwQozmyxDFz+6LKUYcJo9fa7/ZgA3dirQZo/sk50YnEvoH7M+/f83ZeM8H/Wk0EP
 LZxPUBQJcPHC+6Li2T4ef8r41Zjt4uB/31KbqmeUtqCdjpKrrKp4lVKLWklMCfxN6HzzYADoMr1
 Xm3dpx0AOPFK8gaaYNqcNP9p4mlUPQj6oX0n8YrmRTRQZifdv+Idj
X-Received: by 2002:a05:622a:15c8:b0:4b3:50b0:d80 with SMTP id
 d75a77b69052e-4b5f8569a7bmr30141761cf.57.1757185718448; 
 Sat, 06 Sep 2025 12:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBHVkE+CeoTO/j4tRuQhgwEhDnLJtNxMuvyvwILGNlEC4co/sjVDfyLwdcTLZ4+MKJhjWWLA==
X-Received: by 2002:a05:622a:15c8:b0:4b3:50b0:d80 with SMTP id
 d75a77b69052e-4b5f8569a7bmr30141421cf.57.1757185717959; 
 Sat, 06 Sep 2025 12:08:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56340b91bfesm204716e87.22.2025.09.06.12.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 12:08:37 -0700 (PDT)
Date: Sat, 6 Sep 2025 22:08:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/panel: visionox-rm69299: Fix clock frequency
 for SHIFT6mq
Message-ID: <ba7y3qcuzkx7hinxraimuem6xnrrfxbj3giz56nq5qbmg76uno@kr6dezsumy2s>
References: <20250906-shift6mq-panel-v2-0-aa5e585d8717@sigxcpu.org>
 <20250906-shift6mq-panel-v2-1-aa5e585d8717@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906-shift6mq-panel-v2-1-aa5e585d8717@sigxcpu.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX8YYQel/B2KOh
 0HK0YaLX2s/FvBLwOTcofsydjKsxRTCW5/uEcHVfxUbM1A285fDQkpwSNGDyeU+1+JYNSVSszNW
 dMEllBJEMPICfRi1p3zwuQDiktMVtB1RH3R42TGXB5bqeEzBry/nXpw5mZ6pMrO21b7SXuOWFiZ
 Vniay/F9YJ8GLlwpNXpJv3UvuNVTee6dYhSn+xuC6plGmfGGwZM2HYEgO1ERl3NAIxgV08cKXFU
 FVJsJgVE9B53w6gk/qQ8icvEPI8hNYMxFD+LVXTB9TcbCvt0wDwc0p7PZWZBcitaltRSKxzsGsv
 X2O53eTAoE1suKccuyb4T2Q7X9InBz6ijZClbvW2dZzkevC0k09Z0aso6EYzBS3yTFBehyvcniN
 ZHHb2rLI
X-Proofpoint-GUID: 1WNQB2t1w2tAUMKRhxot_yp2ACXnJxfc
X-Proofpoint-ORIG-GUID: 1WNQB2t1w2tAUMKRhxot_yp2ACXnJxfc
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68bc86b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=ze386MxoAAAA:8 a=KKAkSRfTAAAA:8 a=4ZTaGgF3X-K9GTDKzvQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=iBZjaW-pnkserzjvUTHh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029
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

On Sat, Sep 06, 2025 at 05:17:25PM +0200, Guido Günther wrote:
> Make the clock frequency match what the sdm845 downstream kernel
> uses. Otherwise the panel stays black.
> 
> Fixes: 783334f366b18 ("drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq")
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 909c280eab1fb408a713d84051a1afbb252c45e8..e65697ce6f51c7d64b786da18cf44b16de5d6919 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>  };
>  
>  static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> -	.clock = 158695,
> +	.clock = 149360,

clock = (2160 + 8 + 4 + 4) * (1080 + 26 + 2 + 36) * 60 / 1000 ?

>  	.hdisplay = 1080,
>  	.hsync_start = 1080 + 26,
>  	.hsync_end = 1080 + 26 + 2,
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
