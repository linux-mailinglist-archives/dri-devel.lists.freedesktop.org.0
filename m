Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D96BF1E40
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7E310E45E;
	Mon, 20 Oct 2025 14:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LguKjo3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBCC10E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:41:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCggtl029411
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qg9ULdyYWQ63BsHXvmOS7CMv5DWm/liIJzFBd+lW6JI=; b=LguKjo3ZS2Uw1z8T
 BPMLX+H+5HioCjQJSyJHU8oEkzdT8aUh64LRnDbpUnlQN6vanyctExcLqBaJom88
 fSXNC+fe/+feUMUSWXEcASgehOeBDBrFp4GBbMaHIZfUAja/BYG2bZlDvLEYpstH
 hhOKwHBrN/vttNhi7YGlWmschdmyPVKC1oxoQsgcj3aFqOAqEDkWZ9lo4kpncBV2
 bxGZ8M48Gb6owBL2bOfVQr5mHKwCve6m4i0ENArEuL5vg6CKpW0LfGTMlcXBA+iE
 +8weQNdd/nTIyY8W8ACRJOX155b8BiG7BuVkyjrHSZ+lykKFxPDQ4IYjvUohY3Tb
 Sd9ivQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfd1g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:41:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-28bd8b3fa67so43153325ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760971310; x=1761576110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qg9ULdyYWQ63BsHXvmOS7CMv5DWm/liIJzFBd+lW6JI=;
 b=vgMaohMLHLDYRZYllX27Hd46M8YS2TGSZEdge3bE2i45L0KHptXeMJYvHMGca2FDxf
 q8tM7laLHqtokq7loV52Xo4DHE8Dg6OU8TUSFaYOQMxfLOOgoy8klxUV6eKfPfLZ5Nii
 HO+MnAvzk04Ihl8pFZJr/9NQbtEMRWB5EZxwn4kc2hqmyRoiJIAQHRZyyvtrfIJrZjKr
 WPEeFDqd896E6FD3JKIzFvJRKFgBKImLjlURpQy6ZRg0eUuq0uCGNtQxvzNY/qNJjWWb
 n3JoMBhRBIIJ6eCMvq2FjLDGwbRCkOs6mA1rOYEfJqpiHBemoBVuHR2KSH0u/XBG2iIO
 N0Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwZzKguDaudBbfDsVnWnMg7f2iGMtPaIM2C3ZW4ht+5lcxS5V5pL0jdUVb8Rzx7gCwcD7pIA6vB2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh4lFS1aScdbFAj0kpjLiDnpiNnX6CxKSNIUR5YCYNoALyeF3+
 DU5V0Yv1DasUEFOMYfsHNQFVfxhKuCFmnnovEe0kMVqtb8VYIp7FYByV+wG+LGGNGV6tB6pD8PY
 vlaBOkil0YWpZxY7FAsMQpTkmsW2/xrBQ4zHdVwPUYmhDqGkulbJzEU142S+IxPgpgbFg3sY=
X-Gm-Gg: ASbGncu185RpPH08jVY0lyijWh2Wrigx1ukNtUirCdGjHjP4LXiLjZr/9YK/cXdVOur
 fSKSjE6Aib47VHWiTSXUPGI7/ljer44KZiGHsbUtr1cIIWXUnkrcBfWI0O2t61NSMd/e831jrra
 JS/S2bXV0VbKrQoAciiMOoM/ST1mVR0cb2VVNPvyTLXXQOvKZft5J9v5EgbQ7mb3di+LNH6SvLG
 r+QleeJokEnvGn1+zSAFXumYQXl8Q1BNdTsvsH4XT1FtSzYd908uI1Jzt9IIuTV2o2UmwG2CO0b
 U02kVdQ3rlNd9lyvve/Gk3JB2ELpYiI1vNUEUfdKUYA9xNClGbG4UOTNRxYpj7KpqRpXrhSvfpw
 jCHCjP0OkIz5YiM3k7157sMwsAVgIjmdaBG2aKXGqjVjhqzXlVi+W
X-Received: by 2002:a17:903:2306:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-290cb65b6camr199062885ad.49.1760971310056; 
 Mon, 20 Oct 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB1uBtO/Ne2RFHj2lbdXZ86nBjjvN++H34C7hdf1CMvAodD7l9c9ngO6OWEl5UBn8AGAE+Gg==
X-Received: by 2002:a17:903:2306:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-290cb65b6camr199062675ad.49.1760971309500; 
 Mon, 20 Oct 2025 07:41:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5ddf11a5sm8260811a91.3.2025.10.20.07.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:41:49 -0700 (PDT)
Message-ID: <dfcb0344-2c73-4dbf-8620-45dff85cbd1a@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 08:41:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9doXDa-6TUdWXHoVo4A6bExuxQTx5adP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4FHbMMjvtm2Q
 rbGjWhYclteqzDFTcGiyCAhaHlt6KXArMogHAbhKn7qzbj9D3RDzbsg10CPi3L/3jx98yBcNxb2
 vbNAeOPHKZ4Y07Yf4rYuOkHkJkIjgSbMiFFKNOqNGm4vneypoCvXRxRiDi5fr4ScogyNQa5w+Dm
 fvM3cXUVZfrEvI0/fBaH8vcgcFYBiJNVxAsdsSn0Oln2TSgO55z6TSWHzil6a7B/YgASQXk4jnZ
 YXHUkPHIaYSEQMilBYVPYC0lp+k+8eBE+EYWxUK2er2gftPffcNViIzTQf22T3MuWLMiAL0CxKt
 PyAGTQ/47N61/4ySMHBlklLgWNIwO8u/gwfaO8IR6vLe5PKHkVVZteztIqVdWAmD8ryifw+kAbd
 BH66tKm+6v5nlRBrY5Ikb+mLP9Vnjw==
X-Proofpoint-GUID: 9doXDa-6TUdWXHoVo4A6bExuxQTx5adP
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f64a2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-G_G9_dvTckeGbZ_RL8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
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

On 10/15/2025 9:37 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
