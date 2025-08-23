Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00894B328DD
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 15:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7AF10E075;
	Sat, 23 Aug 2025 13:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="esScmJq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FBE10E075
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 13:49:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57NCT71W027047
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 13:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NJutXUx9GwbOyDCxu0OWA/tm
 x5myteKgI5lzXDqLEUY=; b=esScmJq1afz0shmLdLYmLpDD6Z+89szHUSJ/5+GU
 Zk/vYSEmBVI/mAP/nvVNpIwlBxKYedTO+PWzTV3KdgxOl8g1sEK7kIw1cd8LUkiZ
 koZWRgMkauLbpP6Z7kbxAkP47GEp5gM5G2tKiUCx2ib6ZUpgFp/Dza0H873ag7Xv
 ayc6cfuWZmH1Epkn23t0A55+PoWPQIp3d7QpdsffJ2hEZc1t0UGELxhcY/UOkGVa
 rV34lHMEtr0/Pa5lHtrYl0V+awcr5hUIk9LvxRzG1pMASjQhDddhLDGopFKf9f89
 n96SmbHJsuX3KaW/ImIxm1B/IpzFkmR17lMLNvEAsd0jfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um0xc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 13:49:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2bf285aa5so9458411cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 06:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755956986; x=1756561786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJutXUx9GwbOyDCxu0OWA/tmx5myteKgI5lzXDqLEUY=;
 b=B5Su2wDwAggypbghWQesbKhgpiJZUStC0B2fPAblGoZJKbcN+YZ6cH7Rr4PXZCgqcO
 zywWY07er1eWc4k7NuMfWZNhvYoUAuJbmnR/IMPBlzBgRmHLtEH32e3+J0kLQHjkseJ9
 vHvhO1+lJ0DrtCfHugt+zXrWM14AC/0a1QYShOOwWfO0YBN8fFuCmkvPIxCIOH9MYQc+
 Wdqk7HMry+907SmH0RZZw6q4MGQ4yiaF85y/nwRlQpnNeoSwfGUHAkLhxQ6OxBNGyber
 ZKPdMVSoYynpUga4LbSX2Ea3P49ldoYn5rj9TVwpaA4zXOaOyyL3/cAtvSXDpaip6D15
 WotQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4+VnLRsl/6+RcUcZiMcFCMwUECpHDdBxkX1UUGdd7ioO08MNsNcPVnCI48Dtaa4Mo9u6N+UtUu5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD6eF6fe4DLXcUHo47ywCD8f3/r7IZk2ao08dgJFyur42r4zpz
 gIsDytsgnpL4EE6THBRKWR+kBxIygSarSxXhQ4hAihPxvlE0DwraOIVDOd6nxS8sJmjY5AN8FLd
 uI4II4tJZJ1dhP396uOGYbT2Ip8CdHAtKJ/5b0LJxD4Mn3tlM9sGu+ObSWhhuAHE9VSRISaI=
X-Gm-Gg: ASbGncv9OEoQG6lw5dsZE05O32ezZhHww0kn1e2jkQDf7Wm/MMqAslxQfsgJufmpQpf
 Qt5XYGWFbOFxKLmz+QvzoYVsdx9ziqkmtNEb+8k6MbIn295kxsZF/uMhuxxLPYmGbdCDofD9ro7
 vm8eFa/WcOmIT8o6FCFApZUjDidl4drrVZE7t586+/k9MMSmZ9tl2aWA4E6TYzViD4jgrMLw5/+
 QuagEh22BfBuMT11z61+tkC305Y+WcxRN7ZwtZlgz/a9AIhK8Rvtfq+ITeMkPecpgDjiFE+YAIO
 iEEvEZVrBIv5a+ntlKc7A8ibfJGXxGiGz4iWCf+Wzhbn7MzWpTTneYn2+yteYSbjlcdClIo8OGz
 qqZXkXaimacepmZlfpqbMsak11ckeuMFNniw6geWMCZKMfWDHX2la
X-Received: by 2002:ac8:7dcd:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b2aab242c5mr75185301cf.63.1755956985918; 
 Sat, 23 Aug 2025 06:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2g0EFzejzCmD7mV9QSqwLqUbabc5ibMXHvpMqoKZRAVTOkV1CMYQolhIhiB2z113FQRZ/OA==
X-Received: by 2002:ac8:7dcd:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b2aab242c5mr75184991cf.63.1755956985376; 
 Sat, 23 Aug 2025 06:49:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c01e5asm529627e87.26.2025.08.23.06.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 06:49:44 -0700 (PDT)
Date: Sat, 23 Aug 2025 16:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Robinson <alex@ironrobin.net>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
References: <20250823020919.9947-1-alex@ironrobin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823020919.9947-1-alex@ironrobin.net>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68a9c6fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=foaXouvCAAAA:8 a=lkkxZxBEGYBqsCjUt94A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXwNPX9+f63W6L
 yKqYcOUeCXJS2jynb7gWCfpGFIVVccyMLtKijY0Wcl19xN1hNwQZNNGvNjKZmnmyD7qGsKbq4yp
 qgCXQDXy8KNlcltNr+5cVsQ6K1sv3fd+bgxoNaatzsaXMlP//KiNYTTymxl3LMyafy24JZ7IU0b
 ipknDJryZgRLDP45SSC+yvfLlO8umNin5jhLM/gWkOtAACicV/p13RIieYE9SKunVo6gSUXs6Sv
 +c9YjN4dO7Nc8Livt+7TsZDLF/DLx/Qto2vpzSyL3hRfP9nAGw/jmfvWFob7+o8bQ6QAfh1PTuT
 lEGqDLAbOIZNQx10obLLv+FEL1tYjcZ25qA10jqwDNKsYPlOcaU5ZZKZfLKxmWUYD5radJAi6go
 r9afAz3e
X-Proofpoint-GUID: -h-TIgbI-B9R3TlCoO2KDSzHv0ACY2k5
X-Proofpoint-ORIG-GUID: -h-TIgbI-B9R3TlCoO2KDSzHv0ACY2k5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> before adreno_common.xml.h is generated in trees that generate Adreno
> headers at build time. Make msm-y depend on the generated headers,
> removing the race.
> 
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> ---
>  drivers/gpu/drm/msm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b..1a918d44ac48 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
>  	generated/sfpb.xml.h
>  
>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))

I'd say, no. The idea was that msm-y should not depend on
ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.

>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
>  
>  targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> -- 
> 2.50.1
> 
> 

-- 
With best wishes
Dmitry
