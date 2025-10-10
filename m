Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B4BCE168
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 19:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821810EC60;
	Fri, 10 Oct 2025 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLdLx7Xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5595E10EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:30:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFRS3P024975
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ATXrLGPewk+USu4WH2tPmXTpI3iF7n/KZMdGkOVu4WY=; b=iLdLx7Xfko/0GgWa
 hbPzFA1YEUyGGpWqBgTsZYy7efzDlklzJJDrDRQ3e5AI4TCr+7RK8nF3S/IC01wG
 X+tvOzVklpiyOdaLJj1WRX6C2C+2RhOSWdZ2GU0i9I2aR4KhuJwLcD3/HGzPunLc
 1qHNDnxOEuM+vgPZtHh+sj205MMZ65m0r5h0J1BCd61SaSk/0+5KNK8CLb+pbD8C
 ttBfrI5LjG/tva5xb/94+AhEoeFAj+8lkemNN8S3eqtpvcaqVBWYN5in7kCsA8Hy
 KpbWabNKwKJZtcvMOB+qpbBm3iRFyBEKZsj0gl+mnQHuKhC2X0UT91XTp7BD3+HT
 Q6l+yQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ky7n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:30:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5d5e5b2df67so371550137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760117408; x=1760722208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATXrLGPewk+USu4WH2tPmXTpI3iF7n/KZMdGkOVu4WY=;
 b=SWRmQCRnEmvqhir+W4/EZtX8VacIupCUh/XUQyhg+qMRO5ZpznzlHX35fyOK8+AUAx
 XuesgJL2WrAV0vL7QbuiTYA86/MyB11HTM+jA2g+Zjbz4IibVAzH2vp8/cEmvttgWg6K
 YCYnPRxSZYM8mFHfKO5fppIAXnSqkFB/xX0dVQTwu0mXODaQzSHhbdNw0rXDR8eqNl/p
 p2Lk/wVovjZTWwEKP8EzdKP/sdZYN6V3IMW4WDM3XMMe+6H22M6nUr28OWON1s2J9zEr
 jQWB6fxpPebF6VC8J2TIHlrkU8mYW/DByO+aPIwrEMbIHUj1PycvMfAM79bVGA0fb/V8
 DCGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrwmofRfZV4jVZ9Y4UCSQsJDNaYQbCDfvxODtHL9460XJOKr5GEpM+jDFQaaJSgJce/i7uRtX3vU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZUx7vRt7qgZHpEmhIT/cAe5vXMUiW9H4IGWk9rY0qewI4FDRF
 FMLgA+i3Z3mde5UZtjzMjpoE+r8vNDFQZoJwPvC+5K4bD8OkiFj/gCyOryYt3SkPLw/Xl7sfiY0
 flOXcbzx/XlZ8Lq8mOEyGKVVPZxYWnDSjIU9yTy1oyR5Si3FaM1i0QZOYWYQigKqqqO/RZdE=
X-Gm-Gg: ASbGncv7W4g6aDwH5Cpy9sKCljlRz47tNeSamqhWSa/rsiJtuIjcDn/n8ocUmwGS2cp
 JPhIxcsT2fxb4RBGzZqDa4nhoWrK1PPA7/sfjqgv0Dfs5I7qM0on/FT2kcuoA+eAPuJaikzhdow
 ix+DyTlaI2w6kRRm8okrNmQesnQen9ULkCHO/yjdd55+QM+xb9qu+Mq4I4XdUUgeR0WjYrjb4Io
 fYb55oYHTRIceeS5/+3rAg+9iAgHq0wLjJSgF+XWs8Z5p6+IP8JNovEXKYgdIFvxqA33NArToNL
 WsZbWndG42+oPxizEvP7Nh1lZuXXLRjSzvirhtaoGNVIFZSpyuXBRt/+uuOPh4Nq+ezerUO3Dp4
 ucFfljEXO23EFRtIYGrISmg==
X-Received: by 2002:a05:6122:e0cf:b0:554:b341:2764 with SMTP id
 71dfb90a1353d-554b890a550mr1451429e0c.0.1760117408374; 
 Fri, 10 Oct 2025 10:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHD0hhK6b4JamkLYHPshkWQ8JHKI3MVUIkzRHAZmhbAXRpyPdpO2PcbsweVGgxi06rXqhX5g==
X-Received: by 2002:a05:6122:e0cf:b0:554:b341:2764 with SMTP id
 71dfb90a1353d-554b890a550mr1451416e0c.0.1760117407888; 
 Fri, 10 Oct 2025 10:30:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321341sm2786754a12.38.2025.10.10.10.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 10:30:06 -0700 (PDT)
Message-ID: <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 19:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9urYAE8nmyyz
 FPSrrkwZsZUTohDDLdybcquKyVZmiCHTEu1Z+WqZMxtU8p3KRw2RXU6WY/7WahIZV8XtS3Gviwi
 zWpgZOgctdQXw8ML99B4B+3q456urxcFg120kycOW3pM45ZjMOQeVeiHCJrrBNvVC8n3FmE5bAl
 y0EsME2e9w6Ac7IdKmNpjyefd4YfMQ/Nu4PZfBgfGsUKUhF/littIxlr7wpOeJW+jkjwN1YeihG
 +sY6xtHjocSmzafxLipSLbLN3GzYNf1wohP0Dgy7wR5pX5fiVBQ2weBD8hyFF6QMjDfF+UohM0e
 YuoRqvMKix6mOsV1uQg78rpQo9SyKsZo5LOGOvV99SFQ+6ZwBVHF1UJ0A3Qcpa4QaK5tD2lI/xv
 uSXVRO9PF8aVI1EGTE0uYB7jwwq5aw==
X-Proofpoint-GUID: 2TOj6Up0VM_yx_2O-KzSkXrv5BaYHZiU
X-Proofpoint-ORIG-GUID: 2TOj6Up0VM_yx_2O-KzSkXrv5BaYHZiU
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e942a1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=XV8jktkr_dr238JMAFQA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
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

On 10/10/25 4:39 PM, Anna Maniscalco wrote:
> Update last_fence in the vm-bind path instead of kernel managed path.
> 
> last_fence is used to wait for work to finish in vm_bind contexts but not
> used for kernel managed contexts.
> 
> This fixes a bug where last_fence is not waited on context close leading
> to faults as resources are freed while in use.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> ---
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Your sign-off will be removed by git, as it appears below the '---' line

Konrad
