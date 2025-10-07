Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B2BC1FB3
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8AB10E6EC;
	Tue,  7 Oct 2025 15:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZD5Q8R7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B53410E6EA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:49:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETFft027441
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uBc3TaXn2BwcM0y0SH9i5CDp0h/G+JoiGzmqs7V7f9A=; b=ZD5Q8R7cUyuan4By
 jotgyxlOQhgqBlVf233v1oVMIfq37Nr+BAe1aH++0Mxx1QZymCrtVKqOgacQBjM+
 pp531qrNYh0Heq0IKx4p+FcbkOGTssg+pVR1HAH5U1U3QQGXLH7NpJ95bdglhRMl
 +4EOBuhRiZ1LE4l6sRnyJcFEmHNSgeFuIVcDmR6oO1B+AWf4O0SGXvjetH0CBHl4
 lGRqWB3FWkVTLD4vRaCPyG0ZTQXLzdK93Eu3PpoI0PEOzvG8U00n5U+l6xW431Xk
 0PYFuRbGdFxRqqqUQF5ZI/mYPIhKLBlPfOj/lWqyYl4NkJBjPjtS4ObyZ9waSkEA
 NAxT7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0kgpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:49:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-269af520712so69879495ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759852139; x=1760456939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBc3TaXn2BwcM0y0SH9i5CDp0h/G+JoiGzmqs7V7f9A=;
 b=LNK3Y7YJE3zVZxrSqyeQmM7cVQzMoE23A3//+hcflKLSmhfwjTYk7BxbZ9MEPHAoRI
 i9L+RHnv96Vt/M2I0/K/pXFwreoABnyIWd5wShkRuTJ4ghNk7xZj20ypLZK8F23JQsKG
 IX6qfCPiQVUMujs5/0kPlzxQ8IHAhsqdjAasMXQmGCRyPd/Xd1tgLRdhT5tXKwu4f10l
 zHgz0Sre0tLZi2Crd/8J+ePoQiBxHAopx8xzEtr8lhUrP+wJl1kA9dcgxFAvOtCQ++D2
 276qxI3DR49vPJkmYNZl9onB2q3qxvIZNnYTrloU65tpHf6ojIZ8uXL09Qv2kglWHAnN
 t60w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm1uBowTGodi4XsBrxmI6c22lIpuDmzYdGDEGqXJu8QK/1rDWstkoTQojJ4BESOLjSVH0TZgafHIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdluH80bTzhiwFscgXDeWW4Y1Q2rAii6H5Pwsh/W6FTXeDrUWy
 tl4D9nrxpFotIlFf1/9d3ZMdyhuKfAvxsfJAGuVr5zc5fGjkIA2+I4FdP4om0XQTO0IbY0vR7JU
 6Su2jGsHIBGEpsNGmY7nFbr+m1Ri8BEUcBXJ73wVaJA5GGD9ewCv1UshiIv3r14CT6RxGHYw=
X-Gm-Gg: ASbGnctMrLiIcmd4bWgXhwnLnyhXWOVzXT4T6gsen4aOwIok0H+gEThFW8HsmMXzEEE
 bI/FPOULQWuYjfjUZhIsoxfd+9vFmtkfQROZraI+ConGYV1h7uLwZulzllrAXMTYLiGteslaqnh
 whqL6KmVqMKlgdVL7gSsCaaa1vPXq5mckxgagSAkk8gh845M/ravtiQxT8E+3hes7widIS+oG6u
 3Cz/XGZl3iF8CwDknPAtugGIMxjHS18R5aWUPakkGehHJuT6xvpCV+hgG45OaINPZL1RxVproZZ
 kSqCUJjn7iYiY7NZ75nLdTrs4I440imfIayMkWs1bTmxDvC0Sx3Vce0GkXfviUvm5drL7NikKIH
 jYh7xpQR5/72uR0uAKyM=
X-Received: by 2002:a17:903:380d:b0:26d:e984:8157 with SMTP id
 d9443c01a7336-29027356ab2mr2558655ad.8.1759852138919; 
 Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ZCImmibY0972JM+a8fYWB0e9M38UidJwDrKMxNtcuWsc6T7jqjdPGj4BSor+hsjb20euiQ==
X-Received: by 2002:a17:903:380d:b0:26d:e984:8157 with SMTP id
 d9443c01a7336-29027356ab2mr2558395ad.8.1759852138513; 
 Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1260f0sm170476465ad.46.2025.10.07.08.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
Message-ID: <120c0040-2bfc-4c88-bbe8-2a56e824493a@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:48:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Include signal.h in qaic_control.c
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BaH_y8WUVGpKaX1cfGjnWFbISEo9w1im
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5366c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=2vv6iFeKVT2olVQFumUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: BaH_y8WUVGpKaX1cfGjnWFbISEo9w1im
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX6CF5niDNz1Zc
 XoiMdeCSJ2pxDad3EAZtCaylC/DHd1TC/c3T/MqSsk+TeZ/sXU1Mx7jedlP7YA8KgZX6+Kf6Fn7
 bHpABhV7CjhJ1rkoxdlxvpUHsCCcKob1kx83Nzzc47jVP2WDOv77p1MRePFRxX6ZGnS7up6y5T0
 ImeluHDkXAlLaifvZR1O0tFt6nDKgihuiI2Np+1uTOdnfbLQ9+qBk5l7d/hSzE4op06eVf5Ia5I
 9RHUSmD3hFygg1iAS98r2lC85kGJ7vOs0h7kHNvFxJz/QOfbYB94bDj3vpeMiETj9cm4yege9e7
 nJs485rRuuIz88edv/CBkRwYx/nj4bsOhoKAvqEQZOAgVL61sTPVytBazx/Pe0Rf6OkvlyNrM6d
 DX1NgdVZY9oPsQwlGRuWPAZP7Z7uNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123
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

On 10/7/2025 9:45 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Include linux/sched/signal.h in qaic_control.c
> to avoid implicit inclusion of signal_pending().
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
