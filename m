Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13EAD45E9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 00:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39C010E332;
	Tue, 10 Jun 2025 22:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrEE2rKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0B510E332
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPnHu000384
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NIZerdv5856btQLeZiz5wtEr
 Wi3yo26TMxxYpxr5HC4=; b=RrEE2rKOCsDtipjqNu3tng1rbnolbgehv7+H0EAY
 FEZ3H6HJXAhgS62zP8ebfAMARG5HvgV9pM3dCS4KYpPB+BbADg18KKaiF23MAviK
 aWKYFISZQw1nOkOu4S98mILVhI3YL8NvaIbMq+tSvVxm6RH7+mPzzhFd8kcdEiEx
 CbWXr38/2kLY4ZqvMTtkyibG1i6PTw5lI3XtrE4ZMWb9yKLIWvaiLhoFiQIHGo/w
 E+U3k3aU54O3uGviqpsf8HqDgVh5HwDx9qqUoI8DI1zZ2HEvyU02MNC4Z6GZ2G6f
 vwbOSUWzItq5h2m9uqp/dgqun15+RhvbHDPEduLyoYWF4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvax2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso1117181185a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749594335; x=1750199135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIZerdv5856btQLeZiz5wtErWi3yo26TMxxYpxr5HC4=;
 b=f80rlUG5rSE2zb+D9q6u70JuCgPGntm0OJvKq5heWlONiiNnb1BkwrFyJmDjOBw1rM
 Dq+Pc+kDrw2TIIQzBnbhqQWA6JOCQDNYsM4mnweF1+JdmN0dcfe/gT1otKGBvKLX5ZrB
 U1y5WUxwr6sVjkjvZbrVyDt/6d267YCafPT0f5JoegyT9ISj0EZSmtkWMdnxKWl5L3Bk
 TpKqP4tO39lSx4FOQGvTbzBXH4ilFJL1jIj46rieZ1ah/SyRrMSS0vZZ95RTXEHh5HKY
 Vz2fO3dQUMsBrsQklauVxuVoPovRb6c0JBTMsUZX+S+ZOjbQ4fgLJRgjxRWUJUq0islz
 jLug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT+m2D8WlcnQWn4fCh3JUlba19WYoQsHsRVIEbw4Pl3xllHGYhcaykmpHLMY89jQaGCkrW6eNnOJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyqqX4wXeaYEteeCVBh2tOu7JqvkNV0O8uVGLjolWEPe5p8gex
 ks4U1hgcOQxE7aeekY2Pq5iJGeggdaGAN8W0jiuIGFya+wvtAwDZ9YNKvnQXurzznEvrWueASSM
 kRm2VTt5fQxh5me+kRINWx4Z6hk+WoaqjBE5Pn1WEjx3frecFPw4cIhgjH0fWEfXbDTzGVf0=
X-Gm-Gg: ASbGncu63SvF6tzVgwtW5uAwTxJSRLGg8q1Ez9imqd7nTOtBIqyo7Krq3SL0fq7+O0G
 YPcvJruV3yfQ1bNS6XlFPKvZkGWiXYmIW7p9nJzTMhxFK0wnEp2tatLs4OMau3wWvS+zv8MV4vu
 0WTjV3xQteDISHNoNi22asg/AWcTnH8MTb6Tcb6W8NwZXlPQrritvhHqVSIDcFf3glVhe9xLJ9g
 LADuZPlDz7STYa5C+5wixicKmIx1G962jY9A+grRnKpAeVwVWUkO2Dxr+M+cb2uohgUj6IkHaev
 f1sNES+BQqpxjvBHUHk12086/mItSWdqPRa9LzQaQH19Ypp9MBhJ8javjtGDH6jL17rp31Yjkqc
 jXWF0wCgd8kXdLnhDaHDjm45gSO9UnVMzKfo=
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7d3a8806306mr191676985a.8.1749594334736; 
 Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqgKPApzu3rPogEhB0z1OsbrjkQcClCu9eRwx2CiVtQGPtd7+Q1xiMRbqpX3rcwtgL9CA7w==
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7d3a8806306mr191671485a.8.1749594334288; 
 Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a80csm1706310e87.162.2025.06.10.15.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:25:33 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
Message-ID: <gvxglu5n6esoortifeyeapjlkwks4adxktshj4mcc2iyigq5fj@ztsuritnshkf>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
X-Proofpoint-ORIG-GUID: sOTwc6b2y36t1KwoMy75LDXcy4UGLVpF
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6848b0e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sbni8NmfYZyP3K5nzVUA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sOTwc6b2y36t1KwoMy75LDXcy4UGLVpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfXw5hUH/Xg/oPj
 LEkOp9f+xQGk1KwTKNCH4/ApVsyjmebn64WSN0Jv6lQWshymNOO0sH6sdgH1zGZV2BXbmDmQfVw
 U5YObmfCUlUaxQmwo3lXAFBjNDANKMZEfQik5zG01fyjmx+95hq35bTquZfvG6aB2OReA3OwZK8
 tFUIZAc9oeGBBO8m524nXfKm1ZkaC759+llre9yRoFUi3fNm6Oe0du32rZjiihcJEJAFiIJB5A5
 LrhEgZPU8DmRHxlJcHtlaJ+/ptta5OKtkNJ3CsVR8jz8ET7+cNvuKDkMNFY7l6WTC9fMeG/6+lI
 N5fQHf70WauqK/NuKZQP8kRg4i7F1LyTJmpJbR4BIL3AV8oAO3kgCNtTZffbElsnGT8K6AJJmRK
 7qfJIfZLJSNQR/V9QilkqKB3sjzZlSx96OStmTbdnDcC9RszokGwHztA4L+cgGEFCtJPysqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=882 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100184
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

On Tue, Jun 10, 2025 at 04:05:51PM +0200, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
