Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACFABAF2F
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781410E1EB;
	Sun, 18 May 2025 09:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GG+SyGfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8996C10E1EB
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:58:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4nu26011228
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ozyvimowPYeoJg2Gil0i1JAK
 q8UocZ/UUw/4kBdCVY0=; b=GG+SyGfcboPhTCPi7LA88aMspIO9T5QMS5DN85Sx
 EWB6WLs3EsETIgZ0FsfarrfPc6NZ2oq0XVVWUAv0jvxS/w1WE+hdxwQGjv3RhkrX
 IFbn6TKPL9HNeZ7Rs4uGf939/lM+POXUZW2ibYTZ098yLLLRCrxVkMP9gDqtI29l
 +Wo5DYzsem91sdvUcVAKGrid4PE6DcOQV8BpkxYn5DcehRdWrvwGJXZH2Bi1XNab
 FdF8+0WjWRTfg91RHeoHAbtklQ/yg1vnLEevk5snRpRKwpXPM4WD1pDWEMQSIVBl
 giSRRIWhkkkTLtFhp0YkAWuWGz07w7yGcVA6xOVtoydbgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4stne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:58:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c53e316734so681501485a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562309; x=1748167109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozyvimowPYeoJg2Gil0i1JAKq8UocZ/UUw/4kBdCVY0=;
 b=tqd8eC62FqeP/EwOqsb/lyVFo12A8Nrp6I0G3jFchVyNOqITlwCiqjY/ZvGwP98YJD
 fpFLiM55XPgypP6vyyGEr0lT7q1nqVDuv5hDbuLRUsCwnGEQFc8BRtRNpqDFRzFGDs00
 ffBGIY4ucDX4HOlUGBItzkfNa6V973N43KnhHH2CQ4dY/p1AZgOhPhQfEEIT+sDQYEu0
 /Gptc44qMV91gXio49VFFhojuJ6JYdlzdNSIeetWa+pD0JvW36a3FlQsfgtVO672FqCY
 P9+T5zvfnLEJzUcB/C/KFfHVDiO7yyH04ElKtnXCFJud/UweM2Xwo5zEU9vdDSbDuWG1
 LPJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrqWlAOsG7KE1FD2WCIsGxwUEZA1Sfl8Xn+jimDLcPu0/k1uicKeUKTefBgwr/WJuI1oQTT9kZ4Pg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYozZ+jMOrCgqPKWgbAP0w7W8GrJ2yOXNvn8mEN5Ri/80+IMru
 refJ6tWnjtxhkXi4QsupVpVUoKWSDGHJKLsuwSDx+UMSNyGMWBAevtMLZikz3I9oJ6K4EIc00TT
 upvaFWuGUJzJAs1cq1qW7fpxbN5K990dKMxWi7dmOOLT9iLsHyneGAc4Vgm4meZ+NuRtJHQo=
X-Gm-Gg: ASbGncttcRggiJ7/++XUp16Z9Kqwn0FIavFUU3D5uI6n3iFx5yOk9NAtiw20VthP6sM
 BVRfByIkqoOkRflQg3OAcwXYFpHw99xDzHKEYTgof98eZDx7Rm6ZySue4e4L8zs2hK1K8WnNPSt
 FfPXGBecA4xEtAgX3jos4hHO3+4U5o4Dh2GE0Zcjz+iWqsjTcMOYV0S3qe8eG8R3FETubkqtIB8
 K744bsvii8WeBpSOrbHXVanRumr6hY7pAzsNaLcYovNaVvjMu6dbYcTZELPP6k7EiwQA3c6wbhh
 VWLF4xhv5KamzMv/pBz4V5fw5YWg9GJ6Zgos555f2QQAzMACvK8cZLxgIYAd9b11kgXiVOUfFoE
 =
X-Received: by 2002:a05:620a:8017:b0:7ca:f454:8dff with SMTP id
 af79cd13be357-7cd4672da8amr1575055485a.18.1747562308995; 
 Sun, 18 May 2025 02:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzojClQz/Wnouf9iM34C8OJswOvQ1S2U6sryF3oPNsosWvXicZvKebvhLPbHpURtKz6Vy4eg==
X-Received: by 2002:a05:620a:8017:b0:7ca:f454:8dff with SMTP id
 af79cd13be357-7cd4672da8amr1575053585a.18.1747562308697; 
 Sun, 18 May 2025 02:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f2fc56sm1364685e87.64.2025.05.18.02.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:58:27 -0700 (PDT)
Date: Sun, 18 May 2025 12:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 12/14] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <jgf7izei3ry4wutplvgxkfqphxhrzx5ed7zh4u74mnfczahaq2@gnloying4et2>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-12-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-12-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829af54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jAo0UdJAClyBKZLzlD0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nWTW4boOyYc1YQIWOB2bcdaEpfiEibS4
X-Proofpoint-GUID: nWTW4boOyYc1YQIWOB2bcdaEpfiEibS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfX8FfRColMZlTq
 E7RPHwJEaca175Sn3RjQS7cHF5jIuUPzxLKbt1FrJ6MFLBlsVSd5ISa1EOHqlUSsAD0I/H3gv7Z
 Eh0qF6n/BJ8tW5u1qWBrZNjIgGmYpR/51amfYlWXAM5YgJ3yQdS6mxwVhDTva4U+q3Y/CTdQFaB
 /Y9itxFsDJQrVe8MrBILffp6FNOT5uVd/hNbbELeuD7hREzlND0nv5NgdIMCfbL4aQkkN50QjKR
 nIypCalT65AdwVjog9h9VpZyYTTNqPxw8RikBRulg1cvTbnkd4GRB67eUYaBOQ/XHCy0rp7sS0U
 zI1vmpDK1PZxIQsHojcH6B26MxCUc3vWsTwRP4xljMII8nJY8pMIjWXuhTmvII0/wOxiXPLH2qq
 +RIi/4Fzba/6rhqomy7UiINM9otBLKE8N0bRidnJnhn10+aSl8tcGiwXoPKB/zCm4SlFP8Xg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180094
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

On Sat, May 17, 2025 at 07:32:46PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make the values a bit more meaningful.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 37 +++++++++++++++++++++++++------------
>  include/linux/soc/qcom/ubwc.h  |  8 ++++----
>  2 files changed, 29 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
