Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C8B31682
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEE610EACD;
	Fri, 22 Aug 2025 11:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiaUG0Bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7393C10EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UOFP003669
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KAhSD2vjv/ePHUmD+gzyEEp4
 2L2WxYKoMwQm05Sn2Yc=; b=OiaUG0Btg4yL0nRWgSNlhwZClARkvbc61cx7zd60
 ACHg8wc7y11jD3eOM/32pUXH+TVk8km+31XcXZjI9FSulMPjp+t2vo5CuE1EPTc/
 XJVsEUCoRTaafNgdnv/eSPRvzLpVkMczXOoMoj4hZARV8yJOGV/AZL8F63otkVpA
 z0DppPkqHX413v8iMPvxF2ZqVDGWZ9nwDGzC1E5Zm20V4bz8r113YK4RrDj7VChB
 jpte2SnZs5FytqPkJObC0CkPcLRz30JurOImTJv4Bz0bwS2OcshjVku77l+H8s5s
 RXbqlJ4FYde8yKvsJ7zOnzJCullQPwo+FJdEU03xA+rPDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52990rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109bc5ecaso57460541cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 04:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862947; x=1756467747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAhSD2vjv/ePHUmD+gzyEEp42L2WxYKoMwQm05Sn2Yc=;
 b=FkMkZdsOkGRUSz/HNik+CLY/IWYWjM92cEExYq30lNb+9pUoUhICqjS98D2zxU/xxU
 RmaPdYx1olxnGkrvjqq5VylUW5KHzzeHf4WGqniCuW+NZKta8OaqYTAPqRU+JIkZOyMc
 kWoi/VVOD2PUKWNrCDVnIqWvlotZmiYzBLXRXPWREFYI45nyJ4rdGHX0Srp/Uzf7Ajuu
 J3EMTNl7VP9HYGB5aQwAMOE3s4Hea7JRKXzhdaminewJSf57xhAkfoeK5OuT1A649Uhr
 x+yevRz6QS2w/XCfAjbBunjg674+N60UIhE3YLlvVjzU0q1ywwBif+PLWsEtEblXEjx7
 RL5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO9WJbhJdl1qrExg/aLKK5zLVoe2QIbSnMW128hvWYOAoSmc0j4pHU/I+h+xtVY33EmGdd0A6puWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3dSbopWB5xF64o/RpLBI037sSLoNpGUR/uaf8LyDKmKYV0GcT
 gHIhYSdgCk5/J1Qg2BLx/e0MZ2CbZrl/RQa/9XJRBwfkBzYm3fvPIgHRtJ5udn/v6m9LkcqWG0F
 ZmeM/cfFjytswXMn3nbJwHvmdvphcAIsnpja5FZyWh/NzporS6e317YcY9D3dyGZkcQkjUCY=
X-Gm-Gg: ASbGnctyGJ6WTGJSxUCQLTqVLhLZusnnfOwkn78tbWZP2gIR78JWI/Buqq2ivdk4jYz
 gAKBPzs2o2gwrcrB9Z9V/FuOEWSiogD0iRX6RdvRM1+BRv1q7uz3UHqERpxgsEVXzBmfC9ilLBV
 4QAwn4l6+BSLZhV+a35EHVTKoFM15YxVCbWbkg9GFp/V0wkgUU+ll2o47T14A0hzrHO62KgP0SU
 gHb1Jq5pAj+6VKb6Eze/UK/YXl3zYOWe98V7PfVq3bUfvC0f8r8ocSlgjTzmCShG4M6btrY8DmO
 NUNOkS9xxwHkbM59OMkSz/PUdON0C+ild7aHcCcY52e50YablfuqQ3YT/Exg7TvsA45D7DF6nNJ
 i13s3YAQQ3bqIpF1W6/fX0iI6JzubnBpBd3n9neiOdplphM9Gn5MU
X-Received: by 2002:a05:6214:628:b0:70d:47a7:72cf with SMTP id
 6a1803df08f44-70d97124af1mr30644836d6.24.1755862946594; 
 Fri, 22 Aug 2025 04:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDtB7Zynj/rf/xXI0GvnluKkqYde7D50ORiC0miS2xPMWbtzXkTpNJzvnsT5Gfpb6b73VP8g==
X-Received: by 2002:a05:6214:628:b0:70d:47a7:72cf with SMTP id
 6a1803df08f44-70d97124af1mr30644576d6.24.1755862946133; 
 Fri, 22 Aug 2025 04:42:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e033fc2e8sm1537277e87.59.2025.08.22.04.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:42:25 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/6] drm/msm/adreno: Add speedbins for A663 GPU
Message-ID: <atomptaspsr7cfmqs4v3lr4lgeufbwq7jqz3lf72r2rxhv6emg@uhx443xvylz7>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a857a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=EbwLtv1J8F1BF5yYxN8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zFIO4qGqm6ayQbaCF58hno1SqgvcIv75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2dfAnlb0tWWT
 AqaGmocVcwam1xFwckT/NaZVawIchNAn/J4LbBIkJ0DqDtLTjOK0MOHbOamyTsHjoT2ODvRBJJ6
 XIgcQLzFDjWINchRGxQts9ADEyYx53Xbf1hsswQn0rKHsavY/UB6HYd/oGkDZtGNpQ9Kiygz29O
 hYYzmU9KJnHHCOUmuijESd4NJJb+0CkrLPBIJl3g5HNg/18BQIttVHWGJtidxQEKTpniCBVJmpR
 0Wuo63/tS3ZT4+ebxGnBAupl37T6TFWIw6pTE9E6b9955UW8eAGUJfXAGCGOBYWLNKP5v4GC4yR
 GSNpBYVKBXfDCHGwC525iZjFJKnnRK8NKzD6iJyiOoZsip9Klr3zcuSi2l5cuz9wqAF8LkFht1x
 6tq8N1RpV7k03HNlXY208BhoNP6njw==
X-Proofpoint-GUID: zFIO4qGqm6ayQbaCF58hno1SqgvcIv75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

On Fri, Aug 22, 2025 at 12:25:26AM +0530, Akhil P Oommen wrote:
> Add speedbin mappings for A663 GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
