Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E63B31509
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9FA10EAB0;
	Fri, 22 Aug 2025 10:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMmZqA57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0E710EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:18:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UP97030542
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ac+nVSgZhDM7Uis1Ey9g1tmw
 QUcK1Fk95dUsNGYgbrI=; b=HMmZqA575k8n3YhX6PcQxSn38iqvxUNcQb6kB9vG
 qJZnkJdCfkpgNlGOXYAvJ5cBZESzZbRy4T64X1vaeJ7tJ2/Y6Sq+JvTwAMf0x3kj
 R70nf+edQxTKO2Ah+pnqAymz5q7n0tW7m3ANPgxx5DTARJWzaNG2JuDoKot6DNgh
 pEPW3Q9r4o2aigN+atDqaeVbBilW9W3tiPIVVtswRH6feiuClNuUKotBx+YusC7K
 FgLB4ZlMt9hYxAstBTK/wdrCRIg/YGaSzHiT3A2901ygsc4deZ9SPHDmm7olcgDU
 deeE8APVcu4E/5ynu2PqqntlgmYiq1noPAeUfvnQrqIMBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdppw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:18:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d9f5bded7so4589246d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755857919; x=1756462719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ac+nVSgZhDM7Uis1Ey9g1tmwQUcK1Fk95dUsNGYgbrI=;
 b=bvPLJNJy8vnBPBWLXp7daahvnMCJXA9WjAPCmhJAycvnkSFtkFUeWobCRDeRsEWOyV
 6o2ntz4B4I+UEhbQUGYiAuEp+o6ESbx5zSCfPZiO/ZwvybeiA4M6fYmfqr5MX4OJ4jc4
 69RchblfvJCRaN4ktuOicw9kxR7xq6bnAY3dHj02w/iInTddrgdtVNITU3Cl0h0ECaHr
 tBZn/VawgSFxJtL7FSgotfnBi0XDcoJr+k1tDARoRAgYAG1gdXjOKCP8/5HuBr2ZDMFw
 /86RP2u5WXpYTy83vdZmDGmFINx8UN9ki4xQ29fj9Q6hLcgEo37VkSWwsxA26czgXAKM
 3H/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiTCxgkV2LIBQWXiO3pGYtUjuwZVwirnC6LDqYweM/DUOsUkuw/qOc8Rh/o2LEuWC9PrDNHAnwqkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBF3MCngBzWQzVf+vZ5Zg7pDb+oaHR+2pvlMXu3Ee3I8lK3Kl7
 8T94Vz++6n0yhgABVtwoNmDh7XKZsFCtYdcxT8BQ6xQthjX5OMDaX2Pg+YVTU1QEYwt8srT/owg
 tIQTZrKQX2PWcGEAPseDzAAhTCwMLKYfWjp+8up8L/K2LBfJ9a+D/DhpuGcJAyKfKDwMgjwU=
X-Gm-Gg: ASbGncsu/VobW7Hpj3D/i9azJNdoLO9ZglG0KmTrHNdzWEoKzXmtlasygk+/cE1G0sU
 BbkBTpf3FalJhMcIgFLEZAzxcv2U3xGAxIEoJt+oopHXxPJg3WbDk31Qio9OakvmN2BmRm28ZKT
 maa9t5wTy/JjFsnbK4I4FK4SuyZZwENTQxxmZa0yhMWt52rD6pVpFRfGEEcnLW/2Sgu64clxxXZ
 ChVo3ZmKM1vA+MhDwF8gfftWpS+k7K662JnVnnHQYNfsgxQBq3HEEhxjPppZmdKhSsQn5VkVAGG
 CQP1PzYP3aPRe2LoAwY3Uhh6eCWE8K36ZrBTRDfduVPP4hSAG7V9USwcY9K+Xvtxq+JoohPik5F
 n2SYvUhBKAshWAYHdGXX25OMHGRsXVyGNjv1JluRczCe5H3m0a4PM
X-Received: by 2002:a05:6214:c2d:b0:70d:6de2:50d6 with SMTP id
 6a1803df08f44-70d97213470mr26722556d6.67.1755857918749; 
 Fri, 22 Aug 2025 03:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErGePoMT5ywVRUZa2kbz8ENiaVTNjGMFIKjDHTl69Ij615Bvp3AsW1z97fsCHMLNb7j64twQ==
X-Received: by 2002:a05:6214:c2d:b0:70d:6de2:50d6 with SMTP id
 6a1803df08f44-70d97213470mr26722056d6.67.1755857918063; 
 Fri, 22 Aug 2025 03:18:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef4345d6sm3418726e87.150.2025.08.22.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:18:36 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:18:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <armnr2vplar2fppyxgkxeaywdlgjts3jmf3qmirwvyh5qb3bra@treg7qeqz4j4>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a84400 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=9lylJ45cP0l75vQ64wAA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hIw3Ofx06MiNjB_YuFPHX98Qhgm38NpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXwx7NRpPnKTWn
 xXGq1oLnufOVXnKDmNd6ohVvPJSjZRd0uJAm70KzGEUSqyypekqBPN+79UQWtu4m0HnjS5xuNG+
 iani29/mC755HcgX5KeuXpyS1pA1ovemLoRCbpB9zeNGjXBf/CJtl6zep2jzeaExI2A8lzhJzwa
 t+8m6WS37wQC/i9iYW5hXYqn/EYQhQNW9F0anZNMnn54Jsw+L0Fr0WelMhGgZ68vn2XU2AvgKNh
 nxjJRU1kZ9+WxqG37g0eezFDqQLUt4K7j6hq6i+Hm7IyP/8Od+V6GLBZQobrR5SpeOtTLlwAImK
 nbVBBumEShVWaJ2rPqdixBkYjYOQ8NmenU7TGooJdLQGHY66H6fWB0b1WPAv+qDcQDX0DjgAjV6
 61NdGeIlTj1rCSbDVowJ0trPMJz3qg==
X-Proofpoint-ORIG-GUID: hIw3Ofx06MiNjB_YuFPHX98Qhgm38NpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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

On Fri, Aug 22, 2025 at 12:36:47AM +0530, Akhil P Oommen wrote:
> On 8/22/2025 12:25 AM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Add gpu and gmu nodes for sa8775p chipset. As of now all
> > SKUs have the same GPU fmax, so there is no requirement of
> > speed bin support.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Dmitry,
> 
> FYI, I retained your R-b tag.

Sure

-- 
With best wishes
Dmitry
