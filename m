Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C7CD69AE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 16:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C68410E33C;
	Mon, 22 Dec 2025 15:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDAqqMk5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFTHBDWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB6010E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 15:46:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMECepi1390211
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 15:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=InXyV+JNec0b7S1997VuA92q
 dfvh3YWc70bUG/cazkw=; b=MDAqqMk5nywR+7vGyHwdUFlaBY9Y+IAiF+ml33u+
 0J47yhcFlNx4Y6JfY5DYbE3MQxwPT2Y/kqKWi2snjSNKsV3R3VeQVRM80amWOCLY
 zkkhpkJU+zZg9wBDHOG9KsnI/xmyKHT6asT+98o6U0HmAo7WooIRjji0+kWgQdNC
 gF8Bo+V3gXAbkA90sksE2LrvILIif5oUU+J/efxlCguUiPN1blP4GgataWps0mZ4
 fEBYaRmUCCcZYO4oyAXjeXDIuPQd46n673hRhCxWSz3fGrLFSVLrfRiAeRi3GBOr
 vgQ91hbmxy0cqLUSl+axoSkZWPegqjDV5Y1zkdaN2gSTdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6j874-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 15:46:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1d2aa793fso103855681cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 07:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766418396; x=1767023196;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=InXyV+JNec0b7S1997VuA92qdfvh3YWc70bUG/cazkw=;
 b=fFTHBDWWGniVdl5GzA9/lV5HYdQ2xQ5sHd6tkuqsWUGY8sZOzG/9znJWRgOSnu6Aow
 HZPzBPSlsg290Lq/NvvU4tqsctHqDrCFfQiobA/tzANrM1bGV/wQdlKe5yIePx2dCFFx
 +AYbiK3VadpnAwyZ3drTFoIxyInegu/9erXtqIG1+CsMbmYdZLvp/yS90ltjE2KOQJUq
 klWU+Cag9B+MwmTbrlO5LpqlVG+wiomd8DCpZ+1WPs9ziHfqjgmvjpDPkb9N7hu7ZarN
 TKcY0TEZLYxGnWN7Py23E4xgAfwT+7ejx4Fvb8PPsvFLtWLJqFcGd+JWAnhcs95cOmXv
 38Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766418396; x=1767023196;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InXyV+JNec0b7S1997VuA92qdfvh3YWc70bUG/cazkw=;
 b=mMne4+jTfH15EoFjH4Z3JOtht2b/59mJcHKKgHmSZpUJh3NRxxZmEeQs85F4Wyfx19
 XehvehgxlglxHflokJPqrmZDFnBKovD4tAwPQaYtS9vWAA9ofjSTwcnyhycCTE5DZbH3
 e/ifnCnynwSbY/NSoDrVT2x4iYuiVf42wvZsci6jAfT2j+zxpqR19KQRchZ4AZjBqy0z
 U2zoe8lOhpfuylsIYGHLM9/KzX88YXBjkQIamMq6JhE9rfB/jnC727ywdouqzjJlstoP
 7vHB2AQJJcE5V8WHL1VNW/j+Bshgkn1wc5zJ9BgTuzQ5vLbVhi3MChxSe5r00yj98j+Q
 ykqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0ZGRogpzORXRNyZHxJ/rXkMXd9xmqU76NvTJtxbZglcntkBP1l29GDpD1NfbHbpSZPA9VnkAKALo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcN37lV/S+9w60hBDN0QzrlvPhhTYOFWM807/1S6IxIKOque+7
 SDubmyxoy/jXN3Kuv7SJFMuHQjlgVQCzeu2bIeE0L65hgSj8Q/tfNpmy5Nz/gRWNIzXTLBndMGu
 8qIwEa5YQDMb8g0SsnBKh75WxUoexzO7sFY8lAkxLYYp1ULHdKy8lrqkl1Lzol7zSIN2/280=
X-Gm-Gg: AY/fxX4HDMfhiahrUGbGMBQ61i9F13XUYcOcuiTh2FkDYANzCRwqpAfCofp+s6t9I4q
 EcuAD6FLqjZ4KzB55Btwn5txSl7QKfWw2fS1LZRutaMnfkkoKuhL0E41HUkdMtJKsOeUy31Ug4G
 RKpdxYbmdLioP5+xWo7GfgwR6bznqc9cA1TIbXLCecovNhtJP1u212DcafRSHtr+G4Xh0BDl4hF
 vDAVOW7nOmCMndmh8InDGoyAqP5mmPKMRSM5eQUSwKozmzO8RaQzSL5Itcz0E4pbqLx+6L8kwuJ
 n+xF+D26h1F1AFqZ16U1bdEbLKsaKfwKW7ZmXtF9Cr69N/Nj3LhhjyNZD8Es55bS5NSDrVwSDpE
 qROIlqC2SVbcnd12RtIucmyx+2DtkdS6Vzexa/waZDGMea5CfU24n7NuiZJrVH0Lwt/pRmTogwR
 nbOjMAkg9dUhJLiJe03qP1npQ=
X-Received: by 2002:ac8:5c8a:0:b0:4ee:ce3:6c9d with SMTP id
 d75a77b69052e-4f4abcf0bd7mr156435881cf.19.1766418395779; 
 Mon, 22 Dec 2025 07:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmmqugqQzBG5o7UjHdZltBjI4DfhSKXTIQEZmXsOFv8dArc5Ft/vGe5LQyiJmWDAE0iWQoqg==
X-Received: by 2002:ac8:5c8a:0:b0:4ee:ce3:6c9d with SMTP id
 d75a77b69052e-4f4abcf0bd7mr156435361cf.19.1766418395229; 
 Mon, 22 Dec 2025 07:46:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd7c8sm3175345e87.26.2025.12.22.07.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 07:46:34 -0800 (PST)
Date: Mon, 22 Dec 2025 17:46:32 +0200
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
Subject: Re: [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <3pgly22pfh3v3oia4svgapp2vqmckun6a5d4dyaljp6lf6ol2f@ddo5akmouzsb>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HeggttCc1gguE6B8UZBmcmzfkTIwefd-
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=694967dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_XWVza19j1sFB8Qqp28A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE0NCBTYWx0ZWRfX1m1cN9HEM3T6
 eWM2eSRZEz9MPrxhlJ71X117GSes8F+naj/XYfIfiNey48N4+8aNSDu2COibkyInuWMW5Glw8SD
 XWQ19ZHPmzb6O3o4M5KxlTlQr6dzSluFEVnH1DXPvtafRcjN8E3aY7d90rUaKp5gOzSx3vyInFs
 Ztjzbnqx06szkpn4T9l55p+C3DWE7nFWRZKDgX5AvF4THtS3TYxKqgr4Whpn5JSKdjunk/JamGt
 AnPFplTOVcSS5QVzCMOD1DDAQ14b4Tyd1kRWpQkOKv6KR2I8iLRwrDaQtRsWrQ1HxHnNJ/caTXb
 Dh+pb5pXOfpbVUh9LRwoyj4wzD2cADyhsrHh2cSYw0iV0tKPY2Lmv4zpHk8Vdwu7KzNs768Q1IZ
 1L++bQGZhO2MTab5VjYUORU6o/Y8bhZSEkm4QGescu1PzZEV2qd6BHZrFbJFvGLpIFh44MxLuk4
 zGWLT2H1tVudxiAU8YA==
X-Proofpoint-GUID: HeggttCc1gguE6B8UZBmcmzfkTIwefd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220144
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

On Mon, Dec 22, 2025 at 06:23:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
