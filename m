Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D10CDA818
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 21:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C74210E182;
	Tue, 23 Dec 2025 20:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0dVQOkb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOFtkIvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB9610E13E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 20:26:08 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNH5HrW2747468
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 20:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aj42g1lbj0Ht7S6i5Ug6TnJq
 UFURBH1OBIEfCmbSvUg=; b=C0dVQOkbuUJes00BoM++kLlWZZnfRYlKkjLtIMVN
 qpe7y+5frfzjwPETP7vUesuHUH7uH1gJItJs5CAmwy1D2u3mbv4enWn4ykW/bcxN
 MxRB/wbhEGNmxHDcRienRtlBuQsXqGbrJG8V8C/uhEc6HppvbwcSsdG2dsdgpSwe
 qg5L+SgIPXHjG/0tSBB9lE59BNuGUz10lO3VsTIFeSvbccn9os+ykrCHhGVYohY4
 H4y6chTCulZNxT+uhVWgprUtw7gheAMcSUOk/PTUSDFRVqP0Z3tCPxlR2VWtQUEy
 CeYvoTQ/Gc6ZDYcoqK4ldxYpg8s2fY79uCIje5johpshJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cugv7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 20:26:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88888397482so162159896d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 12:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766521566; x=1767126366;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aj42g1lbj0Ht7S6i5Ug6TnJqUFURBH1OBIEfCmbSvUg=;
 b=YOFtkIvoBjP7PkMA29OF4CmcFSEM3KNfNyN08loM6Ouge50Uo6LaB/If2QtMB6MpSm
 /jj4Acly1j66hwTKHcPBKzbJFD7NGycb6cNR+ethBX+IZkhjAdtmUuB2uiwDyVBj7X1+
 ssa22Ka4AvO5VracmpaMEZnddWpkiSygfB8U80ZOOLvx7F4VHNW19FoS6ez+n3dJwM0h
 P8POoZH5vxBTChT68WZ2yBbP/mFZJO52YJYsbpB6Cpzd7m4EaXMqrngX9FEShNRiYPS8
 LAaxqir0b5ljJ3UMnHcmVD5aPqCkb+wJ/iYpkpzYNtO7xxzb/Y67IB69sdRpeqbq5cYD
 6HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766521566; x=1767126366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aj42g1lbj0Ht7S6i5Ug6TnJqUFURBH1OBIEfCmbSvUg=;
 b=NJCwwscBunZb3qT62dQlxnP+B347moUxExd4frGJHYpuhGwG1ziME8CPpjUMCDXy1q
 J7io3zOAgbTCf3x4DkNoPpP6mZsb11LPFDmns1OlZ4jrQGx/qp5qjLGKAIXDcxg03WML
 UStQMQoU6+Bb6lVP1tkdmBvXjiSrZeNYJhEFWJzhulB0wGOidVvQPJBJFoTW5BaXWRa1
 okpEj84mduXUm2xNW4n8nGvKfD05dygcvctck8e5hGWiFAsYV6ikV//INnZwB1gWZSnB
 i0D8/3qh7RBGw7qFO5+K8HTkH3zP7gK7lswPg04bGQK+tqLDwK1jt/rHoNaIB7U00jHH
 FrKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRJjLuHl3PyKT7ufJBmKtxY8ENtyubgehgUnuo99ZzNzFPDiRGLa9yURWZjcoky3ukWtXHMB2fhXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwo13ZTjVfYnXHP9pTljfTiC9Q6nxg//IemuRy4WrBw7KXOyB7
 /9CvaPbC9ohuOkU5dik1IsewtYh3g7Enb9AYRGEQwqlV8RakqW29lWYrFC+g6cf1RSbhuMPbyTv
 +9ID5+C5g98Q6a3iyhLjdWdl0mAYfBjT6BHIfb76l7X3z77u9GzDxPssENj/HtNh8sTFkZvI=
X-Gm-Gg: AY/fxX4e1citnP2o8NUKk1t3KFV2fDD6dbAW4jHuio1W8DxIPBf7nhgithD5Gh8wFBI
 tR+bjUoq6heACpaHGb4c/j5folrid5jlXYP0L9PWf8xUJ76ZU6T1dqoUEa+yZSn0wh20P5GDL5Q
 gY2NVXMszqNpAWpJjaomALbHhH4jqQFCjH646bL3Q3MKJe88swoykxe1QNss52TUTrXuAAG9Ipw
 YvI4ar70hILPc5ShXEi9dbWe0nArTrijfdEeIOO5lq4yN55586ZALWxeOyH2osEAMbD8mCbKmLi
 7simvuhLITnc2RepBX/pb0yaWu4OBAPIukRkUloH1SUclsGrFT8QPS9o1jMWGcu6wVN856ZZakC
 F8OFnExkb9UN/ERjIg9yNLC1+67kiUSGtDxK+s+F16MiMZVAzZpmPiQA50ybVh7q6HhHbtpgneG
 rmPc0k+8goK5r6z8UyLwnn3OQ=
X-Received: by 2002:a05:6214:1ccf:b0:880:5867:45b4 with SMTP id
 6a1803df08f44-88d8166a0bbmr248859826d6.13.1766521566614; 
 Tue, 23 Dec 2025 12:26:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcP4W+FMfLAts8VrhxqLmeMDy1CfbZG1GmYVwnMftp49xkskmopobDd7HasAPIjVFzVis7Ew==
X-Received: by 2002:a05:6214:1ccf:b0:880:5867:45b4 with SMTP id
 6a1803df08f44-88d8166a0bbmr248859266d6.13.1766521566133; 
 Tue, 23 Dec 2025 12:26:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618d4asm4430980e87.55.2025.12.23.12.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 12:26:05 -0800 (PST)
Date: Tue, 23 Dec 2025 22:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE3MSBTYWx0ZWRfX8IwWmiEwMfVA
 /JOawIISOxFjN5jX1MrzdsejgmQ0/HOdpx6RW45TH0Hs7cmmB4sYN93fS6yCdffxtCP/FOpLxcE
 wjpRw92dwTFHX7Q3morirK3kEFF5/X7ZveB8twRgD+81rnKgcMqjjq+YSBfcpYCm91hZmHkhSfb
 3hik2NLDl+i/NNYTEHBLxK8Co6Cn4NPt0laId+exaFCZ2G77wWQJt7N9+0zSF0TyJj3DNrw44D2
 ahSuwTw79hPIbSZkX9slz02XCSiQKlzZiIGvoNQBmfVENgEaY6fNi2dh5S/X2k6WmdgJI3U/2ds
 wFn1OCesDMBW5ozvg/3dfwRq5GWTjM7NDXCRE0ruAIk9mIkDTynKhjwGgAxjuixm3mLWf9y2mqa
 uTfuJ1Ib3AGe7uUToD/JcxRXPdMmyzytR7lX6PVJ4SvE+VvE77wu8I2GVgHkLpnB5TIhGOvhcbx
 lCqoXstvj8mXlIO2icQ==
X-Proofpoint-ORIG-GUID: ab8OaZy5_lA-yT7doMUdspIWrx7PgAnI
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694afadf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kh7DVJtwBPZ15u4CcvgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ab8OaZy5_lA-yT7doMUdspIWrx7PgAnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230171
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

On Mon, Dec 22, 2025 at 06:23:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> 
> DPU version 13.0.0 introduces structural changes including
> register additions, removals, and relocations.
> 
> Refactor SSPP-related code to be compatible with DPU 13.0.0
> modifications.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 110 ++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 +++++++++
>  3 files changed, 130 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 336757103b5a..b03fea1b9cbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -208,6 +208,18 @@ struct dpu_dsc_blk {
>  	u32 len;
>  };
>  
> +/**
> + * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
> + * @name: string name for debug purposes
> + * @base: offset of this sub-block relative to the block offset
> + * @len: register block length of this sub-block
> + */
> +struct dpu_sspp_v13_rec_blk {
> +	char name[DPU_HW_BLK_NAME_LEN];
> +	u32 base;
> +	u32 len;
> +};
> +
>  /**
>   * enum dpu_qos_lut_usage - define QoS LUT use cases
>   */
> @@ -294,6 +306,8 @@ struct dpu_sspp_sub_blks {
>  	u32 qseed_ver;
>  	struct dpu_scaler_blk scaler_blk;
>  	struct dpu_pp_blk csc_blk;
> +	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
> +	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;

This is a refactoring patch. Don't add fields (and structs) which are
not used inside the patch.

>  
>  	const u32 *format_list;
>  	u32 num_formats;

Other than that, LGTM.

-- 
With best wishes
Dmitry
