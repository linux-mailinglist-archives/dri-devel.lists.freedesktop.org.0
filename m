Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A491AAB7594
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E33B10E6FC;
	Wed, 14 May 2025 19:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lns3HHti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E8810E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:16:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJFSFD002724
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=minyAMejHL/JFJSA+xnqXanR
 0wPcS9nRnV+dThvhjwE=; b=Lns3HHtiVUtP/NGibWUj+J6urosA2DXc5wZXE29E
 WVsS8lufGfsD95s6JIg7kr4Q88QfY0i71mZO3BE2c8SLk8JHX4ey2BYJiIPPhbww
 t845x1xlxtpI102dL1j05C+927cduWGj/S4HLVV2KfsEQYEia0QCVYr5emZSBT9B
 BenrRNn0ROazfBZiHajZCUmPm7o7XCOk4eWkwpdllVtDginRxEd0EXVtyrkuWJ0o
 nhRkmuGlT9iym4iq5rggruV+YEknguQC1A5wQrawfcXMvF4XfX3NnYelfZtLCW7L
 XooLD23kpBlhYX4HdWtM496ctZGJA2jvjn1L5R2LILLY9g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpbtvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:16:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6899cccbdso3812146d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250175; x=1747854975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=minyAMejHL/JFJSA+xnqXanR0wPcS9nRnV+dThvhjwE=;
 b=sM3RgzXoVjvjUtxVbj4fBgAa7cehKC5Km+l8O3EqFgfDCUO1T2bCKEJ1K3boj6/TkN
 xx9/Jtn6romTXFUG3S3mkWsvT6DXOTezwkFmGfxZkO6B5KUSKm/5SgHOIQV3KKN2BCWN
 zeMP4FziNfzUfsurDXV4XlizFAa3q9eINTgMFoluIqi2XSGJ9vETPrM/WeXWZO+naiGI
 FrD6XuXSxquIbwv76fy5eiiIJw/PbXEHd2b4AW2iYbUUC9o/69/nIltiNmYHrTqy7otk
 luj/Lze2KsGTDDyK785KspH7LW/9n9rxOQhPw0YlfFbFo1bW1ox1zy6a4xidBQFnIHPK
 pGHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoNu5UqADzYrpkzk26RjaWaC67M4luJDeOXz5+kXv8P2HNcliBGvgn4LMyngjwM3GdTUhag+G0kkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoQZNVY2SjZTILrSiL1pvdrQFGlQVSODjxmiZcYw7c0ThEWeiq
 zkyZD8tkyERh4LG8Jb83yBgHV5k6iOBRVR1A5bNMwpdM825aGQzBJNY+TQXJeF+DBTrKzfoGDNa
 FSXCkSJKEKxDa66WlWfwcL16CAhIy1gx1fwUFUVRa7gAzYarYQ6XLCZckrGv4brHjb3c=
X-Gm-Gg: ASbGnct+vwftma+ZqmuHhPz1w8u5BqLINa5Xqy8A7XF5uVSCzb5IYBvEibFc0lrxcgs
 kG4vOS79TLfaiErAbVjE5MUFqMy/bO2fo5DyH+yHrastZRbO5pmE4w3R+67FxoMs8SdDPt2EnRz
 Aq/k/b434t++ML9fl9h9qCoTqopYovUjUGRHezKsMm5c2A3PF2oSkMD0XAhRnUOClNJCHNsQiN9
 kw2QmrSwV4rIKNy3f7WhcLIdgp1JKTM7rKfCovFj+0lqFJIhhsQtbkPXj1NcHU0sXoSJKhgu3DC
 FtlgFfuTw7lNa8UFHfRugCkMOtiAq6CeCHY8/mFRZM6RtkfxJFTEsWIUpfpQ1RoItDNRj6rHIaE
 =
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f896ed0844mr92863066d6.36.1747250172528; 
 Wed, 14 May 2025 12:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi4OASQm4gJGGxeccfV1ldsNxSDl4KQOG6jMf/3jYLWvcUhPLkhO6KcplkBwZ0Dv0kasxkIQ==
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f896ed0844mr92857286d6.36.1747250167947; 
 Wed, 14 May 2025 12:16:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64beae2sm2343713e87.161.2025.05.14.12.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:16:07 -0700 (PDT)
Date: Wed, 14 May 2025 22:16:05 +0300
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
Subject: Re: [PATCH RFT v2 05/15] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <bkcbfzkgypyghmugpg2lopxyp2wfsogrclaqxfwrflcceimj3l@lhv3dv6mfrw6>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: WHJQthjrDqAIq66fQLtJLDtQ7vo5VDu9
X-Proofpoint-ORIG-GUID: WHJQthjrDqAIq66fQLtJLDtQ7vo5VDu9
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824ec00 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX0/a16pifRNXK
 S7CLy+3OFC35NVTR+4ehtzK0eZbIu45u93ngp7rvQApQKsGfWD4pHfWmsa2YIS/nkmRRHpD83H1
 MKYUsGbJ8iRz0V9Gc8H8wZohmephbiu3F484F394B0FTglTp1Hb75NPMc8/4a1FkEFxGKe0ViUx
 vIsw8kQrAl8A8vGAMvd0XKt9kMU0V8xkwRCF7M/kHT52Ghsh/FQlNptR9jG4a/tYgTC7Mx/x9l3
 xxfmjrDlckV8hC8QicQNSQNnuyKIjNPI3ZOzKX/gSMqAkaHj+/0iEi9hAa/iDxVOoIvX/UasjP9
 zZjLm9XGVEgKX67QNVE0Voo4CgNdzLY1omYMZd/900qaqjNvtMGCjWAdE60lFs3oTQwlXc17Uj4
 XkjKTguCrWJjdHrh7enH0Ux5wkPU+8GPcK/CXHm22tYWN9dgT1vzbDNAUCQF4QZM7QVoYHPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=851 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:25PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
