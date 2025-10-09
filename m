Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE99BCB046
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 00:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3B710EB2E;
	Thu,  9 Oct 2025 22:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp17ahPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3399810EB2C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:07:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EhjkY029611
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 22:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=; b=Fp17ahPT8DWjCQpt
 qouBdxGL1HMc6qfBQ5fW9eknKz0/5+fYAXH6FGfBwTVqeKnXsCrtGof8SNNFqChl
 vXB0p1CInUbxoMqW31vKUzukBG8LlPAY+IEhKUX9qYRTPK2aaCV3Umy4IqPsxF1Z
 SXZYRzGntiBxBIdpbPw1MTD/qjsmSCBn2o/mGZf5seTFB59S9odpAcMN921M0KzF
 vQwv+yLvRoH1N1oaJbeePgp1KDCm6Uu/gv1iid4CEI0KeNuygZ6mnT5QHiCJOKB8
 2X8OLjzYRY/cVhU2ii49bg060HRAN/F4ftjh83y/pP//xh4qQgU7yZWwE1Nzimma
 pM+cUA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nmd8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 22:07:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6325a95e44so2171683a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 15:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760047619; x=1760652419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=;
 b=AHTEQxPO7mZuSTSdX9jicJ1/qmsZWse9VN1l2Jf4NNmb/qY83OmKuEElRU+Y23FKu5
 TUuU7umw4VPt/Yrpomu+7+HWOWNxPNUbLojwrlJaZzsljA49+yILEwl/NRETiPs3Vb3/
 KvITxOz04y8wRHHAAUJQtIpr7/fyzjsATjexfU+EHQc4e2SeF6WIXeuUi5nnIytfuo+F
 cvDtxvQ5y03xNo1DNQO6A9eludAcCECrMix0CbA5WPEfHgw//eCc29SuPpFmkZafUDcq
 b5GFkRZYzyUh5lpM7WBX8RWKctQG4H07TDqy8zlaOIGwpzWeQt0tuseImYChsYFEqvOB
 f+Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuQzfb4RnEaov5yztqxRS7pfjXtxKAMbcWQUJqLEtBG72Z+WJrOSH2B2DsBmB2EUZBdNqh1UD+W4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL/TFW56OXITmYAX38RSEBGZNrLXPtX8IYe5EIAGlceyLIB8g3
 UdL9Rxrq9/CQFne5Ud9ZrJs+tcT/6RlMDYBBC1vHUwQJz04p0TQPp+3biT/i7qot8DZr4Mh936h
 1yGn9GnU2HyotT9I6/inNnU854B8dxiERCjEzf3GfAkANRzJPwwtUqjsFh9TxNwM54lVIe10=
X-Gm-Gg: ASbGncs2G6YPeGpSqxJ6WhSUgEL50xgx4qmZeCSKXL7FrZ+wys03KCRVHMf2alUWTPf
 ZQw8qEJN+fJPhABaABVdkrb/4eCPgEanP1Jgyni//w3uQBYj+/UowrFnSYEbUUhUBpST2sK3Jb2
 zlo85QoxoFrcCxOaH7hBICfSy+UMhJXqcEUmyCRlFFHhr7VUlTkJFYboB+AnLJFPul6NdGZSTgn
 LDQW4zJlBXjGuDbV1wA0r0fQsOjJEeiWlTg03VWrongWIMPuWTrhNSFSNRT+pYw5Za+fOINHk8Q
 q4c+0Jw+Tbz6IhWIFrxw/LLIEbcfWWsDRc0SLFdoCyQ4eVAugbfhsowCjb02y3cQ4R3Fsm6+xTa
 V9strbNIP+uvRimKU4WF+1I0udYg=
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id
 98e67ed59e1d1-339edaae564mr18570374a91.9.1760047618894; 
 Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4fyyM+GG4JOApDItPR8uaTlgz9TNMfnQuqAW3pfKetHHZhA+J8uV0VeyiU+3SyCfTwZRmzQ==
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id
 98e67ed59e1d1-339edaae564mr18570335a91.9.1760047618340; 
 Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
Received: from [10.71.109.75] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b0ed20sm908807a91.23.2025.10.09.15.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 15:06:57 -0700 (PDT)
Message-ID: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:06:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX83w4Y1RTq8E+
 bIEUGJT8QQjNoCzXPUqjXkEpULXyiLD4N4sY1S6d9/woqeFYE4fzYG/PWEp9uK4SJWZwXf5qdyN
 3umrort9vxC5wUDVv/mhRDMpsF119oamh9NV9z8vxDcmARh8ldZxr3r95wZMmGpBie3P4JVudUe
 hjh9hO3yaKI1r4Frdhct7849oCyoWfqeCf367yI8ngQWuOLpd9mPoAPNy4dz84zm4QC2hdi/NYc
 FXpWVT7BbSn0Zf7f9C+lYkm7PKRrK7PrAUsoCuqYuZ5FHJQO1H3wqYMrQttO4M7J/YTVI3G1eOM
 9dLSZAdaq/lNrNtEFQm/zIXjRmwezqmzBBdftDvB0O5ulQx7Rk+2QsBGi5YeqdD9euY5xE+vkMi
 iCKQAn262u+hH5C1rJbn/A7vm+9N0A==
X-Proofpoint-ORIG-GUID: 36tJZ5zkU_WVhYYTxJh91s3zatKP0by3
X-Proofpoint-GUID: 36tJZ5zkU_WVhYYTxJh91s3zatKP0by3
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e83204 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HXVKm-MKDGyxfSjg48sA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On 10/9/2025 1:09 PM, Christophe JAILLET wrote:

> 'mixer' is only zeroed and is not use. Remove it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>   1 file changed, 3 deletions(-)

Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

