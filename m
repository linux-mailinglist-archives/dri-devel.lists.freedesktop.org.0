Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE32C00F44
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2DA10E3E3;
	Thu, 23 Oct 2025 12:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek4YFsd9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07B10E3E3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:03:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vYGe005702
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=M81zeVL5vCT2BNHUGaKZfq7O
 ZSW446AfEB/X68ESVy4=; b=Ek4YFsd9WhBLUNX1u/ZkUa1H2LUhmwgQN02YkkRd
 DQVoXLd4/qTfR9ulGVsYZWj+fDOB2ZLUeLzmg/fFciUgkNc3dGDtmCorw3YrlCq7
 uVTMofWObMsEhTabwKctqFnEtFzNG98Ps5wTG1Gev3hseyR82tsxPj/mkqfEfzcH
 6PLAzLnuWE3L6u/0l8WpZ2DiG0XtSJ0r/eg6rhgvREEWwbkU8x8CYjhBIBoQD2Gu
 RYHA8fOuEQT+Am2W2HfXNYfhe/dmAbNrTkKyWnDBQ7u9MR8x87XZOQKfsBXK6Pub
 oEZT1B9hEL6sGHxTYH84mK7Tve4wBRgQ9qDHcVm7hKLb1w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j87p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:03:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-54a7c3c3157so329968e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220989; x=1761825789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M81zeVL5vCT2BNHUGaKZfq7OZSW446AfEB/X68ESVy4=;
 b=eCXHD5NU58UwRF+U8bD6kg4TY9NEZEX7GtmlkwHgBra49LBcgVnhaCUDERNZsxKgkR
 YhqV51vcExasRp2X9GB7a4jVb9C/rl0+6wPBm5+hOrFmG/PJ7QmCt9s+htunLJfF4rsn
 2aP4teZ9eoy2X8+B90DN+rTBIEJboD8md295kqUhCOIP55tO1tCedO+jpE0dsa/2ITZE
 oBuoHJvbJ3rfME4gCSSYbmZ4NxEiKvD6+suejOVUGjnchRVNN9oqad7XvccPwlJMkjdM
 4E1hfIal/8L9ZQDr+9weEQ++zJgfn8bBjpWrKdW0nXyVSN6VerMBbHI7GyHpslqiCpNP
 0PnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUStoXzz2kFnrJEPQ3yQimJWq+6z0YkW6kRskpEQJYNK4dhx8WfK/7IYab8kLCuaOCG+9GDBhzB464=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxGG5ShS8QuYySykKajpB/6f3gBt6wt77vRFypPH55KDGFZtlg
 Q7CZqtIC4DkDLUskfLchm280stn8pdI6QqKjUQLXeg2OAvyufHAefz6+TUlInB4zF1UjVZ5OWmY
 CVgRgmtJQedD6TfHMhszp+xg0Bipl5v6O+Z4yd2rI6r8BloTpsTgy1SW9KJnW6BZ2XeEe1OY=
X-Gm-Gg: ASbGncuPLKAKlqMx0Nx/UW3Xlxi0F8PLdES3l3ZZNHGturEdj351nP1V76cpYQBgCYm
 q9nj2cSorOKwgzadgn+gBpg9l+yKOMtCzi7t+GXESbHUV8vcGb5i5pHTVBa6Ik0TL8/ZZia+QuM
 9ojtwrwSdllWN2Vg9WdIVwF8ByrulKsSYjZZbo8DVCURxOP/5xulZNkiGFUdeK71Ts8PCSpATRF
 ViKAEnMnVa9rF3ZEOu68+Yju5NnLKCx0G+tgJoPD24ndw2UP+wvo/djnmKdGosmlzy1pbrpM53f
 8ysSN8yk9pwCCDb6DnWxfPaf8J5Ei1apCbjfxxlnc40GpW9Dgwp/XxHIhgcZ8M25j/dP/wdXyTA
 7BRFp1drUpGB53hvRlhibcV/yMULGe1OkRKmouw1XdyaUQOxz44EzoqAJIdShgqkAAOAgxRixgp
 B5F2lfNyYzrC3i
X-Received: by 2002:a05:6122:d8e:b0:544:9a46:7c85 with SMTP id
 71dfb90a1353d-5564edaa58bmr7102842e0c.4.1761220943614; 
 Thu, 23 Oct 2025 05:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYf4cRCjfFBuC8sO6FcOxLi7vaZ8cGTF8QrhwklAMfIk2LsC1fPJF0Hqf+fYEtQZaBheqJA==
X-Received: by 2002:a05:6122:d8e:b0:544:9a46:7c85 with SMTP id
 71dfb90a1353d-5564edaa58bmr7096044e0c.4.1761220913364; 
 Thu, 23 Oct 2025 05:01:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67097casm4150311fa.22.2025.10.23.05.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:01:51 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:01:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 05/12] drm/msm/dsi: Add support for Kaanapali
Message-ID: <trkt26sv7tpucjzgguv6ww24jsbs37ppimppyvhqvy4drtqtj6@uf3m3rcmrg46>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXwJ+AN0DQDmdw
 4pBimUpJLSVZVYeZNBrsiSNZUgeJT5L+/ARze5UfCAwPbFjhT8+1JpwCPCbMCfYYm3nVdqyHAL2
 OCcqWUHlSp52Rk+2UAQGNjtFyRu0YdDXizoxe27viT4fH9m45H2HeWguNbvgiUi9pwfGAONqhSY
 8prMlXq8XTwNoGeqkWLIQ5Q6xb5euEuoBbXWGL4VZhmayi5jGYz0MPb4zaT4P+Tc4FtS1/xsIKN
 iQDzMCX7nVow08qenDK5RTt+a7ZY+9KNT92jEhyu+Xf3oTXURv3Pze9H1cqhEjarBJmnTEuG3GQ
 QHHeUBTBKpv4eU/KXOBHRo0laXy0tgnkNGhLeC5TolEW4tgkOdMkouGBmIFnbOZNX5xeuhQLVAx
 irY+NRW01lpfUE9XYrbDL6BnbD7gEw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa197d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=A-_Rx2uNxy_47QfWGsAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: HRL_nJu4cpPWQcOqHS0ebg7LW31mlVHn
X-Proofpoint-ORIG-GUID: HRL_nJu4cpPWQcOqHS0ebg7LW31mlVHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Thu, Oct 23, 2025 at 03:53:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI Controller version 2.10.0 support for DSI on Qualcomm
> Kaanapali SoC.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
