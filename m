Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F5CEA6F9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500F410E933;
	Tue, 30 Dec 2025 18:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkHkLzC1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJXc8LXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4A210E933
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:32 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU8n46Y2284829
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ej/ApFqNdphEtfmeqgYyj1S3
 vcF2Qmw7AIsFCVJzhFg=; b=HkHkLzC10QI4itLspMEQZnpvg+AqSGlDJTfqv/Px
 k4J2WrllXCdoWSR57JgYLxhowAD1LMBm+arBEAa2f1bP9ROEHz+aVPx3krEa7wgy
 adU2eOHuJnuaGDUG81InInuirG63l/BZyfGSSw77o6Aq9B+jK2Q0WEtiqTmw3BEf
 f83aB8Gd1encwxOsiq2o0Fto1IVuqtC0Oddte3uU7ZHBnJE+lF7JOcfg9zV97B0i
 M3I6fOSk/XnHsMJFWXrXbvDtJh1AfaXjXzMkodehAG2TO7qCNtdf7gF9D8xFl7z4
 zmo5YmL6FaeF/RZlQzt1Ru6C2hCruXyzzmMgIUzP9o0GVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gtq9y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5dbcf848bc9so7756015137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767118291; x=1767723091;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ej/ApFqNdphEtfmeqgYyj1S3vcF2Qmw7AIsFCVJzhFg=;
 b=TJXc8LXOShfcE990TfNilp4e0IB/D+EatU6Z4vLwdW1CmSxAI78aektWzMuEfkE1T/
 hKD+YjkLaSkLW/4icONFIwK7wEU01HiM9zO3iGYXEcNBsDaAHuKbS7M4A0MHE9X+gxyM
 geskTKF+ZbSKoa1sv2IhCezm0D+vuM/LhN9FrjSR0BeAiV1SWLxWtMpW7CABR6+GBsGQ
 oxMzuCBB+VyjUlGCYGBd31b1eswPqd4ZSy0IV6y474emR6RT6jbQ0umkiQpAJvemFdNk
 WkZNcBzrEd/OMYiWbNgeFO6lmUWXvEmN8+ucyjNzK+WjmIjLmwRGvkdPr7q2LkClO6k5
 vCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767118291; x=1767723091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ej/ApFqNdphEtfmeqgYyj1S3vcF2Qmw7AIsFCVJzhFg=;
 b=XvTlaidCyQEWOuDcOgHKNv/O5b1vzDYDIl1I/RN6v7oAm2J8Lq0oseWXCNd+I6Ahmp
 TI2iY4wmTQuPuaDmehamkeeriSNzgJPf8b+aWpMkPnntwq9oDcnUEZZLiJqGCk64Wq57
 G6bLFF+xQteYiQhld9qV/0HKAwUsj5uz2a2Q/8pdHjA+/XilKZ5XK3Qjoe0tE/bAbhrI
 qqihULOojM30wd2rAEMoR0GinKEDRmvhQk5rX/X9DsfoPZoT99JXtAGxkD63BQF808nA
 LM94icjwTyuhkb6zkgTua0NQW1OT610UA+7aeqZDD6UB47eacR0ZxntjN66EbhkS/YSs
 qzsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRU2YGAHo4fY4y9SjuUdKLwLnVV82z+H4o9e0e81JeVOkgAfqqBqQogxSTnTmx74HI/yUUNgqKuLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAIDkRCFUmz2QKtmY2tgajzKrJTShe5Yduuv+OZMWikx5pYbuN
 mqd98b4rCELxGwtkqgJdrMxc01CYgIc9BVZE+tvG+RnyAyOQlv4lrH7HJeaZUONmpw+nKIGpYT/
 CXMadnXBiQXp1h3aFQ4itWPY11V7TSPu2q86gPiRu4iiG2vV6/FoiV1JgRgOSEEdWbydV96U=
X-Gm-Gg: AY/fxX6IvJTHtfusfkaqE8pB8yHTNwDVXSaxLKFweS43OpN0/2XaK84vq0bhlRqS9fp
 6Meu9YqxyPG1wOUKI0C1JOHGDTjT74Y89xLgU3B4GXZybT4G8ryq9WtfcTEvMkdN8Q4YgLRN9qG
 ROkLIRGFUXY/MGWGOoNCiSINrR+XO1SQoOc1kTo3rNSUQWBxK0XvBP4MysEPHR/SFdzwxLaj/6d
 oVfoRMqNX0M1Ad1rwOK4fWqhFp9d/x7UYmHP5divVcTYxxuZwi1jLaW78LU4AX9L2ahuyYCOZu2
 4V2ptoq8i6noNYHtHNGUrhpBbE0bbVxR20ATitOBUZhXRXx0wQ0JTE2OhoxpXqyY+koSZ6MsI1U
 zhOzdgc2a+wXDx61YvUWRI6JUecrOtS4sE7Z1PPkccVBiWGc7IA1j2ZZ7TJdxalbap+RZoJKMCK
 Tx9Y5OD13dbQV732ebdS86WiY=
X-Received: by 2002:a05:6102:26d6:b0:5df:bcf7:3d97 with SMTP id
 ada2fe7eead31-5eb1a67daeamr9566719137.12.1767118290860; 
 Tue, 30 Dec 2025 10:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvQiOanAfcwfTRv9Sgpjgsp3BBWdBuvnkFbbf/gTfSGQBT5Y1WMqoxr7PBGV1JmHipp/wckg==
X-Received: by 2002:a05:6102:26d6:b0:5df:bcf7:3d97 with SMTP id
 ada2fe7eead31-5eb1a67daeamr9566712137.12.1767118290349; 
 Tue, 30 Dec 2025 10:11:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812267a438sm96506141fa.41.2025.12.30.10.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:28 -0800 (PST)
Date: Tue, 30 Dec 2025 20:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU
 regions
Message-ID: <g4tduho4sdxmuugfwbz5ovh7yr36hfwlvuq5xzebgvesxpj2my@3vedhofnrexr>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
 <20251229-topic-6115_2290_gpu_dbgc-v1-3-4a24d196389c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-3-4a24d196389c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BXEgtbDgHbWIxKCdeXkhnHv6Q5fPt-yV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2MyBTYWx0ZWRfX3SjGgR9Nw8iJ
 WHK+Ouk4fOGr2eObZgghKkMghnBrebf5H8rqQKyaenL1E/cqgNbI/RzeKsWEcENqXs27b82PY1a
 I3AC0tRXn8sz+OQNwgtcTCSMsbmjWoO+RUwJDJPRFTOse8aGtmfaPC0EBt3ZqbDu2PAK6X6E1/S
 7ISFLaM0u1iRYchLn7Pe6UWBbr1X6g6qi8GaMyPhXlDwhomijKq9TBUgJ+O+FIpQdojeHhy/cPz
 87djiUUqXQlKUWVyUyYSVgceQtlyN2y3NZRrUVbtYEi8M+pQapRtJ72tVaoAIisfsbL53seOysr
 ZPgZa7S9cAeepiONDqo+xwanCECkecgT7ogh1Ysr+ZKw65BtGOOKdxCmPRHc1nZ7faArRw8pmUV
 yx3vgzryMQkutB//2TkrmA6Fye1lBfmcaGoOO2W3YcZY2Jt32vqwGvpmae56id3lnWOvgiWp2Jg
 Ve6gQZkOry/dpiXUOtA==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=695415d3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kF9o915wj9thlku2Yt8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: BXEgtbDgHbWIxKCdeXkhnHv6Q5fPt-yV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300163
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

On Mon, Dec 29, 2025 at 09:47:41PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the GPU register regions, with the former existing but not
> being used much if at all on this silicon, and the latter containing
> various debugging levers generally related to dumping the state of
> the IP upon a crash.
> 
> Fixes: 11750af256f8 ("arm64: dts: qcom: sm6115: Add GPU nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
