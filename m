Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74737BC8353
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA7E10E989;
	Thu,  9 Oct 2025 09:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4WQfNsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC58210E989
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 09:10:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EOBW010854
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 09:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=; b=X4WQfNspdGcNJbZr
 DSXD7I7PL3YF1t3vwZYpAGpfgw+Mu1lbIA7nVDCrIFIm1E4oZLZ+1Iz4gfCl6qwR
 +XQQ2B+EuWj3+o4fEwHRRPKu3D5zusxKR8IeO3tyCmtcXBqKKNK4gWlxi1hNM5dl
 kD5fI0QVZxVlTpS6c8Oog0RfYtCkyqwImFsxGlnDBWumvZLtuPVJS4SItj1n//qL
 2ShnL2sun68DlebdMrRZLQw76EnwyaIhpKMdaVT5kQEeSfJpvJ2A26uEDxxi9iKp
 NMBmzzkvbl3d85tcfXYgNPsvk3nf6hOZrSqwgZ7ue+MConDu1ULj1wLbk8J0QUle
 RP9v5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9aa5us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 09:10:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-85bb4e88394so23184085a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 02:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760001018; x=1760605818;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=;
 b=bOSurRDbsxVyMnBMGQdibNuPPsp/AFiqMhBYGAxSncJmecaF/VJmW0spSFgLSbAzF6
 EzkUZozU7xMXBk5fanisMsJeyP51SyihlZe22Yl3kpq42VHowlVwXIjWnUFt4Ri9Odaf
 hjwuWO5F2kdxKtCywaWf9aHj5vPMYiXsIKIacems42VcAOLl2SWlbJTD+y9Kku5EwEIr
 3BsRYwmoa6TLAz1o8X0JAkopOHiZJ565t13mB9ErJLQW8j4OJKHgVEsSeFivglY83nNm
 pMYc0ZzwGxc5jWbwzfg3oF6iSb7mIHqggl1OwFaxgFZfNFu9dK7mGXlJb3QRlJgRdKk5
 3BBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeaeCx1ZYWNMZMccG+gLeu08+Q614Zn1DKereInxkiDyYICEhPm87VSQmDDApo9b5i1NELk4R2yuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcxKFURFq3p5a5EiVeYeWNWFYS1LIcYN/qPY6JPV5QKXUpBXZ0
 4h7/8zTiYZzsDHnuSEwObDwNvY6ZK1S+7gfc0EyPZemaUX5o7Mfp2hi2vHDZTvOpUhtBUo4iDS+
 GLPsXHDfNwmbvG1ah7L+9f14kuHMBJpvV8Rd0NvJZUfx/ioIs4X81yhwuyJXUZisXu0j27iA=
X-Gm-Gg: ASbGncu87PHiBrDkXntP6nOFilN+nVGJ59JvZJ/mm3DoYtuTUKKJLkXTjBLKDzhjU9y
 WVRzuPp6XuAyDP4xkJBjTfWBUxNgL1wgrKkZ/IBtYrM4GjhItx+cN2vMuh+7XXkFcdRq2HAwPB2
 9kkU5q8jyz6CBmcQIcjAGNvtQpamxIn8X6NYHInHyLmdmRIzrPmAZMqn9Q/4bhFPclqgNOMUErx
 pEcK5btCrGI9m+BX1kDjoaU9F4YF2ZQkvVcGZwZ2OXNNKY1I74L4Z43e9krgLs1cOGT/y4nuQSy
 tlyJgrYDKzd/EA+ZTKYEpozrGkNxnjuwOHsGHQxlXwm7ZBfRsTPB8gE2Uh3pmPd4fSS3XliY37S
 03kzt+VmGL+CjdWEChP5XHafbhak=
X-Received: by 2002:a05:620a:7104:b0:835:e76b:ba25 with SMTP id
 af79cd13be357-88353e1a4e2mr585135785a.9.1760001018070; 
 Thu, 09 Oct 2025 02:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6MZb6QOnbhBTE/91nRDArgRgqRLTEI+IVWFn1NxgCnvCATzVRomE0Pl/cQ96//aeLXvp+jA==
X-Received: by 2002:a05:620a:7104:b0:835:e76b:ba25 with SMTP id
 af79cd13be357-88353e1a4e2mr585131285a.9.1760001017473; 
 Thu, 09 Oct 2025 02:10:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4c83adec08sm1153029466b.56.2025.10.09.02.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:10:16 -0700 (PDT)
Message-ID: <597ae997-37a4-447b-967c-8fd362098265@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add eDP reference clock voting support
To: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009071127.26026-1-quic_riteshk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXyWyNZzyOqsPi
 j+sFAlvwZOrILk6bw9F35JsUJMw6E+1IDRbLLKEvBKxrU2aCa+aDlnuwRDRI0TkHgH9+Q9qMfAO
 hqYm7p3WJUE7Pn6hA9BxhImeF0bC+KJVGIANksqWPGh3elS/zmHc/BUu+CUmIDSgFOvbUO3pZLy
 NBg+dWA1ytI5DnuA3POU4uo3HWIlfJl9rW3lMCZRZfXUplw+RaTWfM10cSu8Ztq6pxV1uT/L60t
 K1vcbRFUDUs8CmMGIK1fXRNJNaZRPHO7ms7+MiOaJHZKBCZA3x5qkzbErXMuxfIiFyfk9pEAW2/
 UKrIhsoNWg63OC0k/vLT9HvwMJUR/eYW3RP85zSN4qTeudtXbEUMzbbv7L/1cSLdHjoFVKDNCFM
 AvlcW9LPHlvdAklLfH+ohtUNA/S8wA==
X-Proofpoint-GUID: h-pcpsR6LLu44GdxxR2ZgNNfMzJlMwWj
X-Proofpoint-ORIG-GUID: h-pcpsR6LLu44GdxxR2ZgNNfMzJlMwWj
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e77bfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=rf8yBW790zp7CXIHNmUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122
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

On 10/9/25 9:11 AM, Ritesh Kumar wrote:
> eDP reference clock is required to be enabled before eDP PHY
> initialization. On lemans chipset it is being voted from
> qmp ufs phy driver.

?????????????????????????????????????????????????????????

Konrad
