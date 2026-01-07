Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC638CFD919
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8810E597;
	Wed,  7 Jan 2026 12:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd/b/mfO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRcZqmtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC5810E597
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:11:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079rrXY4136986
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 12:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B8DdWrTqA5MJK0IX9QJHOaBg
 riaD+iPxH3wCc6Z0zlk=; b=cd/b/mfOAvReJlNiL2kdfQNwutDDZbbPomqgNSwB
 XBY+WKW3cf6+Y4DZd1+FtMvM/OdURJweunR8Atk4wu6Jg5eUeh6tFD1wH2xBDaii
 dTXiDYgJKbQHX961th8IJEiBYatQ/p4ua4IRjQ+REbAjOcWhZlJ0OmM77u/alosW
 r8R/us21+a0RkCAzFDRhsNRYXUoe6Iw2HV8D+ga79FnuLY4Bl/wKgG9SiThzBXWV
 KJc/eI7qGCYZNXAjk9ZKEUWWB9Vy5aTuQNuC/QhFaBQgV/9KR0d+h6ngH+SQOCFv
 JdFREcQAOqqc8U+EH4tSeR7A/NxOKMwXQEEWuDvkmo227Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e37hd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 12:11:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-93f5bfb23fbso1666584241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 04:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767787880; x=1768392680;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
 b=kRcZqmtMQcAXS4yT4qbR3REHWSPD+OZ0RP8g2Ds61ObxcwCVv19K7jIONY/Bu7nxnL
 kODJTH9yRZX2Q6DJTzoCh4p7CnFaUUBjTZicxV7i7IIcsb01FNbQNo6qEiXLN1jDIFpD
 PiF1fZhiJzJqqEZEcQXnP3Y0kDAbpI0Z6YXPyQvGZ6nPuZq7yLqkomTWVxadYVfQE2+c
 SD/MIUbGyeGDNRbFnV9rdUnlPaVLx6ph+JrHcFOdaT0cwVxzcGt/gX58hA9w1Qlx6ekm
 0GMNGf7zQovsQLEEZ3x60sEMH0zlWICuE551PDU1p0nJdhuSrwD1DzI5K+rjCd71Wrn8
 8xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767787880; x=1768392680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
 b=r8qVUfQC1+/OuAXA7B0a90C6QWW0yNVsZ7R8PRp5/KzEeEJx5mqoM1fugx7uD8rGb5
 MQML0t/mGZ9yY7zLWxCNo7nJ+SFjakrqxMXB20FXQ8Ym8bSyYwElwFKbd3+naXhAbg3F
 9aU3JlhEjGH0bdy2lQOCMU983RS+cAVJsXPxRBf5wYULSTNIcyPHl2HuuRqaQUYUp2e3
 Cmmmm1tXfZ253OhSQB08FAMK7Inne2loswWwsQrRFr2lcHWnTCXtj5XlM1nM0WJ8gQok
 pjrU+RHSGesMtmV4W+U+uUiWWYdKs81vNhpdtDdHirXGwRWRvODiWgvn73RkHBcXvp/b
 L6Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGy43UwPTKXBDLVyiToK/Hi1o245OKGaaoFhixfI9INMXuFfWbuEnepraCgrDp2Wlge2S9r/ipBY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyNgOvdAQD6BRTVLq8AHAzuCHNZmHIhSo9xflLLtVCiJLch2sf
 fiXlZ9Eaz8ehe5hGlEKbTppBwW8Kw0ccWyo9ylvCN4HRcgmOUl5YmgKwY7RfW1uN+QTjFoXuiVk
 z7OBFin6qovCJ934nzc3l4vUZVG3fSqvHMj7avJB5y7qxoOBDNd3HZgVkJ8IZH1VAjaiKh1I=
X-Gm-Gg: AY/fxX4Ez05gDYPYOE5RGcMj02MB+YAtXJqFUGzXZoXFxWIRm0w42T1yUiIZNOxIi92
 HGFL/F+GdcEM3MAFr1nKucJ9m+Eik0f+fOTqO09Su183/9CMPByd3SDz6WSqoUuy3Y3BOuFzNVy
 bY+M5n0urbljcokLiGb6Lrp31k5vnthwoLsN2CSPbmLikvGhsKEKzNX/hNc+rY6N8ic8JViKHx8
 Ep/Mu3BXqMf4wbGf5+L3nfTnzUxYhsaih3KPQpT/cocdkH7nq/aAIUO57r0Zg9JxJbRsLRSXuwj
 3iBT6rjYE6lPdPxpFKbuxrokrRLncPqRFtaFcY/xPEGUfY3F7NoL/0wQkYtDbGOI+CmGCmDqI5L
 Hu57cFB2kPSfpoeMqiG+CeNgNT0+Obhi9I5JillAWO0GDhclz6bbE+cZb2nQn8ebhGlZuaeOztf
 kMHZnUPYX5rG8fj8jfHcHNdZw=
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id
 ada2fe7eead31-5ecb5cbbb36mr717460137.4.1767787879866; 
 Wed, 07 Jan 2026 04:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh1Hd2zzf+PWTMiMR3FmXPRYIbB3XVhByWTYZd8M4UR/fRJlpbBKx6uJ9xR17c8To6bYWZoQ==
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id
 ada2fe7eead31-5ecb5cbbb36mr717436137.4.1767787879384; 
 Wed, 07 Jan 2026 04:11:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7a50c7sm10830281fa.15.2026.01.07.04.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 04:11:18 -0800 (PST)
Date: Wed, 7 Jan 2026 14:11:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: petr.hodina@protonmail.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
Message-ID: <e4sfp2cexck3llleywxev6hfn72zx7kuq73kdzckks6qms3fvl@i5jjlq6y6rcg>
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfXxxOzpXWF66cc
 /dzWiRYQ2I5fSIOXjrNGuBKPnow8vQblUah1fkbT8z3hpmo4B7wucikq4T+34yjBxHD04XOHi0p
 UCX64Zx1X+gXTnIQe0zLvHcqzM0O1lom3qkkrZu3ooqUXs4n4Q7kndCvw1fPkowqlGDYfofU0Ps
 WMAhnxAaaIotyXBhOZ1y8jywuUfQhO0uinm73Zei+oy1LNk0mLmvGBf+3dhfeUyrREEvcKfFzJ0
 EZ2NqRFjy8sBgNkWESC5W+SNLFjqk81Wooohw2KZHOBHW+PRVR8/SexZsIulBnR3QmIBKs0ziZD
 sit1oTgoYBs7NUNFMc/oAwbGR/G2Gi+ZlneptekavZj9EPfpLni4KdQQBSS4HNwxgjeuk0uC986
 82VXIhGe3DK/sW0BN7FwZADR3QLQVmJsY/643edwLvqaidt/9HmKTTF8yH7Bs3oPiQRcb/4piJJ
 f04BTAfufIGJYQMmtEg==
X-Proofpoint-GUID: YumTMn4gqFCfbXwsyVEGi9cKcPuMbWXj
X-Proofpoint-ORIG-GUID: YumTMn4gqFCfbXwsyVEGi9cKcPuMbWXj
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e4d68 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=wgz80j5CkXKHoATOBwwA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070094
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

On Wed, Jan 07, 2026 at 12:44:43PM +0100, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 
> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
