Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A03AD21A0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD2D10E3FC;
	Mon,  9 Jun 2025 15:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvYQepXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FAB10E3FC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:01:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995vx9026990
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 15:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eeZOilRRCfOoW7ivyBUSV/3B
 oCRgS1D3Yx7wgvq5hHw=; b=lvYQepXI4nKWo2BFshP/lyWx27i3MIHxl5bxwxfq
 REhRIDK6coQmM/cQT9WPUnEZhgiMF9KnoyM9CQiF4p7lX2QlNwm/ys9HgZXpmUPy
 Ibc/uJU0BJUlFSIBQ/G0URsv83Q+IdbrCvWbNmkF1Rhw9CKRgZ0N3e/Bpluz7P/1
 G/tMK4v8CtKr3qkMvJiShjbuClv6cRtYVa4QJupiv48Yiolh2wMgQt+U3GNPznEa
 V6qSeMvSZGtD/31/B/pt+gDkBZZB63eR8daTXFhA3YJpMaXv+zXgwcSRyIA/eONV
 iZXCYuDg2PjvVpKunDpKjlRRkgv/ajflrz10sirbfr47oA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66a4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:01:37 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-60d3f6ca90eso3261407eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749481296; x=1750086096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eeZOilRRCfOoW7ivyBUSV/3BoCRgS1D3Yx7wgvq5hHw=;
 b=fPAlSrgjLV2Brvd1oF/dV+55iKlQnUYpVDyvqpv8iodFSMZki248iUoofRayXimiow
 GPdvwda7unPi7GYxgfaO1dWR4/sPGe6IbMTQt54/bOTMa/r3pv5IFT/KD7OBjdQENl5D
 KJJgaJInLKzgdnpKMEoge4HosiAflhj0wAyWaRnMxEnQr3xpTq2HrwZhs78hWQTn0f44
 eMtzBhOkFpC/99m3exGPdm3aIsztz+aF7guY1r59dlgY3bhSXF1k3aEuyvIxW4Hx2LNi
 4XzJ6A1e/uyUEjITvLXZQY98ib4TbwiJEFi39iN9uA5/cxifzbP4dVXhEz7Q8XB09CPx
 tDXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXr/u5KJFFr4oPr1Ws4TGIpHt4uHM3OX7c4BrKK8Kl5inviRd2rix7i8+yuvdTp9c4TwJduOFKouo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy7IF54QsKOPDFWnLUteTuo+7JYeV4rQvRqrPAjs90tdsWJ22S
 BXcT6EugM1QIv81E6/Tsla7/TKc1JV3D732NMokFzWghjPXm/d4rea25194Kdscs1JAGyfbdtPu
 jmm7jOcODo2mcQBoZGiMagSmiqZF4/eP9fzjiELNupWFIA3Eb3MTlAOZDQTVoaPwu+QES874=
X-Gm-Gg: ASbGnctZ3o8nguMOPFPiZlg7K2ETt5ykOngYjcqraZBqeEwEX4+j6U0O+Kt5kMqcYcx
 PeLzov64pMgn/NtX+f/xzdLRoEDX/qm5g46uG6vECu3kx5qv8lXsFIb3DL4eEtCpKu68MNoIqkH
 I0M2H53i9XYnZuY0QCw6m4dGgGGCUJctIR/CuzFhMCgVyvexMt4JImxxXk8ufRvnsPu5j4MXaxM
 8av18hFnJqRf9kBuYkP9qqq6xDgEHxOzaaxPqYbsWLHW6M+SexRML7GCaDaeGXDq9wRVISYko6l
 PxuGIrrodJ5353/Rh61fBPHeXQbPzYre6OxEEq1qk6LTuMcWYzbq38gN1X8QjfbvucY8UBHF+ZU
 =
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id
 006d021491bc7-60f3cf05b30mr7498268eaf.4.1749481296114; 
 Mon, 09 Jun 2025 08:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Fi8e/8Pp5oI9faNSYkOSpVjhnJdV9bwjYCbtPXM4Szgyw5KA89jfNLN1bkno5QUfOc4AOg==
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id
 006d021491bc7-60f3cf05b30mr7498206eaf.4.1749481295529; 
 Mon, 09 Jun 2025 08:01:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677385desm1186686e87.251.2025.06.09.08.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:01:33 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:01:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 30/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <arfmbusro2nh7axnyqn26v4rjwfmop4q4oxu45ad76jubijnbn@3twddambhtum>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMSBTYWx0ZWRfX8CTIlSS7etAI
 kXg71iNF6rCSjCYnBoxV6QZ5HSyCY1dL6799mizw5huMlKi9rUQIabqUVcCViQRG1AIEu4rhB1N
 OtrFCfnIUNqogCIK92MHvWNjQup2RgiNqpl0NBe4FDR1matvNCGzWGbwQGcPbDGf7z2dyhkis8j
 4PuDY/sSKlmVd504mvbnZIJ+po5kt3m+vziBGxeAOXdKDX8i5wLVAg8kpNFjHeXPvfmbW68lqj5
 hkI2vD4g8eIjeS72EUEPsB7B59APC1HwQyjV37JioM6495pzgnlflLRFpd/EMqaQ+Bs6zxWpjRR
 lhUcAjwUGSX3BsH8qHSAxDQYnlJKM57IXlLEXN0+1FZF2K0kRDh2aVy7uE5NYWyoTMwGmSX21hp
 tSz5uRKjbmMq0aR9iUtun4woEU3otN9ApAkhoxbY5i/IMYRwqx7MXQZCawlD8h7rXtcZdylM
X-Proofpoint-GUID: MkFRPKTjT9cEKXbIs28e0HozO856N0_p
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6846f751 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=kZwT76mLgBx3J5xcvQgA:9 a=CjuIK1q_8ugA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MkFRPKTjT9cEKXbIs28e0HozO856N0_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=790 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090111
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

On Mon, Jun 09, 2025 at 08:21:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing SoB

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++

-- 
With best wishes
Dmitry
