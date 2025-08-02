Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE6B18E8C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 14:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47EA10E169;
	Sat,  2 Aug 2025 12:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYUdagnT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D3710E169
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 12:50:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725f08N024706
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 12:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vs1D1U7thDc7U5UX3yQ1lCQG
 vG3bv8jTH/mIRvodFyc=; b=YYUdagnTtSda1VNyzVg2uZ9vxG1/YwTt2HGJ9WWF
 SAAjGtW1Ldy+BIr39pw4prPq7G+hQ1mTz7xEmIsLp+5Hg7zioQkGu2KatGz+Xmr5
 55icuIetmguJmmRNYWuLI0LJH6B0XWAEm5+079y5FwEnko8qcyHtL35LSsRApPBT
 ZI3YsG5yDUCfpiV9Ehei1bq8iU5oaU828J+Jss+4wn8V0Lpta2ZTGDHrA2uXxng5
 F6haPGZNrkO7BHaHs9FIlJgUm83EC9v/Wnr39N64e5hi83tWyNLF3vOUAI3W/bJk
 bgTfGVHPtlG5FWwkuAbxdEwTTGMxitm0ruFclhiWrvlqtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjh0je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 12:50:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab55eb74bbso37471421cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 05:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754139027; x=1754743827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vs1D1U7thDc7U5UX3yQ1lCQGvG3bv8jTH/mIRvodFyc=;
 b=fXzS13b/wiDAmyO50PemSRP8wb2AaqmtZ5HYyveoSoydcfuCayIX2p08LHB6vGuwMM
 SyaJx8gzK482UnOkbTcm2qYoBp8tMF7uvGh6+wgNkqvNmawHU/AHnjpygFzdnY0BqRVD
 soTtj/ZpPp85VbvgM3lzjgQDKdgWgO3wvtVWa0PIbarj95J5XgQlgVahReGyP7Kk21kl
 oIR/eITzz5T0sYYYtqtKDVo30NzOD8Y3ZZbHr7Q/5qmyb90DYfrWugZg7eb5YGuI/geA
 FiWy2EyAsZ09CSp+imLvK7yrGdrPu0kdRn42RQtsm+q8Jf0nOMR193fhAFZgGfzx7Svh
 OpXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEEn1l/LdsTCtC3ig+y8j17Ys68bYhg5CprRK15aOduREPFr8731TY1JZQWWRN7Oth13GSYzEjTog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC+81HLRVcDraaG5q7VV6iM8rWy4PHyBHpGwdxoRouvoEcu3GF
 WQXHZrOb8KGhC/FYj67FGdjqlqMWX6YvOMSAOb78E8I6mpoZlWQ4VEAAEs9P7u+zUlyI8IuDqIu
 9fNDpJr5gTLBB+UhxAgU5ZlByQdupkLx6f1LylZnbuQ3qntzYwvA7oyFxJCp/wrXDIOKGtyA=
X-Gm-Gg: ASbGncvndFHL4JxKHatje9riYaVPC1G4C92wLa6nchrWS3EQFTAWo0UAxUlHb/FA2h0
 l2JJjI9NKEAU0IH8Fwuo6pQp1qgEYH1IS43xnqCVQBGhtIngKwJ2LGB1QZwJOamNAeu62jMKsGn
 r6ex6ArLwuoAsOiXMdSIbf7lCzHDGn/fALJ8zYkodJ8ftG/LzhhZA9QupcmeP+cXkwphC5gy/fQ
 j/+an1EwO5dYnaQc7GdfieAjhdWXMijtP/0hMOGyYOjWDW3MEVY/VNFbVymHtT4tiGDpyXfCfFL
 y2P90pX/WfkEFVm4EkMpracSh0CwW3rxL/E4pXOKBL4QER0823kLG3XkRLAqfXqUfhkyhKEWJbl
 yuqI1q4orai5HLrr85JLCFYKd+8Ai6+X440hyzkyGoAp2lzwLjBet
X-Received: by 2002:a05:622a:1a19:b0:4ae:cc2b:77cd with SMTP id
 d75a77b69052e-4af10ce9bdcmr38028831cf.59.1754139027221; 
 Sat, 02 Aug 2025 05:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdQnn8wZtb8CWV4VbyrqAlylwn3DtqWMLsdIcs1457Yr2H1nMf0zL00sZjrwZSSf85tjhLEQ==
X-Received: by 2002:a05:622a:1a19:b0:4ae:cc2b:77cd with SMTP id
 d75a77b69052e-4af10ce9bdcmr38028541cf.59.1754139026796; 
 Sat, 02 Aug 2025 05:50:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388d8151sm9019371fa.41.2025.08.02.05.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 05:50:25 -0700 (PDT)
Date: Sat, 2 Aug 2025 15:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: himax-hx8279: Remove unneeded semicolon
Message-ID: <y3s6uyv23kn45shp72mazhtdfc3uygawaxgsrpu5e4u4zgt5z5@vdr5w35inye3>
References: <20250729054214.2264377-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729054214.2264377-1-nichen@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=688e0994 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WdE5XIPRt-e4Io1gumIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: eDuRkVMBV9YTvoxj3iccVQ2z0fsmC2gI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDEwNSBTYWx0ZWRfX4R/eg62e/ECJ
 A5462i6HoWeat3gJPZJJx6PwWdzsuA2AkPHHjHS7rJ2CtNDjWR25yoN4XSGZKhLVFHp+vZ0wBhM
 ZlrxgEcrIwJDvLOLrZdjIV8miytfxfpinzU/p+WfRLsrsVVOqRkItOawdjpGZ5QbYUeoPiK63re
 HkyJs3n0EJB+SS1Q4C/bfRiFVlU8roT3tLzdH+ZQQIP8JoFpiGQE5/yTxiDkaRG2hQ1NRe2320F
 B3XlnP/UVeFJ71SFyLb08IQnJRWQtg0Rg/wDU9QgjhzgMKAXgMWTWUmhCbWCfsE0UNET9yIWwgX
 ECu2eFD9ex1kh12k/36i5xW3ZTqsX9B2YIeUKOpM8IV6HGAtlwJQGjoveTjPPUxwSeCCl3gnzGm
 LQYNqBxwd3rJ82tnkzmZKOfxUugODYQDQ7HnSTLtnx5V6usJU8YDQnj3xktu+KLHo7abAqxk
X-Proofpoint-GUID: eDuRkVMBV9YTvoxj3iccVQ2z0fsmC2gI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=869 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020105
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

On Tue, Jul 29, 2025 at 01:42:14PM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx8279.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
