Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F0B3746D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 23:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D37D10E3B5;
	Tue, 26 Aug 2025 21:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAsrtfik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14E10E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QD8EkO014221
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=clTRNlMfsTDWnZAZ4jytuHfn
 PZmj1afqUgmhWf7cX/k=; b=VAsrtfik0TLBIkRuI4N3JDmJMS2bvlceUWREYRmh
 /OEntdKy0NOP9cfM4wpFpgHRjOfDyjAXEax7TaYXqo7Zwl53LJHVjsoi/Zg1351V
 2j60JAC8jxgCACiyqinxvR8qgw1pBuMMQAe2OCbVMqzM8p+LyaGHH4xi9s9jnSwb
 013pD8V6GCA9hSJ6ByEIMW24tJG0g6tCJ6b1dfZgHAtizuN+NFteNyrYXxVHQYny
 xy/lMoSUCD30kPDv7FKTGZ1yFVY7MhvOrd8Y+UE041Ch8HN00XqyOd32/0PnbuWJ
 ZmzI75D12MKF3kqE945U7QfgxRcdlfqYNDsF5fT8iKtjAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5j9ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109ad4998so230974851cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756243709; x=1756848509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clTRNlMfsTDWnZAZ4jytuHfnPZmj1afqUgmhWf7cX/k=;
 b=VM2kj3F8IRiw0I19Tqad9gC7nwiCJ2E9hSiZ2HkHNAHN2r6I8cYnyPn/PD0pIdJwIA
 dczUFw4Zp6E3FsTCbfmp3r+ug0ajD/KdJ/mb8XFqxyYj9YGFVlENPmOCBaoXpZ3/csK7
 VNjmLQ3yXIXM/+5b3DF/BNxJA0jiqNl+T866c4CKpzj2+gC6AAouXkh8waixEUA6aB8z
 uPUjeTq+IqNs3sbeoWvJ5ytxpXgOb/LkwxKDlZox7q3+WSDJsTaME16XDE22Dlq8BREu
 LdWhN2Biyi5P0DJI3HkRvd2lOWPF9eftz7fg0Qj2UFAC1L9R6BLknedN81oj+itrTXzF
 bTaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDY5Q5DKHOVYCCqD71Cvvf7wonLdnS1yv2EzBJiVv72v9uC27tDsCql8TmEtoXFrXvM+y59IetrJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJc7786u5rnxYSC+jDwydUaWa6jEas2RCisGZMkQ51t9TO8RMe
 CIP1znlyhh1/Bh4AwZet/LhtE+pqoDHW/vKSm5ELv3MqFqve/3zNEY7P/1pzD5qOrlNRW8qCpMW
 27fGGxszHhNok3pYI+08rqmYofcZf/e1tuk1GSK+Flpu/LCtny4mnnb1xmv4emXuLV0kM/gI=
X-Gm-Gg: ASbGnctZ7DOCSfPD1fILKFXbdHyxptvItkTNa8JSAnBovVuC2kwBn45uCwITY0IXU2S
 LZeqY+viVMlPLFMDhrH8FOlFl0wOw+DQ4rKpsgnx4oKa1N22OLZ+FBKLSG7NPlhoWJKuIT/VOFy
 OuEMqbpw+hK00AmJpVzntxMgPqjRBurWgssVL7f4kSTdao57LxDWcLqm/Q5f3iFIPoI51CFUF9h
 HQNPYcxLFSsPrXce8vIPSw+YaFVZuxyQr2BdX85NSFpT69OZQgwdNCd5YlRzDUeiNYoVt+yMMwr
 Yf3xtAyuMTK3LEgBTQClRI1EeVek/twQuYeiUbdpbtsTeqWPiCxaOEM7Fjlq5RPja9Vhcijx7qU
 hEG52+BPWI5ac9vTqW8orqlqtsMs1A8zsKeh4oJ8lPcxEsQWfEcFp
X-Received: by 2002:a05:622a:118c:b0:4b2:8ac5:27c2 with SMTP id
 d75a77b69052e-4b2c4d99612mr129989681cf.77.1756243708966; 
 Tue, 26 Aug 2025 14:28:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpR67kwi5LVp5pSfPnw+J3VFspElzcvSFuZyuXNRvTjYvd1FyPiBQ8eOYtogA5Vrr61DpMWA==
X-Received: by 2002:a05:622a:118c:b0:4b2:8ac5:27c2 with SMTP id
 d75a77b69052e-4b2c4d99612mr129989341cf.77.1756243708542; 
 Tue, 26 Aug 2025 14:28:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3366fdea6eesm16950191fa.44.2025.08.26.14.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 14:28:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 00:28:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 21/38] drm/msm/dp: Add support for sending VCPF
 packets in DP controller
Message-ID: <irlo6dhfm23b56hojskn5oxwznwmcfpwkbq6zq66o7bhxvq6w5@4qaldcvcwqev>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3sd6AS7DIls8
 K7JOn+Yoi0q1C3X7Mfx1cs/XZufi8RNbHW29GYIFaJSaQV+rGrw1+z9jmnN4OryKTwV642VpFEY
 cmWXmytr7vf8yqIyft1izG5hc6EDxobkGigccRZGyLs9Q8pzbjD8tgxxH5Aphd6QtFVGVT8d65i
 5uNxXsciDQKwPNCYLEcMahk0xC4+dFsBLJkfOuLBe3nGF13WTvMGvDKg9l2NvgLB0M+QhOdSpr0
 1STk2aMMxWh/8pK8BKxBSsay3XvmlOZW/wkDYQpea+uSxODVPZQbVJyluIsYjy6h/aRG0YmsACn
 j7ctyGxEVJbmUkkyxJihNNlHl9rYKx5gtjKLWPo/i8yTOxki/9dLTdRjW2VYy75zatcbB00wwFc
 sSZx6UMA
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ae26fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=abZXHuzVrGm33jVRzXcA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1QfzTK-f_8sxkxJslD_UpFu7ECBC50q8
X-Proofpoint-ORIG-GUID: 1QfzTK-f_8sxkxJslD_UpFu7ECBC50q8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:07PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The VC Payload Fill (VCPF) sequence is inserted by the DP controller
> when stream symbols are absent, typically before a stream is disabled.
> This patch adds support for triggering the VCPF sequence in the MSM DP
> controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 56 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++
>  4 files changed, 60 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
