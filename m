Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F08BABBDE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F64510E28B;
	Tue, 30 Sep 2025 07:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTnzXzJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B53810E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:05:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hftv027551
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YkcyM04R0DD+Qr3GHQ8OUnac
 Su7NvjdL0Knj9f30K/M=; b=iTnzXzJCCeI4G/IXM3iCA+u1U+kUCgpTbDDW0j9i
 SJOj5h9+3BBYuyoaVL1NretVK72heIAARIz51/FwbeZ/ZuAPpsj7EtkDeSN2FN8K
 ovbqZYPQ1C2V16I6gZ8kPRaiCcSe7qdWBCr2bXXVcT+iMfYP5zbLA2kgKoqzfJdg
 Qg0jmvNIqTjE/pAjEB6xZBHOndn8L0Zv3F9m7dx79YQ6K2mDJGNZTZa+AXRhD9zw
 r0EHNJ8bJvzKGyIi40foXUD4B1EdWSQHU+xSs0DSFqziVw6HE15k+h4DPaoe8x4u
 lVP2BKMTF34+zeRtgF3xcOCeEdvj+uEGgeyUv5DljuYhTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fwnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:05:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4de2c597a6eso129902261cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759215947; x=1759820747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkcyM04R0DD+Qr3GHQ8OUnacSu7NvjdL0Knj9f30K/M=;
 b=ahWVloG/lMCGMYveogrkVBnU9Z0wIiXvKm3V04zZi7hb1z7GUPckyum0HTDbilzPwy
 XDIBsjxGgcahe6+YzrfCHgHW7CVhtiyEym7k2npbA37XKL10WcCC7Ab6vl9tEdZ69RyS
 SQ4xcpVWaYSLJ19BztEgqyU1SCkx4nYPfSjBlcEZrBb0ebk3HU1CZ5eklfphhp15gy2m
 qvipxEY1rMaUAVyex1XOL5qaJVce+MsbhEv359SSsvWiUlz4P06eRCLz9VOQzmu3eD3V
 YRG/gYuYw5lVhsv8tEpXytPfwuddMfQTA5kt46pAIUK9B1D69Vo6f8qFvlDuL3mcowSz
 Y/aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPa0wvfDKAINMHVRuHkXNZxkQvMmTFaEt9PKMgu97m6NLRN0EG8IsFl6DFXKjxzm9lhomYR/CNK9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzmECEQeSXrsSmTndeKndLaJE36IlihEPHH02f9GeEK8JOA6V9
 7woR+9HHtnLf5RU3vK2tDvOHhzkQFp8Fklk53b4dI8aUa6PTo57oMzs/LO/xWfHK3EYD+Ab5ABh
 wso4FxPBvi2AA3LqOOQDN+/2FpWtEs42PKH+tIQr3M3SgaJqimEyJp1wm+j0+tYQSkT43SOY=
X-Gm-Gg: ASbGnct0jDoTGBjc201nLBqH2Kwp3Cq3Ra/NAdk21oYVTuMwubS0IOSAD8F82Vb8KVv
 9RYQW5+4MlshN+MsaDgcTGEbohyeFptJ/K91e4h66UANz8VvrxkhiunBM+GIRPVoKVB4XyH9orb
 vNU7ffMBLIJFX99yd11Mb1cssHz+DFudMq/3NP1NeKIDY+/wRHOuZkO4JQm+/JxpU85IvPMEDnt
 u54CIyFZ8rvVRzQZVV1RT0CPGy71WmAqon7q0XsmZuOZRvJJvx/oxJfqn284/XpEXGoZRIPqYrW
 xIWBnWsLS16AQK5NIVXxo11hNINaEBxG9lDoG9sjuJM+f+zlF6BNVkI4TVb7f1/x2CV8mbwvimf
 b4TbOioi6qtS/hud28e7QNCbWbW/oK5NLvLqRXpUXvte7rusfjyBP8ugIYg==
X-Received: by 2002:ac8:7602:0:b0:4dc:d94f:d13f with SMTP id
 d75a77b69052e-4dcd94fd62cmr145860281cf.72.1759215947139; 
 Tue, 30 Sep 2025 00:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6np5FgFR3yiAoIV4w+0+a5+/kCzcX9eD5vqs8OqsXllqsDXGgjrxwAtZPkSL/3P7NcRUnlQ==
X-Received: by 2002:ac8:7602:0:b0:4dc:d94f:d13f with SMTP id
 d75a77b69052e-4dcd94fd62cmr145860071cf.72.1759215946624; 
 Tue, 30 Sep 2025 00:05:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-587748b15d2sm1648013e87.7.2025.09.30.00.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:05:45 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:05:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db814c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ffTnwjXrKXMzwz1Z5d8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX0D5SZfQiEWI2
 zGRX4x6v5rjCbUxh4bN+LRPR6/y6ddz44KNhbBYUw9KIyfzZ9RUqcwsYfnCH3DeSzqVsoAVb4sR
 F7Pe5qUk/G4CxWhxEFjtUY+HzpY6RZ2hF5YWbDvQHmZ9SSVtPbApcwbL7d3UKQ2En886XCaevrc
 x0ouMTLgX2iEsBAKYZQfRmE/GUcVkM/0JFQNKITq34rlnu3Vl9TQBQDuOqPA1A3rIkmtNJMiHzP
 YJwzXH9hLbSSUXv+mqkQPPg1WdHSXiwi7wqfcsbmRr+7YCFGX0ItQpnl88u/HgFSft9gjqAyJZu
 POOZ9u/N+PknuGMw9GT9fMfz4E9vmMKIqzHJ6brBPyvDmmBXuwHMbg+Sr1wnTWFKnZcgfUT29Wr
 4bRcDE8dnXXpZBfpT72DWCq9lCI/bQ==
X-Proofpoint-ORIG-GUID: OAdj62TQJXLDPylxlyrW6vG0W8xHNq1a
X-Proofpoint-GUID: OAdj62TQJXLDPylxlyrW6vG0W8xHNq1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> PIPE enum definitions are backward compatible. So move its definition
> to adreno_common.xml.

What do you mean here by 'backward compatible'. Are they going to be
used on a6xx? a5xx? If not, then why do we need to move them?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
>  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
>  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
>  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
>  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
>  7 files changed, 617 insertions(+), 613 deletions(-)
> 

-- 
With best wishes
Dmitry
