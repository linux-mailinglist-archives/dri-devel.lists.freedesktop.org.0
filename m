Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F836AB7515
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D2410E638;
	Wed, 14 May 2025 19:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E464yPX2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769E10E638
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:05:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuo9u020356
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ywYtj0jJCUfwAnlUn+KfhCG1
 HPC+N0krcot5RSineC4=; b=E464yPX28jlgQe3n5SUSqJIb7FKLpRL3y3uvX299
 3aORlz1ybgZA3Up+TgQFUwiWZgEL+f4z/eurMb6+4iSN9WWtaUdiOvHeJOb9GcUZ
 T9hqBhHJ6SPe4OA457ZuEagma2U/HtpKpVuonLR86vH7EeixbF/0dnjiozkWLNEC
 sHy3LSjNnI0YfE1TuN5rbPWZ3DJLH3FKOFfB6gx44A/9SbD8Sstjf0IBadgAWU6e
 bbR+4RIhIYKZUgDO0LwarnTe8bN8beyymbSxYBtqxPXH5kdhZwkxsRfamEcpxjMt
 t9RKqnS1OVFszZUYO4N0FuiYT1Sn79SuaUHp1MH+odHrhA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnks5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:05:33 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3db6cf9ac11so2430065ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249533; x=1747854333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywYtj0jJCUfwAnlUn+KfhCG1HPC+N0krcot5RSineC4=;
 b=JPpokNuybwiPPkGJ2eKeBw8BTDPGFoIBinAKgWo8RYJV9YLWCbxQ/jbkqOT1LCxcte
 qhq8/bXH0e3kVcE7C5MYpCBXdeQ3B8MaEZgfBa31OY82qAuQjtBgrRuHDe8luskwmivt
 jLK1s3jaDo7Hgdu4umgfF5Hvx3lUmoHWqphfyvo4Wwk+924AQwlFx0vvorO15tW15KuV
 HEp4DvVOjERNojD81iCCnvlhe69aTafN6FIGdmmN98cZk6p2vguyywCxLXhaOZKeTYEC
 gDnwzGACkVdSQKEVdBCArLywMG/oh6xm9JcY6uNffJ7S6aHtv/5/FZx3jMYniIYxI3bm
 lhWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG2I79m/bjutwLY2+O605Eu0rRqFTAPpT8HMZ06rjnGf2WW+7NKSp/7I2W2f67RUnkI62NPceJgBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPEkNLZNdgfM4SjW1lnP53d9Eju3xoySw2a/0BsN9cTQ75hyl3
 zY5OuhEcQUYw3xpAwr2BuA8fImf24AiKb+EINECmU2dodNpAM32/4wvi22yuHyIZ4WDoUKmVwp0
 ZJ2aZAsgdP03jmqS8ufECsaRphiZA437pkuk57S+di42kc/vk7ryb8hCSPMBMq5k19Ao=
X-Gm-Gg: ASbGncuEW0ouIiOroaNnmBAGS74sOPJw6DNEwtDvnlPeDCWxGvKtNSa0lGU5Iwig/Vr
 ZDbG5tLoRyCz2bwId0vPqh1okYk8sCZIJ7XdZO1FNIK0c6BYqLf/misilSWsLsG7+bJHCWxQoL3
 DaNK2wuZdbp9bYMYr7G21URaHXj0n7Oms4sZSVwUx837ehin+i1SsMHQm4BglOVWM/uXTiF2SNT
 284qoxyaudiA/soo8vouVBoaM1bcUGA06fBu8XZ1N+NMoWRlDJ/UiKAq9Cda/fKlcM1jllNNBx7
 SX8K3g+43XbdY1/cpBUkiWRA4exaPNa3diXE2XLFdAJZ7/CpUziyt6RFqo53da8Jx9KR+vXfp8Y
 =
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3db6f7a5a65mr52467145ab.9.1747249532523; 
 Wed, 14 May 2025 12:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgYTQv4QXSnMN9YVJaEI3JUAXQjoi8ESN5pboKgw0mTBEWnrDUyYQEekWZqNeBYQdzQK0Khw==
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3db6f7a5a65mr52466645ab.9.1747249532072; 
 Wed, 14 May 2025 12:05:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6bbesm2340443e87.154.2025.05.14.12.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:05:31 -0700 (PDT)
Date: Wed, 14 May 2025 22:05:29 +0300
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
Subject: Re: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config database
Message-ID: <g654eiekiyqfjt65dtueowx4tqdg2tqs2xoik7xoun7dzz634f@ikftorfburay>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w-920i3rdLtqp_rRvDjZrsZuRfsZgTEq
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824e97d cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-GUID: w-920i3rdLtqp_rRvDjZrsZuRfsZgTEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX17CDfKQ9DnVG
 SllT7IgTJ9H+khVDRP0bArV8cMTf9zNbzndhXRqZkDA2ankdRFiv6AZ5eg19EKwsH+Fz0jnv1fE
 p0ncVyw+5qYi8tH+bPNVqWtjsU0ixY+JfQzWcAh/x63Cl+HAH5o4DT/1jmR27dSqxnGoWzHisyo
 vSvMJV7tq3xo4NjekSJdsb5vJw3C3BA4TNWVCKWXZcGL6FNWR9ZJ9wRkfXzDIz26DhYLbpm+kKB
 fhRCIYBuyLhECpJSQFZq+tjsWB4Lh9m6o2JQg/HBLpPcE0u3pyhlZ508vCS9pDtOUXSmTcuDN5N
 dyIwpbOEY+hQMpzTnCK2O2iF8AJkj7ldlctZIjh5cxvXhVzgFhJCq9SXFPyQf7Y2v6wOJVPd+HS
 EKODZ5hADMbPcWsqc7FvbhijFv2p2IRLLfu4gpA/fbA6/CsmmSiEX83vz3+mr6wF24VNk3a3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140173
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

On Wed, May 14, 2025 at 05:10:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
