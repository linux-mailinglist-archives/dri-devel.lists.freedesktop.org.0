Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30573A75C48
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 23:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EF510E058;
	Sun, 30 Mar 2025 21:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wm1QT8ah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7852C10E058
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:06:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKDH7f024730
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FlRSAkjOOXQOvn7gier4lH/4
 QsovEBQRyrZW6+UiDGo=; b=Wm1QT8ahuEyu57fuH9J/3S9/XmCNf/MJAil4QcO2
 /ElPqVGItMXZfrS4zMt6JhdxR+WH1TKr6fQxGmAW4T0z39cG3ixu8zsYT+/8hJ7B
 im0jHBDqNdirW2n/sLtm6CL+AWuksPlhDQB2n6iy6+VEtAQispLcMitvhHNVqUV4
 La7KPUW//XEM9WfA5IG050yI0zJvulFL+AdWqP6r9usIh+FWucLUhSebbBbgcMfB
 lDbvMM5WpZTqeLY5MluNgC0yF4t1ikeAY00OEhDZyLMDjbLohsSduk6kI7MlO2Qv
 KmqxlkatQyDCLaoa8VuKJIOWQEbPommuldOkPK50gcjTfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjynm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:06:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c57f80d258so172287885a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 14:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743368800; x=1743973600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FlRSAkjOOXQOvn7gier4lH/4QsovEBQRyrZW6+UiDGo=;
 b=dOGkusqA86EiaqZz4eSRN1kEyqLlcKhyRr38ZUjU+fpIpV6cHk5Mixl6xCjlVJ/Qyk
 1oaP8jlFpshwPwV4l5OWw7gLcwW34652zA/LsKxqyfFVog+h3H8CNG46Gr/Y1MKS9/K7
 THfqxQULIQF1dMU4GDkCnbZKEXANg/BhlQar74TX7IoYGEcr7TpsTGQ+OuIB1+UYBlQd
 X3SXQnklIRTWaCn1DcM3v4XF8su1K6W/BpN1AJRytbiGisTysANCC6e7Vf1MbRjkW+4g
 rfBTYfDdDploo66R78rUxtCsg2R+r8SVGZ8FY8xecJpH0pSRT6I2WUzN4MPwqUy9NCmA
 uASg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdHteXAPZabjcSybGHE3i7m6ZzUgDmrYORAy31QbnxOl3OJuHXGvdYG7SLJU/KxqgRZrLSqTAbiSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQfS4+nfUphFCX2unk83zyBEgh9Ii9wQoBCd06F0WD7h0E+8Tc
 TriDaRA2TDi96DkIVOtFuwMGb8G+aHgKTjNTo7DKTljv4b1J3T45bWIoBdtZVKbCgkDX8o6lbwo
 Lji2v8Uh7L747g5TAB3UNCos5nCB+7wu6x4ncFe/nSHstxDmtkQPQQRaOOPMjIKmg3Oc=
X-Gm-Gg: ASbGncu4JiW1fcEQUKUAImN1xqrxordI3hjaMMwofeeLqeSExgxUQjfas/CVo0hog2Y
 1Elm7iX5vIdKaNkwDeAdVyLJ5g3atCca59YIHhLP1mkEFlL4I8SNgRMKYqQduM5vWOLY47UMhpn
 anvAvLvROLH7tpViUeoo3/2EmNw+pjjh98vBsngb7L47tD+aSx4qXWggUNULRAIGPD5vtsR1hvP
 wpCYUeOnR2rX6T0IJ9NbuutFkDc+ZD1DAgDI88R5+rtVXudpiBCQApwy+ksf/41DjhZeu7shsdr
 WCp4tBtQYvszTa+Qemf4M91nN6olHlyhVcwE+GmwZ7T8ctvFdtVo7g0HEarwTqgO30xovpLA5XV
 /jkA=
X-Received: by 2002:a05:620a:240a:b0:7c5:4b24:468d with SMTP id
 af79cd13be357-7c6862ec3b6mr933897085a.2.1743368800672; 
 Sun, 30 Mar 2025 14:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF69vvF9rbPt3BrhKW5NM4LtKVgz5G9wGmc+hd8iyCdkzLOo5lLF/FOnvkaNg7O8gtBrf72nw==
X-Received: by 2002:a05:620a:240a:b0:7c5:4b24:468d with SMTP id
 af79cd13be357-7c6862ec3b6mr933894685a.2.1743368800339; 
 Sun, 30 Mar 2025 14:06:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094c1a63sm973337e87.93.2025.03.30.14.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 14:06:38 -0700 (PDT)
Date: Mon, 31 Mar 2025 00:06:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
Subject: Re: [PATCH] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <4gdok6gfkc33sinmwjfvo2gc2wvtchom5mliucuuttqjf3diqp@buz5dty7adm2>
References: <20250330151304.128417-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330151304.128417-1-tejasvipin76@gmail.com>
X-Proofpoint-GUID: aUCnapeXAtwwqAjhBZfA16P48zSjg7QT
X-Proofpoint-ORIG-GUID: aUCnapeXAtwwqAjhBZfA16P48zSjg7QT
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e9b261 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GlgPFExOgFwQK10BZRwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300148
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

On Sun, Mar 30, 2025 at 08:43:04PM +0530, Tejas Vipin wrote:
> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 112 +++++++-----------
>  1 file changed, 43 insertions(+), 69 deletions(-)

> -static int boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
> +static void boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
>  {
>  	struct mipi_dsi_device *dsi = boe->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
>  	/* OFF commands sent in HS mode */
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> -
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	usleep_range(1000, 2000);
> -	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>  
> -	return 0;
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +	if (!(dsi_ctx.accum_err))
> +		dsi->mode_flags |= MIPI_DSI_MODE_LPM;

I think the flag should always be set at the end of this function
(please document it though).

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  }
>  
>  static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)

-- 
With best wishes
Dmitry
