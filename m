Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C04C6D1B7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D82A10E586;
	Wed, 19 Nov 2025 07:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7hCn8jO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp9rRhI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954B410E586
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:29:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ4vo0U1032498
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3DsLZ1FPHrZSruYCWz+tNPLe
 YmGcBuVVtHAcpOK5kqU=; b=L7hCn8jOFNCOdEq4+xSQP4S5U6BPf9bqK8E1/1cS
 hci1VfOLerJsWogWVbA4KDd1LBTlCQcv4K1u4UoiHB0vyNg+YX4+jjHk8YB4/BWa
 YlbVZfkR+xgAY5cikyjKsa2B+DBcjqOd9Yzwj2ki1veU31a/uHX3y2/Vl8o0iTC0
 EavnJ4WpOL7QJ5+XIe4Dc0vdxqEYPeMpmw5j2Xs5Iv+W7FnreQvaWC+p+7mU9q9W
 6b8LW4iRtbTbuiJts30NwDHldQnPKA4MdCXNo6eLStXxtuMpSDmyJVai23RkRDcO
 L1PcrSJklTlwOfyyLq0w2pWsH+/3nbRYTP+uri9X+Cth7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7anrdjs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:29:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b23a64f334so849622385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763537346; x=1764142146;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3DsLZ1FPHrZSruYCWz+tNPLeYmGcBuVVtHAcpOK5kqU=;
 b=hp9rRhI2OSfoYWK8XBOWcNGGcgWRMFuik3DybFkhME6nzZCpf9hX4j+8ovt+k5pHP7
 sAPOtcRkjXzxjUXM63UlvHm2ApiMJAwKqxIAsYoGvjSBj7HmV6CuexTcUcyWcsrplJtX
 vQ7sh9i3xvFkJW6iRwlcW0UltszkjawmPoeQxa3GRPXKywNZShZtu5WdgIdYVModDCtt
 2WHiSLeQNX7gowlp+Z4mKa+Ak1K56j7G55y+HSQBQu0nbsk92eMYn1u+7qXGvUZJljY2
 ckO0kuN4xm3DB8V1hD0nsgD971hglYGpzRbNckNJbjbbgJGFUDUMHEEnNGcgecY9Utzk
 6lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763537346; x=1764142146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3DsLZ1FPHrZSruYCWz+tNPLeYmGcBuVVtHAcpOK5kqU=;
 b=gFVHJ8VseprIv1xx+t9bEKImSjjQppOIFymEJKg7D6EHtM16EXCzJp+6PiXBEJnB+0
 dxvJrj41306FZLLU+oAIsERmdVz5oLjIbNB4czT7jYJQAAFBmdx9dZVYIARyClqoylP/
 HzNx1Vi5BEdUFwFGbnQKKZ6vHiJ3B+LxOgUSexK0igfFAC1yrSkJNrkr1kpCwRgkoTOl
 QCVYmaim9IwSGhHgkb17+bHZ6utTi+raeSiIfoJ2/fuRxHeN2LK2QM7KiOa50qvCWzV3
 mF0scuw+bRlLLFI5QWxQBym1kmjTMpt/p/2AfZvjmsvkBhpxlNcprLeYo2Q8dkZU/Hus
 AUuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqwBiCK0QgDEWsqSpiFEAVttiEUzOi7LmGpG4Sc/ADkdTgdhhIdFM2u0BkfEmy2jL2fXIjMyppF3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw12YsWkwE4FfOiz5AyqPmKI8FWR9NgLjQw7JragqDPtvsPSamp
 CD4Q9uxtDArYCQw2rcuf4NW3CzWO5EDnLBmnnhZLBLpo/6CBo73iuMj6mjqZaAyZrGMzcMXxJ5S
 J2GXiycIUzANupy1MPlLbtk2DlCkwBSqJ5iCU647PtWRggJUAOB7eIObHfyb8UEtG8I7W9a0=
X-Gm-Gg: ASbGncsOHGmcpBA/x4kSokKYXT5hUN9vbJLJXiJeTkXJ/+hqH3lBOhOoFDjZ7vmfxA+
 gV/I/2p7kvLZ+lweHYntwGaHRTrweMjfPLgdoaQwavK2haH9IX/j78IjovoTxpgSjDrMr1bINTT
 BxH0WmJNqP4d3qMbB9o397GPoLsQr/BG8JrJZWN/HGSgBMxjz/PCWcPukzTPcmp/wUdAXHHD38l
 1WrSyOPXQKVOM9H0V28STXstKxGdLQ5kbqU2qrOmzCcgzxYvLvyUn7nVoAFJKp4Vr+wqsDyKZSJ
 LAW2Nyt1HCqLfYeUeaJ8vizp4G162E/jHPg3ZhBrnHqDjm3TAcE883Mrh/F/3JUCGF58dN9lPaG
 2bWAi5ozs44ULlQyUP/ZH1b+uYnM+UmITRUY08j8iZF7jtGp55g5rWi8gPYozwJU6gcciyJlY8A
 8sRcx2kJRAr0RzA2Nv1qViUDI=
X-Received: by 2002:a05:620a:4624:b0:89f:27dc:6536 with SMTP id
 af79cd13be357-8b2c31b472fmr2374290485a.54.1763537345887; 
 Tue, 18 Nov 2025 23:29:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKIqRUG0uKJ86GZa25Y/KflSonDJZP1+c4TBsaJcqeDzg8wuWNhhhKAJ7H9zoJRIHBmQBSbg==
X-Received: by 2002:a05:620a:4624:b0:89f:27dc:6536 with SMTP id
 af79cd13be357-8b2c31b472fmr2374287885a.54.1763537345431; 
 Tue, 18 Nov 2025 23:29:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b9f7csm4464106e87.48.2025.11.18.23.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:29:04 -0800 (PST)
Date: Wed, 19 Nov 2025 09:29:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Message-ID: <d6oxprhyao6bajkhyqul333vkerfw4jekiwxpc6pwvul4sedb7@kmxuhqafna5j>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-5-317a2b400d8a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-5-317a2b400d8a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfXzcvc1pxXRaS7
 pO8T8vJDl1A13THZBxnoKaBdKZOMvQ1ZZqr7n5NDvGGNQfwhwbtuBk/5FW0cXIqgjYDGYdTn4pU
 bSKBwV7MiPPqt+3DiCOdN1q0Zu80Rnq7CAa5CL5dVB41NUfyv6CVvemBDcdWP7/YzdJh6nJUq9G
 9XE8UeduXziEPgTnh4OAq505Xx5vTLIVxr7KXfQ2N5S+MJA1YrxrtXG9CwFa+nWcjG88iaGOKeK
 Vu7VlEwSYGjI5ATq+UipEJxP/APItG0UW2tDSoM7I04l7vH/InTOyo7P4MggdlUlXHe6GDA7Rnm
 eHsh6yURZND+Xe5gzbcXaN7rJUtVmzFWDJlaNfqWQRbiHiSTJ8z8lQ8299vcCmIUjkUkHoHpBwf
 W1ZvXO5TIRdRVhswqPBfAOcV/K5zIA==
X-Proofpoint-GUID: 7P9Q_K59t3HOztWnYAqib13Bl6fgz-3_
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691d71c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-dl1TJHNn62xojq5CvEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7P9Q_K59t3HOztWnYAqib13Bl6fgz-3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057
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

On Tue, Nov 18, 2025 at 12:30:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The drm_panel_remove should take care of disable/unprepare. Remove the
> manual call from the sw43408_remove function.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Missing Fixes: tag

> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index e5a8a9bb8d15c..d8481bdafd6dd 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -319,10 +319,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
>  	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
>  	int ret;
>  
> -	ret = sw43408_unprepare(&ctx->base);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", ret);
> -
>  	ret = mipi_dsi_detach(dsi);
>  	if (ret < 0)
>  		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
