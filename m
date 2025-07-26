Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ECFB12B58
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6E710E288;
	Sat, 26 Jul 2025 16:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLCLH7lO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF18810E288
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:06:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q6hs2m007844
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7xqGhQFqvyN6IUSPs/7i5JwG
 WwgRKW2CZhmcIs4v2MY=; b=cLCLH7lOta8Ow3hwgQdU7GL5cN4S0X7sVodHkPGP
 UO/WvJVtshJrcDStbZyqRrkpdd4YdzdMFJM7rRJGl3MaiwonEmvVUTBTZpCUwaPy
 KKVHt/HSXnSbAFb4bKi2zG29BSx5ugkabX3Xos2+i608VkzTEkQBWGEQ3M8ZLHXr
 8US5xWaFriq6PQ/8t7fo/rBV/Sumu3acKvCWWykl3/ohtqJ9uE/CkcYVrSHDjJAN
 hczulA/NYtZSo3XfHgXpQGjp4AHyJNhpNUKPEmpgUMZBVA2KgInC6TZIPF8uNamI
 NvE9foD4VtmpcVhh631/Wl9Lkgv1o4OHFsGVrHMUvqq7og==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk0sau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:06:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70739adfaceso3372786d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 09:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753545975; x=1754150775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xqGhQFqvyN6IUSPs/7i5JwGWwgRKW2CZhmcIs4v2MY=;
 b=IU/JenmwxuVSaftuZjJkkpy4VK1L0WnUVmjM6n6P4QalCNQkvJ286trspUwtCoQvRU
 w0LCYQgtHFSheYJDkj7K+LJ//cfh+gPdcGydl2FGFjFS6Ls/wmGlqLN3gk37JZbd0aJv
 rXDdDHyha7JSuSYE/n+o7SaA+3aN9FiwBHncaHcNVATUnwL4OfTA14VulzOnFjGPGGyV
 C1ibKnv/3FxrqNJ3EJl4+ajJempsoWsDpvnekV/TwoaMQwPMJJdGykijAgfC0yJkqO0D
 rxjL36mj0gG7jFRSSIQfqYWg6B6bCjGMARYAjLAwkqxGtUiGybiXyxidXYfgvq8F2sq6
 Dn4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRh6d7a+g/HP39g5eKQPbXm/iW6/8BavpZa1bc7Vx1VJnCCxvLKUdwr81qwm5BL+8C/uUBhsYf9QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5oRY4yyPa0mjOKe3OVfnOXks8oroCxrwK76RLtavL4rStFv9R
 M/A4xRKU00vfu4mMRANUhR9O55IDIgjQ8y1KCj6b1FJJBICvK6tg2e9hwHNS2RHSfp58W2gTLmm
 xR9yWkO1Oh8wWERi4qfS7veVhKADXQWJeou3Pf3i+BghioLP3qE5dykAMlm0VhrcCWPBJFSU=
X-Gm-Gg: ASbGncvkBKkrv6+SsmPr9QlaMJlSF8v+719WYuYWvNn0UnIqBMDUggWV6n0Oeayer3A
 ML5UHOMRw0DRqTRMYI0ixtTxaq0zs6V/M+BwuEpRXtWRyjnnz9G6jouA8c+Eo0y7JTsNokLtvuh
 udwcLbfnC2Sc4+C/LuZFHqLy7IaFbkRg+ouOVePAxuogMtzfLkZctr4qwHrtX7LxlWH2mxS22Le
 Ezu9bq8nuWDPwW1Neal/cdXc8BIUkJUk640S4/RdwWz2WFMVfMsYGWAiLUxHLbi6JwUL9xR7gJH
 vCJBmphy5G50GGF5QrcwuKURmNNQ7WvVE3ag3KAv+sKHZh/H30zrVNY7kuoy+kMnV0caM/tsKf/
 nuHg750NIbVe92QdjYvGQWAbbR/7cpjWAkeGtQmeaOjdotGYzy4Rt
X-Received: by 2002:a05:6214:21e1:b0:704:7dfa:3fd with SMTP id
 6a1803df08f44-7071fdc0d1fmr71998856d6.4.1753545974686; 
 Sat, 26 Jul 2025 09:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj8127nMgWUnDZ+4c5uybplDoEBkbdUcB78Wr7iZNnU8dO2Qz1zMWTz3UJJVsx5Vcj3awxyQ==
X-Received: by 2002:a05:6214:21e1:b0:704:7dfa:3fd with SMTP id
 6a1803df08f44-7071fdc0d1fmr71998466d6.4.1753545974266; 
 Sat, 26 Jul 2025 09:06:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f4235902sm5021511fa.63.2025.07.26.09.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 09:06:12 -0700 (PDT)
Date: Sat, 26 Jul 2025 19:06:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] drm/bridge: lt9611uxc: extend mode valid checks
Message-ID: <4vndrym4m7ql3lwbhqedukzcxb5qmtkyzaht66ps4fbjrvnwif@oqwnybnutx4h>
References: <20250725-lt9611uxc-modes-v1-1-6a13b181927d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-lt9611uxc-modes-v1-1-6a13b181927d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6884fcf8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dA2U1Bku73MRG1Xy9NsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: t1BgONSbAitWy43ZrSEp6t6KV4DgJ7Am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDE0MCBTYWx0ZWRfXw5+vYRAm3lC4
 4KNE9j+w+7SyCuEsyiaJQo6sdbEnKQmITtA9QlMYjaeZeiTZL7C2CIFS8G1Ui5Ip/a9hCHrwQDs
 Fx4ZxOR55RgREBRICKf2VhLijStox8bgoOhL09mDBJhpQGYA/aoDhbkpHf6v92G4BEr7VIlWoyX
 79EfL2lWm+QtBoXPBcIiHFrTr8aJO9jqiu7AU2zTLWva2d31qe8Zin7ejq8wbazdpI1WmaIzMYT
 sepSJMWA9IysphbJwZ7JgHwEB2J/yhb6uWmuPcVYi84zdTYaYewuOcU/hAAQsNMslSNZyqEMaWZ
 Mq8AHJ3snzC0/dKetNMea8m1aoqyVwWhZJ1xV5vsxBiwms0dqcM7fYyCYtRen3YthW7nhkpNE42
 pO4EviWEvEZGMyeLej5ze0OC98a5sCL+/8lwxJO/Qt6br9qQynENOCa6TXAsVCg7nvT3aF+n
X-Proofpoint-ORIG-GUID: t1BgONSbAitWy43ZrSEp6t6KV4DgJ7Am
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260140
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

On Fri, Jul 25, 2025 at 01:48:38PM +0530, Nilesh Laad wrote:
> Currently valid mode checks are only for hdisplay and vdisplay,
> add htotal and vtotal to filter only specific modes.

Why?

> 
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 36 +++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 38fb8776c0f4..cfe389b4c25c 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -89,7 +89,9 @@ static const struct regmap_config lt9611uxc_regmap_config = {
>  
>  struct lt9611uxc_mode {
>  	u16 hdisplay;
> +	u16 htotal;
>  	u16 vdisplay;
> +	u16 vtotal;
>  	u8 vrefresh;
>  };
>  
> @@ -98,22 +100,22 @@ struct lt9611uxc_mode {
>   * Enumerate them here to check whether the mode is supported.
>   */
>  static struct lt9611uxc_mode lt9611uxc_modes[] = {
> -	{ 1920, 1080, 60 },
> -	{ 1920, 1080, 30 },
> -	{ 1920, 1080, 25 },
> -	{ 1366, 768, 60 },
> -	{ 1360, 768, 60 },
> -	{ 1280, 1024, 60 },
> -	{ 1280, 800, 60 },
> -	{ 1280, 720, 60 },
> -	{ 1280, 720, 50 },
> -	{ 1280, 720, 30 },
> -	{ 1152, 864, 60 },
> -	{ 1024, 768, 60 },
> -	{ 800, 600, 60 },
> -	{ 720, 576, 50 },
> -	{ 720, 480, 60 },
> -	{ 640, 480, 60 },
> +	{ 1920, 2200, 1080, 1125, 60 },
> +	{ 1920, 2200, 1080, 1125, 30 },
> +	{ 1920, 2640, 1080, 1125, 25 },
> +	{ 1366, 1792, 768, 798, 60 },
> +	{ 1360, 1792, 768, 795, 60 },
> +	{ 1280, 1688, 1024, 1066, 60 },
> +	{ 1280, 1680, 800, 831, 60 },
> +	{ 1280, 1650, 720, 750, 60 },
> +	{ 1280, 1980, 720, 750, 50 },
> +	{ 1280, 3300, 720, 750, 30 },
> +	{ 1152, 1600, 864, 900, 60 },
> +	{ 1024, 1344, 768, 806, 60 },
> +	{ 800, 1056, 600, 628, 60 },
> +	{ 720, 864, 576, 625, 50 },
> +	{ 720, 858, 480, 525, 60 },
> +	{ 640, 800, 480, 525, 60 },
>  };
>  
>  static struct lt9611uxc *bridge_to_lt9611uxc(struct drm_bridge *bridge)
> @@ -237,7 +239,9 @@ static struct lt9611uxc_mode *lt9611uxc_find_mode(const struct drm_display_mode
>  
>  	for (i = 0; i < ARRAY_SIZE(lt9611uxc_modes); i++) {
>  		if (lt9611uxc_modes[i].hdisplay == mode->hdisplay &&
> +		    lt9611uxc_modes[i].htotal == mode->htotal &&
>  		    lt9611uxc_modes[i].vdisplay == mode->vdisplay &&
> +		    lt9611uxc_modes[i].vtotal == mode->vtotal &&
>  		    lt9611uxc_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
>  			return &lt9611uxc_modes[i];
>  		}
> 
> ---
> base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
> change-id: 20250725-lt9611uxc-modes-d59bd4d49442
> 
> Best regards,
> --  
> Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
