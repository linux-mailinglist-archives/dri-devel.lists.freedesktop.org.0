Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53087A49ABE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A631610E29B;
	Fri, 28 Feb 2025 13:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFVvvKO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AAA10E2A5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:41:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXJ0l011094
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nxMCwl4XpxYnWA6xmBkQbDigvX+AcrDze/AyDFhTQLo=; b=OFVvvKO50iAK6F4O
 7oBdGSE93x+vZbkODA6AyP+uDUwURPPWquO3ElfzXrZ6xUagG/WUH23epzsHHELG
 k4Brn0xhLfkPJ75YDEpFQmLXPCGbUJBbMELT7aXfoL/hxROIaXGa6IjQb8QOilaP
 NYfDrJauA0CtPVZwBTCg1zoLaiD/Fc/fMTOsLScChCS9Vgjmoqy2xZ0jUOCHV061
 gMbgZvOhWFk8wfGQZMTV6eY4yn7EIiRUuF+88oY143hoD0u3vxktCcB+IzVVjmdo
 XX8OCjgmNFJX/SFyamIU4OveawDJPN6xvv1nGXUWe9mJe77RaI0NIClIZjYtac/0
 4QKIfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk9her-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:41:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e89902aaa5so3229896d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750083; x=1741354883;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nxMCwl4XpxYnWA6xmBkQbDigvX+AcrDze/AyDFhTQLo=;
 b=j0cQj+w6/rN4uK8QU2Mxxo1zMVdHKnfe5EmlmQFGkCV2D57/rev9/qgjYa0EstldWU
 +1/ZGbdUhC+0I0i2921yLykDT/YTF6+PImmLz3/ZLKvLtDtZnZZJvqqc5dqqG2XLkcci
 Pwmlp22BTje1JwXpQ1Rk+WpU0HGmIPUzODbIubdQ2fyq3EPLfALRNFyCNTi6r2xYXMHc
 akAwxr3gnYO/SG+KNXCZBQfRe+9N8W1Fh+XILdyD7d/eBsqnVIznwOaUOUMZGj6/Fzvo
 HOMgpWe1Qjjhl7uSZfg6L6veABaeyp5iRHpMObX5MioEAjAC23CyyjnhqM7l4uYb9yGy
 m2sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9u1i0HXEfmYPRx+zVmTomkNPGBFD+ZPwC5ACTdiANhL6fjMChuWtKX4ML47E/KR1q9fxoA4KU3Wg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+ckb2ni0nklFzZBhwR+YeDi7wY0LafA9dVFczSqsSBGWwaTdX
 LkgKGDLIANIVQZn3cetcPQaEh0TgCxppfdrQCEyddtvkZ8jLC2aWrOUUyK5w1cmkYs1CfXCnpnN
 7FFnIPDYg0yDFkw+pCqnnhV4h7Sp9v1ioIn5INKGaLzGcK3hjs95i76kHA3Nxy0OxhtI=
X-Gm-Gg: ASbGncvUaDdp8d+OAMj+LdcJmFuRuKWu+a7r+iS9ikgXf5cXW6ks1f2uoDV+tEOmL0o
 Eh2FU0klqGvOhS6oxslZDpynv0HSIh352JKYOHLOJ8mgGn/LT8bYnZBRmAIcm9OuGgSecX/zHT/
 30oDz2dhZ/mdXS3o+hUw8TbDuCbwZYKepmRfcSLpWP1xhUeT2HuOsDlPnsS/sSG/3kkbulRfbhV
 Q/Mu75/TbwpKGQ8/ZYg1O1lL7nhpaH/HHViufBt5lACd6ZWnMBeOIzpnja2j3ZSxKQjQ7IUaQ4w
 ZHP2QcWHNBgB4XJXrOGc3hhn16x0uSGS0q0wuUsxCWN+UelQCHkOFHO0LZQusrUD12f8Gg==
X-Received: by 2002:ad4:5f87:0:b0:6e6:5d99:d1a5 with SMTP id
 6a1803df08f44-6e8a0ace905mr19202256d6.0.1740750082787; 
 Fri, 28 Feb 2025 05:41:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjQWfIes2GbLXuXvq0DgihsoT/bAGgb6fDqf/KTL8rxJT7bL7aWTL0JdWW7i7ONoFuTU1Q7A==
X-Received: by 2002:ad4:5f87:0:b0:6e6:5d99:d1a5 with SMTP id
 6a1803df08f44-6e8a0ace905mr19202076d6.0.1740750082389; 
 Fri, 28 Feb 2025 05:41:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf42c16af2sm30308466b.116.2025.02.28.05.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:41:21 -0800 (PST)
Message-ID: <9325e4cf-425d-4fca-a458-20cdee6e4111@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XFiIfZS4xBoEtvgadHggzdBw3uIs_WnL
X-Proofpoint-ORIG-GUID: XFiIfZS4xBoEtvgadHggzdBw3uIs_WnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=960 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280098
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
      ^
in all patches

Konrad
