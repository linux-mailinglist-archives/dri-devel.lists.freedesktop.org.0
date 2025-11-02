Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B177C29689
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 21:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F9810E06E;
	Sun,  2 Nov 2025 20:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhgEr3rr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4waqvJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3210410E06E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 20:34:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2GfggB614943
 for <dri-devel@lists.freedesktop.org>; Sun, 2 Nov 2025 20:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=V0zYBSXV1Wbg4ICGuc9vdNuB
 b2yaOaIQEkc4Ki3XvtI=; b=XhgEr3rrjGfOuQ7J0vfAD6Ig5+P65q7kiNW3VD1x
 KF35EfjXmuNk+bdd5Be/km3q4s0LIcnlDoE6oYP9r2pMtZZ4N0JPtLLTdJBUUUne
 TUPZTV6S2gW7v6iUhcvW6ZMVA3IEXbJP0iMqPQWlPu94T8goer/L3K1BZcRatq7c
 RLzG7mQyYcSzELOB6hJtxXBWhD+rxXPI2IOcVSfC9ZzTAk7CWJpdQbZcFcU2cs93
 LlaZm17CYn9hTaZCVa/5pZC0h1CRhqYaaxYWNNgzvCNpPticmfW4YrLN4tQAJdGV
 b5vLpp7S0Wbq59HAj4VNxT2judjMReVlHKiKfLeaqaAqZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bg9jhkq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 20:34:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e89f4a502cso123588281cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 12:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762115691; x=1762720491;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V0zYBSXV1Wbg4ICGuc9vdNuBb2yaOaIQEkc4Ki3XvtI=;
 b=N4waqvJdGKg1VyYChspid5cuO3TjGUMlPd92yrb9K6GUI3GhPQcI0MmZL1ClSZ6eiv
 V1ArJB546Zh8WYNPBVSqGDVO+7DCMHhlH0CBp1Lf3oTD5qr+Mni1/D6QgYqD9Z/2Aulh
 E8pYZoRrkjWp4aOsA1CYBSg763VBYkIsCfOUtYLiwKEY/R5oInb57ITsWNa98USlfTys
 3OhEhXKInBgkpKygWsN6+VmoP0YApXxuySg/3SUYuPwvujqmUsMdwhpFakUZk6biLyMN
 EWk/55i2zCCf4jNcDSp9mpMrUAZRG58gDfxX+Ej/fqVZDda8YbhAM/vqr5mW9jfRhIw+
 DRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762115691; x=1762720491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0zYBSXV1Wbg4ICGuc9vdNuBb2yaOaIQEkc4Ki3XvtI=;
 b=SXl0ialuFkbe8NjLjhsvJerLBZARyb9othjatzMZDjXOGhNES4HImgX/2eoBAfC3Il
 fMNHRHVOrC2VpNJxcxNXjBrXNIPaWgKueBFvqOwM9HVtb8mL1YWAxjP0LDoT7QTrJ/1/
 G9Z/mXGPLPtOAnhzIYUM573dg3oDrdj7Bc+22M4AmKEoptUh91DqAsrfvN8JniBHIiPd
 mCuITwk4lElyltGcxLur1dnVgRh4HPU1OCmOaPL/SK6qzqwfnH+NBcSjpB4RpoM2Q3mj
 YTWc6mnDarinAPoKxjGZU8KZ5Aks/BGGuWclo0BxgEFqLGhLh/ErulaJubdyfKZURW2W
 rqBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfefAX4rLSnrZn1QgDTqnjCVZxJj8PC3BCnzPh/0sBx6yeXxkzgQzg/iHby5PArNyMzvQGKgCDSz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx73U1dcK33j0Gsw7Q1Ze8+Ln/2yP3ZYw6a2s6dEm0sb+Y1hd6J
 ChShnxJv5L8DLMeAZhAvF3MfsOSPB4ljUbThHSBjMzTQVC5/BAxZt1sOXGLBk1IKndmSe+p/Mqn
 lN12n8jvTxX15lXz5Tv4BvIdOxlK+z4dpHYk+9XlsKUfAMuE9yVDJ/c223lD4Z2qquqZfrn0=
X-Gm-Gg: ASbGncst+3KP/QIufl+00gVPc1g6F8lDRze3ejyExAsnTxj8Cdxn9RL1MCseNOK8ayv
 R5A5JEzTqlvOfU0kpRe2f08XkAzCq7NzqdreX8NeNtxEfdDl/UYviIw3Z8GQ1mg67lVuZQ5WJch
 wY5+xp+z9y6ES4NhYpU0KrnscHbgvAezg1c6gQxR+FwL8HDazO9SxSFSV9TMEEcS0+9iWv1JzY7
 CPZPBXhOI+hnIEmxnpSQvhBKnU5IUfruU32X7q/NGXulYrb4drEmlkKRrwR2B5ZdfIcODXDeWFG
 yLjPyEkbLFJKJkEPipm4MIpPw7HHC3NAT1HjY3XDGTVIU6nA8u69QSyI1ov5Bl88WtwUmVMjXf5
 z3pFIFKmdkp6LgQ55dH4F/3mCIOEOAo3AZsEKW34m+6cLYH/g4OxBARLnqgNOEzQhM8A3dJkEjE
 arLHcHl1AjhFqb
X-Received: by 2002:ac8:5f94:0:b0:4e8:b2df:fe1f with SMTP id
 d75a77b69052e-4ed30df33aemr149576681cf.28.1762115691139; 
 Sun, 02 Nov 2025 12:34:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYpwKRMbJOanwKK0p/tiAo/hMX92pwn4wJIyK+wbQmMbP7tOcp7BMR6Opqokznp0/88XtYqg==
X-Received: by 2002:ac8:5f94:0:b0:4e8:b2df:fe1f with SMTP id
 d75a77b69052e-4ed30df33aemr149576471cf.28.1762115690706; 
 Sun, 02 Nov 2025 12:34:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5941f5bc07fsm2295200e87.89.2025.11.02.12.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 12:34:49 -0800 (PST)
Date: Sun, 2 Nov 2025 22:34:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/bridge: simple: add the Parade PS185HDM
 DP-to-HDMI bridge
Message-ID: <76xhcyzdaka3fuocrr7nz3b4gsyqlgeloellp25t4cidy27yqz@hjqyp6k5ap57>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-2-9fd4eb9935e8@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-asus_usbc_dp-v1-2-9fd4eb9935e8@hotmail.com>
X-Proofpoint-ORIG-GUID: E0p-Hi1k8UgjvBCeTXAa2LDSXnNxrwQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE5MCBTYWx0ZWRfX9OOPgvybZr14
 5HqiGztYYRNsE3Y7Dhx30JqV8s1Poouq5UR5//VA4M+s4742ma57+/0B14uZaTWHkS2pPntB6+Q
 kuxLsprJZD+rJRmDwO3gLwc79SNuDmeMhkAhduyXiNxCYr5NinJVry29PWvn/HZNSCODzVoLUu+
 dWes2RGUO7v0zjrrdDBegRLbRmpvnabcD78OcEHV6cX5RkLaKCgE7o3ZJe/wZhqkJgU0VRDW+6d
 EskrLNK4yX8tmyx0ystoV/Sjwz/J/Wk/FzlYl7k0ALj4jQ5+sgZa/DySIsH73fmRo4NZoR68Odb
 gZR+5IvU5ua0Uslez9J3j2lUNC1ggjEpkCbsZVcLCI7ZXsDB1J9xq0lKzaEWkJmCs1wu6eYvNoB
 0Nn7ecaQWfEs9aJq1/1XLZ2OFFvCXA==
X-Proofpoint-GUID: E0p-Hi1k8UgjvBCeTXAa2LDSXnNxrwQ4
X-Authority-Analysis: v=2.4 cv=TaKbdBQh c=1 sm=1 tr=0 ts=6907c06c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=DjrArkTPs9SnCZ0heLIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020190
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

On Sat, Nov 01, 2025 at 01:54:13PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Parade PS185HDM is a transparent Displayport to HDMI bridge.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
